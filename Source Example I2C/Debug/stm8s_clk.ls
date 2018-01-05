   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32.1 - 30 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     .const:	section	.text
  16  0000               _HSIDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004               _CLKPrescTable:
  22  0004 01            	dc.b	1
  23  0005 02            	dc.b	2
  24  0006 04            	dc.b	4
  25  0007 08            	dc.b	8
  26  0008 0a            	dc.b	10
  27  0009 10            	dc.b	16
  28  000a 14            	dc.b	20
  29  000b 28            	dc.b	40
  58                     ; 64 void CLK_DeInit(void)
  58                     ; 65 {
  60                     	switch	.text
  61  0000               _CLK_DeInit:
  65                     ; 67     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  67  0000 350150c0      	mov	20672,#1
  68                     ; 68     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  70  0004 725f50c1      	clr	20673
  71                     ; 69     CLK->SWR  = CLK_SWR_RESET_VALUE;
  73  0008 35e150c4      	mov	20676,#225
  74                     ; 70     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  76  000c 725f50c5      	clr	20677
  77                     ; 71     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  79  0010 351850c6      	mov	20678,#24
  80                     ; 72     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  82  0014 35ff50c7      	mov	20679,#255
  83                     ; 73     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  85  0018 35ff50ca      	mov	20682,#255
  86                     ; 74     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  88  001c 725f50c8      	clr	20680
  89                     ; 75     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  0020 725f50c9      	clr	20681
  93  0024               L52:
  94                     ; 76     while (CLK->CCOR & CLK_CCOR_CCOEN)
  96  0024 c650c9        	ld	a,20681
  97  0027 a501          	bcp	a,#1
  98  0029 26f9          	jrne	L52
  99                     ; 78     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 101  002b 725f50c9      	clr	20681
 102                     ; 79     CLK->CANCCR = CLK_CANCCR_RESET_VALUE;
 104  002f 725f50cb      	clr	20683
 105                     ; 80     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 107  0033 725f50cc      	clr	20684
 108                     ; 81     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 110  0037 725f50cd      	clr	20685
 111                     ; 83 }
 114  003b 81            	ret
 170                     ; 94 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 170                     ; 95 {
 171                     	switch	.text
 172  003c               _CLK_FastHaltWakeUpCmd:
 176                     ; 98     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 178                     ; 100     if (NewState != DISABLE)
 180  003c 4d            	tnz	a
 181  003d 2706          	jreq	L75
 182                     ; 103         CLK->ICKR |= CLK_ICKR_FHWU;
 184  003f 721450c0      	bset	20672,#2
 186  0043 2004          	jra	L16
 187  0045               L75:
 188                     ; 108         CLK->ICKR &= (u8)(~CLK_ICKR_FHWU);
 190  0045 721550c0      	bres	20672,#2
 191  0049               L16:
 192                     ; 111 }
 195  0049 81            	ret
 230                     ; 118 void CLK_HSECmd(FunctionalState NewState)
 230                     ; 119 {
 231                     	switch	.text
 232  004a               _CLK_HSECmd:
 236                     ; 122     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 238                     ; 124     if (NewState != DISABLE)
 240  004a 4d            	tnz	a
 241  004b 2706          	jreq	L101
 242                     ; 127         CLK->ECKR |= CLK_ECKR_HSEEN;
 244  004d 721050c1      	bset	20673,#0
 246  0051 2004          	jra	L301
 247  0053               L101:
 248                     ; 132         CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
 250  0053 721150c1      	bres	20673,#0
 251  0057               L301:
 252                     ; 135 }
 255  0057 81            	ret
 290                     ; 142 void CLK_HSICmd(FunctionalState NewState)
 290                     ; 143 {
 291                     	switch	.text
 292  0058               _CLK_HSICmd:
 296                     ; 146     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 298                     ; 148     if (NewState != DISABLE)
 300  0058 4d            	tnz	a
 301  0059 2706          	jreq	L321
 302                     ; 151         CLK->ICKR |= CLK_ICKR_HSIEN;
 304  005b 721050c0      	bset	20672,#0
 306  005f 2004          	jra	L521
 307  0061               L321:
 308                     ; 156         CLK->ICKR &= (u8)(~CLK_ICKR_HSIEN);
 310  0061 721150c0      	bres	20672,#0
 311  0065               L521:
 312                     ; 159 }
 315  0065 81            	ret
 350                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 350                     ; 167 {
 351                     	switch	.text
 352  0066               _CLK_LSICmd:
 356                     ; 170     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 358                     ; 172     if (NewState != DISABLE)
 360  0066 4d            	tnz	a
 361  0067 2706          	jreq	L541
 362                     ; 175         CLK->ICKR |= CLK_ICKR_LSIEN;
 364  0069 721650c0      	bset	20672,#3
 366  006d 2004          	jra	L741
 367  006f               L541:
 368                     ; 180         CLK->ICKR &= (u8)(~CLK_ICKR_LSIEN);
 370  006f 721750c0      	bres	20672,#3
 371  0073               L741:
 372                     ; 183 }
 375  0073 81            	ret
 410                     ; 191 void CLK_CCOCmd(FunctionalState NewState)
 410                     ; 192 {
 411                     	switch	.text
 412  0074               _CLK_CCOCmd:
 416                     ; 195     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 418                     ; 197     if (NewState != DISABLE)
 420  0074 4d            	tnz	a
 421  0075 2706          	jreq	L761
 422                     ; 200         CLK->CCOR |= CLK_CCOR_CCOEN;
 424  0077 721050c9      	bset	20681,#0
 426  007b 2004          	jra	L171
 427  007d               L761:
 428                     ; 205         CLK->CCOR &= (u8)(~CLK_CCOR_CCOEN);
 430  007d 721150c9      	bres	20681,#0
 431  0081               L171:
 432                     ; 208 }
 435  0081 81            	ret
 470                     ; 217 void CLK_ClockSwitchCmd(FunctionalState NewState)
 470                     ; 218 {
 471                     	switch	.text
 472  0082               _CLK_ClockSwitchCmd:
 476                     ; 221     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 478                     ; 223     if (NewState != DISABLE )
 480  0082 4d            	tnz	a
 481  0083 2706          	jreq	L112
 482                     ; 226         CLK->SWCR |= CLK_SWCR_SWEN;
 484  0085 721250c5      	bset	20677,#1
 486  0089 2004          	jra	L312
 487  008b               L112:
 488                     ; 231         CLK->SWCR &= (u8)(~CLK_SWCR_SWEN);
 490  008b 721350c5      	bres	20677,#1
 491  008f               L312:
 492                     ; 234 }
 495  008f 81            	ret
 531                     ; 244 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 531                     ; 245 {
 532                     	switch	.text
 533  0090               _CLK_SlowActiveHaltWakeUpCmd:
 537                     ; 248     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 539                     ; 250     if (NewState != DISABLE)
 541  0090 4d            	tnz	a
 542  0091 2706          	jreq	L332
 543                     ; 253         CLK->ICKR |= CLK_ICKR_SWUAH;
 545  0093 721a50c0      	bset	20672,#5
 547  0097 2004          	jra	L532
 548  0099               L332:
 549                     ; 258         CLK->ICKR &= (u8)(~CLK_ICKR_SWUAH);
 551  0099 721b50c0      	bres	20672,#5
 552  009d               L532:
 553                     ; 261 }
 556  009d 81            	ret
 715                     ; 271 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 715                     ; 272 {
 716                     	switch	.text
 717  009e               _CLK_PeripheralClockConfig:
 719  009e 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 275     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 725                     ; 276     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 727                     ; 278     if (((u8)CLK_Peripheral & (u8)0x10) == 0x00)
 729  009f 9e            	ld	a,xh
 730  00a0 a510          	bcp	a,#16
 731  00a2 2633          	jrne	L123
 732                     ; 280         if (NewState != DISABLE)
 734  00a4 0d02          	tnz	(OFST+2,sp)
 735  00a6 2717          	jreq	L323
 736                     ; 283             CLK->PCKENR1 |= (u8)((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F));
 738  00a8 7b01          	ld	a,(OFST+1,sp)
 739  00aa a40f          	and	a,#15
 740  00ac 5f            	clrw	x
 741  00ad 97            	ld	xl,a
 742  00ae a601          	ld	a,#1
 743  00b0 5d            	tnzw	x
 744  00b1 2704          	jreq	L62
 745  00b3               L03:
 746  00b3 48            	sll	a
 747  00b4 5a            	decw	x
 748  00b5 26fc          	jrne	L03
 749  00b7               L62:
 750  00b7 ca50c7        	or	a,20679
 751  00ba c750c7        	ld	20679,a
 753  00bd 2049          	jra	L723
 754  00bf               L323:
 755                     ; 288             CLK->PCKENR1 &= (u8)(~(u8)(((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F))));
 757  00bf 7b01          	ld	a,(OFST+1,sp)
 758  00c1 a40f          	and	a,#15
 759  00c3 5f            	clrw	x
 760  00c4 97            	ld	xl,a
 761  00c5 a601          	ld	a,#1
 762  00c7 5d            	tnzw	x
 763  00c8 2704          	jreq	L23
 764  00ca               L43:
 765  00ca 48            	sll	a
 766  00cb 5a            	decw	x
 767  00cc 26fc          	jrne	L43
 768  00ce               L23:
 769  00ce 43            	cpl	a
 770  00cf c450c7        	and	a,20679
 771  00d2 c750c7        	ld	20679,a
 772  00d5 2031          	jra	L723
 773  00d7               L123:
 774                     ; 293         if (NewState != DISABLE)
 776  00d7 0d02          	tnz	(OFST+2,sp)
 777  00d9 2717          	jreq	L133
 778                     ; 296             CLK->PCKENR2 |= (u8)((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F));
 780  00db 7b01          	ld	a,(OFST+1,sp)
 781  00dd a40f          	and	a,#15
 782  00df 5f            	clrw	x
 783  00e0 97            	ld	xl,a
 784  00e1 a601          	ld	a,#1
 785  00e3 5d            	tnzw	x
 786  00e4 2704          	jreq	L63
 787  00e6               L04:
 788  00e6 48            	sll	a
 789  00e7 5a            	decw	x
 790  00e8 26fc          	jrne	L04
 791  00ea               L63:
 792  00ea ca50ca        	or	a,20682
 793  00ed c750ca        	ld	20682,a
 795  00f0 2016          	jra	L723
 796  00f2               L133:
 797                     ; 301             CLK->PCKENR2 &= (u8)(~(u8)(((u8)1 << ((u8)CLK_Peripheral & (u8)0x0F))));
 799  00f2 7b01          	ld	a,(OFST+1,sp)
 800  00f4 a40f          	and	a,#15
 801  00f6 5f            	clrw	x
 802  00f7 97            	ld	xl,a
 803  00f8 a601          	ld	a,#1
 804  00fa 5d            	tnzw	x
 805  00fb 2704          	jreq	L24
 806  00fd               L44:
 807  00fd 48            	sll	a
 808  00fe 5a            	decw	x
 809  00ff 26fc          	jrne	L44
 810  0101               L24:
 811  0101 43            	cpl	a
 812  0102 c450ca        	and	a,20682
 813  0105 c750ca        	ld	20682,a
 814  0108               L723:
 815                     ; 305 }
 818  0108 85            	popw	x
 819  0109 81            	ret
