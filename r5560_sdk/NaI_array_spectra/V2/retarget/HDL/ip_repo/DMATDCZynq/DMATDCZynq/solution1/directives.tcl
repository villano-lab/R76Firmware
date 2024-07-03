############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode axis -register -register_mode both "example" stream0
set_directive_interface -mode s_axilite -bundle BUS_AL "example" read_pointer
set_directive_interface -mode s_axilite -bundle BUS_AL "example" write_pointer
set_directive_interface -mode ap_ctrl_none "data_mover"
set_directive_interface -mode m_axi -depth 32 "data_mover" a
set_directive_interface -mode axis -register -register_mode both "data_mover" stream0
set_directive_interface -mode s_axilite -bundle axil "data_mover" buffer_status
set_directive_interface -mode s_axilite -bundle axil "data_mover" buffer_ack
set_directive_interface -mode s_axilite -bundle axil "data_mover" buffer_seq
set_directive_interface -mode s_axilite -bundle axil "data_mover" bufsize
set_directive_interface -mode ap_ovld "data_mover" debug_buffer_status
set_directive_interface -mode ap_ovld "data_mover" debug_bufsel_0
set_directive_interface -mode ap_ovld "data_mover" debug_buf0_p
set_directive_interface -mode ap_ovld "data_mover" debug_inbuffer_pointer
set_directive_interface -mode ap_ovld "data_mover" debug_dst_var
set_directive_interface -mode s_axilite -bundle axil "data_mover" run
set_directive_interface -mode s_axilite -bundle axil "data_mover" DDROFFSET
set_directive_interface -mode s_axilite -bundle axil "data_mover" stat_counter
set_directive_interface -mode ap_ovld "data_mover" interrupt_r
set_directive_unroll "data_mover/seq_buf"
set_directive_unroll "data_mover/reset_flag_loop"
set_directive_unroll "data_mover/seq_buf2"
set_directive_interface -mode ap_none "data_mover" fifo_resetn
