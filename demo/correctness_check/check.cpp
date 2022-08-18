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

#pragma comment(lib, "setupapi.lib")

uint64_t changeEndianness32(char* val)
{
    return (val[0] | val[1] << 8 | val[2] << 16 | val[3] << 24) & 0x00000000FFFFFFFF;
}

int __cdecl main() {

    std::ifstream ifs;
    ifs.open("C:\\Users\\Petzval-PC\\Desktop\\output.bin", std::ios::binary | std::ios::in);
    uint64_t a, ref;
    char ch;
    char c[5];
    uint32_t b;
    int i = 0;

    assert(ifs.is_open());

    a = 0;
    //ifs.get(c, 5);
    ifs.read((char*)&b, 4);
    //a = changeEndianness32(c);
    printf("b: %x \n", b);
    //printf("a = %x\n", a);
    ref = b + 1;
    int errors = 0; 

    //while (!ifs.eof()) {
    while(true){
        i++;

        //ifs.get(c, 5);
        // 
        //a = changeEndianness32(c);
        

        //TODO:  optimize by reading larger blocks
        ifs.read((char*)&b, 4);
       /* if (i == 1)
        {
            printf("a: %x c:%x\n", a, c);

        }*/
        //check for EOF
        if (ifs.eofbit)
            break;

        if (b == ref) {
            ref++;
            ref &= 0xFFFFFFFF;
            //std::cout << '.';
            //continue;
        }
        else
        {
            printf("[%d] b: %x was not equal to ref: %x (off by: %d) !!!\n",i, b, ref, ref-b);
            errors++;
        }
        
        //std::cerr << "something went wrong, a = " << std::hex << a << " ref = " << std::hex << ref-1 << " i = " << i << std::endl;
        //ref = a + 1;
    }
    printf("Compared %d entries and found %d errors\n", i, errors);
    return 0;
}
