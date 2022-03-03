#include "UART.h"

void (*UART2_Get)();
void (*UART2_Put)();
void (*UART3_Get)();
void (*UART3_Put)();

static RingBuffer ringBuffA;
static RingBuffer ringBuffB;

char ringBufferA[1024];
char ringBufferB[1024];


void UART_Init(){
  UART2_Get = &GetUart2Chars;
  UART3_Get = &GetUart3Chars;
  UART3_Put = &PutUart3Chars;
}

void Uart2InterruptSetup(){

    UART2_Init_Advanced(115200, 200000, _UART_LOW_SPEED, _UART_8BIT_NOPARITY, _UART_ONE_STOPBIT);
    //UART2_Init(13000);       // Initialize UART module at 9600 bps
    UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle); // set UART2 active

    Delay_ms(100);             // Wait for UART module to stabilize
    //LPBACK_bit = 1;

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

    LPBACK_bit = 0;

    // Set priority 6
    U3RXIP0_bit        = 0;
    U3RXIP1_bit        = 1;
    U3RXIP2_bit        = 1;
    // Set Sub priority
    U3RXIS0_bit        = 0;
    U3RXIS1_bit        = 1;

    //4DEEP FIFO 2=3/4 1=FULL 0=1BYTE
    U3STAbits.UTXISEL  = 0x00;
    U3STAbits.URXISEL  = 0x00;

    Enable_Uart3_Interrupts(2);
    URXISEL1_U3STA_bit = 0;
    IEC4.B30           = 1;    // Enable UART3 RX interrupt
    U3RXIF_bit         = 0;    // Ensure interrupt is not pending
}

/*******************************************************************
*USB Interrupt polling     not yet working
*******************************************************************/
void USBInterrupt() iv IVT_USB ilevel 7 ics ICS_SRS
{
    USB_Interrupt_Proc();
}

void USBDMAInterrupt() iv IVT_USB_DMA ilevel 7 ics ICS_SRS
{
    USB_Dma_Interrupt_Proc();
}

/************************************************************************
* UART2  GSM module communication
************************************************************************/
static void uart2_Rx_interrupt() iv IVT_UART2_RX ilevel 6 ics ICS_AUTO {
     U2RXIF_bit = 0;            // Ensure interrupt is not pending

     //IFS4.B18 = 0;

}

static void GetUart2Chars(){
     uart2_rd = UART2_Read();
     UART2_Write( uart2_rd );
}


/***********************************************************************
* UART3 User interactive communication
***********************************************************************/

void Enable_Uart3_Interrupts(char rx_tx){
  U3TXIE_bit = rx_tx & 0x01;
  U3RXIE_bit = (rx_tx >> 1) & 0x01;
}

static void uart3_Rx_interrupt() iv IVT_UART3_RX ilevel 6 ics ICS_AUTO {
     U3RXIF_bit = 0;
     //IFS4.B18 = 0;
     UART3_Get();
     //uncomment this when code is functional
    // UART3_Put();  //use to write to user
}


static void GetUart3Chars(){
     while(U3STAbits.URXDA){
       ringBufferB[ringBuffB.ringHead] =  U3RXREG;
       ringBuffB.ringHead++;
       if(ringBuffB.ringHead > 1023)
           ringBuffB.ringHead = 0;
     }
}

static void uart3_Tx_interrupt() iv IVT_UART3_TX ilevel 6 ics ICS_AUTO {
     U3TXIF_bit = 0;
     while(!U3STAbits.TRMT);
}

static void PutUart3Chars(){

     while(ringBuffB.ringTail != ringBuffB.ringHead){
       while(!U3STAbits.TRMT);
       U3TXREG = ringBufferB[ringBuffB.ringTail];         //  UART3_Write( uart3_rd );
       if(ringBuffB.ringTail == ringBuffB.ringHead)
           break;
       ringBuffB.ringTail++;
       if(ringBuffB.ringTail > 1023)
            ringBuffB.ringTail = 0;

     }

}

void ReadBack_RingBufferB(){
    UART3_Put();
}
/***************************************************************
*Get the difference in pointers from the desired Buffer
***************************************************************/
int GetDiffence_In_Pointers(char buffer){
static int diff = 0;
    switch(buffer){
      case 0:
         diff =  ringBuffA.ringHead - ringBuffA.ringTail;
         break;
      case 1:
         diff =  ringBuffB.ringHead - ringBuffB.ringTail;
         break;
      default:
         diff = 0;
         break;
    }
    return diff;
}


/**************************************************************
*Printout the desired Debug text
**************************************************************/
void PrintHandler(char c){
    /* while( U2STAbits.UTXBF);
     U3TXREG = c; */
     UART3_Write(c);
}