#include <cuda.h>

__noinline__ __device__ float foo(double d)
{
    return __double2float_rd(d);
}