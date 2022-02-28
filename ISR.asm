_ISR_Init:
LUI	R2, hi_addr(ISR_TMR_System+0)
ORI	R2, R2, lo_addr(ISR_TMR_System+0)
SW	R2, Offset(_TMR_Sys+0)(GP)
LUI	R2, hi_addr(ISR_TMR_Timer+0)
ORI	R2, R2, lo_addr(ISR_TMR_Timer+0)
SW	R2, Offset(_TMR_Tmr+0)(GP)
LUI	R2, hi_addr(ISR_GetUart2Chars+0)
ORI	R2, R2, lo_addr(ISR_GetUart2Chars+0)
SW	R2, Offset(_UART2_Get+0)(GP)
LUI	R2, hi_addr(ISR_GetUart3Chars+0)
ORI	R2, R2, lo_addr(ISR_GetUart3Chars+0)
SW	R2, Offset(_UART3_Get+0)(GP)
LUI	R2, hi_addr(ISR_PutUart3Chars+0)
ORI	R2, R2, lo_addr(ISR_PutUart3Chars+0)
SW	R2, Offset(_UART3_Put+0)(GP)
L_end_ISR_Init:
JR	RA
NOP	
; end of _ISR_Init
_USBInterrupt:
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
JAL	_USB_Interrupt_Proc+0
NOP	
L_end_USBInterrupt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
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
; end of _USBInterrupt
_USBDMAInterrupt:
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
ADDIU	SP, SP, -4
SW	RA, 0(SP)
JAL	_USB_Dma_Interrupt_Proc+0
NOP	
L_end_USBDMAInterrupt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
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
; end of _USBDMAInterrupt
ISR_Timer1Interrupt:
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
; end of ISR_Timer1Interrupt
ISR_TMR_System:
L_end_TMR_System:
JR	RA
NOP	
; end of ISR_TMR_System
ISR_Timer2Interrupt:
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
; end of ISR_Timer2Interrupt
ISR_TMR_Timer:
LW	R5, Offset(ISR_T0+4)(GP)
LW	R4, Offset(ISR_T0+0)(GP)
ADDIU	R2, R4, 1
SLTIU	R3, R2, 1
ADDU	R3, R3, R5
SW	R2, Offset(ISR_T0+0)(GP)
SW	R3, Offset(ISR_T0+4)(GP)
LHU	R2, Offset(ISR_T0+16)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(ISR_T0+16)(GP)
ANDI	R2, R2, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L_ISR_TMR_Timer20
NOP	
J	L_ISR_TMR_Timer0
NOP	
L_ISR_TMR_Timer20:
SH	R0, Offset(ISR_T0+16)(GP)
LBU	R2, Offset(ISR_T0+18)(GP)
ADDIU	R4, R2, 1
SB	R4, Offset(ISR_T0+18)(GP)
_LX	
EXT	R2, R2, BitPos(LATB9_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATB9_bit+0), 1
_SX	
ANDI	R2, R4, 255
SLTIU	R2, R2, 60
BEQ	R2, R0, L_ISR_TMR_Timer21
NOP	
J	L_ISR_TMR_Timer1
NOP	
L_ISR_TMR_Timer21:
SB	R0, Offset(ISR_T0+18)(GP)
LBU	R2, Offset(ISR_T0+19)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(ISR_T0+19)(GP)
L_ISR_TMR_Timer2:
L_ISR_TMR_Timer1:
L_ISR_TMR_Timer0:
L_end_TMR_Timer:
JR	RA
NOP	
; end of ISR_TMR_Timer
_GetTimer_Values:
LUI	R2, hi_addr(ISR_T0+0)
ORI	R2, R2, lo_addr(ISR_T0+0)
L_end_GetTimer_Values:
JR	RA
NOP	
; end of _GetTimer_Values
ISR_uart2_Rx_interrupt:
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
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
L_end_uart2_Rx_interrupt:
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
; end of ISR_uart2_Rx_interrupt
ISR_GetUart2Chars:
ADDIU	SP, SP, -8
SW	RA, 0(SP)
SW	R25, 4(SP)
JAL	_UART2_Read+0
NOP	
SB	R2, Offset(_uart2_rd+0)(GP)
ANDI	R25, R2, 255
JAL	_UART2_Write+0
NOP	
L_end_GetUart2Chars:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 8
JR	RA
NOP	
; end of ISR_GetUart2Chars
ISR_uart3_Rx_interrupt:
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
LUI	R2, BitMask(U3RXIF_bit+0)
ORI	R2, R2, BitMask(U3RXIF_bit+0)
_SX	
LW	R30, Offset(_UART3_Get+0)(GP)
JALR	RA, R30
NOP	
LW	R30, Offset(_UART3_Put+0)(GP)
JALR	RA, R30
NOP	
L_end_uart3_Rx_interrupt:
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
; end of ISR_uart3_Rx_interrupt
ISR_GetUart3Chars:
L_ISR_GetUart3Chars4:
LBU	R2, Offset(U3STAbits+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L_ISR_GetUart3Chars28
NOP	
J	L_ISR_GetUart3Chars5
NOP	
L_ISR_GetUart3Chars28:
LH	R3, Offset(ISR_ringBuffB+0)(GP)
LUI	R2, hi_addr(_ringBufferB+0)
ORI	R2, R2, lo_addr(_ringBufferB+0)
ADDU	R3, R2, R3
LW	R2, Offset(U3RXREG+0)(GP)
SB	R2, 0(R3)
LH	R2, Offset(ISR_ringBuffB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(ISR_ringBuffB+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 1024
BEQ	R2, R0, L_ISR_GetUart3Chars29
NOP	
J	L_ISR_GetUart3Chars6
NOP	
L_ISR_GetUart3Chars29:
SH	R0, Offset(ISR_ringBuffB+0)(GP)
L_ISR_GetUart3Chars6:
J	L_ISR_GetUart3Chars4
NOP	
L_ISR_GetUart3Chars5:
L_end_GetUart3Chars:
JR	RA
NOP	
; end of ISR_GetUart3Chars
ISR_uart3_Tx_interrupt:
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
LUI	R2, BitMask(U3TXIF_bit+0)
ORI	R2, R2, BitMask(U3TXIF_bit+0)
_SX	
L_ISR_uart3_Tx_interrupt7:
LBU	R2, Offset(U3STAbits+1)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L_ISR_uart3_Tx_interrupt31
NOP	
J	L_ISR_uart3_Tx_interrupt8
NOP	
L_ISR_uart3_Tx_interrupt31:
J	L_ISR_uart3_Tx_interrupt7
NOP	
L_ISR_uart3_Tx_interrupt8:
L_end_uart3_Tx_interrupt:
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
; end of ISR_uart3_Tx_interrupt
ISR_PutUart3Chars:
L_ISR_PutUart3Chars9:
LH	R3, Offset(ISR_ringBuffB+0)(GP)
LH	R2, Offset(ISR_ringBuffB+2)(GP)
BNE	R2, R3, L_ISR_PutUart3Chars34
NOP	
J	L_ISR_PutUart3Chars10
NOP	
L_ISR_PutUart3Chars34:
LH	R3, Offset(ISR_ringBuffB+0)(GP)
LH	R2, Offset(ISR_ringBuffB+2)(GP)
BEQ	R2, R3, L_ISR_PutUart3Chars35
NOP	
J	L_ISR_PutUart3Chars11
NOP	
L_ISR_PutUart3Chars35:
J	L_ISR_PutUart3Chars10
NOP	
L_ISR_PutUart3Chars11:
LH	R3, Offset(ISR_ringBuffB+2)(GP)
LUI	R2, hi_addr(_ringBufferB+0)
ORI	R2, R2, lo_addr(_ringBufferB+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SW	R2, Offset(U3TXREG+0)(GP)
LH	R2, Offset(ISR_ringBuffB+2)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(ISR_ringBuffB+2)(GP)
SEH	R2, R2
SLTI	R2, R2, 1024
BEQ	R2, R0, L_ISR_PutUart3Chars36
NOP	
J	L_ISR_PutUart3Chars12
NOP	
L_ISR_PutUart3Chars36:
SH	R0, Offset(ISR_ringBuffB+2)(GP)
L_ISR_PutUart3Chars12:
J	L_ISR_PutUart3Chars9
NOP	
L_ISR_PutUart3Chars10:
L_end_PutUart3Chars:
JR	RA
NOP	
; end of ISR_PutUart3Chars
