// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Jul  3 12:46:27 2024
// Host        : Hraesvelgr running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Owner/Documents/GitHub/R76Firmware/r5560_sdk/NaI_array_spectra/V2/retarget/output/killspectra/killspectra.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_data_mover_0_0/ZynqDesign_data_mover_0_0_stub.v
// Design      : ZynqDesign_data_mover_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z030fbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "data_mover,Vivado 2017.4" *)
module ZynqDesign_data_mover_0_0(debug_buffer_status_ap_vld, 
  debug_bufsel_0_ap_vld, debug_buf0_p_ap_vld, debug_inbuffer_pointer_ap_vld, 
  debug_dst_var_V_ap_vld, interrupt_r_ap_vld, s_axi_axil_AWADDR, s_axi_axil_AWVALID, 
  s_axi_axil_AWREADY, s_axi_axil_WDATA, s_axi_axil_WSTRB, s_axi_axil_WVALID, 
  s_axi_axil_WREADY, s_axi_axil_BRESP, s_axi_axil_BVALID, s_axi_axil_BREADY, 
  s_axi_axil_ARADDR, s_axi_axil_ARVALID, s_axi_axil_ARREADY, s_axi_axil_RDATA, 
  s_axi_axil_RRESP, s_axi_axil_RVALID, s_axi_axil_RREADY, ap_clk, ap_rst_n, m_axi_a_V_AWADDR, 
  m_axi_a_V_AWLEN, m_axi_a_V_AWSIZE, m_axi_a_V_AWBURST, m_axi_a_V_AWLOCK, 
  m_axi_a_V_AWREGION, m_axi_a_V_AWCACHE, m_axi_a_V_AWPROT, m_axi_a_V_AWQOS, 
  m_axi_a_V_AWVALID, m_axi_a_V_AWREADY, m_axi_a_V_WDATA, m_axi_a_V_WSTRB, m_axi_a_V_WLAST, 
  m_axi_a_V_WVALID, m_axi_a_V_WREADY, m_axi_a_V_BRESP, m_axi_a_V_BVALID, m_axi_a_V_BREADY, 
  m_axi_a_V_ARADDR, m_axi_a_V_ARLEN, m_axi_a_V_ARSIZE, m_axi_a_V_ARBURST, m_axi_a_V_ARLOCK, 
  m_axi_a_V_ARREGION, m_axi_a_V_ARCACHE, m_axi_a_V_ARPROT, m_axi_a_V_ARQOS, 
  m_axi_a_V_ARVALID, m_axi_a_V_ARREADY, m_axi_a_V_RDATA, m_axi_a_V_RRESP, m_axi_a_V_RLAST, 
  m_axi_a_V_RVALID, m_axi_a_V_RREADY, stream0_V_V_TVALID, stream0_V_V_TREADY, 
  stream0_V_V_TDATA, debug_buffer_status, debug_bufsel_0, debug_buf0_p, 
  debug_inbuffer_pointer, debug_dst_var_V, fifo_resetn, interrupt_r)
