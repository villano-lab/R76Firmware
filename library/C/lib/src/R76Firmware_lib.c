#include "R5560_SDKLib.h"
#include  <stdlib.h>

#include <stdint.h>

#include "RegisterFile.h"

#include  "circular_buffer.h"


#include  "R76Firmware_lib.h"


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
}SCILIB int REG_polarity_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_polarity, handle);
}
SCILIB int REG_polarity_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_polarity, handle);
}
SCILIB int REG_inhib_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_inhib, handle);
}
SCILIB int REG_inhib_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_inhib, handle);
}
SCILIB int REG_delay_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_delay, handle);
}
SCILIB int REG_delay_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_delay, handle);
}
SCILIB int REG_disable_det_0_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_0, handle);
}
SCILIB int REG_disable_det_0_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_0, handle);
}
SCILIB int REG_disable_det_1_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_1, handle);
}
SCILIB int REG_disable_det_1_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_1, handle);
}
SCILIB int REG_disable_det_2_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_2, handle);
}
SCILIB int REG_disable_det_2_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_2, handle);
}
SCILIB int REG_disable_det_3_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_3, handle);
}
SCILIB int REG_disable_det_3_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_3, handle);
}
SCILIB int REG_disable_det_4_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_4, handle);
}
SCILIB int REG_disable_det_4_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_4, handle);
}
SCILIB int REG_disable_det_5_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_5, handle);
}
SCILIB int REG_disable_det_5_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_5, handle);
}
SCILIB int REG_disable_det_6_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_6, handle);
}
SCILIB int REG_disable_det_6_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_6, handle);
}
SCILIB int REG_disable_det_7_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_7, handle);
}
SCILIB int REG_disable_det_7_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_7, handle);
}
SCILIB int REG_disable_det_8_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_8, handle);
}
SCILIB int REG_disable_det_8_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_8, handle);
}
SCILIB int REG_disable_det_9_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_9, handle);
}
SCILIB int REG_disable_det_9_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_9, handle);
}
SCILIB int REG_disable_det_10_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_10, handle);
}
SCILIB int REG_disable_det_10_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_10, handle);
}
SCILIB int REG_disable_det_11_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_11, handle);
}
SCILIB int REG_disable_det_11_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_11, handle);
}
SCILIB int REG_disable_det_12_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_12, handle);
}
SCILIB int REG_disable_det_12_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_12, handle);
}
SCILIB int REG_disable_det_13_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_13, handle);
}
SCILIB int REG_disable_det_13_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_13, handle);
}
SCILIB int REG_disable_det_14_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_14, handle);
}
SCILIB int REG_disable_det_14_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_14, handle);
}
SCILIB int REG_disable_det_15_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_15, handle);
}
SCILIB int REG_disable_det_15_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_15, handle);
}
SCILIB int REG_disable_det_16_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_16, handle);
}
SCILIB int REG_disable_det_16_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_16, handle);
}
SCILIB int REG_disable_det_17_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_17, handle);
}
SCILIB int REG_disable_det_17_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_17, handle);
}
SCILIB int REG_disable_det_18_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_18, handle);
}
SCILIB int REG_disable_det_18_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_18, handle);
}
SCILIB int REG_disable_det_19_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_19, handle);
}
SCILIB int REG_disable_det_19_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_19, handle);
}
SCILIB int REG_disable_det_20_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_20, handle);
}
SCILIB int REG_disable_det_20_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_20, handle);
}
SCILIB int REG_disable_det_21_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_21, handle);
}
SCILIB int REG_disable_det_21_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_21, handle);
}
SCILIB int REG_disable_det_22_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_22, handle);
}
SCILIB int REG_disable_det_22_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_22, handle);
}
SCILIB int REG_disable_det_23_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_23, handle);
}
SCILIB int REG_disable_det_23_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_23, handle);
}
SCILIB int REG_disable_det_24_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_24, handle);
}
SCILIB int REG_disable_det_24_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_24, handle);
}
SCILIB int REG_gate_l_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_gate_l, handle);
}
SCILIB int REG_gate_l_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_gate_l, handle);
}
SCILIB int REG_gate_u_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_gate_u, handle);
}
SCILIB int REG_gate_u_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_gate_u, handle);
}
SCILIB int REG_fifo_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_fifo, handle);
}
SCILIB int REG_fifo_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_fifo, handle);
}
SCILIB int REG_read_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_read, handle);
}
SCILIB int REG_read_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_read, handle);
}
SCILIB int REG_empty_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_empty, handle);
}
SCILIB int REG_empty_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_empty, handle);
}
SCILIB int REG_full_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_full, handle);
}
SCILIB int REG_full_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_full, handle);
}
SCILIB int REG_write_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_write, handle);
}
SCILIB int REG_write_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_write, handle);
}
SCILIB int REG_disable_det_25_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_25, handle);
}
SCILIB int REG_disable_det_25_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_25, handle);
}
SCILIB int REG_disable_det_26_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_26, handle);
}
SCILIB int REG_disable_det_26_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_26, handle);
}
SCILIB int REG_disable_det_27_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_27, handle);
}
SCILIB int REG_disable_det_27_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_27, handle);
}
SCILIB int REG_disable_det_28_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_28, handle);
}
SCILIB int REG_disable_det_28_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_28, handle);
}
SCILIB int REG_disable_det_29_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_29, handle);
}
SCILIB int REG_disable_det_29_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_29, handle);
}
SCILIB int REG_disable_det_30_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_30, handle);
}
SCILIB int REG_disable_det_30_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_30, handle);
}
SCILIB int REG_disable_det_31_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_disable_det_31, handle);
}
SCILIB int REG_disable_det_31_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_disable_det_31, handle);
}
SCILIB int REG_skip_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_skip, handle);
}
SCILIB int REG_skip_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_skip, handle);
}
SCILIB int REG_stopwrite_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_stopwrite, handle);
}
SCILIB int REG_stopwrite_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_stopwrite, handle);
}
SCILIB int REG_reset_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_reset, handle);
}
SCILIB int REG_reset_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_reset, handle);
}
SCILIB int REG_int_time_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_int_time, handle);
}
SCILIB int REG_int_time_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_int_time, handle);
}
SCILIB int REG_pre_int_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_pre_int, handle);
}
SCILIB int REG_pre_int_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_pre_int, handle);
}
SCILIB int REG_baseline_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_baseline, handle);
}
SCILIB int REG_baseline_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_baseline, handle);
}
SCILIB int REG_top_1_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_1, handle);
}
SCILIB int REG_top_1_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_1, handle);
}
SCILIB int REG_top_2_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_2, handle);
}
SCILIB int REG_top_2_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_2, handle);
}
SCILIB int REG_top_3_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_3, handle);
}
SCILIB int REG_top_3_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_3, handle);
}
SCILIB int REG_top_4_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_4, handle);
}
SCILIB int REG_top_4_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_4, handle);
}
SCILIB int REG_top_5_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_5, handle);
}
SCILIB int REG_top_5_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_5, handle);
}
SCILIB int REG_top_6_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_6, handle);
}
SCILIB int REG_top_6_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_6, handle);
}
SCILIB int REG_top_7_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_7, handle);
}
SCILIB int REG_top_7_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_7, handle);
}
SCILIB int REG_top_8_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_8, handle);
}
SCILIB int REG_top_8_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_8, handle);
}
SCILIB int REG_top_9_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_9, handle);
}
SCILIB int REG_top_9_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_9, handle);
}
SCILIB int REG_top_10_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_10, handle);
}
SCILIB int REG_top_10_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_10, handle);
}
SCILIB int REG_top_11_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_11, handle);
}
SCILIB int REG_top_11_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_11, handle);
}
SCILIB int REG_top_12_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_12, handle);
}
SCILIB int REG_top_12_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_12, handle);
}
SCILIB int REG_top_13_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_13, handle);
}
SCILIB int REG_top_13_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_13, handle);
}
SCILIB int REG_top_14_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_14, handle);
}
SCILIB int REG_top_14_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_14, handle);
}
SCILIB int REG_top_15_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_15, handle);
}
SCILIB int REG_top_15_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_15, handle);
}
SCILIB int REG_top_16_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_16, handle);
}
SCILIB int REG_top_16_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_16, handle);
}
SCILIB int REG_top_17_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_17, handle);
}
SCILIB int REG_top_17_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_17, handle);
}
SCILIB int REG_top_18_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_18, handle);
}
SCILIB int REG_top_18_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_18, handle);
}
SCILIB int REG_top_19_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_19, handle);
}
SCILIB int REG_top_19_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_19, handle);
}
SCILIB int REG_top_20_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_20, handle);
}
SCILIB int REG_top_20_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_20, handle);
}
SCILIB int REG_top_21_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_21, handle);
}
SCILIB int REG_top_21_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_21, handle);
}
SCILIB int REG_top_22_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_22, handle);
}
SCILIB int REG_top_22_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_22, handle);
}
SCILIB int REG_top_23_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_23, handle);
}
SCILIB int REG_top_23_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_23, handle);
}
SCILIB int REG_top_24_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_24, handle);
}
SCILIB int REG_top_24_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_24, handle);
}
SCILIB int REG_top_25_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_25, handle);
}
SCILIB int REG_top_25_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_25, handle);
}
SCILIB int REG_top_26_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_26, handle);
}
SCILIB int REG_top_26_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_26, handle);
}
SCILIB int REG_top_27_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_27, handle);
}
SCILIB int REG_top_27_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_27, handle);
}
SCILIB int REG_top_28_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_28, handle);
}
SCILIB int REG_top_28_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_28, handle);
}
SCILIB int REG_top_29_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_29, handle);
}
SCILIB int REG_top_29_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_29, handle);
}
SCILIB int REG_top_30_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_30, handle);
}
SCILIB int REG_top_30_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_30, handle);
}
SCILIB int REG_top_31_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_31, handle);
}
SCILIB int REG_top_31_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_31, handle);
}
SCILIB int REG_top_32_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_32, handle);
}
SCILIB int REG_top_32_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_32, handle);
}
SCILIB int REG_top_0_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_top_0, handle);
}
SCILIB int REG_top_0_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_top_0, handle);
}
SCILIB int REG_thrsh_0_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_0, handle);
}
SCILIB int REG_thrsh_0_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_0, handle);
}
SCILIB int REG_thrsh_1_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_1, handle);
}
SCILIB int REG_thrsh_1_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_1, handle);
}
SCILIB int REG_thrsh_2_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_2, handle);
}
SCILIB int REG_thrsh_2_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_2, handle);
}
SCILIB int REG_thrsh_3_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_3, handle);
}
SCILIB int REG_thrsh_3_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_3, handle);
}
SCILIB int REG_thrsh_4_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_4, handle);
}
SCILIB int REG_thrsh_4_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_4, handle);
}
SCILIB int REG_thrsh_5_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_5, handle);
}
SCILIB int REG_thrsh_5_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_5, handle);
}
SCILIB int REG_thrsh_6_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_6, handle);
}
SCILIB int REG_thrsh_6_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_6, handle);
}
SCILIB int REG_thrsh_7_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_7, handle);
}
SCILIB int REG_thrsh_7_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_7, handle);
}
SCILIB int REG_thrsh_8_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_8, handle);
}
SCILIB int REG_thrsh_8_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_8, handle);
}
SCILIB int REG_thrsh_9_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_9, handle);
}
SCILIB int REG_thrsh_9_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_9, handle);
}
SCILIB int REG_thrsh_10_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_10, handle);
}
SCILIB int REG_thrsh_10_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_10, handle);
}
SCILIB int REG_thrsh_11_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_11, handle);
}
SCILIB int REG_thrsh_11_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_11, handle);
}
SCILIB int REG_thrsh_12_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_12, handle);
}
SCILIB int REG_thrsh_12_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_12, handle);
}
SCILIB int REG_thrsh_13_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_13, handle);
}
SCILIB int REG_thrsh_13_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_13, handle);
}
SCILIB int REG_thrsh_14_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_14, handle);
}
SCILIB int REG_thrsh_14_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_14, handle);
}
SCILIB int REG_thrsh_15_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_15, handle);
}
SCILIB int REG_thrsh_15_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_15, handle);
}
SCILIB int REG_thrsh_16_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_16, handle);
}
SCILIB int REG_thrsh_16_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_16, handle);
}
SCILIB int REG_thrsh_17_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_17, handle);
}
SCILIB int REG_thrsh_17_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_17, handle);
}
SCILIB int REG_thrsh_18_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_18, handle);
}
SCILIB int REG_thrsh_18_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_18, handle);
}
SCILIB int REG_thrsh_19_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_19, handle);
}
SCILIB int REG_thrsh_19_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_19, handle);
}
SCILIB int REG_thrsh_20_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_20, handle);
}
SCILIB int REG_thrsh_20_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_20, handle);
}
SCILIB int REG_thrsh_21_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_21, handle);
}
SCILIB int REG_thrsh_21_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_21, handle);
}
SCILIB int REG_thrsh_22_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_22, handle);
}
SCILIB int REG_thrsh_22_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_22, handle);
}
SCILIB int REG_thrsh_23_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_thrsh_23, handle);
}
SCILIB int REG_thrsh_23_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_thrsh_23, handle);
}
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

