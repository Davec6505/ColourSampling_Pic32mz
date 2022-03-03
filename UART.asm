_UART_Init:
LUI	R2, hi_addr(UART_GetUart2Chars+0)
ORI	R2, R2, lo_addr(UART_GetUart2Chars+0)
SW	R2, Offset(_UART2_Get+0)(GP)
LUI	R2, hi_addr(UART_GetUart3Chars+0)
ORI	R2, R2, lo_addr(UART_GetUart3Chars+0)
SW	R2, Offset(_UART3_Get+0)(GP)
LUI	R2, hi_addr(UART_PutUart3Chars+0)
ORI	R2, R2, lo_addr(UART_PutUart3Chars+0)
SW	R2, Offset(_UART3_Put+0)(GP)
L_end_UART_Init:
JR	RA
NOP	
; end of _UART_Init
_Uart2InterruptSetup:
ADDIU	SP, SP, -20
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 1
LUI	R26, 3
ORI	R26, R26, 3392
LUI	R25, 1
ORI	R25, R25, 49664
ADDIU	SP, SP, -4
SB	R0, 0(SP)
JAL	_UART2_Init_Advanced+0
NOP	
ADDIU	SP, SP, 4
LUI	R28, hi_addr(_UART2_Tx_Idle+0)
ORI	R28, R28, lo_addr(_UART2_Tx_Idle+0)
LUI	R27, hi_addr(_UART2_Data_Ready+0)
ORI	R27, R27, lo_addr(_UART2_Data_Ready+0)
LUI	R26, hi_addr(_UART2_Write+0)
ORI	R26, R26, lo_addr(_UART2_Write+0)
LUI	R25, hi_addr(_UART2_Read+0)
ORI	R25, R25, lo_addr(_UART2_Read+0)
JAL	_UART_Set_Active+0
NOP	
LUI	R24, 101
ORI	R24, R24, 47530
L_Uart2InterruptSetup0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Uart2InterruptSetup0
NOP	
LUI	R2, BitMask(U2RXIP0_bit+0)
ORI	R2, R2, BitMask(U2RXIP0_bit+0)
_SX	
LUI	R2, BitMask(U2RXIP1_bit+0)
ORI	R2, R2, BitMask(U2RXIP1_bit+0)
_SX	
LUI	R2, BitMask(U2RXIP2_bit+0)
ORI	R2, R2, BitMask(U2RXIP2_bit+0)
_SX	
LUI	R2, BitMask(U3RXIS0_bit+0)
ORI	R2, R2, BitMask(U3RXIS0_bit+0)
_SX	
LUI	R2, BitMask(U3RXIS1_bit+0)
ORI	R2, R2, BitMask(U3RXIS1_bit+0)
_SX	
LUI	R2, BitMask(URXISEL1_U2STA_bit+0)
ORI	R2, R2, BitMask(URXISEL1_U2STA_bit+0)
_SX	
LUI	R2, 4
SW	R2, Offset(IEC4+4)(GP)
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
L_end_Uart2InterruptSetup:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Uart2InterruptSetup
_Uart3InterruptSetup:
ADDIU	SP, SP, -20
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 2
LUI	R26, 3
ORI	R26, R26, 3392
LUI	R25, 1
ORI	R25, R25, 49664
ADDIU	SP, SP, -4
SB	R0, 0(SP)
JAL	_UART3_Init_Advanced+0
NOP	
ADDIU	SP, SP, 4
LUI	R28, hi_addr(_UART3_Tx_Idle+0)
ORI	R28, R28, lo_addr(_UART3_Tx_Idle+0)
LUI	R27, hi_addr(_UART3_Data_Ready+0)
ORI	R27, R27, lo_addr(_UART3_Data_Ready+0)
LUI	R26, hi_addr(_UART3_Write+0)
ORI	R26, R26, lo_addr(_UART3_Write+0)
LUI	R25, hi_addr(_UART3_Read+0)
ORI	R25, R25, lo_addr(_UART3_Read+0)
JAL	_UART_Set_Active+0
NOP	
LUI	R24, 101
ORI	R24, R24, 47530
L_Uart3InterruptSetup2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_Uart3InterruptSetup2
NOP	
LUI	R2, BitMask(LPBACK_bit+0)
ORI	R2, R2, BitMask(LPBACK_bit+0)
_SX	
LUI	R2, BitMask(U3RXIP0_bit+0)
ORI	R2, R2, BitMask(U3RXIP0_bit+0)
_SX	
LUI	R2, BitMask(U3RXIP1_bit+0)
ORI	R2, R2, BitMask(U3RXIP1_bit+0)
_SX	
LUI	R2, BitMask(U3RXIP2_bit+0)
ORI	R2, R2, BitMask(U3RXIP2_bit+0)
_SX	
LUI	R2, BitMask(U3RXIS0_bit+0)
ORI	R2, R2, BitMask(U3RXIS0_bit+0)
_SX	
LUI	R2, BitMask(U3RXIS1_bit+0)
ORI	R2, R2, BitMask(U3RXIS1_bit+0)
_SX	
ORI	R2, R0, 49152
SH	R2, Offset(U3STAbits+4)(GP)
ORI	R2, R0, 192
SB	R2, Offset(U3STAbits+4)(GP)
ORI	R25, R0, 2
JAL	_Enable_Uart3_Interrupts+0
NOP	
LUI	R2, BitMask(URXISEL1_U3STA_bit+0)
ORI	R2, R2, BitMask(URXISEL1_U3STA_bit+0)
_SX	
LUI	R2, 16384
SW	R2, Offset(IEC4+8)(GP)
LUI	R2, BitMask(U3RXIF_bit+0)
ORI	R2, R2, BitMask(U3RXIF_bit+0)
_SX	
L_end_Uart3InterruptSetup:
LW	R28, 16(SP)
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 20
JR	RA
NOP	
; end of _Uart3InterruptSetup
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
UART_uart2_Rx_interrupt:
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
; end of UART_uart2_Rx_interrupt
UART_GetUart2Chars:
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
; end of UART_GetUart2Chars
_Enable_Uart3_Interrupts:
ANDI	R3, R25, 1
_LX	
INS	R2, R3, BitPos(U3TXIE_bit+0), 1
_SX	
ANDI	R2, R25, 255
SRL	R2, R2, 1
ANDI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(U3RXIE_bit+0), 1
_SX	
L_end_Enable_Uart3_Interrupts:
JR	RA
NOP	
; end of _Enable_Uart3_Interrupts
UART_uart3_Rx_interrupt:
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
; end of UART_uart3_Rx_interrupt
UART_GetUart3Chars:
L_UART_GetUart3Chars4:
LBU	R2, Offset(U3STAbits+0)(GP)
EXT	R2, R2, 0, 1
BNE	R2, R0, L_UART_GetUart3Chars31
NOP	
J	L_UART_GetUart3Chars5
NOP	
L_UART_GetUart3Chars31:
LH	R3, Offset(UART_ringBuffB+0)(GP)
LUI	R2, hi_addr(_ringBufferB+0)
ORI	R2, R2, lo_addr(_ringBufferB+0)
ADDU	R3, R2, R3
LW	R2, Offset(U3RXREG+0)(GP)
SB	R2, 0(R3)
LH	R2, Offset(UART_ringBuffB+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(UART_ringBuffB+0)(GP)
SEH	R2, R2
SLTI	R2, R2, 1024
BEQ	R2, R0, L_UART_GetUart3Chars32
NOP	
J	L_UART_GetUart3Chars6
NOP	
L_UART_GetUart3Chars32:
SH	R0, Offset(UART_ringBuffB+0)(GP)
L_UART_GetUart3Chars6:
J	L_UART_GetUart3Chars4
NOP	
L_UART_GetUart3Chars5:
L_end_GetUart3Chars:
JR	RA
NOP	
; end of UART_GetUart3Chars
UART_uart3_Tx_interrupt:
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
L_UART_uart3_Tx_interrupt7:
LBU	R2, Offset(U3STAbits+1)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L_UART_uart3_Tx_interrupt34
NOP	
J	L_UART_uart3_Tx_interrupt8
NOP	
L_UART_uart3_Tx_interrupt34:
J	L_UART_uart3_Tx_interrupt7
NOP	
L_UART_uart3_Tx_interrupt8:
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
; end of UART_uart3_Tx_interrupt
UART_PutUart3Chars:
L_UART_PutUart3Chars9:
LH	R3, Offset(UART_ringBuffB+0)(GP)
LH	R2, Offset(UART_ringBuffB+2)(GP)
BNE	R2, R3, L_UART_PutUart3Chars37
NOP	
J	L_UART_PutUart3Chars10
NOP	
L_UART_PutUart3Chars37:
L_UART_PutUart3Chars11:
LBU	R2, Offset(U3STAbits+1)(GP)
EXT	R2, R2, 0, 1
BEQ	R2, R0, L_UART_PutUart3Chars38
NOP	
J	L_UART_PutUart3Chars12
NOP	
L_UART_PutUart3Chars38:
J	L_UART_PutUart3Chars11
NOP	
L_UART_PutUart3Chars12:
LH	R3, Offset(UART_ringBuffB+2)(GP)
LUI	R2, hi_addr(_ringBufferB+0)
ORI	R2, R2, lo_addr(_ringBufferB+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SW	R2, Offset(U3TXREG+0)(GP)
LH	R3, Offset(UART_ringBuffB+0)(GP)
LH	R2, Offset(UART_ringBuffB+2)(GP)
BEQ	R2, R3, L_UART_PutUart3Chars39
NOP	
J	L_UART_PutUart3Chars13
NOP	
L_UART_PutUart3Chars39:
J	L_UART_PutUart3Chars10
NOP	
L_UART_PutUart3Chars13:
LH	R2, Offset(UART_ringBuffB+2)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(UART_ringBuffB+2)(GP)
SEH	R2, R2
SLTI	R2, R2, 1024
BEQ	R2, R0, L_UART_PutUart3Chars40
NOP	
J	L_UART_PutUart3Chars14
NOP	
L_UART_PutUart3Chars40:
SH	R0, Offset(UART_ringBuffB+2)(GP)
L_UART_PutUart3Chars14:
J	L_UART_PutUart3Chars9
NOP	
L_UART_PutUart3Chars10:
L_end_PutUart3Chars:
JR	RA
NOP	
; end of UART_PutUart3Chars
_ReadBack_RingBufferB:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
LW	R30, Offset(_UART3_Put+0)(GP)
JALR	RA, R30
NOP	
L_end_ReadBack_RingBufferB:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _ReadBack_RingBufferB
_GetDiffence_In_Pointers:
J	L_GetDiffence_In_Pointers15
NOP	
L_GetDiffence_In_Pointers17:
LH	R3, Offset(UART_ringBuffA+2)(GP)
LH	R2, Offset(UART_ringBuffA+0)(GP)
SUBU	R2, R2, R3
SH	R2, Offset(GetDiffence_In_Pointers_diff_L0+0)(GP)
J	L_GetDiffence_In_Pointers16
NOP	
L_GetDiffence_In_Pointers18:
LH	R3, Offset(UART_ringBuffB+2)(GP)
LH	R2, Offset(UART_ringBuffB+0)(GP)
SUBU	R2, R2, R3
SH	R2, Offset(GetDiffence_In_Pointers_diff_L0+0)(GP)
J	L_GetDiffence_In_Pointers16
NOP	
L_GetDiffence_In_Pointers19:
SH	R0, Offset(GetDiffence_In_Pointers_diff_L0+0)(GP)
J	L_GetDiffence_In_Pointers16
NOP	
L_GetDiffence_In_Pointers15:
ANDI	R2, R25, 255
BNE	R2, R0, L__GetDiffence_In_Pointers44
NOP	
J	L_GetDiffence_In_Pointers17
NOP	
L__GetDiffence_In_Pointers44:
ANDI	R3, R25, 255
ORI	R2, R0, 1
BNE	R3, R2, L__GetDiffence_In_Pointers46
NOP	
J	L_GetDiffence_In_Pointers18
NOP	
L__GetDiffence_In_Pointers46:
J	L_GetDiffence_In_Pointers19
NOP	
L_GetDiffence_In_Pointers16:
LH	R2, Offset(GetDiffence_In_Pointers_diff_L0+0)(GP)
L_end_GetDiffence_In_Pointers:
JR	RA
NOP	
; end of _GetDiffence_In_Pointers
_PrintHandler:
ADDIU	SP, SP, -4
SW	RA, 0(SP)
ANDI	R25, R25, 255
JAL	_UART3_Write+0
NOP	
L_end_PrintHandler:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
JR	RA
NOP	
; end of _PrintHandler
