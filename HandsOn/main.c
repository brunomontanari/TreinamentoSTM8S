/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"

u16 ADC_Value;

void Delay(u16 nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}

main()
{
    	GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_OUT_PP_HIGH_SLOW);
 	GPIO_Init(GPIOD,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST);
   	GPIO_Init(GPIOD,GPIO_PIN_6,GPIO_MODE_IN_PU_NO_IT);
	UART1_Init(9600, UART1_WORDLENGTH_8D, 
                      UART1_STOPBITS_1, UART1_PARITY_NO, 
                     UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
	UART1_ITConfig(UART1_IT_RXNE_OR,ENABLE);
	UART1_Cmd(ENABLE);
	enableInterrupts();  
	UART1_SendData8('a');
	while(UART1_GetFlagStatus(UART1_IT_TC) == RESET);
	Delay(1000);
	UART1_SendData8('b');
	while(UART1_GetFlagStatus(UART1_IT_TC) == RESET);
	Delay(1000);
	UART1_SendData8('c');
	while(UART1_GetFlagStatus(UART1_IT_TC) == RESET);
	Delay(1000);
   	 while (1)    {
   	 }
}

