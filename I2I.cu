#include <cuda.h>

// https://forums.developer.nvidia.com/t/how-to-understand-the-following-asm/288932
__noinline__ __device__ short2 foo(int a, int b)
{
    short2 res;
    res.x  = a;
    res.y  = b;
    return res;
}