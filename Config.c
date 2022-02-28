#include "Config.h"


void PerphialSetUp(){

    ANSELB = 0X0000;
    TRISB10_bit = 0;
    TRISB9_bit  = 0;
    set_performance_mode();
   // HID_Setp();

    HID_Enable(readbuff, writebuff);
    Unlock_IOLOCK();
    PPS_Mapping_NoLock(_RPB2, _OUTPUT, _U2TX);   // Sets pin PORTC.B2 to be Output and maps UART1 Transmit to it
    PPS_Mapping_NoLock(_RPB0, _INPUT, _U2RX);    // Sets pin PORTC.B0 to be Input and maps UART1 Receive to it
    PPS_Mapping_NoLock(_RPD2, _OUTPUT, _U3TX);   // Sets pin PORTC.B2 to be Output and maps UART1 Transmit to it
    PPS_Mapping_NoLock(_RPD3, _INPUT, _U3RX);    // Sets pin PORTC.B0 to be Input and maps UART1 Receive to it
    Lock_IOLOCK();
  //Ensure that B2CLK is used UEN<1:0>
    ISR_Init();
    InitTimer1();
    InitTimer2();
    
    //Interrupt delect mof=de 11 = do not use
    URXISEL0_bit       = 1;
    URXISEL1_bit       = 1;
    UTXISEL0_bit       = 1;
    UTXISEL1_bit       = 1;
    
    
    Uart2InterruptSetup();
    Uart3InterruptSetup();

    
}

void HID_Setp(){
// enable usb general and dma interrupts
    IEC4SET |= 3ul << 4;
    // set priority 7; subpriority 0 for usb general interrupt
    IPC33SET |= 7ul << 2;
    IPC33CLR |= 3;
    // set priority 7; subpriority 0 for usb dma interrupt
    IPC33SET |= 7ul << 10;
    IPC33CLR |= 3ul << 8;

}

//Place/Copy this part in declaration section
void InitTimer1(){
  T1CON                 = 0x8000;
  //Priority      7
  T1IP0_bit             = 1;
  T1IP1_bit             = 1;
  T1IP2_bit             = 1;
  //Subpriority   0
  T1IS0_bit             = 0;
  T1IS1_bit             = 0;
  T1IF_bit              = 0;
  T1IE_bit              = 1;
  PR1                   = 50000;
  TMR1                  = 0;
}

void InitTimer2(){
  T2CON             = 0x8000;
  //Priority     7
  T2IP0_bit         = 1;
  T2IP1_bit         = 1;
  T2IP2_bit         = 1;
  //SubPriotity  1
  T2IS0_bit         = 1;
  T2IS1_bit         = 0;
  T2IF_bit          = 0;
  T2IE_bit          = 1;
  PR2               = 50000;
  TMR2              = 0;
}


void Uart2InterruptSetup(){

    UART2_Init_Advanced(115200, 200000, _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
    //UART2_Init(13000);       // Initialize UART module at 9600 bps
    UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle); // set UART2 active

    Delay_ms(100);             // Wait for UART module to stabilize
    //LPBACK_bit = 1;
    URXISEL0_bit       = 0;
    URXISEL1_bit       = 1;

    // Set priority 6
    U2RXIP0_bit        = 0;
    U2RXIP1_bit        = 1;
    U2RXIP2_bit        = 1;
     // Set Sub priority
    U3RXIS0_bit        = 1;
    U3RXIS1_bit        = 1;
    
    URXISEL1_U2STA_bit = 0;
    IEC4.B18           = 0;    // Enable UART2 RX interrupt
    U2RXIF_bit = 0;            // Ensure interrupt is not pending
}

