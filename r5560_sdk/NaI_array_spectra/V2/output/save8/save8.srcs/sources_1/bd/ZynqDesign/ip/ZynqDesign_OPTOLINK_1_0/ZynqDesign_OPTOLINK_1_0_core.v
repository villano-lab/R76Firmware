 ///////////////////////////////////////////////////////////////////////////////
 //
 // Project:  Aurora 64B/66B 
 // Company:  Xilinx
 //
 //
 //
 // (c) Copyright 2008 - 2009 Xilinx, Inc. All rights reserved.
 //
 // This file contains confidential and proprietary information
 // of Xilinx, Inc. and is protected under U.S. and
 // international copyright and other intellectual property
 // laws.
 //
 // DISCLAIMER
 // This disclaimer is not a license and does not grant any
 // rights to the materials distributed herewith. Except as
 // otherwise provided in a valid license issued to you by
 // Xilinx, and to the maximum extent permitted by applicable
 // law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
 // WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
 // AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
 // BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
 // INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
 // (2) Xilinx shall not be liable (whether in contract or tort,
 // including negligence, or under any other theory of
 // liability) for any loss or damage of any kind or nature
 // related to, arising under or in connection with these
 // materials, including for any direct, or any indirect,
 // special, incidental, or consequential loss or damage
 // (including loss of data, profits, goodwill, or any type of
 // loss or damage suffered as a result of any action brought
 // by a third party) even if such damage or loss was
 // reasonably foreseeable or Xilinx had been advised of the
 // possibility of the same.
 //
 // CRITICAL APPLICATIONS
 // Xilinx products are not designed or intended to be fail-
 // safe, or for use in any application requiring fail-safe
 // performance, such as life-support or safety devices or
 // systems, Class III medical devices, nuclear facilities,
 // applications related to the deployment of airbags, or any
 // other applications that could lead to death, personal
 // injury, or severe property or environmental damage
 // (individually and collectively, "Critical
 // Applications"). Customer assumes the sole risk and
 // liability of any use of Xilinx products in Critical
 // Applications, subject only to applicable laws and
 // regulations governing limitations on product liability.
 //
 // THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
 // PART OF THIS FILE AT ALL TIMES.
 
 //
 ///////////////////////////////////////////////////////////////////////////////
 //
 //ZynqDesign_OPTOLINK_1_0
 //
 //
 //
 //  Description: This is the top level interface module 
 //               aurora_top_simplex_64b66b
 //
 ///////////////////////////////////////////////////////////////////////////////
 
 `timescale 1 ns / 10 ps
 
   (* core_generation_info = "ZynqDesign_OPTOLINK_1_0,aurora_64b66b_v11_2_3,{c_aurora_lanes=1,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=X,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=X,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=6.25,c_gt_type=gtx,c_qpll=false,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=156.25,c_simplex=true,c_simplex_mode=BOTH,c_stream=true,c_ufc=false,c_user_k=false,flow_mode=None,interface_mode=Streaming,dataflow_config=TX/RX_Simplex}" *) 
(* DowngradeIPIdentifiedWarnings="yes" *) 
 module ZynqDesign_OPTOLINK_1_0_core #
 (
      parameter     STABLE_CLOCK_PERIOD = 8,           //Period of the stable clock driving this state-machine, unit is [ns]
      parameter   SIM_GTXRESET_SPEEDUP=   "TRUE",      // Set to 1 to speed up sim reset
     parameter   PERIODIC_CB_COUNT =   20'd163839,       // CB SEQ COUNT
 
// Its highly RECOMMENDED that the PERIODIC_CB_COUNT value be NOT changed. 
// The minimum value is set when the C_EXAMPLE_SIMULATION user parameter is enabled.
// The maximum value is set when the C_EXAMPLE_SIMULATION user parameter is disabled.
// Its RECOMMENDED that the value (163839) be not changed.
      parameter   SIMPLEX_TIMER_VALUE = 12,    // Sets simplex channel init counter    
 
      parameter CC_FREQ_FACTOR = 5'd24, // Its highly RECOMMENDED that this value be NOT changed.
                                        // Changing it to a value greater than 24 may result in soft errors.  
                                        // User may reduce to a value lower than 24 if channel needs to be 
                                        // established in noisy environment
                                        // Min value is 4.  
                                        // The current GAP in between two consecutive DO_CC posedge events is 4992 user_clk cycles. 
 
     parameter   EXAMPLE_SIMULATION =   0       // RXCDR lock time
      //pragma translate_off
        | 1
      //pragma translate_on
 )
 (
     // AXI TX Interface
     s_axi_tx_tdata,
     s_axi_tx_tvalid,
     s_axi_tx_tready,
 
     // AXI RX Interface
     m_axi_rx_tdata,
     m_axi_rx_tvalid,
 
 
 
 
     // GTX Serial I/O
     rxp,
     rxn,
     txp,
     txn,
 
    // GTX Reference Clock Interface
     gt_refclk1,
                                                                                 
     // Status Interface
     tx_hard_err,
     tx_soft_err,
     tx_channel_up,
     tx_lane_up,
     // Status Interface
     rx_hard_err,
     rx_soft_err,
     rx_channel_up,
     rx_lane_up,
 
     // System Interface
mmcm_not_locked,
     user_clk,
     reset2fc,
     sync_clk,
     reset2fg,
     tx_sysreset_to_core,
     rx_sysreset_to_core,
     gt_rxcdrovrden_in,
     power_down,
     pma_init,

// AURORA TOP simplex file in 7 series port instance

    gt_qpllclk_quad1_in,
    gt_qpllrefclk_quad1_in,

     drp_clk_in,
    //---------------------- GT DRP Ports ----------------------
       drpaddr_in,
       drpdi_in,
       drpdo_out, 
       drprdy_out, 
       drpen_in, 
       drpwe_in, 
 
     init_clk,
     link_reset_out,
   gt_rxusrclk_out,
       //------------------------ RX Margin Analysis Ports ------------------------
       gt0_eyescandataerror_out,
       gt0_eyescanreset_in,
       gt0_eyescantrigger_in,
       //------------------- Receive Ports - RX Equalizer Ports -------------------
       gt0_rxcdrhold_in,
       gt0_rxlpmhfovrden_in,
       gt0_rxdfeagchold_in,
       gt0_rxdfeagcovrden_in,
       gt0_rxdfelfhold_in,
       gt0_rxdfelpmreset_in,
       gt0_rxlpmlfklovrden_in,
       gt0_rxmonitorout_out,
       gt0_rxmonitorsel_in,
       gt0_rxlpmen_in,
       gt0_rxpmareset_in,
       gt0_rxpcsreset_in,
       gt0_rxbufreset_in,
       gt0_rxprbssel_in,    
       gt0_rxprbserr_out, 
       gt0_rxprbscntreset_in,
       gt0_rx_resetdone,
       gt0_rxbufstatus_out, 
       //---------------------- TX Configurable Driver Ports ----------------------
       gt0_txpostcursor_in,
       gt0_txdiffctrl_in,
       gt0_txmaincursor_in,
       gt0_txprecursor_in,
       //--------------- Transmit Ports - TX Polarity Control Ports ---------------
       gt0_txpolarity_in,
       gt0_txinhibit_in,
       gt0_txpmareset_in,
       gt0_txpcsreset_in,
       gt0_txprbssel_in, 
       gt0_txprbsforceerr_in,
       gt0_txbufstatus_out,
       gt0_tx_resetdone,
       gt0_dmonitorout_out,
       gt0_cplllock_out,




     gt_pll_lock,
     tx_sys_reset_out,
     rx_sys_reset_out,
     tx_out_clk
 );
 
 `define DLY #1
 localparam INTER_CB_GAP = 5'd15;
 localparam SEQ_COUNT = 4;
 localparam BACKWARD_COMP_MODE1 = 1'b0; //disable check for interCB gap
 localparam BACKWARD_COMP_MODE2 = 1'b0; //reduce RXCDR lock time, Block Sync SH max count, disable CDR FSM in wrapper
 localparam BACKWARD_COMP_MODE3 = 1'b0; //clear hot-plug counter with any valid btf detected

 
 //***********************************Port Declarations*******************************
 
     // TX AXI Interface 
       input  [0:63]     s_axi_tx_tdata; 
       input             s_axi_tx_tvalid; 
       output            s_axi_tx_tready; 
   
     // RX AXI Interface 
       output [0:63]     m_axi_rx_tdata; 
       output             m_axi_rx_tvalid; 
 
 
 
     // GTX Serial I/O
       input             rxp; 
       input             rxn; 
       output             txp; 
       output             txn; 
     // GTX Reference Clock Interface
       input              gt_refclk1; 
 
     // Status Interface
       output            tx_hard_err; 
       output            tx_soft_err; 
       output             tx_channel_up; 
       output             tx_lane_up; 
     // Status Interface
       output            rx_hard_err; 
       output            rx_soft_err; 
       output             rx_channel_up; 
       output             rx_lane_up; 
 
     // System Interface
       input               mmcm_not_locked; 
       input               user_clk; 
       output              reset2fc; 
       input               sync_clk; 
       output              reset2fg; 
       input               tx_sysreset_to_core; 
       input               rx_sysreset_to_core; 
       input               gt_rxcdrovrden_in; 
       input               power_down; 
       input               pma_init; 
       output              tx_sys_reset_out; 
       output              rx_sys_reset_out; 
