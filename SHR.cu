#include <cuda.h>

__noinline__ __device__ long long foo(int i)
{
    return i;
}