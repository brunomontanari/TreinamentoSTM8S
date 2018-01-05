   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _EEPROM_ADDRESS:
  17  0000 a0            	dc.b	160
  60                     .const:	section	.text
  61  0000               L6:
  62  0000 000f4240      	dc.l	1000000
  63                     ; 45 void I2C_EEInit(void)
  63                     ; 46 {
  64                     	scross	off
  65                     	switch	.text
  66  0000               _I2C_EEInit:
  68  0000 88            	push	a
  69       00000001      OFST:	set	1
  72                     ; 47    u8 Input_Clock = 0x0;
  74                     ; 50 	Input_Clock = CLK_GetClockFreq()/1000000;
  76  0001 cd0000        	call	_CLK_GetClockFreq
  78  0004 ae0000        	ldw	x,#L6
  79  0007 cd0000        	call	c_ludv
  81  000a b603          	ld	a,c_lreg+3
  82  000c 6b01          	ld	(OFST+0,sp),a
  83                     ; 53   I2C_Cmd(ENABLE);
  85  000e a601          	ld	a,#1
  86  0010 cd0000        	call	_I2C_Cmd
  88                     ; 55   I2C_Init(I2C_Speed, I2C1_SLAVE_ADDRESS7, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, Input_Clock);
  90  0013 7b01          	ld	a,(OFST+0,sp)
  91  0015 88            	push	a
  92  0016 4b00          	push	#0
  93  0018 4b01          	push	#1
  94  001a 4b00          	push	#0
  95  001c ae00a0        	ldw	x,#160
  96  001f 89            	pushw	x
  97  0020 ae86a0        	ldw	x,#34464
  98  0023 89            	pushw	x
  99  0024 ae0001        	ldw	x,#1
 100  0027 89            	pushw	x
 101  0028 cd0000        	call	_I2C_Init
 103  002b 5b0a          	addw	sp,#10
 104                     ; 56 }
 107  002d 84            	pop	a
 108  002e 81            	ret
 158                     ; 67 void I2C_EE_ByteWrite(u8* pBuffer, u8 WriteAddr)
 158                     ; 68 {
 159                     	switch	.text
 160  002f               _I2C_EE_ByteWrite:
 162  002f 89            	pushw	x
 163       00000000      OFST:	set	0
 166                     ; 70   I2C_GenerateSTART(ENABLE);
 168  0030 a601          	ld	a,#1
 169  0032 cd0000        	call	_I2C_GenerateSTART
 172  0035               L35:
 173                     ; 73   while(!I2C_CheckEvent(I2C_EVENT_MASTER_START_SENT));  
 175  0035 ae1701        	ldw	x,#5889
 176  0038 cd0000        	call	_I2C_CheckEvent
 178  003b 4d            	tnz	a
 179  003c 27f7          	jreq	L35
 180                     ; 76   I2C_Send7bitAddress(EEPROM_ADDRESS, I2C_DIRECTION_TX);
 182  003e 5f            	clrw	x
 183  003f b600          	ld	a,_EEPROM_ADDRESS
 184  0041 95            	ld	xh,a
 185  0042 cd0000        	call	_I2C_Send7bitAddress
 188  0045               L16:
 189                     ; 79   while(!I2C_CheckEvent(I2C_EVENT_MASTER_ADDRESS_ACKED));
 191  0045 ae1702        	ldw	x,#5890
 192  0048 cd0000        	call	_I2C_CheckEvent
 194  004b 4d            	tnz	a
 195  004c 27f7          	jreq	L16
 196                     ; 85   I2C_SendData((u8)(WriteAddr)); /* LSB */
 198  004e 7b05          	ld	a,(OFST+5,sp)
 199  0050 cd0000        	call	_I2C_SendData
 202  0053               L76:
 203                     ; 87   while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING));
 205  0053 ae1780        	ldw	x,#6016
 206  0056 cd0000        	call	_I2C_CheckEvent
 208  0059 4d            	tnz	a
 209  005a 27f7          	jreq	L76
 210                     ; 90   I2C_SendData(*pBuffer); 
 212  005c 1e01          	ldw	x,(OFST+1,sp)
 213  005e f6            	ld	a,(x)
 214  005f cd0000        	call	_I2C_SendData
 217  0062               L57:
 218                     ; 93   while(!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 220  0062 ae1784        	ldw	x,#6020
 221  0065 cd0000        	call	_I2C_CheckEvent
 223  0068 4d            	tnz	a
 224  0069 27f7          	jreq	L57
 225                     ; 96   I2C_GenerateSTOP(ENABLE);
 227  006b a601          	ld	a,#1
 228  006d cd0000        	call	_I2C_GenerateSTOP
 230                     ; 97 }
 233  0070 85            	popw	x
 234  0071 81            	ret
 295                     ; 110 void I2C_EE_PageWrite(u8* pBuffer, u8 WriteAddr, u8 NumByteToWrite)
 295                     ; 111 {
 296                     	switch	.text
 297  0072               _I2C_EE_PageWrite:
 299  0072 89            	pushw	x
 300       00000000      OFST:	set	0
 303  0073               L131:
 304                     ; 113   while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));
 306  0073 ae3002        	ldw	x,#12290
 307  0076 cd0000        	call	_I2C_GetFlagStatus
 309  0079 4d            	tnz	a
 310  007a 26f7          	jrne	L131
 311                     ; 116   I2C_GenerateSTART(ENABLE);
 313  007c a601          	ld	a,#1
 314  007e cd0000        	call	_I2C_GenerateSTART
 317  0081               L731:
 318                     ; 119   while(!I2C_CheckEvent(I2C_EVENT_MASTER_START_SENT)); 
 320  0081 ae1701        	ldw	x,#5889
 321  0084 cd0000        	call	_I2C_CheckEvent
 323  0087 4d            	tnz	a
 324  0088 27f7          	jreq	L731
 325                     ; 122   I2C_Send7bitAddress(EEPROM_ADDRESS, I2C_DIRECTION_TX);
 327  008a 5f            	clrw	x
 328  008b b600          	ld	a,_EEPROM_ADDRESS
 329  008d 95            	ld	xh,a
 330  008e cd0000        	call	_I2C_Send7bitAddress
 333  0091               L541:
 334                     ; 125   while(!I2C_CheckEvent(I2C_EVENT_MASTER_ADDRESS_ACKED));
 336  0091 ae1702        	ldw	x,#5890
 337  0094 cd0000        	call	_I2C_CheckEvent
 339  0097 4d            	tnz	a
 340  0098 27f7          	jreq	L541
 341                     ; 126   I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED);  
 343  009a ae1302        	ldw	x,#4866
 344  009d cd0000        	call	_I2C_ClearFlag
 346                     ; 132   I2C_SendData((u8)(WriteAddr)); /* LSB */
 348  00a0 7b05          	ld	a,(OFST+5,sp)
 349  00a2 cd0000        	call	_I2C_SendData
 352  00a5               L351:
 353                     ; 134   while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTING));  
 355  00a5 ae1780        	ldw	x,#6016
 356  00a8 cd0000        	call	_I2C_CheckEvent
 358  00ab 4d            	tnz	a
 359  00ac 27f7          	jreq	L351
 361  00ae 2016          	jra	L161
 362  00b0               L751:
 363                     ; 141     I2C_SendData(*pBuffer); 
 365  00b0 1e01          	ldw	x,(OFST+1,sp)
 366  00b2 f6            	ld	a,(x)
 367  00b3 cd0000        	call	_I2C_SendData
 369                     ; 144     pBuffer++; 
 371  00b6 1e01          	ldw	x,(OFST+1,sp)
 372  00b8 1c0001        	addw	x,#1
 373  00bb 1f01          	ldw	(OFST+1,sp),x
 375  00bd               L761:
 376                     ; 147     while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 378  00bd ae1784        	ldw	x,#6020
 379  00c0 cd0000        	call	_I2C_CheckEvent
 381  00c3 4d            	tnz	a
 382  00c4 27f7          	jreq	L761
 383  00c6               L161:
 384                     ; 138   while(NumByteToWrite--)  
 386  00c6 7b06          	ld	a,(OFST+6,sp)
 387  00c8 0a06          	dec	(OFST+6,sp)
 388  00ca 4d            	tnz	a
 389  00cb 26e3          	jrne	L751
 390                     ; 151   I2C_GenerateSTOP(ENABLE);
 392  00cd a601          	ld	a,#1
 393  00cf cd0000        	call	_I2C_GenerateSTOP
 395                     ; 152 }
 398  00d2 85            	popw	x
 399  00d3 81            	ret
 462                     ; 164 void I2C_EE_BufferRead(u8* pBuffer, u8 ReadAddr, u8 NumByteToRead)
 462                     ; 165 {  
 463                     	switch	.text
 464  00d4               _I2C_EE_BufferRead:
 466  00d4 89            	pushw	x
 467       00000000      OFST:	set	0
 470  00d5               L322:
 471                     ; 167   while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY));
 473  00d5 ae3002        	ldw	x,#12290
 474  00d8 cd0000        	call	_I2C_GetFlagStatus
 476  00db 4d            	tnz	a
 477  00dc 26f7          	jrne	L322
 478                     ; 170     I2C_GenerateSTART(ENABLE);
 480  00de a601          	ld	a,#1
 481  00e0 cd0000        	call	_I2C_GenerateSTART
 484  00e3               L132:
 485                     ; 172   while (!I2C_CheckEvent(I2C_EVENT_MASTER_START_SENT));
 487  00e3 ae1701        	ldw	x,#5889
 488  00e6 cd0000        	call	_I2C_CheckEvent
 490  00e9 4d            	tnz	a
 491  00ea 27f7          	jreq	L132
 492                     ; 175     I2C_Send7bitAddress(EEPROM_ADDRESS, I2C_DIRECTION_TX);
 494  00ec 5f            	clrw	x
 495  00ed b600          	ld	a,_EEPROM_ADDRESS
 496  00ef 95            	ld	xh,a
 497  00f0 cd0000        	call	_I2C_Send7bitAddress
 500  00f3               L732:
 501                     ; 177     while (!I2C_CheckEvent(I2C_EVENT_MASTER_ADDRESS_ACKED));
 503  00f3 ae1702        	ldw	x,#5890
 504  00f6 cd0000        	call	_I2C_CheckEvent
 506  00f9 4d            	tnz	a
 507  00fa 27f7          	jreq	L732
 508                     ; 178     I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED);
 510  00fc ae1302        	ldw	x,#4866
 511  00ff cd0000        	call	_I2C_ClearFlag
 513                     ; 184     I2C_SendData((u8)(ReadAddr)); /* LSB */
 515  0102 7b05          	ld	a,(OFST+5,sp)
 516  0104 cd0000        	call	_I2C_SendData
 519  0107               L542:
 520                     ; 186     while (!I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_TRANSMITTED));
 522  0107 ae1784        	ldw	x,#6020
 523  010a cd0000        	call	_I2C_CheckEvent
 525  010d 4d            	tnz	a
 526  010e 27f7          	jreq	L542
 527                     ; 189   I2C_GenerateSTART(ENABLE);
 529  0110 a601          	ld	a,#1
 530  0112 cd0000        	call	_I2C_GenerateSTART
 533  0115               L352:
 534                     ; 191    while (!I2C_CheckEvent(I2C_EVENT_MASTER_START_SENT));
 536  0115 ae1701        	ldw	x,#5889
 537  0118 cd0000        	call	_I2C_CheckEvent
 539  011b 4d            	tnz	a
 540  011c 27f7          	jreq	L352
 541                     ; 194     I2C_Send7bitAddress(EEPROM_ADDRESS, I2C_DIRECTION_RX);
 543  011e ae0001        	ldw	x,#1
 544  0121 b600          	ld	a,_EEPROM_ADDRESS
 545  0123 95            	ld	xh,a
 546  0124 cd0000        	call	_I2C_Send7bitAddress
 549  0127               L162:
 550                     ; 196     while (!I2C_CheckEvent(I2C_EVENT_MASTER_ADDRESS_ACKED));
 552  0127 ae1702        	ldw	x,#5890
 553  012a cd0000        	call	_I2C_CheckEvent
 555  012d 4d            	tnz	a
 556  012e 27f7          	jreq	L162
 557                     ; 197     I2C_ClearFlag(I2C_FLAG_ADDRESSSENTMATCHED);
 559  0130 ae1302        	ldw	x,#4866
 560  0133 cd0000        	call	_I2C_ClearFlag
 563  0136 2027          	jra	L762
 564  0138               L562:
 565                     ; 202     if(NumByteToRead == 1)
 567  0138 7b06          	ld	a,(OFST+6,sp)
 568  013a a101          	cp	a,#1
 569  013c 2609          	jrne	L372
 570                     ; 205       I2C_AcknowledgeConfig(I2C_ACK_NONE);
 572  013e 4f            	clr	a
 573  013f cd0000        	call	_I2C_AcknowledgeConfig
 575                     ; 208       I2C_GenerateSTOP(ENABLE);
 577  0142 a601          	ld	a,#1
 578  0144 cd0000        	call	_I2C_GenerateSTOP
 580  0147               L372:
 581                     ; 212     if(I2C_CheckEvent(I2C_EVENT_MASTER_BYTE_RECEIVED))  
 583  0147 ae1740        	ldw	x,#5952
 584  014a cd0000        	call	_I2C_CheckEvent
 586  014d 4d            	tnz	a
 587  014e 270f          	jreq	L762
 588                     ; 215       *pBuffer = I2C_ReceiveData();
 590  0150 cd0000        	call	_I2C_ReceiveData
 592  0153 1e01          	ldw	x,(OFST+1,sp)
 593  0155 f7            	ld	(x),a
 594                     ; 218       pBuffer++; 
 596  0156 1e01          	ldw	x,(OFST+1,sp)
 597  0158 1c0001        	addw	x,#1
 598  015b 1f01          	ldw	(OFST+1,sp),x
 599                     ; 221       NumByteToRead--;        
 601  015d 0a06          	dec	(OFST+6,sp)
 602  015f               L762:
 603                     ; 200   while(NumByteToRead)  
 605  015f 0d06          	tnz	(OFST+6,sp)
 606  0161 26d5          	jrne	L562
 607                     ; 226   I2C_AcknowledgeConfig(I2C_ACK_CURR);
 609  0163 a601          	ld	a,#1
 610  0165 cd0000        	call	_I2C_AcknowledgeConfig
 612                     ; 227 }
 615  0168 85            	popw	x
 616  0169 81            	ret
 640                     	xdef	_EEPROM_ADDRESS
 641                     	xref	_I2C_ClearFlag
 642                     	xref	_I2C_GetFlagStatus
 643                     	xref	_I2C_SendData
 644                     	xref	_I2C_Send7bitAddress
 645                     	xref	_I2C_ReceiveData
 646                     	xref	_I2C_CheckEvent
 647                     	xref	_I2C_AcknowledgeConfig
 648                     	xref	_I2C_GenerateSTOP
 649                     	xref	_I2C_GenerateSTART
 650                     	xref	_I2C_Cmd
 651                     	xref	_I2C_Init
 652                     	xdef	_I2C_EE_BufferRead
 653                     	xdef	_I2C_EE_PageWrite
 654                     	xdef	_I2C_EE_ByteWrite
 655                     	xdef	_I2C_EEInit
 656                     	xref	_CLK_GetClockFreq
 657                     	xref.b	c_lreg
 658                     	xref.b	c_x
 677                     	xref	c_ludv
 678                     	end