//---{

    input                     gt_qpllclk_quad1_in;
    input                     gt_qpllrefclk_quad1_in;

//---}
       input    drp_clk_in;
    //---------------------- GT DRP Ports ----------------------
       input   [8:0]   drpaddr_in;
       input   [15:0]  drpdi_in;
       output  [15:0]  drpdo_out; 
       output          drprdy_out; 
       input           drpen_in; 
       input           drpwe_in; 
       output              gt_pll_lock; 




       output              tx_out_clk;
       output gt_rxusrclk_out;
       //------------------------ RX Margin Analysis Ports ------------------------
       output          gt0_eyescandataerror_out;
       input           gt0_eyescanreset_in;
       input           gt0_eyescantrigger_in;
       //------------------- Receive Ports - RX Equalizer Ports -------------------
       input           gt0_rxcdrhold_in;
       input           gt0_rxlpmhfovrden_in;
       input           gt0_rxdfeagchold_in;
       input           gt0_rxdfeagcovrden_in;
       input           gt0_rxdfelfhold_in;
       input           gt0_rxdfelpmreset_in;
       input           gt0_rxlpmlfklovrden_in;
       output [6:0]    gt0_rxmonitorout_out;
       input  [1:0]    gt0_rxmonitorsel_in;
       input           gt0_rxlpmen_in;
       input           gt0_rxpmareset_in;
       input           gt0_rxpcsreset_in;
       input           gt0_rxbufreset_in;
       input  [2:0]    gt0_rxprbssel_in;    
       input           gt0_rxprbscntreset_in;
       output          gt0_rxprbserr_out;
       output          gt0_rx_resetdone;
       output [2:0]    gt0_rxbufstatus_out;
       //---------------------- TX Configurable Driver Ports ----------------------
       input  [4:0]    gt0_txpostcursor_in;
       input  [3:0]    gt0_txdiffctrl_in;
       input  [6:0]    gt0_txmaincursor_in;
       input  [4:0]    gt0_txprecursor_in;
       //--------------- Transmit Ports - TX Polarity Control Ports ---------------
       input           gt0_txpolarity_in;
       input           gt0_txinhibit_in;
       input           gt0_txpmareset_in;
       input           gt0_txpcsreset_in;
       input  [2:0]    gt0_txprbssel_in; 
       input           gt0_txprbsforceerr_in;
       output [1:0]    gt0_txbufstatus_out;
       output          gt0_tx_resetdone;
       output  [7:0]   gt0_dmonitorout_out;
       output          gt0_cplllock_out;





       input              init_clk; 
       output             link_reset_out; 
 
 //*********************************Wire Declarations**********************************
 
       wire                drp_clk;
       wire                rst_drp;
       wire    [0:63]     tx_d_i2; 
       wire               tx_src_rdy_n_i2; 
       wire               tx_dst_rdy_n_i2; 
       wire    [0:2]      tx_rem_i2; 
       wire    [0:2]      tx_rem_i3; 
       wire               tx_sof_n_i2; 
       wire               tx_eof_n_i2; 
       wire    [0:63]     rx_d_i2; 
       wire               rx_src_rdy_n_i2; 
       wire    [0:2]      rx_rem_i2; 
       wire    [0:2]      rx_rem_i3; 
       wire               rx_sof_n_i2; 
       wire               rx_eof_n_i2;
 
       wire    [0:63]     tx_d_i; 
       wire               tx_src_rdy_n_i; 
       wire               tx_dst_rdy_n_i; 
 
       wire    [0:63]     rx_d_i; 
       wire               rx_src_rdy_n_i; 
 
 
 
 
       wire                system_reset_c; 
       wire               gt_pll_lock_i; 
       wire               gt_pll_lock_ii; 
       wire               raw_tx_out_clk_i; 
       wire    [0:63]     tx_data_i; 
       wire    [0:63]     tx_pe_data_i; 
       wire               tx_pe_data_v_i; 
       wire               tx_channel_up_i; 
       wire               tx_buf_err_i; 
       wire               tx_header_1_i; 
       wire               tx_header_0_i; 
       wire               tx_ena_comma_align_i; 
       wire               tx_reset_i; 
       wire               tx_hard_err_i; 
       wire               tx_soft_err_i; 
       wire               tx_lane_up_i; 
       wire               gen_na_idles_i; 
       wire               ch_bond_done_i; 
       wire               rx_channel_up_i; 
       wire    [0:63]     rx_pe_data_i; 
       wire               rx_pe_data_v_i; 
       wire    [0:63]     rx_data_i; 
       wire               rx_lossofsync_i; 
       wire               check_polarity_i; 
       wire               rx_neg_i; 
       wire               rx_polarity_i; 
       wire               rx_hard_err_i; 
       wire               rx_soft_err_i; 
       wire               rx_lane_up_i; 
       wire               rx_buf_err_i; 
       wire               rx_header_1_i; 
       wire               rx_header_0_i; 
       wire               rx_reset_i; 
       wire               reset_lanes_tx; 
       wire               reset_lanes_rx; 
       wire               en_chan_sync_rx; 
       wire               chan_bond_reset_i; 
 
 
 
       wire               gen_ch_bond_i; 
       wire               gen_cc_i; 
       wire               got_na_idles_i; 
       wire               got_idles_i; 
       wire               got_cc_i; 
       wire               rxdatavalid_to_ll_i; 
       wire               remote_ready_i; 
       wire               got_cb_i; 
 
 
 
     
     //Datavalid signal is routed to Local Link
       wire               rxdatavalid_i; 
       wire               rxdatavalid_to_lanes_i; 
       wire               txdatavalid_i; 
       wire               txdatavalid_symgen_i;
       wire               periodic_cb_to_ll; 
       wire               periodic_cb_seq; 
       wire               gen_periodic_cb_i; 
       wire               txclk_locked_c; 
 
       wire               drp_clk_i;
       wire    [8:0] drpaddr_in_i;
       wire    [15:0]     drpdi_in_i;
       wire    [15:0]     drpdo_out_i; 
       wire               drprdy_out_i; 
       wire               drpen_in_i; 
       wire               drpwe_in_i; 
       wire               tx_fsm_resetdone; 
       wire               rx_fsm_resetdone; 
       wire               link_reset_i; 
       wire               mmcm_not_locked_i; 

       wire               do_cc_i;
 
       reg                tx_soft_err; 
       reg                rx_soft_err; 
       wire               tx_reset; 
       wire               rx_reset;
 
       wire    RESET2FC_i;
       reg                RESET2FC_r; 
 
      wire tx_sysreset_to_core_sync;
      wire rx_sysreset_to_core_sync;
      wire             pma_init_sync; 

       wire [0:0] in_polarity_i; 
       wire [0:0] hld_polarity_i; 
       wire [0:0] polarity_val_i; 
 

 //*********************************Main Body of Code**********************************
 
      assign tx_reset = tx_sys_reset_out;
      assign rx_reset = rx_sys_reset_out;

     // Connect top level logic
     assign          tx_channel_up  = tx_channel_up_i;
    
     always @(posedge user_clk)
       if(tx_reset)
               tx_soft_err  <= `DLY 1'b0;
       else  
               tx_soft_err  <= `DLY (|tx_soft_err_i) & tx_channel_up_i;
 
     assign          rx_channel_up  = rx_channel_up_i;
 
     always @(posedge user_clk)
       if(rx_reset)
               rx_soft_err  <= `DLY 1'b0;
       else
               rx_soft_err  <= `DLY (|rx_soft_err_i) & rx_channel_up_i;
 
     assign          txclk_locked_c = !mmcm_not_locked ;
 
 
     // Connect the TXOUTCLK of lane 0 to TX_OUT_CLK
 
       assign  tx_out_clk  =   raw_tx_out_clk_i; 
 
       assign  gt_pll_lock =   gt_pll_lock_i;
 
     assign  rxdatavalid_to_lanes_i = |rxdatavalid_i;

    ZynqDesign_OPTOLINK_1_0_rst_sync #
    (
        .c_mtbf_stages (5)
    )tx_reset_pb_sync
    (
        .prmry_in     (tx_sysreset_to_core),
        .scndry_aclk  (user_clk),
        .scndry_out   (tx_sysreset_to_core_sync)
    );

    ZynqDesign_OPTOLINK_1_0_rst_sync #
    (
        .c_mtbf_stages (5)
    )rx_reset_pb_sync
    (
        .prmry_in     (rx_sysreset_to_core),
        .scndry_aclk  (user_clk),
        .scndry_out   (rx_sysreset_to_core_sync)
    );


    ZynqDesign_OPTOLINK_1_0_rst_sync #
    (
        .c_mtbf_stages (5)
    )gt_reset_sync
    (
        .prmry_in     (pma_init),
        .scndry_aclk  (init_clk),
        .scndry_out   (pma_init_sync)
    );

    // RESET_LOGIC instance
    ZynqDesign_OPTOLINK_1_0_RESET_LOGIC core_reset_logic_i
    (
        .TX_RESET(tx_sysreset_to_core_sync),
        .RX_RESET(rx_sysreset_to_core_sync),
        .USER_CLK(user_clk),
        .INIT_CLK(init_clk),
	.TX_FSM_RESETDONE(tx_fsm_resetdone),
	.RX_FSM_RESETDONE(rx_fsm_resetdone),
	.POWER_DOWN(power_down),
        .LINK_RESET_IN(link_reset_i),
        .TX_SYSTEM_RESET(tx_sys_reset_out),
        .RX_SYSTEM_RESET(rx_sys_reset_out)
    );

   assign link_reset_out   =  link_reset_i;
 
     //_________________________Instantiate Lane 0______________________________
       assign         tx_lane_up =   tx_lane_up_i; 
 
       assign         rx_lane_up =   rx_lane_up_i; 
 
