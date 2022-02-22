_main:
JAL	_PerphialSetUp+0
NOP	
EI	R30
L_main0:
J	L_main0
NOP	
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_Timer1Interrupt:
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
ORI	R30, R0, 7168
MTC0	R30, 12, 0
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
LHU	R2, Offset(_tmr+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_tmr+0)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 100
BEQ	R2, R0, L__Timer1Interrupt7
NOP	
J	L_Timer1Interrupt2
NOP	
L__Timer1Interrupt7:
SH	R0, Offset(_tmr+0)(GP)
_LX	
EXT	R2, R2, BitPos(LATB10_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATB10_bit+0), 1
_SX	
L_Timer1Interrupt2:
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
; end of _Timer1Interrupt
_Timer2Interrupt:
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
ORI	R30, R0, 5120
MTC0	R30, 12, 0
LUI	R2, BitMask(T2IF_bit+0)
ORI	R2, R2, BitMask(T2IF_bit+0)
_SX	
LHU	R2, Offset(_tmr_+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_tmr_+0)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 450
BEQ	R2, R0, L__Timer2Interrupt9
NOP	
J	L_Timer2Interrupt3
NOP	
L__Timer2Interrupt9:
SH	R0, Offset(_tmr_+0)(GP)
_LX	
EXT	R2, R2, BitPos(LATB9_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATB9_bit+0), 1
_SX	
L_Timer2Interrupt3:
L_end_Timer2Interrupt:
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
; end of _Timer2Interrupt
_uart2_Rx_interrupt:
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
ORI	R30, R0, 7168
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
JAL	_UART2_Read+0
NOP	
SB	R2, Offset(_uart_rd+0)(GP)
ANDI	R25, R2, 255
JAL	_UART2_Write+0
NOP	
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
L_end_uart2_Rx_interrupt:
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
; end of _uart2_Rx_interrupt
