   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  45                     ; 53 void UART1_DeInit(void)
  45                     ; 54 {
  47                     .text:	section	.text,new
  48  0000               _UART1_DeInit:
  52                     ; 57   (void)UART1->SR;
  54  0000 c65230        	ld	a,21040
  55                     ; 58   (void)UART1->DR;
  57  0003 c65231        	ld	a,21041
  58                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  60  0006 725f5233      	clr	21043
  61                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  63  000a 725f5232      	clr	21042
  64                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  66  000e 725f5234      	clr	21044
  67                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  69  0012 725f5235      	clr	21045
  70                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  72  0016 725f5236      	clr	21046
  73                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  75  001a 725f5237      	clr	21047
  76                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  78  001e 725f5238      	clr	21048
  79                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  81  0022 725f5239      	clr	21049
  82                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  84  0026 725f523a      	clr	21050
  85                     ; 71 }
  88  002a 81            	ret
 391                     .const:	section	.text
 392  0000               L01:
 393  0000 00000064      	dc.l	100
 394                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 394                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 394                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 394                     ; 93 {
 395                     .text:	section	.text,new
 396  0000               _UART1_Init:
 398  0000 520c          	subw	sp,#12
 399       0000000c      OFST:	set	12
 402                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 406                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 408                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 410                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 412                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 414                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 416                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 418                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 420  0002 72195234      	bres	21044,#4
 421                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 423  0006 c65234        	ld	a,21044
 424  0009 1a14          	or	a,(OFST+8,sp)
 425  000b c75234        	ld	21044,a
 426                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 428  000e c65236        	ld	a,21046
 429  0011 a4cf          	and	a,#207
 430  0013 c75236        	ld	21046,a
 431                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 433  0016 c65236        	ld	a,21046
 434  0019 1a16          	or	a,(OFST+10,sp)
 435  001b c75236        	ld	21046,a
 436                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 438  001e c65234        	ld	a,21044
 439  0021 a4f9          	and	a,#249
 440  0023 c75234        	ld	21044,a
 441                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 443  0026 c65234        	ld	a,21044
 444  0029 1a18          	or	a,(OFST+12,sp)
 445  002b c75234        	ld	21044,a
 446                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 448  002e 725f5232      	clr	21042
 449                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 451  0032 c65233        	ld	a,21043
 452  0035 a40f          	and	a,#15
 453  0037 c75233        	ld	21043,a
 454                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 456  003a c65233        	ld	a,21043
 457  003d a4f0          	and	a,#240
 458  003f c75233        	ld	21043,a
 459                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 461  0042 96            	ldw	x,sp
 462  0043 1c000f        	addw	x,#OFST+3
 463  0046 cd0000        	call	c_ltor
 465  0049 a604          	ld	a,#4
 466  004b cd0000        	call	c_llsh
 468  004e 96            	ldw	x,sp
 469  004f 1c0001        	addw	x,#OFST-11
 470  0052 cd0000        	call	c_rtol
 472  0055 cd0000        	call	_CLK_GetClockFreq
 474  0058 96            	ldw	x,sp
 475  0059 1c0001        	addw	x,#OFST-11
 476  005c cd0000        	call	c_ludv
 478  005f 96            	ldw	x,sp
 479  0060 1c0009        	addw	x,#OFST-3
 480  0063 cd0000        	call	c_rtol
 482                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 484  0066 96            	ldw	x,sp
 485  0067 1c000f        	addw	x,#OFST+3
 486  006a cd0000        	call	c_ltor
 488  006d a604          	ld	a,#4
 489  006f cd0000        	call	c_llsh
 491  0072 96            	ldw	x,sp
 492  0073 1c0001        	addw	x,#OFST-11
 493  0076 cd0000        	call	c_rtol
 495  0079 cd0000        	call	_CLK_GetClockFreq
 497  007c a664          	ld	a,#100
 498  007e cd0000        	call	c_smul
 500  0081 96            	ldw	x,sp
 501  0082 1c0001        	addw	x,#OFST-11
 502  0085 cd0000        	call	c_ludv
 504  0088 96            	ldw	x,sp
 505  0089 1c0005        	addw	x,#OFST-7
 506  008c cd0000        	call	c_rtol
 508                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 510  008f 96            	ldw	x,sp
 511  0090 1c0009        	addw	x,#OFST-3
 512  0093 cd0000        	call	c_ltor
 514  0096 a664          	ld	a,#100
 515  0098 cd0000        	call	c_smul
 517  009b 96            	ldw	x,sp
 518  009c 1c0001        	addw	x,#OFST-11
 519  009f cd0000        	call	c_rtol
 521  00a2 96            	ldw	x,sp
 522  00a3 1c0005        	addw	x,#OFST-7
 523  00a6 cd0000        	call	c_ltor
 525  00a9 96            	ldw	x,sp
 526  00aa 1c0001        	addw	x,#OFST-11
 527  00ad cd0000        	call	c_lsub
 529  00b0 a604          	ld	a,#4
 530  00b2 cd0000        	call	c_llsh
 532  00b5 ae0000        	ldw	x,#L01
 533  00b8 cd0000        	call	c_ludv
 535  00bb b603          	ld	a,c_lreg+3
 536  00bd a40f          	and	a,#15
 537  00bf ca5233        	or	a,21043
 538  00c2 c75233        	ld	21043,a
 539                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 541  00c5 96            	ldw	x,sp
 542  00c6 1c0009        	addw	x,#OFST-3
 543  00c9 cd0000        	call	c_ltor
 545  00cc a604          	ld	a,#4
 546  00ce cd0000        	call	c_lursh
 548  00d1 b603          	ld	a,c_lreg+3
 549  00d3 a4f0          	and	a,#240
 550  00d5 b703          	ld	c_lreg+3,a
 551  00d7 3f02          	clr	c_lreg+2
 552  00d9 3f01          	clr	c_lreg+1
 553  00db 3f00          	clr	c_lreg
 554  00dd b603          	ld	a,c_lreg+3
 555  00df ca5233        	or	a,21043
 556  00e2 c75233        	ld	21043,a
 557                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 559  00e5 c65232        	ld	a,21042
 560  00e8 1a0c          	or	a,(OFST+0,sp)
 561  00ea c75232        	ld	21042,a
 562                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 564  00ed c65235        	ld	a,21045
 565  00f0 a4f3          	and	a,#243
 566  00f2 c75235        	ld	21045,a
 567                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 569  00f5 c65236        	ld	a,21046
 570  00f8 a4f8          	and	a,#248
 571  00fa c75236        	ld	21046,a
 572                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 572                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 574  00fd 7b1a          	ld	a,(OFST+14,sp)
 575  00ff a407          	and	a,#7
 576  0101 ca5236        	or	a,21046
 577  0104 c75236        	ld	21046,a
 578                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 580  0107 7b1c          	ld	a,(OFST+16,sp)
 581  0109 a504          	bcp	a,#4
 582  010b 2706          	jreq	L371
 583                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 585  010d 72165235      	bset	21045,#3
 587  0111 2004          	jra	L571
 588  0113               L371:
 589                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 591  0113 72175235      	bres	21045,#3
 592  0117               L571:
 593                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 595  0117 7b1c          	ld	a,(OFST+16,sp)
 596  0119 a508          	bcp	a,#8
 597  011b 2706          	jreq	L771
 598                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 600  011d 72145235      	bset	21045,#2
 602  0121 2004          	jra	L102
 603  0123               L771:
 604                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 606  0123 72155235      	bres	21045,#2
 607  0127               L102:
 608                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 610  0127 7b1a          	ld	a,(OFST+14,sp)
 611  0129 a580          	bcp	a,#128
 612  012b 2706          	jreq	L302
 613                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 615  012d 72175236      	bres	21046,#3
 617  0131 200a          	jra	L502
 618  0133               L302:
 619                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 621  0133 7b1a          	ld	a,(OFST+14,sp)
 622  0135 a408          	and	a,#8
 623  0137 ca5236        	or	a,21046
 624  013a c75236        	ld	21046,a
 625  013d               L502:
 626                     ; 176 }
 629  013d 5b0c          	addw	sp,#12
 630  013f 81            	ret
 685                     ; 184 void UART1_Cmd(FunctionalState NewState)
 685                     ; 185 {
 686                     .text:	section	.text,new
 687  0000               _UART1_Cmd:
 691                     ; 186   if (NewState != DISABLE)
 693  0000 a30000        	cpw	x,#0
 694  0003 2706          	jreq	L532
 695                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 697  0005 721b5234      	bres	21044,#5
 699  0009 2004          	jra	L732
 700  000b               L532:
 701                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 703  000b 721a5234      	bset	21044,#5
 704  000f               L732:
 705                     ; 196 }
 708  000f 81            	ret
 833                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 833                     ; 212 {
 834                     .text:	section	.text,new
 835  0000               _UART1_ITConfig:
 837  0000 89            	pushw	x
 838  0001 89            	pushw	x
 839       00000002      OFST:	set	2
 842                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 846                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 848                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 850                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 852  0002 4f            	clr	a
 853  0003 01            	rrwa	x,a
 854  0004 9f            	ld	a,xl
 855  0005 6b01          	ld	(OFST-1,sp),a
 856                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 858  0007 7b04          	ld	a,(OFST+2,sp)
 859  0009 a40f          	and	a,#15
 860  000b 5f            	clrw	x
 861  000c 97            	ld	xl,a
 862  000d a601          	ld	a,#1
 863  000f 5d            	tnzw	x
 864  0010 2704          	jreq	L61
 865  0012               L02:
 866  0012 48            	sll	a
 867  0013 5a            	decw	x
 868  0014 26fc          	jrne	L02
 869  0016               L61:
 870  0016 6b02          	ld	(OFST+0,sp),a
 871                     ; 224   if (NewState != DISABLE)
 873  0018 1e07          	ldw	x,(OFST+5,sp)
 874  001a 272a          	jreq	L713
 875                     ; 227     if (uartreg == 0x01)
 877  001c 7b01          	ld	a,(OFST-1,sp)
 878  001e a101          	cp	a,#1
 879  0020 260a          	jrne	L123
 880                     ; 229       UART1->CR1 |= itpos;
 882  0022 c65234        	ld	a,21044
 883  0025 1a02          	or	a,(OFST+0,sp)
 884  0027 c75234        	ld	21044,a
 886  002a 2045          	jra	L133
 887  002c               L123:
 888                     ; 231     else if (uartreg == 0x02)
 890  002c 7b01          	ld	a,(OFST-1,sp)
 891  002e a102          	cp	a,#2
 892  0030 260a          	jrne	L523
 893                     ; 233       UART1->CR2 |= itpos;
 895  0032 c65235        	ld	a,21045
 896  0035 1a02          	or	a,(OFST+0,sp)
 897  0037 c75235        	ld	21045,a
 899  003a 2035          	jra	L133
 900  003c               L523:
 901                     ; 237       UART1->CR4 |= itpos;
 903  003c c65237        	ld	a,21047
 904  003f 1a02          	or	a,(OFST+0,sp)
 905  0041 c75237        	ld	21047,a
 906  0044 202b          	jra	L133
 907  0046               L713:
 908                     ; 243     if (uartreg == 0x01)
 910  0046 7b01          	ld	a,(OFST-1,sp)
 911  0048 a101          	cp	a,#1
 912  004a 260b          	jrne	L333
 913                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
 915  004c 7b02          	ld	a,(OFST+0,sp)
 916  004e 43            	cpl	a
 917  004f c45234        	and	a,21044
 918  0052 c75234        	ld	21044,a
 920  0055 201a          	jra	L133
 921  0057               L333:
 922                     ; 247     else if (uartreg == 0x02)
 924  0057 7b01          	ld	a,(OFST-1,sp)
 925  0059 a102          	cp	a,#2
 926  005b 260b          	jrne	L733
 927                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
 929  005d 7b02          	ld	a,(OFST+0,sp)
 930  005f 43            	cpl	a
 931  0060 c45235        	and	a,21045
 932  0063 c75235        	ld	21045,a
 934  0066 2009          	jra	L133
 935  0068               L733:
 936                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
 938  0068 7b02          	ld	a,(OFST+0,sp)
 939  006a 43            	cpl	a
 940  006b c45237        	and	a,21047
 941  006e c75237        	ld	21047,a
 942  0071               L133:
 943                     ; 257 }
 946  0071 5b04          	addw	sp,#4
 947  0073 81            	ret
 983                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
 983                     ; 266 {
 984                     .text:	section	.text,new
 985  0000               _UART1_HalfDuplexCmd:
 989                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 991                     ; 269   if (NewState != DISABLE)
 993  0000 a30000        	cpw	x,#0
 994  0003 2706          	jreq	L163
 995                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 997  0005 72165238      	bset	21048,#3
 999  0009 2004          	jra	L363
1000  000b               L163:
1001                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1003  000b 72175238      	bres	21048,#3
1004  000f               L363:
1005                     ; 277 }
1008  000f 81            	ret
1065                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1065                     ; 286 {
1066                     .text:	section	.text,new
1067  0000               _UART1_IrDAConfig:
1071                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1073                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1075  0000 a30000        	cpw	x,#0
1076  0003 2706          	jreq	L314
1077                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1079  0005 72145238      	bset	21048,#2
1081  0009 2004          	jra	L514
1082  000b               L314:
1083                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1085  000b 72155238      	bres	21048,#2
1086  000f               L514:
1087                     ; 297 }
1090  000f 81            	ret
1125                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1125                     ; 306 {
1126                     .text:	section	.text,new
1127  0000               _UART1_IrDACmd:
1131                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1133                     ; 310   if (NewState != DISABLE)
1135  0000 a30000        	cpw	x,#0
1136  0003 2706          	jreq	L534
1137                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1139  0005 72125238      	bset	21048,#1
1141  0009 2004          	jra	L734
1142  000b               L534:
1143                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1145  000b 72135238      	bres	21048,#1
1146  000f               L734:
1147                     ; 320 }
1150  000f 81            	ret
1209                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1209                     ; 330 {
1210                     .text:	section	.text,new
1211  0000               _UART1_LINBreakDetectionConfig:
1215                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1217                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1219  0000 a30000        	cpw	x,#0
1220  0003 2706          	jreq	L764
1221                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1223  0005 721a5237      	bset	21047,#5
1225  0009 2004          	jra	L174
1226  000b               L764:
1227                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1229  000b 721b5237      	bres	21047,#5
1230  000f               L174:
1231                     ; 341 }
1234  000f 81            	ret
1269                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1269                     ; 350 {
1270                     .text:	section	.text,new
1271  0000               _UART1_LINCmd:
1275                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1277                     ; 353   if (NewState != DISABLE)
1279  0000 a30000        	cpw	x,#0
1280  0003 2706          	jreq	L115
1281                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1283  0005 721c5236      	bset	21046,#6
1285  0009 2004          	jra	L315
1286  000b               L115:
1287                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1289  000b 721d5236      	bres	21046,#6
1290  000f               L315:
1291                     ; 363 }
1294  000f 81            	ret
1329                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1329                     ; 372 {
1330                     .text:	section	.text,new
1331  0000               _UART1_SmartCardCmd:
1335                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1337                     ; 375   if (NewState != DISABLE)
1339  0000 a30000        	cpw	x,#0
1340  0003 2706          	jreq	L335
1341                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1343  0005 721a5238      	bset	21048,#5
1345  0009 2004          	jra	L535
1346  000b               L335:
1347                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1349  000b 721b5238      	bres	21048,#5
1350  000f               L535:
1351                     ; 385 }
1354  000f 81            	ret
1390                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1390                     ; 395 {
1391                     .text:	section	.text,new
1392  0000               _UART1_SmartCardNACKCmd:
1396                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1398                     ; 398   if (NewState != DISABLE)
1400  0000 a30000        	cpw	x,#0
1401  0003 2706          	jreq	L555
1402                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1404  0005 72185238      	bset	21048,#4
1406  0009 2004          	jra	L755
1407  000b               L555:
1408                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1410  000b 72195238      	bres	21048,#4
1411  000f               L755:
1412                     ; 408 }
1415  000f 81            	ret
1472                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1472                     ; 417 {
1473                     .text:	section	.text,new
1474  0000               _UART1_WakeUpConfig:
1478                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1480                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1482  0000 72175234      	bres	21044,#3
1483                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1485  0004 9f            	ld	a,xl
1486  0005 ca5234        	or	a,21044
1487  0008 c75234        	ld	21044,a
1488                     ; 422 }
1491  000b 81            	ret
1527                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1527                     ; 431 {
1528                     .text:	section	.text,new
1529  0000               _UART1_ReceiverWakeUpCmd:
1533                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1535                     ; 434   if (NewState != DISABLE)
1537  0000 a30000        	cpw	x,#0
1538  0003 2706          	jreq	L526
1539                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1541  0005 72125235      	bset	21045,#1
1543  0009 2004          	jra	L726
1544  000b               L526:
1545                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1547  000b 72135235      	bres	21045,#1
1548  000f               L726:
1549                     ; 444 }
1552  000f 81            	ret
1575                     ; 451 uint8_t UART1_ReceiveData8(void)
1575                     ; 452 {
1576                     .text:	section	.text,new
1577  0000               _UART1_ReceiveData8:
1581                     ; 453   return ((uint8_t)UART1->DR);
1583  0000 c65231        	ld	a,21041
1586  0003 81            	ret
1620                     ; 461 uint16_t UART1_ReceiveData9(void)
1620                     ; 462 {
1621                     .text:	section	.text,new
1622  0000               _UART1_ReceiveData9:
1624  0000 89            	pushw	x
1625       00000002      OFST:	set	2
1628                     ; 463   uint16_t temp = 0;
1630                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1632  0001 c65234        	ld	a,21044
1633  0004 5f            	clrw	x
1634  0005 a480          	and	a,#128
1635  0007 5f            	clrw	x
1636  0008 02            	rlwa	x,a
1637  0009 58            	sllw	x
1638  000a 1f01          	ldw	(OFST-1,sp),x
1639                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1641  000c c65231        	ld	a,21041
1642  000f 5f            	clrw	x
1643  0010 97            	ld	xl,a
1644  0011 01            	rrwa	x,a
1645  0012 1a02          	or	a,(OFST+0,sp)
1646  0014 01            	rrwa	x,a
1647  0015 1a01          	or	a,(OFST-1,sp)
1648  0017 01            	rrwa	x,a
1649  0018 01            	rrwa	x,a
1650  0019 a4ff          	and	a,#255
1651  001b 01            	rrwa	x,a
1652  001c a401          	and	a,#1
1653  001e 01            	rrwa	x,a
1656  001f 5b02          	addw	sp,#2
1657  0021 81            	ret
1691                     ; 474 void UART1_SendData8(uint8_t Data)
1691                     ; 475 {
1692                     .text:	section	.text,new
1693  0000               _UART1_SendData8:
1697                     ; 477   UART1->DR = Data;
1699  0000 c75231        	ld	21041,a
1700                     ; 478 }
1703  0003 81            	ret
1737                     ; 486 void UART1_SendData9(uint16_t Data)
1737                     ; 487 {
1738                     .text:	section	.text,new
1739  0000               _UART1_SendData9:
1741  0000 89            	pushw	x
1742       00000000      OFST:	set	0
1745                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1747  0001 721d5234      	bres	21044,#6
1748                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1750  0005 54            	srlw	x
1751  0006 54            	srlw	x
1752  0007 9f            	ld	a,xl
1753  0008 a440          	and	a,#64
1754  000a ca5234        	or	a,21044
1755  000d c75234        	ld	21044,a
1756                     ; 493   UART1->DR   = (uint8_t)(Data);
1758  0010 7b02          	ld	a,(OFST+2,sp)
1759  0012 c75231        	ld	21041,a
1760                     ; 494 }
1763  0015 85            	popw	x
1764  0016 81            	ret
1787                     ; 501 void UART1_SendBreak(void)
1787                     ; 502 {
1788                     .text:	section	.text,new
1789  0000               _UART1_SendBreak:
1793                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
1795  0000 72105235      	bset	21045,#0
1796                     ; 504 }
1799  0004 81            	ret
1833                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
1833                     ; 512 {
1834                     .text:	section	.text,new
1835  0000               _UART1_SetAddress:
1837  0000 88            	push	a
1838       00000000      OFST:	set	0
1841                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1843                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1845  0001 c65237        	ld	a,21047
1846  0004 a4f0          	and	a,#240
1847  0006 c75237        	ld	21047,a
1848                     ; 519   UART1->CR4 |= UART1_Address;
1850  0009 c65237        	ld	a,21047
1851  000c 1a01          	or	a,(OFST+1,sp)
1852  000e c75237        	ld	21047,a
1853                     ; 520 }
1856  0011 84            	pop	a
1857  0012 81            	ret
1891                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1891                     ; 529 {
1892                     .text:	section	.text,new
1893  0000               _UART1_SetGuardTime:
1897                     ; 531   UART1->GTR = UART1_GuardTime;
1899  0000 c75239        	ld	21049,a
1900                     ; 532 }
1903  0003 81            	ret
1937                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1937                     ; 557 {
1938                     .text:	section	.text,new
1939  0000               _UART1_SetPrescaler:
1943                     ; 559   UART1->PSCR = UART1_Prescaler;
1945  0000 c7523a        	ld	21050,a
1946                     ; 560 }
1949  0003 81            	ret
2092                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2092                     ; 569 {
2093                     .text:	section	.text,new
2094  0000               _UART1_GetFlagStatus:
2096  0000 89            	pushw	x
2097  0001 89            	pushw	x
2098       00000002      OFST:	set	2
2101                     ; 570   FlagStatus status = RESET;
2103                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2105                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2107  0002 a30210        	cpw	x,#528
2108  0005 2612          	jrne	L7501
2109                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2111  0007 9f            	ld	a,xl
2112  0008 c45237        	and	a,21047
2113  000b 2707          	jreq	L1601
2114                     ; 582       status = SET;
2116  000d ae0001        	ldw	x,#1
2117  0010 1f01          	ldw	(OFST-1,sp),x
2119  0012 2030          	jra	L5601
2120  0014               L1601:
2121                     ; 587       status = RESET;
2123  0014 5f            	clrw	x
2124  0015 1f01          	ldw	(OFST-1,sp),x
2125  0017 202b          	jra	L5601
2126  0019               L7501:
2127                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2129  0019 1e03          	ldw	x,(OFST+1,sp)
2130  001b a30101        	cpw	x,#257
2131  001e 2613          	jrne	L7601
2132                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2134  0020 c65235        	ld	a,21045
2135  0023 1504          	bcp	a,(OFST+2,sp)
2136  0025 2707          	jreq	L1701
2137                     ; 595       status = SET;
2139  0027 ae0001        	ldw	x,#1
2140  002a 1f01          	ldw	(OFST-1,sp),x
2142  002c 2016          	jra	L5601
2143  002e               L1701:
2144                     ; 600       status = RESET;
2146  002e 5f            	clrw	x
2147  002f 1f01          	ldw	(OFST-1,sp),x
2148  0031 2011          	jra	L5601
2149  0033               L7601:
2150                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2152  0033 c65230        	ld	a,21040
2153  0036 1504          	bcp	a,(OFST+2,sp)
2154  0038 2707          	jreq	L7701
2155                     ; 608       status = SET;
2157  003a ae0001        	ldw	x,#1
2158  003d 1f01          	ldw	(OFST-1,sp),x
2160  003f 2003          	jra	L5601
2161  0041               L7701:
2162                     ; 613       status = RESET;
2164  0041 5f            	clrw	x
2165  0042 1f01          	ldw	(OFST-1,sp),x
2166  0044               L5601:
2167                     ; 617   return status;
2169  0044 1e01          	ldw	x,(OFST-1,sp)
2172  0046 5b04          	addw	sp,#4
2173  0048 81            	ret
2208                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2208                     ; 647 {
2209                     .text:	section	.text,new
2210  0000               _UART1_ClearFlag:
2214                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2216                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2218  0000 a30020        	cpw	x,#32
2219  0003 2606          	jrne	L1211
2220                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2222  0005 35df5230      	mov	21040,#223
2224  0009 2004          	jra	L3211
2225  000b               L1211:
2226                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2228  000b 72195237      	bres	21047,#4
2229  000f               L3211:
2230                     ; 660 }
2233  000f 81            	ret
2315                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2315                     ; 676 {
2316                     .text:	section	.text,new
2317  0000               _UART1_GetITStatus:
2319  0000 89            	pushw	x
2320  0001 5204          	subw	sp,#4
2321       00000004      OFST:	set	4
2324                     ; 677   ITStatus pendingbitstatus = RESET;
2326                     ; 678   uint8_t itpos = 0;
2328                     ; 679   uint8_t itmask1 = 0;
2330                     ; 680   uint8_t itmask2 = 0;
2332                     ; 681   uint8_t enablestatus = 0;
2334                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2336                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2338  0003 9f            	ld	a,xl
2339  0004 a40f          	and	a,#15
2340  0006 5f            	clrw	x
2341  0007 97            	ld	xl,a
2342  0008 a601          	ld	a,#1
2343  000a 5d            	tnzw	x
2344  000b 2704          	jreq	L27
2345  000d               L47:
2346  000d 48            	sll	a
2347  000e 5a            	decw	x
2348  000f 26fc          	jrne	L47
2349  0011               L27:
2350  0011 6b01          	ld	(OFST-3,sp),a
2351                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2353  0013 7b06          	ld	a,(OFST+2,sp)
2354  0015 4e            	swap	a
2355  0016 a40f          	and	a,#15
2356  0018 6b04          	ld	(OFST+0,sp),a
2357                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2359  001a 7b04          	ld	a,(OFST+0,sp)
2360  001c 5f            	clrw	x
2361  001d 97            	ld	xl,a
2362  001e a601          	ld	a,#1
2363  0020 5d            	tnzw	x
2364  0021 2704          	jreq	L67
2365  0023               L001:
2366  0023 48            	sll	a
2367  0024 5a            	decw	x
2368  0025 26fc          	jrne	L001
2369  0027               L67:
2370  0027 6b04          	ld	(OFST+0,sp),a
2371                     ; 695   if (UART1_IT == UART1_IT_PE)
2373  0029 1e05          	ldw	x,(OFST+1,sp)
2374  002b a30100        	cpw	x,#256
2375  002e 261e          	jrne	L7611
2376                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2378  0030 c65234        	ld	a,21044
2379  0033 1404          	and	a,(OFST+0,sp)
2380  0035 6b04          	ld	(OFST+0,sp),a
2381                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2383  0037 c65230        	ld	a,21040
2384  003a 1501          	bcp	a,(OFST-3,sp)
2385  003c 270b          	jreq	L1711
2387  003e 0d04          	tnz	(OFST+0,sp)
2388  0040 2707          	jreq	L1711
2389                     ; 704       pendingbitstatus = SET;
2391  0042 ae0001        	ldw	x,#1
2392  0045 1f02          	ldw	(OFST-2,sp),x
2394  0047 2046          	jra	L5711
2395  0049               L1711:
2396                     ; 709       pendingbitstatus = RESET;
2398  0049 5f            	clrw	x
2399  004a 1f02          	ldw	(OFST-2,sp),x
2400  004c 2041          	jra	L5711
2401  004e               L7611:
2402                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2404  004e 1e05          	ldw	x,(OFST+1,sp)
2405  0050 a30346        	cpw	x,#838
2406  0053 261e          	jrne	L7711
2407                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2409  0055 c65237        	ld	a,21047
2410  0058 1404          	and	a,(OFST+0,sp)
2411  005a 6b04          	ld	(OFST+0,sp),a
2412                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2414  005c c65237        	ld	a,21047
2415  005f 1501          	bcp	a,(OFST-3,sp)
2416  0061 270b          	jreq	L1021
2418  0063 0d04          	tnz	(OFST+0,sp)
2419  0065 2707          	jreq	L1021
2420                     ; 721       pendingbitstatus = SET;
2422  0067 ae0001        	ldw	x,#1
2423  006a 1f02          	ldw	(OFST-2,sp),x
2425  006c 2021          	jra	L5711
2426  006e               L1021:
2427                     ; 726       pendingbitstatus = RESET;
2429  006e 5f            	clrw	x
2430  006f 1f02          	ldw	(OFST-2,sp),x
2431  0071 201c          	jra	L5711
2432  0073               L7711:
2433                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2435  0073 c65235        	ld	a,21045
2436  0076 1404          	and	a,(OFST+0,sp)
2437  0078 6b04          	ld	(OFST+0,sp),a
2438                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2440  007a c65230        	ld	a,21040
2441  007d 1501          	bcp	a,(OFST-3,sp)
2442  007f 270b          	jreq	L7021
2444  0081 0d04          	tnz	(OFST+0,sp)
2445  0083 2707          	jreq	L7021
2446                     ; 737       pendingbitstatus = SET;
2448  0085 ae0001        	ldw	x,#1
2449  0088 1f02          	ldw	(OFST-2,sp),x
2451  008a 2003          	jra	L5711
2452  008c               L7021:
2453                     ; 742       pendingbitstatus = RESET;
2455  008c 5f            	clrw	x
2456  008d 1f02          	ldw	(OFST-2,sp),x
2457  008f               L5711:
2458                     ; 747   return  pendingbitstatus;
2460  008f 1e02          	ldw	x,(OFST-2,sp)
2463  0091 5b06          	addw	sp,#6
2464  0093 81            	ret
2500                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2500                     ; 776 {
2501                     .text:	section	.text,new
2502  0000               _UART1_ClearITPendingBit:
2506                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2508                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2510  0000 a30255        	cpw	x,#597
2511  0003 2606          	jrne	L1321
2512                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2514  0005 35df5230      	mov	21040,#223
2516  0009 2004          	jra	L3321
2517  000b               L1321:
2518                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2520  000b 72195237      	bres	21047,#4
2521  000f               L3321:
2522                     ; 789 }
2525  000f 81            	ret
2538                     	xdef	_UART1_ClearITPendingBit
2539                     	xdef	_UART1_GetITStatus
2540                     	xdef	_UART1_ClearFlag
2541                     	xdef	_UART1_GetFlagStatus
2542                     	xdef	_UART1_SetPrescaler
2543                     	xdef	_UART1_SetGuardTime
2544                     	xdef	_UART1_SetAddress
2545                     	xdef	_UART1_SendBreak
2546                     	xdef	_UART1_SendData9
2547                     	xdef	_UART1_SendData8
2548                     	xdef	_UART1_ReceiveData9
2549                     	xdef	_UART1_ReceiveData8
2550                     	xdef	_UART1_ReceiverWakeUpCmd
2551                     	xdef	_UART1_WakeUpConfig
2552                     	xdef	_UART1_SmartCardNACKCmd
2553                     	xdef	_UART1_SmartCardCmd
2554                     	xdef	_UART1_LINCmd
2555                     	xdef	_UART1_LINBreakDetectionConfig
2556                     	xdef	_UART1_IrDACmd
2557                     	xdef	_UART1_IrDAConfig
2558                     	xdef	_UART1_HalfDuplexCmd
2559                     	xdef	_UART1_ITConfig
2560                     	xdef	_UART1_Cmd
2561                     	xdef	_UART1_Init
2562                     	xdef	_UART1_DeInit
2563                     	xref	_CLK_GetClockFreq
2564                     	xref.b	c_lreg
2565                     	xref.b	c_x
2584                     	xref	c_lursh
2585                     	xref	c_lsub
2586                     	xref	c_smul
2587                     	xref	c_ludv
2588                     	xref	c_rtol
2589                     	xref	c_llsh
2590                     	xref	c_ltor
2591                     	end
