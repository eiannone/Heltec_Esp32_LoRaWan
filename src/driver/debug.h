/******************************************************************************
 * @file    debug.h
 * @author  MCD Application Team
 * @version V1.1.1
 * @date    01-June-2017
 * @brief   Header for driver debug.c module
 ******************************************************************************
 * @attention
 *
 * <h2><center>&copy; Copyright (c) 2017 STMicroelectronics International N.V.
 * All rights reserved.</center></h2>
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted, provided that the following conditions are met:
 *
 * 1. Redistribution of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. Neither the name of STMicroelectronics nor the names of other
 *    contributors to this software may be used to endorse or promote products
 *    derived from this software without specific written permission.
 * 4. This software, including modifications and/or derivative works of this
 *    software, must execute solely and exclusively on microcontroller or
 *    microprocessor devices manufactured by or for STMicroelectronics.
 * 5. Redistribution and use of this software other than as permitted under
 *    this license is void and will automatically terminate your rights under
 *    this license.
 *
 * THIS SOFTWARE IS PROVIDED BY STMICROELECTRONICS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS, IMPLIED OR STATUTORY WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
 * PARTICULAR PURPOSE AND NON-INFRINGEMENT OF THIRD PARTY INTELLECTUAL PROPERTY
 * RIGHTS ARE DISCLAIMED TO THE FULLEST EXTENT PERMITTED BY LAW. IN NO EVENT
 * SHALL STMICROELECTRONICS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 ******************************************************************************
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __DEBUG_H__
#define __DEBUG_H__

/* Includes ------------------------------------------------------------------*/
#include <string.h>
//#include <stdio.h>
#include "../loramac/utilities.h"

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/
/* External variables --------------------------------------------------------*/
/* Exported macros -----------------------------------------------------------*/
typedef enum LOG_LEVEL_E {
    LL_NONE,
    LL_ERR,
    LL_WARN,
    LL_DEBUG,
    LL_VDEBUG,
    LL_ALL
} LOG_LEVEL;


#ifdef __cplusplus
extern "C" {
#endif

extern void lora_printf(const char *format, ...);

#ifdef __cplusplus
}
#endif
//#define LoRaWAN_DEBUG_LEVEL 2

#define ERR_PRINTF(format, ...)    do {}while(0)
#define WARN_PRINTF(format, ...)    do {}while(0)
#define VDBG_PRINTF(format, ...)    do {}while(0)
#define PRINTF_RAW(...)
#define PRINTF_AT(...)
#define DBG_PRINTF_CRITICAL(p)
#define LORAWANLOG do {}while(0)
//#define LORAWANLOG lora_printf("[LoRaWan Log] ")
#if LoRaWAN_DEBUG_LEVEL >= 2
	#define FREQ_PRINTF(format, ...)   LORAWANLOG;lora_printf(format, ##__VA_ARGS__)
	#define DBG_PRINTF(format, ...)    lora_printf(format, ##__VA_ARGS__)
	#define DIO_PRINTF(format, ...)    LORAWANLOG;lora_printf(format, ##__VA_ARGS__)
#elif LoRaWAN_DEBUG_LEVEL == 1
	#define FREQ_PRINTF(format, ...)   lora_printf(format, ##__VA_ARGS__)
	#define DBG_PRINTF(format, ...)    lora_printf(format, ##__VA_ARGS__)
	#define DIO_PRINTF(format, ...)
#else
	#define FREQ_PRINTF(format, ...)     do {}while(0)
	#define DBG_PRINTF(format, ...)		do {}while(0)
	#define DIO_PRINTF(format, ...)		do {}while(0)
#endif

#endif /* __DEBUG_H__*/

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
