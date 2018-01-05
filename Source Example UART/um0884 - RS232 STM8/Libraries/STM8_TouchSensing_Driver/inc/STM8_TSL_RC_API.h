/**
  ******************************************************************************
  * @file STM8_TSL_RC_API.h
  * @brief RC Touch Sensing Library for STM8 CPU family.
  * Application Programming Interface. Defines the memory buffers, variables
  * and functions used to communicate between Touch Sensing Library and
  * customer code.
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

#ifndef __TSL_API__
#define __TSL_API__

#include "STM8_TSL_RC_Configuration.h"
#include "STM8_TSL_RC_TimerDriver.h"

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             STATIC VALUES                                        -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/** @addtogroup TSLState_values
  * @{ */
typedef enum
{
 TSL_IDLE_STATE          = (u8)0x01,
 TSL_SCKEY_P1_ACQ_STATE  = (u8)0x02,
 TSL_SCKEY_P1_PROC_STATE = (u8)0x03,
 TSL_SCKEY_P2_ACQ_STATE  = (u8)0x04,
 TSL_SCKEY_P2_PROC_STATE = (u8)0x05,
 TSL_SCKEY_P3_ACQ_STATE  = (u8)0x06,
 TSL_SCKEY_P3_PROC_STATE = (u8)0x07,
 TSL_MCKEY1_ACQ_STATE    = (u8)0x08,
 TSL_MCKEY2_ACQ_STATE    = (u8)0x09,
 TSL_MCKEY_PROC_STATE    = (u8)0x0A,
 TSL_ECS_STATE           = (u8)0x0B
} TSLState_T;
/** @} */

/** @addtogroup KeyState_values
  * @{ */
#define CALIBRATION_STATE      (0x01)
#define IDLE_STATE             (0x02)
#define DETECTED_STATE         (0x04)
#define ERROR_STATE            (0x08)
#define PRE_CALIBRATION_STATE  (0x11)
#define PRE_DETECTED_STATE     (0x14)
#define POST_DETECTED_STATE    (0x24)
#define DISABLED_STATE         (0x80)
/** @} */

#define SCKEY_CALIBRATION_COUNT_DEFAULT  (8)
#define MCKEY_CALIBRATION_COUNT_DEFAULT  (8)

#define MCKEY_RESOLUTION_CALCULATION  (8)

#define MCKEY_DIRECTION_CHANGE_TOTAL_STEPS  (256)

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             STRUCTURE DEFINITIONS                                -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/** Contains the Flags used by a key (common for SC and MC keys) */
typedef union
{
  u16 whole;
  struct
  {
    unsigned IMPLEMENTED : 1; /**< Indicates that the key is implemented (from Customer Code to TSL only) */
    unsigned ENABLED     : 1; /**< Indicates that the key is enabled (from Customer Code to TSL only) */
    unsigned DETECTED    : 1; /**< Indicates that the key is detected (from TSL to Customer Code only) */
    unsigned CHANGED     : 1; /**< Indicates that the key state has changed (from TSL to Customer Code only) */
    unsigned POSCHANGED  : 1; /**< Indicates that the MC key position has changed (from TSL to Customer Code only) */
    unsigned ERROR       : 1; /**< Indicates that the key has an error (from TSL to Customer Code only) */
    unsigned NOISE       : 1; /**< Indicates that the key measurement has noise (from TSL to Customer Code only) */
    unsigned LOCKED      : 1; /**< Reserved (TSL internal usage) */
    unsigned DIRECTION   : 1; /**< Reserved (TSL internal usage) */
    unsigned MCKEY_TYPE  : 1; /**< Indicates the type of MCkey: Wheel(0) or Slider(1) (from Customer Code to TSL only) */
    unsigned RESERVED0   : 1; /**< Reserved for future use */
    unsigned RESERVED1   : 1; /**< Reserved for future use */
    unsigned RESERVED2   : 1; /**< Reserved for future use */
    unsigned RESERVED3   : 1; /**< Reserved for future use */
    unsigned RESERVED4   : 1; /**< Reserved for future use */
    unsigned RESERVED5   : 1; /**< Reserved for future use */
  } b;
} KeyFlag_T;

/** Contains the States used by a key (common for SC and MC keys)  */
typedef union
{
  u8 whole;
  struct
  {
    unsigned CALIBRATION : 1; /**< The key is under calibration */
    unsigned IDLE        : 1; /**< The key is in idle */
    unsigned DETECTED    : 1; /**< The key is detected */
    unsigned ERROR       : 1; /**< The key has an error */
    unsigned PRE_STATE   : 1; /**< The key is in either pre-calibration or pre-detection */
    unsigned POST_STATE  : 1; /**< The key is in post-detection*/
    unsigned RESERVED    : 1; /**< Reserved for future use */
    unsigned DISABLED    : 1; /**< The key is disabled */
  } b;
} KeyState_T;

/** Contains the Channel basic informations (common for SC and MC keys) */
typedef struct
{
  u16 LastMeas;         /**< Contains the last acquisition value */
  u8 LastMeasRejectNb;  /**< Contains the number of rejected values in the last acquisition */
  u16 Reference;        /**< Contains the reference value used to calculate the @b Delta value */
  u8 IntegratorCounter; /**< Contains the integrator counter value */
  u8 ECSRefRest;        /**< Contains the rest of the division calculated by the ECS algorithm */
} Channel_Info_T;

