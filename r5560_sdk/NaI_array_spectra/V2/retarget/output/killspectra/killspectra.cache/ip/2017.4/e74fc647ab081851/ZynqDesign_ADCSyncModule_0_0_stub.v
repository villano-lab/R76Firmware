// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Jul  3 12:47:28 2024
// Host        : Hraesvelgr running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZynqDesign_ADCSyncModule_0_0_stub.v
// Design      : ZynqDesign_ADCSyncModule_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z030fbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ADCSyncModule_v1_0,Vivado 2017.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(cfg_serdes1_delay, cfg_serdes1_delay_exc, 
  cfg_pulse_bitsleep, cfg_abselector, cfg_channel_selector, cfg_selected_prw, serdes_reset, 
  SMADC_1_CSA, SMADC_1_CSB, SMADC_2_CSA, SMADC_2_CSB, SMADC_3_CSA, SMADC_3_CSB, SMADC_4_CSA, 
  SMADC_4_CSB, SMADC_CLK, SMADC_MOSI, s00_axi_awaddr, s00_axi_awprot, s00_axi_awvalid, 
  s00_axi_awready, s00_axi_wdata, s00_axi_wstrb, s00_axi_wvalid, s00_axi_wready, 
  s00_axi_bresp, s00_axi_bvalid, s00_axi_bready, s00_axi_araddr, s00_axi_arprot, 
  s00_axi_arvalid, s00_axi_arready, s00_axi_rdata, s00_axi_rresp, s00_axi_rvalid, 
  s00_axi_rready, s00_axi_aclk, s00_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="cfg_serdes1_delay[4:0],cfg_serdes1_delay_exc,cfg_pulse_bitsleep,cfg_abselector,cfg_channel_selector[7:0],cfg_selected_prw[15:0],serdes_reset[7:0],SMADC_1_CSA,SMADC_1_CSB,SMADC_2_CSA,SMADC_2_CSB,SMADC_3_CSA,SMADC_3_CSB,SMADC_4_CSA,SMADC_4_CSB,SMADC_CLK,SMADC_MOSI,s00_axi_awaddr[6:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[6:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn" */;
  output [4:0]cfg_serdes1_delay;
  output cfg_serdes1_delay_exc;
  output cfg_pulse_bitsleep;
  output cfg_abselector;
  output [7:0]cfg_channel_selector;
  input [15:0]cfg_selected_prw;
  output [7:0]serdes_reset;
  output SMADC_1_CSA;
  output SMADC_1_CSB;
  output SMADC_2_CSA;
  output SMADC_2_CSB;
  output SMADC_3_CSA;
  output SMADC_3_CSB;
  output SMADC_4_CSA;
  output SMADC_4_CSB;
  output SMADC_CLK;
  output SMADC_MOSI;
  input [6:0]s00_axi_awaddr;
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
  input [6:0]s00_axi_araddr;
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
