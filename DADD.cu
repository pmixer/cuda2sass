#include <cuda.h>

__noinline__ __device__ double foo(double a, double b)
{
    double res = a + b;
    return res;
}