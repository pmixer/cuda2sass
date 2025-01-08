#include <cuda.h>

__noinline__ __device__ int foo(int16_t i)
{
    return i & 0x08;
}