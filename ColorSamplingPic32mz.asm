_main:
ADDIU	SP, SP, -8
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
SW	R4, 0(SP)
SW	R5, 4(SP)
JAL	_HID_Read+0
NOP	
LW	R4, 0(SP)
LW	R5, 4(SP)
SB	R2, Offset(_kk+0)(GP)
ANDI	R2, R2, 255
BNE	R2, R0, L__main20
NOP	
J	L__main17
NOP	
L__main20:
SB	R0, Offset(_cnt+0)(GP)
; pgtime end address is: 16 (R4)
MOVZ	R6, R5, R0
MOVZ	R5, R4, R0
L_main6:
; pgtime start address is: 20 (R5)
LBU	R2, Offset(_cnt+0)(GP)
SLTIU	R2, R2, 64
BNE	R2, R0, L__main21
NOP	
J	L_main7
NOP	
L__main21:
LBU	R3, Offset(_cnt+0)(GP)
LUI	R2, hi_addr(_writebuff+0)
ORI	R2, R2, lo_addr(_writebuff+0)
ADDU	R4, R2, R3
LBU	R3, Offset(_cnt+0)(GP)
LUI	R2, hi_addr(_readbuff+0)
ORI	R2, R2, lo_addr(_readbuff+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
SB	R2, 0(R4)
LBU	R2, Offset(_cnt+0)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_cnt+0)(GP)
J	L_main6
NOP	
L_main7:
SW	R5, 0(SP)
SW	R6, 4(SP)
ORI	R26, R0, 64
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_HID_Write+0
NOP	
; pgtime end address is: 20 (R5)
LW	R5, 0(SP)
LW	R6, 4(SP)
MOVZ	R3, R5, R0
MOVZ	R4, R6, R0
J	L_main5
NOP	
L__main17:
MOVZ	R3, R4, R0
MOVZ	R4, R5, R0
L_main5:
; pgtime start address is: 12 (R3)
SLTI	R2, R4, 0
BNE	R2, R0, L__main22
NOP	
XORI	R2, R4, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main22
NOP	
SLTIU	R2, R3, 11
L__main22:
BEQ	R2, R0, L__main23
NOP	
J	L_main9
NOP	
L__main23:
; pgtime end address is: 12 (R3)
ORI	R2, R0, 1
SH	R2, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R4, R2, 8
LW	R2, Offset(_T0+0)(GP)
LW	R3, 4(R2)
LW	R2, 0(R2)
SW	R2, 0(R4)
SW	R3, 4(R4)
LUI	R2, BitMask(LATB10_bit+0)
ORI	R2, R2, BitMask(LATB10_bit+0)
_SX	
L_main9:
J	L_main3
NOP	
L_main10:
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
BNE	R2, R0, L__main24
NOP	
XORI	R2, R5, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main24
NOP	
SLTIU	R2, R4, 101
L__main24:
BEQ	R2, R0, L__main25
NOP	
J	L_main11
NOP	
L__main25:
ORI	R2, R0, 2
SH	R2, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R4, R2, 8
LW	R2, Offset(_T0+0)(GP)
LW	R3, 4(R2)
LW	R2, 0(R2)
SW	R2, 0(R4)
SW	R3, 4(R4)
LUI	R2, BitMask(LATB10_bit+0)
ORI	R2, R2, BitMask(LATB10_bit+0)
_SX	
L_main11:
J	L_main3
NOP	
L_main12:
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
BNE	R2, R0, L__main26
NOP	
XORI	R2, R5, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main26
NOP	
SLTIU	R2, R4, 251
L__main26:
BEQ	R2, R0, L__main27
NOP	
J	L_main13
NOP	
L__main27:
ORI	R2, R0, 3
SH	R2, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R4, R2, 8
LW	R2, Offset(_T0+0)(GP)
LW	R3, 4(R2)
LW	R2, 0(R2)
SW	R2, 0(R4)
SW	R3, 4(R4)
LUI	R2, BitMask(LATB10_bit+0)
ORI	R2, R2, BitMask(LATB10_bit+0)
_SX	
L_main13:
J	L_main3
NOP	
L_main14:
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
BNE	R2, R0, L__main28
NOP	
XORI	R2, R5, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main28
NOP	
SLTIU	R2, R4, 51
L__main28:
BEQ	R2, R0, L__main29
NOP	
J	L_main15
NOP	
L__main29:
SH	R0, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R4, R2, 8
LW	R2, Offset(_T0+0)(GP)
LW	R3, 4(R2)
LW	R2, 0(R2)
SW	R2, 0(R4)
SW	R3, 4(R4)
LUI	R2, BitMask(LATB10_bit+0)
ORI	R2, R2, BitMask(LATB10_bit+0)
_SX	
L_main15:
J	L_main3
NOP	
L_main16:
SH	R0, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
J	L_main3
NOP	
L_main2:
LHU	R2, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
BNE	R2, R0, L__main31
NOP	
J	L_main4
NOP	
L__main31:
LHU	R3, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__main33
NOP	
J	L_main10
NOP	
L__main33:
LHU	R3, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__main35
NOP	
J	L_main12
NOP	
L__main35:
LHU	R3, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__main37
NOP	
J	L_main14
NOP	
L__main37:
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
_PrintHandler:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
ANDI	R25, R25, 255
JAL	_UART1_Write+0
NOP	
L_end_PrintHandler:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _PrintHandler
_OutPuts:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ADDIU	SP, SP, -16
SW	R25, 8(SP)
SW	R26, 12(SP)
LUI	R2, hi_addr(?lstr_1_ColorSamplingPic32mz+0)
ORI	R2, R2, lo_addr(?lstr_1_ColorSamplingPic32mz+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_txtA+0)
ORI	R2, R2, lo_addr(_txtA+0)
SW	R2, 0(SP)
JAL	_sprintf+0
NOP	
ADDIU	SP, SP, 16
LUI	R25, hi_addr(_newline+0)
ORI	R25, R25, lo_addr(_newline+0)
JAL	_strlen+0
NOP	
SEH	R27, R2
LUI	R26, hi_addr(_newline+0)
ORI	R26, R26, lo_addr(_newline+0)
LUI	R25, hi_addr(_txtA+0)
ORI	R25, R25, lo_addr(_txtA+0)
JAL	_strncat+0
NOP	
SW	R2, Offset(_txtPtr+0)(GP)
MOVZ	R25, R2, R0
JAL	_strlen+0
NOP	
SEH	R27, R2
LW	R26, Offset(_txtPtr+0)(GP)
LUI	R25, hi_addr(_writebuff+0)
ORI	R25, R25, lo_addr(_writebuff+0)
JAL	_memcpy+0
NOP	
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
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _OutPuts
