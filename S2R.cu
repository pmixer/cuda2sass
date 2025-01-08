#include <cuda.h>

__noinline__ __device__ int foo()
{
    int res = threadIdx.x;
    return res;
}