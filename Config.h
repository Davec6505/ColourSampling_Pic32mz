#ifndef CONFIG_H
#define CONFIG_H

#include <stdint.h>
#include <stddef.h>
#include "built_in.h"
#include "ISRConfig.h"


////////////////////////////////////////////////////////////
//variables
extern uint16_t tmr;
extern uint16_t tmr_;

extern char uart2_rd;
extern char uart3_rd;
///////////////////////////////////////////////////////////
//function prototypes
 void PerphialSetUp();
 void HID_Setp();
 void InitTimer1();
 void InitTimer2();
 void Uart2InterruptSetup();
 void Uart3InterruptSetup();
 void set_performance_mode();
 void PrintHandler(char c);
 void OutPuts(long long output);
#endif