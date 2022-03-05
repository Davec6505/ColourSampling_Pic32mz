_IniyRTCC:
DI	R30
SW	R0, Offset(SYSKEY+0)(GP)
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(SYSKEY+0)(GP)
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(SYSKEY+0)(GP)
ORI	R2, R0, 8
SW	R2, Offset(RTCCONSET+0)(GP)
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(SYSKEY+0)(GP)
L_end_IniyRTCC:
JR	RA
NOP	
; end of _IniyRTCC
_InitRTCC_Tnterrupt:
ORI	R2, R0, 32768
SW	R2, Offset(IEC1CLR+0)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(RTCCONCLR+0)(GP)
L_InitRTCC_Tnterrupt0:
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 64
BNE	R2, R0, L__InitRTCC_Tnterrupt20
NOP	
J	L_InitRTCC_Tnterrupt1
NOP	
L__InitRTCC_Tnterrupt20:
J	L_InitRTCC_Tnterrupt0
NOP	
L_InitRTCC_Tnterrupt1:
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
L_InitRTCC_Tnterrupt2:
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 64
BEQ	R2, R0, L__InitRTCC_Tnterrupt21
NOP	
J	L_InitRTCC_Tnterrupt3
NOP	
L__InitRTCC_Tnterrupt21:
J	L_InitRTCC_Tnterrupt2
NOP	
L_InitRTCC_Tnterrupt3:
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
BNE	R2, R0, L__RTCC_Calibrate24
NOP	
J	L_RTCC_Calibrate4
NOP	
L__RTCC_Calibrate24:
L_RTCC_Calibrate5:
; t0 start address is: 16 (R4)
LW	R4, Offset(RTCTIME+0)(GP)
; t1 start address is: 20 (R5)
LW	R5, Offset(RTCTIME+0)(GP)
ANDI	R3, R4, 65535
ANDI	R2, R5, 65535
BEQ	R3, R2, L__RTCC_Calibrate25
NOP	
J	L_RTCC_Calibrate5
NOP	
L__RTCC_Calibrate25:
; t1 end address is: 20 (R5)
ANDI	R2, R4, 255
; t0 end address is: 16 (R4)
ANDI	R2, R2, 65535
BEQ	R2, R0, L__RTCC_Calibrate26
NOP	
J	L_RTCC_Calibrate8
NOP	
L__RTCC_Calibrate26:
L_RTCC_Calibrate9:
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 2
BEQ	R2, R0, L__RTCC_Calibrate27
NOP	
J	L_RTCC_Calibrate10
NOP	
L__RTCC_Calibrate27:
J	L_RTCC_Calibrate9
NOP	
L_RTCC_Calibrate10:
L_RTCC_Calibrate8:
L_RTCC_Calibrate4:
LUI	R2, 1023
SW	R2, Offset(RTCCONCLR+0)(GP)
LH	R2, 0(SP)
SW	R2, Offset(RTCCONSET+0)(GP)
L_end_RTCC_Calibrate:
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _RTCC_Calibrate
_SetRTCCInitial:
ORI	R2, R0, 32768
SW	R2, Offset(RTCCONCLR+0)(GP)
L_SetRTCCInitial11:
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 64
BNE	R2, R0, L__SetRTCCInitial30
NOP	
J	L_SetRTCCInitial12
NOP	
L__SetRTCCInitial30:
J	L_SetRTCCInitial11
NOP	
L_SetRTCCInitial12:
LW	R2, Offset(_time+0)(GP)
SW	R2, Offset(RTCTIME+0)(GP)
LW	R2, Offset(_date+0)(GP)
SW	R2, Offset(RTCDATE+0)(GP)
ORI	R2, R0, 32768
SW	R2, Offset(RTCCONSET+0)(GP)
L_SetRTCCInitial13:
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 64
BEQ	R2, R0, L__SetRTCCInitial31
NOP	
J	L_SetRTCCInitial14
NOP	
L__SetRTCCInitial31:
J	L_SetRTCCInitial13
NOP	
L_SetRTCCInitial14:
L_end_SetRTCCInitial:
JR	RA
NOP	
; end of _SetRTCCInitial
_SetRTCC:
DI	R30
L_SetRTCC15:
LW	R2, Offset(RTCCON+0)(GP)
ANDI	R2, R2, 4
BNE	R2, R0, L__SetRTCC34
NOP	
J	L_SetRTCC16
NOP	
L__SetRTCC34:
J	L_SetRTCC15
NOP	
L_SetRTCC16:
LW	R2, Offset(_time+0)(GP)
SW	R2, Offset(RTCTIME+0)(GP)
LW	R2, Offset(_date+0)(GP)
SW	R2, Offset(RTCDATE+0)(GP)
EI	R30
L_end_SetRTCC:
JR	RA
NOP	
; end of _SetRTCC
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
