include macros2.asm
include number.asm
.MODEL LARGE
.386
.STACK 200h

.DATA
contador	dd	?
promedio	dd	?
actual	dd	?
suma	dd	?
_2.000000	dd	2.000000
_2.000000	dd	2.000000
_4.000000	dd	4.000000
_2.000000	dd	2.000000
_3.000000	dd	3.000000
@aux0	dd	?

.CODE
START:
MOV AX, @DATA
MOV DS, AX
MOV ES, AX

FLD actual
FCOMP _2.000000
FSTSW AX
SAHF
JNA IF1
FLD _2.000000
FLD _4.000000
FADD
FSTP @aux0

FLD @aux0
FSTP actual
FLD _2.000000
FSTP actual
JMP IF1
ELSE1:

FLD _3.000000
FSTP actual
IF1:


MOV AX,4c00h
int 21h

END