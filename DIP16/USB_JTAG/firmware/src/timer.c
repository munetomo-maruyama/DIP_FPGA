//=========================================================
// USB_JTAG Project
//=========================================================
// File Name : timer.c
// Function  : Timer Control Routine
//---------------------------------------------------------
// Rev.01 2018.05.25 Munetomo Maruyama
//---------------------------------------------------------
// Copyright (C) 2015-2018 Munetomo Maruyama
//=========================================================

#include "timer.h"

//-------------------------
// Timer Initialization
//-------------------------
void Timer_Init(void)
{
    //
    // PORT Direction
    //
    TRISC = 0x1b; // PC7-0: oooiioii enable CCP1 (PWM)
    //
    // PWM Configuration
    //
    CCP1CON = 0x2c; // 00101100 PWM
    PSTRCON = 0x01; // Enable P1A Pin
    TMR2 = 0x00;    // Counter Body
    CCPR1L = 0x00;  // PWM Duty
    PR2  = 0x00;    // PWM Cycle
    T2CON = 0x04;   // 00000100 Pre-scale=1:1, Post-scale=1:1
}

//=========================================================
// End of Program
//=========================================================