1007                     ; 318 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1007                     ; 319 {
1008                     	switch	.text
1009  010a               _CLK_ClockSwitchConfig:
1011  010a 89            	pushw	x
1012  010b 5204          	subw	sp,#4
1013       00000004      OFST:	set	4
1016                     ; 322     u16 DownCounter = CLK_TIMEOUT;
1018  010d ae0491        	ldw	x,#1169
1019  0110 1f03          	ldw	(OFST-1,sp),x
1020                     ; 323     ErrorStatus Swif = ERROR;
1022                     ; 326     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1024                     ; 327     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1026                     ; 328     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1028                     ; 329     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1030                     ; 332     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1032  0112 c650c3        	ld	a,20675
1033  0115 6b01          	ld	(OFST-3,sp),a
1034                     ; 335     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1036  0117 7b05          	ld	a,(OFST+1,sp)
1037  0119 a101          	cp	a,#1
1038  011b 2639          	jrne	L544
1039                     ; 339         CLK->SWCR |= CLK_SWCR_SWEN;
1041  011d 721250c5      	bset	20677,#1
1042                     ; 342         if (ITState != DISABLE)
1044  0121 0d09          	tnz	(OFST+5,sp)
1045  0123 2706          	jreq	L744
1046                     ; 344             CLK->SWCR |= CLK_SWCR_SWIEN;
1048  0125 721450c5      	bset	20677,#2
1050  0129 2004          	jra	L154
1051  012b               L744:
1052                     ; 348             CLK->SWCR &= (u8)(~CLK_SWCR_SWIEN);
1054  012b 721550c5      	bres	20677,#2
1055  012f               L154:
1056                     ; 352         CLK->SWR = (u8)CLK_NewClock;
1058  012f 7b06          	ld	a,(OFST+2,sp)
1059  0131 c750c4        	ld	20676,a
1061  0134 2007          	jra	L754
1062  0136               L354:
1063                     ; 356             DownCounter--;
1065  0136 1e03          	ldw	x,(OFST-1,sp)
1066  0138 1d0001        	subw	x,#1
1067  013b 1f03          	ldw	(OFST-1,sp),x
1068  013d               L754:
1069                     ; 354         while (((CLK->SWCR & CLK_SWCR_SWBSY) && (DownCounter != 0)))
1071  013d c650c5        	ld	a,20677
1072  0140 a501          	bcp	a,#1
1073  0142 2704          	jreq	L364
1075  0144 1e03          	ldw	x,(OFST-1,sp)
1076  0146 26ee          	jrne	L354
1077  0148               L364:
1078                     ; 359         if (DownCounter != 0)
1080  0148 1e03          	ldw	x,(OFST-1,sp)
1081  014a 2706          	jreq	L564
1082                     ; 361             Swif = SUCCESS;
1084  014c a601          	ld	a,#1
1085  014e 6b02          	ld	(OFST-2,sp),a
1087  0150 201b          	jra	L174
1088  0152               L564:
1089                     ; 365             Swif = ERROR;
1091  0152 0f02          	clr	(OFST-2,sp)
1092  0154 2017          	jra	L174
1093  0156               L544:
1094                     ; 373         if (ITState != DISABLE)
1096  0156 0d09          	tnz	(OFST+5,sp)
1097  0158 2706          	jreq	L374
1098                     ; 375             CLK->SWCR |= CLK_SWCR_SWIEN;
1100  015a 721450c5      	bset	20677,#2
1102  015e 2004          	jra	L574
1103  0160               L374:
1104                     ; 379             CLK->SWCR &= (u8)(~CLK_SWCR_SWIEN);
1106  0160 721550c5      	bres	20677,#2
1107  0164               L574:
1108                     ; 383         CLK->SWR = (u8)CLK_NewClock;
1110  0164 7b06          	ld	a,(OFST+2,sp)
1111  0166 c750c4        	ld	20676,a
1112                     ; 387         Swif = SUCCESS;
1114  0169 a601          	ld	a,#1
1115  016b 6b02          	ld	(OFST-2,sp),a
1116  016d               L174:
1117                     ; 392     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1119  016d 0d0a          	tnz	(OFST+6,sp)
1120  016f 260c          	jrne	L774
1122  0171 7b01          	ld	a,(OFST-3,sp)
1123  0173 a1e1          	cp	a,#225
1124  0175 2606          	jrne	L774
1125                     ; 394         CLK->ICKR &= (u8)(~CLK_ICKR_HSIEN);
1127  0177 721150c0      	bres	20672,#0
1129  017b 201e          	jra	L105
1130  017d               L774:
1131                     ; 396     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1133  017d 0d0a          	tnz	(OFST+6,sp)
1134  017f 260c          	jrne	L305
1136  0181 7b01          	ld	a,(OFST-3,sp)
1137  0183 a1d2          	cp	a,#210
1138  0185 2606          	jrne	L305
1139                     ; 398         CLK->ICKR &= (u8)(~CLK_ICKR_LSIEN);
1141  0187 721750c0      	bres	20672,#3
1143  018b 200e          	jra	L105
1144  018d               L305:
1145                     ; 400     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1147  018d 0d0a          	tnz	(OFST+6,sp)
1148  018f 260a          	jrne	L105
1150  0191 7b01          	ld	a,(OFST-3,sp)
1151  0193 a1b4          	cp	a,#180
1152  0195 2604          	jrne	L105
1153                     ; 402         CLK->ECKR &= (u8)(~CLK_ECKR_HSEEN);
1155  0197 721150c1      	bres	20673,#0
1156  019b               L105:
1157                     ; 405     return(Swif);
1159  019b 7b02          	ld	a,(OFST-2,sp)
1162  019d 5b06          	addw	sp,#6
1163  019f 81            	ret
1301                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1301                     ; 416 {
1302                     	switch	.text
1303  01a0               _CLK_HSIPrescalerConfig:
1305  01a0 88            	push	a
1306       00000000      OFST:	set	0
1309                     ; 419     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1311                     ; 422     CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
1313  01a1 c650c6        	ld	a,20678
1314  01a4 a4e7          	and	a,#231
1315  01a6 c750c6        	ld	20678,a
1316                     ; 425     CLK->CKDIVR |= (u8)HSIPrescaler;
1318  01a9 c650c6        	ld	a,20678
1319  01ac 1a01          	or	a,(OFST+1,sp)
1320  01ae c750c6        	ld	20678,a
1321                     ; 427 }
1324  01b1 84            	pop	a
1325  01b2 81            	ret
1460                     ; 438 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1460                     ; 439 {
1461                     	switch	.text
1462  01b3               _CLK_CCOConfig:
1464  01b3 88            	push	a
1465       00000000      OFST:	set	0
1468                     ; 442     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1470                     ; 445     CLK->CCOR &= (u8)(~CLK_CCOR_CCOSEL);
1472  01b4 c650c9        	ld	a,20681
1473  01b7 a4e1          	and	a,#225
1474  01b9 c750c9        	ld	20681,a
1475                     ; 448     CLK->CCOR |= (u8)CLK_CCO;
1477  01bc c650c9        	ld	a,20681
1478  01bf 1a01          	or	a,(OFST+1,sp)
1479  01c1 c750c9        	ld	20681,a
1480                     ; 451     CLK->CCOR |= CLK_CCOR_CCOEN;
1482  01c4 721050c9      	bset	20681,#0
1483                     ; 453 }
1486  01c8 84            	pop	a
1487  01c9 81            	ret
1552                     ; 463 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1552                     ; 464 {
1553                     	switch	.text
1554  01ca               _CLK_ITConfig:
1556  01ca 89            	pushw	x
1557       00000000      OFST:	set	0
1560                     ; 467     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1562                     ; 468     assert_param(IS_CLK_IT_OK(CLK_IT));
1564                     ; 470     if (NewState != DISABLE)
1566  01cb 9f            	ld	a,xl
1567  01cc 4d            	tnz	a
1568  01cd 2719          	jreq	L507
1569                     ; 472         switch (CLK_IT)
1571  01cf 9e            	ld	a,xh
1573                     ; 480         default:
1573                     ; 481             break;
1574  01d0 a00c          	sub	a,#12
1575  01d2 270a          	jreq	L146
1576  01d4 a010          	sub	a,#16
1577  01d6 2624          	jrne	L317
1578                     ; 474         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1578                     ; 475             CLK->SWCR |= CLK_SWCR_SWIEN;
1580  01d8 721450c5      	bset	20677,#2
1581                     ; 476             break;
1583  01dc 201e          	jra	L317
1584  01de               L146:
1585                     ; 477         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1585                     ; 478             CLK->CSSR |= CLK_CSSR_CSSDIE;
1587  01de 721450c8      	bset	20680,#2
1588                     ; 479             break;
1590  01e2 2018          	jra	L317
1591  01e4               L346:
1592                     ; 480         default:
1592                     ; 481             break;
1594  01e4 2016          	jra	L317
1595  01e6               L117:
1597  01e6 2014          	jra	L317
1598  01e8               L507:
1599                     ; 486         switch (CLK_IT)
1601  01e8 7b01          	ld	a,(OFST+1,sp)
1603                     ; 494         default:
1603                     ; 495             break;
1604  01ea a00c          	sub	a,#12
1605  01ec 270a          	jreq	L746
1606  01ee a010          	sub	a,#16
1607  01f0 260a          	jrne	L317
1608                     ; 488         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1608                     ; 489             CLK->SWCR  &= (u8)(~CLK_SWCR_SWIEN);
1610  01f2 721550c5      	bres	20677,#2
1611                     ; 490             break;
1613  01f6 2004          	jra	L317
1614  01f8               L746:
1615                     ; 491         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1615                     ; 492             CLK->CSSR &= (u8)(~CLK_CSSR_CSSDIE);
1617  01f8 721550c8      	bres	20680,#2
1618                     ; 493             break;
1619  01fc               L317:
1620                     ; 499 }
1623  01fc 85            	popw	x
1624  01fd 81            	ret
1625  01fe               L156:
1626                     ; 494         default:
1626                     ; 495             break;
1628  01fe 20fc          	jra	L317
1629  0200               L717:
1630  0200 20fa          	jra	L317
1665                     ; 506 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef ClockPrescaler)
1665                     ; 507 {
1666                     	switch	.text
1667  0202               _CLK_SYSCLKConfig:
1669  0202 88            	push	a
1670       00000000      OFST:	set	0
1673                     ; 510     assert_param(IS_CLK_PRESCALER_OK(ClockPrescaler));
1675                     ; 512     if (((u8)ClockPrescaler & (u8)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1677  0203 a580          	bcp	a,#128
1678  0205 2614          	jrne	L737
1679                     ; 514         CLK->CKDIVR &= (u8)(~CLK_CKDIVR_HSIDIV);
1681  0207 c650c6        	ld	a,20678
1682  020a a4e7          	and	a,#231
1683  020c c750c6        	ld	20678,a
1684                     ; 515         CLK->CKDIVR |= (u8)((u8)ClockPrescaler & (u8)CLK_CKDIVR_HSIDIV);
1686  020f 7b01          	ld	a,(OFST+1,sp)
1687  0211 a418          	and	a,#24
1688  0213 ca50c6        	or	a,20678
1689  0216 c750c6        	ld	20678,a
1691  0219 2012          	jra	L147
1692  021b               L737:
1693                     ; 519         CLK->CKDIVR &= (u8)(~CLK_CKDIVR_CPUDIV);
1695  021b c650c6        	ld	a,20678
1696  021e a4f8          	and	a,#248
1697  0220 c750c6        	ld	20678,a
1698                     ; 520         CLK->CKDIVR |= (u8)((u8)ClockPrescaler & (u8)CLK_CKDIVR_CPUDIV);
1700  0223 7b01          	ld	a,(OFST+1,sp)
1701  0225 a407          	and	a,#7
1702  0227 ca50c6        	or	a,20678
1703  022a c750c6        	ld	20678,a
1704  022d               L147:
1705                     ; 523 }
1708  022d 84            	pop	a
1709  022e 81            	ret
1765                     ; 530 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1765                     ; 531 {
1766                     	switch	.text
1767  022f               _CLK_SWIMConfig:
1771                     ; 534     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1773                     ; 536     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1775  022f 4d            	tnz	a
1776  0230 2706          	jreq	L177
1777                     ; 539         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1779  0232 721050cd      	bset	20685,#0
1781  0236 2004          	jra	L377
1782  0238               L177:
1783                     ; 544         CLK->SWIMCCR &= (u8)(~CLK_SWIMCCR_SWIMDIV);
1785  0238 721150cd      	bres	20685,#0
1786  023c               L377:
1787                     ; 547 }
1790  023c 81            	ret
1887                     ; 555 void CLK_CANConfig(CLK_CANDivider_TypeDef CLK_CANDivider)
1887                     ; 556 {
1888                     	switch	.text
1889  023d               _CLK_CANConfig:
1891  023d 88            	push	a
1892       00000000      OFST:	set	0
1895                     ; 559     assert_param(IS_CLK_CANDIVIDER_OK(CLK_CANDivider));
1897                     ; 562     CLK->CANCCR &= (u8)(~CLK_CANCCR_CANDIV);
1899  023e c650cb        	ld	a,20683
1900  0241 a4f8          	and	a,#248
1901  0243 c750cb        	ld	20683,a
1902                     ; 565     CLK->CANCCR |= (u8)CLK_CANDivider;
1904  0246 c650cb        	ld	a,20683
1905  0249 1a01          	or	a,(OFST+1,sp)
1906  024b c750cb        	ld	20683,a
1907                     ; 567 }
1910  024e 84            	pop	a
1911  024f 81            	ret
1935                     ; 577 void CLK_ClockSecuritySystemEnable(void)
1935                     ; 578 {
1936                     	switch	.text
1937  0250               _CLK_ClockSecuritySystemEnable:
1941                     ; 580     CLK->CSSR |= CLK_CSSR_CSSEN;
1943  0250 721050c8      	bset	20680,#0
1944                     ; 581 }
1947  0254 81            	ret
1972                     ; 590 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1972                     ; 591 {
1973                     	switch	.text
1974  0255               _CLK_GetSYSCLKSource:
1978                     ; 592     return((CLK_Source_TypeDef)CLK->CMSR);
1980  0255 c650c3        	ld	a,20675
1983  0258 81            	ret
2046                     ; 602 u32 CLK_GetClockFreq(void)
2046                     ; 603 {
2047                     	switch	.text
2048  0259               _CLK_GetClockFreq:
2050  0259 5209          	subw	sp,#9
2051       00000009      OFST:	set	9
2054                     ; 605     u32 clockfrequency = 0;
2056                     ; 606     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2058                     ; 607     u8 tmp = 0, presc = 0;
2062                     ; 610     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2064  025b c650c3        	ld	a,20675
2065  025e 6b09          	ld	(OFST+0,sp),a
2066                     ; 612     if (clocksource == CLK_SOURCE_HSI)
2068  0260 7b09          	ld	a,(OFST+0,sp)
2069  0262 a1e1          	cp	a,#225
2070  0264 2641          	jrne	L1111
2071                     ; 614         tmp = (u8)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2073  0266 c650c6        	ld	a,20678
2074  0269 a418          	and	a,#24
2075  026b 6b09          	ld	(OFST+0,sp),a
2076                     ; 615         tmp = (u8)(tmp >> 3);
2078  026d 0409          	srl	(OFST+0,sp)
2079  026f 0409          	srl	(OFST+0,sp)
2080  0271 0409          	srl	(OFST+0,sp)
2081                     ; 616         presc = HSIDivFactor[tmp];
2083  0273 7b09          	ld	a,(OFST+0,sp)
2084  0275 5f            	clrw	x
2085  0276 97            	ld	xl,a
2086  0277 d60000        	ld	a,(_HSIDivFactor,x)
2087  027a 6b09          	ld	(OFST+0,sp),a
2088                     ; 617         clockfrequency = HSI_VALUE / presc;
2090  027c 7b09          	ld	a,(OFST+0,sp)
2091  027e b703          	ld	c_lreg+3,a
2092  0280 3f02          	clr	c_lreg+2
2093  0282 3f01          	clr	c_lreg+1
2094  0284 3f00          	clr	c_lreg
2095  0286 96            	ldw	x,sp
2096  0287 1c0001        	addw	x,#OFST-8
2097  028a cd0000        	call	c_rtol
2099  028d ae2400        	ldw	x,#9216
2100  0290 bf02          	ldw	c_lreg+2,x
2101  0292 ae00f4        	ldw	x,#244
2102  0295 bf00          	ldw	c_lreg,x
2103  0297 96            	ldw	x,sp
2104  0298 1c0001        	addw	x,#OFST-8
2105  029b cd0000        	call	c_ludv
2107  029e 96            	ldw	x,sp
2108  029f 1c0005        	addw	x,#OFST-4
2109  02a2 cd0000        	call	c_rtol
2112  02a5 201c          	jra	L3111
2113  02a7               L1111:
2114                     ; 619     else if ( clocksource == CLK_SOURCE_LSI)
2116  02a7 7b09          	ld	a,(OFST+0,sp)
2117  02a9 a1d2          	cp	a,#210
2118  02ab 260c          	jrne	L5111
2119                     ; 621         clockfrequency = LSI_VALUE;
2121  02ad aef400        	ldw	x,#62464
2122  02b0 1f07          	ldw	(OFST-2,sp),x
2123  02b2 ae0001        	ldw	x,#1
2124  02b5 1f05          	ldw	(OFST-4,sp),x
2126  02b7 200a          	jra	L3111
2127  02b9               L5111:
2128                     ; 625         clockfrequency = HSE_VALUE;
2130  02b9 ae2400        	ldw	x,#9216
2131  02bc 1f07          	ldw	(OFST-2,sp),x
2132  02be ae00f4        	ldw	x,#244
2133  02c1 1f05          	ldw	(OFST-4,sp),x
2134  02c3               L3111:
2135                     ; 628     return((u32)clockfrequency);
2137  02c3 96            	ldw	x,sp
2138  02c4 1c0005        	addw	x,#OFST-4
2139  02c7 cd0000        	call	c_ltor
2143  02ca 5b09          	addw	sp,#9
2144  02cc 81            	ret
2243                     ; 639 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2243                     ; 640 {
2244                     	switch	.text
2245  02cd               _CLK_AdjustHSICalibrationValue:
2247  02cd 88            	push	a
2248       00000000      OFST:	set	0
2251                     ; 643     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2253                     ; 646     CLK->HSITRIMR = (u8)((CLK->HSITRIMR & (u8)(~CLK_HSITRIMR_HSITRIM))|((u8)CLK_HSICalibrationValue));
2255  02ce c650cc        	ld	a,20684
2256  02d1 a4f8          	and	a,#248
2257  02d3 1a01          	or	a,(OFST+1,sp)
2258  02d5 c750cc        	ld	20684,a
2259                     ; 648 }
2262  02d8 84            	pop	a
2263  02d9 81            	ret
2287                     ; 660 void CLK_SYSCLKEmergencyClear(void)
2287                     ; 661 {
2288                     	switch	.text
2289  02da               _CLK_SYSCLKEmergencyClear:
2293                     ; 662     CLK->SWCR &= (u8)(~CLK_SWCR_SWBSY);
2295  02da 721150c5      	bres	20677,#0
2296                     ; 663 }
2299  02de 81            	ret
2452                     ; 672 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2452                     ; 673 {
2453                     	switch	.text
2454  02df               _CLK_GetFlagStatus:
2456  02df 89            	pushw	x
2457  02e0 5203          	subw	sp,#3
2458       00000003      OFST:	set	3
2461                     ; 675     u16 statusreg = 0;
2463                     ; 676     u8 tmpreg = 0;
2465                     ; 677     FlagStatus bitstatus = RESET;
2467                     ; 680     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2469                     ; 683     statusreg = (u16)((u16)CLK_FLAG & (u16)0xFF00);
2471  02e2 01            	rrwa	x,a
2472  02e3 9f            	ld	a,xl
2473  02e4 a4ff          	and	a,#255
2474  02e6 97            	ld	xl,a
2475  02e7 4f            	clr	a
2476  02e8 02            	rlwa	x,a
2477  02e9 1f01          	ldw	(OFST-2,sp),x
2478  02eb 01            	rrwa	x,a
2479                     ; 686     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2481  02ec 1e01          	ldw	x,(OFST-2,sp)
2482  02ee a30100        	cpw	x,#256
2483  02f1 2607          	jrne	L3621
2484                     ; 688         tmpreg = CLK->ICKR;
2486  02f3 c650c0        	ld	a,20672
2487  02f6 6b03          	ld	(OFST+0,sp),a
2489  02f8 202f          	jra	L5621
2490  02fa               L3621:
2491                     ; 690     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2493  02fa 1e01          	ldw	x,(OFST-2,sp)
2494  02fc a30200        	cpw	x,#512
2495  02ff 2607          	jrne	L7621
2496                     ; 692         tmpreg = CLK->ECKR;
2498  0301 c650c1        	ld	a,20673
2499  0304 6b03          	ld	(OFST+0,sp),a
2501  0306 2021          	jra	L5621
2502  0308               L7621:
2503                     ; 694     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2505  0308 1e01          	ldw	x,(OFST-2,sp)
2506  030a a30300        	cpw	x,#768
2507  030d 2607          	jrne	L3721
2508                     ; 696         tmpreg = CLK->SWCR;
2510  030f c650c5        	ld	a,20677
2511  0312 6b03          	ld	(OFST+0,sp),a
2513  0314 2013          	jra	L5621
2514  0316               L3721:
2515                     ; 698     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2517  0316 1e01          	ldw	x,(OFST-2,sp)
2518  0318 a30400        	cpw	x,#1024
2519  031b 2607          	jrne	L7721
2520                     ; 700         tmpreg = CLK->CSSR;
2522  031d c650c8        	ld	a,20680
2523  0320 6b03          	ld	(OFST+0,sp),a
2525  0322 2005          	jra	L5621
2526  0324               L7721:
2527                     ; 704         tmpreg = CLK->CCOR;
2529  0324 c650c9        	ld	a,20681
2530  0327 6b03          	ld	(OFST+0,sp),a
2531  0329               L5621:
2532                     ; 707     if ((tmpreg & (u8)CLK_FLAG) != (u8)RESET)
2534  0329 7b05          	ld	a,(OFST+2,sp)
2535  032b 1503          	bcp	a,(OFST+0,sp)
2536  032d 2706          	jreq	L3031
2537                     ; 709         bitstatus = SET;
2539  032f a601          	ld	a,#1
2540  0331 6b03          	ld	(OFST+0,sp),a
2542  0333 2002          	jra	L5031
2543  0335               L3031:
2544                     ; 713         bitstatus = RESET;
2546  0335 0f03          	clr	(OFST+0,sp)
2547  0337               L5031:
2548                     ; 717     return((FlagStatus)bitstatus);
2550  0337 7b03          	ld	a,(OFST+0,sp)
2553  0339 5b05          	addw	sp,#5
2554  033b 81            	ret
2600                     ; 727 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2600                     ; 728 {
2601                     	switch	.text
2602  033c               _CLK_GetITStatus:
2604  033c 88            	push	a
2605  033d 88            	push	a
2606       00000001      OFST:	set	1
2609                     ; 730     ITStatus bitstatus = RESET;
2611                     ; 733     assert_param(IS_CLK_IT_OK(CLK_IT));
2613                     ; 735     if (CLK_IT == CLK_IT_SWIF)
2615  033e a11c          	cp	a,#28
2616  0340 2611          	jrne	L1331
2617                     ; 738         if ((CLK->SWCR & (u8)CLK_IT) == (u8)0x0C)
2619  0342 c450c5        	and	a,20677
2620  0345 a10c          	cp	a,#12
2621  0347 2606          	jrne	L3331
2622                     ; 740             bitstatus = SET;
2624  0349 a601          	ld	a,#1
2625  034b 6b01          	ld	(OFST+0,sp),a
2627  034d 2015          	jra	L7331
2628  034f               L3331:
2629                     ; 744             bitstatus = RESET;
2631  034f 0f01          	clr	(OFST+0,sp)
2632  0351 2011          	jra	L7331
2633  0353               L1331:
2634                     ; 750         if ((CLK->CSSR & (u8)CLK_IT) == (u8)0x0C)
2636  0353 c650c8        	ld	a,20680
2637  0356 1402          	and	a,(OFST+1,sp)
2638  0358 a10c          	cp	a,#12
2639  035a 2606          	jrne	L1431
2640                     ; 752             bitstatus = SET;
2642  035c a601          	ld	a,#1
2643  035e 6b01          	ld	(OFST+0,sp),a
2645  0360 2002          	jra	L7331
2646  0362               L1431:
2647                     ; 756             bitstatus = RESET;
2649  0362 0f01          	clr	(OFST+0,sp)
2650  0364               L7331:
2651                     ; 761     return bitstatus;
2653  0364 7b01          	ld	a,(OFST+0,sp)
2656  0366 85            	popw	x
2657  0367 81            	ret
2693                     ; 771 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2693                     ; 772 {
2694                     	switch	.text
2695  0368               _CLK_ClearITPendingBit:
2699                     ; 775     assert_param(IS_CLK_IT_OK(CLK_IT));
2701                     ; 777     if (CLK_IT == (u8)CLK_IT_CSSD)
2703  0368 a10c          	cp	a,#12
2704  036a 2606          	jrne	L3631
2705                     ; 780         CLK->CSSR &= (u8)(~CLK_CSSR_CSSD);
2707  036c 721750c8      	bres	20680,#3
2709  0370 2004          	jra	L5631
2710  0372               L3631:
2711                     ; 785         CLK->SWCR &= (u8)(~CLK_SWCR_SWIF);
2713  0372 721750c5      	bres	20677,#3
2714  0376               L5631:
2715                     ; 788 }
2718  0376 81            	ret
2753                     	xdef	_CLKPrescTable
2754                     	xdef	_HSIDivFactor
2755                     	xdef	_CLK_ClearITPendingBit
2756                     	xdef	_CLK_GetITStatus
2757                     	xdef	_CLK_GetFlagStatus
2758                     	xdef	_CLK_GetSYSCLKSource
2759                     	xdef	_CLK_GetClockFreq
2760                     	xdef	_CLK_AdjustHSICalibrationValue
2761                     	xdef	_CLK_SYSCLKEmergencyClear
2762                     	xdef	_CLK_ClockSecuritySystemEnable
2763                     	xdef	_CLK_CANConfig
2764                     	xdef	_CLK_SWIMConfig
2765                     	xdef	_CLK_SYSCLKConfig
2766                     	xdef	_CLK_ITConfig
2767                     	xdef	_CLK_CCOConfig
2768                     	xdef	_CLK_HSIPrescalerConfig
2769                     	xdef	_CLK_ClockSwitchConfig
2770                     	xdef	_CLK_PeripheralClockConfig
2771                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2772                     	xdef	_CLK_FastHaltWakeUpCmd
2773                     	xdef	_CLK_ClockSwitchCmd
2774                     	xdef	_CLK_CCOCmd
2775                     	xdef	_CLK_LSICmd
2776                     	xdef	_CLK_HSICmd
2777                     	xdef	_CLK_HSECmd
2778                     	xdef	_CLK_DeInit
2779                     	xref.b	c_lreg
2780                     	xref.b	c_x
2799                     	xref	c_ltor
2800                     	xref	c_ludv
2801                     	xref	c_rtol
2802                     	end
