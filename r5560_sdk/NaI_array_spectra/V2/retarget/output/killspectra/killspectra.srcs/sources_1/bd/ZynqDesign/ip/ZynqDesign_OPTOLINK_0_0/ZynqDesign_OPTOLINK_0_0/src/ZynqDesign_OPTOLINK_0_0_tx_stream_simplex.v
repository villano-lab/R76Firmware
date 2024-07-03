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
 //  SIMPLEX TX STREAM LL
 //
 //
 //  Description: The TX_LL module converts user data from the LocalLink interface
 //               to Aurora Data, then sends it to the Aurora Channel for transmission.
 //
 //
 //
 //
 ///////////////////////////////////////////////////////////////////////////////
 
 
 `timescale 1 ns / 10 ps
 
(* DowngradeIPIdentifiedWarnings="yes" *)
 module ZynqDesign_OPTOLINK_0_0_SIMPLEX_TX_STREAM #
 (  
     parameter INTER_CB_GAP = 7'd15
 )

 (
     // LocalLink Interface
     TX_D,
     TX_SRC_RDY_N,
     TX_DST_RDY_N,
 
  
  
   // Clock Compensation Interface
     DO_CC,
     PERIODIC_CB_TO_LL,
     PERIODIC_CB_SEQ,
 
     // Global Logic Interface
     TX_CHANNEL_UP,
 
     // Aurora Lane Interface
 
 
 
     TX_PE_DATA_V,
     TX_PE_DATA,
     GEN_CC,
     GEN_PERIODIC_CB,
 
     // GTX Interface
     TXDATAVALID_IN,
 
     // System Interface
     USER_CLK
 
 );
 
 `define DLY #1
 
 
 //***********************************Port Declarations*******************************
 
 
     // LocalLink Interface
       input      [0:63]     TX_D; 
       input                 TX_SRC_RDY_N; 
 
       output                TX_DST_RDY_N; 
 
 
 
     // Clock Compensation Interface
       input                 DO_CC; 
       input                 PERIODIC_CB_TO_LL; 
       input                 PERIODIC_CB_SEQ; 
 
     // Global Logic Interface
       input                 TX_CHANNEL_UP; 
 
     // Aurora Lane Interface
 
 
 
       output                TX_PE_DATA_V; 
       output     [0:63]     TX_PE_DATA; 
       output                GEN_CC; 
       output                GEN_PERIODIC_CB; 
 
     // GTX Interface
       input                TXDATAVALID_IN; 
 
     // System Interface
       input                USER_CLK; 
 
 //*********************************Wire Declarations**********************************
 
 
 
 
 //*********************************Main Body of Code**********************************
 
     // TX_DST_RDY_N is generated by TX_LL_CONTROL_SM and used by TX_LL_DATAPATH and
     // external modules to regulate incoming pdu data signals.
 
     // TX_LL_Datapath module
ZynqDesign_OPTOLINK_0_0_SIMPLEX_TX_STREAM_DATAPATH simplex_tx_stream_datapath_i
     (
         // LocalLink Interface
         .TX_D(TX_D),
         .TX_SRC_RDY_N(TX_SRC_RDY_N),
         // TX_LL Control Module Interface
         .TX_DST_RDY_N(TX_DST_RDY_N),
 
 
 
         // Aurora Lane Interface
         .TX_PE_DATA_V(TX_PE_DATA_V),
         .TX_PE_DATA(TX_PE_DATA),
 
         // System Interface
         .USER_CLK(USER_CLK)
     );
 
     // TX_STREAM_Control module
ZynqDesign_OPTOLINK_0_0_SIMPLEX_TX_STREAM_CONTROL_SM #
( 
    .INTER_CB_GAP(INTER_CB_GAP)
)
 simplex_tx_stream_control_sm_i
     (
         // LocalLink Interface
         .TX_DST_RDY_N(TX_DST_RDY_N),
 
 
 
         // Clock Compensation Interface
         .DO_CC(DO_CC),
         .PERIODIC_CB_TO_LL(PERIODIC_CB_TO_LL),
         .PERIODIC_CB_SEQ(PERIODIC_CB_SEQ),
 
         // Global Logic Interface
         .TX_CHANNEL_UP(TX_CHANNEL_UP),
 
         // TX_LL Control Module Interface

         // Aurora Lane Interface
 
 
 
         .GEN_CC(GEN_CC),
         .GEN_PERIODIC_CB(GEN_PERIODIC_CB),
 
         // GTX Interface
         .TXDATAVALID_IN(TXDATAVALID_IN),
 
         // System Interface
         .USER_CLK(USER_CLK)
     );
 
 endmodule
