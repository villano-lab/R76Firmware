-- (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: NuclearInstruments:hls:data_mover:2.0
-- IP Revision: 2113359718

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ZynqDesign_data_mover_0_0 IS
  PORT (
    debug_buffer_status_ap_vld : OUT STD_LOGIC;
    debug_bufsel_0_ap_vld : OUT STD_LOGIC;
    debug_buf0_p_ap_vld : OUT STD_LOGIC;
    debug_inbuffer_pointer_ap_vld : OUT STD_LOGIC;
    debug_dst_var_V_ap_vld : OUT STD_LOGIC;
    interrupt_r_ap_vld : OUT STD_LOGIC;
    s_axi_axil_AWADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_axil_AWVALID : IN STD_LOGIC;
    s_axi_axil_AWREADY : OUT STD_LOGIC;
    s_axi_axil_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_axil_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_axil_WVALID : IN STD_LOGIC;
    s_axi_axil_WREADY : OUT STD_LOGIC;
    s_axi_axil_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_axil_BVALID : OUT STD_LOGIC;
    s_axi_axil_BREADY : IN STD_LOGIC;
    s_axi_axil_ARADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_axil_ARVALID : IN STD_LOGIC;
    s_axi_axil_ARREADY : OUT STD_LOGIC;
    s_axi_axil_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_axil_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_axil_RVALID : OUT STD_LOGIC;
    s_axi_axil_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    m_axi_a_V_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_a_V_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_a_V_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_a_V_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_a_V_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_a_V_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_a_V_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_a_V_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_a_V_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_a_V_AWVALID : OUT STD_LOGIC;
    m_axi_a_V_AWREADY : IN STD_LOGIC;
    m_axi_a_V_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_a_V_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_a_V_WLAST : OUT STD_LOGIC;
    m_axi_a_V_WVALID : OUT STD_LOGIC;
    m_axi_a_V_WREADY : IN STD_LOGIC;
    m_axi_a_V_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_a_V_BVALID : IN STD_LOGIC;
    m_axi_a_V_BREADY : OUT STD_LOGIC;
    m_axi_a_V_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_a_V_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_a_V_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_a_V_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_a_V_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_a_V_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_a_V_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_a_V_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_a_V_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_a_V_ARVALID : OUT STD_LOGIC;
    m_axi_a_V_ARREADY : IN STD_LOGIC;
    m_axi_a_V_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_a_V_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_a_V_RLAST : IN STD_LOGIC;
    m_axi_a_V_RVALID : IN STD_LOGIC;
    m_axi_a_V_RREADY : OUT STD_LOGIC;
    stream0_V_V_TVALID : IN STD_LOGIC;
    stream0_V_V_TREADY : OUT STD_LOGIC;
    stream0_V_V_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    debug_buffer_status : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    debug_bufsel_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    debug_buf0_p : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    debug_inbuffer_pointer : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    debug_dst_var_V : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    fifo_resetn : OUT STD_LOGIC;
    interrupt_r : OUT STD_LOGIC
  );
END ZynqDesign_data_mover_0_0;

ARCHITECTURE ZynqDesign_data_mover_0_0_arch OF ZynqDesign_data_mover_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF ZynqDesign_data_mover_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT data_mover IS
    GENERIC (
      C_S_AXI_AXIL_ADDR_WIDTH : INTEGER;
      C_S_AXI_AXIL_DATA_WIDTH : INTEGER;
      C_M_AXI_A_V_ID_WIDTH : INTEGER;
      C_M_AXI_A_V_ADDR_WIDTH : INTEGER;
      C_M_AXI_A_V_DATA_WIDTH : INTEGER;
      C_M_AXI_A_V_AWUSER_WIDTH : INTEGER;
      C_M_AXI_A_V_ARUSER_WIDTH : INTEGER;
      C_M_AXI_A_V_WUSER_WIDTH : INTEGER;
      C_M_AXI_A_V_RUSER_WIDTH : INTEGER;
      C_M_AXI_A_V_BUSER_WIDTH : INTEGER;
      C_M_AXI_A_V_USER_VALUE : INTEGER;
      C_M_AXI_A_V_PROT_VALUE : INTEGER;
      C_M_AXI_A_V_CACHE_VALUE : INTEGER;
      C_M_AXI_A_V_TARGET_ADDR : INTEGER
    );
    PORT (
      debug_buffer_status_ap_vld : OUT STD_LOGIC;
      debug_bufsel_0_ap_vld : OUT STD_LOGIC;
      debug_buf0_p_ap_vld : OUT STD_LOGIC;
      debug_inbuffer_pointer_ap_vld : OUT STD_LOGIC;
      debug_dst_var_V_ap_vld : OUT STD_LOGIC;
      interrupt_r_ap_vld : OUT STD_LOGIC;
      s_axi_axil_AWADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      s_axi_axil_AWVALID : IN STD_LOGIC;
      s_axi_axil_AWREADY : OUT STD_LOGIC;
      s_axi_axil_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_axil_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_axil_WVALID : IN STD_LOGIC;
      s_axi_axil_WREADY : OUT STD_LOGIC;
      s_axi_axil_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_axil_BVALID : OUT STD_LOGIC;
      s_axi_axil_BREADY : IN STD_LOGIC;
      s_axi_axil_ARADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
      s_axi_axil_ARVALID : IN STD_LOGIC;
      s_axi_axil_ARREADY : OUT STD_LOGIC;
      s_axi_axil_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_axil_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_axil_RVALID : OUT STD_LOGIC;
      s_axi_axil_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      m_axi_a_V_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_a_V_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_a_V_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_a_V_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_a_V_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_a_V_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_a_V_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_a_V_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_a_V_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_a_V_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_a_V_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_a_V_AWVALID : OUT STD_LOGIC;
      m_axi_a_V_AWREADY : IN STD_LOGIC;
      m_axi_a_V_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_a_V_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_a_V_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_a_V_WLAST : OUT STD_LOGIC;
      m_axi_a_V_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_a_V_WVALID : OUT STD_LOGIC;
      m_axi_a_V_WREADY : IN STD_LOGIC;
      m_axi_a_V_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_a_V_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_a_V_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_a_V_BVALID : IN STD_LOGIC;
      m_axi_a_V_BREADY : OUT STD_LOGIC;
      m_axi_a_V_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_a_V_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_a_V_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_a_V_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_a_V_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_a_V_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_a_V_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_a_V_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_a_V_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_a_V_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_a_V_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_a_V_ARVALID : OUT STD_LOGIC;
      m_axi_a_V_ARREADY : IN STD_LOGIC;
      m_axi_a_V_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_a_V_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_a_V_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_a_V_RLAST : IN STD_LOGIC;
      m_axi_a_V_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_a_V_RVALID : IN STD_LOGIC;
      m_axi_a_V_RREADY : OUT STD_LOGIC;
      stream0_V_V_TVALID : IN STD_LOGIC;
      stream0_V_V_TREADY : OUT STD_LOGIC;
      stream0_V_V_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      debug_buffer_status : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      debug_bufsel_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      debug_buf0_p : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      debug_inbuffer_pointer : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      debug_dst_var_V : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      fifo_resetn : OUT STD_LOGIC;
      interrupt_r : OUT STD_LOGIC
    );
  END COMPONENT data_mover;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF ZynqDesign_data_mover_0_0_arch: ARCHITECTURE IS "data_mover,Vivado 2017.4";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF ZynqDesign_data_mover_0_0_arch : ARCHITECTURE IS "ZynqDesign_data_mover_0_0,data_mover,{}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF interrupt_r: SIGNAL IS "XIL_INTERFACENAME interrupt_r, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt_r: SIGNAL IS "xilinx.com:signal:data:1.0 interrupt_r DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF fifo_resetn: SIGNAL IS "XIL_INTERFACENAME fifo_resetn, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF fifo_resetn: SIGNAL IS "xilinx.com:signal:data:1.0 fifo_resetn DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF debug_dst_var_V: SIGNAL IS "XIL_INTERFACENAME debug_dst_var_V, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF debug_dst_var_V: SIGNAL IS "xilinx.com:signal:data:1.0 debug_dst_var_V DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF debug_inbuffer_pointer: SIGNAL IS "XIL_INTERFACENAME debug_inbuffer_pointer, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF debug_inbuffer_pointer: SIGNAL IS "xilinx.com:signal:data:1.0 debug_inbuffer_pointer DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF debug_buf0_p: SIGNAL IS "XIL_INTERFACENAME debug_buf0_p, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF debug_buf0_p: SIGNAL IS "xilinx.com:signal:data:1.0 debug_buf0_p DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF debug_bufsel_0: SIGNAL IS "XIL_INTERFACENAME debug_bufsel_0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF debug_bufsel_0: SIGNAL IS "xilinx.com:signal:data:1.0 debug_bufsel_0 DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF debug_buffer_status: SIGNAL IS "XIL_INTERFACENAME debug_buffer_status, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value true}}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF debug_buffer_status: SIGNAL IS "xilinx.com:signal:data:1.0 debug_buffer_status DATA";
  ATTRIBUTE X_INTERFACE_INFO OF stream0_V_V_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 stream0_V_V TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF stream0_V_V_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 stream0_V_V TREADY";
  ATTRIBUTE X_INTERFACE_PARAMETER OF stream0_V_V_TVALID: SIGNAL IS "XIL_INTERFACENAME stream0_V_V, TDATA_NUM_BYTES 8, TUSER_WIDTH 0, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN ZynqDesign_processing_system7_0_0_FCLK_CLK0";
  ATTRIBUTE X_INTERFACE_INFO OF stream0_V_V_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 stream0_V_V TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_a_V_AWADDR: SIGNAL IS "XIL_INTERFACENAME m_axi_a_V, ADDR_WIDTH 32, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, FREQ_HZ 125000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.000, CLK_DOMAIN ZynqDesign_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_a_V_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_a_V AWADDR";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {RST {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_axil:m_axi_a_V:stream0_V_V, ASSOCIATED_RESET ap_rst_n, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN ZynqDesign_processing_system7_0_0_FCLK_CLK0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil AWVALID";
  ATTRIBUTE X_INTERFACE_PARAMETER OF s_axi_axil_AWADDR: SIGNAL IS "XIL_INTERFACENAME s_axi_axil, ADDR_WIDTH 7, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {CLK {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}}}, FREQ_HZ 125000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN ZynqDesign_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_axil_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_axil AWADDR";
BEGIN
  U0 : data_mover
    GENERIC MAP (
      C_S_AXI_AXIL_ADDR_WIDTH => 7,
      C_S_AXI_AXIL_DATA_WIDTH => 32,
      C_M_AXI_A_V_ID_WIDTH => 1,
      C_M_AXI_A_V_ADDR_WIDTH => 32,
      C_M_AXI_A_V_DATA_WIDTH => 32,
      C_M_AXI_A_V_AWUSER_WIDTH => 1,
      C_M_AXI_A_V_ARUSER_WIDTH => 1,
      C_M_AXI_A_V_WUSER_WIDTH => 1,
      C_M_AXI_A_V_RUSER_WIDTH => 1,
      C_M_AXI_A_V_BUSER_WIDTH => 1,
      C_M_AXI_A_V_USER_VALUE => 0,
      C_M_AXI_A_V_PROT_VALUE => 0,
      C_M_AXI_A_V_CACHE_VALUE => 3,
      C_M_AXI_A_V_TARGET_ADDR => 0
    )
    PORT MAP (
      debug_buffer_status_ap_vld => debug_buffer_status_ap_vld,
      debug_bufsel_0_ap_vld => debug_bufsel_0_ap_vld,
      debug_buf0_p_ap_vld => debug_buf0_p_ap_vld,
      debug_inbuffer_pointer_ap_vld => debug_inbuffer_pointer_ap_vld,
      debug_dst_var_V_ap_vld => debug_dst_var_V_ap_vld,
      interrupt_r_ap_vld => interrupt_r_ap_vld,
      s_axi_axil_AWADDR => s_axi_axil_AWADDR,
      s_axi_axil_AWVALID => s_axi_axil_AWVALID,
      s_axi_axil_AWREADY => s_axi_axil_AWREADY,
      s_axi_axil_WDATA => s_axi_axil_WDATA,
      s_axi_axil_WSTRB => s_axi_axil_WSTRB,
      s_axi_axil_WVALID => s_axi_axil_WVALID,
      s_axi_axil_WREADY => s_axi_axil_WREADY,
      s_axi_axil_BRESP => s_axi_axil_BRESP,
      s_axi_axil_BVALID => s_axi_axil_BVALID,
      s_axi_axil_BREADY => s_axi_axil_BREADY,
      s_axi_axil_ARADDR => s_axi_axil_ARADDR,
      s_axi_axil_ARVALID => s_axi_axil_ARVALID,
      s_axi_axil_ARREADY => s_axi_axil_ARREADY,
      s_axi_axil_RDATA => s_axi_axil_RDATA,
      s_axi_axil_RRESP => s_axi_axil_RRESP,
      s_axi_axil_RVALID => s_axi_axil_RVALID,
      s_axi_axil_RREADY => s_axi_axil_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      m_axi_a_V_AWADDR => m_axi_a_V_AWADDR,
      m_axi_a_V_AWLEN => m_axi_a_V_AWLEN,
      m_axi_a_V_AWSIZE => m_axi_a_V_AWSIZE,
      m_axi_a_V_AWBURST => m_axi_a_V_AWBURST,
      m_axi_a_V_AWLOCK => m_axi_a_V_AWLOCK,
      m_axi_a_V_AWREGION => m_axi_a_V_AWREGION,
      m_axi_a_V_AWCACHE => m_axi_a_V_AWCACHE,
      m_axi_a_V_AWPROT => m_axi_a_V_AWPROT,
      m_axi_a_V_AWQOS => m_axi_a_V_AWQOS,
      m_axi_a_V_AWVALID => m_axi_a_V_AWVALID,
      m_axi_a_V_AWREADY => m_axi_a_V_AWREADY,
      m_axi_a_V_WDATA => m_axi_a_V_WDATA,
      m_axi_a_V_WSTRB => m_axi_a_V_WSTRB,
      m_axi_a_V_WLAST => m_axi_a_V_WLAST,
      m_axi_a_V_WVALID => m_axi_a_V_WVALID,
      m_axi_a_V_WREADY => m_axi_a_V_WREADY,
      m_axi_a_V_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_a_V_BRESP => m_axi_a_V_BRESP,
      m_axi_a_V_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_a_V_BVALID => m_axi_a_V_BVALID,
      m_axi_a_V_BREADY => m_axi_a_V_BREADY,
      m_axi_a_V_ARADDR => m_axi_a_V_ARADDR,
      m_axi_a_V_ARLEN => m_axi_a_V_ARLEN,
      m_axi_a_V_ARSIZE => m_axi_a_V_ARSIZE,
      m_axi_a_V_ARBURST => m_axi_a_V_ARBURST,
      m_axi_a_V_ARLOCK => m_axi_a_V_ARLOCK,
      m_axi_a_V_ARREGION => m_axi_a_V_ARREGION,
      m_axi_a_V_ARCACHE => m_axi_a_V_ARCACHE,
      m_axi_a_V_ARPROT => m_axi_a_V_ARPROT,
      m_axi_a_V_ARQOS => m_axi_a_V_ARQOS,
      m_axi_a_V_ARVALID => m_axi_a_V_ARVALID,
      m_axi_a_V_ARREADY => m_axi_a_V_ARREADY,
      m_axi_a_V_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_a_V_RDATA => m_axi_a_V_RDATA,
      m_axi_a_V_RRESP => m_axi_a_V_RRESP,
      m_axi_a_V_RLAST => m_axi_a_V_RLAST,
      m_axi_a_V_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_a_V_RVALID => m_axi_a_V_RVALID,
      m_axi_a_V_RREADY => m_axi_a_V_RREADY,
      stream0_V_V_TVALID => stream0_V_V_TVALID,
      stream0_V_V_TREADY => stream0_V_V_TREADY,
      stream0_V_V_TDATA => stream0_V_V_TDATA,
      debug_buffer_status => debug_buffer_status,
      debug_bufsel_0 => debug_bufsel_0,
      debug_buf0_p => debug_buf0_p,
      debug_inbuffer_pointer => debug_inbuffer_pointer,
      debug_dst_var_V => debug_dst_var_V,
      fifo_resetn => fifo_resetn,
      interrupt_r => interrupt_r
    );
END ZynqDesign_data_mover_0_0_arch;
