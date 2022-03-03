_ISR_Init:
LUI	R2, hi_addr(Timers_TMR_System+0)
ORI	R2, R2, lo_addr(Timers_TMR_System+0)
SW	R2, Offset(_TMR_Sys+0)(GP)
LUI	R2, hi_addr(Timers_TMR_Timer+0)
ORI	R2, R2, lo_addr(Timers_TMR_Timer+0)
SW	R2, Offset(_TMR_Tmr+0)(GP)
L_end_ISR_Init:
JR	RA
NOP	
; end of _ISR_Init
_InitTimer1:
ORI	R2, R0, 32768
SW	R2, Offset(T1CON+0)(GP)
LUI	R2, BitMask(T1IP0_bit+0)
ORI	R2, R2, BitMask(T1IP0_bit+0)
_SX	
LUI	R2, BitMask(T1IP1_bit+0)
ORI	R2, R2, BitMask(T1IP1_bit+0)
_SX	
LUI	R2, BitMask(T1IP2_bit+0)
ORI	R2, R2, BitMask(T1IP2_bit+0)
_SX	
LUI	R2, BitMask(T1IS0_bit+0)
ORI	R2, R2, BitMask(T1IS0_bit+0)
_SX	
LUI	R2, BitMask(T1IS1_bit+0)
ORI	R2, R2, BitMask(T1IS1_bit+0)
_SX	
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
LUI	R2, BitMask(T1IE_bit+0)
ORI	R2, R2, BitMask(T1IE_bit+0)
_SX	
ORI	R2, R0, 50000
SW	R2, Offset(PR1+0)(GP)
SW	R0, Offset(TMR1+0)(GP)
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_InitTimer2:
ORI	R2, R0, 32768
SW	R2, Offset(T2CON+0)(GP)
LUI	R2, BitMask(T2IP0_bit+0)
ORI	R2, R2, BitMask(T2IP0_bit+0)
_SX	
LUI	R2, BitMask(T2IP1_bit+0)
ORI	R2, R2, BitMask(T2IP1_bit+0)
_SX	
LUI	R2, BitMask(T2IP2_bit+0)
ORI	R2, R2, BitMask(T2IP2_bit+0)
_SX	
LUI	R2, BitMask(T2IS0_bit+0)
ORI	R2, R2, BitMask(T2IS0_bit+0)
_SX	
LUI	R2, BitMask(T2IS1_bit+0)
ORI	R2, R2, BitMask(T2IS1_bit+0)
_SX	
LUI	R2, BitMask(T2IF_bit+0)
ORI	R2, R2, BitMask(T2IF_bit+0)
_SX	
LUI	R2, BitMask(T2IE_bit+0)
ORI	R2, R2, BitMask(T2IE_bit+0)
_SX	
ORI	R2, R0, 50000
SW	R2, Offset(PR2+0)(GP)
SW	R0, Offset(TMR2+0)(GP)
L_end_InitTimer2:
JR	RA
NOP	
; end of _InitTimer2
Timers_Timer1Interrupt:
RDPGPR	SP, SP
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 6144
MTC0	R30, 12, 0
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
L_end_Timer1Interrupt:
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
WRPGPR	SP, SP
ERET	
; end of Timers_Timer1Interrupt
Timers_TMR_System:
L_end_TMR_System:
JR	RA
NOP	
; end of Timers_TMR_System
Timers_Timer2Interrupt:
RDPGPR	SP, SP
ADDIU	SP, SP, -16
SW	R30, 12(SP)
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 6144
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LUI	R2, BitMask(T2IF_bit+0)
ORI	R2, R2, BitMask(T2IF_bit+0)
_SX	
LW	R30, Offset(_TMR_Tmr+0)(GP)
JALR	RA, R30
NOP	
L_end_Timer2Interrupt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 12(SP)
ADDIU	SP, SP, 16
WRPGPR	SP, SP
ERET	
; end of Timers_Timer2Interrupt
Timers_TMR_Timer:
LW	R5, Offset(Timers_T0+4)(GP)
LW	R4, Offset(Timers_T0+0)(GP)
ADDIU	R2, R4, 1
SLTIU	R3, R2, 1
ADDU	R3, R3, R5
SW	R2, Offset(Timers_T0+0)(GP)
SW	R3, Offset(Timers_T0+4)(GP)
LHU	R2, Offset(Timers_T0+16)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(Timers_T0+16)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L_Timers_TMR_Timer11
NOP	
J	L_Timers_TMR_Timer0
NOP	
L_Timers_TMR_Timer11:
SH	R0, Offset(Timers_T0+16)(GP)
LBU	R2, Offset(Timers_T0+18)(GP)
ADDIU	R4, R2, 1
SB	R4, Offset(Timers_T0+18)(GP)
_LX	
EXT	R2, R2, BitPos(LATB9_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATB9_bit+0), 1
_SX	
ANDI	R2, R4, 255
SLTIU	R2, R2, 60
BEQ	R2, R0, L_Timers_TMR_Timer12
NOP	
J	L_Timers_TMR_Timer1
NOP	
L_Timers_TMR_Timer12:
SB	R0, Offset(Timers_T0+18)(GP)
LBU	R2, Offset(Timers_T0+19)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(Timers_T0+19)(GP)
L_Timers_TMR_Timer2:
L_Timers_TMR_Timer1:
L_Timers_TMR_Timer0:
L_end_TMR_Timer:
JR	RA
NOP	
; end of Timers_TMR_Timer
_GetTimer_Values:
LUI	R2, hi_addr(Timers_T0+0)
ORI	R2, R2, lo_addr(Timers_T0+0)
L_end_GetTimer_Values:
JR	RA
NOP	
; end of _GetTimer_Values
