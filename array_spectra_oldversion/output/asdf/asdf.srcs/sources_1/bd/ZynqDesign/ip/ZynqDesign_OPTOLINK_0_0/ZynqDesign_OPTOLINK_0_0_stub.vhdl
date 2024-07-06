-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Sat Jul  6 10:50:25 2024
-- Host        : Hraesvelgr running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_OPTOLINK_0_0/ZynqDesign_OPTOLINK_0_0_stub.vhdl
-- Design      : ZynqDesign_OPTOLINK_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z030fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZynqDesign_OPTOLINK_0_0 is
  Port ( 
    s_axi_tx_tdata : in STD_LOGIC_VECTOR ( 0 to 63 );
    s_axi_tx_tvalid : in STD_LOGIC;
    s_axi_tx_tready : out STD_LOGIC;
    m_axi_rx_tdata : out STD_LOGIC_VECTOR ( 0 to 63 );
    m_axi_rx_tvalid : out STD_LOGIC;
    rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    gt_refclk1_p : in STD_LOGIC;
    gt_refclk1_n : in STD_LOGIC;
    gt_refclk1_out : out STD_LOGIC;
    tx_hard_err : out STD_LOGIC;
    tx_soft_err : out STD_LOGIC;
    rx_hard_err : out STD_LOGIC;
    rx_soft_err : out STD_LOGIC;
    tx_channel_up : out STD_LOGIC;
    tx_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    rx_channel_up : out STD_LOGIC;
    rx_lane_up : out STD_LOGIC_VECTOR ( 0 to 0 );
    user_clk_out : out STD_LOGIC;
    mmcm_not_locked_out : out STD_LOGIC;
    reset2fc : out STD_LOGIC;
    reset2fg : out STD_LOGIC;
    sync_clk_out : out STD_LOGIC;
    tx_reset_pb : in STD_LOGIC;
    rx_reset_pb : in STD_LOGIC;
    gt_rxcdrovrden_in : in STD_LOGIC;
    power_down : in STD_LOGIC;
    pma_init : in STD_LOGIC;
    gt_pll_lock : out STD_LOGIC;
    drp_clk_in : in STD_LOGIC;
    init_clk : in STD_LOGIC;
    link_reset_out : out STD_LOGIC;
    gt_rxusrclk_out : out STD_LOGIC;
    gt0_eyescandataerror_out : out STD_LOGIC;
    gt0_eyescanreset_in : in STD_LOGIC;
    gt0_eyescantrigger_in : in STD_LOGIC;
    gt0_rxcdrhold_in : in STD_LOGIC;
    gt0_rxlpmhfovrden_in : in STD_LOGIC;
    gt0_rxdfeagchold_in : in STD_LOGIC;
    gt0_rxdfeagcovrden_in : in STD_LOGIC;
    gt0_rxdfelfhold_in : in STD_LOGIC;
    gt0_rxdfelpmreset_in : in STD_LOGIC;
    gt0_rxlpmlfklovrden_in : in STD_LOGIC;
    gt0_rxmonitorout_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    gt0_rxmonitorsel_in : in STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_rxlpmen_in : in STD_LOGIC;
    gt0_rxpmareset_in : in STD_LOGIC;
    gt0_rxpcsreset_in : in STD_LOGIC;
    gt0_rxbufreset_in : in STD_LOGIC;
    gt0_rxprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_rxprbserr_out : out STD_LOGIC;
    gt0_rxprbscntreset_in : in STD_LOGIC;
    gt0_rxresetdone_out : out STD_LOGIC;
    gt0_rxbufstatus_out : out STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_txpostcursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt0_txdiffctrl_in : in STD_LOGIC_VECTOR ( 3 downto 0 );
    gt0_txmaincursor_in : in STD_LOGIC_VECTOR ( 6 downto 0 );
    gt0_txprecursor_in : in STD_LOGIC_VECTOR ( 4 downto 0 );
    gt0_txpolarity_in : in STD_LOGIC;
    gt0_txinhibit_in : in STD_LOGIC;
    gt0_txpmareset_in : in STD_LOGIC;
    gt0_txpcsreset_in : in STD_LOGIC;
    gt0_txprbssel_in : in STD_LOGIC_VECTOR ( 2 downto 0 );
    gt0_txprbsforceerr_in : in STD_LOGIC;
    gt0_txbufstatus_out : out STD_LOGIC_VECTOR ( 1 downto 0 );
    gt0_txresetdone_out : out STD_LOGIC;
    gt0_dmonitorout_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    gt0_cplllock_out : out STD_LOGIC;
    gt_qplllock : out STD_LOGIC;
    gt_qpllclk_quad1_out : out STD_LOGIC;
    gt_qpllrefclk_quad1_out : out STD_LOGIC;
    tx_sys_reset_out : out STD_LOGIC;
    rx_sys_reset_out : out STD_LOGIC;
    gt_reset_out : out STD_LOGIC;
    tx_out_clk : out STD_LOGIC
  );

end ZynqDesign_OPTOLINK_0_0;

architecture stub of ZynqDesign_OPTOLINK_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_tx_tdata[0:63],s_axi_tx_tvalid,s_axi_tx_tready,m_axi_rx_tdata[0:63],m_axi_rx_tvalid,rxp[0:0],rxn[0:0],txp[0:0],txn[0:0],gt_refclk1_p,gt_refclk1_n,gt_refclk1_out,tx_hard_err,tx_soft_err,rx_hard_err,rx_soft_err,tx_channel_up,tx_lane_up[0:0],rx_channel_up,rx_lane_up[0:0],user_clk_out,mmcm_not_locked_out,reset2fc,reset2fg,sync_clk_out,tx_reset_pb,rx_reset_pb,gt_rxcdrovrden_in,power_down,pma_init,gt_pll_lock,drp_clk_in,init_clk,link_reset_out,gt_rxusrclk_out,gt0_eyescandataerror_out,gt0_eyescanreset_in,gt0_eyescantrigger_in,gt0_rxcdrhold_in,gt0_rxlpmhfovrden_in,gt0_rxdfeagchold_in,gt0_rxdfeagcovrden_in,gt0_rxdfelfhold_in,gt0_rxdfelpmreset_in,gt0_rxlpmlfklovrden_in,gt0_rxmonitorout_out[6:0],gt0_rxmonitorsel_in[1:0],gt0_rxlpmen_in,gt0_rxpmareset_in,gt0_rxpcsreset_in,gt0_rxbufreset_in,gt0_rxprbssel_in[2:0],gt0_rxprbserr_out,gt0_rxprbscntreset_in,gt0_rxresetdone_out,gt0_rxbufstatus_out[2:0],gt0_txpostcursor_in[4:0],gt0_txdiffctrl_in[3:0],gt0_txmaincursor_in[6:0],gt0_txprecursor_in[4:0],gt0_txpolarity_in,gt0_txinhibit_in,gt0_txpmareset_in,gt0_txpcsreset_in,gt0_txprbssel_in[2:0],gt0_txprbsforceerr_in,gt0_txbufstatus_out[1:0],gt0_txresetdone_out,gt0_dmonitorout_out[7:0],gt0_cplllock_out,gt_qplllock,gt_qpllclk_quad1_out,gt_qpllrefclk_quad1_out,tx_sys_reset_out,rx_sys_reset_out,gt_reset_out,tx_out_clk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "aurora_64b66b_v11_2_3, Coregen v14.3_ip3, Number of lanes = 1, Line rate is double6.25Gbps, Reference Clock is double156.25MHz, Interface is Streaming, Flow Control is None and is operating in DUPLEX configuration";
begin
end;
