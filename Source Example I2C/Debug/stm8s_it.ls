   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 45 @far @interrupt void NonHandledInterrupt(void)
  44                     ; 46 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50                     ; 50 }
  53  0000 80            	iret
  75                     ; 59 @far @interrupt void TRAP_IRQHandler(void)
  75                     ; 60 {
  76                     	switch	.text
  77  0001               f_TRAP_IRQHandler:
  81                     ; 64 }
  84  0001 80            	iret
 106                     ; 90 @far @interrupt void TLI_IRQHandler(void)
 106                     ; 91 #else /* _RAISONANCE_ */
 106                     ; 92 void TLI_IRQHandler(void) interrupt 0
 106                     ; 93 #endif /* _COSMIC_ */
 106                     ; 94 {
 107                     	switch	.text
 108  0002               f_TLI_IRQHandler:
 112                     ; 98 }
 115  0002 80            	iret
 137                     ; 108 @far @interrupt void AWU_IRQHandler(void)
 137                     ; 109 #else /* _RAISONANCE_ */
 137                     ; 110 void AWU_IRQHandler(void) interrupt 1
 137                     ; 111 #endif /* _COSMIC_ */
 137                     ; 112 {
 138                     	switch	.text
 139  0003               f_AWU_IRQHandler:
 143                     ; 116 }
 146  0003 80            	iret
 168                     ; 126 @far @interrupt void CLK_IRQHandler(void)
 168                     ; 127 #else /* _RAISONANCE_ */
 168                     ; 128 void CLK_IRQHandler(void) interrupt 2
 168                     ; 129 #endif /* _COSMIC_ */
 168                     ; 130 {
 169                     	switch	.text
 170  0004               f_CLK_IRQHandler:
 174                     ; 134 }
 177  0004 80            	iret
 200                     ; 144 @far @interrupt void EXTI_PORTA_IRQHandler(void)
 200                     ; 145 #else /* _RAISONANCE_ */
 200                     ; 146 void EXTI_PORTA_IRQHandler(void) interrupt 3
 200                     ; 147 #endif /* _COSMIC_ */
 200                     ; 148 {
 201                     	switch	.text
 202  0005               f_EXTI_PORTA_IRQHandler:
 206                     ; 152 }
 209  0005 80            	iret
 232                     ; 162 @far @interrupt void EXTI_PORTB_IRQHandler(void)
 232                     ; 163 #else /* _RAISONANCE_ */
 232                     ; 164 void EXTI_PORTB_IRQHandler(void) interrupt 4
 232                     ; 165 #endif /* _COSMIC_ */
 232                     ; 166 {
 233                     	switch	.text
 234  0006               f_EXTI_PORTB_IRQHandler:
 238                     ; 170 }
 241  0006 80            	iret
 264                     ; 180 @far @interrupt void EXTI_PORTC_IRQHandler(void)
 264                     ; 181 #else /* _RAISONANCE_ */
 264                     ; 182 void EXTI_PORTC_IRQHandler(void) interrupt 5
 264                     ; 183 #endif /* _COSMIC_ */
 264                     ; 184 {
 265                     	switch	.text
 266  0007               f_EXTI_PORTC_IRQHandler:
 270                     ; 188 }
 273  0007 80            	iret
 296                     ; 198 @far @interrupt void EXTI_PORTD_IRQHandler(void)
 296                     ; 199 #else /* _RAISONANCE_ */
 296                     ; 200 void EXTI_PORTD_IRQHandler(void) interrupt 6
 296                     ; 201 #endif /* _COSMIC_ */
 296                     ; 202 {
 297                     	switch	.text
 298  0008               f_EXTI_PORTD_IRQHandler:
 302                     ; 206 }
 305  0008 80            	iret
 328                     ; 216 @far @interrupt void EXTI_PORTE_IRQHandler(void)
 328                     ; 217 #else /* _RAISONANCE_ */
 328                     ; 218 void EXTI_PORTE_IRQHandler(void) interrupt 7
 328                     ; 219 #endif /* _COSMIC_ */
 328                     ; 220 {
 329                     	switch	.text
 330  0009               f_EXTI_PORTE_IRQHandler:
 334                     ; 224 }
 337  0009 80            	iret
 359                     ; 291 @far @interrupt void SPI_IRQHandler(void)
 359                     ; 292 #else /* _RAISONANCE_ */
 359                     ; 293 void SPI_IRQHandler(void) interrupt 10
 359                     ; 294 #endif /* _COSMIC_ */
 359                     ; 295 {
 360                     	switch	.text
 361  000a               f_SPI_IRQHandler:
 365                     ; 299 }
 368  000a 80            	iret
 391                     ; 309 @far @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
 391                     ; 310 #else /* _RAISONANCE_ */
 391                     ; 311 void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void) interrupt 11
 391                     ; 312 #endif /* _COSMIC_ */
 391                     ; 313 {
 392                     	switch	.text
 393  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 397                     ; 317 }
 400  000b 80            	iret
 423                     ; 327 @far @interrupt void TIM1_CAP_COM_IRQHandler(void)
 423                     ; 328 #else /* _RAISONANCE_ */
 423                     ; 329 void TIM1_CAP_COM_IRQHandler(void) interrupt 12
 423                     ; 330 #endif /* _COSMIC_ */
 423                     ; 331 {
 424                     	switch	.text
 425  000c               f_TIM1_CAP_COM_IRQHandler:
 429                     ; 335 }
 432  000c 80            	iret
 455                     ; 382 @far @interrupt void TIM2_UPD_OVF_BRK_IRQHandler(void)
 455                     ; 383 #else /* _RAISONANCE_ */
 455                     ; 384 void TIM2_UPD_OVF_BRK_IRQHandler(void) interrupt 13
 455                     ; 385 #endif /* _COSMIC_ */
 455                     ; 386 {
 456                     	switch	.text
 457  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 461                     ; 390 }
 464  000d 80            	iret
 487                     ; 400 @far @interrupt void TIM2_CAP_COM_IRQHandler(void)
 487                     ; 401 #else /* _RAISONANCE_ */
 487                     ; 402 void TIM2_CAP_COM_IRQHandler(void) interrupt 14
 487                     ; 403 #endif /* _COSMIC_ */
 487                     ; 404 {
 488                     	switch	.text
 489  000e               f_TIM2_CAP_COM_IRQHandler:
 493                     ; 408 }
 496  000e 80            	iret
 519                     ; 420 @far @interrupt void TIM3_UPD_OVF_BRK_IRQHandler(void)
 519                     ; 421 #else /* _RAISONANCE_ */
 519                     ; 422 void TIM3_UPD_OVF_BRK_IRQHandler(void) interrupt 15
 519                     ; 423 #endif /* _COSMIC_ */
 519                     ; 424 {
 520                     	switch	.text
 521  000f               f_TIM3_UPD_OVF_BRK_IRQHandler:
 525                     ; 428 }
 528  000f 80            	iret
 551                     ; 438 @far @interrupt void TIM3_CAP_COM_IRQHandler(void)
 551                     ; 439 #else /* _RAISONANCE_ */
 551                     ; 440 void TIM3_CAP_COM_IRQHandler(void) interrupt 16
 551                     ; 441 #endif /* _COSMIC_ */
 551                     ; 442 {
 552                     	switch	.text
 553  0010               f_TIM3_CAP_COM_IRQHandler:
 557                     ; 446 }
 560  0010 80            	iret
 582                     ; 495 @far @interrupt void I2C_IRQHandler(void)
 582                     ; 496 #else /* _RAISONANCE_ */
 582                     ; 497 void I2C_IRQHandler(void) interrupt 19
 582                     ; 498 #endif /* _COSMIC_ */
 582                     ; 499 {
 583                     	switch	.text
 584  0011               f_I2C_IRQHandler:
 588                     ; 503 }
 591  0011 80            	iret
 614                     ; 514 @far @interrupt void UART2_TX_IRQHandler(void)
 614                     ; 515 #else /* _RAISONANCE_ */
 614                     ; 516 void UART2_TX_IRQHandler(void) interrupt 20
 614                     ; 517 #endif /* _COSMIC_ */
 614                     ; 518 {
 615                     	switch	.text
 616  0012               f_UART2_TX_IRQHandler:
 620                     ; 522   }
 623  0012 80            	iret
 646                     ; 532 @far @interrupt void UART2_RX_IRQHandler(void)
 646                     ; 533 #else /* _RAISONANCE_ */
 646                     ; 534 void UART2_RX_IRQHandler(void) interrupt 21
 646                     ; 535 #endif /* _COSMIC_ */
 646                     ; 536 {
 647                     	switch	.text
 648  0013               f_UART2_RX_IRQHandler:
 652                     ; 540   }
 655  0013 80            	iret
 677                     ; 611 @far @interrupt void ADC1_IRQHandler(void)
 677                     ; 612 #else /* _RAISONANCE_ */
 677                     ; 613 void ADC1_IRQHandler(void) interrupt 22
 677                     ; 614 #endif /* _COSMIC_ */
 677                     ; 615 {
 678                     	switch	.text
 679  0014               f_ADC1_IRQHandler:
 683                     ; 620     return;
 686  0014 80            	iret
 709                     ; 652 @far @interrupt void TIM4_UPD_OVF_IRQHandler(void)
 709                     ; 653 #else /* _RAISONANCE_ */
 709                     ; 654 void TIM4_UPD_OVF_IRQHandler(void) interrupt 23
 709                     ; 655 #endif /* _COSMIC_ */
 709                     ; 656 {
 710                     	switch	.text
 711  0015               f_TIM4_UPD_OVF_IRQHandler:
 715                     ; 660 }
 718  0015 80            	iret
 741                     ; 671 @far @interrupt void EEPROM_EEC_IRQHandler(void)
 741                     ; 672 #else /* _RAISONANCE_ */
 741                     ; 673 void EEPROM_EEC_IRQHandler(void) interrupt 24
 741                     ; 674 #endif /* _COSMIC_ */
 741                     ; 675 {
 742                     	switch	.text
 743  0016               f_EEPROM_EEC_IRQHandler:
 747                     ; 679 }
 750  0016 80            	iret
 762                     	xdef	f_EEPROM_EEC_IRQHandler
 763                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 764                     	xdef	f_ADC1_IRQHandler
 765                     	xdef	f_UART2_TX_IRQHandler
 766                     	xdef	f_UART2_RX_IRQHandler
 767                     	xdef	f_I2C_IRQHandler
 768                     	xdef	f_TIM3_CAP_COM_IRQHandler
 769                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 770                     	xdef	f_TIM2_CAP_COM_IRQHandler
 771                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 772                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 773                     	xdef	f_TIM1_CAP_COM_IRQHandler
 774                     	xdef	f_SPI_IRQHandler
 775                     	xdef	f_EXTI_PORTE_IRQHandler
 776                     	xdef	f_EXTI_PORTD_IRQHandler
 777                     	xdef	f_EXTI_PORTC_IRQHandler
 778                     	xdef	f_EXTI_PORTB_IRQHandler
 779                     	xdef	f_EXTI_PORTA_IRQHandler
 780                     	xdef	f_CLK_IRQHandler
 781                     	xdef	f_AWU_IRQHandler
 782                     	xdef	f_TLI_IRQHandler
 783                     	xdef	f_TRAP_IRQHandler
 784                     	xdef	f_NonHandledInterrupt
 803                     	end
