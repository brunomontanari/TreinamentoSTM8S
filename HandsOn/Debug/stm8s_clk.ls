   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  17                     .const:	section	.text
  18  0000               _HSIDivFactor:
  19  0000 01            	dc.b	1
  20  0001 02            	dc.b	2
  21  0002 04            	dc.b	4
  22  0003 08            	dc.b	8
  23  0004               _CLKPrescTable:
  24  0004 01            	dc.b	1
  25  0005 02            	dc.b	2
  26  0006 04            	dc.b	4
  27  0007 08            	dc.b	8
  28  0008 0a            	dc.b	10
  29  0009 10            	dc.b	16
  30  000a 14            	dc.b	20
  31  000b 28            	dc.b	40
  60                     ; 72 void CLK_DeInit(void)
  60                     ; 73 {
  62                     .text:	section	.text,new
  63  0000               _CLK_DeInit:
  67                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  69  0000 350150c0      	mov	20672,#1
  70                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  72  0004 725f50c1      	clr	20673
  73                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  75  0008 35e150c4      	mov	20676,#225
  76                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  78  000c 725f50c5      	clr	20677
  79                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  81  0010 351850c6      	mov	20678,#24
  82                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  84  0014 35ff50c7      	mov	20679,#255
  85                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  87  0018 35ff50ca      	mov	20682,#255
  88                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  90  001c 725f50c8      	clr	20680
  91                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  93  0020 725f50c9      	clr	20681
  95  0024               L52:
  96                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  98  0024 c650c9        	ld	a,20681
  99  0027 a501          	bcp	a,#1
 100  0029 26f9          	jrne	L52
 101                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
 103  002b 725f50c9      	clr	20681
 104                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 106  002f 725f50cc      	clr	20684
 107                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 109  0033 725f50cd      	clr	20685
 110                     ; 88 }
 113  0037 81            	ret
 169                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 169                     ; 100 {
 170                     .text:	section	.text,new
 171  0000               _CLK_FastHaltWakeUpCmd:
 175                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 177                     ; 104   if (NewState != DISABLE)
 179  0000 a30000        	cpw	x,#0
 180  0003 2706          	jreq	L75
 181                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
 183  0005 721450c0      	bset	20672,#2
 185  0009 2004          	jra	L16
 186  000b               L75:
 187                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 189  000b 721550c0      	bres	20672,#2
 190  000f               L16:
 191                     ; 114 }
 194  000f 81            	ret
 229                     ; 121 void CLK_HSECmd(FunctionalState NewState)
 229                     ; 122 {
 230                     .text:	section	.text,new
 231  0000               _CLK_HSECmd:
 235                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 237                     ; 126   if (NewState != DISABLE)
 239  0000 a30000        	cpw	x,#0
 240  0003 2706          	jreq	L101
 241                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
 243  0005 721050c1      	bset	20673,#0
 245  0009 2004          	jra	L301
 246  000b               L101:
 247                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 249  000b 721150c1      	bres	20673,#0
 250  000f               L301:
 251                     ; 136 }
 254  000f 81            	ret
 289                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 289                     ; 144 {
 290                     .text:	section	.text,new
 291  0000               _CLK_HSICmd:
 295                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 297                     ; 148   if (NewState != DISABLE)
 299  0000 a30000        	cpw	x,#0
 300  0003 2706          	jreq	L321
 301                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 303  0005 721050c0      	bset	20672,#0
 305  0009 2004          	jra	L521
 306  000b               L321:
 307                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 309  000b 721150c0      	bres	20672,#0
 310  000f               L521:
 311                     ; 158 }
 314  000f 81            	ret
 349                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 349                     ; 167 {
 350                     .text:	section	.text,new
 351  0000               _CLK_LSICmd:
 355                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 357                     ; 171   if (NewState != DISABLE)
 359  0000 a30000        	cpw	x,#0
 360  0003 2706          	jreq	L541
 361                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 363  0005 721650c0      	bset	20672,#3
 365  0009 2004          	jra	L741
 366  000b               L541:
 367                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 369  000b 721750c0      	bres	20672,#3
 370  000f               L741:
 371                     ; 181 }
 374  000f 81            	ret
 409                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 409                     ; 190 {
 410                     .text:	section	.text,new
 411  0000               _CLK_CCOCmd:
 415                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 417                     ; 194   if (NewState != DISABLE)
 419  0000 a30000        	cpw	x,#0
 420  0003 2706          	jreq	L761
 421                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 423  0005 721050c9      	bset	20681,#0
 425  0009 2004          	jra	L171
 426  000b               L761:
 427                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 429  000b 721150c9      	bres	20681,#0
 430  000f               L171:
 431                     ; 204 }
 434  000f 81            	ret
 469                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 469                     ; 214 {
 470                     .text:	section	.text,new
 471  0000               _CLK_ClockSwitchCmd:
 475                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 477                     ; 218   if (NewState != DISABLE )
 479  0000 a30000        	cpw	x,#0
 480  0003 2706          	jreq	L112
 481                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 483  0005 721250c5      	bset	20677,#1
 485  0009 2004          	jra	L312
 486  000b               L112:
 487                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 489  000b 721350c5      	bres	20677,#1
 490  000f               L312:
 491                     ; 228 }
 494  000f 81            	ret
 530                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 530                     ; 239 {
 531                     .text:	section	.text,new
 532  0000               _CLK_SlowActiveHaltWakeUpCmd:
 536                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 538                     ; 243   if (NewState != DISABLE)
 540  0000 a30000        	cpw	x,#0
 541  0003 2706          	jreq	L332
 542                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 544  0005 721a50c0      	bset	20672,#5
 546  0009 2004          	jra	L532
 547  000b               L332:
 548                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 550  000b 721b50c0      	bres	20672,#5
 551  000f               L532:
 552                     ; 253 }
 555  000f 81            	ret
 714                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 714                     ; 264 {
 715                     .text:	section	.text,new
 716  0000               _CLK_PeripheralClockConfig:
 718  0000 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 724                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 726                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 728  0001 9f            	ld	a,xl
 729  0002 a510          	bcp	a,#16
 730  0004 2633          	jrne	L123
 731                     ; 271     if (NewState != DISABLE)
 733  0006 1e05          	ldw	x,(OFST+5,sp)
 734  0008 2717          	jreq	L323
 735                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 737  000a 7b02          	ld	a,(OFST+2,sp)
 738  000c a40f          	and	a,#15
 739  000e 5f            	clrw	x
 740  000f 97            	ld	xl,a
 741  0010 a601          	ld	a,#1
 742  0012 5d            	tnzw	x
 743  0013 2704          	jreq	L62
 744  0015               L03:
 745  0015 48            	sll	a
 746  0016 5a            	decw	x
 747  0017 26fc          	jrne	L03
 748  0019               L62:
 749  0019 ca50c7        	or	a,20679
 750  001c c750c7        	ld	20679,a
 752  001f 2049          	jra	L723
 753  0021               L323:
 754                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 756  0021 7b02          	ld	a,(OFST+2,sp)
 757  0023 a40f          	and	a,#15
 758  0025 5f            	clrw	x
 759  0026 97            	ld	xl,a
 760  0027 a601          	ld	a,#1
 761  0029 5d            	tnzw	x
 762  002a 2704          	jreq	L23
 763  002c               L43:
 764  002c 48            	sll	a
 765  002d 5a            	decw	x
 766  002e 26fc          	jrne	L43
 767  0030               L23:
 768  0030 43            	cpl	a
 769  0031 c450c7        	and	a,20679
 770  0034 c750c7        	ld	20679,a
 771  0037 2031          	jra	L723
 772  0039               L123:
 773                     ; 284     if (NewState != DISABLE)
 775  0039 1e05          	ldw	x,(OFST+5,sp)
 776  003b 2717          	jreq	L133
 777                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 779  003d 7b02          	ld	a,(OFST+2,sp)
 780  003f a40f          	and	a,#15
 781  0041 5f            	clrw	x
 782  0042 97            	ld	xl,a
 783  0043 a601          	ld	a,#1
 784  0045 5d            	tnzw	x
 785  0046 2704          	jreq	L63
 786  0048               L04:
 787  0048 48            	sll	a
 788  0049 5a            	decw	x
 789  004a 26fc          	jrne	L04
 790  004c               L63:
 791  004c ca50ca        	or	a,20682
 792  004f c750ca        	ld	20682,a
 794  0052 2016          	jra	L723
 795  0054               L133:
 796                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 798  0054 7b02          	ld	a,(OFST+2,sp)
 799  0056 a40f          	and	a,#15
 800  0058 5f            	clrw	x
 801  0059 97            	ld	xl,a
 802  005a a601          	ld	a,#1
 803  005c 5d            	tnzw	x
 804  005d 2704          	jreq	L24
 805  005f               L44:
 806  005f 48            	sll	a
 807  0060 5a            	decw	x
 808  0061 26fc          	jrne	L44
 809  0063               L24:
 810  0063 43            	cpl	a
 811  0064 c450ca        	and	a,20682
 812  0067 c750ca        	ld	20682,a
 813  006a               L723:
 814                     ; 295 }
 817  006a 85            	popw	x
 818  006b 81            	ret
