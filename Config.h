#ifndef CONFIG_H
#define CONFIG_H

////////////////////////////////////////////////////////////
//includes
#include <stdint.h>
#include <stddef.h>
#include "built_in.h"
#include "Timers.h"
#include "UART.h"
#include "StringAdv.h"
#include "RTCC.h"

////////////////////////////////////////////////////////////
//defines
//#define timeDebug


////////////////////////////////////////////////////////////
//variables
extern uint16_t tmr;
extern uint16_t tmr_;

extern char uart2_rd;
extern char uart3_rd;

////////////////////////////////////////////////////////////
//structs unions enums
enum Thread{
MAIN,
SECONDARY,
USB,
UART};

///////////////////////////////////////////////////////////
//function prototypes
 void PerphialSetUp();
 void HID_Setp();
 void set_performance_mode();
 void OutPuts(char arr[][64],char* str,char type);
 void TimeOutputs();
#endif