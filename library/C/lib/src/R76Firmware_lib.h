#include "Def.h"
#include <stdint.h>
#include <stdlib.h>
#include  <stdbool.h>


#pragma once
#ifndef __R5560_SCICOMPILER_H
#define __R5560_SCICOMPILER_H
#endif

#ifdef __cplusplus
extern "C" {
#endif


#ifdef _WIN32
#ifdef SCICOMPILER_EXPORTS
#define SCILIB __declspec(dllexport)
#else
#define SCILIB __declspec(dllimport)
#endif
#else
#ifdef SCICOMPILER_EXPORTS
#define SCILIB __attribute__((visibility("default")))
#else
#define SCILIB
#endif
#endif


#define NI_HANDLE tR5560_Handle

typedef struct
{
	uint64_t Time_Code;
	uint32_t Id;
	uint32_t Pack_Id;
	uint32_t *Energy;
	uint32_t Valid;
} t_FRAME_packet;


typedef struct
{
	t_FRAME_packet *packets;
	int allocated_packets;
	int valid_packets;
} t_FRAME_packet_collection;



typedef struct
{
	int board;
	uint64_t timestamp;
	uint64_t triggerid;
	void *payload;
}t_generic_event;

typedef struct
{
	t_generic_event *packets;
	int allocated_packets;
	int valid_packets;
} t_generic_event_collection;





SCILIB int R_ConnectDevice( char *IPAddress, uint32_t port, NI_HANDLE *handle);
SCILIB int R_CloseConnection(NI_HANDLE *handle);
SCILIB int R_Init();

SCILIB int __abstracted_mem_write(uint32_t *data, uint32_t count, 
										uint32_t address,  
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *written_data);

SCILIB int __abstracted_mem_read(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *read_data, uint32_t *valid_data);
										

SCILIB int __abstracted_fifo_write(uint32_t *data, uint32_t count,
	uint32_t address,
	uint32_t address_status,
	uint32_t timeout_ms, NI_HANDLE *handle,
	uint32_t *written_data);
	
SCILIB int __abstracted_fifo_read(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t address_status, 
										bool blocking,
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *read_data, uint32_t *valid_data);
SCILIB int __abstracted_reg_write(uint32_t data, uint32_t address, NI_HANDLE *handle);
SCILIB int __abstracted_reg_read(uint32_t *data, uint32_t address, NI_HANDLE *handle);

SCILIB int Utility_PEAK_DATA_FORM_DOWNLOAD_BUFFER(void *buffer_handle, int32_t *val);

SCILIB int Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(void *buffer_handle, int32_t *val, uint32_t size, uint32_t *enqueued_data);

SCILIB int Utility_ALLOCATE_DOWNLOAD_BUFFER(void **buffer_handle, uint32_t buffer_size);

SCILIB void free_packet_collection(t_generic_event_collection *decoded_packets);

SCILIB void free_FRAME_packet_collectionvoid(t_FRAME_packet_collection *decoded_packets);
SCILIB void free_PETIROCFRAME_packet_collection(t_ASIC_packet_collection *decoded_packets);


SCILIB int ClearBuffer(void *buffer_handle);

#ifdef __cplusplus
}
#endif













