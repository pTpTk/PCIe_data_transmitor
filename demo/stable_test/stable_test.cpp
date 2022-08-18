#include <cassert>
#include <array>
#include <algorithm>
#include <iostream>
#include <iomanip>
#include <numeric>
#include <string>
#include <system_error>
#include <thread>
#include <vector>
#include <fstream>
#include <thread>
#include <list>
#include <mutex>
#include <intrin.h>

#define NOMINMAX
#include <Windows.h>
#include <SetupAPI.h>
#include <INITGUID.H>

#include "xdma_public.h"

#pragma comment(lib, "setupapi.lib")

constexpr auto BLOCK_SIZE = 1 << 20;
constexpr int BLOCK_PAGE_COUNT = 8;     // page count = log2(block size) - 12
uint32_t check2(uint32_t ref, uint32_t* buf);
uint32_t check3(uint32_t ref, uint32_t* buf);

#define MEMORY_SIZE (0x0FFFFFFF)        //for 256 MB

// ============= Static Utility Functions =====================================

static std::vector<std::string> get_device_paths(GUID guid) {

    auto device_info = SetupDiGetClassDevs((LPGUID)&guid, NULL, NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);
    if (device_info == INVALID_HANDLE_VALUE) {
        throw std::runtime_error("GetDevices INVALID_HANDLE_VALUE");
    }

    SP_DEVICE_INTERFACE_DATA device_interface = { 0 };
    device_interface.cbSize = sizeof(SP_DEVICE_INTERFACE_DATA);

    // enumerate through devices

    std::vector<std::string> device_paths;

    for (unsigned index = 0;
        SetupDiEnumDeviceInterfaces(device_info, NULL, &guid, index, &device_interface);
        ++index) {

        // get required buffer size
        unsigned long detailLength = 0;
        if (!SetupDiGetDeviceInterfaceDetail(device_info, &device_interface, NULL, 0, &detailLength, NULL) && GetLastError() != ERROR_INSUFFICIENT_BUFFER) {
            throw std::runtime_error("SetupDiGetDeviceInterfaceDetail - get length failed");
        }

        // allocate space for device interface detail
        auto dev_detail = reinterpret_cast<PSP_DEVICE_INTERFACE_DETAIL_DATA>(new char[detailLength]);
        dev_detail->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

        // get device interface detail
        if (!SetupDiGetDeviceInterfaceDetail(device_info, &device_interface, dev_detail, detailLength, NULL, NULL)) {
            delete[] dev_detail;
            throw std::runtime_error("SetupDiGetDeviceInterfaceDetail - get detail failed");
        }
        device_paths.emplace_back(dev_detail->DevicePath);
        delete[] dev_detail;
    }

    SetupDiDestroyDeviceInfoList(device_info);

    return device_paths;
}

HANDLE user, c2h0, count;
std::array<char, 1 << 28 > buffer = { {0} };
std::array<char, 1 << 28 > buffer2 = { {0} };
bool finish(false);
size_t length = 0;
std::mutex mu;
std::list<uint32_t> shared_buffer;
std::thread t1;

