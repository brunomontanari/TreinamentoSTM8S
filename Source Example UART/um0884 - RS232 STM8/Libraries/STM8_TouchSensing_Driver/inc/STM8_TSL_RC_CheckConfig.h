/**
  ******************************************************************************
  * @file STM8_TSL_RC_CheckConfig.h
  * @brief RC Touch Sensing Library for STM8 CPU family.
  * Used to check the configuration file.
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

#ifndef __TSL_CHECKCONFIG__
#define __TSL_CHECKCONFIG__

//------------------------------------------------------------------------------
// MCU check
//------------------------------------------------------------------------------

#if defined(STM8L) && defined(STM8S)
#error "Wrong MCU selection (both are selected). Select either STM8L or STM8S."
#endif

#if !defined(STM8L) && !defined(STM8S)
#error "No MCU is selected. Select STM8L or STM8S."
#endif

//------------------------------------------------------------------------------
// Single channel keys check
//------------------------------------------------------------------------------

#if (SCKEY_P1_KEY_COUNT < 1) || (SCKEY_P1_KEY_COUNT > 8)
#error "Wrong number of single channel keys on port1. Must be in the [1..8] range."
#endif

#if (SCKEY_P2_KEY_COUNT < 0) || (SCKEY_P2_KEY_COUNT > 8)
#error "Wrong number of single channel keys on port2. Must be in the [0..8] range."
#endif

#if (SCKEY_P3_KEY_COUNT < 0) || (SCKEY_P3_KEY_COUNT > 8)
#error "Wrong number of single channel keys on port3. Must be in the [0..8] range."
#endif

// Calculates the total number of single-channel keys
#define NUMBER_OF_SINGLE_CHANNEL_KEYS (SCKEY_P1_KEY_COUNT + SCKEY_P2_KEY_COUNT + SCKEY_P3_KEY_COUNT)

#if (SCKEY_P2_KEY_COUNT == 0) && (SCKEY_P3_KEY_COUNT == 0)
#define NUMBER_OF_SINGLE_CHANNEL_PORTS (1)
#endif

#if (SCKEY_P2_KEY_COUNT > 0) && (SCKEY_P3_KEY_COUNT == 0)
#define NUMBER_OF_SINGLE_CHANNEL_PORTS (2)
#endif

#if (SCKEY_P2_KEY_COUNT > 0) && (SCKEY_P3_KEY_COUNT > 0)
#define NUMBER_OF_SINGLE_CHANNEL_PORTS (3)
#endif

#if (SCKEY_P2_KEY_COUNT == 0) && (SCKEY_P3_KEY_COUNT > 0)
#error "SCKEY PORT2 is not defined (mandatory if PORT3 is defined)."
#endif

//------------------------------------------------------------------------------
// Multi channel keys check
//------------------------------------------------------------------------------

#if (NUMBER_OF_MULTI_CHANNEL_KEYS < 0) || (NUMBER_OF_MULTI_CHANNEL_KEYS > 2)
#error "Wrong number of multi channel keys. Must be in the [0..2] range."
#endif

#if (NUMBER_OF_MULTI_CHANNEL_KEYS > 0)
#if (CHANNEL_PER_MCKEY != 5) && (CHANNEL_PER_MCKEY != 8)
#error "Wrong number of channel for multi channel keys. Must be equal to 5 or 8."
#endif
#if (MCKEY1_TYPE != 0) && (MCKEY1_TYPE != 1)
#error "Wrong MCKEY1 type. Must be equal to 0 (wheel) or 1 (slider)."
#endif
#if (MCKEY1_LAYOUT_TYPE != 0) && (MCKEY1_LAYOUT_TYPE != 1)
#error "Wrong MCKEY1 layout type. Must be equal to 0 (Interlaced) or 1 (Normal)."
#endif
#endif

#if (NUMBER_OF_MULTI_CHANNEL_KEYS > 1)
#if (MCKEY2_TYPE != 0) && (MCKEY2_TYPE != 1)
#error "Wrong MCKEY2 type. Must be equal to 0 (wheel) or 1 (slider)."
#endif
#if (MCKEY2_LAYOUT_TYPE != 0) && (MCKEY2_LAYOUT_TYPE != 1)
#error "Wrong MCKEY2 layout type. Must be equal to 0 (Interlaced) or 1 (Normal)."
#endif
#endif

//============================================================================
// TSL PARAMETERS CONFIGURATION
//============================================================================

#if !defined(NEGDETECT_AUTOCAL)
#error "Please define NEGDETECT_AUTOCAL"
#endif

//------------------------------------------------------------------------------
// Firmware Library selection
//------------------------------------------------------------------------------

#if defined(STM8L)
#include "stm8l.h"
#define STM8_CPU (1)
#endif

#if defined(STM8S)
#include "stm8s.h"
#define STM8_CPU (1)
#endif

#endif /* __TSL_CHECKCONFIG__ */

/*********************** (c) 2009 STMicroelectronics **************************/
