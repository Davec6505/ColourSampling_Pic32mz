_ArrClear:
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_ArrClear0:
; i start address is: 16 (R4)
SEH	R3, R4
SEH	R2, R26
SLT	R2, R3, R2
BNE	R2, R0, L__ArrClear27
NOP	
J	L_ArrClear1
NOP	
L__ArrClear27:
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_ArrClear3:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__ArrClear28
NOP	
J	L_ArrClear4
NOP	
L__ArrClear28:
SEH	R2, R4
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R5
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R5, 1
SEH	R5, R2
; j end address is: 20 (R5)
J	L_ArrClear3
NOP	
L_ArrClear4:
ADDIU	R2, R4, 1
SEH	R4, R2
; i end address is: 16 (R4)
J	L_ArrClear0
NOP	
L_ArrClear1:
L_end_ArrClear:
JR	RA
NOP	
; end of _ArrClear
_SplitStr:
ADDIU	SP, SP, -24
SW	RA, 0(SP)
SW	R25, 4(SP)
; arr start address is: 28 (R7)
LW	R7, 24(SP)
; str start address is: 24 (R6)
LW	R6, 28(SP)
ADDIU	R3, SP, 8
ADDIU	R2, SP, 32
ADDIU	R2, R2, 4
SW	R2, 0(R3)
; i start address is: 32 (R8)
MOVZ	R8, R0, R0
; arr end address is: 28 (R7)
; str end address is: 24 (R6)
; i end address is: 32 (R8)
L_SplitStr6:
; i start address is: 32 (R8)
; str start address is: 24 (R6)
; arr start address is: 28 (R7)
SEH	R3, R8
LH	R2, 32(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__SplitStr30
NOP	
J	L_SplitStr7
NOP	
L__SplitStr30:
ADDIU	R3, SP, 12
SEH	R2, R8
ADDU	R5, R3, R2
ADDIU	R4, SP, 8
LW	R3, 0(R4)
ADDIU	R2, R3, 4
SW	R2, 0(R4)
LBU	R2, 0(R3)
SB	R2, 0(R5)
ADDIU	R2, R8, 1
SEH	R8, R2
; i end address is: 32 (R8)
J	L_SplitStr6
NOP	
L_SplitStr7:
; i start address is: 32 (R8)
MOVZ	R8, R0, R0
; j start address is: 40 (R10)
MOVZ	R10, R0, R0
; k start address is: 36 (R9)
MOVZ	R9, R0, R0
; arr end address is: 28 (R7)
; str end address is: 24 (R6)
; j end address is: 40 (R10)
; k end address is: 36 (R9)
; i end address is: 32 (R8)
MOVZ	R11, R7, R0
L_SplitStr9:
; k start address is: 36 (R9)
; j start address is: 40 (R10)
; i start address is: 32 (R8)
; arr start address is: 44 (R11)
; str start address is: 24 (R6)
MOVZ	R25, R6, R0
JAL	_strlen+0
NOP	
SEH	R3, R8
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__SplitStr31
NOP	
J	L__SplitStr25
NOP	
L__SplitStr31:
SEH	R2, R10
SLL	R2, R2, 6
ADDU	R3, R11, R2
SEH	R2, R9
ADDU	R3, R3, R2
SEH	R2, R8
ADDU	R2, R6, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
; l start address is: 28 (R7)
MOVZ	R7, R0, R0
; arr end address is: 44 (R11)
; str end address is: 24 (R6)
; l end address is: 28 (R7)
; j end address is: 40 (R10)
; k end address is: 36 (R9)
; i end address is: 32 (R8)
MOVZ	R5, R11, R0
L_SplitStr12:
; l start address is: 28 (R7)
; str start address is: 24 (R6)
; arr start address is: 20 (R5)
; i start address is: 32 (R8)
; j start address is: 40 (R10)
; k start address is: 36 (R9)
SEH	R3, R7
LH	R2, 32(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__SplitStr32
NOP	
J	L__SplitStr24
NOP	
L__SplitStr32:
SEH	R2, R8
ADDU	R2, R6, R2
LBU	R4, 0(R2)
ADDIU	R3, SP, 12
SEH	R2, R7
ADDU	R2, R3, R2
LBU	R2, 0(R2)
ANDI	R3, R4, 255
ANDI	R2, R2, 255
BEQ	R3, R2, L__SplitStr33
NOP	
J	L_SplitStr15
NOP	
L__SplitStr33:
SEH	R2, R10
SLL	R2, R2, 6
ADDU	R3, R5, R2
SEH	R2, R9
; k end address is: 36 (R9)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R10, 1
SEH	R10, R2
; k start address is: 16 (R4)
MOVZ	R4, R0, R0
; k end address is: 16 (R4)
J	L_SplitStr13
NOP	
L_SplitStr15:
; k start address is: 36 (R9)
ADDIU	R2, R7, 1
SEH	R7, R2
; j end address is: 40 (R10)
; k end address is: 36 (R9)
J	L_SplitStr12
NOP	
L__SplitStr24:
SEH	R4, R9
L_SplitStr13:
; k start address is: 16 (R4)
; j start address is: 40 (R10)
SEH	R3, R7
; l end address is: 28 (R7)
LH	R2, 32(SP)
SLT	R2, R3, R2
BNE	R2, R0, L__SplitStr34
NOP	
J	L_SplitStr16
NOP	
L__SplitStr34:
SEH	R9, R4
J	L_SplitStr11
NOP	
L_SplitStr16:
ADDIU	R2, R4, 1
; k end address is: 16 (R4)
; k start address is: 12 (R3)
SEH	R3, R2
SEH	R2, R8
ADDU	R2, R6, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__SplitStr36
NOP	
J	L__SplitStr23
NOP	
L__SplitStr36:
SEH	R2, R8
ADDU	R2, R6, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 128
BNE	R2, R0, L__SplitStr37
NOP	
J	L__SplitStr22
NOP	
L__SplitStr37:
SEH	R2, R8
ADDU	R2, R6, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__SplitStr38
NOP	
J	L__SplitStr21
NOP	
L__SplitStr38:
J	L_SplitStr19
NOP	
; str end address is: 24 (R6)
; i end address is: 32 (R8)
L__SplitStr23:
L__SplitStr22:
L__SplitStr21:
MOVZ	R4, R5, R0
SEH	R5, R3
SEH	R3, R10
J	L_SplitStr10
NOP	
L_SplitStr19:
; i start address is: 32 (R8)
SEH	R9, R3
; k end address is: 12 (R3)
; str start address is: 24 (R6)
L_SplitStr11:
; k start address is: 36 (R9)
ADDIU	R2, R8, 1
SEH	R8, R2
; str end address is: 24 (R6)
; arr end address is: 20 (R5)
; j end address is: 40 (R10)
; k end address is: 36 (R9)
; i end address is: 32 (R8)
MOVZ	R11, R5, R0
J	L_SplitStr9
NOP	
L__SplitStr25:
MOVZ	R4, R11, R0
SEH	R3, R10
SEH	R5, R9
L_SplitStr10:
; arr start address is: 16 (R4)
; j start address is: 12 (R3)
; k start address is: 20 (R5)
SEH	R2, R3
; j end address is: 12 (R3)
SLL	R2, R2, 6
ADDU	R3, R4, R2
; arr end address is: 16 (R4)
SEH	R2, R5
; k end address is: 20 (R5)
ADDU	R2, R3, R2
SB	R0, 0(R2)
L_end_SplitStr:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _SplitStr
