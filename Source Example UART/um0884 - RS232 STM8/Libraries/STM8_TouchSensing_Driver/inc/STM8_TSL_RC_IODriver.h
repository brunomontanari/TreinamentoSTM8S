/**
  ******************************************************************************
  * @file STM8_TSL_RC_IODriver.h
  * @brief RC Touch Sensing Library for STM8 CPU family.
  * Hardware Driver for I/Os. It manages the I/O on capacitive structures.
  * Use RC load technology.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.3.0
  * @date 29-OCT-2009
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

#ifndef __TSL_IODRIVER__
#define __TSL_IODRIVER__

#include "STM8_TSL_RC_Configuration.h"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             STRUCTURE DEFINITIONS                                -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

typedef enum
{
  SCKEY_TYPE = 0,
  MCKEY_TYPE = 1
} IOTYPE_T;

/** Contains all informations of the touched I/O */
typedef struct
{
  GPIO_TypeDef *PORT_ADDR;  /**< Base adress of the GPIO (DR address) */
  u8 AcqMask;               /**< Mask used to acquire the pin value */
  u8 DriveMask;             /**< Mask used to drive the pin */
  u16 *Measurement;         /**< Contains the last measurement value */
  u8 *RejectedNb;           /**< Contains the number of rejected values in the last measurement */
  IOTYPE_T Type;            /**< Contains the type of the key touched */
} TOUCH_PORT_Info_T;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----               CONSTANTS DEFINITIONS                              -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// IO acquisition sampling loop
// !!! CHANGE WITH CARE !!!
#define SAMPLING_SHIFTER_LOOP_START (1)
#define SAMPLING_SHIFTER_NB_LOOPS   (8)

// Number of cycles taken by the loop in TSL_IO_SW_Burst_Wait_Vil and TSL_IO_SW_Burst_Wait_Vih routines
// !!! CHANGE WITH CARE !!!
#define NB_CYCLES_VIHVIL_LOOP (8)

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----               GLOBALS DEFINITIONS                                -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
extern TOUCH_PORT_Info_T @tiny sTouchIO;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             CPU RELATED SPECIFIC ADDRESSES                       -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
volatile u16 TIMACQ_CNTR @ TIMACQ_CNTR_ADD;

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             CONSTANT TABLE FOR I/O ADDRESSING                    -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
extern const u8 Table_SCKEY_BITS[];
extern const u8 Table_MCKEY_BITS[];
extern const u16 Table_MCKEY_PORTS[];

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             FUNCTION DEFINITION                                  -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void TSL_IO_Init(void);
void TSL_IO_Clamp(void);
void TSL_IO_Acquisition(u8 AcqNumber, u8 AdjustmentEnable);
void TSL_IO_SW_Burst_TestSyncShift(void);
void TSL_IO_SW_Burst_Wait_Vil(void);
void TSL_IO_SW_Burst_Wait_Vih(void);
void TSL_IO_SW_Burst_Start_Timer(void);
void TSL_IO_SW_Burst_Stop_Timer(void);

#endif /* __TSL_IODRIVER__ */

/*********************** (c) 2009 STMicroelectronics **************************/
