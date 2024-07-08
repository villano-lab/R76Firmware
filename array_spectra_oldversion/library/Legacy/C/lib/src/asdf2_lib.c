#include "R5560_SDKLib.h"
#include  <stdlib.h>

#include <stdint.h>

#include "RegisterFile.h"

#include  "circular_buffer.h"


#include  "asdf2_lib.h"


#ifdef _MSC_VER

#define bswap_32(x) _byteswap_ulong(x)
#define bswap_64(x) _byteswap_uint64(x)

#elif defined(__APPLE__)

// Mac OS X / Darwin features
#include <libkern/OSByteOrder.h>
#define bswap_32(x) OSSwapInt32(x)
#define bswap_64(x) OSSwapInt64(x)

#elif defined(__sun) || defined(sun)

#include <sys/byteorder.h>
#define bswap_32(x) BSWAP_32(x)
#define bswap_64(x) BSWAP_64(x)

#elif defined(__FreeBSD__)

#include <sys/endian.h>
#define bswap_32(x) bswap32(x)
#define bswap_64(x) bswap64(x)

#elif defined(__OpenBSD__)

#include <sys/types.h>
#define bswap_32(x) swap32(x)
#define bswap_64(x) swap64(x)

#elif defined(__NetBSD__)

#include <sys/types.h>
#include <machine/bswap.h>
#if defined(__BSWAP_RENAME) && !defined(__bswap_32)
#define bswap_32(x) bswap32(x)
#define bswap_64(x) bswap64(x)
#endif

#else

#include <byteswap.h>

#endif

#define PI	3.14159265358979323846   // PI define

SCILIB int R_Init()
{

}


SCILIB int R_ConnectDevice( char *IPAddress, uint32_t port, NI_HANDLE *handle)
{
	return R5560_ConnectTCP( IPAddress, port, handle);
}

SCILIB int R_CloseConnection(NI_HANDLE *handle)
{
	return NI_CloseConnection(handle);
}


SCILIB int __abstracted_mem_write(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *written_data)
{
	int err = NI_WriteData(data,  count,  address, handle, written_data);
	return err;
}


SCILIB int __abstracted_mem_read(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *read_data, uint32_t *valid_data)
{
	int err = NI_ReadData(data,  count, address,  handle, read_data);
	*valid_data = *read_data;
	return err;
}

SCILIB int __abstracted_fifo_write(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t address_status, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *written_data)
{
	return -1;
}
	
SCILIB int __abstracted_fifo_read(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t address_status, 
										bool blocking,
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *read_data, uint32_t *valid_data)
{
	int err;
	err= NI_ReadFifo(data,  count, address,  address_status, blocking ? STREAMING_BLOCKING : STREAMING_NONBLOCKING, timeout_ms, handle, read_data);
	*valid_data = *read_data;
	return err;
}
	
SCILIB int __abstracted_reg_write(uint32_t data, uint32_t address, NI_HANDLE *handle)
{
	return NI_WriteReg(data, address, handle);
}

SCILIB int __abstracted_reg_read(uint32_t *data, uint32_t address, NI_HANDLE *handle)
{
	return NI_ReadReg(data,  address,  handle);
}


uint32_t gray_to_bin(uint32_t num, int nbit)
{
	uint32_t temp = num ^ (num >> 8);
	temp ^= (temp >> 4);
	temp ^= (temp >> 2);
	temp ^= (temp >> 1);
	return temp;
}





//-----------------------------------------------------------------
//-
//-  Utility_ALLOCATE_DOWNLOAD_BUFFER
//-
//-	 This function take as input a pointer to a buffer handle (not pre-allocated void*) and fill it
//-  with the pointer to the circular buffer to store data acquired from a board FIFO that is waiting
//-  to be processed.
//-  The buffer_size specify the size of the buffer to be allocated
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_OUT   void ** 
//-			Handle to the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            buffer_size   PARAM_IN   uint32_t
//- 		size in word (32 bit) of the buffer to be allocated
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//-  RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-  EXAMPLE:
//-
//-		void *BufferDownloadHandler = NULL;
//-		Utility_ALLOCATE_DOWNLOAD_BUFFER(&BufferDownloadHandler, 1024*1024);
//-----------------------------------------------------------------

