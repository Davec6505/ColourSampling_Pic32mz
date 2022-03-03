#ifndef UART_H
#define UART_H

#include "Config.h"
#include <stdint.h>

//////////////////////////////////////////////
//defines


/////////////////////////////////////////////
//consta and globals
extern char readbuff[64];
extern char writebuff[64];

extern char ringBufferA[1024];
extern char ringBufferB[1024];

/////////////////////////////////////////////
//structs, unions and enums

typedef struct {
int ringHead;
int ringTail;
int ringDiff;
}RingBuffer;





/////////////////////////////////////////////
//function prototypes
void UART_Init();
void Uart2InterruptSetup();
void Uart3InterruptSetup();
static void GetUart2Chars();
static void PutUart2Chars();
void Enable_Uart3_Interrupts(char rx_tx);
static void GetUart3Chars();
static void PutUart3Chars();
void ReadBack_RingBufferB();
int GetDiffence_In_Pointers(char buffer);
void PrintHandler(char c);



#endif