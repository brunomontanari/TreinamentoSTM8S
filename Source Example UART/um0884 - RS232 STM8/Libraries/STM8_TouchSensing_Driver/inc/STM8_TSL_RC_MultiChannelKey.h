/**
  ******************************************************************************
  * @file STM8_TSL_RC_MultiChannelKey.h
  * @brief RC Touch Sensing Library for STM8 CPU family.
  * Multi channel Key management. Allows to manage wheels and sliders.
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

#include "STM8_TSL_RC_Configuration.h"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             FUNCTION DEFINTION                                   -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void TSL_MCKey_Init(void);
void TSL_MCKey1_Acquisition(void);
void TSL_MCKey2_Acquisition(void);
void TSL_MCKey_Process(void);
void TSL_MCKey_IdleTreatment(void);
void TSL_MCKey_PreDetectTreatment(void);
void TSL_MCKey_DetectedTreatment(void);
void TSL_MCKey_PostDetectTreatment(void);
void TSL_MCKey_PreRecalibrationTreatment(void);
void TSL_MCKey_CalibrationTreatment(void);
void TSL_MCKey_PreErrorTreatment(void);
u8 TSL_MCKey_Position(void);
void TSL_MCKey_CheckDisabled(void);
void TSL_MCKey_CheckEnabled(void);
u8 TSL_MCKey_CheckErrorCondition(void);

/*********************** (c) 2009 STMicroelectronics **************************/