SCILIB int Utility_ALLOCATE_DOWNLOAD_BUFFER(void **buffer_handle, uint32_t buffer_size)
{
	uint32_t * buffer = malloc(buffer_size * sizeof(uint32_t));
	if (buffer == NULL) return -1;
	cbuf_handle_t cbuf = circular_buf_init(buffer, buffer_size);
	*buffer_handle = cbuf;
	return 0;
}




//-----------------------------------------------------------------
//-
//-  Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER
//-
//-	 This function take as input a pointer to a buffer handle allocated with the function 
//-  Utility_ALLOCATE_DOWNLOAD_BUFFER and fill it with the content of the array val
//-  If the buffer is full the function fails and the output parameter 
//-  The buffer_size specify the size of the buffer to be allocated enqueued_data willl
//-	 contain the number of word that has been enqueued in the buffer
//-
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_IN   void *
//-			Handle to the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            val			   PARAM_IN   uint32_t *
//-			input data vector downloaded from a FIFO from the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 
//- 	            size   			PARAM_IN   uint32_t 
//- 		number of valid word in the val vector
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            enqueued_data   PARAM_OUT   uint32_t *
//-			number of word of the val vector really enqueued in the circular buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Not all word enqueued in the buffer
//-
//-  EXAMPLE:
//-
//-		FRAME_ImageReadout_0_DOWNLOAD(&data_frame, N_Packet * (9+4), timeout_frame, &handle, &read_data_frame, &valid_data_frame);
//-		Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(BufferDownloadHandler, data_frame, valid_data_frame, &valid_data_enqueued);
//-----------------------------------------------------------------

SCILIB int Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(void *buffer_handle, int32_t *val, uint32_t size, uint32_t *enqueued_data)
{
	cbuf_handle_t cbuf;
	uint32_t i;
	uint32_t data_counter=0;
	cbuf = ((cbuf_handle_t)buffer_handle);
	for (i = 0; i < size; i++)
	{
		if (circular_buf_full(cbuf))
		{
			*enqueued_data = data_counter;
			return -1;
		}
		data_counter++;
		circular_buf_put(cbuf, val[i]);
	}
	*enqueued_data = data_counter;
	return 0;
}


//-----------------------------------------------------------------
//-
//-  Utility_PEAK_DATA_FORM_DOWNLOAD_BUFFER
//-
//-	 This function take as input a pointer to a buffer handle allocated with the function 
//-  Utility_ALLOCATE_DOWNLOAD_BUFFER and retrive one data from the buffer (head of the FIFO)
//-  If the buffer is rmpty function fails with -1 error
//-  The buffer_size specify the size of the buffer to be allocated enqueued_data willl
//-	 contain the number of word that has been enqueued in the buffer
//-
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_IN   void *
//-			Handle to the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            val			   PARAM_OUT   uint32_t *
//-			head of the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Empty
//-
//-  EXAMPLE:
//-----------------------------------------------------------------


SCILIB int Utility_PEAK_DATA_FORM_DOWNLOAD_BUFFER(void *buffer_handle, int32_t *val)
{
	cbuf_handle_t cbuf;
	cbuf = (cbuf_handle_t)buffer_handle;
	if (circular_buf_empty(cbuf))
		return -1;
	circular_buf_get(cbuf, val);
	return 0;
}

//-----------------------------------------------------------------
//-
//-  free_PETIROCFRAME_packet_collection
//-
//-	 This function take as input a pointer to a decoded packets and release the memory
//-
//-  ARGUMENTS:
//- 	    buffer_handle   PARAM_IN   t_ASIC_packet_collection *
//-			Packet to be released
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [void]
//-
//-  EXAMPLE:
//-		PETIROCFRAME_PetirocFrame0_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets);
//-		... processing code ...
//-		free_PETIROCFRAME_packet_collection(&decoded_packets);
//-----------------------------------------------------------------


SCILIB void free_PETIROCFRAME_packet_collection(t_ASIC_packet_collection *decoded_packets)
{
	int i;
	for (i = 0; i < decoded_packets->allocated_packets; i++)
	{
		free(decoded_packets->packets[i].Charge);
		free(decoded_packets->packets[i].FineTime);
		free(decoded_packets->packets[i].CoarseTime);
		free(decoded_packets->packets[i].Hit);
	}
	free(decoded_packets->packets);
}


