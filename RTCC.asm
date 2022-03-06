_InitRTCC:
DI	R30
SW	R0, Offset(SYSKEY+0)(GP)
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(SYSKEY+0)(GP)
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(SYSKEY+0)(GP)
ANDI	R3, R25, 255
ORI	R2, R0, 1
BEQ	R3, R2, L__InitRTCC30
NOP	
J	L_InitRTCC0
NOP	
L__InitRTCC30:
_LX	
EXT	R2, R2, BitPos(SOSCRDY_bit+0), 1
BEQ	R2, R0, L__InitRTCC31
NOP	
J	L_InitRTCC1
NOP	
L__InitRTCC31:
LUI	R2, BitMask(SOSCEN_bit+0)
ORI	R2, R2, BitMask(SOSCEN_bit+0)
_SX	
L_InitRTCC1:
ORI	R2, R0, 1161
SW	R2, Offset(RTCCONSET+0)(GP)
J	L_InitRTCC2
NOP	
L_InitRTCC0:
_LX	
EXT	R2, R2, BitPos(SOSCRDY_bit+0), 1
BNE	R2, R0, L__InitRTCC33
NOP	
J	L_InitRTCC3
NOP	
L__InitRTCC33:
LUI	R2, BitMask(SOSCEN_bit+0)
ORI	R2, R2, BitMask(SOSCEN_bit+0)
_SX	
L_InitRTCC3:
ORI	R2, R0, 649
SW	R2, Offset(RTCCONSET+0)(GP)
L_InitRTCC2:
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(SYSKEY+0)(GP)
L_end_InitRTCC:
JR	RA
NOP	
; end of _InitRTCC
_SetRTCCInitial:
L_SetRTCCInitial4:
ORI	R2, R0, 32768
SW	R2, Offset(RTCCONbits+4)(GP)
LUI	R24, 101
ORI	R24, R24, 47530
L_SetRTCCInitial7:
ADDIU	R24, R24, -1
BNE	R24, R0, L_SetRTCCInitial7
NOP	
LUI	R2, BitMask(LATB10_bit+0)
ORI	R2, R2, BitMask(LATB10_bit+0)
_SX	
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 64
BEQ	R2, R0, L__SetRTCCInitial35
NOP	
J	L_SetRTCCInitial4
NOP	
L__SetRTCCInitial35:
LW	R2, Offset(_time+0)(GP)
SW	R2, Offset(RTCTIME+0)(GP)
LW	R2, Offset(_date+0)(GP)
SW	R2, Offset(RTCDATE+0)(GP)
L_end_SetRTCCInitial:
JR	RA
NOP	
; end of _SetRTCCInitial
_SetRTCC:
DI	R30
L_SetRTCC9:
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 4
BNE	R2, R0, L__SetRTCC38
NOP	
J	L_SetRTCC10
NOP	
L__SetRTCC38:
J	L_SetRTCC9
NOP	
L_SetRTCC10:
LW	R2, Offset(_time+0)(GP)
SW	R2, Offset(RTCTIME+0)(GP)
LW	R2, Offset(_date+0)(GP)
SW	R2, Offset(RTCDATE+0)(GP)
EI	R30
L_end_SetRTCC:
JR	RA
NOP	
; end of _SetRTCC
_RTCC_ON:
L_RTCC_ON11:
ORI	R2, R0, 32768
SW	R2, Offset(RTCCONbits+8)(GP)
LUI	R24, 101
ORI	R24, R24, 47530
L_RTCC_ON14:
ADDIU	R24, R24, -1
BNE	R24, R0, L_RTCC_ON14
NOP	
LUI	R2, BitMask(LATB10_bit+0)
ORI	R2, R2, BitMask(LATB10_bit+0)
_SX	
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 64
BEQ	R2, R0, L__RTCC_ON40
NOP	
J	L_RTCC_ON11
NOP	
L__RTCC_ON40:
L_end_RTCC_ON:
JR	RA
NOP	
; end of _RTCC_ON
_InitRTCC_Tnterrupt:
ORI	R2, R0, 32768
SW	R2, Offset(IEC1CLR+0)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(RTCCONCLR+0)(GP)
L_InitRTCC_Tnterrupt16:
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 64
BNE	R2, R0, L__InitRTCC_Tnterrupt43
NOP	
J	L_InitRTCC_Tnterrupt17
NOP	
L__InitRTCC_Tnterrupt43:
J	L_InitRTCC_Tnterrupt16
NOP	
L_InitRTCC_Tnterrupt17:
ORI	R2, R0, 32768
SW	R2, Offset(IFS1CLR+0)(GP)
LUI	R2, 7936
SW	R2, Offset(IPC8CLR+0)(GP)
LUI	R2, 3328
SW	R2, Offset(IPC8SET+0)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(IEC1SET+0)(GP)
LUI	R2, 5653
ORI	R2, R2, 13056
SW	R2, Offset(RTCTIME+0)(GP)
LUI	R2, 1552
ORI	R2, R2, 9989
SW	R2, Offset(RTCDATE+0)(GP)
ORI	R2, R0, 53247
SW	R2, Offset(RTCALRMCLR+0)(GP)
LUI	R2, 5653
ORI	R2, R2, 17152
SW	R2, Offset(ALRMTIME+0)(GP)
LUI	R2, 1552
ORI	R2, R2, 9989
SW	R2, Offset(ALRMDATE+0)(GP)
ORI	R2, R0, 34304
SW	R2, Offset(RTCALRMSET+0)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(RTCCONSET+0)(GP)
L_InitRTCC_Tnterrupt18:
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 64
BEQ	R2, R0, L__InitRTCC_Tnterrupt44
NOP	
J	L_InitRTCC_Tnterrupt19
NOP	
L__InitRTCC_Tnterrupt44:
J	L_InitRTCC_Tnterrupt18
NOP	
L_InitRTCC_Tnterrupt19:
L_end_InitRTCC_Tnterrupt:
JR	RA
NOP	
; end of _InitRTCC_Tnterrupt
_RTCC_Calibrate:
ADDIU	SP, SP, -4
ORI	R30, R0, 1021
SH	R30, 0(SP)
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 32768
BNE	R2, R0, L__RTCC_Calibrate47
NOP	
J	L_RTCC_Calibrate20
NOP	
L__RTCC_Calibrate47:
L_RTCC_Calibrate21:
; t0 start address is: 16 (R4)
LW	R4, Offset(RTCTIME+0)(GP)
; t1 start address is: 20 (R5)
LW	R5, Offset(RTCTIME+0)(GP)
ANDI	R3, R4, 65535
ANDI	R2, R5, 65535
BEQ	R3, R2, L__RTCC_Calibrate48
NOP	
J	L_RTCC_Calibrate21
NOP	
L__RTCC_Calibrate48:
; t1 end address is: 20 (R5)
ANDI	R2, R4, 255
; t0 end address is: 16 (R4)
ANDI	R2, R2, 65535
BEQ	R2, R0, L__RTCC_Calibrate49
NOP	
J	L_RTCC_Calibrate24
NOP	
L__RTCC_Calibrate49:
L_RTCC_Calibrate25:
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 2
BEQ	R2, R0, L__RTCC_Calibrate50
NOP	
J	L_RTCC_Calibrate26
NOP	
L__RTCC_Calibrate50:
J	L_RTCC_Calibrate25
NOP	
L_RTCC_Calibrate26:
L_RTCC_Calibrate24:
L_RTCC_Calibrate20:
LUI	R2, 1023
SW	R2, Offset(RTCCONCLR+0)(GP)
LH	R2, 0(SP)
SW	R2, Offset(RTCCONSET+0)(GP)
L_end_RTCC_Calibrate:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RTCC_Calibrate
_RTCC_Interrupt:
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
ORI	R2, R0, 32768
SW	R2, Offset(IFS1CLR+0)(GP)
L_end_RTCC_Interrupt:
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _RTCC_Interrupt
_ReadTime:
ADDIU	SP, SP, -28
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 4
BNE	R2, R0, L__ReadTime54
NOP	
J	L_ReadTime27
NOP	
L__ReadTime54:
J	L_end_ReadTime
NOP	
L_ReadTime27:
; rtc start address is: 12 (R3)
LW	R3, Offset(RTCTIME+0)(GP)
ADDIU	R2, SP, 12
MOVZ	R26, R2, R0
MOVZ	R25, R3, R0
; rtc end address is: 12 (R3)
JAL	_LongToStr+0
NOP	
ADDIU	R2, SP, 12
ADDIU	SP, SP, -12
SW	R2, 8(SP)
LUI	R2, hi_addr(?lstr_1_RTCC+0)
ORI	R2, R2, lo_addr(?lstr_1_RTCC+0)
SW	R2, 4(SP)
LUI	R2, hi_addr(_PrintHandler+0)
ORI	R2, R2, lo_addr(_PrintHandler+0)
SW	R2, 0(SP)
JAL	_PrintOut+0
NOP	
ADDIU	SP, SP, 12
L_end_ReadTime:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 28
JR	RA
NOP	
; end of _ReadTime
