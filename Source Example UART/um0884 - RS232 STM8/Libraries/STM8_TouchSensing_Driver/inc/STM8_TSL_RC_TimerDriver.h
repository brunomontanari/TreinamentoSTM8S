/**
  ******************************************************************************
  * @file STM8_TSL_RC_TimerDriver.h
  * @brief RC Touch Sensing Library for STM8 CPU family.
  * Hardware Driver for Timer.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.3.0
  * @date 29-OCT-2009
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

#ifndef __TSL_TIMERDRIVER__
#define __TSL_TIMERDRIVER__

#include "STM8_TSL_RC_Configuration.h"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             STATIC VALUES                                        -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// This factor multiplied by the tick base (0.5ms) must give a 10ms delay
#define TICK_FACTOR_10MS (20)

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             STRUCTURES                                           -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/** Contains all timer flags */
typedef union
{
  u8 whole;
  struct
  {
    unsigned DTO_1sec          : 1; /**< Detection Time Out (flag set every second) */
    unsigned User_Start_100ms  : 1; /**< From Customer Code to TSL */
    unsigned User_Flag_100ms   : 1; /**< From TSL to Customer Code */
    unsigned RESERVED3         : 1;
    unsigned RESERVED4         : 1;
    unsigned RESERVED5         : 1;
    unsigned RESERVED6         : 1;
    unsigned RESERVED7         : 1;
  } b;
} TimerFlag_T;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             GLOBAL DEFINITION                                    -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
extern u8 @tiny TSL_Tick_Base;
extern u8 @tiny TSL_Tick_10ms;
extern u8 @tiny TSL_Tick_100ms;
extern u8 @tiny TSL_TickCount_ECS_10ms;
extern TimerFlag_T @tiny TSL_Tick_Flags;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             FUNCTION DEFINITION                                  -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void TSL_Timer_Init(void);
@interrupt void TSL_Timer_ISR(void);
void TSL_Timer_Adjust(u16 Delay);
void TSL_Timer_Check_1sec_Tick(void);
void TSL_Timer_Check_100ms_Tick(void);
void TSL_Timer_Check_10ms_Tick(void);

#endif /* __TSL_TIMERDRIVER__ */

/*********************** (c) 2009 STMicroelectronics **************************/
