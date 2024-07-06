-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Sat Jul  6 13:01:55 2024
-- Host        : Hraesvelgr running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Owner/Documents/GitHub/R76Firmware/array_spectra_oldversion/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_data_mover_0_0/ZynqDesign_data_mover_0_0_stub.vhdl
-- Design      : ZynqDesign_data_mover_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z030fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZynqDesign_data_mover_0_0 is
  Port ( 
    debug_buffer_status_ap_vld : out STD_LOGIC;
    debug_bufsel_0_ap_vld : out STD_LOGIC;
    debug_buf0_p_ap_vld : out STD_LOGIC;
    debug_inbuffer_pointer_ap_vld : out STD_LOGIC;
    debug_dst_var_V_ap_vld : out STD_LOGIC;
    interrupt_r_ap_vld : out STD_LOGIC;
    s_axi_axil_AWADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_axil_AWVALID : in STD_LOGIC;
    s_axi_axil_AWREADY : out STD_LOGIC;
    s_axi_axil_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_axil_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_axil_WVALID : in STD_LOGIC;
    s_axi_axil_WREADY : out STD_LOGIC;
    s_axi_axil_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_axil_BVALID : out STD_LOGIC;
    s_axi_axil_BREADY : in STD_LOGIC;
    s_axi_axil_ARADDR : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s_axi_axil_ARVALID : in STD_LOGIC;
    s_axi_axil_ARREADY : out STD_LOGIC;
    s_axi_axil_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_axil_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_axil_RVALID : out STD_LOGIC;
    s_axi_axil_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    m_axi_a_V_AWADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_a_V_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_a_V_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_a_V_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_a_V_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_a_V_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_a_V_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_a_V_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_a_V_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_a_V_AWVALID : out STD_LOGIC;
    m_axi_a_V_AWREADY : in STD_LOGIC;
    m_axi_a_V_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_a_V_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_a_V_WLAST : out STD_LOGIC;
    m_axi_a_V_WVALID : out STD_LOGIC;
    m_axi_a_V_WREADY : in STD_LOGIC;
    m_axi_a_V_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_a_V_BVALID : in STD_LOGIC;
    m_axi_a_V_BREADY : out STD_LOGIC;
    m_axi_a_V_ARADDR : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_a_V_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_a_V_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_a_V_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_a_V_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_a_V_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_a_V_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_a_V_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_a_V_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_a_V_ARVALID : out STD_LOGIC;
    m_axi_a_V_ARREADY : in STD_LOGIC;
    m_axi_a_V_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_a_V_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_a_V_RLAST : in STD_LOGIC;
    m_axi_a_V_RVALID : in STD_LOGIC;
    m_axi_a_V_RREADY : out STD_LOGIC;
    stream0_V_V_TVALID : in STD_LOGIC;
    stream0_V_V_TREADY : out STD_LOGIC;
    stream0_V_V_TDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    debug_buffer_status : out STD_LOGIC_VECTOR ( 31 downto 0 );
    debug_bufsel_0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    debug_buf0_p : out STD_LOGIC_VECTOR ( 31 downto 0 );
    debug_inbuffer_pointer : out STD_LOGIC_VECTOR ( 31 downto 0 );
    debug_dst_var_V : out STD_LOGIC_VECTOR ( 63 downto 0 );
    interrupt_r : out STD_LOGIC
  );

end ZynqDesign_data_mover_0_0;

architecture stub of ZynqDesign_data_mover_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "debug_buffer_status_ap_vld,debug_bufsel_0_ap_vld,debug_buf0_p_ap_vld,debug_inbuffer_pointer_ap_vld,debug_dst_var_V_ap_vld,interrupt_r_ap_vld,s_axi_axil_AWADDR[6:0],s_axi_axil_AWVALID,s_axi_axil_AWREADY,s_axi_axil_WDATA[31:0],s_axi_axil_WSTRB[3:0],s_axi_axil_WVALID,s_axi_axil_WREADY,s_axi_axil_BRESP[1:0],s_axi_axil_BVALID,s_axi_axil_BREADY,s_axi_axil_ARADDR[6:0],s_axi_axil_ARVALID,s_axi_axil_ARREADY,s_axi_axil_RDATA[31:0],s_axi_axil_RRESP[1:0],s_axi_axil_RVALID,s_axi_axil_RREADY,ap_clk,ap_rst_n,m_axi_a_V_AWADDR[31:0],m_axi_a_V_AWLEN[7:0],m_axi_a_V_AWSIZE[2:0],m_axi_a_V_AWBURST[1:0],m_axi_a_V_AWLOCK[1:0],m_axi_a_V_AWREGION[3:0],m_axi_a_V_AWCACHE[3:0],m_axi_a_V_AWPROT[2:0],m_axi_a_V_AWQOS[3:0],m_axi_a_V_AWVALID,m_axi_a_V_AWREADY,m_axi_a_V_WDATA[31:0],m_axi_a_V_WSTRB[3:0],m_axi_a_V_WLAST,m_axi_a_V_WVALID,m_axi_a_V_WREADY,m_axi_a_V_BRESP[1:0],m_axi_a_V_BVALID,m_axi_a_V_BREADY,m_axi_a_V_ARADDR[31:0],m_axi_a_V_ARLEN[7:0],m_axi_a_V_ARSIZE[2:0],m_axi_a_V_ARBURST[1:0],m_axi_a_V_ARLOCK[1:0],m_axi_a_V_ARREGION[3:0],m_axi_a_V_ARCACHE[3:0],m_axi_a_V_ARPROT[2:0],m_axi_a_V_ARQOS[3:0],m_axi_a_V_ARVALID,m_axi_a_V_ARREADY,m_axi_a_V_RDATA[31:0],m_axi_a_V_RRESP[1:0],m_axi_a_V_RLAST,m_axi_a_V_RVALID,m_axi_a_V_RREADY,stream0_V_V_TVALID,stream0_V_V_TREADY,stream0_V_V_TDATA[63:0],debug_buffer_status[31:0],debug_bufsel_0[31:0],debug_buf0_p[31:0],debug_inbuffer_pointer[31:0],debug_dst_var_V[63:0],interrupt_r";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "data_mover,Vivado 2017.4";
begin
end;
