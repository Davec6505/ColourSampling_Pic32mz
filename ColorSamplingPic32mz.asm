_main:
ADDIU	SP, SP, -1484
JAL	_PerphialSetUp+0
NOP	
EI	R30
SH	R0, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
L_main0:
JAL	_USB_Polling_Proc+0
NOP	
JAL	_GetTimer_Values+0
NOP	
SW	R2, Offset(_T0+0)(GP)
J	L_main2
NOP	
L_main4:
LW	R2, Offset(_T0+0)(GP)
LW	R5, 4(R2)
LW	R4, 0(R2)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R2, R2, 8
LW	R3, 4(R2)
LW	R2, 0(R2)
SLTU	R30, R4, R2
SUBU	R6, R4, R2
SUBU	R7, R5, R3
SUBU	R7, R7, R30
_LX	
EXT	R3, R2, BitPos(LATD0_bit+0), 1
_LX	
INS	R2, R3, BitPos(LATB10_bit+0), 1
_SX	
SLTI	R2, R7, 0
BNE	R2, R0, L__main26
NOP	
XORI	R2, R7, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main26
NOP	
SLTIU	R2, R6, 151
L__main26:
BEQ	R2, R0, L__main27
NOP	
J	L_main5
NOP	
L__main27:
LW	R2, Offset(_T0+0)(GP)
ADDIU	R4, R2, 8
LW	R2, Offset(_T0+0)(GP)
LW	R3, 4(R2)
LW	R2, 0(R2)
SW	R2, 0(R4)
SW	R3, 4(R4)
JAL	_ReadTime+0
NOP	
ORI	R25, R0, 1
JAL	_GetDiffence_In_Pointers+0
NOP	
SH	R2, 0(SP)
SEH	R2, R2
BNE	R2, R0, L__main29
NOP	
J	L_main6
NOP	
L__main29:
ORI	R2, R0, 3
SH	R2, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
J	L_main3
NOP	
L_main6:
JAL	_HID_Read+0
NOP	
SB	R2, Offset(_kk+0)(GP)
ANDI	R2, R2, 255
BNE	R2, R0, L__main31
NOP	
J	L_main7
NOP	
L__main31:
ORI	R2, R0, 2
SH	R2, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
J	L_main3
NOP	
L_main7:
ORI	R2, R0, 1
SH	R2, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
L_main5:
J	L_main3
NOP	
L_main8:
LW	R2, Offset(_T0+0)(GP)
LW	R7, 4(R2)
LW	R6, 0(R2)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R2, R2, 8
LW	R3, 4(R2)
LW	R2, 0(R2)
SLTU	R30, R6, R2
SUBU	R4, R6, R2
SUBU	R5, R7, R3
SUBU	R5, R5, R30
SLTI	R2, R5, 0
BNE	R2, R0, L__main32
NOP	
XORI	R2, R5, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main32
NOP	
SLTIU	R2, R4, 51
L__main32:
BEQ	R2, R0, L__main33
NOP	
J	L_main9
NOP	
L__main33:
LW	R2, Offset(_T0+0)(GP)
ADDIU	R4, R2, 8
LW	R2, Offset(_T0+0)(GP)
LW	R3, 4(R2)
LW	R2, 0(R2)
SW	R2, 0(R4)
SW	R3, 4(R4)
SH	R0, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
L_main9:
J	L_main3
NOP	
L_main10:
LW	R2, Offset(_T0+0)(GP)
LW	R7, 4(R2)
LW	R6, 0(R2)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R2, R2, 8
LW	R5, 4(R2)
LW	R4, 0(R2)
SLTU	R30, R6, R4
SUBU	R2, R6, R4
SUBU	R3, R7, R5
SUBU	R3, R3, R30
; pgtime start address is: 16 (R4)
MOVZ	R4, R2, R0
MOVZ	R5, R3, R0
LBU	R2, Offset(_kk+0)(GP)
BNE	R2, R0, L__main35
NOP	
J	L_main11
NOP	
L__main35:
; pgtime end address is: 16 (R4)
ADDIU	R2, SP, 2
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_strcpy+0
NOP	
ADDIU	R3, SP, 2
ADDIU	R2, SP, 202
ORI	R27, R0, 44
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_SplitStr+0
NOP	
ADDIU	R3, SP, 2
ADDIU	R2, SP, 202
MOVZ	R27, R0, R0
MOVZ	R26, R3, R0
MOVZ	R25, R2, R0
JAL	_OutPuts+0
NOP	
SH	R0, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
J	L_main3
NOP	
L_main11:
; pgtime start address is: 16 (R4)
SLTI	R2, R5, 0
BNE	R2, R0, L__main36
NOP	
XORI	R2, R5, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main36
NOP	
SLTIU	R2, R4, 1
L__main36:
BEQ	R2, R0, L__main37
NOP	
J	L_main12
NOP	
L__main37:
; pgtime end address is: 16 (R4)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R4, R2, 8
LW	R2, Offset(_T0+0)(GP)
LW	R3, 4(R2)
LW	R2, 0(R2)
SW	R2, 0(R4)
SW	R3, 4(R4)
SH	R0, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
L_main12:
J	L_main3
NOP	
L_main13:
LW	R2, Offset(_T0+0)(GP)
LW	R7, 4(R2)
LW	R6, 0(R2)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R2, R2, 8
LW	R5, 4(R2)
LW	R4, 0(R2)
SLTU	R30, R6, R4
SUBU	R2, R6, R4
SUBU	R3, R7, R5
SUBU	R3, R3, R30
; pgtime start address is: 16 (R4)
MOVZ	R4, R2, R0
MOVZ	R5, R3, R0
LH	R2, 0(SP)
BNE	R2, R0, L__main39
NOP	
J	L_main14
NOP	
L__main39:
; pgtime end address is: 16 (R4)
JAL	_ReadBack_RingBufferB+0
NOP	
SH	R0, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
J	L_main3
NOP	
L_main14:
; pgtime start address is: 16 (R4)
SLTI	R2, R5, 0
BNE	R2, R0, L__main40
NOP	
XORI	R2, R5, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main40
NOP	
SLTIU	R2, R4, 1
L__main40:
BEQ	R2, R0, L__main41
NOP	
J	L_main15
NOP	
L__main41:
; pgtime end address is: 16 (R4)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R4, R2, 8
LW	R2, Offset(_T0+0)(GP)
LW	R3, 4(R2)
LW	R2, 0(R2)
SW	R2, 0(R4)
SW	R3, 4(R4)
SH	R0, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
L_main15:
J	L_main3
NOP	
L_main16:
SH	R0, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R4, R2, 8
LW	R2, Offset(_T0+0)(GP)
LW	R3, 4(R2)
LW	R2, 0(R2)
SW	R2, 0(R4)
SW	R3, 4(R4)
J	L_main3
NOP	
L_main2:
LHU	R2, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
BNE	R2, R0, L__main43
NOP	
J	L_main4
NOP	
L__main43:
LHU	R3, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__main45
NOP	
J	L_main8
NOP	
L__main45:
LHU	R3, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__main47
NOP	
J	L_main10
NOP	
L__main47:
LHU	R3, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__main49
NOP	
J	L_main13
NOP	
L__main49:
J	L_main16
NOP	
L_main3:
J	L_main0
NOP	
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_OutPuts:
ADDIU	SP, SP, -28
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
; rows start address is: 24 (R6)
ORI	R6, R0, 4
SB	R27, 16(SP)
SW	R26, 20(SP)
SW	R25, 24(SP)
ORI	R27, R0, 64
MOVZ	R26, R0, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memset+0
NOP	
LW	R25, 24(SP)
LW	R26, 20(SP)
LBU	R27, 16(SP)
J	L_OutPuts17
NOP	
L_OutPuts19:
JAL	_strlen+0
NOP	
SW	R25, 16(SP)
SEH	R27, R2
MOVZ	R26, R25, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncpy+0
NOP	
LUI	R26, hi_addr(?lstr1_ColorSamplingPic32mz+0)
ORI	R26, R26, lo_addr(?lstr1_ColorSamplingPic32mz+0)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
LW	R25, 16(SP)
; i start address is: 28 (R7)
ORI	R7, R0, 1
; rows end address is: 24 (R6)
; i end address is: 28 (R7)
L_OutPuts20:
; i start address is: 28 (R7)
; rows start address is: 24 (R6)
ADDIU	R2, R6, 1
SEH	R3, R7
SEH	R2, R2
SLT	R2, R3, R2
BNE	R2, R0, L__OutPuts52
NOP	
J	L_OutPuts21
NOP	
L__OutPuts52:
SEH	R2, R7
SLL	R2, R2, 6
ADDU	R2, R25, R2
SW	R26, 16(SP)
SW	R25, 20(SP)
MOVZ	R26, R2, R0
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
LUI	R26, hi_addr(?lstr2_ColorSamplingPic32mz+0)
ORI	R26, R26, lo_addr(?lstr2_ColorSamplingPic32mz+0)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strcat+0
NOP	
LW	R25, 20(SP)
LW	R26, 16(SP)
ADDIU	R2, R7, 1
SEH	R7, R2
; rows end address is: 24 (R6)
; i end address is: 28 (R7)
J	L_OutPuts20
NOP	
L_OutPuts21:
J	L_OutPuts18
NOP	
L_OutPuts23:
MOVZ	R25, R26, R0
JAL	_strlen+0
NOP	
SEH	R27, R2
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_strncpy+0
NOP	
J	L_OutPuts18
NOP	
L_OutPuts24:
J	L_OutPuts18
NOP	
L_OutPuts17:
; rows start address is: 24 (R6)
ANDI	R2, R27, 255
BNE	R2, R0, L__OutPuts54
NOP	
J	L_OutPuts19
NOP	
L__OutPuts54:
; rows end address is: 24 (R6)
ANDI	R3, R27, 255
ORI	R2, R0, 1
BNE	R3, R2, L__OutPuts56
NOP	
J	L_OutPuts23
NOP	
L__OutPuts56:
J	L_OutPuts24
NOP	
L_OutPuts18:
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
L_end_OutPuts:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _OutPuts
