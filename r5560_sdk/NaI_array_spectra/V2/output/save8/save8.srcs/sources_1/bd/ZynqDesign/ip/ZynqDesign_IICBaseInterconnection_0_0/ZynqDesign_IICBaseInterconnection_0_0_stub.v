// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Jul  2 16:41:52 2024
// Host        : Hraesvelgr running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Owner/Documents/GitHub/R76Firmware/r5560_sdk/NaI_array_spectra/V2/output/save8/save8.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_IICBaseInterconnection_0_0/ZynqDesign_IICBaseInterconnection_0_0_stub.v
// Design      : ZynqDesign_IICBaseInterconnection_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z030fbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "IICBaseInterconnection_v1_0,Vivado 2017.4" *)
module ZynqDesign_IICBaseInterconnection_0_0(FW_VER, FW_RELEASE_DATE, FW_STRING, IIC_ADDR, 
  CLOCK_SOURCE, INVALID_EXT_CLK, CLOCK_COMMUTATOR, CLOCK_RESET, s00_axi_awaddr, 
  s00_axi_awprot, s00_axi_awvalid, s00_axi_awready, s00_axi_wdata, s00_axi_wstrb, 
  s00_axi_wvalid, s00_axi_wready, s00_axi_bresp, s00_axi_bvalid, s00_axi_bready, 
  s00_axi_araddr, s00_axi_arprot, s00_axi_arvalid, s00_axi_arready, s00_axi_rdata, 
  s00_axi_rresp, s00_axi_rvalid, s00_axi_rready, s00_axi_aclk, s00_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="FW_VER[31:0],FW_RELEASE_DATE[31:0],FW_STRING[127:0],IIC_ADDR[1:0],CLOCK_SOURCE[3:0],INVALID_EXT_CLK,CLOCK_COMMUTATOR,CLOCK_RESET,s00_axi_awaddr[7:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[7:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn" */;
  input [31:0]FW_VER;
  input [31:0]FW_RELEASE_DATE;
  input [127:0]FW_STRING;
  input [1:0]IIC_ADDR;
  input [3:0]CLOCK_SOURCE;
  input INVALID_EXT_CLK;
  output CLOCK_COMMUTATOR;
  output CLOCK_RESET;
  input [7:0]s00_axi_awaddr;
  input [2:0]s00_axi_awprot;
  input s00_axi_awvalid;
  output s00_axi_awready;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_wvalid;
  output s00_axi_wready;
  output [1:0]s00_axi_bresp;
  output s00_axi_bvalid;
  input s00_axi_bready;
  input [7:0]s00_axi_araddr;
  input [2:0]s00_axi_arprot;
  input s00_axi_arvalid;
  output s00_axi_arready;
  output [31:0]s00_axi_rdata;
  output [1:0]s00_axi_rresp;
  output s00_axi_rvalid;
  input s00_axi_rready;
  input s00_axi_aclk;
  input s00_axi_aresetn;
endmodule
