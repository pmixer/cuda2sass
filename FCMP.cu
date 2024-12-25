#include <cuda.h>

__noinline__ __device__ bool foo(float a)
{
    bool res = a > 0;
    return res;
}