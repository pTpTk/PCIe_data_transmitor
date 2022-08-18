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

#define NOMINMAX
#include <Windows.h>
#include <SetupAPI.h>
#include <INITGUID.H>

#include "xdma_public.h"

#pragma comment(lib, "setupapi.lib")

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
alignas(32) std::array<char, 1 << 28 > buffer = { {0} };
std::list<char> shared_buffer;
bool finish(false);
size_t length = 0;
std::thread t1, t2;
std::mutex mu;

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

void get_size() {
    size_t size(0);
    LARGE_INTEGER move;
    move.QuadPart = 1 << 10;
    while (ReadFile(c2h0, buffer.data(), 1, NULL, NULL)) {
        if (INVALID_SET_FILE_POINTER == SetFilePointerEx(c2h0, move, NULL, 1)) {
            fprintf(stderr, "Error setting file pointer, win32 error code: %ld\n", GetLastError());
            break;
        }
        size++;
    }

    printf("The cache size if %zu\n", size);
}

uint32_t read_counter() {
    int countVal;
    if (!ReadFile(count, &countVal, 4, NULL, NULL)) {
        fprintf(stderr, "Error reading counter register, win32 error code: %ld\n", GetLastError());
    }
    return countVal;
}

void read() {
    LARGE_INTEGER addr;
    int64_t head, tail;
    int64_t diff;
    head = 0; tail = 0;
    void* buffer_head;
    addr.QuadPart = 1 << 23;

    while (t2.joinable()) {
        head = read_counter() & 0xF000;
        diff = head - tail;
        if (diff < 0) {
            diff += 0xF000;
        }
        if (diff > 0) {
            // Can only handle reads of 1<<23 byts at once. And diff counts the number of 1<<24 byte blocks.
            buffer_head = buffer.data();
            for(size_t i = 0; i < diff*2; ++i){
                if (!ReadFile(c2h0, (buffer.data()+(i<<23)), (DWORD)1<<23, NULL, NULL)) {
                    fprintf(stderr, "Failed to read from stream! %d\n", GetLastError());
                    goto err;
                }
                if (INVALID_SET_FILE_POINTER == SetFilePointerEx(c2h0, addr, NULL, 1)) {
                    fprintf(stderr, "error setting file pointer, win32 error code: %ld\n", GetLastError());
                    goto err;
                }
                std::cout << "\\";
            }
            
            
            mu.lock();
            length += diff << 12;
            shared_buffer.insert(shared_buffer.end(), buffer.begin(), buffer.begin()+(diff<<12));
            mu.unlock();
            tail = head;
        }
        Sleep(1);
    }

err:
    return;
}

void check() {
    char a;
    size_t tail(0);
    auto iter = shared_buffer.begin();

    while (shared_buffer.empty()) {
        Sleep(50);
    }
    a = shared_buffer.front() - 1;

    while (true) {
        if (!shared_buffer.empty()) {
            tail = length;
            iter = shared_buffer.begin();
            for (int i = 0; i < tail; i++) {
                if (i % 16 == 0) {
                    a++;
                }
                if (*(iter++) != a) {
                    fprintf(stderr, "something went wrong during transmission\n");
                    goto err;
                }
            }
            mu.lock();
            shared_buffer.erase(shared_buffer.begin(), iter);
            length -= tail;
            mu.unlock();
        }
        std::cout << '.';
        Sleep(50);
    }
err:
    finish = true;
    return;
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
    start();
    
    t2 = std::thread(check);
    t1 = std::thread(read);

    t2.join();
    end();
    
    CloseHandle(user);
    CloseHandle(count);
    CloseHandle(c2h0);
    return 0;
}