/* synthesis syn_black_box black_box_pad_pin="debug_buffer_status_ap_vld,debug_bufsel_0_ap_vld,debug_buf0_p_ap_vld,debug_inbuffer_pointer_ap_vld,debug_dst_var_V_ap_vld,interrupt_r_ap_vld,s_axi_axil_AWADDR[6:0],s_axi_axil_AWVALID,s_axi_axil_AWREADY,s_axi_axil_WDATA[31:0],s_axi_axil_WSTRB[3:0],s_axi_axil_WVALID,s_axi_axil_WREADY,s_axi_axil_BRESP[1:0],s_axi_axil_BVALID,s_axi_axil_BREADY,s_axi_axil_ARADDR[6:0],s_axi_axil_ARVALID,s_axi_axil_ARREADY,s_axi_axil_RDATA[31:0],s_axi_axil_RRESP[1:0],s_axi_axil_RVALID,s_axi_axil_RREADY,ap_clk,ap_rst_n,m_axi_a_V_AWADDR[31:0],m_axi_a_V_AWLEN[7:0],m_axi_a_V_AWSIZE[2:0],m_axi_a_V_AWBURST[1:0],m_axi_a_V_AWLOCK[1:0],m_axi_a_V_AWREGION[3:0],m_axi_a_V_AWCACHE[3:0],m_axi_a_V_AWPROT[2:0],m_axi_a_V_AWQOS[3:0],m_axi_a_V_AWVALID,m_axi_a_V_AWREADY,m_axi_a_V_WDATA[31:0],m_axi_a_V_WSTRB[3:0],m_axi_a_V_WLAST,m_axi_a_V_WVALID,m_axi_a_V_WREADY,m_axi_a_V_BRESP[1:0],m_axi_a_V_BVALID,m_axi_a_V_BREADY,m_axi_a_V_ARADDR[31:0],m_axi_a_V_ARLEN[7:0],m_axi_a_V_ARSIZE[2:0],m_axi_a_V_ARBURST[1:0],m_axi_a_V_ARLOCK[1:0],m_axi_a_V_ARREGION[3:0],m_axi_a_V_ARCACHE[3:0],m_axi_a_V_ARPROT[2:0],m_axi_a_V_ARQOS[3:0],m_axi_a_V_ARVALID,m_axi_a_V_ARREADY,m_axi_a_V_RDATA[31:0],m_axi_a_V_RRESP[1:0],m_axi_a_V_RLAST,m_axi_a_V_RVALID,m_axi_a_V_RREADY,stream0_V_V_TVALID,stream0_V_V_TREADY,stream0_V_V_TDATA[63:0],debug_buffer_status[31:0],debug_bufsel_0[31:0],debug_buf0_p[31:0],debug_inbuffer_pointer[31:0],debug_dst_var_V[63:0],fifo_resetn,interrupt_r" */;
  output debug_buffer_status_ap_vld;
  output debug_bufsel_0_ap_vld;
  output debug_buf0_p_ap_vld;
  output debug_inbuffer_pointer_ap_vld;
  output debug_dst_var_V_ap_vld;
  output interrupt_r_ap_vld;
  input [6:0]s_axi_axil_AWADDR;
  input s_axi_axil_AWVALID;
  output s_axi_axil_AWREADY;
  input [31:0]s_axi_axil_WDATA;
  input [3:0]s_axi_axil_WSTRB;
  input s_axi_axil_WVALID;
  output s_axi_axil_WREADY;
  output [1:0]s_axi_axil_BRESP;
  output s_axi_axil_BVALID;
  input s_axi_axil_BREADY;
  input [6:0]s_axi_axil_ARADDR;
  input s_axi_axil_ARVALID;
  output s_axi_axil_ARREADY;
  output [31:0]s_axi_axil_RDATA;
  output [1:0]s_axi_axil_RRESP;
  output s_axi_axil_RVALID;
  input s_axi_axil_RREADY;
  input ap_clk;
  input ap_rst_n;
  output [31:0]m_axi_a_V_AWADDR;
  output [7:0]m_axi_a_V_AWLEN;
  output [2:0]m_axi_a_V_AWSIZE;
  output [1:0]m_axi_a_V_AWBURST;
  output [1:0]m_axi_a_V_AWLOCK;
  output [3:0]m_axi_a_V_AWREGION;
  output [3:0]m_axi_a_V_AWCACHE;
  output [2:0]m_axi_a_V_AWPROT;
  output [3:0]m_axi_a_V_AWQOS;
  output m_axi_a_V_AWVALID;
  input m_axi_a_V_AWREADY;
  output [31:0]m_axi_a_V_WDATA;
  output [3:0]m_axi_a_V_WSTRB;
  output m_axi_a_V_WLAST;
  output m_axi_a_V_WVALID;
  input m_axi_a_V_WREADY;
  input [1:0]m_axi_a_V_BRESP;
  input m_axi_a_V_BVALID;
  output m_axi_a_V_BREADY;
  output [31:0]m_axi_a_V_ARADDR;
  output [7:0]m_axi_a_V_ARLEN;
  output [2:0]m_axi_a_V_ARSIZE;
  output [1:0]m_axi_a_V_ARBURST;
  output [1:0]m_axi_a_V_ARLOCK;
  output [3:0]m_axi_a_V_ARREGION;
  output [3:0]m_axi_a_V_ARCACHE;
  output [2:0]m_axi_a_V_ARPROT;
  output [3:0]m_axi_a_V_ARQOS;
  output m_axi_a_V_ARVALID;
  input m_axi_a_V_ARREADY;
  input [31:0]m_axi_a_V_RDATA;
  input [1:0]m_axi_a_V_RRESP;
  input m_axi_a_V_RLAST;
  input m_axi_a_V_RVALID;
  output m_axi_a_V_RREADY;
  input stream0_V_V_TVALID;
  output stream0_V_V_TREADY;
  input [63:0]stream0_V_V_TDATA;
  output [31:0]debug_buffer_status;
  output [31:0]debug_bufsel_0;
  output [31:0]debug_buf0_p;
  output [31:0]debug_inbuffer_pointer;
  output [63:0]debug_dst_var_V;
  output fifo_resetn;
  output interrupt_r;
endmodule
