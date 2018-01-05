/**
  ******************************************************************************
  * @file STM8_TSL_RC_TimerDriver.c
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

#include "STM8_TSL_RC_TimerDriver.h"
#include "STM8_TSL_RC_API.h"
#include "STM8_TSL_RC_Internal.h"

//--------    SECTION DEFINITION FOR THIS FILE   --------------
#if defined(__CSMC__) && defined(USE_PRAGMA_SECTION)
#pragma section [TSL_RAM]
#pragma section @tiny [TSL_RAM0]
#pragma section (TSL_CODE)
#pragma section const {TSL_CONST}
#endif

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             TIMER GLOBALS                                        -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
u8 @tiny TSL_Tick_Base = 0;
u8 @tiny TSL_Tick_10ms = 0;
u8 @tiny TSL_Tick_100ms = 0;
u8 @tiny TSL_TickCount_ECS_10ms = 0;
u8 @tiny TSL_Tick_User = 0;
TimerFlag_T @tiny TSL_Tick_Flags;


/**
  ******************************************************************************
  * @brief Init for Timer to manage Tick for TSL.
  * This routine assumes that the CPU clock is 16 MHz or 8 MHz using
  * any way to reduce the freq (HSI or CPU divider).
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */
void TSL_Timer_Init(void)
{

  TSL_Tick_100ms = 0;
  TSL_Tick_10ms = 0;
  TSL_Tick_Base = 0;
  TSL_TickCount_ECS_10ms = 0;
  TSL_Tick_Flags.whole = 0;

  TIMTICK->SR1 = 0;       // clear overflow flag

  if ( CLK->CKDIVR == 0x00 ) // Max CPU freq = 16 MHz
  {
    TIMTICK->PSCR = 6;     // Prescaler to divide Fcpu by 64: 4 us clock.
  }
  else
  {
    TIMTICK->PSCR = 7;     // Prescaler to divide Fcpu by 128: x.xx us clock.
  }
  
  TIMTICK->ARR = 124;      // 125 * 4 us = 500 us.
  TIMTICK->IER = 0x01;     // Enable interrupt
  TIMTICK->CR1 = 0x01;     // Start timer

}


/**
  ******************************************************************************
  * @brief Short local routine to check 1 sec tick. A tick flag is set for DTO.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */
void TSL_Timer_Check_1sec_Tick(void)
{
  if ( TSL_Tick_100ms >= 10 )
  {
    TSL_Tick_100ms -= 10;
    TSL_Tick_Flags.b.DTO_1sec = 1;  // Tick Flag for Max On Duration set every second.
  }
}


/**
  ******************************************************************************
  * @brief Short local routine to check 100 ms tick.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */
void TSL_Timer_Check_100ms_Tick(void)
{
  if ( TSL_Tick_10ms >= 10 )
  {
    TSL_Tick_10ms -= 10;
    TSL_Tick_100ms++;
    TSL_Timer_Check_1sec_Tick();
  }
}


/**
  ******************************************************************************
  * @brief Short local routine to check 10 ms tick.
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */
void TSL_Timer_Check_10ms_Tick(void)
{
  if ( TSL_Tick_Base >= TICK_FACTOR_10MS )
  {
    TSL_Tick_Base -= TICK_FACTOR_10MS;
    TSL_Tick_10ms++;
    TSL_TickCount_ECS_10ms++;   // Tick Flag for Drift increment every 10 ms.
    TSL_Timer_Check_100ms_Tick();
  }
}


/**
  ******************************************************************************
  * @brief Interrupt Service Routine for HW Timer used as timebase.
  * It manages the timer ticks for the whole application (IT every 0.5ms).
  * @par Parameters:
  * None
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */
@interrupt void TSL_Timer_ISR(void)
{

  TIMTICK->SR1 = 0;      // clear overflow flag

  TSL_Tick_Base++;
  TSL_Timer_Check_10ms_Tick();

  if (TSL_Tick_Flags.b.User_Start_100ms) /* Application request */
  {
    TSL_Tick_Flags.b.User_Start_100ms = 0;
    TSL_Tick_Flags.b.User_Flag_100ms = 0;
    TSL_Tick_User = (TICK_FACTOR_10MS * 10);
  }
  
  if (TSL_Tick_User > 0)
  {
    TSL_Tick_User--;
    if (TSL_Tick_User == 0)
    {
      TSL_Tick_Flags.b.User_Flag_100ms = 1; /* Give information to Application */
    }
  }

}


/**
  ******************************************************************************
  * @brief Modify the tick values for specific cases when the H/W timer doesn't
  * work (halt, ...).
  * @param [in] Delay Time to add to the ticks (unit is 500 us). Range is [1..65535].
  * @retval void None
  * @par Required preconditions:
  * None
  ******************************************************************************
  */
void TSL_Timer_Adjust(u16 Delay)
{

  disableInterrupts();

  do
  {
    if (Delay > TICK_FACTOR_10MS) /* delay > 10ms */
    {
      TSL_Tick_Base += TICK_FACTOR_10MS;
      Delay -= TICK_FACTOR_10MS;
      TSL_Timer_Check_10ms_Tick();
    }
    else
    {
      TSL_Tick_Base++;
      Delay--;
      TSL_Timer_Check_10ms_Tick();
    }
  }
  while ( Delay );

  enableInterrupts();
  
}

/*********************** (c) 2009 STMicroelectronics **************************/
