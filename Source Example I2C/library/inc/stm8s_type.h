/**
  ******************************************************************************
  * @file stm8s_type.h
  * @brief This file contains all common data types.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.1.1
  * @date 06/05/2009
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
//#ifndef __STM8S_TYPE_H
#define __STM8S_TYPE_H

/* Includes ------------------------------------------------------------------*/
/* Exported types ------------------------------------------------------------*/
typedef signed long  s32;
typedef signed short s16;
typedef signed char  s8;

typedef signed long  const sc32;  /* Read Only */
typedef signed short const sc16;  /* Read Only */
typedef signed char  const sc8;   /* Read Only */

typedef volatile signed long  vs32;
typedef volatile signed short vs16;
typedef volatile signed char  vs8;

typedef volatile signed long  const vsc32;  /* Read Only */
typedef volatile signed short const vsc16;  /* Read Only */
typedef volatile signed char  const vsc8;   /* Read Only */

typedef unsigned long  u32;
typedef unsigned short u16;
typedef unsigned char  u8;

typedef unsigned long  const uc32;  /* Read Only */
typedef unsigned short const uc16;  /* Read Only */
typedef unsigned char  const uc8;   /* Read Only */

typedef volatile unsigned long  vu32;
typedef volatile unsigned short vu16;
typedef volatile unsigned char  vu8;

typedef volatile unsigned long  const vuc32;  /* Read Only */
typedef volatile unsigned short const vuc16;  /* Read Only */
typedef volatile unsigned char  const vuc8;   /* Read Only */

typedef unsigned char	letter;		// 1 byte
typedef unsigned char	uchar;
typedef   signed char	schar;
typedef unsigned short	ushort;		// 2 bytes
typedef   signed short	sshort;		// 2 bytes
typedef unsigned int	uint;		// depends on compiler 2 or 4 bytes
typedef unsigned long	ulong;		// 4 bytes


typedef enum
{
  FALSE = 0,
  TRUE = !FALSE
}
bool;

typedef enum {
  RESET = 0,
  SET = !RESET
}
FlagStatus, ITStatus, BitStatus;

typedef enum {
  DISABLE = 0,
  ENABLE = !DISABLE
}
FunctionalState;

#define IS_FUNCTIONALSTATE_OK(VALUE) ( (VALUE == ENABLE) || (VALUE == DISABLE) )

typedef enum {
  ERROR = 0,
  SUCCESS = !ERROR
}
ErrorStatus;

#define U8_MAX     ((u8)255)
#define S8_MAX     ((s8)127)
#define S8_MIN     ((s8)-128)
#define U16_MAX    ((u16)65535u)
#define S16_MAX    ((s16)32767)
#define S16_MIN    ((s16)-32768)
#define U32_MAX    ((u32)4294967295uL)
#define S32_MAX    ((s32)2147483647)
#define S32_MIN    ((s32)-2147483648)

#ifndef USER_DEFS
#define USER_DEFS

/* Generic Definitions */
#define NULL		0

/* Standard Macro Definitions */
#define Dim(x) (sizeof(x) / sizeof(x[0])) // Nbr of elements in array x[]
#define ABS(x) (x) > 0 ? (x) : -(x)	  // Absolute value of expression

/* Memory Access Definitions */
#define LOWORD(mem)	(mem&0xFFFF)	// for long vars
#define HIWORD(mem)	(mem>>16)	// for long vars
#define LOBYTE(mem)	(mem&0xFF)	// for int vars
#define HIBYTE(mem)	((mem&0xff00)>>8)	// for int vars

/* Memory Access Definitions */
#define ReadPointedValue(Pointer) *(Pointer)
#define Write_Address_Byte(Pointer,Value) *(Pointer)=Value
#define vWrite_Address_ByteAdd(Pointer,ByteAdd) *(Pointer)=*(ByteAdd)

/* New Type: "hilo":
unsigned short, accessed only as Byte High and Low
ex:  hilo Var;
use: Var.hi; Var.low;
*/                                                        
typedef struct	
	{
	uchar hi;
	uchar lo;
	} hilo;

/* New Type: "wordbyte":
unsigned short, but also accessed as Byte High and Low 
ex:  wordbyte Var;
use: Var.byte.hi; Var.byte.lo; Var.word;  
*/
typedef union
 	{
	ushort word;
	hilo byte;
	} wordbyte;
	       	
/* New Type: "flags":
placed into a char, accessed only as individual bits
ex:  flags Var;
use: Var.bit0; Var.bit4;
*/
typedef struct
	{
	uchar    bit0:1;
	uchar    bit1:1;                
	uchar    bit2:1;                 
	uchar    bit3:1;            
	uchar    bit4:1;
	uchar    bit5:1;
	uchar    bit6:1;
	uchar    bit7:1;
	} flags;
	
/* New Type: "char_bit":
unsigned char, accessed as individual bits as well as whole byte 
ex:  char_bit Var;
use: Var.bit.bit5; Var.byte; 
*/
typedef union
	{
	uchar	byte;
	flags	bit;
	} char_bit;

/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
/* Exported functions ------------------------------------------------------- */

#endif /* __STM8S_TYPE_H */

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
