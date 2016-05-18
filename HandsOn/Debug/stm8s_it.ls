   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  46                     ; 54 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  46                     ; 55 {
  47                     .text:	section	.text,new
  48  0000               f_NonHandledInterrupt:
  52                     ; 59 }
  55  0000 80            	iret
  77                     ; 67 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  77                     ; 68 {
  78                     .text:	section	.text,new
  79  0000               f_TRAP_IRQHandler:
  83                     ; 72 }
  86  0000 80            	iret
 108                     ; 79 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 108                     ; 80 
 108                     ; 81 {
 109                     .text:	section	.text,new
 110  0000               f_TLI_IRQHandler:
 114                     ; 85 }
 117  0000 80            	iret
 139                     ; 92 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 139                     ; 93 {
 140                     .text:	section	.text,new
 141  0000               f_AWU_IRQHandler:
 145                     ; 97 }
 148  0000 80            	iret
 170                     ; 104 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 170                     ; 105 {
 171                     .text:	section	.text,new
 172  0000               f_CLK_IRQHandler:
 176                     ; 109 }
 179  0000 80            	iret
 202                     ; 116 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 202                     ; 117 {
 203                     .text:	section	.text,new
 204  0000               f_EXTI_PORTA_IRQHandler:
 208                     ; 121 }
 211  0000 80            	iret
 235                     ; 128 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 235                     ; 129 {
 236                     .text:	section	.text,new
 237  0000               f_EXTI_PORTB_IRQHandler:
 239  0000 8a            	push	cc
 240  0001 84            	pop	a
 241  0002 a4bf          	and	a,#191
 242  0004 88            	push	a
 243  0005 86            	pop	cc
 244  0006 3b0002        	push	c_x+2
 245  0009 be00          	ldw	x,c_x
 246  000b 89            	pushw	x
 247  000c 3b0002        	push	c_y+2
 248  000f be00          	ldw	x,c_y
 249  0011 89            	pushw	x
 252                     ; 133 	GPIO_WriteReverse(GPIOD,GPIO_PIN_0);
 254  0012 ae0001        	ldw	x,#1
 255  0015 89            	pushw	x
 256  0016 ae500f        	ldw	x,#20495
 257  0019 cd0000        	call	_GPIO_WriteReverse
 259  001c 85            	popw	x
 260                     ; 135 }
 263  001d 85            	popw	x
 264  001e bf00          	ldw	c_y,x
 265  0020 320002        	pop	c_y+2
 266  0023 85            	popw	x
 267  0024 bf00          	ldw	c_x,x
 268  0026 320002        	pop	c_x+2
 269  0029 80            	iret
 292                     ; 142 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 292                     ; 143 {
 293                     .text:	section	.text,new
 294  0000               f_EXTI_PORTC_IRQHandler:
 298                     ; 147 }
 301  0000 80            	iret
 324                     ; 154 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 324                     ; 155 {
 325                     .text:	section	.text,new
 326  0000               f_EXTI_PORTD_IRQHandler:
 330                     ; 159 }
 333  0000 80            	iret
 356                     ; 166 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 356                     ; 167 {
 357                     .text:	section	.text,new
 358  0000               f_EXTI_PORTE_IRQHandler:
 362                     ; 171 }
 365  0000 80            	iret
 387                     ; 218 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 387                     ; 219 {
 388                     .text:	section	.text,new
 389  0000               f_SPI_IRQHandler:
 393                     ; 223 }
 396  0000 80            	iret
 419                     ; 230 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 419                     ; 231 {
 420                     .text:	section	.text,new
 421  0000               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 425                     ; 235 }
 428  0000 80            	iret
 451                     ; 242 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 451                     ; 243 {
 452                     .text:	section	.text,new
 453  0000               f_TIM1_CAP_COM_IRQHandler:
 457                     ; 247 }
 460  0000 80            	iret
 483                     ; 280  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 483                     ; 281  {
 484                     .text:	section	.text,new
 485  0000               f_TIM2_UPD_OVF_BRK_IRQHandler:
 489                     ; 285  }
 492  0000 80            	iret
 515                     ; 292  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 515                     ; 293  {
 516                     .text:	section	.text,new
 517  0000               f_TIM2_CAP_COM_IRQHandler:
 521                     ; 297  }
 524  0000 80            	iret
 547                     ; 334  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 547                     ; 335  {
 548                     .text:	section	.text,new
 549  0000               f_UART1_TX_IRQHandler:
 553                     ; 339  }
 556  0000 80            	iret
 558                     	bsct
 559  0000               L112_i:
 560  0000 00            	dc.b	0
 596                     ; 346  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 596                     ; 347  {
 597                     .text:	section	.text,new
 598  0000               f_UART1_RX_IRQHandler:
 600  0000 8a            	push	cc
 601  0001 84            	pop	a
 602  0002 a4bf          	and	a,#191
 603  0004 88            	push	a
 604  0005 86            	pop	cc
 605  0006 3b0002        	push	c_x+2
 606  0009 be00          	ldw	x,c_x
 607  000b 89            	pushw	x
 608  000c 3b0002        	push	c_y+2
 609  000f be00          	ldw	x,c_y
 610  0011 89            	pushw	x
 613                     ; 349 		recebe[i] = UART1_ReceiveData8();
 615  0012 b600          	ld	a,L112_i
 616  0014 5f            	clrw	x
 617  0015 97            	ld	xl,a
 618  0016 89            	pushw	x
 619  0017 cd0000        	call	_UART1_ReceiveData8
 621  001a 85            	popw	x
 622  001b e700          	ld	(_recebe,x),a
 623                     ; 350 		UART1_ClearITPendingBit(UART1_IT_RXNE);
 625  001d ae0255        	ldw	x,#597
 626  0020 cd0000        	call	_UART1_ClearITPendingBit
 628                     ; 351 		i++;
 630  0023 3c00          	inc	L112_i
 631                     ; 352  }
 634  0025 85            	popw	x
 635  0026 bf00          	ldw	c_y,x
 636  0028 320002        	pop	c_y+2
 637  002b 85            	popw	x
 638  002c bf00          	ldw	c_x,x
 639  002e 320002        	pop	c_x+2
 640  0031 80            	iret
 662                     ; 386 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 662                     ; 387 {
 663                     .text:	section	.text,new
 664  0000               f_I2C_IRQHandler:
 668                     ; 391 }
 671  0000 80            	iret
 693                     ; 465  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 693                     ; 466  {
 694                     .text:	section	.text,new
 695  0000               f_ADC1_IRQHandler:
 699                     ; 470  }
 702  0000 80            	iret
 704                     	bsct
 705  0001               L152_Counter:
 706  0001 0000          	dc.w	0
 741                     ; 491  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 741                     ; 492  {
 742                     .text:	section	.text,new
 743  0000               f_TIM4_UPD_OVF_IRQHandler:
 745  0000 8a            	push	cc
 746  0001 84            	pop	a
 747  0002 a4bf          	and	a,#191
 748  0004 88            	push	a
 749  0005 86            	pop	cc
 750  0006 3b0002        	push	c_x+2
 751  0009 be00          	ldw	x,c_x
 752  000b 89            	pushw	x
 753  000c 3b0002        	push	c_y+2
 754  000f be00          	ldw	x,c_y
 755  0011 89            	pushw	x
 758                     ; 494 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 760  0012 ae0001        	ldw	x,#1
 761  0015 cd0000        	call	_TIM4_ClearITPendingBit
 763                     ; 495 	if(Counter >= 999){
 765  0018 be01          	ldw	x,L152_Counter
 766  001a a303e7        	cpw	x,#999
 767  001d 2510          	jrult	L172
 768                     ; 496 		GPIO_WriteReverse(GPIOD,GPIO_PIN_0);
 770  001f ae0001        	ldw	x,#1
 771  0022 89            	pushw	x
 772  0023 ae500f        	ldw	x,#20495
 773  0026 cd0000        	call	_GPIO_WriteReverse
 775  0029 85            	popw	x
 776                     ; 497 		Counter = 0;
 778  002a 5f            	clrw	x
 779  002b bf01          	ldw	L152_Counter,x
 781  002d 2007          	jra	L372
 782  002f               L172:
 783                     ; 500 		Counter++;
 785  002f be01          	ldw	x,L152_Counter
 786  0031 1c0001        	addw	x,#1
 787  0034 bf01          	ldw	L152_Counter,x
 788  0036               L372:
 789                     ; 502  }
 792  0036 85            	popw	x
 793  0037 bf00          	ldw	c_y,x
 794  0039 320002        	pop	c_y+2
 795  003c 85            	popw	x
 796  003d bf00          	ldw	c_x,x
 797  003f 320002        	pop	c_x+2
 798  0042 80            	iret
 821                     ; 510 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 821                     ; 511 {
 822                     .text:	section	.text,new
 823  0000               f_EEPROM_EEC_IRQHandler:
 827                     ; 515 }
 830  0000 80            	iret
 854                     	switch	.ubsct
 855  0000               _recebe:
 856  0000 000000        	ds.b	3
 857                     	xdef	_recebe
 858                     	xdef	f_EEPROM_EEC_IRQHandler
 859                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 860                     	xdef	f_ADC1_IRQHandler
 861                     	xdef	f_I2C_IRQHandler
 862                     	xdef	f_UART1_RX_IRQHandler
 863                     	xdef	f_UART1_TX_IRQHandler
 864                     	xdef	f_TIM2_CAP_COM_IRQHandler
 865                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 866                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 867                     	xdef	f_TIM1_CAP_COM_IRQHandler
 868                     	xdef	f_SPI_IRQHandler
 869                     	xdef	f_EXTI_PORTE_IRQHandler
 870                     	xdef	f_EXTI_PORTD_IRQHandler
 871                     	xdef	f_EXTI_PORTC_IRQHandler
 872                     	xdef	f_EXTI_PORTB_IRQHandler
 873                     	xdef	f_EXTI_PORTA_IRQHandler
 874                     	xdef	f_CLK_IRQHandler
 875                     	xdef	f_AWU_IRQHandler
 876                     	xdef	f_TLI_IRQHandler
 877                     	xdef	f_TRAP_IRQHandler
 878                     	xdef	f_NonHandledInterrupt
 879                     	xref	_UART1_ClearITPendingBit
 880                     	xref	_UART1_ReceiveData8
 881                     	xref	_TIM4_ClearITPendingBit
 882                     	xref	_GPIO_WriteReverse
 883                     	xref.b	c_x
 884                     	xref.b	c_y
 904                     	end
