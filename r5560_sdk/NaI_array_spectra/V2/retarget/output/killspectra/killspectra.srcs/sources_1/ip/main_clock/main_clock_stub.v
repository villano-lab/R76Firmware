// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Jul  3 12:43:28 2024
// Host        : Hraesvelgr running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/Owner/Documents/GitHub/R76Firmware/r5560_sdk/NaI_array_spectra/V2/retarget/output/killspectra/killspectra.srcs/sources_1/ip/main_clock/main_clock_stub.v
// Design      : main_clock
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z030fbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module main_clock(clk_adc, clk_in_sel, clk_out1, clk_out2, 
  clk_out3, clk_out4, clk_out5, clk_out6, clk_out7, reset, input_clk_stopped, locked, clk_board)
/* synthesis syn_black_box black_box_pad_pin="clk_adc,clk_in_sel,clk_out1,clk_out2,clk_out3,clk_out4,clk_out5,clk_out6,clk_out7,reset,input_clk_stopped,locked,clk_board" */;
  input clk_adc;
  input clk_in_sel;
  output clk_out1;
  output clk_out2;
  output clk_out3;
  output clk_out4;
  output clk_out5;
  output clk_out6;
  output clk_out7;
  input reset;
  output input_clk_stopped;
  output locked;
  input clk_board;
endmodule