SCILIB int RATE_METER_RateMeter_NoSkip_GET_DATA(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, channels, SCI_REG_RateMeter_NoSkip_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
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

SCILIB int RATE_METER_RateMeter_NoSkip_GET_DATA_COUNTS(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, channels, SCI_REG_RateMeter_NoSkip_FIFOADDRESS+512, timeout, handle, read_data, valid_data);

}
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

SCILIB int RATE_METER_RateMeter_0_GET_DATA(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, channels, SCI_REG_RateMeter_0_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
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

SCILIB int RATE_METER_RateMeter_0_GET_DATA_COUNTS(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, channels, SCI_REG_RateMeter_0_FIFOADDRESS+512, timeout, handle, read_data, valid_data);

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

SCILIB int SPECTRUM_Spectrum_0_STOP(NI_HANDLE *handle)

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

SCILIB int SPECTRUM_Spectrum_0_FLUSH(NI_HANDLE *handle)

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

SCILIB int SPECTRUM_Spectrum_0_RESET(NI_HANDLE *handle)

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

SCILIB int SPECTRUM_Spectrum_0_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

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

SCILIB int SPECTRUM_Spectrum_1_STOP(NI_HANDLE *handle)

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

SCILIB int SPECTRUM_Spectrum_1_FLUSH(NI_HANDLE *handle)

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

SCILIB int SPECTRUM_Spectrum_1_RESET(NI_HANDLE *handle)

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

SCILIB int SPECTRUM_Spectrum_1_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

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
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_2_START
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

SCILIB int SPECTRUM_Spectrum_2_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_2_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_2_STOP
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

SCILIB int SPECTRUM_Spectrum_2_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_2_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_2_FLUSH
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

SCILIB int SPECTRUM_Spectrum_2_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_2_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_2_RESET
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

SCILIB int SPECTRUM_Spectrum_2_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_2_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_2_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_2_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_2_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_2_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_2_STATUS
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

SCILIB int SPECTRUM_Spectrum_2_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_2_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_2_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_2POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_2_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_2, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_2 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_2_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_2_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_3_START
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

SCILIB int SPECTRUM_Spectrum_3_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_3_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_3_STOP
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

SCILIB int SPECTRUM_Spectrum_3_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_3_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_3_FLUSH
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

SCILIB int SPECTRUM_Spectrum_3_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_3_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_3_RESET
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

SCILIB int SPECTRUM_Spectrum_3_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_3_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_3_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_3_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_3_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_3_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_3_STATUS
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

SCILIB int SPECTRUM_Spectrum_3_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_3_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_3_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_3POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_3_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_3, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_3 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_3_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_3_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_4_START
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

SCILIB int SPECTRUM_Spectrum_4_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_4_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_4_STOP
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

SCILIB int SPECTRUM_Spectrum_4_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_4_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_4_FLUSH
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

SCILIB int SPECTRUM_Spectrum_4_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_4_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_4_RESET
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

SCILIB int SPECTRUM_Spectrum_4_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_4_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_4_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_4_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_4_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_4_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_4_STATUS
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

SCILIB int SPECTRUM_Spectrum_4_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_4_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_4_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_4POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_4_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_4, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_4 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_4_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_4_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_5_START
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

SCILIB int SPECTRUM_Spectrum_5_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_5_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_5_STOP
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

SCILIB int SPECTRUM_Spectrum_5_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_5_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_5_FLUSH
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

SCILIB int SPECTRUM_Spectrum_5_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_5_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_5_RESET
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

SCILIB int SPECTRUM_Spectrum_5_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_5_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_5_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_5_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_5_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_5_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_5_STATUS
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

SCILIB int SPECTRUM_Spectrum_5_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_5_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_5_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_5POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_5_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_5, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_5 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_5_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_5_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_6_START
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

SCILIB int SPECTRUM_Spectrum_6_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_6_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_6_STOP
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

SCILIB int SPECTRUM_Spectrum_6_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_6_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_6_FLUSH
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

SCILIB int SPECTRUM_Spectrum_6_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_6_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_6_RESET
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

SCILIB int SPECTRUM_Spectrum_6_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_6_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_6_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_6_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_6_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_6_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_6_STATUS
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

SCILIB int SPECTRUM_Spectrum_6_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_6_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_6_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_6POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_6_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_6, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_6 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_6_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_6_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_7_START
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

SCILIB int SPECTRUM_Spectrum_7_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_7_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_7_STOP
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

SCILIB int SPECTRUM_Spectrum_7_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_7_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_7_FLUSH
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

SCILIB int SPECTRUM_Spectrum_7_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_7_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_7_RESET
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

SCILIB int SPECTRUM_Spectrum_7_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_7_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_7_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_7_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_7_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_7_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_7_STATUS
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

SCILIB int SPECTRUM_Spectrum_7_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_7_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_7_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_7POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_7_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_7, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_7 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_7_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_7_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_8_START
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

SCILIB int SPECTRUM_Spectrum_8_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_8_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_8_STOP
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

SCILIB int SPECTRUM_Spectrum_8_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_8_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_8_FLUSH
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

SCILIB int SPECTRUM_Spectrum_8_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_8_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_8_RESET
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

SCILIB int SPECTRUM_Spectrum_8_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_8_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_8_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_8_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_8_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_8_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_8_STATUS
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

SCILIB int SPECTRUM_Spectrum_8_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_8_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_8_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_8POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_8_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_8, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_8 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_8_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_8_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_9_START
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

SCILIB int SPECTRUM_Spectrum_9_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_9_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_9_STOP
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

SCILIB int SPECTRUM_Spectrum_9_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_9_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_9_FLUSH
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

SCILIB int SPECTRUM_Spectrum_9_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_9_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_9_RESET
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

SCILIB int SPECTRUM_Spectrum_9_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_9_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_9_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_9_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_9_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_9_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_9_STATUS
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

SCILIB int SPECTRUM_Spectrum_9_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_9_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_9_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_9POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_9_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_9, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_9 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_9_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_9_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_10_START
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

SCILIB int SPECTRUM_Spectrum_10_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_10_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_10_STOP
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

SCILIB int SPECTRUM_Spectrum_10_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_10_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_10_FLUSH
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

SCILIB int SPECTRUM_Spectrum_10_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_10_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_10_RESET
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

SCILIB int SPECTRUM_Spectrum_10_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_10_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_10_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_10_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_10_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_10_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_10_STATUS
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

SCILIB int SPECTRUM_Spectrum_10_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_10_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_10_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_10POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_10_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_10, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_10 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_10_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_10_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_11_START
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

SCILIB int SPECTRUM_Spectrum_11_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_11_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_11_STOP
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

SCILIB int SPECTRUM_Spectrum_11_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_11_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_11_FLUSH
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

SCILIB int SPECTRUM_Spectrum_11_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_11_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_11_RESET
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

SCILIB int SPECTRUM_Spectrum_11_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_11_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_11_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_11_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_11_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_11_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_11_STATUS
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

SCILIB int SPECTRUM_Spectrum_11_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_11_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_11_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_11POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_11_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_11, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_11 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_11_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_11_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_12_START
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

SCILIB int SPECTRUM_Spectrum_12_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_12_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_12_STOP
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

SCILIB int SPECTRUM_Spectrum_12_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_12_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_12_FLUSH
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

SCILIB int SPECTRUM_Spectrum_12_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_12_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_12_RESET
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

SCILIB int SPECTRUM_Spectrum_12_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_12_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_12_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_12_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_12_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_12_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_12_STATUS
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

SCILIB int SPECTRUM_Spectrum_12_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_12_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_12_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_12POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_12_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_12, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_12 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_12_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_12_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_13_START
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

SCILIB int SPECTRUM_Spectrum_13_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_13_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_13_STOP
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

SCILIB int SPECTRUM_Spectrum_13_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_13_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_13_FLUSH
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

SCILIB int SPECTRUM_Spectrum_13_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_13_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_13_RESET
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

SCILIB int SPECTRUM_Spectrum_13_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_13_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_13_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_13_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_13_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_13_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_13_STATUS
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

SCILIB int SPECTRUM_Spectrum_13_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_13_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_13_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_13POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_13_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_13, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_13 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_13_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_13_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_14_START
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

SCILIB int SPECTRUM_Spectrum_14_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_14_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_14_STOP
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

SCILIB int SPECTRUM_Spectrum_14_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_14_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_14_FLUSH
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

SCILIB int SPECTRUM_Spectrum_14_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_14_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_14_RESET
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

SCILIB int SPECTRUM_Spectrum_14_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_14_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_14_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_14_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_14_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_14_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_14_STATUS
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

SCILIB int SPECTRUM_Spectrum_14_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_14_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_14_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_14POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_14_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_14, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_14 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_14_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_14_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_15_START
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

SCILIB int SPECTRUM_Spectrum_15_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_15_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_15_STOP
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

SCILIB int SPECTRUM_Spectrum_15_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_15_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_15_FLUSH
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

SCILIB int SPECTRUM_Spectrum_15_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_15_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_15_RESET
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

SCILIB int SPECTRUM_Spectrum_15_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_15_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_15_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_15_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_15_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_15_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_15_STATUS
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

SCILIB int SPECTRUM_Spectrum_15_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_15_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_15_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_15POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_15_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_15, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_15 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_15_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_15_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_16_START
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

SCILIB int SPECTRUM_Spectrum_16_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_16_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_16_STOP
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

SCILIB int SPECTRUM_Spectrum_16_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_16_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_16_FLUSH
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

SCILIB int SPECTRUM_Spectrum_16_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_16_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_16_RESET
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

SCILIB int SPECTRUM_Spectrum_16_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_16_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_16_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_16_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_16_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_16_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_16_STATUS
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

SCILIB int SPECTRUM_Spectrum_16_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_16_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_16_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_16POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_16_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_16, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_16 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_16_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_16_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_17_START
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

SCILIB int SPECTRUM_Spectrum_17_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_17_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_17_STOP
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

SCILIB int SPECTRUM_Spectrum_17_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_17_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_17_FLUSH
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

SCILIB int SPECTRUM_Spectrum_17_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_17_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_17_RESET
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

SCILIB int SPECTRUM_Spectrum_17_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_17_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_17_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_17_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_17_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_17_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_17_STATUS
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

SCILIB int SPECTRUM_Spectrum_17_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_17_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_17_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_17POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_17_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_17, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_17 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_17_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_17_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_18_START
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

SCILIB int SPECTRUM_Spectrum_18_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_18_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_18_STOP
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

SCILIB int SPECTRUM_Spectrum_18_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_18_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_18_FLUSH
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

SCILIB int SPECTRUM_Spectrum_18_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_18_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_18_RESET
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

SCILIB int SPECTRUM_Spectrum_18_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_18_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_18_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_18_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_18_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_18_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_18_STATUS
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

SCILIB int SPECTRUM_Spectrum_18_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_18_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_18_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_18POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_18_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_18, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_18 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_18_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_18_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_19_START
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

SCILIB int SPECTRUM_Spectrum_19_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_19_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_19_STOP
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

SCILIB int SPECTRUM_Spectrum_19_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_19_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_19_FLUSH
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

SCILIB int SPECTRUM_Spectrum_19_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_19_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_19_RESET
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

SCILIB int SPECTRUM_Spectrum_19_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_19_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_19_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_19_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_19_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_19_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_19_STATUS
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

SCILIB int SPECTRUM_Spectrum_19_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_19_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_19_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_19POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_19_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_19, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_19 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_19_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_19_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_20_START
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

SCILIB int SPECTRUM_Spectrum_20_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_20_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_20_STOP
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

SCILIB int SPECTRUM_Spectrum_20_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_20_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_20_FLUSH
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

SCILIB int SPECTRUM_Spectrum_20_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_20_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_20_RESET
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

SCILIB int SPECTRUM_Spectrum_20_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_20_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_20_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_20_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_20_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_20_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_20_STATUS
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

SCILIB int SPECTRUM_Spectrum_20_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_20_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_20_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_20POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_20_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_20, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_20 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_20_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_20_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_21_START
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

SCILIB int SPECTRUM_Spectrum_21_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_21_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_21_STOP
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

SCILIB int SPECTRUM_Spectrum_21_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_21_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_21_FLUSH
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

SCILIB int SPECTRUM_Spectrum_21_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_21_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_21_RESET
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

SCILIB int SPECTRUM_Spectrum_21_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_21_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_21_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_21_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_21_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_21_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_21_STATUS
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

SCILIB int SPECTRUM_Spectrum_21_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_21_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_21_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_21POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_21_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_21, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_21 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_21_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_21_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_22_START
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

SCILIB int SPECTRUM_Spectrum_22_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_22_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_22_STOP
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

SCILIB int SPECTRUM_Spectrum_22_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_22_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_22_FLUSH
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

SCILIB int SPECTRUM_Spectrum_22_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_22_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_22_RESET
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

SCILIB int SPECTRUM_Spectrum_22_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_22_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_22_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_22_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_22_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_22_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_22_STATUS
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

SCILIB int SPECTRUM_Spectrum_22_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_22_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_22_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_22POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_22_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_22, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_22 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_22_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_22_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_23_START
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

SCILIB int SPECTRUM_Spectrum_23_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(4,SCI_REG_Spectrum_23_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_23_STOP
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

SCILIB int SPECTRUM_Spectrum_23_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_Spectrum_23_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_23_FLUSH
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

SCILIB int SPECTRUM_Spectrum_23_FLUSH(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_Spectrum_23_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_23_RESET
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

SCILIB int SPECTRUM_Spectrum_23_RESET(NI_HANDLE *handle)

{
return __abstracted_reg_write(2,SCI_REG_Spectrum_23_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_23_SET_PARAMETERS
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

SCILIB int SPECTRUM_Spectrum_23_SET_PARAMETERS(int32_t rebin, int32_t limit_mode, int32_t limit_value, NI_HANDLE *handle)

{
     int32_t limit = 0;
     int r_rebin = __abstracted_reg_write(rebin, SCI_REG_Spectrum_23_CONFIG_REBIN, handle);
     limit = (1 << (limit_mode + 29)) + limit_value; 
     int r_limit = __abstracted_reg_write(limit, SCI_REG_Spectrum_23_CONFIG_LIMIT, handle);
     if (r_rebin == 0 & r_limit == 0)
         return 0;
     else
         return -1;

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_23_STATUS
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

SCILIB int SPECTRUM_Spectrum_23_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Spectrum_23_STATUS, handle);

}
//-----------------------------------------------------------------
//-
//- SPECTRUM_Spectrum_23_DOWNLOAD
//-
//- Download data from buffer. Please note that downloaded data is not time ordered and the trigger position info data must be obtained using the OSCILLOSCOPE_Spectrum_23POSITION function 
//- 
//- USAGE: 
//-     OSCILLOSCOPE_Spectrum_23_DOWNLOAD(data_buffer, BUFFER_SIZE_Spectrum_23, 1000, handle, rd, vp);
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. Use macro BUFFER_SIZE_Spectrum_23 to get actual oscilloscope buffer size on FPGA
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

SCILIB int SPECTRUM_Spectrum_23_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Spectrum_23_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
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

{
int r1 = __abstracted_reg_write(0,SCI_REG_Oscilloscope_0_CONFIG_ARM, handle);
int r2 = __abstracted_reg_write(1,SCI_REG_Oscilloscope_0_CONFIG_ARM, handle);
if ((r1 == 0) && (r2 == 0))
    return 0;
else
    return -1;

}
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

SCILIB int OSCILLOSCOPE_Oscilloscope_0_SET_PARAMETERS(int32_t decimator, int32_t pre, int32_t software_trigger, int32_t analog_trigger, int32_t digital0_trigger, int32_t digital1_trigger, int32_t digital2_trigger, int32_t digital3_trigger, int32_t trigger_channel, int32_t trigger_edge, int32_t trigger_level, NI_HANDLE *handle)
{
int32_t triggermode = 0;
int r_decimator = __abstracted_reg_write(decimator, SCI_REG_Oscilloscope_0_CONFIG_DECIMATOR, handle);
int r_pre = __abstracted_reg_write(pre, SCI_REG_Oscilloscope_0_CONFIG_PRETRIGGER, handle);
int r_triglevel = __abstracted_reg_write(trigger_level, SCI_REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL, handle);
triggermode = (trigger_channel << 8)  + (software_trigger << 7 ) + (trigger_edge << 3) + (software_trigger << 1) + analog_trigger + (digital0_trigger << 2) + (digital1_trigger << 2) + digital1_trigger + (digital2_trigger << 2) + (digital2_trigger << 1) + (digital3_trigger << 2) + (digital3_trigger << 1) + digital3_trigger ; 
int r_triggermode = __abstracted_reg_write(triggermode, SCI_REG_Oscilloscope_0_CONFIG_TRIGGER_MODE, handle);
if (r_decimator == 0 & r_pre == 0 & r_triglevel == 0 & r_triggermode == 0)
    return 0;
else
    return -1;

}
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

SCILIB int OSCILLOSCOPE_Oscilloscope_0_STATUS(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_Oscilloscope_0_READ_STATUS, handle);

}
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

SCILIB int OSCILLOSCOPE_Oscilloscope_0_POSITION(int32_t *position,NI_HANDLE *handle)
{
return __abstracted_reg_read(position, SCI_REG_Oscilloscope_0_READ_POSITION, handle);

}
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

SCILIB int OSCILLOSCOPE_Oscilloscope_0_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, size, SCI_REG_Oscilloscope_0_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
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

SCILIB int OSCILLOSCOPE_Oscilloscope_0_RECONSTRUCT(uint32_t *data_osc, uint32_t position, int32_t pre_trigger, uint32_t *read_analog, uint32_t *read_digital0, uint32_t *read_digital1, uint32_t *read_digital2, uint32_t *read_digital3)
{
int n_ch = 24;
int n_samples = 1024;
if (position > n_samples) return -1;
for(int n=0; n< n_ch; n++)
{
	int current = position - pre_trigger;
	if (current > 0)
    {
	    int k = 0;
	    for (int i = current; i < n_samples - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
	    for (int i = 0; i < current - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
    }
    else
    {
	    int k = 0;
	    for (int i = n_samples+current; i < n_samples - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
	    for (int i = 0; i < n_samples + current - 1; i++)
        {
		 read_analog[k + (n_samples*n)] = data_osc[i + (n_samples*n)] & 65535;
		 read_digital0[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 16 & 1;
		 read_digital1[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 17 & 1;
		 read_digital2[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 18 & 1;
		 read_digital3[k + (n_samples*n)] = data_osc[i + (n_samples*n)] >> 19 & 1;
             k++;
        }
    }
}
return 0;

}
