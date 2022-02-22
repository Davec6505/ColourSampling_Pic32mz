_PerphialSetUp:
ADDIU	SP, SP, -16
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R0, Offset(ANSELB+0)(GP)
LUI	R2, BitMask(TRISB10_bit+0)
ORI	R2, R2, BitMask(TRISB10_bit+0)
_SX	
LUI	R2, BitMask(TRISB9_bit+0)
ORI	R2, R2, BitMask(TRISB9_bit+0)
_SX	
JAL	_set_performance_mode+0
NOP	
JAL	_Unlock_IOLOCK+0
NOP	
ORI	R27, R0, 2
MOVZ	R26, R0, R0
ORI	R25, R0, 55
JAL	_PPS_Mapping_NoLock+0
NOP	
ORI	R27, R0, 32
ORI	R26, R0, 1
ORI	R25, R0, 37
JAL	_PPS_Mapping_NoLock+0
NOP	
JAL	_Lock_IOLOCK+0
NOP	
JAL	_InitTimer1+0
NOP	
JAL	_InitTimer2+0
NOP	
L_end_PerphialSetUp:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _PerphialSetUp
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
LUI	R2, BitMask(T2IF_bit+0)
ORI	R2, R2, BitMask(T2IF_bit+0)
_SX	
LUI	R2, BitMask(T2IE_bit+0)
ORI	R2, R2, BitMask(T2IE_bit+0)
_SX	
ORI	R2, R0, 10000
SW	R2, Offset(PR2+0)(GP)
SW	R0, Offset(TMR2+0)(GP)
L_end_InitTimer2:
JR	RA
NOP	
; end of _InitTimer2
_Uart2InterruptSetup:
ADDIU	SP, SP, -20
SW	RA, 0(SP)
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
SW	R28, 16(SP)
ORI	R25, R0, 13000
JAL	_UART2_Init+0
NOP	
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
LUI	R2, BitMask(URXISEL0_bit+0)
ORI	R2, R2, BitMask(URXISEL0_bit+0)
_SX	
LUI	R2, BitMask(URXISEL1_bit+0)
ORI	R2, R2, BitMask(URXISEL1_bit+0)
_SX	
LUI	R2, 4
SW	R2, Offset(IEC4+8)(GP)
LUI	R2, BitMask(U2RXIP0_bit+0)
ORI	R2, R2, BitMask(U2RXIP0_bit+0)
_SX	
LUI	R2, BitMask(U2RXIP1_bit+0)
ORI	R2, R2, BitMask(U2RXIP1_bit+0)
_SX	
LUI	R2, BitMask(U2RXIP2_bit+0)
ORI	R2, R2, BitMask(U2RXIP2_bit+0)
_SX	
LUI	R2, BitMask(URXISEL1_U2STA_bit+0)
ORI	R2, R2, BitMask(URXISEL1_U2STA_bit+0)
_SX	
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
_set_USB_Interrupt:
LW	R2, Offset(IEC4SET+0)(GP)
ORI	R2, R2, 48
SW	R2, Offset(IEC4SET+0)(GP)
LW	R2, Offset(IFS4CLR+0)(GP)
ORI	R2, R2, 48
SW	R2, Offset(IFS4CLR+0)(GP)
LW	R2, Offset(IPC33SET+0)(GP)
ORI	R2, R2, 20
SW	R2, Offset(IPC33SET+0)(GP)
LW	R2, Offset(IPC33CLR+0)(GP)
ORI	R2, R2, 3
SW	R2, Offset(IPC33CLR+0)(GP)
LW	R2, Offset(IPC33SET+0)(GP)
ORI	R2, R2, 5120
SW	R2, Offset(IPC33SET+0)(GP)
LW	R2, Offset(IPC33CLR+0)(GP)
ORI	R2, R2, 768
SW	R2, Offset(IPC33CLR+0)(GP)
L_end_set_USB_Interrupt:
JR	RA
NOP	
; end of _set_USB_Interrupt
_set_performance_mode:
DI	R30
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(SYSKEY+0)(GP)
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(SYSKEY+0)(GP)
ORI	R3, R0, 1
LBU	R2, Offset(PB1DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB1DIVbits+0)(GP)
LUI	R2, BitMask(UEN0_bit+0)
ORI	R2, R2, BitMask(UEN0_bit+0)
_SX	
LUI	R2, BitMask(UEN1_bit+0)
ORI	R2, R2, BitMask(UEN1_bit+0)
_SX	
ORI	R4, R0, 32768
SWR	R4, Offset(PB2DIVbits+8)(GP)
SWL	R4, Offset(PB2DIVbits+11)(GP)
ORI	R3, R0, 10
LBU	R2, Offset(PB2DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB2DIVbits+0)(GP)
SWR	R4, Offset(PB3DIVbits+8)(GP)
SWL	R4, Offset(PB3DIVbits+11)(GP)
ORI	R3, R0, 1
LBU	R2, Offset(PB3DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB3DIVbits+0)(GP)
SWR	R4, Offset(PB4DIVbits+8)(GP)
SWL	R4, Offset(PB4DIVbits+11)(GP)
L_set_performance_mode2:
LBU	R2, Offset(PB4DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode10
NOP	
J	L_set_performance_mode3
NOP	
L__set_performance_mode10:
J	L_set_performance_mode2
NOP	
L_set_performance_mode3:
ORI	R5, R0, 127
SB	R5, Offset(PB4DIVbits+4)(GP)
ORI	R4, R0, 32768
SWR	R4, Offset(PB5DIVbits+8)(GP)
SWL	R4, Offset(PB5DIVbits+11)(GP)
ORI	R3, R0, 1
LBU	R2, Offset(PB5DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB5DIVbits+0)(GP)
SWR	R4, Offset(PB7DIVbits+8)(GP)
SWL	R4, Offset(PB7DIVbits+11)(GP)
SB	R5, Offset(PB7DIVbits+4)(GP)
SWR	R4, Offset(PB8DIVbits+8)(GP)
SWL	R4, Offset(PB8DIVbits+11)(GP)
ORI	R3, R0, 1
LBU	R2, Offset(PB8DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB8DIVbits+0)(GP)
LUI	R2, 1024
SW	R2, Offset(PRECONbits+4)(GP)
ORI	R2, R0, 48
SB	R2, Offset(PRECONbits+8)(GP)
ORI	R3, R0, 2
LBU	R2, Offset(PRECONbits+0)(GP)
INS	R2, R3, 0, 3
SB	R2, Offset(PRECONbits+0)(GP)
LUI	R2, 13107
ORI	R2, R2, 13107
SW	R2, Offset(SYSKEY+0)(GP)
L_end_set_performance_mode:
JR	RA
NOP	
; end of _set_performance_mode
