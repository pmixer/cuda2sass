#include <cuda.h>

__noinline__ __device__ float foo(float input) {
    return __sinf(input);
}