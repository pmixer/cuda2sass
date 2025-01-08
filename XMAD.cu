#include <cuda.h>

__noinline__ __device__ unsigned foo()
{
    unsigned int tid = (blockIdx.x * blockDim.x) + threadIdx.x;
    return tid;
}