SCILIB int REG_polarity_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_polarity_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_inhib_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_inhib_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_delay_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_delay_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_0_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_0_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_1_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_1_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_2_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_2_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_3_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_3_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_4_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_4_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_5_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_5_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_6_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_6_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_7_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_7_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_8_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_8_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_9_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_9_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_10_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_10_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_11_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_11_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_12_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_12_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_13_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_13_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_14_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_14_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_15_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_15_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_16_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_16_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_17_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_17_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_18_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_18_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_19_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_19_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_20_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_20_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_21_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_21_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_22_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_22_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_23_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_23_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_24_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_24_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_gate_l_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_gate_l_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_gate_u_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_gate_u_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_fifo_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_fifo_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_read_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_read_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_empty_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_empty_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_full_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_full_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_write_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_write_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_25_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_25_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_26_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_26_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_27_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_27_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_28_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_28_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_29_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_29_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_30_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_30_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_disable_det_31_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_disable_det_31_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_skip_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_skip_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_stopwrite_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_stopwrite_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_reset_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_reset_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_int_time_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_int_time_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_pre_int_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_pre_int_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_baseline_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_baseline_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_1_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_1_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_2_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_2_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_3_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_3_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_4_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_4_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_5_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_5_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_6_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_6_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_7_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_7_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_8_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_8_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_9_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_9_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_10_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_10_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_11_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_11_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_12_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_12_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_13_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_13_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_14_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_14_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_15_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_15_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_16_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_16_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_17_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_17_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_18_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_18_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_19_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_19_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_20_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_20_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_21_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_21_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_22_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_22_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_23_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_23_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_24_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_24_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_25_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_25_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_26_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_26_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_27_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_27_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_28_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_28_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_29_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_29_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_30_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_30_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_31_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_31_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_32_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_32_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_top_0_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_top_0_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_0_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_0_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_1_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_1_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_2_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_2_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_3_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_3_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_4_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_4_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_5_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_5_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_6_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_6_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_7_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_7_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_8_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_8_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_9_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_9_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_10_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_10_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_11_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_11_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_12_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_12_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_13_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_13_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_14_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_14_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_15_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_15_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_16_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_16_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_17_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_17_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_18_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_18_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_19_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_19_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_20_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_20_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_21_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_21_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_22_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_22_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_thrsh_23_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_thrsh_23_SET(uint32_t val, NI_HANDLE *handle);
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_START
//-
//- Start Oscilloscope acquisition.
//-
//- ARGUMENTS:
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_START(NI_HANDLE *handle)
;
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_SET_PARAMETERS
//-
//- Configure oscilloscope parameters
//-
//- ARGUMENTS:
//- 	       decimator   PARAM_IN    int32_t
//- 		Set decimator value. 0: no decimation, 1: divide by two, ...
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             pre   PARAM_IN    int32_t
//- 		Set the length in samples of pre-trigger buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	software_trigger   PARAM_IN    int32_t
//- 		Generate software trigger to force start acquisition (1:generate trigger)
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	  analog_trigger   PARAM_IN    int32_t
//- 		Enable threshold trigger on analog input of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital0_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 0 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital1_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 1 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital2_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 2 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	digital3_trigger   PARAM_IN    int32_t
//- 		Enable digital trigger on digital in 3 of selected channel
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Disable
//- 		1) Enable
//-
//- 	 trigger_channel   PARAM_IN    int32_t
//- 		Select channel of the oscilloscope connected to the trigger logic
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	    trigger_edge   PARAM_IN    int32_t
//- 		Select channel of the oscilloscope connected to the trigger logic
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Rising
//- 		1) Falling
//-
//- 	   trigger_level   PARAM_IN    int32_t
//- 		Level in LSB of the leading edge comparator on analog input. Use only with analog_trigger=1
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_SET_PARAMETERS(int32_t decimator, int32_t pre, int32_t software_trigger, int32_t analog_trigger, int32_t digital0_trigger, int32_t digital1_trigger, int32_t digital2_trigger, int32_t digital3_trigger, int32_t trigger_channel, int32_t trigger_edge, int32_t trigger_level, NI_HANDLE *handle);
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_STATUS
//-
//- Get Oscilloscope status
//-
//- ARGUMENTS:
//- 	          status  PARAM_OUT    int32_t
//- 		Return the oscilloscope status
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) No data available
//- 		1) Data available
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_STATUS(uint32_t *status,NI_HANDLE *handle);
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_POSITION
//-
//- Get Oscilloscope trigger position. The trigger position indicate the position in the output buffer of each channels where the sample at t0 occureed. PRE-TRIGGER samples before t0 is the pre-trigger data.
//-
//- ARGUMENTS:
//- 	        position  PARAM_OUT    int32_t
//- 		Return the trigger position in the data set in order to correct recustruct the pre-prigger and post trigger data
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_POSITION(int32_t *position,NI_HANDLE *handle);
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_DOWNLOAD
//-
//- Download data from oscilloscope buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Oscilloscope_0POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Oscilloscope_0_DOWNLOAD(data_buffer, BUFFER_SIZE_Oscilloscope_0, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Oscilloscope_0 to get actual oscilloscope buffer size on FPGA
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data);
//-----------------------------------------------------------------
//-
//- OSCILLOSCOPE_Oscilloscope_0_RECONSTRUCT
//-
//- Take as input the downloaded buffer and decode the the different track for each channels. Channel order is the following: [0...1023] Channel 1, [1024...2047] Channel2
//- 
//- 
//-
//- ARGUMENTS:
//- 	        data_osc   PARAM_IN   uint32_t
//- 		uint32_t buffer containing the raw data download with the DOWNLOAD function
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	        position   PARAM_IN   uint32_t
//- 		Position of the trigger obtained with the POSITION function
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	     pre_trigger   PARAM_IN    int32_t
//- 		Length of the pre-trigger
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	     read_analog  PARAM_OUT   uint32_t
//- 		Analog track reordered in time. Data are encoded in unsigned data format between -32576 and 32576
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital0  PARAM_OUT   uint32_t
//- 		Digital track 0 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital1  PARAM_OUT   uint32_t
//- 		Digital track 1 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital2  PARAM_OUT   uint32_t
//- 		Digital track 2 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	   read_digital3  PARAM_OUT   uint32_t
//- 		Digital track 3 reordered
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int OSCILLOSCOPE_Oscilloscope_0_RECONSTRUCT(uint32_t *data_osc, uint32_t position, int32_t pre_trigger, uint32_t *read_analog, uint32_t *read_digital0, uint32_t *read_digital1, uint32_t *read_digital2, uint32_t *read_digital3);
//-----------------------------------------------------------------
//-
//- RATE_METER_RateMeter_NoSkip_GET_DATA
//-
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN   channels
//- 		number of word to download from the buffer.
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int RATE_METER_RateMeter_NoSkip_GET_DATA(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data);
//-----------------------------------------------------------------
//-
//- RATE_METER_RateMeter_NoSkip_GET_DATA_COUNTS
//-
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN   channels
//- 		number of word to download from the buffer.
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int RATE_METER_RateMeter_NoSkip_GET_DATA_COUNTS(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data);
//-----------------------------------------------------------------
//-
//- RATE_METER_RateMeter_0_GET_DATA
//-
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN   channels
//- 		number of word to download from the buffer.
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int RATE_METER_RateMeter_0_GET_DATA(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data);
//-----------------------------------------------------------------
//-
//- RATE_METER_RateMeter_0_GET_DATA_COUNTS
//-
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN   channels
//- 		number of word to download from the buffer.
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int RATE_METER_RateMeter_0_GET_DATA_COUNTS(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data);
