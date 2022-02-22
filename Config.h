#ifndef CONFIG_H
#define CONFIG_H


#include <stdint.h>
#include <stddef.h>
#include "built_in.h"


 ///////////////////////////////////////////////////////////////////////////////
 //function prototypes
 void PerphialSetUp();
 void InitTimer1();
 void InitTimer2();
 void Uart2InterruptSetup();
 void set_USB_Interrupt();
 void set_performance_mode();




#endif