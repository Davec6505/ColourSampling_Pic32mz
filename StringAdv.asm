_ArrClear:
; i start address is: 16 (R4)
MOVZ	R4, R0, R0
; i end address is: 16 (R4)
L_ArrClear0:
; i start address is: 16 (R4)
SEH	R3, R4
SEH	R2, R26
SLT	R2, R3, R2
BNE	R2, R0, L__ArrClear19
NOP	
J	L_ArrClear1
NOP	
L__ArrClear19:
; j start address is: 20 (R5)
MOVZ	R5, R0, R0
; j end address is: 20 (R5)
; i end address is: 16 (R4)
L_ArrClear3:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
SEH	R2, R5
SLTI	R2, R2, 64
BNE	R2, R0, L__ArrClear20
NOP	
J	L_ArrClear4
NOP	
L__ArrClear20:
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
ADDIU	SP, SP, -8
SW	RA, 0(SP)
; k start address is: 28 (R7)
MOVZ	R7, R0, R0
; j start address is: 24 (R6)
MOVZ	R6, R0, R0
; i start address is: 20 (R5)
MOVZ	R5, R0, R0
; k end address is: 28 (R7)
; j end address is: 24 (R6)
; i end address is: 20 (R5)
L_SplitStr6:
; i start address is: 20 (R5)
; j start address is: 24 (R6)
; k start address is: 28 (R7)
SW	R25, 4(SP)
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
LW	R25, 4(SP)
SEH	R3, R5
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__SplitStr22
NOP	
J	L__SplitStr17
NOP	
L__SplitStr22:
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R7
ADDU	R3, R3, R2
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
SB	R2, 0(R3)
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R3, R2, 255
ANDI	R2, R27, 255
BEQ	R3, R2, L__SplitStr23
NOP	
J	L_SplitStr9
NOP	
L__SplitStr23:
SEH	R2, R6
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R7
; k end address is: 28 (R7)
ADDU	R2, R3, R2
SB	R0, 0(R2)
ADDIU	R2, R6, 1
SEH	R6, R2
; k start address is: 28 (R7)
MOVZ	R7, R0, R0
J	L_SplitStr8
NOP	
L_SplitStr9:
ADDIU	R2, R7, 1
; k end address is: 28 (R7)
; k start address is: 16 (R4)
SEH	R4, R2
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
BNE	R2, R0, L__SplitStr25
NOP	
J	L__SplitStr16
NOP	
L__SplitStr25:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 128
BNE	R2, R0, L__SplitStr26
NOP	
J	L__SplitStr15
NOP	
L__SplitStr26:
SEH	R2, R5
ADDU	R2, R26, R2
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SLTIU	R2, R2, 32
BEQ	R2, R0, L__SplitStr27
NOP	
J	L__SplitStr14
NOP	
L__SplitStr27:
J	L_SplitStr12
NOP	
; i end address is: 20 (R5)
L__SplitStr16:
L__SplitStr15:
L__SplitStr14:
J	L_SplitStr7
NOP	
L_SplitStr12:
; i start address is: 20 (R5)
; k end address is: 16 (R4)
SEH	R7, R4
L_SplitStr8:
; j end address is: 24 (R6)
; k start address is: 28 (R7)
; j start address is: 24 (R6)
ADDIU	R2, R5, 1
SEH	R5, R2
; k end address is: 28 (R7)
; i end address is: 20 (R5)
J	L_SplitStr6
NOP	
L__SplitStr17:
SEH	R4, R7
L_SplitStr7:
; k start address is: 16 (R4)
SEH	R2, R6
; j end address is: 24 (R6)
SLL	R2, R2, 6
ADDU	R3, R25, R2
SEH	R2, R4
; k end address is: 16 (R4)
ADDU	R2, R3, R2
SB	R0, 0(R2)
L_end_SplitStr:
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _SplitStr
