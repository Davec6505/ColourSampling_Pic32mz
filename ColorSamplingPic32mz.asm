_main:
ADDIU	SP, SP, -1492
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
BNE	R2, R0, L__main40
NOP	
J	L_main5
NOP	
L__main40:
; pgtime end address is: 16 (R4)
ORI	R2, R0, 2
SH	R2, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
J	L_main3
NOP	
L_main5:
; pgtime start address is: 16 (R4)
SW	R4, 0(SP)
SW	R5, 4(SP)
ORI	R25, R0, 1
JAL	_GetDiffence_In_Pointers+0
NOP	
LW	R4, 0(SP)
LW	R5, 4(SP)
SH	R2, 8(SP)
SEH	R2, R2
BNE	R2, R0, L__main42
NOP	
J	L_main6
NOP	
L__main42:
; pgtime end address is: 16 (R4)
ORI	R2, R0, 3
SH	R2, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
J	L_main3
NOP	
L_main6:
; pgtime start address is: 16 (R4)
SLTI	R2, R5, 0
BNE	R2, R0, L__main43
NOP	
XORI	R2, R5, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main43
NOP	
SLTIU	R2, R4, 151
L__main43:
BEQ	R2, R0, L__main44
NOP	
J	L_main7
NOP	
L__main44:
; pgtime end address is: 16 (R4)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R4, R2, 8
LW	R2, Offset(_T0+0)(GP)
LW	R3, 4(R2)
LW	R2, 0(R2)
SW	R2, 0(R4)
SW	R3, 4(R4)
LUI	R2, BitMask(LATB9_bit+0)
ORI	R2, R2, BitMask(LATB9_bit+0)
_SX	
ORI	R2, R0, 1
SH	R2, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
L_main7:
J	L_main3
NOP	
L_main8:
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
JAL	_TimeOutputs+0
NOP	
LW	R4, 0(SP)
LW	R5, 4(SP)
SLTI	R2, R5, 0
BNE	R2, R0, L__main45
NOP	
XORI	R2, R5, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main45
NOP	
SLTIU	R2, R4, 51
L__main45:
BEQ	R2, R0, L__main46
NOP	
J	L_main9
NOP	
L__main46:
; pgtime end address is: 16 (R4)
LW	R2, Offset(_T0+0)(GP)
ADDIU	R4, R2, 8
LW	R2, Offset(_T0+0)(GP)
LW	R3, 4(R2)
LW	R2, 0(R2)
SW	R2, 0(R4)
SW	R3, 4(R4)
LUI	R2, BitMask(LATB9_bit+0)
ORI	R2, R2, BitMask(LATB9_bit+0)
_SX	
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
BNE	R2, R0, L__main48
NOP	
J	L_main11
NOP	
L__main48:
; pgtime end address is: 16 (R4)
ADDIU	R2, SP, 210
ORI	R26, R0, 6
MOVZ	R25, R2, R0
JAL	_ArrClear+0
NOP	
ADDIU	R2, SP, 10
ORI	R27, R0, 64
LUI	R26, hi_addr(_readbuff+0)
ORI	R26, R26, lo_addr(_readbuff+0)
MOVZ	R25, R2, R0
JAL	_strncpy+0
NOP	
ADDIU	R4, SP, 10
ADDIU	R3, SP, 210
ORI	R2, R0, 35
ADDIU	SP, SP, -20
SB	R2, 16(SP)
ORI	R2, R0, 44
SB	R2, 12(SP)
ORI	R2, R0, 2
SH	R2, 8(SP)
SW	R4, 4(SP)
SW	R3, 0(SP)
JAL	_SplitStr+0
NOP	
ADDIU	SP, SP, 20
ADDIU	R3, SP, 10
ADDIU	R2, SP, 210
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
BNE	R2, R0, L__main49
NOP	
XORI	R2, R5, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main49
NOP	
SLTIU	R2, R4, 1
L__main49:
BEQ	R2, R0, L__main50
NOP	
J	L_main12
NOP	
L__main50:
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
LH	R2, 8(SP)
BNE	R2, R0, L__main52
NOP	
J	L_main14
NOP	
L__main52:
; pgtime end address is: 16 (R4)
JAL	_ReadBack_RingBufferB+0
NOP	
SH	R0, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
J	L_main3
NOP	
L_main14:
; pgtime start address is: 16 (R4)
SLTI	R2, R5, 0
BNE	R2, R0, L__main53
NOP	
XORI	R2, R5, 0
SLTIU	R2, R2, 1
BEQ	R2, R0, L__main53
NOP	
SLTIU	R2, R4, 1
L__main53:
BEQ	R2, R0, L__main54
NOP	
J	L_main15
NOP	
L__main54:
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
BNE	R2, R0, L__main56
NOP	
J	L_main4
NOP	
L__main56:
LHU	R3, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
ORI	R2, R0, 1
BNE	R3, R2, L__main58
NOP	
J	L_main8
NOP	
L__main58:
LHU	R3, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
ORI	R2, R0, 2
BNE	R3, R2, L__main60
NOP	
J	L_main10
NOP	
L__main60:
LHU	R3, Offset(ColorSamplingPic32mz_pg_cnt+0)(GP)
ORI	R2, R0, 3
BNE	R3, R2, L__main62
NOP	
J	L_main13
NOP	
L__main62:
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
ADDIU	SP, SP, -36
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
ORI	R30, R0, 13
SB	R30, 28(SP)
ORI	R30, R0, 10
SB	R30, 29(SP)
MOVZ	R30, R0, R0
SB	R30, 30(SP)
ADDIU	R2, SP, 28
MOVZ	R26, R2, R0
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
BNE	R2, R0, L__OutPuts65
NOP	
J	L_OutPuts21
NOP	
L__OutPuts65:
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
ORI	R30, R0, 13
SB	R30, 31(SP)
ORI	R30, R0, 10
SB	R30, 32(SP)
MOVZ	R30, R0, R0
SB	R30, 33(SP)
ADDIU	R2, SP, 31
MOVZ	R26, R2, R0
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
BNE	R2, R0, L__OutPuts67
NOP	
J	L_OutPuts19
NOP	
L__OutPuts67:
; rows end address is: 24 (R6)
ANDI	R3, R27, 255
ORI	R2, R0, 1
BNE	R3, R2, L__OutPuts69
NOP	
J	L_OutPuts23
NOP	
L__OutPuts69:
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
ADDIU	SP, SP, 36
JR	RA
NOP	
; end of _OutPuts
_TimeOutputs:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
LBU	R2, Offset(RTCCONbits+0)(GP)
EXT	R3, R2, 1, 1
_LX	
INS	R2, R3, BitPos(LATB10_bit+0), 1
_SX	
LBU	R2, Offset(TimeOutputs_time_once_L0+0)(GP)
EXT	R2, R2, BitPos(TimeOutputs_time_once_L0+0), 1
BEQ	R2, R0, L__TimeOutputs71
NOP	
J	L__TimeOutputs35
NOP	
L__TimeOutputs71:
LBU	R2, Offset(RTCCONbits+0)(GP)
EXT	R2, R2, 1, 1
BNE	R2, R0, L__TimeOutputs73
NOP	
J	L__TimeOutputs34
NOP	
L__TimeOutputs73:
L__TimeOutputs33:
LBU	R2, Offset(TimeOutputs_time_once_L0+0)(GP)
ORI	R2, R2, BitMask(TimeOutputs_time_once_L0+0)
SB	R2, Offset(TimeOutputs_time_once_L0+0)(GP)
LUI	R25, hi_addr(_rtc_vals+0)
ORI	R25, R25, lo_addr(_rtc_vals+0)
JAL	_ReadTime+0
NOP	
J	L_TimeOutputs28
NOP	
L__TimeOutputs35:
L__TimeOutputs34:
LBU	R2, Offset(TimeOutputs_time_once_L0+0)(GP)
EXT	R2, R2, BitPos(TimeOutputs_time_once_L0+0), 1
BNE	R2, R0, L__TimeOutputs75
NOP	
J	L__TimeOutputs37
NOP	
L__TimeOutputs75:
LBU	R2, Offset(RTCCONbits+0)(GP)
EXT	R2, R2, 1, 1
BEQ	R2, R0, L__TimeOutputs76
NOP	
J	L__TimeOutputs36
NOP	
L__TimeOutputs76:
L__TimeOutputs32:
LBU	R2, Offset(TimeOutputs_time_once_L0+0)(GP)
INS	R2, R0, BitPos(TimeOutputs_time_once_L0+0), 1
SB	R2, Offset(TimeOutputs_time_once_L0+0)(GP)
L__TimeOutputs37:
L__TimeOutputs36:
L_TimeOutputs28:
L_end_TimeOutputs:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of _TimeOutputs
