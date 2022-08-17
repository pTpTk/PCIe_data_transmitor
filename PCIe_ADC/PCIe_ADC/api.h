#ifndef API_H
#define API_H

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

#include <Windows.h>
#include <SetupAPI.h>
#include <INITGUID.H>

constexpr auto BLOCK_SIZE = 1 << 20;
constexpr int BLOCK_PAGE_COUNT = 8;

extern HANDLE user, c2h0, count, setup;
extern std::array<char, 1 << 28 > buffer;
extern std::array<char, 1 << 28 > buffer2;
extern bool finish;
extern size_t length;
extern std::list<uint32_t> shared_buffer;

class incoming_data;

std::vector<std::string> get_device_paths(GUID guid);
void initialize(std::string& device_base_path, int vsync = 50, int hsync = 6000);
void start();
void timed_transmission();
void end();
void halt();
void reset();
uint32_t read_counter();
void read();
void read_to_file();
uint32_t check(uint32_t ref, incoming_data* buf);

class incoming_data {
public:
	int data[4];
	bool check(uint32_t);
};
#endif