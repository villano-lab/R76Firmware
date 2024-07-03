// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Jul  3 12:46:57 2024
// Host        : Hraesvelgr running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top ZynqDesign_util_vector_logic_1_0 -prefix
//               ZynqDesign_util_vector_logic_1_0_ ZynqDesign_RESET_RX_0_stub.v
// Design      : ZynqDesign_RESET_RX_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z030fbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "util_vector_logic_v2_0_1_util_vector_logic,Vivado 2017.4" *)
module ZynqDesign_util_vector_logic_1_0(Op1, Res)
/* synthesis syn_black_box black_box_pad_pin="Op1[0:0],Res[0:0]" */;
  input [0:0]Op1;
  output [0:0]Res;
endmodule
