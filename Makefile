# https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html
# https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/index.html
# https://docs.nvidia.com/cuda/parallel-thread-execution/index.html
# https://docs.nvidia.com/cuda/cuda-binary-utilities/index.html

all: FADD FCHK FCMP NOP RET BRA MUFU FFMA FMNMX SEL FSEL

# https://kaixih.github.io/nvcc-options/
M = -gencode=arch=compute_50,code=sm_50 \
    -gencode=arch=compute_50,code=compute_50

P = -gencode=arch=compute_60,code=sm_60 \
    -gencode=arch=compute_60,code=compute_60

V = -gencode=arch=compute_70,code=sm_70 \
    -gencode=arch=compute_70,code=compute_70

T = -gencode=arch=compute_75,code=sm_75 \
    -gencode=arch=compute_75,code=compute_75

A = -gencode=arch=compute_80,code=sm_80 \
    -gencode=arch=compute_80,code=compute_80

H = -gencode=arch=compute_90,code=sm_90 \
    -gencode=arch=compute_90,code=compute_90\
	-gencode=arch=compute_90a,code=sm_90a \
    -gencode=arch=compute_90a,code=compute_90a

FADD: FADD.cubin FADD.ptx FADD.sass

FADD.cubin:
	nvcc -dc -fatbin $M $P $V $T $A $H -o FADD.cubin FADD.cu

FADD.ptx: FADD.cubin
	cuobjdump -ptx FADD.cubin > FADD.ptx

FADD.sass: FADD.cubin
	cuobjdump -sass FADD.cubin > FADD.sass

FCHK: FCHK.cubin FCHK.ptx FCHK.sass

FCHK.cubin:
	nvcc -dc -fatbin $M $P $V $T $A $H -o FCHK.cubin FCHK.cu

FCHK.ptx: FCHK.cubin
	cuobjdump -ptx FCHK.cubin > FCHK.ptx

FCHK.sass: FCHK.cubin
	cuobjdump -sass FCHK.cubin > FCHK.sass

FCMP: FCMP.cubin FCMP.ptx FCMP.sass

FCMP.cubin:
	nvcc -dc -fatbin $M $P -o FCMP.cubin FCMP.cu

FCMP.ptx: FCMP.cubin
	cuobjdump -ptx FCMP.cubin > FCMP.ptx

FCMP.sass: FCMP.cubin
	cuobjdump -sass FCMP.cubin > FCMP.sass

NOP: NOP.cubin NOP.ptx NOP.sass

NOP.cubin:
	nvcc -dc -fatbin $M $P $V $T $A $H -o NOP.cubin NOP.cu

NOP.ptx: NOP.cubin
	cuobjdump -ptx NOP.cubin > NOP.ptx

NOP.sass: NOP.cubin
	cuobjdump -sass NOP.cubin > NOP.sass

RET: RET.cubin RET.ptx RET.sass

RET.cubin:
	nvcc -dc -fatbin $M $P $V $T $A $H -o RET.cubin RET.cu

RET.ptx: RET.cubin
	cuobjdump -ptx RET.cubin > RET.ptx

RET.sass: RET.cubin
	cuobjdump -sass RET.cubin > RET.sass

BRA: BRA.cubin BRA.ptx BRA.sass

BRA.cubin:
	nvcc -dc -fatbin $M $P $V $T $A $H -o BRA.cubin BRA.cu

BRA.ptx: BRA.cubin
	cuobjdump -ptx BRA.cubin > BRA.ptx

BRA.sass: BRA.cubin
	cuobjdump -sass BRA.cubin > BRA.sass

MUFU: MUFU.cubin MUFU.ptx MUFU.sass

MUFU.cubin:
	nvcc -dc -fatbin --use_fast_math $M $P $V $T $A $H -o MUFU.cubin MUFU.cu

MUFU.ptx: MUFU.cubin
	cuobjdump -ptx MUFU.cubin > MUFU.ptx

MUFU.sass: MUFU.cubin
	cuobjdump -sass MUFU.cubin > MUFU.sass

FFMA: FFMA.cubin FFMA.ptx FFMA.sass

FFMA.cubin:
	nvcc -dc -fatbin $M $P $V $T $A $H -o FFMA.cubin FFMA.cu

FFMA.ptx: FFMA.cubin
	cuobjdump -ptx FFMA.cubin > FFMA.ptx

FFMA.sass: FFMA.cubin
	cuobjdump -sass FFMA.cubin > FFMA.sass

FMNMX: FMNMX.cubin FMNMX.ptx FMNMX.sass

FMNMX.cubin:
	nvcc -dc -fatbin $M $P $V $T $A $H -o FMNMX.cubin FMNMX.cu

FMNMX.ptx: FMNMX.cubin
	cuobjdump -ptx FMNMX.cubin > FMNMX.ptx

FMNMX.sass: FMNMX.cubin
	cuobjdump -sass FMNMX.cubin > FMNMX.sass

SEL: SEL.cubin SEL.ptx SEL.sass

SEL.cubin:
	nvcc -dc -fatbin $M $P -o SEL.cubin SEL.cu

SEL.ptx: SEL.cubin
	cuobjdump -ptx SEL.cubin > SEL.ptx

SEL.sass: SEL.cubin
	cuobjdump -sass SEL.cubin > SEL.sass

FSEL: FSEL.cubin FSEL.ptx FSEL.sass

FSEL.cubin:
	nvcc -dc -fatbin $V $T $A $H -o FSEL.cubin FSEL.cu

FSEL.ptx: FSEL.cubin
	cuobjdump -ptx FSEL.cubin > FSEL.ptx

FSEL.sass: FSEL.cubin
	cuobjdump -sass FSEL.cubin > FSEL.sass

clean:
	rm -rf *.cubin *.ptx *.sass