/**
  ******************************************************************************
  * @file STM8_TSL_RC_SingleChannelKey.h
  * @brief RC Touch Sensing Library for STM8 CPU family.
  * Simple Key management.
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
void TSL_SCKey_Init(void);
void TSL_SCKey_SetAcquisitionMasks(void);
void TSL_SCKEY_P1_Acquisition(void);
void TSL_SCKEY_P2_Acquisition(void);
void TSL_SCKEY_P3_Acquisition(void);
void TSL_SCKey_Process(void);
void TSL_RefKey_Process(void);
void TSL_SCKey_IdleTreatment(void);
void TSL_SCKey_PreDetectTreatment(void);
void TSL_SCKey_DetectedTreatment(void);
void TSL_SCKey_PostDetectTreatment(void);
void TSL_SCKey_PreRecalibrationTreatment(void);
void TSL_SCKey_CalibrationTreatment(void);
void TSL_SCKey_PreErrorTreatment(void);
void TSL_SCKey_CheckDisabled(void);
void TSL_SCKey_CheckEnabled(void);
u8 TSL_SCKey_CheckErrorCondition(void);

/*********************** (c) 2009 STMicroelectronics **************************/
