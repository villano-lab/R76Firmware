#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include "ap_int.h"
#include "ap_cint.h"
#include "ap_axi_sdata.h"
#include "hls_stream.h"
using namespace hls;

//#define DDROFFSET 		0x80000000
#define FIFO_PACK 		2048
#define BUFFER_SIZE 	1024*FIFO_PACK
#define BUFFER_COUNT 	2
typedef ap_uint<64> bus_word;
typedef ap_uint<32> ram_word;

void data_mover(	volatile ram_word *a,
					stream<bus_word> stream0,
					int *buffer_status,
					int buffer_ack,
					uint64_t buffer_seq[BUFFER_COUNT],
					uint32_t bufsize[BUFFER_COUNT],
					int *debug_buffer_status,
					int *debug_bufsel_0,
					int *debug_buf0_p,
					int *debug_inbuffer_pointer,
					bus_word *debug_dst_var,
					bool run,
					bool *fifo_resetn,
					ap_uint<32> DDROFFSET,
					uint64_t stat_counter[4],
					bool *interrupt_r
					)

{
	static bool bufstatus[BUFFER_COUNT]= {false};
	static uint64_t bsq[BUFFER_COUNT] = {0};
	static uint64_t lost_counter;
	static uint64_t in_counter;
	static uint64_t out_counter;
	static uint64_t bsc=0;
	static uint32_t buftimeout = 0;
	static int inbuffer_pointer=0;
	static ram_word inbuffer[FIFO_PACK*2];

	static int buf_p=0;
	static int bufsel = 0;
	static bool swap_timeout = false;
	bool buf_enable;
	bool do_copy_ddr=false;
	int i;
	static int obuffer_ack=0;
	bus_word dst_var;
	static bus_word tmpvar[4];
	static short int inner_counter=0;

	static bool clear_fifo = false;

 if (run)
 {

	 clear_fifo = false;

	if (bufstatus[bufsel] == false)
	{
		//If I have data in input fifo
		if (!stream0.empty()) {
			//Get data from FIFO
			stream0.read(dst_var);
			inbuffer[inbuffer_pointer++] = dst_var.range(31,0);
			inbuffer[inbuffer_pointer++] = dst_var.range(63,32);


			//If buffer is not overflow

				*debug_inbuffer_pointer = inbuffer_pointer;

				//If BURST mem is full transger
				if (inbuffer_pointer==FIFO_PACK*2)
				{
					do_copy_ddr=true;
				}

				out_counter++;



		*debug_dst_var = dst_var;

		} else {


		}
	  }
	  else
	  {
		  lost_counter++;
	  }


	if (((do_copy_ddr) || (swap_timeout)) && (bufstatus[bufsel] == false))
	{
		memcpy((ram_word *) (	a+
								DDROFFSET/4+
								buf_p+
								+bufsel*(BUFFER_SIZE*2)),

								(ram_word *) inbuffer,
								(FIFO_PACK*2)*sizeof(ram_word));


		buf_p += inbuffer_pointer;
		inbuffer_pointer=0;

		//If buffer is full or we are in timeout
			if ((buf_p ==  BUFFER_SIZE*2) || (swap_timeout==true))
			{
				bufstatus[bufsel] = true;				//swap buffer
				bufsize[bufsel] = buf_p;				//update buffer valid data
				buftimeout = 0;					//reset timeout
				swap_timeout=false;						//reset swap
				buf_p=0;								//reset buffer pointer
				if (bufsel == 0)						//swap buffer
					bufsel = 1;
				else if (bufsel == 1)
					bufsel = 0;

				bsc++;									//increment buffer inder
				bsq[bufsel] = bsc;						//update new buffer inder
				seq_buf:for (i=0;i<BUFFER_COUNT;i++)
				{
					buffer_seq[i] = bsq[i];
				}

				*interrupt_r=true;
			}
	}


	*buffer_status = ((bufstatus[0] == true ? 1 : 0) << 0) +
					((bufstatus[1] == true ? 1 : 0) << 1);

	//reset buffer status with PCIE ack and update buffer indexes
	reset_flag_loop:for (i=0;i<BUFFER_COUNT;i++)
	{
		if (( ((obuffer_ack>>i) & 0x01) == false) && ( ((buffer_ack>>i) & 0x01) == true))
		{
			bufstatus[i] = false;
		}

	}
	obuffer_ack = buffer_ack;

	*debug_bufsel_0 = bufsel;
	*debug_buf0_p = buf_p;

	*debug_buffer_status = ((bufstatus[0] == true ? 1 : 0) << 0) +
			((bufstatus[1] == true ? 1 : 0) << 1) ;



	stat_counter[0] = in_counter;
	stat_counter[1] = out_counter;
	stat_counter[2] = lost_counter;
	stat_counter[4] = buftimeout;

	//Increment timeout counter


	//if we are in timeout ~1sec with no swap copy actual BURST memory in buffer and
	//perform short DDR access to write data in buffer
	if (buftimeout==10000000)
	{
		swap_timeout=true;				//set swap timeout to true to force buffer swap
		buftimeout = 0;					//reset timeout
	}
	else
		buftimeout++;




 }
 else
 {
	 bufsel =0;
	 inbuffer_pointer=0;
	 buftimeout =0;
	 obuffer_ack=0;
	 *buffer_status =0;
	 bsc=0;
	 in_counter=0;
	 out_counter=0;
	 lost_counter=0;
	 seq_buf2:for (i=0;i<BUFFER_COUNT;i++)
	 {
		buffer_seq[i] = 0;
		bufsize[i] =0;
		bufstatus[i] = false;
	}

	 *interrupt_r=false;
	 clear_fifo = true;
 }
 *fifo_resetn = not clear_fifo;
}

