
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
 //
 //  Description:  
 //                
 //                
 ///////////////////////////////////////////////////////////////////////////////
 `timescale 1 ns / 10 ps

   (* core_generation_info = "ZynqDesign_OPTOLINK_0_0,aurora_64b66b_v11_2_3,{c_aurora_lanes=1,c_column_used=left,c_gt_clock_1=GTXQ0,c_gt_clock_2=None,c_gt_loc_1=1,c_gt_loc_10=X,c_gt_loc_11=X,c_gt_loc_12=X,c_gt_loc_13=X,c_gt_loc_14=X,c_gt_loc_15=X,c_gt_loc_16=X,c_gt_loc_17=X,c_gt_loc_18=X,c_gt_loc_19=X,c_gt_loc_2=X,c_gt_loc_20=X,c_gt_loc_21=X,c_gt_loc_22=X,c_gt_loc_23=X,c_gt_loc_24=X,c_gt_loc_25=X,c_gt_loc_26=X,c_gt_loc_27=X,c_gt_loc_28=X,c_gt_loc_29=X,c_gt_loc_3=X,c_gt_loc_30=X,c_gt_loc_31=X,c_gt_loc_32=X,c_gt_loc_33=X,c_gt_loc_34=X,c_gt_loc_35=X,c_gt_loc_36=X,c_gt_loc_37=X,c_gt_loc_38=X,c_gt_loc_39=X,c_gt_loc_4=X,c_gt_loc_40=X,c_gt_loc_41=X,c_gt_loc_42=X,c_gt_loc_43=X,c_gt_loc_44=X,c_gt_loc_45=X,c_gt_loc_46=X,c_gt_loc_47=X,c_gt_loc_48=X,c_gt_loc_5=X,c_gt_loc_6=X,c_gt_loc_7=X,c_gt_loc_8=X,c_gt_loc_9=X,c_lane_width=4,c_line_rate=6.25,c_gt_type=gtx,c_qpll=false,c_nfc=false,c_nfc_mode=IMM,c_refclk_frequency=156.25,c_simplex=true,c_simplex_mode=BOTH,c_stream=true,c_ufc=false,c_user_k=false,flow_mode=None,interface_mode=Streaming,dataflow_config=TX/RX_Simplex}" *) 
(* DowngradeIPIdentifiedWarnings="yes" *)
 module ZynqDesign_OPTOLINK_0_0_support 
  (
     // TX AXI Interface 
       input  [0:63]     s_axi_tx_tdata, 
       input             s_axi_tx_tvalid,
       output            s_axi_tx_tready, 
     // RX AXI Interface 
       output [0:63]     m_axi_rx_tdata, 
       output            m_axi_rx_tvalid, 


 
 
     // GTX Serial I/O
       input              rxp, 
       input              rxn, 
 
       output             txp, 
       output             txn,
 
     // Error Detection Interface
       output             tx_hard_err, 
       output             tx_soft_err, 
 
     // Status
       output             tx_channel_up, 
       output             tx_lane_up,

     // Error Detection Interface
       output             rx_hard_err, 
       output             rx_soft_err, 
 
     // Status
       output             rx_channel_up, 
       output             rx_lane_up,
     // System Interface
       output              user_clk_out, 
       output              sync_clk_out, 
       output              reset2fg, 
       output              reset2fc, 
       input              tx_reset_pb, 
       input              rx_reset_pb, 
       input              gt_rxcdrovrden_in, 
       input              power_down, 
       input              pma_init, 
       input    drp_clk_in,
 
       output  [15:0]  drpdo_out, 
       output          drprdy_out, 
 
    //---------------------- GT DRP Ports ----------------------
       input   [8:0]   drpaddr_in,
       input   [15:0]  drpdi_in,
       input           drpen_in, 
       input           drpwe_in, 
       input              init_clk, 
       output              link_reset_out, 
       output              gt_pll_lock, 
       output              tx_sys_reset_out,
       output              rx_sys_reset_out,
       output   gt_reset_out,

     // GTX Reference Clock Interface
 
       input              gt_refclk1_p, 
       input              gt_refclk1_n, 
       output             gt_refclk1_out,
 

       output gt_rxusrclk_out,
       //------------------------ RX Margin Analysis Ports ------------------------
       output          gt0_eyescandataerror_out,
       input           gt0_eyescanreset_in,
       input           gt0_eyescantrigger_in,
       //------------------- Receive Ports - RX Equalizer Ports -------------------
       input           gt0_rxcdrhold_in,
       input           gt0_rxlpmhfovrden_in,
       input           gt0_rxdfeagchold_in,
       input           gt0_rxdfeagcovrden_in,
       input           gt0_rxdfelfhold_in,
       input           gt0_rxdfelpmreset_in,
       input           gt0_rxlpmlfklovrden_in,
       output [6:0]    gt0_rxmonitorout_out,
       input  [1:0]    gt0_rxmonitorsel_in,
       input           gt0_rxlpmen_in,
       input           gt0_rxpmareset_in,
       input           gt0_rxpcsreset_in,
       input           gt0_rxbufreset_in,
       input  [2:0]    gt0_rxprbssel_in,    
       input           gt0_rxprbscntreset_in,
       output          gt0_rxprbserr_out,
       output          gt0_rxresetdone_out,
       output [2:0]    gt0_rxbufstatus_out,
       //---------------------- TX Configurable Driver Ports ----------------------
       input  [4:0]    gt0_txpostcursor_in,
       input  [3:0]    gt0_txdiffctrl_in,
       input  [6:0]    gt0_txmaincursor_in,
       input  [4:0]    gt0_txprecursor_in,
       //--------------- Transmit Ports - TX Polarity Control Ports ---------------
       input           gt0_txpolarity_in,
       input           gt0_txinhibit_in,
       input           gt0_txpmareset_in,
       input           gt0_txpcsreset_in,
       input  [2:0]    gt0_txprbssel_in, 
       input           gt0_txprbsforceerr_in,
       output [1:0]    gt0_txbufstatus_out,
       output          gt0_txresetdone_out,
       output  [7:0]   gt0_dmonitorout_out,
       output          gt0_cplllock_out,
       output          gt_qplllock,
//--- assigning output values {
    output                    gt_qpllclk_quad1_out  ,
    output                    gt_qpllrefclk_quad1_out  ,

//--- assigning output values }
       output                 mmcm_not_locked_out,
       output              tx_out_clk
 
 );
 
 
 //***********************************Port Declarations*******************************
 
 
 //************************External Register Declarations*****************************
 
 
 //********************************Wire Declarations**********************************
 
     //System Interface
       wire                 mmcm_not_locked_i ; 
       wire                 power_down_i ; 
 
       wire                  pma_init_i; 
       wire                  pma_init_sync; 
 
  
     // clock
       (* KEEP = "TRUE" *) wire               user_clk_i; 
       (* KEEP = "TRUE" *) wire               sync_clk_i; 
       (* KEEP = "TRUE" *) wire               GTXQ0_left_i; 
       (* KEEP = "TRUE" *) wire               INIT_CLK_i  /* synthesis syn_keep = 1 */; 
       wire               drp_clk_i;
       wire    [8:0] drpaddr_in_i;
       wire    [15:0]     drpdi_in_i;
       wire    [15:0]     drpdo_out_i; 
       wire               drprdy_out_i; 
       wire               drpen_in_i; 
       wire               drpwe_in_i; 
       wire    [7:0]      qpll_drpaddr_in='b0;
       wire    [15:0]     qpll_drpdi_in='b0;
       wire    [15:0]     qpll_drpdo_out; 
       wire               qpll_drprdy_out; 
       wire               qpll_drpen_in='b0; 
       wire               qpll_drpwe_in='b0; 
       wire               link_reset_i;
       wire               sysreset_from_vio_i;
       wire               gtreset_from_vio_i;
       wire               rx_cdrovrden_i;
       wire               gt_reset_i;
       wire               gt_reset_i_tmp;

//---{
    wire                     gt_qpllclk_quad1_i;
    wire                     gt_qpllrefclk_quad1_i;
    wire                     gt_to_common_qpllreset_i;
    wire                     gt_qpllrefclklost_i; 
    wire                     gt_qplllock_i; 
//---}
    wire                     refclk1_in;
    wire                     refclk2_in;
 
    wire                     tx_sysreset_from_support;
    wire                     rx_sysreset_from_support;
      wire tx_sysreset_to_core_sync;
      wire rx_sysreset_to_core_sync;

//--- assigning output values {
    assign                     gt_qpllclk_quad1_out  =  gt_qpllclk_quad1_i    ;
    assign                     gt_qpllrefclk_quad1_out  =  gt_qpllrefclk_quad1_i ;


//--- assigning output values }

    assign                     gt_qplllock =  1'b0; 

 //*********************************Main Body of Code**********************************
 
 
 
 
     //____________________________Register User I/O___________________________________
 
     // System Interface
     assign  power_down_i      =   1'b0;
    // Native DRP Interface
     assign  drpaddr_in_i                     =  'h0;
     assign  drpdi_in_i                       =  16'h0;
     assign  drpwe_in_i     =  1'b0; 
     assign  drpen_in_i     =  1'b0; 
 
 
     //___________________________Module Instantiations_________________________________

ZynqDesign_OPTOLINK_0_0_gt_common_wrapper gt_common_support
(
    .gt_qpllclk_quad1_out    (gt_qpllclk_quad1_i      ),
    .gt_qpllrefclk_quad1_out (gt_qpllrefclk_quad1_i   ),

         .GT0_GTREFCLK0_COMMON_IN             (refclk1_in), 

    //----------------------- Common Block - QPLL Ports ------------------------

    .GT0_QPLLLOCK_OUT (gt_qplllock_i),

    .GT0_QPLLLOCKDETCLK_IN (INIT_CLK_i),

    .GT0_QPLLREFCLKLOST_OUT (gt_qpllrefclklost_i),


    //---------------------- Common DRP Ports ----------------------
         .qpll_drpaddr_in (qpll_drpaddr_in),
         .qpll_drpdi_in   (qpll_drpdi_in),
         .qpll_drpclk_in  (drp_clk_in),
         .qpll_drpdo_out (qpll_drpdo_out), 
         .qpll_drprdy_out(qpll_drprdy_out), 
         .qpll_drpen_in  (qpll_drpen_in), 
         .qpll_drpwe_in  (qpll_drpwe_in)
);
     

//--- Instance of GT differential buffer ---------//
     IBUFDS_GTE2 IBUFDS_GTXE2_CLK1  
     (
         .O               (refclk1_in),
         .ODIV2           (),
         .CEB             (1'b0),
         .I               (gt_refclk1_p),
         .IB              (gt_refclk1_n)
     );

     // Instantiate a clock module for clock division.
     ZynqDesign_OPTOLINK_0_0_CLOCK_MODULE clock_module_i
     (
         .INIT_CLK_IN(init_clk),
 
         .INIT_CLK_O(INIT_CLK_i),
         .CLK(tx_out_clk),
         .CLK_LOCKED(gt_pll_lock),
         .USER_CLK(user_clk_i),
         .SYNC_CLK(sync_clk_i),
         .MMCM_NOT_LOCKED(mmcm_not_locked_i)
     );

  //  outputs
  assign gt_reset_out          =  pma_init_i;
  assign gt_refclk1_out        =  refclk1_in;
  assign init_clk_out          =  INIT_CLK_i;
  assign user_clk_out          =  user_clk_i;
  assign sync_clk_out          =  sync_clk_i;
  assign mmcm_not_locked_out   =  mmcm_not_locked_i;
  wire   tx_lock               =  gt_pll_lock;


 

 
    ZynqDesign_OPTOLINK_0_0_rst_sync #
    (
        .c_mtbf_stages (5)
    )tx_reset_pb_sync
    (
        .prmry_in     (tx_reset_pb),
        .scndry_aclk  (user_clk_i),
        .scndry_out   (tx_sysreset_to_core_sync)
    );

    ZynqDesign_OPTOLINK_0_0_rst_sync #
    (
        .c_mtbf_stages (5)
    )rx_reset_pb_sync
    (
        .prmry_in     (rx_reset_pb),
        .scndry_aclk  (user_clk_i),
        .scndry_out   (rx_sysreset_to_core_sync)
    );

 
    ZynqDesign_OPTOLINK_0_0_rst_sync #
    (
        .c_mtbf_stages (5)
    )gt_reset_sync
    (
        .prmry_in     (pma_init),
        .scndry_aclk  (INIT_CLK_i),
        .scndry_out   (pma_init_sync)
    );

     // Instantiate reset module to generate system reset
     ZynqDesign_OPTOLINK_0_0_SUPPORT_RESET_LOGIC support_reset_logic_i
     (
         .TX_RESET(tx_sysreset_to_core_sync),
         .RX_RESET(rx_sysreset_to_core_sync),
         .USER_CLK(user_clk_i),
         .INIT_CLK(INIT_CLK_i),
         .GT_RESET_IN(pma_init_sync),
         .TX_SYSTEM_RESET(tx_sysreset_from_support),
         .RX_SYSTEM_RESET(rx_sysreset_from_support),
         .GT_RESET_OUT(pma_init_i)
     );

//----- Instance of core -----[
ZynqDesign_OPTOLINK_0_0_core ZynqDesign_OPTOLINK_0_0_core_i
     (
        // TX AXI4-S Interface
         .s_axi_tx_tdata(s_axi_tx_tdata),
         .s_axi_tx_tvalid(s_axi_tx_tvalid),
         .s_axi_tx_tready(s_axi_tx_tready),

 
        // RX AXI4-S Interface
         .m_axi_rx_tdata(m_axi_rx_tdata),
         .m_axi_rx_tvalid(m_axi_rx_tvalid),
  
       

 
 
         // GTX Serial I/O
         .rxp(rxp),
         .rxn(rxn),
         .txp(txp),
         .txn(txn),
 
         //GTX Reference Clock Interface
         .gt_refclk1(refclk1_in),
         // Error Detection Interface
         .tx_hard_err(tx_hard_err),
         .tx_soft_err(tx_soft_err),
         .rx_hard_err(rx_hard_err),
         .rx_soft_err(rx_soft_err),


         // Status
         .tx_channel_up(tx_channel_up),
         .tx_lane_up(tx_lane_up),
         .rx_channel_up(rx_channel_up),
         .rx_lane_up(rx_lane_up),

 
         // System Interface
         .mmcm_not_locked(mmcm_not_locked_i),
         .user_clk(user_clk_i),
         .sync_clk(sync_clk_i),
         .reset2fg(reset2fg),
         .reset2fc(reset2fc),
         .tx_sysreset_to_core(tx_sysreset_from_support),
         .rx_sysreset_to_core(rx_sysreset_from_support),
         .gt_rxcdrovrden_in(gt_rxcdrovrden_in),
         .power_down(power_down),
         .pma_init(pma_init_i),
         .rst_drp_strt(pma_init_i),
         .gt_pll_lock(gt_pll_lock),
         .drp_clk_in(drp_clk_in),
//---{
       .gt_qpllclk_quad1_in       (gt_qpllclk_quad1_i          ), 
       .gt_qpllrefclk_quad1_in    (gt_qpllrefclk_quad1_i       ),    

//---}
    //---------------------- GT DRP Ports ----------------------
         .drpaddr_in(drpaddr_in),
         .drpdi_in(drpdi_in),
         .drpdo_out(drpdo_out), 
         .drprdy_out(drprdy_out), 
         .drpen_in(drpen_in), 
         .drpwe_in(drpwe_in), 
         .init_clk(INIT_CLK_i),
         .link_reset_out(link_reset_out),
         .gt_rxusrclk_out (gt_rxusrclk_out),
    //------------------------ RX Margin Analysis Ports ------------------------
         .gt0_eyescandataerror_out         (gt0_eyescandataerror_out),
         .gt0_eyescanreset_in              (gt0_eyescanreset_in),
         .gt0_eyescantrigger_in            (gt0_eyescantrigger_in),
    //------------------- Receive Ports - RX Equalizer Ports -------------------
         .gt0_rxcdrhold_in                 (gt0_rxcdrhold_in),
         .gt0_rxlpmhfovrden_in             (gt0_rxlpmhfovrden_in),
         .gt0_rxdfeagchold_in              (gt0_rxdfeagchold_in),
         .gt0_rxdfeagcovrden_in            (gt0_rxdfeagcovrden_in),
         .gt0_rxdfelfhold_in               (gt0_rxdfelfhold_in),
         .gt0_rxdfelpmreset_in             (gt0_rxdfelpmreset_in),
         .gt0_rxlpmlfklovrden_in           (gt0_rxlpmlfklovrden_in),
         .gt0_rxmonitorout_out             (gt0_rxmonitorout_out),
         .gt0_rxmonitorsel_in              (gt0_rxmonitorsel_in),
         .gt0_rxlpmen_in                   (gt0_rxlpmen_in),
         .gt0_rxpmareset_in                (gt0_rxpmareset_in),
         .gt0_rxpcsreset_in                (gt0_rxpcsreset_in ),
         .gt0_rxbufreset_in                (gt0_rxbufreset_in ),
        .gt0_rxprbssel_in                  (gt0_rxprbssel_in     ),
        .gt0_rxprbserr_out                 (gt0_rxprbserr_out    ),
        .gt0_rxprbscntreset_in             (gt0_rxprbscntreset_in),
        .gt0_rx_resetdone                  (gt0_rxresetdone_out),
        .gt0_rxbufstatus_out               (gt0_rxbufstatus_out), 
        //---------------------- TX Configurable Driver Ports ----------------------
        .gt0_txpostcursor_in               (gt0_txpostcursor_in),
        .gt0_txdiffctrl_in                 (gt0_txdiffctrl_in),
        .gt0_txmaincursor_in               (gt0_txmaincursor_in),
        .gt0_txprecursor_in                (gt0_txprecursor_in),
        //--------------- Transmit Ports - TX Polarity Control Ports ---------------
        .gt0_txpolarity_in                 (gt0_txpolarity_in),
        .gt0_txinhibit_in                  (gt0_txinhibit_in),
        .gt0_txpmareset_in                 (gt0_txpmareset_in ),
        .gt0_txpcsreset_in                 (gt0_txpcsreset_in ),
        .gt0_txprbssel_in                  (gt0_txprbssel_in  ),
        .gt0_txprbsforceerr_in             (gt0_txprbsforceerr_in),
        .gt0_txbufstatus_out               (gt0_txbufstatus_out  ),
        .gt0_tx_resetdone                  (gt0_txresetdone_out),
        .gt0_dmonitorout_out               (gt0_dmonitorout_out    ),
        .gt0_cplllock_out                  (gt0_cplllock_out),
        .tx_sys_reset_out(tx_sys_reset_out),
        .rx_sys_reset_out(rx_sys_reset_out),
        .tx_out_clk(tx_out_clk)
     );

//----- Instance of core -----]


 endmodule
