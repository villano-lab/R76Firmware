-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Mon Jul  8 12:33:13 2024
-- Host        : PHYS-NC3124-D02 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/hellmala/Documents/GitHub/R76Firmware/array_spectra_oldversion/output/asdf2/asdf2.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_ADCSyncModule_0_0/ZynqDesign_ADCSyncModule_0_0_stub.vhdl
-- Design      : ZynqDesign_ADCSyncModule_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z030fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZynqDesign_ADCSyncModule_0_0 is
  Port ( 
    cfg_serdes1_delay : out STD_LOGIC_VECTOR ( 4 downto 0 );
    cfg_serdes1_delay_exc : out STD_LOGIC;
    cfg_pulse_bitsleep : out STD_LOGIC;
    cfg_abselector : out STD_LOGIC;
    cfg_channel_selector : out STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_selected_prw : in STD_LOGIC_VECTOR ( 15 downto 0 );
    serdes_reset : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SMADC_1_CSA : out STD_LOGIC;
    SMADC_1_CSB : out STD_LOGIC;
    SMADC_2_CSA : out STD_LOGIC;
    SMADC_2_CSB : out STD_LOGIC;
    SMADC_3_CSA : out STD_LOGIC;
    SMADC_3_CSB : out STD_LOGIC;
    SMADC_4_CSA : out STD_LOGIC;
    SMADC_4_CSB : out STD_LOGIC;
    SMADC_CLK : out STD_LOGIC;
    SMADC_MOSI : out STD_LOGIC;
    s00_axi_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s00_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_awvalid : in STD_LOGIC;
    s00_axi_awready : out STD_LOGIC;
    s00_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s00_axi_wvalid : in STD_LOGIC;
    s00_axi_wready : out STD_LOGIC;
    s00_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_bvalid : out STD_LOGIC;
    s00_axi_bready : in STD_LOGIC;
    s00_axi_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    s00_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s00_axi_arvalid : in STD_LOGIC;
    s00_axi_arready : out STD_LOGIC;
    s00_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s00_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s00_axi_rvalid : out STD_LOGIC;
    s00_axi_rready : in STD_LOGIC;
    s00_axi_aclk : in STD_LOGIC;
    s00_axi_aresetn : in STD_LOGIC
  );

end ZynqDesign_ADCSyncModule_0_0;

architecture stub of ZynqDesign_ADCSyncModule_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "cfg_serdes1_delay[4:0],cfg_serdes1_delay_exc,cfg_pulse_bitsleep,cfg_abselector,cfg_channel_selector[7:0],cfg_selected_prw[15:0],serdes_reset[7:0],SMADC_1_CSA,SMADC_1_CSB,SMADC_2_CSA,SMADC_2_CSB,SMADC_3_CSA,SMADC_3_CSB,SMADC_4_CSA,SMADC_4_CSB,SMADC_CLK,SMADC_MOSI,s00_axi_awaddr[6:0],s00_axi_awprot[2:0],s00_axi_awvalid,s00_axi_awready,s00_axi_wdata[31:0],s00_axi_wstrb[3:0],s00_axi_wvalid,s00_axi_wready,s00_axi_bresp[1:0],s00_axi_bvalid,s00_axi_bready,s00_axi_araddr[6:0],s00_axi_arprot[2:0],s00_axi_arvalid,s00_axi_arready,s00_axi_rdata[31:0],s00_axi_rresp[1:0],s00_axi_rvalid,s00_axi_rready,s00_axi_aclk,s00_axi_aresetn";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ADCSyncModule_v1_0,Vivado 2017.4";
begin
end;