1006                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1006                     ; 310 {
1007                     .text:	section	.text,new
1008  0000               _CLK_ClockSwitchConfig:
1010  0000 89            	pushw	x
1011  0001 5204          	subw	sp,#4
1012       00000004      OFST:	set	4
1015                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
1017  0003 aeffff        	ldw	x,#65535
1018  0006 1f03          	ldw	(OFST-1,sp),x
1019                     ; 313   ErrorStatus Swif = ERROR;
1021                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1023                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1025                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1027                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1029                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1031  0008 c650c3        	ld	a,20675
1032  000b 5f            	clrw	x
1033  000c 97            	ld	xl,a
1034  000d 1f01          	ldw	(OFST-3,sp),x
1035                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1037  000f 1e05          	ldw	x,(OFST+1,sp)
1038  0011 a30001        	cpw	x,#1
1039  0014 264e          	jrne	L544
1040                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
1042  0016 721250c5      	bset	20677,#1
1043                     ; 331     if (ITState != DISABLE)
1045  001a 1e0b          	ldw	x,(OFST+7,sp)
1046  001c 2706          	jreq	L744
1047                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
1049  001e 721450c5      	bset	20677,#2
1051  0022 2004          	jra	L154
1052  0024               L744:
1053                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1055  0024 721550c5      	bres	20677,#2
1056  0028               L154:
1057                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
1059  0028 7b0a          	ld	a,(OFST+6,sp)
1060  002a c750c4        	ld	20676,a
1062  002d 2007          	jra	L754
1063  002f               L354:
1064                     ; 346       DownCounter--;
1066  002f 1e03          	ldw	x,(OFST-1,sp)
1067  0031 1d0001        	subw	x,#1
1068  0034 1f03          	ldw	(OFST-1,sp),x
1069  0036               L754:
1070                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1072  0036 c650c5        	ld	a,20677
1073  0039 a501          	bcp	a,#1
1074  003b 2704          	jreq	L364
1076  003d 1e03          	ldw	x,(OFST-1,sp)
1077  003f 26ee          	jrne	L354
1078  0041               L364:
1079                     ; 349     if(DownCounter != 0)
1081  0041 1e03          	ldw	x,(OFST-1,sp)
1082  0043 2707          	jreq	L564
1083                     ; 351       Swif = SUCCESS;
1085  0045 ae0001        	ldw	x,#1
1086  0048 1f03          	ldw	(OFST-1,sp),x
1088  004a 2003          	jra	L174
1089  004c               L564:
1090                     ; 355       Swif = ERROR;
1092  004c 5f            	clrw	x
1093  004d 1f03          	ldw	(OFST-1,sp),x
1094  004f               L174:
1095                     ; 390   if(Swif != ERROR)
1097  004f 1e03          	ldw	x,(OFST-1,sp)
1098  0051 276c          	jreq	L515
1099                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1101  0053 1e0d          	ldw	x,(OFST+9,sp)
1102  0055 2648          	jrne	L715
1104  0057 1e01          	ldw	x,(OFST-3,sp)
1105  0059 a300e1        	cpw	x,#225
1106  005c 2641          	jrne	L715
1107                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1109  005e 721150c0      	bres	20672,#0
1111  0062 205b          	jra	L515
1112  0064               L544:
1113                     ; 361     if (ITState != DISABLE)
1115  0064 1e0b          	ldw	x,(OFST+7,sp)
1116  0066 2706          	jreq	L374
1117                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
1119  0068 721450c5      	bset	20677,#2
1121  006c 2004          	jra	L574
1122  006e               L374:
1123                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1125  006e 721550c5      	bres	20677,#2
1126  0072               L574:
1127                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
1129  0072 7b0a          	ld	a,(OFST+6,sp)
1130  0074 c750c4        	ld	20676,a
1132  0077 2007          	jra	L305
1133  0079               L774:
1134                     ; 376       DownCounter--;
1136  0079 1e03          	ldw	x,(OFST-1,sp)
1137  007b 1d0001        	subw	x,#1
1138  007e 1f03          	ldw	(OFST-1,sp),x
1139  0080               L305:
1140                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
1142  0080 c650c5        	ld	a,20677
1143  0083 a508          	bcp	a,#8
1144  0085 2704          	jreq	L705
1146  0087 1e03          	ldw	x,(OFST-1,sp)
1147  0089 26ee          	jrne	L774
1148  008b               L705:
1149                     ; 379     if(DownCounter != 0)
1151  008b 1e03          	ldw	x,(OFST-1,sp)
1152  008d 270b          	jreq	L115
1153                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
1155  008f 721250c5      	bset	20677,#1
1156                     ; 383       Swif = SUCCESS;
1158  0093 ae0001        	ldw	x,#1
1159  0096 1f03          	ldw	(OFST-1,sp),x
1161  0098 20b5          	jra	L174
1162  009a               L115:
1163                     ; 387       Swif = ERROR;
1165  009a 5f            	clrw	x
1166  009b 1f03          	ldw	(OFST-1,sp),x
1167  009d 20b0          	jra	L174
1168  009f               L715:
1169                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1171  009f 1e0d          	ldw	x,(OFST+9,sp)
1172  00a1 260d          	jrne	L325
1174  00a3 1e01          	ldw	x,(OFST-3,sp)
1175  00a5 a300d2        	cpw	x,#210
1176  00a8 2606          	jrne	L325
1177                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1179  00aa 721750c0      	bres	20672,#3
1181  00ae 200f          	jra	L515
1182  00b0               L325:
1183                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1185  00b0 1e0d          	ldw	x,(OFST+9,sp)
1186  00b2 260b          	jrne	L515
1188  00b4 1e01          	ldw	x,(OFST-3,sp)
1189  00b6 a300b4        	cpw	x,#180
1190  00b9 2604          	jrne	L515
1191                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1193  00bb 721150c1      	bres	20673,#0
1194  00bf               L515:
1195                     ; 406   return(Swif);
1197  00bf 1e03          	ldw	x,(OFST-1,sp)
1200  00c1 5b06          	addw	sp,#6
1201  00c3 81            	ret
1339                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1339                     ; 416 {
1340                     .text:	section	.text,new
1341  0000               _CLK_HSIPrescalerConfig:
1345                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1347                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1349  0000 c650c6        	ld	a,20678
1350  0003 a4e7          	and	a,#231
1351  0005 c750c6        	ld	20678,a
1352                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1354  0008 9f            	ld	a,xl
1355  0009 ca50c6        	or	a,20678
1356  000c c750c6        	ld	20678,a
1357                     ; 425 }
1360  000f 81            	ret
1495                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1495                     ; 437 {
1496                     .text:	section	.text,new
1497  0000               _CLK_CCOConfig:
1501                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1503                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1505  0000 c650c9        	ld	a,20681
1506  0003 a4e1          	and	a,#225
1507  0005 c750c9        	ld	20681,a
1508                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
1510  0008 9f            	ld	a,xl
1511  0009 ca50c9        	or	a,20681
1512  000c c750c9        	ld	20681,a
1513                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
1515  000f 721050c9      	bset	20681,#0
1516                     ; 449 }
1519  0013 81            	ret
1584                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1584                     ; 460 {
1585                     .text:	section	.text,new
1586  0000               _CLK_ITConfig:
1588  0000 89            	pushw	x
1589       00000000      OFST:	set	0
1592                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1594                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
1596                     ; 465   if (NewState != DISABLE)
1598  0001 1e05          	ldw	x,(OFST+5,sp)
1599  0003 271c          	jreq	L527
1600                     ; 467     switch (CLK_IT)
1602  0005 1e01          	ldw	x,(OFST+1,sp)
1604                     ; 475     default:
1604                     ; 476       break;
1605  0007 1d000c        	subw	x,#12
1606  000a 270b          	jreq	L166
1607  000c 1d0010        	subw	x,#16
1608  000f 2626          	jrne	L337
1609                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1609                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
1611  0011 721450c5      	bset	20677,#2
1612                     ; 471       break;
1614  0015 2020          	jra	L337
1615  0017               L166:
1616                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1616                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
1618  0017 721450c8      	bset	20680,#2
1619                     ; 474       break;
1621  001b 201a          	jra	L337
1622  001d               L366:
1623                     ; 475     default:
1623                     ; 476       break;
1625  001d 2018          	jra	L337
1626  001f               L137:
1628  001f 2016          	jra	L337
1629  0021               L527:
1630                     ; 481     switch (CLK_IT)
1632  0021 1e01          	ldw	x,(OFST+1,sp)
1634                     ; 489     default:
1634                     ; 490       break;
1635  0023 1d000c        	subw	x,#12
1636  0026 270b          	jreq	L766
1637  0028 1d0010        	subw	x,#16
1638  002b 260a          	jrne	L337
1639                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1639                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1641  002d 721550c5      	bres	20677,#2
1642                     ; 485       break;
1644  0031 2004          	jra	L337
1645  0033               L766:
1646                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1646                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1648  0033 721550c8      	bres	20680,#2
1649                     ; 488       break;
1650  0037               L337:
1651                     ; 493 }
1654  0037 85            	popw	x
1655  0038 81            	ret
1656  0039               L176:
1657                     ; 489     default:
1657                     ; 490       break;
1659  0039 20fc          	jra	L337
1660  003b               L737:
1661  003b 20fa          	jra	L337
1696                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1696                     ; 501 {
1697                     .text:	section	.text,new
1698  0000               _CLK_SYSCLKConfig:
1700  0000 89            	pushw	x
1701       00000000      OFST:	set	0
1704                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1706                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1708  0001 9f            	ld	a,xl
1709  0002 a580          	bcp	a,#128
1710  0004 2614          	jrne	L757
1711                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1713  0006 c650c6        	ld	a,20678
1714  0009 a4e7          	and	a,#231
1715  000b c750c6        	ld	20678,a
1716                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1718  000e 7b02          	ld	a,(OFST+2,sp)
1719  0010 a418          	and	a,#24
1720  0012 ca50c6        	or	a,20678
1721  0015 c750c6        	ld	20678,a
1723  0018 2012          	jra	L167
1724  001a               L757:
1725                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1727  001a c650c6        	ld	a,20678
1728  001d a4f8          	and	a,#248
1729  001f c750c6        	ld	20678,a
1730                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1732  0022 7b02          	ld	a,(OFST+2,sp)
1733  0024 a407          	and	a,#7
1734  0026 ca50c6        	or	a,20678
1735  0029 c750c6        	ld	20678,a
1736  002c               L167:
1737                     ; 515 }
1740  002c 85            	popw	x
1741  002d 81            	ret
1797                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1797                     ; 524 {
1798                     .text:	section	.text,new
1799  0000               _CLK_SWIMConfig:
1803                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1805                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1807  0000 a30000        	cpw	x,#0
1808  0003 2706          	jreq	L1101
1809                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1811  0005 721050cd      	bset	20685,#0
1813  0009 2004          	jra	L3101
1814  000b               L1101:
1815                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1817  000b 721150cd      	bres	20685,#0
1818  000f               L3101:
1819                     ; 538 }
1822  000f 81            	ret
1846                     ; 547 void CLK_ClockSecuritySystemEnable(void)
1846                     ; 548 {
1847                     .text:	section	.text,new
1848  0000               _CLK_ClockSecuritySystemEnable:
1852                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
1854  0000 721050c8      	bset	20680,#0
1855                     ; 551 }
1858  0004 81            	ret
1883                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1883                     ; 560 {
1884                     .text:	section	.text,new
1885  0000               _CLK_GetSYSCLKSource:
1889                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
1891  0000 c650c3        	ld	a,20675
1892  0003 5f            	clrw	x
1893  0004 97            	ld	xl,a
1896  0005 81            	ret
1959                     ; 569 uint32_t CLK_GetClockFreq(void)
1959                     ; 570 {
1960                     .text:	section	.text,new
1961  0000               _CLK_GetClockFreq:
1963  0000 520b          	subw	sp,#11
1964       0000000b      OFST:	set	11
1967                     ; 571   uint32_t clockfrequency = 0;
1969                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1971                     ; 573   uint8_t tmp = 0, presc = 0;
1975                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1977  0002 c650c3        	ld	a,20675
1978  0005 5f            	clrw	x
1979  0006 97            	ld	xl,a
1980  0007 1f05          	ldw	(OFST-6,sp),x
1981                     ; 578   if (clocksource == CLK_SOURCE_HSI)
1983  0009 1e05          	ldw	x,(OFST-6,sp)
1984  000b a300e1        	cpw	x,#225
1985  000e 2641          	jrne	L7601
1986                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1988  0010 c650c6        	ld	a,20678
1989  0013 a418          	and	a,#24
1990  0015 6b0b          	ld	(OFST+0,sp),a
1991                     ; 581     tmp = (uint8_t)(tmp >> 3);
1993  0017 040b          	srl	(OFST+0,sp)
1994  0019 040b          	srl	(OFST+0,sp)
1995  001b 040b          	srl	(OFST+0,sp)
1996                     ; 582     presc = HSIDivFactor[tmp];
1998  001d 7b0b          	ld	a,(OFST+0,sp)
1999  001f 5f            	clrw	x
2000  0020 97            	ld	xl,a
2001  0021 d60000        	ld	a,(_HSIDivFactor,x)
2002  0024 6b0b          	ld	(OFST+0,sp),a
2003                     ; 583     clockfrequency = HSI_VALUE / presc;
2005  0026 7b0b          	ld	a,(OFST+0,sp)
2006  0028 b703          	ld	c_lreg+3,a
2007  002a 3f02          	clr	c_lreg+2
2008  002c 3f01          	clr	c_lreg+1
2009  002e 3f00          	clr	c_lreg
2010  0030 96            	ldw	x,sp
2011  0031 1c0001        	addw	x,#OFST-10
2012  0034 cd0000        	call	c_rtol
2014  0037 ae2400        	ldw	x,#9216
2015  003a bf02          	ldw	c_lreg+2,x
2016  003c ae00f4        	ldw	x,#244
2017  003f bf00          	ldw	c_lreg,x
2018  0041 96            	ldw	x,sp
2019  0042 1c0001        	addw	x,#OFST-10
2020  0045 cd0000        	call	c_ludv
2022  0048 96            	ldw	x,sp
2023  0049 1c0007        	addw	x,#OFST-4
2024  004c cd0000        	call	c_rtol
2027  004f 201d          	jra	L1701
2028  0051               L7601:
2029                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
2031  0051 1e05          	ldw	x,(OFST-6,sp)
2032  0053 a300d2        	cpw	x,#210
2033  0056 260c          	jrne	L3701
2034                     ; 587     clockfrequency = LSI_VALUE;
2036  0058 aef400        	ldw	x,#62464
2037  005b 1f09          	ldw	(OFST-2,sp),x
2038  005d ae0001        	ldw	x,#1
2039  0060 1f07          	ldw	(OFST-4,sp),x
2041  0062 200a          	jra	L1701
2042  0064               L3701:
2043                     ; 591     clockfrequency = HSE_VALUE;
2045  0064 ae2400        	ldw	x,#9216
2046  0067 1f09          	ldw	(OFST-2,sp),x
2047  0069 ae00f4        	ldw	x,#244
2048  006c 1f07          	ldw	(OFST-4,sp),x
2049  006e               L1701:
2050                     ; 594   return((uint32_t)clockfrequency);
2052  006e 96            	ldw	x,sp
2053  006f 1c0007        	addw	x,#OFST-4
2054  0072 cd0000        	call	c_ltor
2058  0075 5b0b          	addw	sp,#11
2059  0077 81            	ret
2158                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2158                     ; 605 {
2159                     .text:	section	.text,new
2160  0000               _CLK_AdjustHSICalibrationValue:
2162  0000 89            	pushw	x
2163       00000000      OFST:	set	0
2166                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2168                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2170  0001 c650cc        	ld	a,20684
2171  0004 a4f8          	and	a,#248
2172  0006 1a02          	or	a,(OFST+2,sp)
2173  0008 c750cc        	ld	20684,a
2174                     ; 611 }
2177  000b 85            	popw	x
2178  000c 81            	ret
2202                     ; 622 void CLK_SYSCLKEmergencyClear(void)
2202                     ; 623 {
2203                     .text:	section	.text,new
2204  0000               _CLK_SYSCLKEmergencyClear:
2208                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2210  0000 721150c5      	bres	20677,#0
2211                     ; 625 }
2214  0004 81            	ret
2367                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2367                     ; 635 {
2368                     .text:	section	.text,new
2369  0000               _CLK_GetFlagStatus:
2371  0000 89            	pushw	x
2372  0001 5203          	subw	sp,#3
2373       00000003      OFST:	set	3
2376                     ; 636   uint16_t statusreg = 0;
2378                     ; 637   uint8_t tmpreg = 0;
2380                     ; 638   FlagStatus bitstatus = RESET;
2382                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2384                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2386  0003 01            	rrwa	x,a
2387  0004 9f            	ld	a,xl
2388  0005 a4ff          	and	a,#255
2389  0007 97            	ld	xl,a
2390  0008 4f            	clr	a
2391  0009 02            	rlwa	x,a
2392  000a 1f02          	ldw	(OFST-1,sp),x
2393  000c 01            	rrwa	x,a
2394                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2396  000d 1e02          	ldw	x,(OFST-1,sp)
2397  000f a30100        	cpw	x,#256
2398  0012 2607          	jrne	L1421
2399                     ; 649     tmpreg = CLK->ICKR;
2401  0014 c650c0        	ld	a,20672
2402  0017 6b01          	ld	(OFST-2,sp),a
2404  0019 202f          	jra	L3421
2405  001b               L1421:
2406                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2408  001b 1e02          	ldw	x,(OFST-1,sp)
2409  001d a30200        	cpw	x,#512
2410  0020 2607          	jrne	L5421
2411                     ; 653     tmpreg = CLK->ECKR;
2413  0022 c650c1        	ld	a,20673
2414  0025 6b01          	ld	(OFST-2,sp),a
2416  0027 2021          	jra	L3421
2417  0029               L5421:
2418                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2420  0029 1e02          	ldw	x,(OFST-1,sp)
2421  002b a30300        	cpw	x,#768
2422  002e 2607          	jrne	L1521
2423                     ; 657     tmpreg = CLK->SWCR;
2425  0030 c650c5        	ld	a,20677
2426  0033 6b01          	ld	(OFST-2,sp),a
2428  0035 2013          	jra	L3421
2429  0037               L1521:
2430                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2432  0037 1e02          	ldw	x,(OFST-1,sp)
2433  0039 a30400        	cpw	x,#1024
2434  003c 2607          	jrne	L5521
2435                     ; 661     tmpreg = CLK->CSSR;
2437  003e c650c8        	ld	a,20680
2438  0041 6b01          	ld	(OFST-2,sp),a
2440  0043 2005          	jra	L3421
2441  0045               L5521:
2442                     ; 665     tmpreg = CLK->CCOR;
2444  0045 c650c9        	ld	a,20681
2445  0048 6b01          	ld	(OFST-2,sp),a
2446  004a               L3421:
2447                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2449  004a 7b05          	ld	a,(OFST+2,sp)
2450  004c 1501          	bcp	a,(OFST-2,sp)
2451  004e 2707          	jreq	L1621
2452                     ; 670     bitstatus = SET;
2454  0050 ae0001        	ldw	x,#1
2455  0053 1f02          	ldw	(OFST-1,sp),x
2457  0055 2003          	jra	L3621
2458  0057               L1621:
2459                     ; 674     bitstatus = RESET;
2461  0057 5f            	clrw	x
2462  0058 1f02          	ldw	(OFST-1,sp),x
2463  005a               L3621:
2464                     ; 678   return((FlagStatus)bitstatus);
2466  005a 1e02          	ldw	x,(OFST-1,sp)
2469  005c 5b05          	addw	sp,#5
2470  005e 81            	ret
2516                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2516                     ; 688 {
2517                     .text:	section	.text,new
2518  0000               _CLK_GetITStatus:
2520  0000 89            	pushw	x
2521  0001 89            	pushw	x
2522       00000002      OFST:	set	2
2525                     ; 689   ITStatus bitstatus = RESET;
2527                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
2529                     ; 694   if (CLK_IT == CLK_IT_SWIF)
2531  0002 a3001c        	cpw	x,#28
2532  0005 2614          	jrne	L7031
2533                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2535  0007 9f            	ld	a,xl
2536  0008 c450c5        	and	a,20677
2537  000b a10c          	cp	a,#12
2538  000d 2607          	jrne	L1131
2539                     ; 699       bitstatus = SET;
2541  000f ae0001        	ldw	x,#1
2542  0012 1f01          	ldw	(OFST-1,sp),x
2544  0014 2018          	jra	L5131
2545  0016               L1131:
2546                     ; 703       bitstatus = RESET;
2548  0016 5f            	clrw	x
2549  0017 1f01          	ldw	(OFST-1,sp),x
2550  0019 2013          	jra	L5131
2551  001b               L7031:
2552                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2554  001b c650c8        	ld	a,20680
2555  001e 1404          	and	a,(OFST+2,sp)
2556  0020 a10c          	cp	a,#12
2557  0022 2607          	jrne	L7131
2558                     ; 711       bitstatus = SET;
2560  0024 ae0001        	ldw	x,#1
2561  0027 1f01          	ldw	(OFST-1,sp),x
2563  0029 2003          	jra	L5131
2564  002b               L7131:
2565                     ; 715       bitstatus = RESET;
2567  002b 5f            	clrw	x
2568  002c 1f01          	ldw	(OFST-1,sp),x
2569  002e               L5131:
2570                     ; 720   return bitstatus;
2572  002e 1e01          	ldw	x,(OFST-1,sp)
2575  0030 5b04          	addw	sp,#4
2576  0032 81            	ret
2612                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2612                     ; 730 {
2613                     .text:	section	.text,new
2614  0000               _CLK_ClearITPendingBit:
2618                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
2620                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2622  0000 a3000c        	cpw	x,#12
2623  0003 2606          	jrne	L1431
2624                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2626  0005 721750c8      	bres	20680,#3
2628  0009 2004          	jra	L3431
2629  000b               L1431:
2630                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2632  000b 721750c5      	bres	20677,#3
2633  000f               L3431:
2634                     ; 745 }
2637  000f 81            	ret
2672                     	xdef	_CLKPrescTable
2673                     	xdef	_HSIDivFactor
2674                     	xdef	_CLK_ClearITPendingBit
2675                     	xdef	_CLK_GetITStatus
2676                     	xdef	_CLK_GetFlagStatus
2677                     	xdef	_CLK_GetSYSCLKSource
2678                     	xdef	_CLK_GetClockFreq
2679                     	xdef	_CLK_AdjustHSICalibrationValue
2680                     	xdef	_CLK_SYSCLKEmergencyClear
2681                     	xdef	_CLK_ClockSecuritySystemEnable
2682                     	xdef	_CLK_SWIMConfig
2683                     	xdef	_CLK_SYSCLKConfig
2684                     	xdef	_CLK_ITConfig
2685                     	xdef	_CLK_CCOConfig
2686                     	xdef	_CLK_HSIPrescalerConfig
2687                     	xdef	_CLK_ClockSwitchConfig
2688                     	xdef	_CLK_PeripheralClockConfig
2689                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2690                     	xdef	_CLK_FastHaltWakeUpCmd
2691                     	xdef	_CLK_ClockSwitchCmd
2692                     	xdef	_CLK_CCOCmd
2693                     	xdef	_CLK_LSICmd
2694                     	xdef	_CLK_HSICmd
2695                     	xdef	_CLK_HSECmd
2696                     	xdef	_CLK_DeInit
2697                     	xref.b	c_lreg
2698                     	xref.b	c_x
2717                     	xref	c_ltor
2718                     	xref	c_ludv
2719                     	xref	c_rtol
2720                     	end
