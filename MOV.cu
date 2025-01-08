#include <cuda.h>

__noinline__ __device__ unsigned foo()
{
    unsigned n_blocks = gridDim.x;
    return n_blocks;
}