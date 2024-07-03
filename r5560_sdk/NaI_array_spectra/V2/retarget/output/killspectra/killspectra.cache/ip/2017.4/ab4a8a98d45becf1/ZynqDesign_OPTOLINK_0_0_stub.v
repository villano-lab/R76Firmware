// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Jul  3 12:49:07 2024
// Host        : Hraesvelgr running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ZynqDesign_OPTOLINK_0_0_stub.v
// Design      : ZynqDesign_OPTOLINK_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z030fbg676-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "aurora_64b66b_v11_2_3, Coregen v14.3_ip3, Number of lanes = 1, Line rate is double6.25Gbps, Reference Clock is double156.25MHz, Interface is Streaming, Flow Control is None and is operating in DUPLEX configuration" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_tx_tdata, s_axi_tx_tvalid, 
  s_axi_tx_tready, m_axi_rx_tdata, m_axi_rx_tvalid, rxp, rxn, txp, txn, gt_refclk1_p, gt_refclk1_n, 
  gt_refclk1_out, tx_hard_err, tx_soft_err, rx_hard_err, rx_soft_err, tx_channel_up, 
  tx_lane_up, rx_channel_up, rx_lane_up, user_clk_out, mmcm_not_locked_out, reset2fc, reset2fg, 
  sync_clk_out, tx_reset_pb, rx_reset_pb, gt_rxcdrovrden_in, power_down, pma_init, gt_pll_lock, 
  drp_clk_in, init_clk, link_reset_out, gt_rxusrclk_out, gt0_eyescandataerror_out, 
  gt0_eyescanreset_in, gt0_eyescantrigger_in, gt0_rxcdrhold_in, gt0_rxlpmhfovrden_in, 
  gt0_rxdfeagchold_in, gt0_rxdfeagcovrden_in, gt0_rxdfelfhold_in, gt0_rxdfelpmreset_in, 
  gt0_rxlpmlfklovrden_in, gt0_rxmonitorout_out, gt0_rxmonitorsel_in, gt0_rxlpmen_in, 
  gt0_rxpmareset_in, gt0_rxpcsreset_in, gt0_rxbufreset_in, gt0_rxprbssel_in, 
  gt0_rxprbserr_out, gt0_rxprbscntreset_in, gt0_rxresetdone_out, gt0_rxbufstatus_out, 
  gt0_txpostcursor_in, gt0_txdiffctrl_in, gt0_txmaincursor_in, gt0_txprecursor_in, 
  gt0_txpolarity_in, gt0_txinhibit_in, gt0_txpmareset_in, gt0_txpcsreset_in, 
  gt0_txprbssel_in, gt0_txprbsforceerr_in, gt0_txbufstatus_out, gt0_txresetdone_out, 
  gt0_dmonitorout_out, gt0_cplllock_out, gt_qplllock, gt_qpllclk_quad1_out, 
  gt_qpllrefclk_quad1_out, tx_sys_reset_out, rx_sys_reset_out, gt_reset_out, tx_out_clk)