/** Contains all informations for a single channel key (SC Key) */
typedef struct
{
  KeyState_T State;          /**< Holds the key state structure */
  KeyFlag_T Setting;         /**< Holds the key flags structure */
  u8 Counter;                /**< Contains the counter used for integrator */
  u8 DESGroup;               /**< Contains the key group number */
  Channel_Info_T Channel;    /**< Holds the channel structure */
  s8 DetectThreshold;        /**< Contains the detection threshold */
  s8 EndDetectThreshold;     /**< Contains the end of detection threshold */
  s8 RecalibrationThreshold; /**< Contains the calibration threshold */
} Single_Channel_Complete_Info_T;

/** Contains all informations for a 5 channels key (MC Key) */
typedef struct
{
  KeyState_T State;             /**< Holds the key state structure */
  KeyFlag_T Setting;            /**< Holds the key flags structure */
  u8 Counter;                   /**< Contains the counter used for integrator */
  u8 DESGroup;                  /**< Contains the key group number (from 0 to 7) */
  Channel_Info_T Channel[5];    /**< Array of channel structure */
  u8 Position;                  /**< Contains the position on the slider or wheel using resolution */
  u8 UnScaledPosition;          /**< Contains the raw position on the slider or wheel */
  s8 DetectThreshold;           /**< Contains the detection threshold */
  s8 EndDetectThreshold;        /**< Contains the end of detection threshold */
  s8 RecalibrationThreshold;    /**< Contains the calibration threshold */
  u8 Resolution;                /**< Contains the resolution of the slider or wheel */
  u8 DirectionChangeIntegrator; /**< Contains the integrator value used to allow the direction change on slider or wheel */
  u8 DirectionChangeThreshold;  /**< Contains the threshold value used to allow the direction change on slider or wheel */
} Penta_Channel_Complete_Info_T;

/** Contains all informations for a 8 channels key (MC Key) */
typedef struct
{
  KeyState_T State;             /**< Holds the key state structure */
  KeyFlag_T Setting;            /**< Holds the key flags structure */
  u8 Counter;                   /**< Contains the counter used for integrator */
  u8 DESGroup;                  /**< Contains the key group number */
  Channel_Info_T Channel[8];    /**< Array of channel structure */
  u8 Position;                  /**< Contains the position on the slider or wheel using resolution */
  u8 UnScaledPosition;          /**< Contains the raw position on the slider or wheel */
  s8 DetectThreshold;           /**< Contains the detection threshold */
  s8 EndDetectThreshold;        /**< Contains the end of detection threshold */
  s8 RecalibrationThreshold;    /**< Contains the calibration threshold */
  u8 Resolution;                /**< Contains the resolution of the slider or wheel */
  u8 DirectionChangeIntegrator; /**< Contains the integrator value used to allow the direction change on slider or wheel */
  u8 DirectionChangeThreshold;  /**< Contains the threshold value used to allow the direction change on slider or wheel */
} Octo_Channel_Complete_Info_T;

#ifdef IT_SYNC
/** Contains the flags used for interrupt synchronization */
typedef struct
{
  unsigned one_acquisition_sync_enable:1; /**< Enable synchronization of the whole acquiqition */ 
	unsigned one_measure_sync_enable:1;     /**< Enable synchronization of one measure */ 
	unsigned one_charge_sync_enable:1;      /**< Enable synchronization of one charge or discharge */
	unsigned start:1;                       /**< Flag to be set in an interrupt in order to start the acquisition */ 
} IT_Sync_Flags_T;
#endif

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             API GLOBAL DEFINITION                                -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
extern TSLState_T @tiny TSLState;

extern KeyFlag_T @tiny TSL_GlobalSetting;
extern KeyState_T @tiny TSL_GlobalState;

extern Single_Channel_Complete_Info_T * @tiny pKeyStruct;
extern Single_Channel_Complete_Info_T sSCKeyInfo[NUMBER_OF_SINGLE_CHANNEL_KEYS];

extern u8 DetectionTimeout;
extern u8 DetectionIntegrator, EndDetectionIntegrator;
extern u8 RecalibrationIntegrator;
extern u8 ECSTimeStep;
extern u8 ECSTemporization;
extern u8 ECS_K_Fast, ECS_K_Slow;

#ifdef IT_SYNC
extern volatile IT_Sync_Flags_T IT_Sync_Flags;
#endif

#if NUMBER_OF_MULTI_CHANNEL_KEYS > 0
#if defined(__CSMC__) && defined(USE_PRAGMA_SECTION)
#pragma section [TSLMCK_RAM]
#pragma section @tiny [TSLMCK_RAM0]
#endif
#if CHANNEL_PER_MCKEY == 5
extern Penta_Channel_Complete_Info_T * @tiny pMCKeyStruct;
extern Penta_Channel_Complete_Info_T sMCKeyInfo[NUMBER_OF_MULTI_CHANNEL_KEYS];
#endif
#if CHANNEL_PER_MCKEY == 8
extern Octo_Channel_Complete_Info_T * @tiny pMCKeyStruct;
extern Octo_Channel_Complete_Info_T sMCKeyInfo[NUMBER_OF_MULTI_CHANNEL_KEYS];
#endif

#endif

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//-----             API FUNCTION DEFINITION                              -----
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
void TSL_Init(void);
void TSL_Action(void);
void TSL_SCKey_SetCalibrationState(void);
void TSL_MCKey_SetCalibrationState(void);

#endif /* __TSL_API__ */

/*********************** (c) 2009 STMicroelectronics **************************/
