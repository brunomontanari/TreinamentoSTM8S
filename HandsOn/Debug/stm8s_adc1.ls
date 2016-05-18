   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
  45                     ; 52 void ADC1_DeInit(void)
  45                     ; 53 {
  47                     .text:	section	.text,new
  48  0000               _ADC1_DeInit:
  52                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  54  0000 725f5400      	clr	21504
  55                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  57  0004 725f5401      	clr	21505
  58                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  60  0008 725f5402      	clr	21506
  61                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  63  000c 725f5403      	clr	21507
  64                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  66  0010 725f5406      	clr	21510
  67                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  69  0014 725f5407      	clr	21511
  70                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  72  0018 35ff5408      	mov	21512,#255
  73                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  75  001c 35035409      	mov	21513,#3
  76                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  78  0020 725f540a      	clr	21514
  79                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  81  0024 725f540b      	clr	21515
  82                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  84  0028 725f540e      	clr	21518
  85                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  87  002c 725f540f      	clr	21519
  88                     ; 66 }
  91  0030 81            	ret
 542                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 542                     ; 89 {
 543                     .text:	section	.text,new
 544  0000               _ADC1_Init:
 546  0000 89            	pushw	x
 547       00000000      OFST:	set	0
 550                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 552                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 554                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 556                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 558                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 560                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 562                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 564                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 566                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 568  0001 1e0d          	ldw	x,(OFST+13,sp)
 569  0003 89            	pushw	x
 570  0004 1e07          	ldw	x,(OFST+7,sp)
 571  0006 89            	pushw	x
 572  0007 1e05          	ldw	x,(OFST+5,sp)
 573  0009 cd0000        	call	_ADC1_ConversionConfig
 575  000c 5b04          	addw	sp,#4
 576                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 578  000e 1e07          	ldw	x,(OFST+7,sp)
 579  0010 cd0000        	call	_ADC1_PrescalerConfig
 581                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 583  0013 1e0b          	ldw	x,(OFST+11,sp)
 584  0015 89            	pushw	x
 585  0016 1e0b          	ldw	x,(OFST+11,sp)
 586  0018 cd0000        	call	_ADC1_ExternalTriggerConfig
 588  001b 85            	popw	x
 589                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 591  001c 1e11          	ldw	x,(OFST+17,sp)
 592  001e 89            	pushw	x
 593  001f 1e11          	ldw	x,(OFST+17,sp)
 594  0021 cd0000        	call	_ADC1_SchmittTriggerConfig
 596  0024 85            	popw	x
 597                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 599  0025 72105401      	bset	21505,#0
 600                     ; 119 }
 603  0029 85            	popw	x
 604  002a 81            	ret
 639                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 639                     ; 127 {
 640                     .text:	section	.text,new
 641  0000               _ADC1_Cmd:
 645                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 647                     ; 131   if (NewState != DISABLE)
 649  0000 a30000        	cpw	x,#0
 650  0003 2706          	jreq	L362
 651                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 653  0005 72105401      	bset	21505,#0
 655  0009 2004          	jra	L562
 656  000b               L362:
 657                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 659  000b 72115401      	bres	21505,#0
 660  000f               L562:
 661                     ; 139 }
 664  000f 81            	ret
 699                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 699                     ; 147 {
 700                     .text:	section	.text,new
 701  0000               _ADC1_ScanModeCmd:
 705                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 707                     ; 151   if (NewState != DISABLE)
 709  0000 a30000        	cpw	x,#0
 710  0003 2706          	jreq	L503
 711                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 713  0005 72125402      	bset	21506,#1
 715  0009 2004          	jra	L703
 716  000b               L503:
 717                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 719  000b 72135402      	bres	21506,#1
 720  000f               L703:
 721                     ; 159 }
 724  000f 81            	ret
 759                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 759                     ; 167 {
 760                     .text:	section	.text,new
 761  0000               _ADC1_DataBufferCmd:
 765                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 767                     ; 171   if (NewState != DISABLE)
 769  0000 a30000        	cpw	x,#0
 770  0003 2706          	jreq	L723
 771                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 773  0005 721e5403      	bset	21507,#7
 775  0009 2004          	jra	L133
 776  000b               L723:
 777                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 779  000b 721f5403      	bres	21507,#7
 780  000f               L133:
 781                     ; 179 }
 784  000f 81            	ret
 940                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 940                     ; 191 {
 941                     .text:	section	.text,new
 942  0000               _ADC1_ITConfig:
 944  0000 89            	pushw	x
 945       00000000      OFST:	set	0
 948                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
 950                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 952                     ; 196   if (NewState != DISABLE)
 954  0001 1e05          	ldw	x,(OFST+5,sp)
 955  0003 270a          	jreq	L714
 956                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
 958  0005 c65400        	ld	a,21504
 959  0008 1a02          	or	a,(OFST+2,sp)
 960  000a c75400        	ld	21504,a
 962  000d 2009          	jra	L124
 963  000f               L714:
 964                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 966  000f 7b02          	ld	a,(OFST+2,sp)
 967  0011 43            	cpl	a
 968  0012 c45400        	and	a,21504
 969  0015 c75400        	ld	21504,a
 970  0018               L124:
 971                     ; 206 }
 974  0018 85            	popw	x
 975  0019 81            	ret
