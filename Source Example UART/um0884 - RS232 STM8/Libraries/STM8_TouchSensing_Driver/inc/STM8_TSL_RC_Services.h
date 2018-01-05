/**
  ******************************************************************************
  * @file STM8_TSL_RC_Services.h
  * @brief RC Touch Sensing Library for STM8 CPU family.
  * Set of library internal functions.
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
#include "STM8_TSL_RC_Api.h"
#include "STM8_TSL_RC_Internal.h"

#if NUMBER_OF_MULTI_CHANNEL_KEYS > 0
extern const u16 MCKEY1_DELTA_COEFF[];
extern const u16 MCKEY2_DELTA_COEFF[];
#endif

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             FUNCTIONS DEFINITION                                 -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void TSL_SetStructPointer(void);
void TSL_DeltaCalculation(void);
void TSL_SCKey_SetIdleState(void);
void TSL_SCKey_BackToIdleState(void);
void TSL_SCKey_SetPreDetectState(void);
void TSL_SCKey_SetDetectedState(void);
void TSL_SCKey_SetPostDetectState(void);
void TSL_SCKey_BackToDetectedState(void);
void TSL_SCKey_SetPreRecalibrationState(void);
void TSL_SCKey_SetErrorState(void);
void TSL_SCKey_SetDisabledState(void);
void TSL_ECS(void);
void TSL_SCKey_DES(void);
void TSL_SCKey_DetectionTimeout(void);
void TSL_MCKey_SetStructPointer(void);
void TSL_MCKey_DeltaCalculation(u8 ChIdx);
void TSL_MCKey_SetIdleState(void);
void TSL_MCKey_BackToIdleState(void);
void TSL_MCKey_SetPreDetectState(void);
void TSL_MCKey_SetDetectedState(void);
void TSL_MCKey_SetPostDetectState(void);
void TSL_MCKey_BackToDetectedState(void);
void TSL_MCKey_SetPreRecalibrationState(void);
void TSL_MCKey_SetErrorState(void);
void TSL_MCKey_SetDisabledState(void);
void TSL_MCKey_DES(void);
void TSL_MCKey_DetectionTimeout(void);

/*********************** (c) 2009 STMicroelectronics **************************/