/* synthesis syn_black_box black_box_pad_pin="s_axi_tx_tdata[0:63],s_axi_tx_tvalid,s_axi_tx_tready,m_axi_rx_tdata[0:63],m_axi_rx_tvalid,rxp[0:0],rxn[0:0],txp[0:0],txn[0:0],gt_refclk1_p,gt_refclk1_n,gt_refclk1_out,tx_hard_err,tx_soft_err,rx_hard_err,rx_soft_err,tx_channel_up,tx_lane_up[0:0],rx_channel_up,rx_lane_up[0:0],user_clk_out,mmcm_not_locked_out,reset2fc,reset2fg,sync_clk_out,tx_reset_pb,rx_reset_pb,gt_rxcdrovrden_in,power_down,pma_init,gt_pll_lock,drp_clk_in,init_clk,link_reset_out,gt_rxusrclk_out,gt0_eyescandataerror_out,gt0_eyescanreset_in,gt0_eyescantrigger_in,gt0_rxcdrhold_in,gt0_rxlpmhfovrden_in,gt0_rxdfeagchold_in,gt0_rxdfeagcovrden_in,gt0_rxdfelfhold_in,gt0_rxdfelpmreset_in,gt0_rxlpmlfklovrden_in,gt0_rxmonitorout_out[6:0],gt0_rxmonitorsel_in[1:0],gt0_rxlpmen_in,gt0_rxpmareset_in,gt0_rxpcsreset_in,gt0_rxbufreset_in,gt0_rxprbssel_in[2:0],gt0_rxprbserr_out,gt0_rxprbscntreset_in,gt0_rxresetdone_out,gt0_rxbufstatus_out[2:0],gt0_txpostcursor_in[4:0],gt0_txdiffctrl_in[3:0],gt0_txmaincursor_in[6:0],gt0_txprecursor_in[4:0],gt0_txpolarity_in,gt0_txinhibit_in,gt0_txpmareset_in,gt0_txpcsreset_in,gt0_txprbssel_in[2:0],gt0_txprbsforceerr_in,gt0_txbufstatus_out[1:0],gt0_txresetdone_out,gt0_dmonitorout_out[7:0],gt0_cplllock_out,gt_qplllock,gt_qpllclk_quad1_out,gt_qpllrefclk_quad1_out,tx_sys_reset_out,rx_sys_reset_out,gt_reset_out,tx_out_clk" */;
  input [0:63]s_axi_tx_tdata;
  input s_axi_tx_tvalid;
  output s_axi_tx_tready;
  output [0:63]m_axi_rx_tdata;
  output m_axi_rx_tvalid;
  input [0:0]rxp;
  input [0:0]rxn;
  output [0:0]txp;
  output [0:0]txn;
  input gt_refclk1_p;
  input gt_refclk1_n;
  output gt_refclk1_out;
  output tx_hard_err;
  output tx_soft_err;
  output rx_hard_err;
  output rx_soft_err;
  output tx_channel_up;
  output [0:0]tx_lane_up;
  output rx_channel_up;
  output [0:0]rx_lane_up;
  output user_clk_out;
  output mmcm_not_locked_out;
  output reset2fc;
  output reset2fg;
  output sync_clk_out;
  input tx_reset_pb;
  input rx_reset_pb;
  input gt_rxcdrovrden_in;
  input power_down;
  input pma_init;
  output gt_pll_lock;
  input drp_clk_in;
  input init_clk;
  output link_reset_out;
  output gt_rxusrclk_out;
  output gt0_eyescandataerror_out;
  input gt0_eyescanreset_in;
  input gt0_eyescantrigger_in;
  input gt0_rxcdrhold_in;
  input gt0_rxlpmhfovrden_in;
  input gt0_rxdfeagchold_in;
  input gt0_rxdfeagcovrden_in;
  input gt0_rxdfelfhold_in;
  input gt0_rxdfelpmreset_in;
  input gt0_rxlpmlfklovrden_in;
  output [6:0]gt0_rxmonitorout_out;
  input [1:0]gt0_rxmonitorsel_in;
  input gt0_rxlpmen_in;
  input gt0_rxpmareset_in;
  input gt0_rxpcsreset_in;
  input gt0_rxbufreset_in;
  input [2:0]gt0_rxprbssel_in;
  output gt0_rxprbserr_out;
  input gt0_rxprbscntreset_in;
  output gt0_rxresetdone_out;
  output [2:0]gt0_rxbufstatus_out;
  input [4:0]gt0_txpostcursor_in;
  input [3:0]gt0_txdiffctrl_in;
  input [6:0]gt0_txmaincursor_in;
  input [4:0]gt0_txprecursor_in;
  input gt0_txpolarity_in;
  input gt0_txinhibit_in;
  input gt0_txpmareset_in;
  input gt0_txpcsreset_in;
  input [2:0]gt0_txprbssel_in;
  input gt0_txprbsforceerr_in;
  output [1:0]gt0_txbufstatus_out;
  output gt0_txresetdone_out;
  output [7:0]gt0_dmonitorout_out;
  output gt0_cplllock_out;
  output gt_qplllock;
  output gt_qpllclk_quad1_out;
  output gt_qpllrefclk_quad1_out;
  output tx_sys_reset_out;
  output rx_sys_reset_out;
  output gt_reset_out;
  output tx_out_clk;
endmodule