1011                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1011                     ; 215 {
1012                     .text:	section	.text,new
1013  0000               _ADC1_PrescalerConfig:
1017                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1019                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1021  0000 c65401        	ld	a,21505
1022  0003 a48f          	and	a,#143
1023  0005 c75401        	ld	21505,a
1024                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1026  0008 9f            	ld	a,xl
1027  0009 ca5401        	or	a,21505
1028  000c c75401        	ld	21505,a
1029                     ; 223 }
1032  000f 81            	ret
1079                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1079                     ; 234 {
1080                     .text:	section	.text,new
1081  0000               _ADC1_SchmittTriggerConfig:
1083  0000 89            	pushw	x
1084       00000000      OFST:	set	0
1087                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1089                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1091                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1093  0001 a300ff        	cpw	x,#255
1094  0004 2620          	jrne	L364
1095                     ; 241     if (NewState != DISABLE)
1097  0006 1e05          	ldw	x,(OFST+5,sp)
1098  0008 270a          	jreq	L564
1099                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1101  000a 725f5407      	clr	21511
1102                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1104  000e 725f5406      	clr	21510
1106  0012 207a          	jra	L174
1107  0014               L564:
1108                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1110  0014 c65407        	ld	a,21511
1111  0017 aaff          	or	a,#255
1112  0019 c75407        	ld	21511,a
1113                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1115  001c c65406        	ld	a,21510
1116  001f aaff          	or	a,#255
1117  0021 c75406        	ld	21510,a
1118  0024 2068          	jra	L174
1119  0026               L364:
1120                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1122  0026 9c            	rvf
1123  0027 1e01          	ldw	x,(OFST+1,sp)
1124  0029 a30008        	cpw	x,#8
1125  002c 2e2f          	jrsge	L374
1126                     ; 254     if (NewState != DISABLE)
1128  002e 1e05          	ldw	x,(OFST+5,sp)
1129  0030 2716          	jreq	L574
1130                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1132  0032 7b02          	ld	a,(OFST+2,sp)
1133  0034 5f            	clrw	x
1134  0035 97            	ld	xl,a
1135  0036 a601          	ld	a,#1
1136  0038 5d            	tnzw	x
1137  0039 2704          	jreq	L42
1138  003b               L62:
1139  003b 48            	sll	a
1140  003c 5a            	decw	x
1141  003d 26fc          	jrne	L62
1142  003f               L42:
1143  003f 43            	cpl	a
1144  0040 c45407        	and	a,21511
1145  0043 c75407        	ld	21511,a
1147  0046 2046          	jra	L174
1148  0048               L574:
1149                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1151  0048 7b02          	ld	a,(OFST+2,sp)
1152  004a 5f            	clrw	x
1153  004b 97            	ld	xl,a
1154  004c a601          	ld	a,#1
1155  004e 5d            	tnzw	x
1156  004f 2704          	jreq	L03
1157  0051               L23:
1158  0051 48            	sll	a
1159  0052 5a            	decw	x
1160  0053 26fc          	jrne	L23
1161  0055               L03:
1162  0055 ca5407        	or	a,21511
1163  0058 c75407        	ld	21511,a
1164  005b 2031          	jra	L174
1165  005d               L374:
1166                     ; 265     if (NewState != DISABLE)
1168  005d 1e05          	ldw	x,(OFST+5,sp)
1169  005f 2718          	jreq	L305
1170                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1172  0061 7b02          	ld	a,(OFST+2,sp)
1173  0063 a008          	sub	a,#8
1174  0065 5f            	clrw	x
1175  0066 97            	ld	xl,a
1176  0067 a601          	ld	a,#1
1177  0069 5d            	tnzw	x
1178  006a 2704          	jreq	L43
1179  006c               L63:
1180  006c 48            	sll	a
1181  006d 5a            	decw	x
1182  006e 26fc          	jrne	L63
1183  0070               L43:
1184  0070 43            	cpl	a
1185  0071 c45406        	and	a,21510
1186  0074 c75406        	ld	21510,a
1188  0077 2015          	jra	L174
1189  0079               L305:
1190                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1192  0079 7b02          	ld	a,(OFST+2,sp)
1193  007b a008          	sub	a,#8
1194  007d 5f            	clrw	x
1195  007e 97            	ld	xl,a
1196  007f a601          	ld	a,#1
1197  0081 5d            	tnzw	x
1198  0082 2704          	jreq	L04
1199  0084               L24:
1200  0084 48            	sll	a
1201  0085 5a            	decw	x
1202  0086 26fc          	jrne	L24
1203  0088               L04:
1204  0088 ca5406        	or	a,21510
1205  008b c75406        	ld	21510,a
1206  008e               L174:
1207                     ; 274 }
1210  008e 85            	popw	x
1211  008f 81            	ret
1268                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1268                     ; 287 {
1269                     .text:	section	.text,new
1270  0000               _ADC1_ConversionConfig:
1272  0000 89            	pushw	x
1273       00000000      OFST:	set	0
1276                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1278                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1280                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1282                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1284  0001 72175402      	bres	21506,#3
1285                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1287  0005 c65402        	ld	a,21506
1288  0008 1a08          	or	a,(OFST+8,sp)
1289  000a c75402        	ld	21506,a
1290                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1292  000d a30001        	cpw	x,#1
1293  0010 2606          	jrne	L535
1294                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1296  0012 72125401      	bset	21505,#1
1298  0016 2004          	jra	L735
1299  0018               L535:
1300                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1302  0018 72135401      	bres	21505,#1
1303  001c               L735:
1304                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1306  001c c65400        	ld	a,21504
1307  001f a4f0          	and	a,#240
1308  0021 c75400        	ld	21504,a
1309                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1311  0024 c65400        	ld	a,21504
1312  0027 1a06          	or	a,(OFST+6,sp)
1313  0029 c75400        	ld	21504,a
1314                     ; 313 }
1317  002c 85            	popw	x
1318  002d 81            	ret
1364                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1364                     ; 326 {
1365                     .text:	section	.text,new
1366  0000               _ADC1_ExternalTriggerConfig:
1368  0000 89            	pushw	x
1369       00000000      OFST:	set	0
1372                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1374                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1376                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1378  0001 c65402        	ld	a,21506
1379  0004 a4cf          	and	a,#207
1380  0006 c75402        	ld	21506,a
1381                     ; 334   if (NewState != DISABLE)
1383  0009 1e05          	ldw	x,(OFST+5,sp)
1384  000b 2706          	jreq	L365
1385                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1387  000d 721c5402      	bset	21506,#6
1389  0011 2004          	jra	L565
1390  0013               L365:
1391                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1393  0013 721d5402      	bres	21506,#6
1394  0017               L565:
1395                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1397  0017 c65402        	ld	a,21506
1398  001a 1a02          	or	a,(OFST+2,sp)
1399  001c c75402        	ld	21506,a
1400                     ; 347 }
1403  001f 85            	popw	x
1404  0020 81            	ret
1428                     ; 358 void ADC1_StartConversion(void)
1428                     ; 359 {
1429                     .text:	section	.text,new
1430  0000               _ADC1_StartConversion:
1434                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1436  0000 72105401      	bset	21505,#0
1437                     ; 361 }
1440  0004 81            	ret
1484                     ; 370 uint16_t ADC1_GetConversionValue(void)
1484                     ; 371 {
1485                     .text:	section	.text,new
1486  0000               _ADC1_GetConversionValue:
1488  0000 5205          	subw	sp,#5
1489       00000005      OFST:	set	5
1492                     ; 372   uint16_t temph = 0;
1494                     ; 373   uint8_t templ = 0;
1496                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1498  0002 c65402        	ld	a,21506
1499  0005 a508          	bcp	a,#8
1500  0007 2715          	jreq	L126
1501                     ; 378     templ = ADC1->DRL;
1503  0009 c65405        	ld	a,21509
1504  000c 6b03          	ld	(OFST-2,sp),a
1505                     ; 380     temph = ADC1->DRH;
1507  000e c65404        	ld	a,21508
1508  0011 5f            	clrw	x
1509  0012 97            	ld	xl,a
1510  0013 1f04          	ldw	(OFST-1,sp),x
1511                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1513  0015 1e04          	ldw	x,(OFST-1,sp)
1514  0017 7b03          	ld	a,(OFST-2,sp)
1515  0019 02            	rlwa	x,a
1516  001a 1f04          	ldw	(OFST-1,sp),x
1518  001c 2021          	jra	L326
1519  001e               L126:
1520                     ; 387     temph = ADC1->DRH;
1522  001e c65404        	ld	a,21508
1523  0021 5f            	clrw	x
1524  0022 97            	ld	xl,a
1525  0023 1f04          	ldw	(OFST-1,sp),x
1526                     ; 389     templ = ADC1->DRL;
1528  0025 c65405        	ld	a,21509
1529  0028 6b03          	ld	(OFST-2,sp),a
1530                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1532  002a 1e04          	ldw	x,(OFST-1,sp)
1533  002c 4f            	clr	a
1534  002d 02            	rlwa	x,a
1535  002e 1f01          	ldw	(OFST-4,sp),x
1536  0030 7b03          	ld	a,(OFST-2,sp)
1537  0032 97            	ld	xl,a
1538  0033 a640          	ld	a,#64
1539  0035 42            	mul	x,a
1540  0036 01            	rrwa	x,a
1541  0037 1a02          	or	a,(OFST-3,sp)
1542  0039 01            	rrwa	x,a
1543  003a 1a01          	or	a,(OFST-4,sp)
1544  003c 01            	rrwa	x,a
1545  003d 1f04          	ldw	(OFST-1,sp),x
1546  003f               L326:
1547                     ; 394   return ((uint16_t)temph);
1549  003f 1e04          	ldw	x,(OFST-1,sp)
1552  0041 5b05          	addw	sp,#5
1553  0043 81            	ret
1599                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1599                     ; 406 {
1600                     .text:	section	.text,new
1601  0000               _ADC1_AWDChannelConfig:
1603  0000 89            	pushw	x
1604       00000000      OFST:	set	0
1607                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1609                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1611                     ; 411   if (Channel < (uint8_t)8)
1613  0001 9c            	rvf
1614  0002 a30008        	cpw	x,#8
1615  0005 2e37          	jrsge	L746
1616                     ; 413     if (NewState != DISABLE)
1618  0007 1e05          	ldw	x,(OFST+5,sp)
1619  0009 2719          	jreq	L156
1620                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1622  000b 7b02          	ld	a,(OFST+2,sp)
1623  000d 5f            	clrw	x
1624  000e 4d            	tnz	a
1625  000f 2a01          	jrpl	L65
1626  0011 53            	cplw	x
1627  0012               L65:
1628  0012 97            	ld	xl,a
1629  0013 a601          	ld	a,#1
1630  0015 5d            	tnzw	x
1631  0016 2704          	jreq	L06
1632  0018               L26:
1633  0018 48            	sll	a
1634  0019 5a            	decw	x
1635  001a 26fc          	jrne	L26
1636  001c               L06:
1637  001c ca540f        	or	a,21519
1638  001f c7540f        	ld	21519,a
1640  0022 204b          	jra	L556
1641  0024               L156:
1642                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1644  0024 7b02          	ld	a,(OFST+2,sp)
1645  0026 5f            	clrw	x
1646  0027 4d            	tnz	a
1647  0028 2a01          	jrpl	L46
1648  002a 53            	cplw	x
1649  002b               L46:
1650  002b 97            	ld	xl,a
1651  002c a601          	ld	a,#1
1652  002e 5d            	tnzw	x
1653  002f 2704          	jreq	L66
1654  0031               L07:
1655  0031 48            	sll	a
1656  0032 5a            	decw	x
1657  0033 26fc          	jrne	L07
1658  0035               L66:
1659  0035 43            	cpl	a
1660  0036 c4540f        	and	a,21519
1661  0039 c7540f        	ld	21519,a
1662  003c 2031          	jra	L556
1663  003e               L746:
1664                     ; 424     if (NewState != DISABLE)
1666  003e 1e05          	ldw	x,(OFST+5,sp)
1667  0040 2717          	jreq	L756
1668                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1670  0042 7b02          	ld	a,(OFST+2,sp)
1671  0044 a008          	sub	a,#8
1672  0046 5f            	clrw	x
1673  0047 97            	ld	xl,a
1674  0048 a601          	ld	a,#1
1675  004a 5d            	tnzw	x
1676  004b 2704          	jreq	L27
1677  004d               L47:
1678  004d 48            	sll	a
1679  004e 5a            	decw	x
1680  004f 26fc          	jrne	L47
1681  0051               L27:
1682  0051 ca540e        	or	a,21518
1683  0054 c7540e        	ld	21518,a
1685  0057 2016          	jra	L556
1686  0059               L756:
1687                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1689  0059 7b02          	ld	a,(OFST+2,sp)
1690  005b a008          	sub	a,#8
1691  005d 5f            	clrw	x
1692  005e 97            	ld	xl,a
1693  005f a601          	ld	a,#1
1694  0061 5d            	tnzw	x
1695  0062 2704          	jreq	L67
1696  0064               L001:
1697  0064 48            	sll	a
1698  0065 5a            	decw	x
1699  0066 26fc          	jrne	L001
1700  0068               L67:
1701  0068 43            	cpl	a
1702  0069 c4540e        	and	a,21518
1703  006c c7540e        	ld	21518,a
1704  006f               L556:
1705                     ; 433 }
1708  006f 85            	popw	x
1709  0070 81            	ret
1744                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
1744                     ; 442 {
1745                     .text:	section	.text,new
1746  0000               _ADC1_SetHighThreshold:
1748  0000 89            	pushw	x
1749       00000000      OFST:	set	0
1752                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1754  0001 54            	srlw	x
1755  0002 54            	srlw	x
1756  0003 9f            	ld	a,xl
1757  0004 c75408        	ld	21512,a
1758                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
1760  0007 7b02          	ld	a,(OFST+2,sp)
1761  0009 c75409        	ld	21513,a
1762                     ; 445 }
1765  000c 85            	popw	x
1766  000d 81            	ret
1801                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
1801                     ; 454 {
1802                     .text:	section	.text,new
1803  0000               _ADC1_SetLowThreshold:
1807                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
1809  0000 9f            	ld	a,xl
1810  0001 c7540b        	ld	21515,a
1811                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1813  0004 54            	srlw	x
1814  0005 54            	srlw	x
1815  0006 9f            	ld	a,xl
1816  0007 c7540a        	ld	21514,a
1817                     ; 457 }
1820  000a 81            	ret
1873                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1873                     ; 467 {
1874                     .text:	section	.text,new
1875  0000               _ADC1_GetBufferValue:
1877  0000 88            	push	a
1878  0001 5205          	subw	sp,#5
1879       00000005      OFST:	set	5
1882                     ; 468   uint16_t temph = 0;
1884                     ; 469   uint8_t templ = 0;
1886                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
1888                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1890  0003 c65402        	ld	a,21506
1891  0006 a508          	bcp	a,#8
1892  0008 271f          	jreq	L547
1893                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1895  000a 7b06          	ld	a,(OFST+1,sp)
1896  000c 48            	sll	a
1897  000d 5f            	clrw	x
1898  000e 97            	ld	xl,a
1899  000f d653e1        	ld	a,(21473,x)
1900  0012 6b03          	ld	(OFST-2,sp),a
1901                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1903  0014 7b06          	ld	a,(OFST+1,sp)
1904  0016 48            	sll	a
1905  0017 5f            	clrw	x
1906  0018 97            	ld	xl,a
1907  0019 d653e0        	ld	a,(21472,x)
1908  001c 5f            	clrw	x
1909  001d 97            	ld	xl,a
1910  001e 1f04          	ldw	(OFST-1,sp),x
1911                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1913  0020 1e04          	ldw	x,(OFST-1,sp)
1914  0022 7b03          	ld	a,(OFST-2,sp)
1915  0024 02            	rlwa	x,a
1916  0025 1f04          	ldw	(OFST-1,sp),x
1918  0027 202b          	jra	L747
1919  0029               L547:
1920                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1922  0029 7b06          	ld	a,(OFST+1,sp)
1923  002b 48            	sll	a
1924  002c 5f            	clrw	x
1925  002d 97            	ld	xl,a
1926  002e d653e0        	ld	a,(21472,x)
1927  0031 5f            	clrw	x
1928  0032 97            	ld	xl,a
1929  0033 1f04          	ldw	(OFST-1,sp),x
1930                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1932  0035 7b06          	ld	a,(OFST+1,sp)
1933  0037 48            	sll	a
1934  0038 5f            	clrw	x
1935  0039 97            	ld	xl,a
1936  003a d653e1        	ld	a,(21473,x)
1937  003d 6b03          	ld	(OFST-2,sp),a
1938                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1940  003f 1e04          	ldw	x,(OFST-1,sp)
1941  0041 4f            	clr	a
1942  0042 02            	rlwa	x,a
1943  0043 1f01          	ldw	(OFST-4,sp),x
1944  0045 7b03          	ld	a,(OFST-2,sp)
1945  0047 97            	ld	xl,a
1946  0048 a640          	ld	a,#64
1947  004a 42            	mul	x,a
1948  004b 01            	rrwa	x,a
1949  004c 1a02          	or	a,(OFST-3,sp)
1950  004e 01            	rrwa	x,a
1951  004f 1a01          	or	a,(OFST-4,sp)
1952  0051 01            	rrwa	x,a
1953  0052 1f04          	ldw	(OFST-1,sp),x
1954  0054               L747:
1955                     ; 493   return ((uint16_t)temph);
1957  0054 1e04          	ldw	x,(OFST-1,sp)
1960  0056 5b06          	addw	sp,#6
1961  0058 81            	ret
2027                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2027                     ; 503 {
2028                     .text:	section	.text,new
2029  0000               _ADC1_GetAWDChannelStatus:
2031  0000 89            	pushw	x
2032  0001 88            	push	a
2033       00000001      OFST:	set	1
2036                     ; 504   uint8_t status = 0;
2038                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2040                     ; 509   if (Channel < (uint8_t)8)
2042  0002 9c            	rvf
2043  0003 a30008        	cpw	x,#8
2044  0006 2e17          	jrsge	L3001
2045                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2047  0008 9f            	ld	a,xl
2048  0009 5f            	clrw	x
2049  000a 4d            	tnz	a
2050  000b 2a01          	jrpl	L211
2051  000d 53            	cplw	x
2052  000e               L211:
2053  000e 97            	ld	xl,a
2054  000f a601          	ld	a,#1
2055  0011 5d            	tnzw	x
2056  0012 2704          	jreq	L411
2057  0014               L611:
2058  0014 48            	sll	a
2059  0015 5a            	decw	x
2060  0016 26fc          	jrne	L611
2061  0018               L411:
2062  0018 c4540d        	and	a,21517
2063  001b 6b01          	ld	(OFST+0,sp),a
2065  001d 2014          	jra	L5001
2066  001f               L3001:
2067                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2069  001f 7b03          	ld	a,(OFST+2,sp)
2070  0021 a008          	sub	a,#8
2071  0023 5f            	clrw	x
2072  0024 97            	ld	xl,a
2073  0025 a601          	ld	a,#1
2074  0027 5d            	tnzw	x
2075  0028 2704          	jreq	L021
2076  002a               L221:
2077  002a 48            	sll	a
2078  002b 5a            	decw	x
2079  002c 26fc          	jrne	L221
2080  002e               L021:
2081  002e c4540c        	and	a,21516
2082  0031 6b01          	ld	(OFST+0,sp),a
2083  0033               L5001:
2084                     ; 518   return ((FlagStatus)status);
2086  0033 7b01          	ld	a,(OFST+0,sp)
2087  0035 5f            	clrw	x
2088  0036 97            	ld	xl,a
2091  0037 5b03          	addw	sp,#3
2092  0039 81            	ret
2250                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2250                     ; 528 {
2251                     .text:	section	.text,new
2252  0000               _ADC1_GetFlagStatus:
2254  0000 89            	pushw	x
2255  0001 88            	push	a
2256       00000001      OFST:	set	1
2259                     ; 529   uint8_t flagstatus = 0;
2261                     ; 530   uint8_t temp = 0;
2263                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2265                     ; 535   if ((Flag & 0x0F) == 0x01)
2267  0002 01            	rrwa	x,a
2268  0003 a40f          	and	a,#15
2269  0005 5f            	clrw	x
2270  0006 02            	rlwa	x,a
2271  0007 a30001        	cpw	x,#1
2272  000a 2609          	jrne	L5701
2273                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2275  000c c65403        	ld	a,21507
2276  000f a440          	and	a,#64
2277  0011 6b01          	ld	(OFST+0,sp),a
2279  0013 204b          	jra	L7701
2280  0015               L5701:
2281                     ; 540   else if ((Flag & 0xF0) == 0x10)
2283  0015 7b02          	ld	a,(OFST+1,sp)
2284  0017 97            	ld	xl,a
2285  0018 7b03          	ld	a,(OFST+2,sp)
2286  001a a4f0          	and	a,#240
2287  001c 5f            	clrw	x
2288  001d 02            	rlwa	x,a
2289  001e a30010        	cpw	x,#16
2290  0021 2636          	jrne	L1011
2291                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2293  0023 7b03          	ld	a,(OFST+2,sp)
2294  0025 a40f          	and	a,#15
2295  0027 6b01          	ld	(OFST+0,sp),a
2296                     ; 544     if (temp < 8)
2298  0029 7b01          	ld	a,(OFST+0,sp)
2299  002b a108          	cp	a,#8
2300  002d 2414          	jruge	L3011
2301                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2303  002f 7b01          	ld	a,(OFST+0,sp)
2304  0031 5f            	clrw	x
2305  0032 97            	ld	xl,a
2306  0033 a601          	ld	a,#1
2307  0035 5d            	tnzw	x
2308  0036 2704          	jreq	L621
2309  0038               L031:
2310  0038 48            	sll	a
2311  0039 5a            	decw	x
2312  003a 26fc          	jrne	L031
2313  003c               L621:
2314  003c c4540d        	and	a,21517
2315  003f 6b01          	ld	(OFST+0,sp),a
2317  0041 201d          	jra	L7701
2318  0043               L3011:
2319                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2321  0043 7b01          	ld	a,(OFST+0,sp)
2322  0045 a008          	sub	a,#8
2323  0047 5f            	clrw	x
2324  0048 97            	ld	xl,a
2325  0049 a601          	ld	a,#1
2326  004b 5d            	tnzw	x
2327  004c 2704          	jreq	L231
2328  004e               L431:
2329  004e 48            	sll	a
2330  004f 5a            	decw	x
2331  0050 26fc          	jrne	L431
2332  0052               L231:
2333  0052 c4540c        	and	a,21516
2334  0055 6b01          	ld	(OFST+0,sp),a
2335  0057 2007          	jra	L7701
2336  0059               L1011:
2337                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2339  0059 c65400        	ld	a,21504
2340  005c 1403          	and	a,(OFST+2,sp)
2341  005e 6b01          	ld	(OFST+0,sp),a
2342  0060               L7701:
2343                     ; 557   return ((FlagStatus)flagstatus);
2345  0060 7b01          	ld	a,(OFST+0,sp)
2346  0062 5f            	clrw	x
2347  0063 97            	ld	xl,a
2350  0064 5b03          	addw	sp,#3
2351  0066 81            	ret
2395                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2395                     ; 568 {
2396                     .text:	section	.text,new
2397  0000               _ADC1_ClearFlag:
2399  0000 89            	pushw	x
2400  0001 88            	push	a
2401       00000001      OFST:	set	1
2404                     ; 569   uint8_t temp = 0;
2406                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2408                     ; 574   if ((Flag & 0x0F) == 0x01)
2410  0002 01            	rrwa	x,a
2411  0003 a40f          	and	a,#15
2412  0005 5f            	clrw	x
2413  0006 02            	rlwa	x,a
2414  0007 a30001        	cpw	x,#1
2415  000a 2606          	jrne	L3311
2416                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2418  000c 721d5403      	bres	21507,#6
2420  0010 2051          	jra	L5311
2421  0012               L3311:
2422                     ; 579   else if ((Flag & 0xF0) == 0x10)
2424  0012 7b02          	ld	a,(OFST+1,sp)
2425  0014 97            	ld	xl,a
2426  0015 7b03          	ld	a,(OFST+2,sp)
2427  0017 a4f0          	and	a,#240
2428  0019 5f            	clrw	x
2429  001a 02            	rlwa	x,a
2430  001b a30010        	cpw	x,#16
2431  001e 263a          	jrne	L7311
2432                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2434  0020 7b03          	ld	a,(OFST+2,sp)
2435  0022 a40f          	and	a,#15
2436  0024 6b01          	ld	(OFST+0,sp),a
2437                     ; 583     if (temp < 8)
2439  0026 7b01          	ld	a,(OFST+0,sp)
2440  0028 a108          	cp	a,#8
2441  002a 2416          	jruge	L1411
2442                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2444  002c 7b01          	ld	a,(OFST+0,sp)
2445  002e 5f            	clrw	x
2446  002f 97            	ld	xl,a
2447  0030 a601          	ld	a,#1
2448  0032 5d            	tnzw	x
2449  0033 2704          	jreq	L041
2450  0035               L241:
2451  0035 48            	sll	a
2452  0036 5a            	decw	x
2453  0037 26fc          	jrne	L241
2454  0039               L041:
2455  0039 43            	cpl	a
2456  003a c4540d        	and	a,21517
2457  003d c7540d        	ld	21517,a
2459  0040 2021          	jra	L5311
2460  0042               L1411:
2461                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2463  0042 7b01          	ld	a,(OFST+0,sp)
2464  0044 a008          	sub	a,#8
2465  0046 5f            	clrw	x
2466  0047 97            	ld	xl,a
2467  0048 a601          	ld	a,#1
2468  004a 5d            	tnzw	x
2469  004b 2704          	jreq	L441
2470  004d               L641:
2471  004d 48            	sll	a
2472  004e 5a            	decw	x
2473  004f 26fc          	jrne	L641
2474  0051               L441:
2475  0051 43            	cpl	a
2476  0052 c4540c        	and	a,21516
2477  0055 c7540c        	ld	21516,a
2478  0058 2009          	jra	L5311
2479  005a               L7311:
2480                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2482  005a 7b03          	ld	a,(OFST+2,sp)
2483  005c 43            	cpl	a
2484  005d c45400        	and	a,21504
2485  0060 c75400        	ld	21504,a
2486  0063               L5311:
2487                     ; 596 }
2490  0063 5b03          	addw	sp,#3
2491  0065 81            	ret
2546                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2546                     ; 617 {
2547                     .text:	section	.text,new
2548  0000               _ADC1_GetITStatus:
2550  0000 89            	pushw	x
2551  0001 5205          	subw	sp,#5
2552       00000005      OFST:	set	5
2555                     ; 618   ITStatus itstatus = RESET;
2557                     ; 619   uint8_t temp = 0;
2559                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2561                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2563  0003 01            	rrwa	x,a
2564  0004 a4f0          	and	a,#240
2565  0006 5f            	clrw	x
2566  0007 02            	rlwa	x,a
2567  0008 a30010        	cpw	x,#16
2568  000b 2650          	jrne	L5711
2569                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2571  000d 7b07          	ld	a,(OFST+2,sp)
2572  000f a40f          	and	a,#15
2573  0011 6b05          	ld	(OFST+0,sp),a
2574                     ; 628     if (temp < 8)
2576  0013 7b05          	ld	a,(OFST+0,sp)
2577  0015 a108          	cp	a,#8
2578  0017 2421          	jruge	L7711
2579                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2581  0019 c6540d        	ld	a,21517
2582  001c 5f            	clrw	x
2583  001d 97            	ld	xl,a
2584  001e 1f01          	ldw	(OFST-4,sp),x
2585  0020 7b05          	ld	a,(OFST+0,sp)
2586  0022 5f            	clrw	x
2587  0023 97            	ld	xl,a
2588  0024 a601          	ld	a,#1
2589  0026 5d            	tnzw	x
2590  0027 2704          	jreq	L251
2591  0029               L451:
2592  0029 48            	sll	a
2593  002a 5a            	decw	x
2594  002b 26fc          	jrne	L451
2595  002d               L251:
2596  002d 5f            	clrw	x
2597  002e 97            	ld	xl,a
2598  002f 01            	rrwa	x,a
2599  0030 1402          	and	a,(OFST-3,sp)
2600  0032 01            	rrwa	x,a
2601  0033 1401          	and	a,(OFST-4,sp)
2602  0035 01            	rrwa	x,a
2603  0036 1f03          	ldw	(OFST-2,sp),x
2605  0038 2037          	jra	L3021
2606  003a               L7711:
2607                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2609  003a c6540c        	ld	a,21516
2610  003d 5f            	clrw	x
2611  003e 97            	ld	xl,a
2612  003f 1f01          	ldw	(OFST-4,sp),x
2613  0041 7b05          	ld	a,(OFST+0,sp)
2614  0043 a008          	sub	a,#8
2615  0045 5f            	clrw	x
2616  0046 97            	ld	xl,a
2617  0047 a601          	ld	a,#1
2618  0049 5d            	tnzw	x
2619  004a 2704          	jreq	L651
2620  004c               L061:
2621  004c 48            	sll	a
2622  004d 5a            	decw	x
2623  004e 26fc          	jrne	L061
2624  0050               L651:
2625  0050 5f            	clrw	x
2626  0051 97            	ld	xl,a
2627  0052 01            	rrwa	x,a
2628  0053 1402          	and	a,(OFST-3,sp)
2629  0055 01            	rrwa	x,a
2630  0056 1401          	and	a,(OFST-4,sp)
2631  0058 01            	rrwa	x,a
2632  0059 1f03          	ldw	(OFST-2,sp),x
2633  005b 2014          	jra	L3021
2634  005d               L5711:
2635                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2637  005d 7b07          	ld	a,(OFST+2,sp)
2638  005f 5f            	clrw	x
2639  0060 97            	ld	xl,a
2640  0061 1f01          	ldw	(OFST-4,sp),x
2641  0063 c65400        	ld	a,21504
2642  0066 5f            	clrw	x
2643  0067 97            	ld	xl,a
2644  0068 01            	rrwa	x,a
2645  0069 1402          	and	a,(OFST-3,sp)
2646  006b 01            	rrwa	x,a
2647  006c 1401          	and	a,(OFST-4,sp)
2648  006e 01            	rrwa	x,a
2649  006f 1f03          	ldw	(OFST-2,sp),x
2650  0071               L3021:
2651                     ; 641   return ((ITStatus)itstatus);
2653  0071 1e03          	ldw	x,(OFST-2,sp)
2656  0073 5b07          	addw	sp,#7
2657  0075 81            	ret
2702                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2702                     ; 663 {
2703                     .text:	section	.text,new
2704  0000               _ADC1_ClearITPendingBit:
2706  0000 89            	pushw	x
2707  0001 88            	push	a
2708       00000001      OFST:	set	1
2711                     ; 664   uint8_t temp = 0;
2713                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2715                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2717  0002 01            	rrwa	x,a
2718  0003 a4f0          	and	a,#240
2719  0005 5f            	clrw	x
2720  0006 02            	rlwa	x,a
2721  0007 a30010        	cpw	x,#16
2722  000a 263a          	jrne	L7221
2723                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2725  000c 7b03          	ld	a,(OFST+2,sp)
2726  000e a40f          	and	a,#15
2727  0010 6b01          	ld	(OFST+0,sp),a
2728                     ; 673     if (temp < 8)
2730  0012 7b01          	ld	a,(OFST+0,sp)
2731  0014 a108          	cp	a,#8
2732  0016 2416          	jruge	L1321
2733                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2735  0018 7b01          	ld	a,(OFST+0,sp)
2736  001a 5f            	clrw	x
2737  001b 97            	ld	xl,a
2738  001c a601          	ld	a,#1
2739  001e 5d            	tnzw	x
2740  001f 2704          	jreq	L461
2741  0021               L661:
2742  0021 48            	sll	a
2743  0022 5a            	decw	x
2744  0023 26fc          	jrne	L661
2745  0025               L461:
2746  0025 43            	cpl	a
2747  0026 c4540d        	and	a,21517
2748  0029 c7540d        	ld	21517,a
2750  002c 2021          	jra	L5321
2751  002e               L1321:
2752                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2754  002e 7b01          	ld	a,(OFST+0,sp)
2755  0030 a008          	sub	a,#8
2756  0032 5f            	clrw	x
2757  0033 97            	ld	xl,a
2758  0034 a601          	ld	a,#1
2759  0036 5d            	tnzw	x
2760  0037 2704          	jreq	L071
2761  0039               L271:
2762  0039 48            	sll	a
2763  003a 5a            	decw	x
2764  003b 26fc          	jrne	L271
2765  003d               L071:
2766  003d 43            	cpl	a
2767  003e c4540c        	and	a,21516
2768  0041 c7540c        	ld	21516,a
2769  0044 2009          	jra	L5321
2770  0046               L7221:
2771                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2773  0046 7b03          	ld	a,(OFST+2,sp)
2774  0048 43            	cpl	a
2775  0049 c45400        	and	a,21504
2776  004c c75400        	ld	21504,a
2777  004f               L5321:
2778                     ; 686 }
2781  004f 5b03          	addw	sp,#3
2782  0051 81            	ret
2795                     	xdef	_ADC1_ClearITPendingBit
2796                     	xdef	_ADC1_GetITStatus
2797                     	xdef	_ADC1_ClearFlag
2798                     	xdef	_ADC1_GetFlagStatus
2799                     	xdef	_ADC1_GetAWDChannelStatus
2800                     	xdef	_ADC1_GetBufferValue
2801                     	xdef	_ADC1_SetLowThreshold
2802                     	xdef	_ADC1_SetHighThreshold
2803                     	xdef	_ADC1_GetConversionValue
2804                     	xdef	_ADC1_StartConversion
2805                     	xdef	_ADC1_AWDChannelConfig
2806                     	xdef	_ADC1_ExternalTriggerConfig
2807                     	xdef	_ADC1_ConversionConfig
2808                     	xdef	_ADC1_SchmittTriggerConfig
2809                     	xdef	_ADC1_PrescalerConfig
2810                     	xdef	_ADC1_ITConfig
2811                     	xdef	_ADC1_DataBufferCmd
2812                     	xdef	_ADC1_ScanModeCmd
2813                     	xdef	_ADC1_Cmd
2814                     	xdef	_ADC1_Init
2815                     	xdef	_ADC1_DeInit
2834                     	end
