#ifndef CONFIG_H
#define CONFIG_H

#include "ISRConfig.h"
#include <stdint.h>
#include <stddef.h>
#include "built_in.h"


////////////////////////////////////////////////////////////
//variables
extern uint16_t tmr;
extern uint16_t tmr_;
extern char uart_rd;

///////////////////////////////////////////////////////////
//function prototypes
 void PerphialSetUp();
 void HID_Setp();
 void InitTimer1();
 void InitTimer2();
 void Uart2InterruptSetup();
 void set_USB_Interrupt();
 void set_performance_mode();
 void OutPuts(long long output);
#endif