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








SCILIB int REG_pol_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_pol_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_hithrs_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_hithrs_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_lothrsh_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_lothrsh_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_inhib_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_inhib_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_gatel_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_gatel_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_gateu_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_gateu_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_delay_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_delay_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_xdelay_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_xdelay_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_inttime_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_inttime_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_preint_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_preint_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_pileup_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_pileup_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_gain_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_gain_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_ofs_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_ofs_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_bl_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_bl_SET(uint32_t val, NI_HANDLE *handle);
SCILIB int REG_CH_GET(uint32_t *val, NI_HANDLE *handle);
SCILIB int REG_CH_SET(uint32_t val, NI_HANDLE *handle);
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_0_START
//-
//- Start acquisition.
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

SCILIB int SPECTRUM_Spectrum_0_START(NI_HANDLE *handle)
;
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_0_STOP
//-
//- Stop acquisition.
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

SCILIB int SPECTRUM_Spectrum_0_START(NI_HANDLE *handle)
;
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_0_FLUSH
//-
//- Flush spectrum
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

SCILIB int SPECTRUM_Spectrum_0_START(NI_HANDLE *handle)
;
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_0_RESET
//-
//- RESET spectrum
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

SCILIB int SPECTRUM_Spectrum_0_START(NI_HANDLE *handle)
;
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_0_SET_PARAMETERS
//-
//- Configure oscilloscope parameters
//-
//- ARGUMENTS:
//- 	           rebin   PARAM_IN    int32_t
//- 		Rebin factor
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      limit_mode   PARAM_IN    int32_t
//- 		Limit Mode: 0) No Limit, 1) Total Counts, 2) Real Time
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	     limit_value   PARAM_IN    int32_t
//- 		Limit value: in counts or in ms depends on limit mode
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

SCILIB int SPECTRUM_Spectrum_0_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle);
;
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_0_STATUS
//-
//- Get Spectrum status
//-
//- ARGUMENTS:
//- 	          status  PARAM_OUT    int32_t
//- 		Return the oscilloscope status
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		0) Stop
//- 		1) Running
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

SCILIB int SPECTRUM_Spectrum_0_STATUS(uint32_t *status,NI_HANDLE *handle);
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_0_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_0POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_0_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_0, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_0 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_0_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data);
