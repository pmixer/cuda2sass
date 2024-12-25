#include <cuda.h>

__noinline__ __device__ float foo(float a, float b, float c)
{
    float res = a * b + c;
    return res;
}