ZynqDesign_OPTOLINK_1_0_SIMPLEX_TX_AURORA_LANE # 
(
  .EXAMPLE_SIMULATION(EXAMPLE_SIMULATION)    
)
simplex_tx_aurora_lane_0_i
     (
         // TX STREAM
         .TX_PE_DATA(tx_pe_data_i[0:63]),
         .TX_PE_DATA_V(tx_pe_data_v_i), 
 
 
 
 
         .TX_CHANNEL_UP(tx_channel_up_i),
         .GEN_CC(gen_cc_i), 
         .GEN_PERIODIC_CB(gen_periodic_cb_i),
 
         // GTX Interface
         .TX_BUF_ERR(|tx_buf_err_i),
         .TX_HEADER_1(tx_header_1_i), 
         .TX_HEADER_0(tx_header_0_i), 
         .TX_DATA(tx_data_i[0:63]),
         .TX_RESET(tx_reset_i), 
         .TX_RESETDONE_IN(tx_fsm_resetdone),
         
         // Comma Detect Phase Align Interface
         .TX_ENA_COMMA_ALIGN(tx_ena_comma_align_i), 
 
         // Global Logic Interface
         .GEN_NA_IDLE(gen_na_idles_i),
         .GEN_CH_BOND(gen_ch_bond_i), 
         .TX_LANE_UP(tx_lane_up_i), 
         .TX_HARD_ERR(tx_hard_err_i), 
         .TX_SOFT_ERR(tx_soft_err_i), 
 
         // System Interface
         .USER_CLK(user_clk),
         .SYNC_CLK(sync_clk),
         .RESET_LANES(reset_lanes_tx),
         .TXDATAVALID_SYMGEN_IN(txdatavalid_symgen_i),
         .RESET(tx_reset)
     );
 
 
