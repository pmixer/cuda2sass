#include <cuda.h>

__noinline__ __device__ float foo(int i)
{
    return (float)i;
}