void initialize(std::string& device_base_path) {
    std::string device_user_path = device_base_path + std::string("\\user");
    std::string device_c2h0_path = device_base_path + std::string("\\c2h_0");

    user = CreateFile((LPCSTR)device_user_path.c_str(),
        GENERIC_READ | GENERIC_WRITE,
        0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (user == INVALID_HANDLE_VALUE) {
        fprintf(stderr, "Error opening user, win32 error code: %ld\n",
            GetLastError());
    }

    count = CreateFile((LPCSTR)device_user_path.c_str(),
        GENERIC_READ | GENERIC_WRITE,
        0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (count == INVALID_HANDLE_VALUE) {
        fprintf(stderr, "Error opening user, win32 error code: %ld\n",
            GetLastError());
    }
    LARGE_INTEGER offset;
    offset.QuadPart = 0x8;
    if (INVALID_SET_FILE_POINTER == SetFilePointerEx(count, offset, NULL, FILE_BEGIN)) {
        fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
    }

    c2h0 = CreateFile((LPCSTR)device_c2h0_path.c_str(),
        GENERIC_READ | GENERIC_WRITE, 0,
        NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (c2h0 == INVALID_HANDLE_VALUE) {
        fprintf(stderr, "Error opening c2h0, win32 error code: %ld\n",
            GetLastError());
    }
}

void start() {
    int start_sig = 0x3;
    DWORD len;
    if (!WriteFile(user, &start_sig, 4, &len, NULL)) {
        fprintf(stderr, "WriteFile to user failed. error code: %d\n", GetLastError());
    }
    if (len != 4) {
        fprintf(stderr, "WriteFile to user error, len = %d\n", len);
    }
}

void end() {
    int sig = 0x2;
    if (!WriteFile(user, &sig, 4, NULL, NULL)) {
        fprintf(stderr, "WriteFile to user failed. error code: %d\n", GetLastError());
    }

    Sleep(50);

    sig = 0x0;
    if (!WriteFile(user, &sig, 4, NULL, NULL)) {
        fprintf(stderr, "WriteFile to user failed. error code: %d\n", GetLastError());
    }

    Sleep(50);

}

void halt() {
    int sig = 0x2;
    if (!WriteFile(user, &sig, 4, NULL, NULL)) {
        fprintf(stderr, "WriteFile to user failed. error code: %d\n", GetLastError());
    }
}

void reset() {
    int sig = 0x0;
    if (!WriteFile(user, &sig, 4, NULL, NULL)) {
        fprintf(stderr, "WriteFile to user failed. error code: %d\n", GetLastError());
    }
}

void get_size() {
    size_t size(0);
    LARGE_INTEGER move;
    move.QuadPart = 1 << 20;
    while (ReadFile(c2h0, buffer.data(), 1<<20, NULL, NULL)) {
        if (INVALID_SET_FILE_POINTER == SetFilePointerEx(c2h0, move, NULL, 1)) {
            fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
            break;
        }
        size++;
    }

    printf("The cache size is %zu\n", size);
}

uint32_t read_counter() {
    int countVal;
    if (!ReadFile(count, &countVal, 4, NULL, NULL)) {
        fprintf(stderr, "Error reading counter register, win32 error code: %ld\n", GetLastError());
    }
    return countVal;
}

void read() {
    std::ofstream ofs;
    ofs.open("output.txt", std::ios::binary | std::ios::out);

    LARGE_INTEGER addr;
    uint64_t head, tail;
    int64_t diff, counter_val;
    int wrap_counter = 0;
    int break_counter = 0;
    head = 0; tail = 0;
    addr.QuadPart = 0;

    LARGE_INTEGER start;
    LARGE_INTEGER stop;
    LARGE_INTEGER freq;
    double time_sec;
    QueryPerformanceFrequency(&freq);
    uint32_t ref = 0xFFFFFC00;

    while (break_counter < 1000) {
        counter_val = read_counter();
        head = counter_val & 0xFFFFFFFFFFFFFF00;
        diff = head - tail;
        if (diff < 0) {
            diff += 0x10000;
        }
        if (diff > 0) {
            break_counter = 0;
            QueryPerformanceCounter(&start);
            diff = diff >> BLOCK_PAGE_COUNT;
            printf("diff = %d, counter_val = %d\n", diff, counter_val);
            
            for (int i = 0; i < diff; i++) {
                
                if (!ReadFile(c2h0, buffer.data(), (DWORD)BLOCK_SIZE, NULL, NULL)) {
                    fprintf(stderr, "Failed to read from stream! %d\n", GetLastError());
                    goto err;
                }
                //check data
                ref = check2(ref, (uint32_t *)buffer.data());

                //ofs.write(buffer.data(), BLOCK_SIZE);

                //adfvancing the position in the buffer

                addr.QuadPart = (addr.QuadPart + BLOCK_SIZE) & MEMORY_SIZE;  //enforce wrap around at 256 MB, change if memory size different
                if (INVALID_SET_FILE_POINTER == SetFilePointerEx(c2h0, addr, NULL, 0)) {
                    fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
                    goto err;
                }

                length += diff;
                /*ptr = (ptr + 1 << 20) & 0xFFFF*/

                /*mu.lock();
                shared_buffer.insert(shared_buffer.end(), buffer.begin(), buffer.begin() + (1<<20));
                length += 1 << 20;
                mu.unlock();*/
                /*ofs.write(buffer.data(), 1<<22);
                ofs2.write(buffer2.data(), 1<<22);*/
            }
            tail = head;
            QueryPerformanceCounter(&stop);
            time_sec = (unsigned long long)(stop.QuadPart - start.QuadPart) / (double)freq.QuadPart;
            //printf("Read %d MB data in %lf seconds\n", (diff * BLOCK_SIZE) >> 20, time_sec);
        }
        else {
            Sleep(1);
            break_counter++;
        }
    }
err:
    ofs.close();
    return;
}

void read_stress() {
    LARGE_INTEGER addr;
    uint64_t head, tail;
    int64_t diff, counter_val;
    int wrap_counter = 0;
    int break_counter = 0;
    head = 0; tail = 0;
    addr.QuadPart = 0;

    LARGE_INTEGER start;
    LARGE_INTEGER stop;
    LARGE_INTEGER freq;
    double time_sec;
    QueryPerformanceFrequency(&freq);
    uint32_t ref;

    while (read_counter() == 0) {}
    if (!ReadFile(c2h0, &ref, (DWORD)4, NULL, NULL)) {
        fprintf(stderr, "Failed to read from stream! %d\n", GetLastError());
        goto err;
    }

    while (break_counter < 1000) {
        counter_val = read_counter();
        head = counter_val & 0xFFFFFFFFFFFFFF00;
        diff = head - tail;
        if (diff < 0) {
            diff += 0x10000;
        }
        if (diff > 0) {
            break_counter = 0;
            QueryPerformanceCounter(&start);
            diff = diff >> BLOCK_PAGE_COUNT;    //convert from 4KB pages to MB
            //printf("diff = %d, counter_val = %d\n", diff, counter_val);

            for (int i = 0; i < diff; i++) {

                if (!ReadFile(c2h0, buffer.data(), (DWORD)BLOCK_SIZE, NULL, NULL)) {
                    fprintf(stderr, "Failed to read from stream! %d\n", GetLastError());
                    goto err;
                }
                //check data
                ref = check3(ref, (uint32_t*)buffer.data());

                //ofs.write(buffer.data(), BLOCK_SIZE);

                addr.QuadPart = (addr.QuadPart + BLOCK_SIZE) & MEMORY_SIZE;
                if (INVALID_SET_FILE_POINTER == SetFilePointerEx(c2h0, addr, NULL, 0)) {
                    fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
                    goto err;
                }

                length += 1;
                /*ptr = (ptr + 1 << 20) & 0xFFFF*/

                /*mu.lock();
                shared_buffer.insert(shared_buffer.end(), buffer.begin(), buffer.begin() + (1<<20));
                length += 1 << 20;
                mu.unlock();*/
                /*ofs.write(buffer.data(), 1<<22);
                ofs2.write(buffer2.data(), 1<<22);*/
            }
            tail = head;
            QueryPerformanceCounter(&stop);
            time_sec = (unsigned long long)(stop.QuadPart - start.QuadPart) / (double)freq.QuadPart;
            printf("Read %d MB so far\n", length);
            //printf("Read %d MB data in %lf seconds\n", (diff * BLOCK_SIZE) >> 20, time_sec);
        }
        else {
            Sleep(1);
            break_counter++;
        }
    }
err:
    return;
}

uint32_t check2(uint32_t ref, uint32_t *buf) {

    printf("starting check ref %x, buf0 %x buf[end-1] %x\n", ref, buf[0], buf[BLOCK_SIZE/4-1]);
    int errors = 0;
    for (int i = 0; i < BLOCK_SIZE / 4; i++)
    {
        if (buf[i] != ref)
        {
            //error
            //errors++;
            fprintf(stderr, "error during transmission, buf[i] = %x, ref = %x\n", buf[i], ref);
            fprintf(stderr, "transmitted %zu MBs without err\n", length);
            assert(false);
        }
        ref++;
    }
    printf("Found %d errors in %d words\n", errors, BLOCK_SIZE / 4);
    return ref;
}

uint32_t check3(uint32_t ref, uint32_t* buf) {

    //printf("starting check ref %x, buf0 %x buf[end-1] %x\n", ref, buf[0], buf[BLOCK_SIZE / 4 - 1]);
    int errors = 0;
    for (int i = 0; i < BLOCK_SIZE / 4; i+=4)
    {
        if (buf[i] != ref || buf[i+1] != ref || buf[i+2] != ref || buf[i+3] != ref)
        {
            //error
            //errors++;
            fprintf(stderr, "error during transmission, buf[i] = %x, "
                            "buf[i + 1] = % x, buf[i + 1] = % x, "
                            "buf[i + 1] = % x, ref = % x\n", buf[i], buf[i+1], buf[i+2], buf[i+3], ref);
            fprintf(stderr, "transmitted %zu MBs without err\n", length);
            assert(false);
        }
        ref++;
    }
    //printf("Found %d errors in %d words\n", errors, BLOCK_SIZE / 4);
    return ref;
}

void read_to_file() {
    std::ofstream ofs;
    ofs.open("output.txt", std::ios::binary | std::ios::out);

    LARGE_INTEGER addr;
    uint64_t head, tail;
    int64_t diff, counter_val;
    int wrap_counter = 0;
    int break_counter = 0;
    head = 0; tail = 0;
    addr.QuadPart = 0;

    LARGE_INTEGER start;
    LARGE_INTEGER stop;
    LARGE_INTEGER freq;
    double time_sec;
    QueryPerformanceFrequency(&freq);
    uint32_t ref = 0xFFFFFC00;
    tail = read_counter() & 0xFFFFFFFFFFFFFF00;

    while (break_counter < 100) {
        counter_val = read_counter();
        head = counter_val & 0xFFFFFFFFFFFFFF00;
        diff = head - tail;
        if (diff < 0) {
            diff += 0x10000;
        }
        if (diff > 0) {
            break_counter = 0;
            QueryPerformanceCounter(&start);
            diff = diff >> BLOCK_PAGE_COUNT;
            printf("diff = %d, counter_val = %d\n", diff, counter_val);

            for (int i = 0; i < diff; i++) {

                if (!ReadFile(c2h0, buffer.data(), (DWORD)BLOCK_SIZE, NULL, NULL)) {
                    fprintf(stderr, "Failed to read from stream! %d\n", GetLastError());
                    goto err;
                }

                ofs.write(buffer.data(), BLOCK_SIZE);

                addr.QuadPart = (addr.QuadPart + BLOCK_SIZE) & MEMORY_SIZE;
                if (INVALID_SET_FILE_POINTER == SetFilePointerEx(c2h0, addr, NULL, 0)) {
                    fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
                    goto err;
                }

                length += diff;
            }
            tail = head;
            QueryPerformanceCounter(&stop);
            time_sec = (unsigned long long)(stop.QuadPart - start.QuadPart) / (double)freq.QuadPart;
            //printf("Read %d MB data in %lf seconds\n", (diff * BLOCK_SIZE) >> 20, time_sec);
        }
        else {
            Sleep(1);
            break_counter++;
        }
    }
err:
    ofs.close();
    return;
}

void read_tmp() {
    std::ofstream ofs;
    ofs.open("output.txt", std::ios::binary | std::ios::out);

    LARGE_INTEGER addr;
    addr.QuadPart = 0;
    for (int i = 0; i < 10; i++) {

        if (!ReadFile(c2h0, buffer.data(), (DWORD)BLOCK_SIZE, NULL, NULL)) {
            fprintf(stderr, "Failed to read from stream! %d\n", GetLastError());
            goto err;
        }

        ofs.write(buffer.data(), BLOCK_SIZE);

        addr.QuadPart = (addr.QuadPart + BLOCK_SIZE) & 0x07FFFFFF;
        if (INVALID_SET_FILE_POINTER == SetFilePointerEx(c2h0, addr, NULL, 0)) {
            fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
            goto err;
        }
    }

err:
    ofs.close();
    return;
}

void timed_transmission() {
    start();
    Sleep(2000);
    halt();
}

int __cdecl main() {

    LARGE_INTEGER a, b;

    const auto device_paths = get_device_paths(GUID_DEVINTERFACE_XDMA);
    if (device_paths.empty()) {
        fprintf(stderr, "failed to find XDMA device\n");
    }

    if (device_paths.size() > 1) {
        fprintf(stderr, "there should only be one XDMA device, "
            "not sure what's going on.\n");
    }

    std::string device_base_path = device_paths.front();

    initialize(device_base_path);
    end();
    Sleep(50);

    // output to file
    t1 = std::thread(timed_transmission);
    read_to_file();
    t1.join();
     
    
    // runtime check
    /*start();
    read_stress();*/

    end();
    printf("%zu ints were transmitted.\n", length);

    CloseHandle(user);
    CloseHandle(count);
    CloseHandle(c2h0);

    //check();
    return 0;
}