ZynqDesign_OPTOLINK_1_0_SIMPLEX_RX_AURORA_LANE simplex_rx_aurora_lane_0_i
     (
 
    //----------------- Receive Ports - Polarity Determination Ports ----------
         .IN_POLARITY   (in_polarity_i[0]),          
         .HLD_POLARITY  (hld_polarity_i[0]),           
         .POLARITY_VAL  (polarity_val_i[0]),         
         // RX STREAM
         .RX_PE_DATA(rx_pe_data_i[0:63]),
         .RX_PE_DATA_V(rx_pe_data_v_i), 
 
         .RX_CHANNEL_UP(rx_channel_up_i),
 
 
 
 
 
         // GTX Interface
         .RX_DATA(rx_data_i[0:63]),
         .RX_HEADER_1(rx_header_1_i), 
         .RX_HEADER_0(rx_header_0_i), 
         .RX_BUF_ERR(|rx_buf_err_i),
         .CHECK_POLARITY(check_polarity_i), 
         .RX_NEG(rx_neg_i), 
         .RX_POLARITY(rx_polarity_i), 
         .RX_RESET(rx_reset_i), 
         .RX_LOSSOFSYNC(rx_lossofsync_i), 
         
         // Global Logic Interface
         .RX_LANE_UP(rx_lane_up_i), 
         .RX_HARD_ERR(rx_hard_err_i), 
         .RX_SOFT_ERR(rx_soft_err_i), 
         .GOT_NA_IDLE(got_na_idles_i), 
         .GOT_CC(got_cc_i), 
         .REMOTE_READY(remote_ready_i), 
         .GOT_CB(got_cb_i), 
         .GOT_IDLE(got_idles_i), 

         // System Interface
         .USER_CLK(user_clk),
         .RESET_LANES(reset_lanes_rx),
         .RXDATAVALID_IN(rxdatavalid_to_lanes_i),
         .RESET2FC(RESET2FC_i),
         .RESET(rx_reset)
     );
 
 
 
     //_________________________Instantiate GTX Wrapper ______________________________
 
