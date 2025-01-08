# https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html
# https://docs.nvidia.com/cuda/cuda-c-best-practices-guide/index.html
# https://docs.nvidia.com/cuda/parallel-thread-execution/index.html
# https://docs.nvidia.com/cuda/cuda-binary-utilities/index.html

all: FADD FCHK FCMP NOP RET BRA MUFU FFMA FMNMX SEL FSEL RRO DADD \
	 F2I I2F F2F SHR I2I S2R BFE LOP32I XMAD MOV

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

RRO: RRO.cubin RRO.ptx RRO.sass

RRO.cubin:
	nvcc -dc -fatbin $M $P -o RRO.cubin RRO.cu

RRO.ptx: RRO.cubin
	cuobjdump -ptx RRO.cubin > RRO.ptx

RRO.sass: RRO.cubin
	cuobjdump -sass RRO.cubin > RRO.sass

DADD: DADD.cubin DADD.ptx DADD.sass

DADD.cubin:
	nvcc -dc -fatbin $M $P $V $T $A $H -o DADD.cubin DADD.cu

DADD.ptx: DADD.cubin
	cuobjdump -ptx DADD.cubin > DADD.ptx

DADD.sass: DADD.cubin
	cuobjdump -sass DADD.cubin > DADD.sass

F2I: F2I.cubin F2I.ptx F2I.sass

F2I.cubin:
	nvcc -dc -fatbin $M $P -o F2I.cubin F2I.cu

F2I.ptx: F2I.cubin
	cuobjdump -ptx F2I.cubin > F2I.ptx

F2I.sass: F2I.cubin
	cuobjdump -sass F2I.cubin > F2I.sass

I2F: I2F.cubin I2F.ptx I2F.sass

I2F.cubin:
	nvcc -dc -fatbin $M $P -o I2F.cubin I2F.cu

I2F.ptx: I2F.cubin
	cuobjdump -ptx I2F.cubin > I2F.ptx

I2F.sass: I2F.cubin
	cuobjdump -sass I2F.cubin > I2F.sass

F2F: F2F.cubin F2F.ptx F2F.sass

F2F.cubin:
	nvcc -dc -fatbin $M $P -o F2F.cubin F2F.cu

F2F.ptx: F2F.cubin
	cuobjdump -ptx F2F.cubin > F2F.ptx

F2F.sass: F2F.cubin
	cuobjdump -sass F2F.cubin > F2F.sass

SHR: SHR.cubin SHR.ptx SHR.sass

SHR.cubin:
	nvcc -dc -fatbin $M $P -o SHR.cubin SHR.cu

SHR.ptx: SHR.cubin
	cuobjdump -ptx SHR.cubin > SHR.ptx

SHR.sass: SHR.cubin
	cuobjdump -sass SHR.cubin > SHR.sass

I2I: I2I.cubin I2I.ptx I2I.sass

I2I.cubin:
	nvcc -dc -fatbin $M $P -o I2I.cubin I2I.cu

I2I.ptx: I2I.cubin
	cuobjdump -ptx I2I.cubin > I2I.ptx

I2I.sass: I2I.cubin
	cuobjdump -sass I2I.cubin > I2I.sass

S2R: S2R.cubin S2R.ptx S2R.sass

S2R.cubin:
	nvcc -dc -fatbin $M $P -o S2R.cubin S2R.cu

S2R.ptx: S2R.cubin
	cuobjdump -ptx S2R.cubin > S2R.ptx

S2R.sass: S2R.cubin
	cuobjdump -sass S2R.cubin > S2R.sass

BFE: BFE.cubin BFE.ptx BFE.sass

BFE.cubin:
	nvcc -dc -fatbin $M $P -o BFE.cubin BFE.cu

BFE.ptx: BFE.cubin
	cuobjdump -ptx BFE.cubin > BFE.ptx

BFE.sass: BFE.cubin
	cuobjdump -sass BFE.cubin > BFE.sass

LOP32I: LOP32I.cubin LOP32I.ptx LOP32I.sass

LOP32I.cubin:
	nvcc -dc -fatbin $M $P -o LOP32I.cubin LOP32I.cu

LOP32I.ptx: LOP32I.cubin
	cuobjdump -ptx LOP32I.cubin > LOP32I.ptx

LOP32I.sass: LOP32I.cubin
	cuobjdump -sass LOP32I.cubin > LOP32I.sass

XMAD: XMAD.cubin XMAD.ptx XMAD.sass

XMAD.cubin:
	nvcc -dc -fatbin $M $P -o XMAD.cubin XMAD.cu

XMAD.ptx: XMAD.cubin
	cuobjdump -ptx XMAD.cubin > XMAD.ptx

XMAD.sass: XMAD.cubin
	cuobjdump -sass XMAD.cubin > XMAD.sass

MOV: MOV.cubin MOV.ptx MOV.sass

MOV.cubin:
	nvcc -dc -fatbin $M $P -o MOV.cubin MOV.cu

MOV.ptx: MOV.cubin
	cuobjdump -ptx MOV.cubin > MOV.ptx

MOV.sass: MOV.cubin
	cuobjdump -sass MOV.cubin > MOV.sass

clean:
	rm -rf *.cubin *.ptx *.sass