void Uart3InterruptSetup(){

    UART3_Init_Advanced(115200, 200000, _UART_HIGH_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
    //UART3_Init(115200);       // Initialize UART module at 9600 bps
    UART_Set_Active(&UART3_Read, &UART3_Write, &UART3_Data_Ready, &UART3_Tx_Idle); // set UART2 active

    Delay_ms(100);             // Wait for UART module to stabilize
    
    //4DEEP FIFO 2=3/4 1=FULL 0=1BYTE
    U3STAbits.UTXISEL  = 0;
    U3STAbits.URXISEL  = 0;

    LPBACK_bit = 1;

    // Set priority 6
    U3RXIP0_bit        = 0;
    U3RXIP1_bit        = 1;
    U3RXIP2_bit        = 1;
    // Set Sub priority
    U3RXIS0_bit        = 0;
    U3RXIS1_bit        = 1;
    URXISEL1_U3STA_bit = 0;
    
    IEC4.B30           = 1;    // Enable UART3 RX interrupt
    U3RXIF_bit         = 0;    // Ensure interrupt is not pending
}

void set_performance_mode()
{
    // Unlock Sequence
    DI(); // Disable all interrupts
    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;


    // PB1DIV
    // Peripheral Bus 1 cannot be turned off, so there's no need to turn it on
    PB1DIVbits.PBDIV = 0; // Peripheral Bus 1 Clock Divisor Control (PBCLK1 is SYSCLK divided by 1)  //--divided by 2--)

    // PB2DIV    UART MODULE +
    UEN0_bit = 1;
    UEN1_bit = 1;
    PB2DIVbits.ON    = 1; // Peripheral Bus 2 Output Clock Enable (Output clock is enabled)
    while (!PB2DIVbits.PBDIVRDY); // Wait until it is ready to write to
    PB2DIVbits.PBDIV = 1; // Peripheral Bus 2 Clock Divisor Control (PBCLK2 is SYSCLK divided by 2)=>(200/2)/1=100mhz

    // PB3DIV    TIMERS +
    PB3DIVbits.ON    = 1; // Peripheral Bus 3 Output Clock Enable (Output clock is enabled)
    while (!PB3DIVbits.PBDIVRDY); // Wait until it is ready to write to
    PB3DIVbits.PBDIV = 3; // Peripheral Bus 3 Clock Divisor Control (PBCLK3 is SYSCLK divided by 2)/2 = 50mhz

    // PB4DIV
    PB4DIVbits.ON = 1; // Peripheral Bus 4 Output Clock Enable (Output clock is enabled)
    while (!PB4DIVbits.PBDIVRDY); // Wait until it is ready to write to
    PB4DIVbits.PBDIV = 0; // Peripheral Bus 4 Clock Divisor Control (PBCLK4 is SYSCLK divided 1)

    // PB5DIV
    PB5DIVbits.ON = 1; // Peripheral Bus 5 Output Clock Enable (Output clock is enabled)
    while (!PB5DIVbits.PBDIVRDY); // Wait until it is ready to write to
    PB5DIVbits.PBDIV = 1; // Peripheral Bus 5 Clock Divisor Control (PBCLK5 is SYSCLK divided by 2)
    
    // PB7DIV
    PB7DIVbits.ON = 1; // Peripheral Bus 7 Output Clock Enable (Output clock is enabled)
    while (!PB7DIVbits.PBDIVRDY); // Wait until it is ready to write to
    PB7DIVbits.PBDIV = 0; // Peripheral Bus 7 Clock Divisor Control (PBCLK7 is SYSCLK divided by 1)

    // PB8DIV
    PB8DIVbits.ON = 1; // Peripheral Bus 8 Output Clock Enable (Output clock is enabled)
    while (!PB8DIVbits.PBDIVRDY); // Wait until it is ready to write to
    PB8DIVbits.PBDIV = 1; // Peripheral Bus 8 Clock Divisor Control (PBCLK8 is SYSCLK divided by 2)

    // PRECON - Set up prefetch
    PRECONbits.PFMSECEN = 0; // Flash SEC Interrupt Enable (Do not generate an interrupt when the PFMSEC bit is set)
    PRECONbits.PREFEN = 0b11; // Predictive Prefetch Enable (Enable predictive prefetch for any address)
    PRECONbits.PFMWS = 0b010; // PFM Access Time Defined in Terms of SYSCLK Wait States (Two wait states)

    // Set up caching
    /*
    cp0 = _mfc0(16, 0);
    cp0 &= ~0x07;
    cp0 |= 0b011; // K0 = Cacheable, non-coherent, write-back, write allocate
    _mtc0(16, 0, cp0);
   */
   
    // Lock Sequence
    SYSKEY = 0x33333333;

}