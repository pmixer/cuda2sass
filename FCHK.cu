#include <cuda.h>

__noinline__ __device__ float foo(float a, float b)
{
    float res = a / b;
    return res;
}