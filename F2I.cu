#include <cuda.h>

__noinline__ __device__ int foo(float f)
{
    return (int)f;
}