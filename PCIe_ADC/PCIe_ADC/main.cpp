#define NOMINMAX
#include <Windows.h>
#include <SetupAPI.h>
#include <INITGUID.H>

#pragma comment(lib, "setupapi.lib")

#include "api.h"
#include "xdma_public.h"

int __cdecl main() {

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
    Sleep(5);
    start();
    Sleep(5);
    end();
    Sleep(50);

    // output to file
    /*std::thread t1 = std::thread(timed_transmission);
    read_to_file();
    t1.join();*/


    // runtime check
    start();
    Sleep(1000);
    //read();

    end();
    printf("%zu ints were transmitted.\n", length);

    CloseHandle(user);
    CloseHandle(count);
    CloseHandle(c2h0);

    //check();
    return 0;
}