//-----------------------------------------------------------------
//-
//-  free_FRAME_packet_collection
//-
//-	 This function take as input a pointer to a decoded packets and release the memory
//-
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_IN   t_FRAME_packet_collection *
//-			Packet to be released
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [void]
//-
//-  EXAMPLE:
//-		FRAME_ImageReadout_0_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets);
//-		... processing code ...
//-		free_FRAME_packet_collectionvoid(&decoded_packets);
//-----------------------------------------------------------------


SCILIB void free_FRAME_packet_collection (t_FRAME_packet_collection *decoded_packets)
{
	int i;
	for (i = 0; i < decoded_packets->allocated_packets; i++)
	{
		free(decoded_packets->packets[i].Energy);
	}
	free(decoded_packets->packets);
}



SCILIB void free_packet_collection (t_generic_event_collection *decoded_packets)
{
	int i;
	for (i = 0; i < decoded_packets->allocated_packets; i++)
	{
		free(decoded_packets->packets[i].payload);
	}
	free(decoded_packets->packets);
}



SCILIB int ClearBuffer(void *buffer_handle)
{
	circular_buf_reset(buffer_handle);
	return 0;
}SCILIB int REG_pol_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_pol, handle);
}
SCILIB int REG_pol_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_pol, handle);
}
SCILIB int REG_hithrs_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_hithrs, handle);
}
SCILIB int REG_hithrs_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_hithrs, handle);
}
SCILIB int REG_lothrsh_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_lothrsh, handle);
}
SCILIB int REG_lothrsh_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_lothrsh, handle);
}
SCILIB int REG_inhib_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_inhib, handle);
}
SCILIB int REG_inhib_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_inhib, handle);
}
SCILIB int REG_gatel_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_gatel, handle);
}
SCILIB int REG_gatel_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_gatel, handle);
}
SCILIB int REG_gateu_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_gateu, handle);
}
SCILIB int REG_gateu_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_gateu, handle);
}
SCILIB int REG_delay_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_delay, handle);
}
SCILIB int REG_delay_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_delay, handle);
}
SCILIB int REG_xdelay_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_xdelay, handle);
}
SCILIB int REG_xdelay_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_xdelay, handle);
}
SCILIB int REG_inttime_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_inttime, handle);
}
SCILIB int REG_inttime_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_inttime, handle);
}
SCILIB int REG_preint_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_preint, handle);
}
SCILIB int REG_preint_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_preint, handle);
}
SCILIB int REG_pileup_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_pileup, handle);
}
SCILIB int REG_pileup_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_pileup, handle);
}
SCILIB int REG_gain_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_gain, handle);
}
SCILIB int REG_gain_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_gain, handle);
}
SCILIB int REG_ofs_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_ofs, handle);
}
SCILIB int REG_ofs_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_ofs, handle);
}
SCILIB int REG_bl_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_bl, handle);
}
SCILIB int REG_bl_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_bl, handle);
}
SCILIB int REG_CH_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_CH, handle);
}
SCILIB int REG_CH_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_CH, handle);
}
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

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_0_CONFIG, handle);

}
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

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_0_CONFIG, handle);

}
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

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_0_CONFIG, handle);

}
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

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_0_CONFIG, handle);

}
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

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_0_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_0_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
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

SCILIB int SPECTRUM_Spectrum_0_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_0_STATUS, handle);

}
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

SCILIB int SPECTRUM_Spectrum_0_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_0_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_1_START
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

SCILIB int SPECTRUM_Spectrum_1_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_1_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_1_STOP
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

SCILIB int SPECTRUM_Spectrum_1_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_1_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_1_FLUSH
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

SCILIB int SPECTRUM_Spectrum_1_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_1_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_1_RESET
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

SCILIB int SPECTRUM_Spectrum_1_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_1_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_1_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_1_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle);

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_1_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_1_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_1_STATUS
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

SCILIB int SPECTRUM_Spectrum_1_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_1_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_1_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_1POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_1_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_1, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_1 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_1_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_1_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
