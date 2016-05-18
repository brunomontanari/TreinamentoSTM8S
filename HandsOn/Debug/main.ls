   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  56                     ; 10 void Delay(u16 nCount)
  56                     ; 11 {
  58                     .text:	section	.text,new
  59  0000               _Delay:
  61  0000 89            	pushw	x
  62       00000000      OFST:	set	0
  65  0001 2007          	jra	L13
  66  0003               L72:
  67                     ; 15     nCount--;
  69  0003 1e01          	ldw	x,(OFST+1,sp)
  70  0005 1d0001        	subw	x,#1
  71  0008 1f01          	ldw	(OFST+1,sp),x
  72  000a               L13:
  73                     ; 13   while (nCount != 0)
  75  000a 1e01          	ldw	x,(OFST+1,sp)
  76  000c 26f5          	jrne	L72
  77                     ; 17 }
  80  000e 85            	popw	x
  81  000f 81            	ret
 112                     ; 19 main()
 112                     ; 20 {
 113                     .text:	section	.text,new
 114  0000               _main:
 118                     ; 21     	GPIO_Init(GPIOD,GPIO_PIN_0,GPIO_MODE_OUT_PP_HIGH_SLOW);
 120  0000 ae00d0        	ldw	x,#208
 121  0003 89            	pushw	x
 122  0004 ae0001        	ldw	x,#1
 123  0007 89            	pushw	x
 124  0008 ae500f        	ldw	x,#20495
 125  000b cd0000        	call	_GPIO_Init
 127  000e 5b04          	addw	sp,#4
 128                     ; 22  	GPIO_Init(GPIOD,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_FAST);
 130  0010 ae00e0        	ldw	x,#224
 131  0013 89            	pushw	x
 132  0014 ae0020        	ldw	x,#32
 133  0017 89            	pushw	x
 134  0018 ae500f        	ldw	x,#20495
 135  001b cd0000        	call	_GPIO_Init
 137  001e 5b04          	addw	sp,#4
 138                     ; 23    	GPIO_Init(GPIOD,GPIO_PIN_6,GPIO_MODE_IN_PU_NO_IT);
 140  0020 ae0040        	ldw	x,#64
 141  0023 89            	pushw	x
 142  0024 ae0040        	ldw	x,#64
 143  0027 89            	pushw	x
 144  0028 ae500f        	ldw	x,#20495
 145  002b cd0000        	call	_GPIO_Init
 147  002e 5b04          	addw	sp,#4
 148                     ; 24 	UART1_Init(9600, UART1_WORDLENGTH_8D, 
 148                     ; 25                       UART1_STOPBITS_1, UART1_PARITY_NO, 
 148                     ; 26                      UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
 150  0030 ae000c        	ldw	x,#12
 151  0033 89            	pushw	x
 152  0034 ae0080        	ldw	x,#128
 153  0037 89            	pushw	x
 154  0038 5f            	clrw	x
 155  0039 89            	pushw	x
 156  003a 5f            	clrw	x
 157  003b 89            	pushw	x
 158  003c 5f            	clrw	x
 159  003d 89            	pushw	x
 160  003e ae2580        	ldw	x,#9600
 161  0041 89            	pushw	x
 162  0042 ae0000        	ldw	x,#0
 163  0045 89            	pushw	x
 164  0046 cd0000        	call	_UART1_Init
 166  0049 5b0e          	addw	sp,#14
 167                     ; 27 	UART1_ITConfig(UART1_IT_RXNE_OR,ENABLE);
 169  004b ae0001        	ldw	x,#1
 170  004e 89            	pushw	x
 171  004f ae0205        	ldw	x,#517
 172  0052 cd0000        	call	_UART1_ITConfig
 174  0055 85            	popw	x
 175                     ; 28 	UART1_Cmd(ENABLE);
 177  0056 ae0001        	ldw	x,#1
 178  0059 cd0000        	call	_UART1_Cmd
 180                     ; 29 	enableInterrupts();  
 183  005c 9a            rim
 185                     ; 30 	UART1_SendData8('a');
 188  005d a661          	ld	a,#97
 189  005f cd0000        	call	_UART1_SendData8
 192  0062               L74:
 193                     ; 31 	while(UART1_GetFlagStatus(UART1_IT_TC) == RESET);
 195  0062 ae0266        	ldw	x,#614
 196  0065 cd0000        	call	_UART1_GetFlagStatus
 198  0068 a30000        	cpw	x,#0
 199  006b 27f5          	jreq	L74
 200                     ; 32 	Delay(1000);
 202  006d ae03e8        	ldw	x,#1000
 203  0070 cd0000        	call	_Delay
 205                     ; 33 	UART1_SendData8('b');
 207  0073 a662          	ld	a,#98
 208  0075 cd0000        	call	_UART1_SendData8
 211  0078               L55:
 212                     ; 34 	while(UART1_GetFlagStatus(UART1_IT_TC) == RESET);
 214  0078 ae0266        	ldw	x,#614
 215  007b cd0000        	call	_UART1_GetFlagStatus
 217  007e a30000        	cpw	x,#0
 218  0081 27f5          	jreq	L55
 219                     ; 35 	Delay(1000);
 221  0083 ae03e8        	ldw	x,#1000
 222  0086 cd0000        	call	_Delay
 224                     ; 36 	UART1_SendData8('c');
 226  0089 a663          	ld	a,#99
 227  008b cd0000        	call	_UART1_SendData8
 230  008e               L36:
 231                     ; 37 	while(UART1_GetFlagStatus(UART1_IT_TC) == RESET);
 233  008e ae0266        	ldw	x,#614
 234  0091 cd0000        	call	_UART1_GetFlagStatus
 236  0094 a30000        	cpw	x,#0
 237  0097 27f5          	jreq	L36
 238                     ; 38 	Delay(1000);
 240  0099 ae03e8        	ldw	x,#1000
 241  009c cd0000        	call	_Delay
 243  009f               L76:
 245  009f 20fe          	jra	L76
 269                     	xdef	_main
 270                     	xdef	_Delay
 271                     	switch	.ubsct
 272  0000               _ADC_Value:
 273  0000 0000          	ds.b	2
 274                     	xdef	_ADC_Value
 275                     	xref	_UART1_GetFlagStatus
 276                     	xref	_UART1_SendData8
 277                     	xref	_UART1_ITConfig
 278                     	xref	_UART1_Cmd
 279                     	xref	_UART1_Init
 280                     	xref	_GPIO_Init
 300                     	end
