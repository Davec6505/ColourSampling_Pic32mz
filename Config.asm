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
LUI	R26, hi_addr(_writebuff+0)
ORI	R26, R26, lo_addr(_writebuff+0)
LUI	R25, hi_addr(_readbuff+0)
ORI	R25, R25, lo_addr(_readbuff+0)
JAL	_HID_Enable+0
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
ORI	R27, R0, 1
MOVZ	R26, R0, R0
MOVZ	R25, R0, R0
JAL	_PPS_Mapping_NoLock+0
NOP	
ORI	R27, R0, 19
ORI	R26, R0, 1
ORI	R25, R0, 16
JAL	_PPS_Mapping_NoLock+0
NOP	
JAL	_Lock_IOLOCK+0
NOP	
JAL	_ISR_Init+0
NOP	
JAL	_InitTimer1+0
NOP	
JAL	_InitTimer2+0
NOP	
LUI	R2, BitMask(URXISEL0_bit+0)
ORI	R2, R2, BitMask(URXISEL0_bit+0)
_SX	
LUI	R2, BitMask(URXISEL1_bit+0)
ORI	R2, R2, BitMask(URXISEL1_bit+0)
_SX	
LUI	R2, BitMask(UTXISEL0_bit+0)
ORI	R2, R2, BitMask(UTXISEL0_bit+0)
_SX	
LUI	R2, BitMask(UTXISEL1_bit+0)
ORI	R2, R2, BitMask(UTXISEL1_bit+0)
_SX	
JAL	_Uart2InterruptSetup+0
NOP	
JAL	_Uart3InterruptSetup+0
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
_HID_Setp:
LW	R2, Offset(IEC4SET+0)(GP)
ORI	R2, R2, 48
SW	R2, Offset(IEC4SET+0)(GP)
LW	R2, Offset(IPC33SET+0)(GP)
ORI	R2, R2, 28
SW	R2, Offset(IPC33SET+0)(GP)
LW	R2, Offset(IPC33CLR+0)(GP)
ORI	R2, R2, 3
SW	R2, Offset(IPC33CLR+0)(GP)
LW	R2, Offset(IPC33SET+0)(GP)
ORI	R2, R2, 7168
SW	R2, Offset(IPC33SET+0)(GP)
LW	R2, Offset(IPC33CLR+0)(GP)
ORI	R2, R2, 768
SW	R2, Offset(IPC33CLR+0)(GP)
L_end_HID_Setp:
JR	RA
NOP	
; end of _HID_Setp
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
LUI	R2, BitMask(URXISEL0_bit+0)
ORI	R2, R2, BitMask(URXISEL0_bit+0)
_SX	
LUI	R2, BitMask(URXISEL1_bit+0)
ORI	R2, R2, BitMask(URXISEL1_bit+0)
_SX	
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
ORI	R2, R0, 49152
SH	R2, Offset(U3STAbits+4)(GP)
ORI	R2, R0, 192
SB	R2, Offset(U3STAbits+4)(GP)
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
_set_performance_mode:
DI	R30
LUI	R2, 43673
ORI	R2, R2, 26197
SW	R2, Offset(SYSKEY+0)(GP)
LUI	R2, 21862
ORI	R2, R2, 39338
SW	R2, Offset(SYSKEY+0)(GP)
ORI	R2, R0, 127
SB	R2, Offset(PB1DIVbits+4)(GP)
LUI	R2, BitMask(UEN0_bit+0)
ORI	R2, R2, BitMask(UEN0_bit+0)
_SX	
LUI	R2, BitMask(UEN1_bit+0)
ORI	R2, R2, BitMask(UEN1_bit+0)
_SX	
ORI	R2, R0, 32768
SWR	R2, Offset(PB2DIVbits+8)(GP)
SWL	R2, Offset(PB2DIVbits+11)(GP)
L_set_performance_mode4:
LBU	R2, Offset(PB2DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode23
NOP	
J	L_set_performance_mode5
NOP	
L__set_performance_mode23:
J	L_set_performance_mode4
NOP	
L_set_performance_mode5:
ORI	R3, R0, 1
LBU	R2, Offset(PB2DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB2DIVbits+0)(GP)
ORI	R2, R0, 32768
SWR	R2, Offset(PB3DIVbits+8)(GP)
SWL	R2, Offset(PB3DIVbits+11)(GP)
L_set_performance_mode6:
LBU	R2, Offset(PB3DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode24
NOP	
J	L_set_performance_mode7
NOP	
L__set_performance_mode24:
J	L_set_performance_mode6
NOP	
L_set_performance_mode7:
ORI	R3, R0, 3
LBU	R2, Offset(PB3DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB3DIVbits+0)(GP)
ORI	R2, R0, 32768
SWR	R2, Offset(PB4DIVbits+8)(GP)
SWL	R2, Offset(PB4DIVbits+11)(GP)
L_set_performance_mode8:
LBU	R2, Offset(PB4DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode25
NOP	
J	L_set_performance_mode9
NOP	
L__set_performance_mode25:
J	L_set_performance_mode8
NOP	
L_set_performance_mode9:
ORI	R2, R0, 127
SB	R2, Offset(PB4DIVbits+4)(GP)
ORI	R2, R0, 32768
SWR	R2, Offset(PB5DIVbits+8)(GP)
SWL	R2, Offset(PB5DIVbits+11)(GP)
L_set_performance_mode10:
LBU	R2, Offset(PB5DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode26
NOP	
J	L_set_performance_mode11
NOP	
L__set_performance_mode26:
J	L_set_performance_mode10
NOP	
L_set_performance_mode11:
ORI	R3, R0, 1
LBU	R2, Offset(PB5DIVbits+0)(GP)
INS	R2, R3, 0, 7
SB	R2, Offset(PB5DIVbits+0)(GP)
ORI	R2, R0, 32768
SWR	R2, Offset(PB7DIVbits+8)(GP)
SWL	R2, Offset(PB7DIVbits+11)(GP)
L_set_performance_mode12:
LBU	R2, Offset(PB7DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode27
NOP	
J	L_set_performance_mode13
NOP	
L__set_performance_mode27:
J	L_set_performance_mode12
NOP	
L_set_performance_mode13:
ORI	R2, R0, 127
SB	R2, Offset(PB7DIVbits+4)(GP)
ORI	R2, R0, 32768
SWR	R2, Offset(PB8DIVbits+8)(GP)
SWL	R2, Offset(PB8DIVbits+11)(GP)
L_set_performance_mode14:
LBU	R2, Offset(PB8DIVbits+1)(GP)
EXT	R2, R2, 3, 1
BEQ	R2, R0, L__set_performance_mode28
NOP	
J	L_set_performance_mode15
NOP	
L__set_performance_mode28:
J	L_set_performance_mode14
NOP	
L_set_performance_mode15:
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
