// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4
// Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

#ifndef XDATA_MOVER_H
#define XDATA_MOVER_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xdata_mover_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
#else
typedef struct {
    u16 DeviceId;
    u32 Axil_BaseAddress;
} XData_mover_Config;
#endif

typedef struct {
    u32 Axil_BaseAddress;
    u32 IsReady;
} XData_mover;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XData_mover_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XData_mover_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XData_mover_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XData_mover_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XData_mover_Initialize(XData_mover *InstancePtr, u16 DeviceId);
XData_mover_Config* XData_mover_LookupConfig(u16 DeviceId);
int XData_mover_CfgInitialize(XData_mover *InstancePtr, XData_mover_Config *ConfigPtr);
#else
int XData_mover_Initialize(XData_mover *InstancePtr, const char* InstanceName);
int XData_mover_Release(XData_mover *InstancePtr);
#endif


u32 XData_mover_Get_buffer_status(XData_mover *InstancePtr);
u32 XData_mover_Get_buffer_status_vld(XData_mover *InstancePtr);
void XData_mover_Set_buffer_ack(XData_mover *InstancePtr, u32 Data);
u32 XData_mover_Get_buffer_ack(XData_mover *InstancePtr);
void XData_mover_Set_run(XData_mover *InstancePtr, u32 Data);
u32 XData_mover_Get_run(XData_mover *InstancePtr);
void XData_mover_Set_DDROFFSET_V(XData_mover *InstancePtr, u32 Data);
u32 XData_mover_Get_DDROFFSET_V(XData_mover *InstancePtr);
u32 XData_mover_Get_buffer_seq_BaseAddress(XData_mover *InstancePtr);
u32 XData_mover_Get_buffer_seq_HighAddress(XData_mover *InstancePtr);
u32 XData_mover_Get_buffer_seq_TotalBytes(XData_mover *InstancePtr);
u32 XData_mover_Get_buffer_seq_BitWidth(XData_mover *InstancePtr);
u32 XData_mover_Get_buffer_seq_Depth(XData_mover *InstancePtr);
u32 XData_mover_Write_buffer_seq_Words(XData_mover *InstancePtr, int offset, int *data, int length);
u32 XData_mover_Read_buffer_seq_Words(XData_mover *InstancePtr, int offset, int *data, int length);
u32 XData_mover_Write_buffer_seq_Bytes(XData_mover *InstancePtr, int offset, char *data, int length);
u32 XData_mover_Read_buffer_seq_Bytes(XData_mover *InstancePtr, int offset, char *data, int length);
u32 XData_mover_Get_bufsize_BaseAddress(XData_mover *InstancePtr);
u32 XData_mover_Get_bufsize_HighAddress(XData_mover *InstancePtr);
u32 XData_mover_Get_bufsize_TotalBytes(XData_mover *InstancePtr);
u32 XData_mover_Get_bufsize_BitWidth(XData_mover *InstancePtr);
u32 XData_mover_Get_bufsize_Depth(XData_mover *InstancePtr);
u32 XData_mover_Write_bufsize_Words(XData_mover *InstancePtr, int offset, int *data, int length);
u32 XData_mover_Read_bufsize_Words(XData_mover *InstancePtr, int offset, int *data, int length);
u32 XData_mover_Write_bufsize_Bytes(XData_mover *InstancePtr, int offset, char *data, int length);
u32 XData_mover_Read_bufsize_Bytes(XData_mover *InstancePtr, int offset, char *data, int length);
u32 XData_mover_Get_stat_counter_BaseAddress(XData_mover *InstancePtr);
u32 XData_mover_Get_stat_counter_HighAddress(XData_mover *InstancePtr);
u32 XData_mover_Get_stat_counter_TotalBytes(XData_mover *InstancePtr);
u32 XData_mover_Get_stat_counter_BitWidth(XData_mover *InstancePtr);
u32 XData_mover_Get_stat_counter_Depth(XData_mover *InstancePtr);
u32 XData_mover_Write_stat_counter_Words(XData_mover *InstancePtr, int offset, int *data, int length);
u32 XData_mover_Read_stat_counter_Words(XData_mover *InstancePtr, int offset, int *data, int length);
u32 XData_mover_Write_stat_counter_Bytes(XData_mover *InstancePtr, int offset, char *data, int length);
u32 XData_mover_Read_stat_counter_Bytes(XData_mover *InstancePtr, int offset, char *data, int length);

#ifdef __cplusplus
}
#endif

#endif
