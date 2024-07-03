// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Jul  2 16:40:51 2024
// Host        : Hraesvelgr running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top ZynqDesign_FIRMWAREVERSION_0 -prefix
//               ZynqDesign_FIRMWAREVERSION_0_ ZynqDesign_FIRMWAREOPTIONS_0_stub.v
// Design      : ZynqDesign_FIRMWAREOPTIONS_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z030fbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xlconstant_v1_1_3_xlconstant,Vivado 2017.4" *)
module ZynqDesign_FIRMWAREVERSION_0(dout)
/* synthesis syn_black_box black_box_pad_pin="dout[31:0]" */;
  output [31:0]dout;
endmodule
