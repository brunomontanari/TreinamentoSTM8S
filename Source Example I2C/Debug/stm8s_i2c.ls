   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 45 void I2C_DeInit(void)
  43                     ; 46 {
  45                     	switch	.text
  46  0000               _I2C_DeInit:
  50                     ; 47   I2C->CR1 = I2C_CR1_RESET_VALUE;
  52  0000 725f5210      	clr	21008
  53                     ; 48   I2C->CR2 = I2C_CR2_RESET_VALUE;
  55  0004 725f5211      	clr	21009
  56                     ; 49   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  58  0008 725f5212      	clr	21010
  59                     ; 50   I2C->OARL = I2C_OARL_RESET_VALUE;
  61  000c 725f5213      	clr	21011
  62                     ; 51   I2C->OARH = I2C_OARH_RESET_VALUE;
  64  0010 725f5214      	clr	21012
  65                     ; 52   I2C->ITR = I2C_ITR_RESET_VALUE;
  67  0014 725f521a      	clr	21018
  68                     ; 53   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  70  0018 725f521b      	clr	21019
  71                     ; 54   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  73  001c 725f521c      	clr	21020
  74                     ; 55   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  76  0020 3502521d      	mov	21021,#2
  77                     ; 56 }
  80  0024 81            	ret
 259                     .const:	section	.text
 260  0000               L01:
 261  0000 000186a1      	dc.l	100001
 262  0004               L21:
 263  0004 000f4240      	dc.l	1000000
 264                     ; 71 void I2C_Init(u32 OutputClockFrequencyHz, u16 OwnAddress, I2C_DutyCycle_TypeDef DutyCycle, I2C_Ack_TypeDef Ack, I2C_AddMode_TypeDef AddMode, u8 InputClockFrequencyMHz )
 264                     ; 72 {
 265                     	switch	.text
 266  0025               _I2C_Init:
 268  0025 5209          	subw	sp,#9
 269       00000009      OFST:	set	9
 272                     ; 73   u16 result = 0x0004;
 274                     ; 74   u16 tmpval = 0;
 276                     ; 75   u8 tmpccrh = 0;
 278  0027 0f07          	clr	(OFST-2,sp)
 279                     ; 78   assert_param(IS_I2C_ACK_OK(Ack));
 281                     ; 79   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 283                     ; 80   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 285                     ; 81   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 287                     ; 82   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 289                     ; 87   I2C->FREQR &= (u8)(~I2C_FREQR_FREQ);
 291  0029 c65212        	ld	a,21010
 292  002c a4c0          	and	a,#192
 293  002e c75212        	ld	21010,a
 294                     ; 89   I2C->FREQR |= InputClockFrequencyMHz;
 296  0031 c65212        	ld	a,21010
 297  0034 1a15          	or	a,(OFST+12,sp)
 298  0036 c75212        	ld	21010,a
 299                     ; 93   I2C->CR1 &= (u8)(~I2C_CR1_PE);
 301  0039 72115210      	bres	21008,#0
 302                     ; 96   I2C->CCRH &= (u8)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 304  003d c6521c        	ld	a,21020
 305  0040 a430          	and	a,#48
 306  0042 c7521c        	ld	21020,a
 307                     ; 97   I2C->CCRL &= (u8)(~I2C_CCRL_CCR);
 309  0045 725f521b      	clr	21019
 310                     ; 100   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 312  0049 96            	ldw	x,sp
 313  004a 1c000c        	addw	x,#OFST+3
 314  004d cd0000        	call	c_ltor
 316  0050 ae0000        	ldw	x,#L01
 317  0053 cd0000        	call	c_lcmp
 319  0056 2403          	jruge	L41
 320  0058 cc00e5        	jp	L131
 321  005b               L41:
 322                     ; 103     tmpccrh = I2C_CCRH_FS;
 324  005b a680          	ld	a,#128
 325  005d 6b07          	ld	(OFST-2,sp),a
 326                     ; 105     if (DutyCycle == I2C_DUTYCYCLE_2)
 328  005f 0d12          	tnz	(OFST+9,sp)
 329  0061 2630          	jrne	L331
 330                     ; 108       result = (u16) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 332  0063 96            	ldw	x,sp
 333  0064 1c000c        	addw	x,#OFST+3
 334  0067 cd0000        	call	c_ltor
 336  006a a603          	ld	a,#3
 337  006c cd0000        	call	c_smul
 339  006f 96            	ldw	x,sp
 340  0070 1c0001        	addw	x,#OFST-8
 341  0073 cd0000        	call	c_rtol
 343  0076 7b15          	ld	a,(OFST+12,sp)
 344  0078 b703          	ld	c_lreg+3,a
 345  007a 3f02          	clr	c_lreg+2
 346  007c 3f01          	clr	c_lreg+1
 347  007e 3f00          	clr	c_lreg
 348  0080 ae0004        	ldw	x,#L21
 349  0083 cd0000        	call	c_lmul
 351  0086 96            	ldw	x,sp
 352  0087 1c0001        	addw	x,#OFST-8
 353  008a cd0000        	call	c_ludv
 355  008d be02          	ldw	x,c_lreg+2
 356  008f 1f08          	ldw	(OFST-1,sp),x
 358  0091 2034          	jra	L531
 359  0093               L331:
 360                     ; 113       result = (u16) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 362  0093 96            	ldw	x,sp
 363  0094 1c000c        	addw	x,#OFST+3
 364  0097 cd0000        	call	c_ltor
 366  009a a619          	ld	a,#25
 367  009c cd0000        	call	c_smul
 369  009f 96            	ldw	x,sp
 370  00a0 1c0001        	addw	x,#OFST-8
 371  00a3 cd0000        	call	c_rtol
 373  00a6 7b15          	ld	a,(OFST+12,sp)
 374  00a8 b703          	ld	c_lreg+3,a
 375  00aa 3f02          	clr	c_lreg+2
 376  00ac 3f01          	clr	c_lreg+1
 377  00ae 3f00          	clr	c_lreg
 378  00b0 ae0004        	ldw	x,#L21
 379  00b3 cd0000        	call	c_lmul
 381  00b6 96            	ldw	x,sp
 382  00b7 1c0001        	addw	x,#OFST-8
 383  00ba cd0000        	call	c_ludv
 385  00bd be02          	ldw	x,c_lreg+2
 386  00bf 1f08          	ldw	(OFST-1,sp),x
 387                     ; 115       tmpccrh |= I2C_CCRH_DUTY;
 389  00c1 7b07          	ld	a,(OFST-2,sp)
 390  00c3 aa40          	or	a,#64
 391  00c5 6b07          	ld	(OFST-2,sp),a
 392  00c7               L531:
 393                     ; 119     if (result < (u16)0x01)
 395  00c7 1e08          	ldw	x,(OFST-1,sp)
 396  00c9 2605          	jrne	L731
 397                     ; 122       result = (u16)0x0001;
 399  00cb ae0001        	ldw	x,#1
 400  00ce 1f08          	ldw	(OFST-1,sp),x
 401  00d0               L731:
 402                     ; 128     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 404  00d0 7b15          	ld	a,(OFST+12,sp)
 405  00d2 97            	ld	xl,a
 406  00d3 a603          	ld	a,#3
 407  00d5 42            	mul	x,a
 408  00d6 a60a          	ld	a,#10
 409  00d8 cd0000        	call	c_sdivx
 411  00db 5c            	incw	x
 412  00dc 1f05          	ldw	(OFST-4,sp),x
 413                     ; 129     I2C->TRISER = (u8)tmpval;
 415  00de 7b06          	ld	a,(OFST-3,sp)
 416  00e0 c7521d        	ld	21021,a
 418  00e3 2043          	jra	L141
 419  00e5               L131:
 420                     ; 136     result = (u16)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (u8)1));
 422  00e5 96            	ldw	x,sp
 423  00e6 1c000c        	addw	x,#OFST+3
 424  00e9 cd0000        	call	c_ltor
 426  00ec 3803          	sll	c_lreg+3
 427  00ee 3902          	rlc	c_lreg+2
 428  00f0 3901          	rlc	c_lreg+1
 429  00f2 3900          	rlc	c_lreg
 430  00f4 96            	ldw	x,sp
 431  00f5 1c0001        	addw	x,#OFST-8
 432  00f8 cd0000        	call	c_rtol
 434  00fb 7b15          	ld	a,(OFST+12,sp)
 435  00fd b703          	ld	c_lreg+3,a
 436  00ff 3f02          	clr	c_lreg+2
 437  0101 3f01          	clr	c_lreg+1
 438  0103 3f00          	clr	c_lreg
 439  0105 ae0004        	ldw	x,#L21
 440  0108 cd0000        	call	c_lmul
 442  010b 96            	ldw	x,sp
 443  010c 1c0001        	addw	x,#OFST-8
 444  010f cd0000        	call	c_ludv
 446  0112 be02          	ldw	x,c_lreg+2
 447  0114 1f08          	ldw	(OFST-1,sp),x
 448                     ; 139     if (result < (u16)0x0004)
 450  0116 1e08          	ldw	x,(OFST-1,sp)
 451  0118 a30004        	cpw	x,#4
 452  011b 2405          	jruge	L341
 453                     ; 142       result = (u16)0x0004;
 455  011d ae0004        	ldw	x,#4
 456  0120 1f08          	ldw	(OFST-1,sp),x
 457  0122               L341:
 458                     ; 148     I2C->TRISER = (u8)(InputClockFrequencyMHz + 1);
 460  0122 7b15          	ld	a,(OFST+12,sp)
 461  0124 4c            	inc	a
 462  0125 c7521d        	ld	21021,a
 463  0128               L141:
 464                     ; 153   I2C->CCRL = (u8)result;
 466  0128 7b09          	ld	a,(OFST+0,sp)
 467  012a c7521b        	ld	21019,a
 468                     ; 154   I2C->CCRH = (u8)(((u8)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 470  012d 7b08          	ld	a,(OFST-1,sp)
 471  012f a40f          	and	a,#15
 472  0131 1a07          	or	a,(OFST-2,sp)
 473  0133 c7521c        	ld	21020,a
 474                     ; 157   I2C->CR1 |= I2C_CR1_PE;
 476  0136 72105210      	bset	21008,#0
 477                     ; 160   I2C_AcknowledgeConfig(Ack);
 479  013a 7b13          	ld	a,(OFST+10,sp)
 480  013c ad77          	call	_I2C_AcknowledgeConfig
 482                     ; 163   I2C->OARL = (u8)(OwnAddress);
 484  013e 7b11          	ld	a,(OFST+8,sp)
 485  0140 c75213        	ld	21011,a
 486                     ; 164   I2C->OARH = (u8)((u8)AddMode |
 486                     ; 165                    I2C_OARH_ADDCONF |
 486                     ; 166                    (u8)((OwnAddress & (u16)0x0300) >> (u8)7));
 488  0143 7b10          	ld	a,(OFST+7,sp)
 489  0145 97            	ld	xl,a
 490  0146 7b11          	ld	a,(OFST+8,sp)
 491  0148 9f            	ld	a,xl
 492  0149 a403          	and	a,#3
 493  014b 97            	ld	xl,a
 494  014c 4f            	clr	a
 495  014d 02            	rlwa	x,a
 496  014e 4f            	clr	a
 497  014f 01            	rrwa	x,a
 498  0150 48            	sll	a
 499  0151 59            	rlcw	x
 500  0152 9f            	ld	a,xl
 501  0153 6b04          	ld	(OFST-5,sp),a
 502  0155 7b14          	ld	a,(OFST+11,sp)
 503  0157 aa40          	or	a,#64
 504  0159 1a04          	or	a,(OFST-5,sp)
 505  015b c75214        	ld	21012,a
 506                     ; 167 }
 509  015e 5b09          	addw	sp,#9
 510  0160 81            	ret
 565                     ; 175 void I2C_Cmd(FunctionalState NewState)
 565                     ; 176 {
 566                     	switch	.text
 567  0161               _I2C_Cmd:
 571                     ; 179   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 573                     ; 181   if (NewState != DISABLE)
 575  0161 4d            	tnz	a
 576  0162 2706          	jreq	L371
 577                     ; 184     I2C->CR1 |= I2C_CR1_PE;
 579  0164 72105210      	bset	21008,#0
 581  0168 2004          	jra	L571
 582  016a               L371:
 583                     ; 189     I2C->CR1 &= (u8)(~I2C_CR1_PE);
 585  016a 72115210      	bres	21008,#0
 586  016e               L571:
 587                     ; 191 }
 590  016e 81            	ret
 625                     ; 199 void I2C_GeneralCallCmd(FunctionalState NewState)
 625                     ; 200 {
 626                     	switch	.text
 627  016f               _I2C_GeneralCallCmd:
 631                     ; 203   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 633                     ; 205   if (NewState != DISABLE)
 635  016f 4d            	tnz	a
 636  0170 2706          	jreq	L512
 637                     ; 208     I2C->CR1 |= I2C_CR1_ENGC;
 639  0172 721c5210      	bset	21008,#6
 641  0176 2004          	jra	L712
 642  0178               L512:
 643                     ; 213     I2C->CR1 &= (u8)(~I2C_CR1_ENGC);
 645  0178 721d5210      	bres	21008,#6
 646  017c               L712:
 647                     ; 215 }
 650  017c 81            	ret
 685                     ; 225 void I2C_GenerateSTART(FunctionalState NewState)
 685                     ; 226 {
 686                     	switch	.text
 687  017d               _I2C_GenerateSTART:
 691                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 693                     ; 231   if (NewState != DISABLE)
 695  017d 4d            	tnz	a
 696  017e 2706          	jreq	L732
 697                     ; 234     I2C->CR2 |= I2C_CR2_START;
 699  0180 72105211      	bset	21009,#0
 701  0184 2004          	jra	L142
 702  0186               L732:
 703                     ; 239     I2C->CR2 &= (u8)(~I2C_CR2_START);
 705  0186 72115211      	bres	21009,#0
 706  018a               L142:
 707                     ; 241 }
 710  018a 81            	ret
 745                     ; 249 void I2C_GenerateSTOP(FunctionalState NewState)
 745                     ; 250 {
 746                     	switch	.text
 747  018b               _I2C_GenerateSTOP:
 751                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 753                     ; 255   if (NewState != DISABLE)
 755  018b 4d            	tnz	a
 756  018c 2706          	jreq	L162
 757                     ; 258     I2C->CR2 |= I2C_CR2_STOP;
 759  018e 72125211      	bset	21009,#1
 761  0192 2004          	jra	L362
 762  0194               L162:
 763                     ; 263     I2C->CR2 &= (u8)(~I2C_CR2_STOP);
 765  0194 72135211      	bres	21009,#1
 766  0198               L362:
 767                     ; 265 }
 770  0198 81            	ret
 806                     ; 273 void I2C_SoftwareResetCmd(FunctionalState NewState)
 806                     ; 274 {
 807                     	switch	.text
 808  0199               _I2C_SoftwareResetCmd:
 812                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 814                     ; 278   if (NewState != DISABLE)
 816  0199 4d            	tnz	a
 817  019a 2706          	jreq	L303
 818                     ; 281     I2C->CR2 |= I2C_CR2_SWRST;
 820  019c 721e5211      	bset	21009,#7
 822  01a0 2004          	jra	L503
 823  01a2               L303:
 824                     ; 286     I2C->CR2 &= (u8)(~I2C_CR2_SWRST);
 826  01a2 721f5211      	bres	21009,#7
 827  01a6               L503:
 828                     ; 288 }
 831  01a6 81            	ret
 867                     ; 297 void I2C_StretchClockCmd(FunctionalState NewState)
 867                     ; 298 {
 868                     	switch	.text
 869  01a7               _I2C_StretchClockCmd:
 873                     ; 300   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 875                     ; 302   if (NewState != DISABLE)
 877  01a7 4d            	tnz	a
 878  01a8 2706          	jreq	L523
 879                     ; 305     I2C->CR1 &= (u8)(~I2C_CR1_NOSTRETCH);
 881  01aa 721f5210      	bres	21008,#7
 883  01ae 2004          	jra	L723
 884  01b0               L523:
 885                     ; 311     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 887  01b0 721e5210      	bset	21008,#7
 888  01b4               L723:
 889                     ; 313 }
 892  01b4 81            	ret
 928                     ; 323 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 928                     ; 324 {
 929                     	switch	.text
 930  01b5               _I2C_AcknowledgeConfig:
 932  01b5 88            	push	a
 933       00000000      OFST:	set	0
 936                     ; 327   assert_param(IS_I2C_ACK_OK(Ack));
 938                     ; 329   if (Ack == I2C_ACK_NONE)
 940  01b6 4d            	tnz	a
 941  01b7 2606          	jrne	L743
 942                     ; 332     I2C->CR2 &= (u8)(~I2C_CR2_ACK);
 944  01b9 72155211      	bres	21009,#2
 946  01bd 2014          	jra	L153
 947  01bf               L743:
 948                     ; 337     I2C->CR2 |= I2C_CR2_ACK;
 950  01bf 72145211      	bset	21009,#2
 951                     ; 339     if (Ack == I2C_ACK_CURR)
 953  01c3 7b01          	ld	a,(OFST+1,sp)
 954  01c5 a101          	cp	a,#1
 955  01c7 2606          	jrne	L353
 956                     ; 342       I2C->CR2 &= (u8)(~I2C_CR2_POS);
 958  01c9 72175211      	bres	21009,#3
 960  01cd 2004          	jra	L153
 961  01cf               L353:
 962                     ; 347       I2C->CR2 |= I2C_CR2_POS;
 964  01cf 72165211      	bset	21009,#3
 965  01d3               L153:
 966                     ; 351 }
 969  01d3 84            	pop	a
 970  01d4 81            	ret
1042                     ; 361 void I2C_ITConfig(I2C_IT_TypeDef ITName, FunctionalState NewState)
1042                     ; 362 {
1043                     	switch	.text
1044  01d5               _I2C_ITConfig:
1046  01d5 89            	pushw	x
1047       00000000      OFST:	set	0
1050                     ; 365   assert_param(IS_I2C_INTERRUPT_OK(ITName));
1052                     ; 366   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1054                     ; 368   if (NewState != DISABLE)
1056  01d6 9f            	ld	a,xl
1057  01d7 4d            	tnz	a
1058  01d8 2709          	jreq	L314
1059                     ; 371     I2C->ITR |= (u8)ITName;
1061  01da 9e            	ld	a,xh
1062  01db ca521a        	or	a,21018
1063  01de c7521a        	ld	21018,a
1065  01e1 2009          	jra	L514
1066  01e3               L314:
1067                     ; 376     I2C->ITR &= (u8)(~(u8)ITName);
1069  01e3 7b01          	ld	a,(OFST+1,sp)
1070  01e5 43            	cpl	a
1071  01e6 c4521a        	and	a,21018
1072  01e9 c7521a        	ld	21018,a
1073  01ec               L514:
1074                     ; 378 }
1077  01ec 85            	popw	x
1078  01ed 81            	ret
1114                     ; 386 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef DutyCycle)
1114                     ; 387 {
1115                     	switch	.text
1116  01ee               _I2C_FastModeDutyCycleConfig:
1120                     ; 390   assert_param(IS_I2C_DUTYCYCLE_OK(DutyCycle));
1122                     ; 392   if (DutyCycle == I2C_DUTYCYCLE_16_9)
1124  01ee a140          	cp	a,#64
1125  01f0 2606          	jrne	L534
1126                     ; 395     I2C->CCRH |= I2C_CCRH_DUTY;
1128  01f2 721c521c      	bset	21020,#6
1130  01f6 2004          	jra	L734
1131  01f8               L534:
1132                     ; 400     I2C->CCRH &= (u8)(~I2C_CCRH_DUTY);
1134  01f8 721d521c      	bres	21020,#6
1135  01fc               L734:
1136                     ; 402 }
1139  01fc 81            	ret
1317                     ; 414 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1317                     ; 415 {
1318                     	switch	.text
1319  01fd               _I2C_CheckEvent:
1321  01fd 89            	pushw	x
1322  01fe 89            	pushw	x
1323       00000002      OFST:	set	2
1326                     ; 417   u8 flag1 = 0;
1328                     ; 418   u8 flag2 = 0;
1330                     ; 419   ErrorStatus status = ERROR;
1332                     ; 422   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1334                     ; 424   flag1 = I2C->SR1;
1336  01ff c65217        	ld	a,21015
1337  0202 6b01          	ld	(OFST-1,sp),a
1338                     ; 425   flag2 = I2C->SR2;
1340  0204 c65218        	ld	a,21016
1341  0207 6b02          	ld	(OFST+0,sp),a
1342                     ; 428   if (((u16)I2C_Event & (u16)0x0F00) == 0x0700)
1344  0209 01            	rrwa	x,a
1345  020a 9f            	ld	a,xl
1346  020b a40f          	and	a,#15
1347  020d 97            	ld	xl,a
1348  020e 4f            	clr	a
1349  020f 02            	rlwa	x,a
1350  0210 a30700        	cpw	x,#1792
1351  0213 2610          	jrne	L535
1352                     ; 431     if (flag1 & (u8)I2C_Event)
1354  0215 7b04          	ld	a,(OFST+2,sp)
1355  0217 1501          	bcp	a,(OFST-1,sp)
1356  0219 2706          	jreq	L735
1357                     ; 434       status = SUCCESS;
1359  021b a601          	ld	a,#1
1360  021d 6b02          	ld	(OFST+0,sp),a
1362  021f 2012          	jra	L345
1363  0221               L735:
1364                     ; 439       status = ERROR;
1366  0221 0f02          	clr	(OFST+0,sp)
1367  0223 200e          	jra	L345
1368  0225               L535:
1369                     ; 444     if (flag2 & (u8)I2C_Event)
1371  0225 7b04          	ld	a,(OFST+2,sp)
1372  0227 1502          	bcp	a,(OFST+0,sp)
1373  0229 2706          	jreq	L545
1374                     ; 447       status = SUCCESS;
1376  022b a601          	ld	a,#1
1377  022d 6b02          	ld	(OFST+0,sp),a
1379  022f 2002          	jra	L345
1380  0231               L545:
1381                     ; 452       status = ERROR;
1383  0231 0f02          	clr	(OFST+0,sp)
1384  0233               L345:
1385                     ; 457   return status;
1387  0233 7b02          	ld	a,(OFST+0,sp)
1390  0235 5b04          	addw	sp,#4
1391  0237 81            	ret
1414                     ; 467 u8 I2C_ReceiveData(void)
1414                     ; 468 {
1415                     	switch	.text
1416  0238               _I2C_ReceiveData:
1420                     ; 470   return ((u8)I2C->DR);
1422  0238 c65216        	ld	a,21014
1425  023b 81            	ret
1490                     ; 480 void I2C_Send7bitAddress(u8 Address, I2C_Direction_TypeDef Direction)
1490                     ; 481 {
1491                     	switch	.text
1492  023c               _I2C_Send7bitAddress:
1494  023c 89            	pushw	x
1495       00000000      OFST:	set	0
1498                     ; 483   assert_param(IS_I2C_ADDRESS_OK(Address));
1500                     ; 484   assert_param(IS_I2C_DIRECTION_OK(Direction));
1502                     ; 487   Address &= (u8)0xFE;
1504  023d 7b01          	ld	a,(OFST+1,sp)
1505  023f a4fe          	and	a,#254
1506  0241 6b01          	ld	(OFST+1,sp),a
1507                     ; 490   I2C->DR = (u8)(Address | (u8)Direction);
1509  0243 7b01          	ld	a,(OFST+1,sp)
1510  0245 1a02          	or	a,(OFST+2,sp)
1511  0247 c75216        	ld	21014,a
1512                     ; 491 }
1515  024a 85            	popw	x
1516  024b 81            	ret
1550                     ; 498 void I2C_SendData(u8 Data)
1550                     ; 499 {
1551                     	switch	.text
1552  024c               _I2C_SendData:
1556                     ; 501   I2C->DR = Data;
1558  024c c75216        	ld	21014,a
1559                     ; 502 }
1562  024f 81            	ret
1759                     ; 511 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef Flag)
1759                     ; 512 {
1760                     	switch	.text
1761  0250               _I2C_GetFlagStatus:
1763  0250 89            	pushw	x
1764  0251 88            	push	a
1765       00000001      OFST:	set	1
1768                     ; 514   FlagStatus bitstatus = RESET;
1770  0252 0f01          	clr	(OFST+0,sp)
1771                     ; 517   assert_param(IS_I2C_FLAG_OK(Flag));
1773                     ; 520   switch ((u16)Flag & (u16)0xF000)
1775  0254 01            	rrwa	x,a
1776  0255 9f            	ld	a,xl
1777  0256 a4f0          	and	a,#240
1778  0258 97            	ld	xl,a
1779  0259 4f            	clr	a
1780  025a 02            	rlwa	x,a
1782                     ; 568     default:
1782                     ; 569       break;
1783  025b 1d1000        	subw	x,#4096
1784  025e 270c          	jreq	L136
1785  0260 1d1000        	subw	x,#4096
1786  0263 2718          	jreq	L336
1787  0265 1d1000        	subw	x,#4096
1788  0268 2724          	jreq	L536
1789  026a 2031          	jra	L147
1790  026c               L136:
1791                     ; 524     case 0x1000:
1791                     ; 525       /* Check the status of the specified I2C flag */
1791                     ; 526       if ((I2C->SR1 & (u8)Flag) != 0)
1793  026c c65217        	ld	a,21015
1794  026f 1503          	bcp	a,(OFST+2,sp)
1795  0271 2706          	jreq	L347
1796                     ; 529         bitstatus = SET;
1798  0273 a601          	ld	a,#1
1799  0275 6b01          	ld	(OFST+0,sp),a
1801  0277 2024          	jra	L147
1802  0279               L347:
1803                     ; 534         bitstatus = RESET;
1805  0279 0f01          	clr	(OFST+0,sp)
1806  027b 2020          	jra	L147
1807  027d               L336:
1808                     ; 539     case 0x2000:
1808                     ; 540       /* Check the status of the specified I2C flag */
1808                     ; 541       if ((I2C->SR2 & (u8)Flag) != 0)
1810  027d c65218        	ld	a,21016
1811  0280 1503          	bcp	a,(OFST+2,sp)
1812  0282 2706          	jreq	L747
1813                     ; 544         bitstatus = SET;
1815  0284 a601          	ld	a,#1
1816  0286 6b01          	ld	(OFST+0,sp),a
1818  0288 2013          	jra	L147
1819  028a               L747:
1820                     ; 549         bitstatus = RESET;
1822  028a 0f01          	clr	(OFST+0,sp)
1823  028c 200f          	jra	L147
1824  028e               L536:
1825                     ; 554     case 0x3000:
1825                     ; 555       /* Check the status of the specified I2C flag */
1825                     ; 556       if ((I2C->SR3 & (u8)Flag) != 0)
1827  028e c65219        	ld	a,21017
1828  0291 1503          	bcp	a,(OFST+2,sp)
1829  0293 2706          	jreq	L357
1830                     ; 559         bitstatus = SET;
1832  0295 a601          	ld	a,#1
1833  0297 6b01          	ld	(OFST+0,sp),a
1835  0299 2002          	jra	L147
1836  029b               L357:
1837                     ; 564         bitstatus = RESET;
1839  029b 0f01          	clr	(OFST+0,sp)
1840  029d               L736:
1841                     ; 568     default:
1841                     ; 569       break;
1843  029d               L147:
1844                     ; 573   return bitstatus;
1846  029d 7b01          	ld	a,(OFST+0,sp)
1849  029f 5b03          	addw	sp,#3
1850  02a1 81            	ret
1912                     ; 592 void I2C_ClearFlag(I2C_Flag_TypeDef Flag)
1912                     ; 593 {
1913                     	switch	.text
1914  02a2               _I2C_ClearFlag:
1916  02a2 89            	pushw	x
1917  02a3 5204          	subw	sp,#4
1918       00000004      OFST:	set	4
1921                     ; 594   u8 tmp1 = 0;
1923                     ; 595   u8 tmp2 = 0;
1925                     ; 596   u16 tmp3 = 0;
1927                     ; 599   assert_param(IS_I2C_CLEAR_FLAG_OK(Flag));
1929                     ; 602   tmp3 = ((u16)Flag & (u16)0x0F00);
1931  02a5 01            	rrwa	x,a
1932  02a6 9f            	ld	a,xl
1933  02a7 a40f          	and	a,#15
1934  02a9 97            	ld	xl,a
1935  02aa 4f            	clr	a
1936  02ab 02            	rlwa	x,a
1937  02ac 1f03          	ldw	(OFST-1,sp),x
1938  02ae 01            	rrwa	x,a
1939                     ; 605   if(tmp3 == 0x0100)
1941  02af 1e03          	ldw	x,(OFST-1,sp)
1942  02b1 a30100        	cpw	x,#256
1943  02b4 2608          	jrne	L1101
1944                     ; 608       I2C->SR2 = (u8)(~(u8)Flag);
1946  02b6 7b06          	ld	a,(OFST+2,sp)
1947  02b8 43            	cpl	a
1948  02b9 c75218        	ld	21016,a
1950  02bc 202d          	jra	L3101
1951  02be               L1101:
1952                     ; 611   else if(tmp3 == 0x0200)
1954  02be 1e03          	ldw	x,(OFST-1,sp)
1955  02c0 a30200        	cpw	x,#512
1956  02c3 260a          	jrne	L5101
1957                     ; 614       tmp1 = I2C->SR1;
1959  02c5 c65217        	ld	a,21015
1960                     ; 616       I2C->CR2 = I2C->CR2;
1962  02c8 5552115211    	mov	21009,21009
1964  02cd 201c          	jra	L3101
1965  02cf               L5101:
1966                     ; 619   else if(tmp3 == 0x0300)
1968  02cf 1e03          	ldw	x,(OFST-1,sp)
1969  02d1 a30300        	cpw	x,#768
1970  02d4 2608          	jrne	L1201
1971                     ; 623       tmp1 = I2C->SR1;
1973  02d6 c65217        	ld	a,21015
1974                     ; 625       tmp2 = I2C->SR3;
1976  02d9 c65219        	ld	a,21017
1978  02dc 200d          	jra	L3101
1979  02de               L1201:
1980                     ; 628   else if(tmp3 == 0x0400)
1982  02de 1e03          	ldw	x,(OFST-1,sp)
1983  02e0 a30400        	cpw	x,#1024
1984  02e3 2606          	jrne	L3101
1985                     ; 632       tmp1 = I2C->SR1;
1987  02e5 c65217        	ld	a,21015
1988                     ; 634       tmp2 = I2C->DR;
1990  02e8 c65216        	ld	a,21014
1991  02eb               L3101:
1992                     ; 636 }
1995  02eb 5b06          	addw	sp,#6
1996  02ed 81            	ret
2144                     ; 645 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef ITPendingBit)
2144                     ; 646 {
2145                     	switch	.text
2146  02ee               _I2C_GetITStatus:
2148  02ee 89            	pushw	x
2149  02ef 88            	push	a
2150       00000001      OFST:	set	1
2153                     ; 647     ITStatus itstatus = RESET;
2155                     ; 650     assert_param(IS_I2C_ITPENDINGBIT_OK(ITPendingBit));
2157                     ; 653     if (((u16)ITPendingBit & 0xF000) == 0x1000) /* Returns whether the status register to check is SR1 */
2159  02f0 01            	rrwa	x,a
2160  02f1 9f            	ld	a,xl
2161  02f2 a4f0          	and	a,#240
2162  02f4 97            	ld	xl,a
2163  02f5 4f            	clr	a
2164  02f6 02            	rlwa	x,a
2165  02f7 a31000        	cpw	x,#4096
2166  02fa 2611          	jrne	L5011
2167                     ; 656         if ((I2C->SR1 & (u8)ITPendingBit) != 0)
2169  02fc c65217        	ld	a,21015
2170  02ff 1503          	bcp	a,(OFST+2,sp)
2171  0301 2706          	jreq	L7011
2172                     ; 659             itstatus = SET;
2174  0303 a601          	ld	a,#1
2175  0305 6b01          	ld	(OFST+0,sp),a
2177  0307 2013          	jra	L3111
2178  0309               L7011:
2179                     ; 664             itstatus = RESET;
2181  0309 0f01          	clr	(OFST+0,sp)
2182  030b 200f          	jra	L3111
2183  030d               L5011:
2184                     ; 670         if ((I2C->SR2 & (u8)ITPendingBit) != 0)
2186  030d c65218        	ld	a,21016
2187  0310 1503          	bcp	a,(OFST+2,sp)
2188  0312 2706          	jreq	L5111
2189                     ; 673             itstatus = SET;
2191  0314 a601          	ld	a,#1
2192  0316 6b01          	ld	(OFST+0,sp),a
2194  0318 2002          	jra	L3111
2195  031a               L5111:
2196                     ; 678             itstatus = RESET;
2198  031a 0f01          	clr	(OFST+0,sp)
2199  031c               L3111:
2200                     ; 683     return itstatus;
2202  031c 7b01          	ld	a,(OFST+0,sp)
2205  031e 5b03          	addw	sp,#3
2206  0320 81            	ret
2269                     ; 703 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef ITPendingBit)
2269                     ; 704 {
2270                     	switch	.text
2271  0321               _I2C_ClearITPendingBit:
2273  0321 89            	pushw	x
2274  0322 5204          	subw	sp,#4
2275       00000004      OFST:	set	4
2278                     ; 705   u8 tmp1 = 0;
2280                     ; 706   u8 tmp2 = 0;
2282                     ; 707   u16 tmp3 = 0;
2284                     ; 710   assert_param(IS_I2C_ITPENDINGBIT_OK(ITPendingBit));
2286                     ; 713   tmp3 = ((u16)ITPendingBit & (u16)0x0F00);
2288  0324 01            	rrwa	x,a
2289  0325 9f            	ld	a,xl
2290  0326 a40f          	and	a,#15
2291  0328 97            	ld	xl,a
2292  0329 4f            	clr	a
2293  032a 02            	rlwa	x,a
2294  032b 1f03          	ldw	(OFST-1,sp),x
2295  032d 01            	rrwa	x,a
2296                     ; 716   if(tmp3 == 0x0100)
2298  032e 1e03          	ldw	x,(OFST-1,sp)
2299  0330 a30100        	cpw	x,#256
2300  0333 2608          	jrne	L3511
2301                     ; 719       I2C->SR2 = (u8)(~(u8)ITPendingBit);
2303  0335 7b06          	ld	a,(OFST+2,sp)
2304  0337 43            	cpl	a
2305  0338 c75218        	ld	21016,a
2307  033b 202d          	jra	L5511
2308  033d               L3511:
2309                     ; 722   else if(tmp3 == 0x0200)
2311  033d 1e03          	ldw	x,(OFST-1,sp)
2312  033f a30200        	cpw	x,#512
2313  0342 260a          	jrne	L7511
2314                     ; 725       tmp1 = I2C->SR1;
2316  0344 c65217        	ld	a,21015
2317                     ; 727       I2C->CR2 = I2C->CR2;
2319  0347 5552115211    	mov	21009,21009
2321  034c 201c          	jra	L5511
2322  034e               L7511:
2323                     ; 730   else if(tmp3 == 0x0300)
2325  034e 1e03          	ldw	x,(OFST-1,sp)
2326  0350 a30300        	cpw	x,#768
2327  0353 2608          	jrne	L3611
2328                     ; 734       tmp1 = I2C->SR1;
2330  0355 c65217        	ld	a,21015
2331                     ; 736       tmp2 = I2C->SR3;
2333  0358 c65219        	ld	a,21017
2335  035b 200d          	jra	L5511
2336  035d               L3611:
2337                     ; 739   else if(tmp3 == 0x0400)
2339  035d 1e03          	ldw	x,(OFST-1,sp)
2340  035f a30400        	cpw	x,#1024
2341  0362 2606          	jrne	L5511
2342                     ; 743       tmp1 = I2C->SR1;
2344  0364 c65217        	ld	a,21015
2345                     ; 745       tmp2 = I2C->DR;
2347  0367 c65216        	ld	a,21014
2348  036a               L5511:
2349                     ; 747 }
2352  036a 5b06          	addw	sp,#6
2353  036c 81            	ret
2366                     	xdef	_I2C_ClearITPendingBit
2367                     	xdef	_I2C_GetITStatus
2368                     	xdef	_I2C_ClearFlag
2369                     	xdef	_I2C_GetFlagStatus
2370                     	xdef	_I2C_SendData
2371                     	xdef	_I2C_Send7bitAddress
2372                     	xdef	_I2C_ReceiveData
2373                     	xdef	_I2C_CheckEvent
2374                     	xdef	_I2C_ITConfig
2375                     	xdef	_I2C_FastModeDutyCycleConfig
2376                     	xdef	_I2C_AcknowledgeConfig
2377                     	xdef	_I2C_StretchClockCmd
2378                     	xdef	_I2C_SoftwareResetCmd
2379                     	xdef	_I2C_GenerateSTOP
2380                     	xdef	_I2C_GenerateSTART
2381                     	xdef	_I2C_GeneralCallCmd
2382                     	xdef	_I2C_Cmd
2383                     	xdef	_I2C_Init
2384                     	xdef	_I2C_DeInit
2385                     	xref.b	c_lreg
2386                     	xref.b	c_x
2405                     	xref	c_sdivx
2406                     	xref	c_ludv
2407                     	xref	c_rtol
2408                     	xref	c_smul
2409                     	xref	c_lmul
2410                     	xref	c_lcmp
2411                     	xref	c_ltor
2412                     	end