ZynqDesign_OPTOLINK_1_0_WRAPPER  #
     (
         .INTER_CB_GAP(INTER_CB_GAP),
         .BACKWARD_COMP_MODE1(BACKWARD_COMP_MODE1),
         .BACKWARD_COMP_MODE2(BACKWARD_COMP_MODE2),
         .BACKWARD_COMP_MODE3(BACKWARD_COMP_MODE3),
        .STABLE_CLOCK_PERIOD      (STABLE_CLOCK_PERIOD),           // Period of the stable clock driving this state-machine, unit is [ns]
        .SIM_GTXRESET_SPEEDUP                   (SIM_GTXRESET_SPEEDUP),
          .EXAMPLE_SIMULATION(EXAMPLE_SIMULATION)
     )
ZynqDesign_OPTOLINK_1_0_wrapper_i
     (

    //----------------- Receive Ports - Polarity Determination Ports ----------
         .IN_POLARITY   (in_polarity_i),          
         .HLD_POLARITY  (hld_polarity_i),           
         .POLARITY_VAL  (polarity_val_i),         

         .gt_rxusrclk_out (gt_rxusrclk_out),
    //------------------------ RX Margin Analysis Ports ------------------------
         .GT0_eyescandataerror_out         (gt0_eyescandataerror_out),
         .GT0_eyescanreset_in              (gt0_eyescanreset_in),
         .GT0_eyescantrigger_in            (gt0_eyescantrigger_in),
    //------------------- Receive Ports - RX Equalizer Ports -------------------
         .GT0_rxcdrhold_in                 (gt0_rxcdrhold_in),
         .GT0_rxlpmhfovrden_in             (gt0_rxlpmhfovrden_in),
         .GT0_rxdfeagchold_in              (gt0_rxdfeagchold_in),
         .GT0_rxdfeagcovrden_in            (gt0_rxdfeagcovrden_in),
         .GT0_rxdfelfhold_in               (gt0_rxdfelfhold_in),
         .GT0_rxdfelpmreset_in             (gt0_rxdfelpmreset_in),
         .GT0_rxlpmlfklovrden_in           (gt0_rxlpmlfklovrden_in),
         .GT0_rxmonitorout_out             (gt0_rxmonitorout_out),
         .GT0_rxmonitorsel_in              (gt0_rxmonitorsel_in),
         .GT0_rxlpmen_in                   (gt0_rxlpmen_in),
         .gt0_RXPMARESET_IN                (gt0_rxpmareset_in),
         .gt0_rxpcsreset_in                 (gt0_rxpcsreset_in ),
         .gt0_rxbufreset_in                 (gt0_rxbufreset_in ),
         .gt0_rxprbssel_in                  (gt0_rxprbssel_in     ),
         .gt0_rxprbserr_out                 (gt0_rxprbserr_out    ),
         .gt0_rxprbscntreset_in             (gt0_rxprbscntreset_in),
         .gt0_rx_resetdone                  (gt0_rx_resetdone),
         .gt0_rxbufstatus_out               (gt0_rxbufstatus_out), 
        //---------------------- TX Configurable Driver Ports ----------------------
        .GT0_txpostcursor_in               (gt0_txpostcursor_in),
        .GT0_txdiffctrl_in                 (gt0_txdiffctrl_in),
        .GT0_txmaincursor_in               (gt0_txmaincursor_in),
        .gt0_txprecursor_in                (gt0_txprecursor_in),
        //--------------- Transmit Ports - TX Polarity Control Ports ---------------
        .GT0_txpolarity_in                 (gt0_txpolarity_in),
        .gt0_txinhibit_in                  (gt0_txinhibit_in),
        .gt0_txpmareset_in                 (gt0_txpmareset_in ),
        .gt0_txpcsreset_in                 (gt0_txpcsreset_in ),
        .gt0_txprbssel_in                  (gt0_txprbssel_in     ),
        .gt0_txprbsforceerr_in             (gt0_txprbsforceerr_in),
        .gt0_txbufstatus_out               (gt0_txbufstatus_out    ),
        .gt0_tx_resetdone                  (gt0_tx_resetdone),
        .gt0_dmonitorout_out               (gt0_dmonitorout_out    ),
        .gt0_cplllock_out                  (gt0_cplllock_out),



         // Aurora Lane Interface
         .CHECK_POLARITY_IN(check_polarity_i), 
         .RX_NEG_OUT(rx_neg_i), 
         .RXPOLARITY_IN(rx_polarity_i), 
         .RXRESET_IN(rx_reset_i), 
         .RXDATA_OUT(rx_data_i[0:63]),
         .RXBUFERR_OUT(rx_buf_err_i),         
         .CHBONDDONE_OUT(ch_bond_done_i), 
         // Global Logic Interface
         .ENCHANSYNC_IN(en_chan_sync_rx), 
         // Serial IO
         .RX1N_IN(rxn),       
         .RX1P_IN(rxp),      
         .RXLOSSOFSYNC_OUT(rx_lossofsync_i), 
         .RXHEADER_OUT({rx_header_1_i,rx_header_0_i}), 
         .RXDATAVALID_OUT(rxdatavalid_i), 
 
          // Clocks and Clock Status
         .RXUSRCLK2_IN(user_clk),
         .CHAN_BOND_RESET(chan_bond_reset_i),
         .GT_RXCDROVRDEN_IN(gt_rxcdrovrden_in),

         .TXDATA_IN(tx_data_i[0:63]),
         .TXRESET_IN(tx_reset_i),         
         .TXBUFERR_OUT(tx_buf_err_i),               
         
         // Serial IO
         .TX1N_OUT(txn),        
         .TX1P_OUT(txp), 
         .TXHEADER_IN({tx_header_1_i,tx_header_0_i}), 
         .TXDATAVALID_OUT(txdatavalid_i),
         .TXDATAVALID_SYMGEN_OUT        (txdatavalid_symgen_i),

         // Clocks and Clock Status
         .TXUSRCLK_IN			(sync_clk),
         .TXUSRCLK2_IN			(user_clk),
         .REFCLK1_IN(gt_refclk1),
         .TXOUTCLK1_OUT(raw_tx_out_clk_i), 
         .PLLLKDET_OUT(gt_pll_lock_i), 
         .TX_FSM_RESETDONE(tx_fsm_resetdone),  
         .RX_FSM_RESETDONE(rx_fsm_resetdone),  
         // System Interface
         .GTXRESET_IN(pma_init_sync),
         .LOOPBACK_IN(3'b000),
         .POWERDOWN_IN(power_down),
//---{

       .gt_qpllclk_quad1_in       (gt_qpllclk_quad1_in         ), 
       .gt_qpllrefclk_quad1_in    (gt_qpllrefclk_quad1_in      ),    

//---}
         .TXCLK_LOCK(txclk_locked_c),
    //---------------------- GT DRP Ports ----------------------
	 .DRP_CLK_IN(drp_clk_in),
         .DRPADDR_IN(drpaddr_in),
         .DRPDI_IN(drpdi_in),
         .DRPDO_OUT(drpdo_out), 
         .DRPRDY_OUT(drprdy_out), 
         .DRPEN_IN(drpen_in), 
         .DRPWE_IN(drpwe_in), 
         .INIT_CLK           (init_clk),
         .LINK_RESET_OUT     (link_reset_i),

         .TX_RESET(tx_reset),
         .RX_RESET(rx_reset)
 
     );

     assign mmcm_not_locked_i = mmcm_not_locked;

 
 
     //__________Instantiate Global Logic to combine Lanes into a Channel______
 
ZynqDesign_OPTOLINK_1_0_SIMPLEX_TX_GLOBAL_LOGIC #
     (
         .INTER_CB_GAP(INTER_CB_GAP),
         .PERIODIC_CB_COUNT(PERIODIC_CB_COUNT),
         .SIMPLEX_TIMER_VALUE(SIMPLEX_TIMER_VALUE)
     )
     simplex_tx_global_logic_i
     (
         // Aurora Lane Interface
         .TX_LANE_UP(tx_lane_up_i),
         .TX_HARD_ERR(tx_hard_err_i),
         .GEN_NA_IDLES(gen_na_idles_i),
         .GEN_CH_BOND(gen_ch_bond_i),
         .PERIODIC_CB_TO_LL(periodic_cb_to_ll),
         .PERIODIC_CB_SEQ(periodic_cb_seq),
         .RESET_LANES(reset_lanes_tx),
 
         // System Interface
         .USER_CLK(user_clk),
         .RESET(tx_reset),
         .RESET2FG(reset2fg),
         .DO_CC(do_cc_i),
         .TX_CHANNEL_UP(tx_channel_up_i),
         .TX_CHANNEL_HARD_ERR(tx_hard_err),
         .TXDATAVALID_IN(txdatavalid_i)
     );
 
ZynqDesign_OPTOLINK_1_0_SIMPLEX_RX_GLOBAL_LOGIC simplex_rx_global_logic_i
     (
         //GTX Interface
         .CH_BOND_DONE(ch_bond_done_i),
         .EN_CHAN_SYNC(en_chan_sync_rx),
         .CHAN_BOND_RESET(chan_bond_reset_i),
 
         // Aurora Lane Interface
         .RX_LANE_UP(rx_lane_up_i),
         .RX_HARD_ERR(rx_hard_err_i),
         .RESET_LANES(reset_lanes_rx),
         .GOT_NA_IDLES(got_na_idles_i),
         .GOT_CCS(got_cc_i),
         .REMOTE_READY(remote_ready_i),
         .GOT_CBS(got_cb_i),
         .GOT_IDLES(got_idles_i),
 
         // System Interface
         .USER_CLK(user_clk),
         .RESET(rx_reset),
         .RX_CHANNEL_UP(rx_channel_up_i),
         .RX_CHANNEL_HARD_ERR(rx_hard_err)
 
     );
 
     //_____________________________ TX AXI SHIM _______________________________
     // Converts input AXI4-Stream signals to LocalLink

ZynqDesign_OPTOLINK_1_0_AXI_TO_LL #
     (
        .DATA_WIDTH(64),
        .STRB_WIDTH(8),
        .USE_4_NFC (0),
        .REM_WIDTH (3)
     )

     axi_to_ll_data_i
     (
      .AXI4_S_IP_TX_TVALID(s_axi_tx_tvalid),
      .AXI4_S_IP_TX_TREADY(s_axi_tx_tready),
      .AXI4_S_IP_TX_TDATA(s_axi_tx_tdata),
      .AXI4_S_IP_TX_TKEEP(),
      .AXI4_S_IP_TX_TLAST(),

      .LL_OP_DATA(tx_d_i),
      .LL_OP_SOF_N(),
      .LL_OP_EOF_N() ,
      .LL_OP_REM() ,
      .LL_OP_SRC_RDY_N(tx_src_rdy_n_i),
      .LL_IP_DST_RDY_N(tx_dst_rdy_n_i),

      // System Interface
      .USER_CLK(user_clk),
      .CHANNEL_UP(tx_channel_up_i)
     );


 
 //_____________________________ RX AXI SHIM _______________________________

ZynqDesign_OPTOLINK_1_0_LL_TO_AXI #
     (
        .DATA_WIDTH(64),
        .STRB_WIDTH(8),
        .REM_WIDTH (3)
     )

     ll_to_axi_data_i
     (
      .LL_IP_DATA(rx_d_i),
      .LL_IP_SOF_N(),
      .LL_IP_EOF_N(),
      
      .LL_IP_REM(),
      .LL_IP_SRC_RDY_N(rx_src_rdy_n_i),
      .LL_OP_DST_RDY_N(),

      .AXI4_S_OP_TVALID(m_axi_rx_tvalid),
      .AXI4_S_OP_TDATA(m_axi_rx_tdata),
      .AXI4_S_OP_TKEEP(),
      .AXI4_S_OP_TLAST(),
      .AXI4_S_IP_TREADY(1'b0)

     );

 
 
    // TX STREAM
ZynqDesign_OPTOLINK_1_0_SIMPLEX_TX_STREAM #
( 
    .INTER_CB_GAP(INTER_CB_GAP)
)
 simplex_tx_stream_i
    (
         .TX_D(tx_d_i),
         .TX_SRC_RDY_N(tx_src_rdy_n_i),
         .TX_DST_RDY_N(tx_dst_rdy_n_i),
         .TX_PE_DATA(tx_pe_data_i),
         .TX_PE_DATA_V(tx_pe_data_v_i),
 
 
 
 
 
 
         .TX_CHANNEL_UP(tx_channel_up_i),
         .DO_CC(do_cc_i),
         .PERIODIC_CB_TO_LL(periodic_cb_to_ll),
         .PERIODIC_CB_SEQ(periodic_cb_seq),
         .GEN_CC(gen_cc_i),
         .GEN_PERIODIC_CB(gen_periodic_cb_i),
         .USER_CLK(user_clk),
         .TXDATAVALID_IN(txdatavalid_i)
    );
     // RX STREAM
ZynqDesign_OPTOLINK_1_0_SIMPLEX_RX_STREAM simplex_rx_stream_i
    (
         .RX_D(rx_d_i),
         .RX_SRC_RDY_N(rx_src_rdy_n_i),
         .RX_PE_DATA(rx_pe_data_i),
         .RX_PE_DATA_V(rx_pe_data_v_i),
 
 
 
 
 
 
         .RX_CHANNEL_UP(rx_channel_up_i),
         .USER_CLK(user_clk),
         .RESET(reset_lanes_rx)
    );
 

      assign rst_drp = pma_init_sync; 

    // Standard CC Module
ZynqDesign_OPTOLINK_1_0_STANDARD_CC_MODULE #
(
    .CC_FREQ_FACTOR (CC_FREQ_FACTOR)
)
standard_cc_module_i
    (
         .DO_CC         (do_cc_i),
         .USER_CLK      (user_clk),
         .CHANNEL_UP    (tx_channel_up_i) 
    );

         assign  RESET2FC_ii  = RESET2FC_i ;

    always @(posedge user_clk)
         RESET2FC_r <= `DLY RESET2FC_ii;

    assign reset2fc = RESET2FC_r;


 endmodule

