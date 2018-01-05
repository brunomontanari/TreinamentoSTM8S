   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _i:
  17  0000 00            	dc.b	0
  18  0001               _Buffer_size:
  19  0001 08            	dc.b	8
  20  0002               _Data:
  21  0002 00            	dc.b	0
  22  0003 00            	dc.b	0
  23  0004 00            	dc.b	0
  24  0005 00            	dc.b	0
  25  0006 00            	dc.b	0
  26  0007 00            	dc.b	0
  27  0008 00            	dc.b	0
  28  0009 00            	dc.b	0
  29  000a               _Buffer:
  30  000a 04            	dc.b	4
  31  000b 42            	dc.b	66
  32  000c 53            	dc.b	83
  33  000d 38            	dc.b	56
  34  000e 97            	dc.b	151
  35  000f 03            	dc.b	3
  36  0010 09            	dc.b	9
  37  0011 77            	dc.b	119
  38  0012               _Base_Add:
  39  0012 0000          	dc.w	0
  81                     ; 67 void main()
  81                     ; 68 {
  83                     	switch	.text
  84  0000               _main:
  88                     ; 71     GPIO_Init(LEDS_PORT, (LED1_PIN | LED2_PIN | LED3_PIN | LED4_PIN), GPIO_MODE_OUT_PP_LOW_FAST);
  90  0000 4be0          	push	#224
  91  0002 4baa          	push	#170
  92  0004 ae5005        	ldw	x,#20485
  93  0007 cd0000        	call	_GPIO_Init
  95  000a 85            	popw	x
  96                     ; 74     I2C_DeInit();
  98  000b cd0000        	call	_I2C_DeInit
 100                     ; 77     I2C_EEInit();
 102  000e cd0000        	call	_I2C_EEInit
 104                     ; 80     GPIO_WriteLow(LEDS_PORT, (LED1_PIN | LED2_PIN | LED3_PIN | LED4_PIN));
 106  0011 4baa          	push	#170
 107  0013 ae5005        	ldw	x,#20485
 108  0016 cd0000        	call	_GPIO_WriteLow
 110  0019 84            	pop	a
 111                     ; 83    I2C_EE_PageWrite(Buffer, Base_Add, Buffer_size);
 113  001a 3b0001        	push	_Buffer_size
 114  001d 3b0013        	push	_Base_Add+1
 115  0020 ae000a        	ldw	x,#_Buffer
 116  0023 cd0000        	call	_I2C_EE_PageWrite
 118  0026 85            	popw	x
 119                     ; 84     Delay(1000); /* To let eeprom the time to finish the write operation */
 121  0027 ae03e8        	ldw	x,#1000
 122  002a ad4c          	call	_Delay
 124                     ; 87     I2C_EE_BufferRead(Data, Base_Add, Buffer_size);
 126  002c 3b0001        	push	_Buffer_size
 127  002f 3b0013        	push	_Base_Add+1
 128  0032 ae0002        	ldw	x,#_Data
 129  0035 cd0000        	call	_I2C_EE_BufferRead
 131  0038 85            	popw	x
 132                     ; 90     for (i =Buffer_size; i > 0; i--)
 134  0039 450100        	mov	_i,_Buffer_size
 136  003c 2026          	jra	L52
 137  003e               L12:
 138                     ; 92         if (Buffer[i-1] != Data[i-1])
 140  003e b600          	ld	a,_i
 141  0040 5f            	clrw	x
 142  0041 97            	ld	xl,a
 143  0042 5a            	decw	x
 144  0043 b600          	ld	a,_i
 145  0045 905f          	clrw	y
 146  0047 9097          	ld	yl,a
 147  0049 905a          	decw	y
 148  004b 90e60a        	ld	a,(_Buffer,y)
 149  004e e102          	cp	a,(_Data,x)
 150  0050 2710          	jreq	L13
 151  0052               L33:
 152                     ; 97                 GPIO_WriteReverse(LEDS_PORT, LED1_PIN);
 154  0052 4b08          	push	#8
 155  0054 ae5005        	ldw	x,#20485
 156  0057 cd0000        	call	_GPIO_WriteReverse
 158  005a 84            	pop	a
 159                     ; 98                 Delay((u16)60000);
 161  005b aeea60        	ldw	x,#60000
 162  005e ad18          	call	_Delay
 165  0060 20f0          	jra	L33
 166  0062               L13:
 167                     ; 90     for (i =Buffer_size; i > 0; i--)
 169  0062 3a00          	dec	_i
 170  0064               L52:
 173  0064 3d00          	tnz	_i
 174  0066 26d6          	jrne	L12
 175  0068               L73:
 176                     ; 106         GPIO_WriteReverse(LEDS_PORT, (LED2_PIN | LED3_PIN | LED4_PIN));
 178  0068 4ba2          	push	#162
 179  006a ae5005        	ldw	x,#20485
 180  006d cd0000        	call	_GPIO_WriteReverse
 182  0070 84            	pop	a
 183                     ; 107         Delay((u16)60000);
 185  0071 aeea60        	ldw	x,#60000
 186  0074 ad02          	call	_Delay
 189  0076 20f0          	jra	L73
 223                     ; 117 void Delay(u16 nCount)
 223                     ; 118 {
 224                     	switch	.text
 225  0078               _Delay:
 227  0078 89            	pushw	x
 228       00000000      OFST:	set	0
 231  0079 2007          	jra	L36
 232  007b               L16:
 233                     ; 122         nCount--;
 235  007b 1e01          	ldw	x,(OFST+1,sp)
 236  007d 1d0001        	subw	x,#1
 237  0080 1f01          	ldw	(OFST+1,sp),x
 238  0082               L36:
 239                     ; 120     while (nCount != 0)
 241  0082 1e01          	ldw	x,(OFST+1,sp)
 242  0084 26f5          	jrne	L16
 243                     ; 124 }
 246  0086 85            	popw	x
 247  0087 81            	ret
 309                     	xdef	_main
 310                     	xdef	_Delay
 311                     	xdef	_Base_Add
 312                     	xdef	_Buffer
 313                     	xdef	_Data
 314                     	xdef	_Buffer_size
 315                     	xdef	_i
 316                     	xref	_I2C_DeInit
 317                     	xref	_I2C_EE_BufferRead
 318                     	xref	_I2C_EE_PageWrite
 319                     	xref	_I2C_EEInit
 320                     	xref	_GPIO_WriteReverse
 321                     	xref	_GPIO_WriteLow
 322                     	xref	_GPIO_Init
 341                     	end
