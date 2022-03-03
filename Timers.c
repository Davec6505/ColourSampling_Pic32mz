#include "Timers.h"



static Timers T0;



void (*TMR_Sys)();
void (*TMR_Tmr)();


void ISR_Init(){
  TMR_Sys = &TMR_System;
  TMR_Tmr = &TMR_Timer;
}


/*******************************************************************
*Timer
*******************************************************************/

//Place/Copy this part in declaration section
void InitTimer1(){
  T1CON                 = 0x8000;
  //Priority      7
  T1IP0_bit             = 0;
  T1IP1_bit             = 1;
  T1IP2_bit             = 1;
  //Subpriority   0
  T1IS0_bit             = 1;
  T1IS1_bit             = 0;

  T1IF_bit              = 0;
  T1IE_bit              = 1;
  PR1                   = 50000;
  TMR1                  = 0;
}

void InitTimer2(){
  T2CON             = 0x8000;
  //Priority     7
  T2IP0_bit         = 0;
  T2IP1_bit         = 1;
  T2IP2_bit         = 1;
  //SubPriotity  1
  T2IS0_bit         = 0;
  T2IS1_bit         = 1;

  T2IF_bit          = 0;
  T2IE_bit          = 1;
  PR2               = 50000;
  TMR2              = 0;
}

static void Timer1Interrupt() iv IVT_TIMER_1 ilevel 6 ics ICS_AUTO {
  T1IF_bit         = 0;
  //Enter your code here

}

static void TMR_System(){

}



/*******************************************************************
*system timming
*******************************************************************/
static void Timer2Interrupt() iv IVT_TIMER_2 ilevel 6 ics ICS_AUTO {
  T2IF_bit         = 0;
  //Enter your code here
  TMR_Tmr();
}

static void TMR_Timer(){
   T0.millis++;
   T0.ms++;
   if(T0.ms > 999){
     T0.ms = 0;
     T0.sec++;
     LATB9_bit = !LATB9_bit;
     if(T0.sec > 59){
       T0.sec = 0;
       T0.min++;
       if(T0.sec > 59){
         T0.min = 0;
         T0.hr++;
         if(T0.hr > 23){
           T0.hr = 0;
         }
       }
     }
   }
}


Timers* GetTimer_Values(){
   return &T0;
}