-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Sat Jul  6 10:48:59 2024
-- Host        : Hraesvelgr running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axi_amm_bridge_0_0/ZynqDesign_axi_amm_bridge_0_0_sim_netlist.vhdl
-- Design      : ZynqDesign_axi_amm_bridge_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z030fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_lite is
  port (
    s_axi_rvalid : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    avm_address : out STD_LOGIC_VECTOR ( 29 downto 0 );
    avm_byteenable : out STD_LOGIC_VECTOR ( 3 downto 0 );
    avm_writedata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    avm_beginbursttransfer : out STD_LOGIC;
    avm_read : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    avm_write : out STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_arready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    avm_waitrequest : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    avm_readdatavalid : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    s_axi_bready : in STD_LOGIC;
    avm_readdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_aresetn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_lite : entity is "axi_amm_bridge_v1_0_5_lite";
end ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_lite;

architecture STRUCTURE of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_lite is
  signal \FSM_onehot_current_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[0]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[0]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[0]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[5]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[5]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[5]_i_5_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[6]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[6]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[7]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[8]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[8]_i_3_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state[8]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_current_state_reg_n_0_[0]\ : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \FSM_onehot_current_state_reg_n_0_[0]\ : signal is "yes";
  signal \FSM_onehot_current_state_reg_n_0_[1]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_current_state_reg_n_0_[1]\ : signal is "yes";
  signal \FSM_onehot_current_state_reg_n_0_[2]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_current_state_reg_n_0_[2]\ : signal is "yes";
  signal \FSM_onehot_current_state_reg_n_0_[3]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_current_state_reg_n_0_[3]\ : signal is "yes";
  signal \FSM_onehot_current_state_reg_n_0_[4]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_current_state_reg_n_0_[4]\ : signal is "yes";
  signal \FSM_onehot_current_state_reg_n_0_[6]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_current_state_reg_n_0_[6]\ : signal is "yes";
  signal \FSM_onehot_current_state_reg_n_0_[7]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_current_state_reg_n_0_[7]\ : signal is "yes";
  signal \avm_address[0]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[0]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[10]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[10]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[11]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[11]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[12]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[12]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[13]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[13]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[14]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[14]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[15]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[15]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[16]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[16]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[17]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[17]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[18]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[18]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[19]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[19]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[1]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[1]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[20]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[20]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[21]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[21]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[22]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[22]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[23]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[23]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[24]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[24]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[25]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[25]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[26]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[26]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[27]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[27]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[28]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[28]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[29]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[29]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[29]_i_4_n_0\ : STD_LOGIC;
  signal \avm_address[2]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[2]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[3]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[3]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[4]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[4]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[5]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[5]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[6]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[6]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[7]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[7]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[8]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[8]_i_2_n_0\ : STD_LOGIC;
  signal \avm_address[9]_i_1_n_0\ : STD_LOGIC;
  signal \avm_address[9]_i_2_n_0\ : STD_LOGIC;
  signal avm_beginbursttransfer_i_1_n_0 : STD_LOGIC;
  signal \avm_byteenable[0]_i_1_n_0\ : STD_LOGIC;
  signal \avm_byteenable[1]_i_1_n_0\ : STD_LOGIC;
  signal \avm_byteenable[2]_i_1_n_0\ : STD_LOGIC;
  signal \avm_byteenable[3]_i_1_n_0\ : STD_LOGIC;
  signal \avm_byteenable[3]_i_2_n_0\ : STD_LOGIC;
  signal \avm_byteenable[3]_i_3_n_0\ : STD_LOGIC;
  signal \^avm_read\ : STD_LOGIC;
  signal avm_read_i_1_n_0 : STD_LOGIC;
  signal avm_readdata_i : STD_LOGIC;
  attribute RTL_KEEP of avm_readdata_i : signal is "yes";
  signal avm_readdatavalid_i0 : STD_LOGIC;
  signal \^avm_write\ : STD_LOGIC;
  signal avm_write_i_1_n_0 : STD_LOGIC;
  signal avm_write_i_2_n_0 : STD_LOGIC;
  signal \avm_writedata[0]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[10]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[11]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[12]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[13]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[14]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[15]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[16]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[17]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[18]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[19]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[1]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[20]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[21]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[22]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[23]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[24]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[25]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[26]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[27]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[28]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[29]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[2]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[30]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[31]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[31]_i_2_n_0\ : STD_LOGIC;
  signal \avm_writedata[3]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[4]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[5]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[6]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[7]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[8]_i_1_n_0\ : STD_LOGIC;
  signal \avm_writedata[9]_i_1_n_0\ : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal current_state1 : STD_LOGIC;
  signal current_state115_out : STD_LOGIC;
  signal current_state116_out : STD_LOGIC;
  signal done_read : STD_LOGIC;
  signal done_write : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal p_1_in : STD_LOGIC;
  attribute RTL_KEEP of p_1_in : signal is "yes";
  signal \^s_axi_arready\ : STD_LOGIC;
  signal s_axi_arready_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal s_axi_awready_i_1_n_0 : STD_LOGIC;
  signal s_axi_awready_i_2_n_0 : STD_LOGIC;
  signal s_axi_awready_i_3_n_0 : STD_LOGIC;
  signal s_axi_awready_i_4_n_0 : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \s_axi_bresp[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_bresp[1]_i_2_n_0\ : STD_LOGIC;
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal s_axi_bvalid_i_1_n_0 : STD_LOGIC;
  signal \s_axi_rdata[0]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[10]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[11]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[12]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[13]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[14]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[15]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[16]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[17]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[18]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[19]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[20]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[21]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[22]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[23]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[24]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[25]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[26]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[27]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[28]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[29]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[2]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[30]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_2_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[31]_i_3_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[3]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[4]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[5]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[6]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[7]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[8]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rdata[9]_i_1_n_0\ : STD_LOGIC;
  signal \^s_axi_rresp\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \s_axi_rresp[1]_i_1_n_0\ : STD_LOGIC;
  signal \s_axi_rresp[1]_i_2_n_0\ : STD_LOGIC;
  signal \^s_axi_rvalid\ : STD_LOGIC;
  signal s_axi_rvalid_i_1_n_0 : STD_LOGIC;
  signal \^s_axi_wready\ : STD_LOGIC;
  signal s_axi_wready_i_1_n_0 : STD_LOGIC;
  signal start : STD_LOGIC;
  signal start_i_1_n_0 : STD_LOGIC;
  signal start_i_2_n_0 : STD_LOGIC;
  signal start_i_3_n_0 : STD_LOGIC;
  signal start_i_4_n_0 : STD_LOGIC;
  signal start_i_6_n_0 : STD_LOGIC;
  signal start_reg_n_0 : STD_LOGIC;
  signal \tout_counter[8]_i_3_n_0\ : STD_LOGIC;
  signal \tout_counter_reg__0\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_current_state[5]_i_5\ : label is "soft_lutpair0";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[0]\ : label is "IDLE:000000001,WRITE_AD_DATA:000000100,WRITE_RESP:000001000,READ_ADDRESS:000000010,READ_DATA:001000000,INV_READ_ADDRESS:010000000,INV_READ_DATA:100000000,INV_WRITE_ADDRESS:000010000,INV_WRITE_DATA:000100000";
  attribute KEEP : string;
  attribute KEEP of \FSM_onehot_current_state_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[1]\ : label is "IDLE:000000001,WRITE_AD_DATA:000000100,WRITE_RESP:000001000,READ_ADDRESS:000000010,READ_DATA:001000000,INV_READ_ADDRESS:010000000,INV_READ_DATA:100000000,INV_WRITE_ADDRESS:000010000,INV_WRITE_DATA:000100000";
  attribute KEEP of \FSM_onehot_current_state_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[2]\ : label is "IDLE:000000001,WRITE_AD_DATA:000000100,WRITE_RESP:000001000,READ_ADDRESS:000000010,READ_DATA:001000000,INV_READ_ADDRESS:010000000,INV_READ_DATA:100000000,INV_WRITE_ADDRESS:000010000,INV_WRITE_DATA:000100000";
  attribute KEEP of \FSM_onehot_current_state_reg[2]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[3]\ : label is "IDLE:000000001,WRITE_AD_DATA:000000100,WRITE_RESP:000001000,READ_ADDRESS:000000010,READ_DATA:001000000,INV_READ_ADDRESS:010000000,INV_READ_DATA:100000000,INV_WRITE_ADDRESS:000010000,INV_WRITE_DATA:000100000";
  attribute KEEP of \FSM_onehot_current_state_reg[3]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[4]\ : label is "IDLE:000000001,WRITE_AD_DATA:000000100,WRITE_RESP:000001000,READ_ADDRESS:000000010,READ_DATA:001000000,INV_READ_ADDRESS:010000000,INV_READ_DATA:100000000,INV_WRITE_ADDRESS:000010000,INV_WRITE_DATA:000100000";
  attribute KEEP of \FSM_onehot_current_state_reg[4]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[5]\ : label is "IDLE:000000001,WRITE_AD_DATA:000000100,WRITE_RESP:000001000,READ_ADDRESS:000000010,READ_DATA:001000000,INV_READ_ADDRESS:010000000,INV_READ_DATA:100000000,INV_WRITE_ADDRESS:000010000,INV_WRITE_DATA:000100000";
  attribute KEEP of \FSM_onehot_current_state_reg[5]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[6]\ : label is "IDLE:000000001,WRITE_AD_DATA:000000100,WRITE_RESP:000001000,READ_ADDRESS:000000010,READ_DATA:001000000,INV_READ_ADDRESS:010000000,INV_READ_DATA:100000000,INV_WRITE_ADDRESS:000010000,INV_WRITE_DATA:000100000";
  attribute KEEP of \FSM_onehot_current_state_reg[6]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[7]\ : label is "IDLE:000000001,WRITE_AD_DATA:000000100,WRITE_RESP:000001000,READ_ADDRESS:000000010,READ_DATA:001000000,INV_READ_ADDRESS:010000000,INV_READ_DATA:100000000,INV_WRITE_ADDRESS:000010000,INV_WRITE_DATA:000100000";
  attribute KEEP of \FSM_onehot_current_state_reg[7]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_current_state_reg[8]\ : label is "IDLE:000000001,WRITE_AD_DATA:000000100,WRITE_RESP:000001000,READ_ADDRESS:000000010,READ_DATA:001000000,INV_READ_ADDRESS:010000000,INV_READ_DATA:100000000,INV_WRITE_ADDRESS:000010000,INV_WRITE_DATA:000100000";
  attribute KEEP of \FSM_onehot_current_state_reg[8]\ : label is "yes";
  attribute SOFT_HLUTNM of \avm_address[29]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \avm_byteenable[3]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of avm_write_i_2 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \tout_counter[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \tout_counter[3]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \tout_counter[4]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \tout_counter[6]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \tout_counter[7]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \tout_counter[8]_i_3\ : label is "soft_lutpair2";
begin
  avm_read <= \^avm_read\;
  avm_write <= \^avm_write\;
  s_axi_arready <= \^s_axi_arready\;
  s_axi_awready <= \^s_axi_awready\;
  s_axi_bresp(0) <= \^s_axi_bresp\(0);
  s_axi_bvalid <= \^s_axi_bvalid\;
  s_axi_rresp(0) <= \^s_axi_rresp\(0);
  s_axi_rvalid <= \^s_axi_rvalid\;
  s_axi_wready <= \^s_axi_wready\;
\FSM_onehot_current_state[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444477777444"
    )
        port map (
      I0 => \avm_byteenable[3]_i_3_n_0\,
      I1 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I2 => \FSM_onehot_current_state[0]_i_2_n_0\,
      I3 => \FSM_onehot_current_state[0]_i_3_n_0\,
      I4 => \FSM_onehot_current_state[0]_i_4_n_0\,
      I5 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => \FSM_onehot_current_state[0]_i_1_n_0\
    );
\FSM_onehot_current_state[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000800F8F"
    )
        port map (
      I0 => \^s_axi_rvalid\,
      I1 => s_axi_rready,
      I2 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I3 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I4 => \FSM_onehot_current_state_reg_n_0_[7]\,
      I5 => \FSM_onehot_current_state_reg_n_0_[1]\,
      O => \FSM_onehot_current_state[0]_i_2_n_0\
    );
\FSM_onehot_current_state[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A0A0AAAA000000F3"
    )
        port map (
      I0 => done_read,
      I1 => p_1_in,
      I2 => done_write,
      I3 => \FSM_onehot_current_state_reg_n_0_[4]\,
      I4 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I5 => avm_readdata_i,
      O => \FSM_onehot_current_state[0]_i_3_n_0\
    );
\FSM_onehot_current_state[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8888B888"
    )
        port map (
      I0 => done_write,
      I1 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I2 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I3 => done_read,
      I4 => \FSM_onehot_current_state_reg_n_0_[1]\,
      O => \FSM_onehot_current_state[0]_i_4_n_0\
    );
\FSM_onehot_current_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888888888F888888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => \FSM_onehot_current_state[6]_i_2_n_0\,
      I3 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I4 => avm_waitrequest,
      I5 => current_state116_out,
      O => \FSM_onehot_current_state[1]_i_1_n_0\
    );
\FSM_onehot_current_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"550055C0"
    )
        port map (
      I0 => avm_write_i_2_n_0,
      I1 => avm_waitrequest,
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I4 => current_state116_out,
      O => \FSM_onehot_current_state[2]_i_1_n_0\
    );
\FSM_onehot_current_state[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000550000005530"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => done_write,
      I2 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I3 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I4 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I5 => current_state115_out,
      O => \FSM_onehot_current_state[3]_i_1_n_0\
    );
\FSM_onehot_current_state[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => current_state116_out,
      I2 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I3 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => \FSM_onehot_current_state[4]_i_1_n_0\
    );
\FSM_onehot_current_state[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040004F00400040"
    )
        port map (
      I0 => done_write,
      I1 => current_state115_out,
      I2 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I3 => \FSM_onehot_current_state[5]_i_3_n_0\,
      I4 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I5 => \FSM_onehot_current_state[5]_i_4_n_0\,
      O => \FSM_onehot_current_state[5]_i_1_n_0\
    );
\FSM_onehot_current_state[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => s_axi_awready_i_4_n_0,
      I1 => \FSM_onehot_current_state[5]_i_5_n_0\,
      I2 => p_1_in,
      I3 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I4 => \^s_axi_bvalid\,
      O => current_state115_out
    );
\FSM_onehot_current_state[5]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => \FSM_onehot_current_state[5]_i_3_n_0\
    );
\FSM_onehot_current_state[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100010001010100"
    )
        port map (
      I0 => avm_readdata_i,
      I1 => \FSM_onehot_current_state_reg_n_0_[7]\,
      I2 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I3 => \FSM_onehot_current_state_reg_n_0_[4]\,
      I4 => p_1_in,
      I5 => done_write,
      O => \FSM_onehot_current_state[5]_i_4_n_0\
    );
\FSM_onehot_current_state[5]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \tout_counter_reg__0\(6),
      I1 => \tout_counter_reg__0\(3),
      I2 => start_reg_n_0,
      I3 => \tout_counter_reg__0\(7),
      O => \FSM_onehot_current_state[5]_i_5_n_0\
    );
\FSM_onehot_current_state[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1100110311001100"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state[6]_i_2_n_0\,
      I2 => current_state1,
      I3 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I4 => done_read,
      I5 => \FSM_onehot_current_state_reg_n_0_[6]\,
      O => \FSM_onehot_current_state[6]_i_1_n_0\
    );
\FSM_onehot_current_state[6]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I2 => \FSM_onehot_current_state_reg_n_0_[3]\,
      O => \FSM_onehot_current_state[6]_i_2_n_0\
    );
\FSM_onehot_current_state[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000080"
    )
        port map (
      I0 => current_state116_out,
      I1 => avm_waitrequest,
      I2 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I3 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I4 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I5 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => \FSM_onehot_current_state[7]_i_1_n_0\
    );
\FSM_onehot_current_state[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000004F4F4540"
    )
        port map (
      I0 => done_read,
      I1 => current_state1,
      I2 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I3 => avm_readdata_i,
      I4 => \FSM_onehot_current_state_reg_n_0_[7]\,
      I5 => \FSM_onehot_current_state[8]_i_3_n_0\,
      O => \FSM_onehot_current_state[8]_i_1_n_0\
    );
\FSM_onehot_current_state[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000100"
    )
        port map (
      I0 => s_axi_awready_i_4_n_0,
      I1 => \tout_counter_reg__0\(6),
      I2 => \tout_counter_reg__0\(3),
      I3 => start_reg_n_0,
      I4 => \tout_counter_reg__0\(7),
      I5 => \FSM_onehot_current_state[8]_i_4_n_0\,
      O => current_state1
    );
\FSM_onehot_current_state[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => \FSM_onehot_current_state_reg_n_0_[1]\,
      O => \FSM_onehot_current_state[8]_i_3_n_0\
    );
\FSM_onehot_current_state[8]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEEE"
    )
        port map (
      I0 => \^s_axi_rvalid\,
      I1 => avm_readdata_i,
      I2 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I3 => avm_readdatavalid,
      O => \FSM_onehot_current_state[8]_i_4_n_0\
    );
\FSM_onehot_current_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_current_state[0]_i_1_n_0\,
      Q => \FSM_onehot_current_state_reg_n_0_[0]\,
      S => s_axi_awready_i_1_n_0
    );
\FSM_onehot_current_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_current_state[1]_i_1_n_0\,
      Q => \FSM_onehot_current_state_reg_n_0_[1]\,
      R => s_axi_awready_i_1_n_0
    );
\FSM_onehot_current_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_current_state[2]_i_1_n_0\,
      Q => \FSM_onehot_current_state_reg_n_0_[2]\,
      R => s_axi_awready_i_1_n_0
    );
\FSM_onehot_current_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_current_state[3]_i_1_n_0\,
      Q => \FSM_onehot_current_state_reg_n_0_[3]\,
      R => s_axi_awready_i_1_n_0
    );
\FSM_onehot_current_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_current_state[4]_i_1_n_0\,
      Q => \FSM_onehot_current_state_reg_n_0_[4]\,
      R => s_axi_awready_i_1_n_0
    );
\FSM_onehot_current_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_current_state[5]_i_1_n_0\,
      Q => p_1_in,
      R => s_axi_awready_i_1_n_0
    );
\FSM_onehot_current_state_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_current_state[6]_i_1_n_0\,
      Q => \FSM_onehot_current_state_reg_n_0_[6]\,
      R => s_axi_awready_i_1_n_0
    );
\FSM_onehot_current_state_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_current_state[7]_i_1_n_0\,
      Q => \FSM_onehot_current_state_reg_n_0_[7]\,
      R => s_axi_awready_i_1_n_0
    );
\FSM_onehot_current_state_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => \FSM_onehot_current_state[8]_i_1_n_0\,
      Q => avm_readdata_i,
      R => s_axi_awready_i_1_n_0
    );
\avm_address[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(0),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(0),
      I4 => \avm_address[0]_i_2_n_0\,
      O => \avm_address[0]_i_1_n_0\
    );
\avm_address[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(0),
      I3 => s_axi_awaddr(0),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[0]_i_2_n_0\
    );
\avm_address[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(10),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(10),
      I4 => \avm_address[10]_i_2_n_0\,
      O => \avm_address[10]_i_1_n_0\
    );
\avm_address[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(10),
      I3 => s_axi_awaddr(10),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[10]_i_2_n_0\
    );
\avm_address[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(11),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(11),
      I4 => \avm_address[11]_i_2_n_0\,
      O => \avm_address[11]_i_1_n_0\
    );
\avm_address[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(11),
      I3 => s_axi_awaddr(11),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[11]_i_2_n_0\
    );
\avm_address[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(12),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(12),
      I4 => \avm_address[12]_i_2_n_0\,
      O => \avm_address[12]_i_1_n_0\
    );
\avm_address[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(12),
      I3 => s_axi_awaddr(12),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[12]_i_2_n_0\
    );
\avm_address[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(13),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(13),
      I4 => \avm_address[13]_i_2_n_0\,
      O => \avm_address[13]_i_1_n_0\
    );
\avm_address[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(13),
      I3 => s_axi_awaddr(13),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[13]_i_2_n_0\
    );
\avm_address[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(14),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(14),
      I4 => \avm_address[14]_i_2_n_0\,
      O => \avm_address[14]_i_1_n_0\
    );
\avm_address[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(14),
      I3 => s_axi_awaddr(14),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[14]_i_2_n_0\
    );
\avm_address[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(15),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(15),
      I4 => \avm_address[15]_i_2_n_0\,
      O => \avm_address[15]_i_1_n_0\
    );
\avm_address[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(15),
      I3 => s_axi_awaddr(15),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[15]_i_2_n_0\
    );
\avm_address[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(16),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(16),
      I4 => \avm_address[16]_i_2_n_0\,
      O => \avm_address[16]_i_1_n_0\
    );
\avm_address[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(16),
      I3 => s_axi_awaddr(16),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[16]_i_2_n_0\
    );
\avm_address[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(17),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(17),
      I4 => \avm_address[17]_i_2_n_0\,
      O => \avm_address[17]_i_1_n_0\
    );
\avm_address[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(17),
      I3 => s_axi_awaddr(17),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[17]_i_2_n_0\
    );
\avm_address[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(18),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(18),
      I4 => \avm_address[18]_i_2_n_0\,
      O => \avm_address[18]_i_1_n_0\
    );
\avm_address[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(18),
      I3 => s_axi_awaddr(18),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[18]_i_2_n_0\
    );
\avm_address[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(19),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(19),
      I4 => \avm_address[19]_i_2_n_0\,
      O => \avm_address[19]_i_1_n_0\
    );
\avm_address[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(19),
      I3 => s_axi_awaddr(19),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[19]_i_2_n_0\
    );
\avm_address[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(1),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(1),
      I4 => \avm_address[1]_i_2_n_0\,
      O => \avm_address[1]_i_1_n_0\
    );
\avm_address[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(1),
      I3 => s_axi_awaddr(1),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[1]_i_2_n_0\
    );
\avm_address[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(20),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(20),
      I4 => \avm_address[20]_i_2_n_0\,
      O => \avm_address[20]_i_1_n_0\
    );
\avm_address[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(20),
      I3 => s_axi_awaddr(20),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[20]_i_2_n_0\
    );
\avm_address[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(21),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(21),
      I4 => \avm_address[21]_i_2_n_0\,
      O => \avm_address[21]_i_1_n_0\
    );
\avm_address[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(21),
      I3 => s_axi_awaddr(21),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[21]_i_2_n_0\
    );
\avm_address[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(22),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(22),
      I4 => \avm_address[22]_i_2_n_0\,
      O => \avm_address[22]_i_1_n_0\
    );
\avm_address[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(22),
      I3 => s_axi_awaddr(22),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[22]_i_2_n_0\
    );
\avm_address[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(23),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(23),
      I4 => \avm_address[23]_i_2_n_0\,
      O => \avm_address[23]_i_1_n_0\
    );
\avm_address[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(23),
      I3 => s_axi_awaddr(23),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[23]_i_2_n_0\
    );
\avm_address[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(24),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(24),
      I4 => \avm_address[24]_i_2_n_0\,
      O => \avm_address[24]_i_1_n_0\
    );
\avm_address[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(24),
      I3 => s_axi_awaddr(24),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[24]_i_2_n_0\
    );
\avm_address[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(25),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(25),
      I4 => \avm_address[25]_i_2_n_0\,
      O => \avm_address[25]_i_1_n_0\
    );
\avm_address[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(25),
      I3 => s_axi_awaddr(25),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[25]_i_2_n_0\
    );
\avm_address[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(26),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(26),
      I4 => \avm_address[26]_i_2_n_0\,
      O => \avm_address[26]_i_1_n_0\
    );
\avm_address[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(26),
      I3 => s_axi_awaddr(26),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[26]_i_2_n_0\
    );
\avm_address[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(27),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(27),
      I4 => \avm_address[27]_i_2_n_0\,
      O => \avm_address[27]_i_1_n_0\
    );
\avm_address[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(27),
      I3 => s_axi_awaddr(27),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[27]_i_2_n_0\
    );
\avm_address[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(28),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(28),
      I4 => \avm_address[28]_i_2_n_0\,
      O => \avm_address[28]_i_1_n_0\
    );
\avm_address[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(28),
      I3 => s_axi_awaddr(28),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[28]_i_2_n_0\
    );
\avm_address[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AEFEAEEE"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I2 => avm_waitrequest,
      I3 => current_state116_out,
      I4 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => \avm_address[29]_i_1_n_0\
    );
\avm_address[29]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(29),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(29),
      I4 => \avm_address[29]_i_4_n_0\,
      O => \avm_address[29]_i_2_n_0\
    );
\avm_address[29]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => \tout_counter_reg__0\(7),
      I1 => start_reg_n_0,
      I2 => \tout_counter_reg__0\(3),
      I3 => \tout_counter_reg__0\(6),
      I4 => s_axi_awready_i_4_n_0,
      O => current_state116_out
    );
\avm_address[29]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(29),
      I3 => s_axi_awaddr(29),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[29]_i_4_n_0\
    );
\avm_address[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(2),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(2),
      I4 => \avm_address[2]_i_2_n_0\,
      O => \avm_address[2]_i_1_n_0\
    );
\avm_address[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(2),
      I3 => s_axi_awaddr(2),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[2]_i_2_n_0\
    );
\avm_address[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(3),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(3),
      I4 => \avm_address[3]_i_2_n_0\,
      O => \avm_address[3]_i_1_n_0\
    );
\avm_address[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(3),
      I3 => s_axi_awaddr(3),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[3]_i_2_n_0\
    );
\avm_address[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(4),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(4),
      I4 => \avm_address[4]_i_2_n_0\,
      O => \avm_address[4]_i_1_n_0\
    );
\avm_address[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(4),
      I3 => s_axi_awaddr(4),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[4]_i_2_n_0\
    );
\avm_address[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(5),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(5),
      I4 => \avm_address[5]_i_2_n_0\,
      O => \avm_address[5]_i_1_n_0\
    );
\avm_address[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(5),
      I3 => s_axi_awaddr(5),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[5]_i_2_n_0\
    );
\avm_address[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(6),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(6),
      I4 => \avm_address[6]_i_2_n_0\,
      O => \avm_address[6]_i_1_n_0\
    );
\avm_address[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(6),
      I3 => s_axi_awaddr(6),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[6]_i_2_n_0\
    );
\avm_address[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(7),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(7),
      I4 => \avm_address[7]_i_2_n_0\,
      O => \avm_address[7]_i_1_n_0\
    );
\avm_address[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(7),
      I3 => s_axi_awaddr(7),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[7]_i_2_n_0\
    );
\avm_address[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(8),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(8),
      I4 => \avm_address[8]_i_2_n_0\,
      O => \avm_address[8]_i_1_n_0\
    );
\avm_address[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(8),
      I3 => s_axi_awaddr(8),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[8]_i_2_n_0\
    );
\avm_address[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => s_axi_araddr(9),
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => s_axi_awaddr(9),
      I4 => \avm_address[9]_i_2_n_0\,
      O => \avm_address[9]_i_1_n_0\
    );
\avm_address[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A280808080808080"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_arvalid,
      I2 => s_axi_araddr(9),
      I3 => s_axi_awaddr(9),
      I4 => s_axi_awvalid,
      I5 => s_axi_wvalid,
      O => \avm_address[9]_i_2_n_0\
    );
\avm_address_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[0]_i_1_n_0\,
      Q => avm_address(0),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[10]_i_1_n_0\,
      Q => avm_address(10),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[11]_i_1_n_0\,
      Q => avm_address(11),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[12]_i_1_n_0\,
      Q => avm_address(12),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[13]_i_1_n_0\,
      Q => avm_address(13),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[14]_i_1_n_0\,
      Q => avm_address(14),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[15]_i_1_n_0\,
      Q => avm_address(15),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[16]_i_1_n_0\,
      Q => avm_address(16),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[17]_i_1_n_0\,
      Q => avm_address(17),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[18]_i_1_n_0\,
      Q => avm_address(18),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[19]_i_1_n_0\,
      Q => avm_address(19),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[1]_i_1_n_0\,
      Q => avm_address(1),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[20]_i_1_n_0\,
      Q => avm_address(20),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[21]_i_1_n_0\,
      Q => avm_address(21),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[22]_i_1_n_0\,
      Q => avm_address(22),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[23]_i_1_n_0\,
      Q => avm_address(23),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[24]_i_1_n_0\,
      Q => avm_address(24),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[25]_i_1_n_0\,
      Q => avm_address(25),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[26]_i_1_n_0\,
      Q => avm_address(26),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[27]_i_1_n_0\,
      Q => avm_address(27),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[28]_i_1_n_0\,
      Q => avm_address(28),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[29]_i_2_n_0\,
      Q => avm_address(29),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[2]_i_1_n_0\,
      Q => avm_address(2),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[3]_i_1_n_0\,
      Q => avm_address(3),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[4]_i_1_n_0\,
      Q => avm_address(4),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[5]_i_1_n_0\,
      Q => avm_address(5),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[6]_i_1_n_0\,
      Q => avm_address(6),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[7]_i_1_n_0\,
      Q => avm_address(7),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[8]_i_1_n_0\,
      Q => avm_address(8),
      R => s_axi_awready_i_1_n_0
    );
\avm_address_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_address[29]_i_1_n_0\,
      D => \avm_address[9]_i_1_n_0\,
      Q => avm_address(9),
      R => s_axi_awready_i_1_n_0
    );
avm_beginbursttransfer_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA80"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => s_axi_awvalid,
      I2 => s_axi_wvalid,
      I3 => s_axi_arvalid,
      O => avm_beginbursttransfer_i_1_n_0
    );
avm_beginbursttransfer_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => avm_beginbursttransfer_i_1_n_0,
      Q => avm_beginbursttransfer,
      R => s_axi_awready_i_1_n_0
    );
\avm_byteenable[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEEEAEAEEEEEAEA"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I2 => s_axi_arvalid,
      I3 => avm_waitrequest,
      I4 => s_axi_wstrb(0),
      I5 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => \avm_byteenable[0]_i_1_n_0\
    );
\avm_byteenable[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEEEAEAEEEEEAEA"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I2 => s_axi_arvalid,
      I3 => avm_waitrequest,
      I4 => s_axi_wstrb(1),
      I5 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => \avm_byteenable[1]_i_1_n_0\
    );
\avm_byteenable[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEEEAEAEEEEEAEA"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I2 => s_axi_arvalid,
      I3 => avm_waitrequest,
      I4 => s_axi_wstrb(2),
      I5 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => \avm_byteenable[2]_i_1_n_0\
    );
\avm_byteenable[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8FFF8FFF8FFF8888"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => \avm_byteenable[3]_i_3_n_0\,
      I2 => avm_waitrequest,
      I3 => current_state116_out,
      I4 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I5 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => \avm_byteenable[3]_i_1_n_0\
    );
\avm_byteenable[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEEEAEAEEEEEAEA"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I2 => s_axi_arvalid,
      I3 => avm_waitrequest,
      I4 => s_axi_wstrb(3),
      I5 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => \avm_byteenable[3]_i_2_n_0\
    );
\avm_byteenable[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EA"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => s_axi_wvalid,
      I2 => s_axi_awvalid,
      O => \avm_byteenable[3]_i_3_n_0\
    );
\avm_byteenable_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => \avm_byteenable[3]_i_1_n_0\,
      D => \avm_byteenable[0]_i_1_n_0\,
      Q => avm_byteenable(0),
      S => s_axi_awready_i_1_n_0
    );
\avm_byteenable_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => \avm_byteenable[3]_i_1_n_0\,
      D => \avm_byteenable[1]_i_1_n_0\,
      Q => avm_byteenable(1),
      S => s_axi_awready_i_1_n_0
    );
\avm_byteenable_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => \avm_byteenable[3]_i_1_n_0\,
      D => \avm_byteenable[2]_i_1_n_0\,
      Q => avm_byteenable(2),
      S => s_axi_awready_i_1_n_0
    );
\avm_byteenable_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => \avm_byteenable[3]_i_1_n_0\,
      D => \avm_byteenable[3]_i_2_n_0\,
      Q => avm_byteenable(3),
      S => s_axi_awready_i_1_n_0
    );
avm_read_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F222F0FFF222F000"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => current_state116_out,
      I2 => s_axi_arvalid,
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I4 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I5 => \^avm_read\,
      O => avm_read_i_1_n_0
    );
avm_read_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => avm_read_i_1_n_0,
      Q => \^avm_read\,
      R => s_axi_awready_i_1_n_0
    );
avm_write_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F220FFF2F220F00"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => current_state116_out,
      I2 => avm_write_i_2_n_0,
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I4 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I5 => \^avm_write\,
      O => avm_write_i_1_n_0
    );
avm_write_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => s_axi_arvalid,
      I1 => s_axi_wvalid,
      I2 => s_axi_awvalid,
      O => avm_write_i_2_n_0
    );
avm_write_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => avm_write_i_1_n_0,
      Q => \^avm_write\,
      R => s_axi_awready_i_1_n_0
    );
\avm_writedata[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(0),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[0]_i_1_n_0\
    );
\avm_writedata[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(10),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[10]_i_1_n_0\
    );
\avm_writedata[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(11),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[11]_i_1_n_0\
    );
\avm_writedata[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(12),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[12]_i_1_n_0\
    );
\avm_writedata[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(13),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[13]_i_1_n_0\
    );
\avm_writedata[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(14),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[14]_i_1_n_0\
    );
\avm_writedata[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(15),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[15]_i_1_n_0\
    );
\avm_writedata[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(16),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[16]_i_1_n_0\
    );
\avm_writedata[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(17),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[17]_i_1_n_0\
    );
\avm_writedata[18]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(18),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[18]_i_1_n_0\
    );
\avm_writedata[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(19),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[19]_i_1_n_0\
    );
\avm_writedata[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(1),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[1]_i_1_n_0\
    );
\avm_writedata[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(20),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[20]_i_1_n_0\
    );
\avm_writedata[21]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(21),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[21]_i_1_n_0\
    );
\avm_writedata[22]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(22),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[22]_i_1_n_0\
    );
\avm_writedata[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(23),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[23]_i_1_n_0\
    );
\avm_writedata[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(24),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[24]_i_1_n_0\
    );
\avm_writedata[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(25),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[25]_i_1_n_0\
    );
\avm_writedata[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(26),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[26]_i_1_n_0\
    );
\avm_writedata[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(27),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[27]_i_1_n_0\
    );
\avm_writedata[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(28),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[28]_i_1_n_0\
    );
\avm_writedata[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(29),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[29]_i_1_n_0\
    );
\avm_writedata[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(2),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[2]_i_1_n_0\
    );
\avm_writedata[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(30),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[30]_i_1_n_0\
    );
\avm_writedata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22F2F2F200000000"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I1 => avm_write_i_2_n_0,
      I2 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I3 => current_state116_out,
      I4 => avm_waitrequest,
      I5 => s_axi_aresetn,
      O => \avm_writedata[31]_i_1_n_0\
    );
\avm_writedata[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(31),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[31]_i_2_n_0\
    );
\avm_writedata[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(3),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[3]_i_1_n_0\
    );
\avm_writedata[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(4),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[4]_i_1_n_0\
    );
\avm_writedata[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(5),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[5]_i_1_n_0\
    );
\avm_writedata[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(6),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[6]_i_1_n_0\
    );
\avm_writedata[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(7),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[7]_i_1_n_0\
    );
\avm_writedata[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(8),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[8]_i_1_n_0\
    );
\avm_writedata[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F080"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I2 => s_axi_wdata(9),
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      O => \avm_writedata[9]_i_1_n_0\
    );
\avm_writedata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[0]_i_1_n_0\,
      Q => avm_writedata(0),
      R => '0'
    );
\avm_writedata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[10]_i_1_n_0\,
      Q => avm_writedata(10),
      R => '0'
    );
\avm_writedata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[11]_i_1_n_0\,
      Q => avm_writedata(11),
      R => '0'
    );
\avm_writedata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[12]_i_1_n_0\,
      Q => avm_writedata(12),
      R => '0'
    );
\avm_writedata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[13]_i_1_n_0\,
      Q => avm_writedata(13),
      R => '0'
    );
\avm_writedata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[14]_i_1_n_0\,
      Q => avm_writedata(14),
      R => '0'
    );
\avm_writedata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[15]_i_1_n_0\,
      Q => avm_writedata(15),
      R => '0'
    );
\avm_writedata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[16]_i_1_n_0\,
      Q => avm_writedata(16),
      R => '0'
    );
\avm_writedata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[17]_i_1_n_0\,
      Q => avm_writedata(17),
      R => '0'
    );
\avm_writedata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[18]_i_1_n_0\,
      Q => avm_writedata(18),
      R => '0'
    );
\avm_writedata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[19]_i_1_n_0\,
      Q => avm_writedata(19),
      R => '0'
    );
\avm_writedata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[1]_i_1_n_0\,
      Q => avm_writedata(1),
      R => '0'
    );
\avm_writedata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[20]_i_1_n_0\,
      Q => avm_writedata(20),
      R => '0'
    );
\avm_writedata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[21]_i_1_n_0\,
      Q => avm_writedata(21),
      R => '0'
    );
\avm_writedata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[22]_i_1_n_0\,
      Q => avm_writedata(22),
      R => '0'
    );
\avm_writedata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[23]_i_1_n_0\,
      Q => avm_writedata(23),
      R => '0'
    );
\avm_writedata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[24]_i_1_n_0\,
      Q => avm_writedata(24),
      R => '0'
    );
\avm_writedata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[25]_i_1_n_0\,
      Q => avm_writedata(25),
      R => '0'
    );
\avm_writedata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[26]_i_1_n_0\,
      Q => avm_writedata(26),
      R => '0'
    );
\avm_writedata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[27]_i_1_n_0\,
      Q => avm_writedata(27),
      R => '0'
    );
\avm_writedata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[28]_i_1_n_0\,
      Q => avm_writedata(28),
      R => '0'
    );
\avm_writedata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[29]_i_1_n_0\,
      Q => avm_writedata(29),
      R => '0'
    );
\avm_writedata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[2]_i_1_n_0\,
      Q => avm_writedata(2),
      R => '0'
    );
\avm_writedata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[30]_i_1_n_0\,
      Q => avm_writedata(30),
      R => '0'
    );
\avm_writedata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[31]_i_2_n_0\,
      Q => avm_writedata(31),
      R => '0'
    );
\avm_writedata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[3]_i_1_n_0\,
      Q => avm_writedata(3),
      R => '0'
    );
\avm_writedata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[4]_i_1_n_0\,
      Q => avm_writedata(4),
      R => '0'
    );
\avm_writedata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[5]_i_1_n_0\,
      Q => avm_writedata(5),
      R => '0'
    );
\avm_writedata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[6]_i_1_n_0\,
      Q => avm_writedata(6),
      R => '0'
    );
\avm_writedata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[7]_i_1_n_0\,
      Q => avm_writedata(7),
      R => '0'
    );
\avm_writedata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[8]_i_1_n_0\,
      Q => avm_writedata(8),
      R => '0'
    );
\avm_writedata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \avm_writedata[31]_i_1_n_0\,
      D => \avm_writedata[9]_i_1_n_0\,
      Q => avm_writedata(9),
      R => '0'
    );
s_axi_arready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5555000355550000"
    )
        port map (
      I0 => s_axi_awready_i_3_n_0,
      I1 => \FSM_onehot_current_state_reg_n_0_[7]\,
      I2 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I3 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I4 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I5 => \^s_axi_arready\,
      O => s_axi_arready_i_1_n_0
    );
s_axi_arready_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_arready_i_1_n_0,
      Q => \^s_axi_arready\,
      R => s_axi_awready_i_1_n_0
    );
s_axi_awready_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => s_axi_awready_i_1_n_0
    );
s_axi_awready_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5500550355005500"
    )
        port map (
      I0 => s_axi_awready_i_3_n_0,
      I1 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I2 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I3 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I4 => \FSM_onehot_current_state_reg_n_0_[4]\,
      I5 => \^s_axi_awready\,
      O => s_axi_awready_i_2_n_0
    );
s_axi_awready_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAA8AAAA"
    )
        port map (
      I0 => avm_waitrequest,
      I1 => s_axi_awready_i_4_n_0,
      I2 => \tout_counter_reg__0\(6),
      I3 => \tout_counter_reg__0\(3),
      I4 => start_reg_n_0,
      I5 => \tout_counter_reg__0\(7),
      O => s_axi_awready_i_3_n_0
    );
s_axi_awready_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFEFF"
    )
        port map (
      I0 => \tout_counter_reg__0\(0),
      I1 => \tout_counter_reg__0\(1),
      I2 => \tout_counter_reg__0\(4),
      I3 => \tout_counter_reg__0\(8),
      I4 => \tout_counter_reg__0\(5),
      I5 => \tout_counter_reg__0\(2),
      O => s_axi_awready_i_4_n_0
    );
s_axi_awready_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_awready_i_2_n_0,
      Q => \^s_axi_awready\,
      R => s_axi_awready_i_1_n_0
    );
\s_axi_bresp[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000F7000000F400"
    )
        port map (
      I0 => \s_axi_bresp[1]_i_2_n_0\,
      I1 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I2 => p_1_in,
      I3 => s_axi_aresetn,
      I4 => done_write,
      I5 => \^s_axi_bresp\(0),
      O => \s_axi_bresp[1]_i_1_n_0\
    );
\s_axi_bresp[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8F"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^s_axi_rvalid\,
      I2 => avm_readdata_i,
      O => \s_axi_bresp[1]_i_2_n_0\
    );
\s_axi_bresp[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^s_axi_bvalid\,
      I1 => s_axi_bready,
      O => done_write
    );
\s_axi_bresp_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \s_axi_bresp[1]_i_1_n_0\,
      Q => \^s_axi_bresp\(0),
      R => '0'
    );
s_axi_bvalid_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7774"
    )
        port map (
      I0 => s_axi_bready,
      I1 => \^s_axi_bvalid\,
      I2 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I3 => p_1_in,
      O => s_axi_bvalid_i_1_n_0
    );
s_axi_bvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_bvalid_i_1_n_0,
      Q => \^s_axi_bvalid\,
      R => s_axi_awready_i_1_n_0
    );
\s_axi_rdata[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(0),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[0]_i_1_n_0\
    );
\s_axi_rdata[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(10),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[10]_i_1_n_0\
    );
\s_axi_rdata[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(11),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[11]_i_1_n_0\
    );
\s_axi_rdata[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(12),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[12]_i_1_n_0\
    );
\s_axi_rdata[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(13),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[13]_i_1_n_0\
    );
\s_axi_rdata[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(14),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[14]_i_1_n_0\
    );
\s_axi_rdata[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(15),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[15]_i_1_n_0\
    );
\s_axi_rdata[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(16),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[16]_i_1_n_0\
    );
\s_axi_rdata[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(17),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[17]_i_1_n_0\
    );
\s_axi_rdata[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(18),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[18]_i_1_n_0\
    );
\s_axi_rdata[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(19),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[19]_i_1_n_0\
    );
\s_axi_rdata[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(1),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[1]_i_1_n_0\
    );
\s_axi_rdata[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(20),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[20]_i_1_n_0\
    );
\s_axi_rdata[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(21),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[21]_i_1_n_0\
    );
\s_axi_rdata[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(22),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[22]_i_1_n_0\
    );
\s_axi_rdata[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(23),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[23]_i_1_n_0\
    );
\s_axi_rdata[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(24),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[24]_i_1_n_0\
    );
\s_axi_rdata[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(25),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[25]_i_1_n_0\
    );
\s_axi_rdata[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(26),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[26]_i_1_n_0\
    );
\s_axi_rdata[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(27),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[27]_i_1_n_0\
    );
\s_axi_rdata[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(28),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[28]_i_1_n_0\
    );
\s_axi_rdata[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(29),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[29]_i_1_n_0\
    );
\s_axi_rdata[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(2),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[2]_i_1_n_0\
    );
\s_axi_rdata[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(30),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[30]_i_1_n_0\
    );
\s_axi_rdata[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7770000FFFFFFFF"
    )
        port map (
      I0 => \^s_axi_rvalid\,
      I1 => s_axi_rready,
      I2 => avm_readdatavalid,
      I3 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I4 => avm_readdata_i,
      I5 => s_axi_aresetn,
      O => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF8F8F8"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^s_axi_rvalid\,
      I2 => avm_readdata_i,
      I3 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I4 => avm_readdatavalid,
      O => \s_axi_rdata[31]_i_2_n_0\
    );
\s_axi_rdata[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(31),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[31]_i_3_n_0\
    );
\s_axi_rdata[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(3),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[3]_i_1_n_0\
    );
\s_axi_rdata[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(4),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[4]_i_1_n_0\
    );
\s_axi_rdata[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(5),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[5]_i_1_n_0\
    );
\s_axi_rdata[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(6),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[6]_i_1_n_0\
    );
\s_axi_rdata[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(7),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[7]_i_1_n_0\
    );
\s_axi_rdata[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(8),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[8]_i_1_n_0\
    );
\s_axi_rdata[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"80AAAAAA80808080"
    )
        port map (
      I0 => avm_readdata(9),
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdatavalid,
      I3 => s_axi_rready,
      I4 => \^s_axi_rvalid\,
      I5 => avm_readdata_i,
      O => \s_axi_rdata[9]_i_1_n_0\
    );
\s_axi_rdata_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[0]_i_1_n_0\,
      Q => s_axi_rdata(0),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[10]_i_1_n_0\,
      Q => s_axi_rdata(10),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[11]_i_1_n_0\,
      Q => s_axi_rdata(11),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[12]_i_1_n_0\,
      Q => s_axi_rdata(12),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[13]_i_1_n_0\,
      Q => s_axi_rdata(13),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[14]_i_1_n_0\,
      Q => s_axi_rdata(14),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[15]_i_1_n_0\,
      Q => s_axi_rdata(15),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[16]_i_1_n_0\,
      Q => s_axi_rdata(16),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[17]_i_1_n_0\,
      Q => s_axi_rdata(17),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[18]_i_1_n_0\,
      Q => s_axi_rdata(18),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[19]_i_1_n_0\,
      Q => s_axi_rdata(19),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[1]_i_1_n_0\,
      Q => s_axi_rdata(1),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[20]_i_1_n_0\,
      Q => s_axi_rdata(20),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[21]_i_1_n_0\,
      Q => s_axi_rdata(21),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[22]_i_1_n_0\,
      Q => s_axi_rdata(22),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[23]_i_1_n_0\,
      Q => s_axi_rdata(23),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[24]_i_1_n_0\,
      Q => s_axi_rdata(24),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[25]_i_1_n_0\,
      Q => s_axi_rdata(25),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[26]_i_1_n_0\,
      Q => s_axi_rdata(26),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[27]_i_1_n_0\,
      Q => s_axi_rdata(27),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[28]_i_1_n_0\,
      Q => s_axi_rdata(28),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[29]_i_1_n_0\,
      Q => s_axi_rdata(29),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[2]_i_1_n_0\,
      Q => s_axi_rdata(2),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[30]_i_1_n_0\,
      Q => s_axi_rdata(30),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[31]_i_3_n_0\,
      Q => s_axi_rdata(31),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[3]_i_1_n_0\,
      Q => s_axi_rdata(3),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[4]_i_1_n_0\,
      Q => s_axi_rdata(4),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[5]_i_1_n_0\,
      Q => s_axi_rdata(5),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[6]_i_1_n_0\,
      Q => s_axi_rdata(6),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[7]_i_1_n_0\,
      Q => s_axi_rdata(7),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[8]_i_1_n_0\,
      Q => s_axi_rdata(8),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rdata_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => \s_axi_rdata[31]_i_2_n_0\,
      D => \s_axi_rdata[9]_i_1_n_0\,
      Q => s_axi_rdata(9),
      R => \s_axi_rdata[31]_i_1_n_0\
    );
\s_axi_rresp[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44F7444444F44444"
    )
        port map (
      I0 => \s_axi_rresp[1]_i_2_n_0\,
      I1 => avm_readdatavalid_i0,
      I2 => avm_readdata_i,
      I3 => done_read,
      I4 => s_axi_aresetn,
      I5 => \^s_axi_rresp\(0),
      O => \s_axi_rresp[1]_i_1_n_0\
    );
\s_axi_rresp[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D5FF"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => \^s_axi_bvalid\,
      I2 => s_axi_bready,
      I3 => p_1_in,
      O => \s_axi_rresp[1]_i_2_n_0\
    );
\s_axi_rresp[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I1 => avm_readdatavalid,
      O => avm_readdatavalid_i0
    );
\s_axi_rresp[1]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^s_axi_rvalid\,
      I1 => s_axi_rready,
      O => done_read
    );
\s_axi_rresp_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \s_axi_rresp[1]_i_1_n_0\,
      Q => \^s_axi_rresp\(0),
      R => '0'
    );
s_axi_rvalid_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF747474"
    )
        port map (
      I0 => s_axi_rready,
      I1 => \^s_axi_rvalid\,
      I2 => avm_readdata_i,
      I3 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I4 => avm_readdatavalid,
      O => s_axi_rvalid_i_1_n_0
    );
s_axi_rvalid_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_rvalid_i_1_n_0,
      Q => \^s_axi_rvalid\,
      R => s_axi_awready_i_1_n_0
    );
s_axi_wready_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5500550355005500"
    )
        port map (
      I0 => s_axi_awready_i_3_n_0,
      I1 => \FSM_onehot_current_state_reg_n_0_[3]\,
      I2 => \FSM_onehot_current_state_reg_n_0_[0]\,
      I3 => \FSM_onehot_current_state_reg_n_0_[2]\,
      I4 => \FSM_onehot_current_state_reg_n_0_[4]\,
      I5 => \^s_axi_wready\,
      O => s_axi_wready_i_1_n_0
    );
s_axi_wready_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_axi_wready_i_1_n_0,
      Q => \^s_axi_wready\,
      R => s_axi_awready_i_1_n_0
    );
start_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFCFFFFFEFC0000"
    )
        port map (
      I0 => s_axi_awready_i_3_n_0,
      I1 => start_i_2_n_0,
      I2 => start_i_3_n_0,
      I3 => start_i_4_n_0,
      I4 => start,
      I5 => start_reg_n_0,
      O => start_i_1_n_0
    );
start_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"70"
    )
        port map (
      I0 => \^s_axi_bvalid\,
      I1 => s_axi_bready,
      I2 => \FSM_onehot_current_state_reg_n_0_[3]\,
      O => start_i_2_n_0
    );
start_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FBFFFB00000000"
    )
        port map (
      I0 => s_axi_awready_i_4_n_0,
      I1 => \FSM_onehot_current_state[5]_i_5_n_0\,
      I2 => start_i_6_n_0,
      I3 => \^s_axi_rvalid\,
      I4 => s_axi_rready,
      I5 => \FSM_onehot_current_state_reg_n_0_[6]\,
      O => start_i_3_n_0
    );
start_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I1 => \FSM_onehot_current_state_reg_n_0_[2]\,
      O => start_i_4_n_0
    );
start_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAAA"
    )
        port map (
      I0 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I1 => avm_readdata_i,
      I2 => s_axi_rready,
      I3 => \^s_axi_rvalid\,
      I4 => \FSM_onehot_current_state_reg_n_0_[1]\,
      I5 => \FSM_onehot_current_state[6]_i_2_n_0\,
      O => start
    );
start_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => avm_readdatavalid,
      I1 => \FSM_onehot_current_state_reg_n_0_[6]\,
      I2 => avm_readdata_i,
      O => start_i_6_n_0
    );
start_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => start_i_1_n_0,
      Q => start_reg_n_0,
      R => s_axi_awready_i_1_n_0
    );
\tout_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \tout_counter_reg__0\(0),
      O => p_0_in(0)
    );
\tout_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \tout_counter_reg__0\(1),
      I1 => \tout_counter_reg__0\(0),
      O => p_0_in(1)
    );
\tout_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \tout_counter_reg__0\(2),
      I1 => \tout_counter_reg__0\(1),
      I2 => \tout_counter_reg__0\(0),
      O => p_0_in(2)
    );
\tout_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \tout_counter_reg__0\(0),
      I1 => \tout_counter_reg__0\(1),
      I2 => \tout_counter_reg__0\(2),
      I3 => \tout_counter_reg__0\(3),
      O => p_0_in(3)
    );
\tout_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \tout_counter_reg__0\(4),
      I1 => \tout_counter_reg__0\(0),
      I2 => \tout_counter_reg__0\(1),
      I3 => \tout_counter_reg__0\(2),
      I4 => \tout_counter_reg__0\(3),
      O => p_0_in(4)
    );
\tout_counter[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \tout_counter_reg__0\(5),
      I1 => \tout_counter_reg__0\(3),
      I2 => \tout_counter_reg__0\(2),
      I3 => \tout_counter_reg__0\(1),
      I4 => \tout_counter_reg__0\(0),
      I5 => \tout_counter_reg__0\(4),
      O => p_0_in(5)
    );
\tout_counter[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \tout_counter_reg__0\(6),
      I1 => \tout_counter_reg__0\(4),
      I2 => \tout_counter[8]_i_3_n_0\,
      I3 => \tout_counter_reg__0\(5),
      O => p_0_in(6)
    );
\tout_counter[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \tout_counter_reg__0\(7),
      I1 => \tout_counter_reg__0\(5),
      I2 => \tout_counter[8]_i_3_n_0\,
      I3 => \tout_counter_reg__0\(4),
      I4 => \tout_counter_reg__0\(6),
      O => p_0_in(7)
    );
\tout_counter[8]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => start_reg_n_0,
      O => clear
    );
\tout_counter[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \tout_counter_reg__0\(8),
      I1 => \tout_counter_reg__0\(6),
      I2 => \tout_counter_reg__0\(4),
      I3 => \tout_counter[8]_i_3_n_0\,
      I4 => \tout_counter_reg__0\(5),
      I5 => \tout_counter_reg__0\(7),
      O => p_0_in(8)
    );
\tout_counter[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \tout_counter_reg__0\(3),
      I1 => \tout_counter_reg__0\(2),
      I2 => \tout_counter_reg__0\(1),
      I3 => \tout_counter_reg__0\(0),
      O => \tout_counter[8]_i_3_n_0\
    );
\tout_counter_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_in(0),
      Q => \tout_counter_reg__0\(0),
      S => clear
    );
\tout_counter_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_in(1),
      Q => \tout_counter_reg__0\(1),
      R => clear
    );
\tout_counter_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_in(2),
      Q => \tout_counter_reg__0\(2),
      R => clear
    );
\tout_counter_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_in(3),
      Q => \tout_counter_reg__0\(3),
      R => clear
    );
\tout_counter_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_in(4),
      Q => \tout_counter_reg__0\(4),
      R => clear
    );
\tout_counter_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_in(5),
      Q => \tout_counter_reg__0\(5),
      R => clear
    );
\tout_counter_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_in(6),
      Q => \tout_counter_reg__0\(6),
      R => clear
    );
\tout_counter_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_in(7),
      Q => \tout_counter_reg__0\(7),
      R => clear
    );
\tout_counter_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_0_in(8),
      Q => \tout_counter_reg__0\(8),
      R => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wlast : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rlast : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    avm_address : out STD_LOGIC_VECTOR ( 31 downto 0 );
    avm_write : out STD_LOGIC;
    avm_read : out STD_LOGIC;
    avm_byteenable : out STD_LOGIC_VECTOR ( 3 downto 0 );
    avm_writedata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    avm_readdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    avm_resp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    avm_readdatavalid : in STD_LOGIC;
    avm_burstcount : out STD_LOGIC_VECTOR ( 0 to 0 );
    avm_beginbursttransfer : out STD_LOGIC;
    avm_writeresponsevalid : in STD_LOGIC;
    avm_waitrequest : in STD_LOGIC
  );
  attribute All_zero : string;
  attribute All_zero of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "1'b0";
  attribute C_ADDRESS_MODE : integer;
  attribute C_ADDRESS_MODE of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 1;
  attribute C_AVM_BURST_WIDTH : integer;
  attribute C_AVM_BURST_WIDTH of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 1;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 1;
  attribute C_BASE1_ADDR : string;
  attribute C_BASE1_ADDR of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "64'b0000000000000000000000000000000000000000000000000000000000000000";
  attribute C_BASE2_ADDR : string;
  attribute C_BASE2_ADDR of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "64'b0000000000000000000000000000000000000000000000000000000000000100";
  attribute C_BASE3_ADDR : string;
  attribute C_BASE3_ADDR of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "64'b0000000000000000000000000000000000000000000000000000000000001000";
  attribute C_BASE4_ADDR : string;
  attribute C_BASE4_ADDR of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "64'b0000000000000000000000000000000000000000000000000000000000001100";
  attribute C_BURST_LENGTH : integer;
  attribute C_BURST_LENGTH of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 4;
  attribute C_DPHASE_TIMEOUT : integer;
  attribute C_DPHASE_TIMEOUT of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 256;
  attribute C_FAMILY : string;
  attribute C_FAMILY of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "zynq";
  attribute C_FIXED_READ_WAIT : integer;
  attribute C_FIXED_READ_WAIT of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 1;
  attribute C_FIXED_WRITE_WAIT : integer;
  attribute C_FIXED_WRITE_WAIT of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 1;
  attribute C_HAS_FIXED_READ_LATENCY : integer;
  attribute C_HAS_FIXED_READ_LATENCY of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 0;
  attribute C_HAS_FIXED_WAIT : integer;
  attribute C_HAS_FIXED_WAIT of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 0;
  attribute C_HAS_RESPONSE : integer;
  attribute C_HAS_RESPONSE of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 0;
  attribute C_HIGH1_ADDR : string;
  attribute C_HIGH1_ADDR of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "64'b0000000000000000000000000000000000000000000000000000000000000011";
  attribute C_HIGH2_ADDR : string;
  attribute C_HIGH2_ADDR of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "64'b0000000000000000000000000000000000000000000000000000000000000101";
  attribute C_HIGH3_ADDR : string;
  attribute C_HIGH3_ADDR of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "64'b0000000000000000000000000000000000000000000000000000000000001001";
  attribute C_HIGH4_ADDR : string;
  attribute C_HIGH4_ADDR of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "64'b0000000000000000000000000000000000000000000000000000000000001111";
  attribute C_NUM_ADDRESS_RANGES : integer;
  attribute C_NUM_ADDRESS_RANGES of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 0;
  attribute C_NUM_OUTSTANDING : integer;
  attribute C_NUM_OUTSTANDING of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 2;
  attribute C_PROTOCOL : integer;
  attribute C_PROTOCOL of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 0;
  attribute C_READ_LATENCY : integer;
  attribute C_READ_LATENCY of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 1;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 32;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 32;
  attribute C_S_AXI_ID_WIDTH : integer;
  attribute C_S_AXI_ID_WIDTH of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 4;
  attribute C_USE_WSTRB : integer;
  attribute C_USE_WSTRB of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is 0;
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "yes";
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top : entity is "axi_amm_bridge_v1_0_5_top";
end ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top;

architecture STRUCTURE of ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^avm_address\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_rresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
begin
  avm_address(31) <= \<const0>\;
  avm_address(30) <= \<const0>\;
  avm_address(29 downto 0) <= \^avm_address\(29 downto 0);
  avm_burstcount(0) <= \<const1>\;
  s_axi_bid(3) <= \<const0>\;
  s_axi_bid(2) <= \<const0>\;
  s_axi_bid(1) <= \<const0>\;
  s_axi_bid(0) <= \<const0>\;
  s_axi_bresp(1) <= \^s_axi_bresp\(1);
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rid(3) <= \<const0>\;
  s_axi_rid(2) <= \<const0>\;
  s_axi_rid(1) <= \<const0>\;
  s_axi_rid(0) <= \<const0>\;
  s_axi_rlast <= \<const0>\;
  s_axi_rresp(1) <= \^s_axi_rresp\(1);
  s_axi_rresp(0) <= \<const0>\;
\AXI_LITE.I_AVA_MASTER_LITE\: entity work.ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_lite
     port map (
      avm_address(29 downto 0) => \^avm_address\(29 downto 0),
      avm_beginbursttransfer => avm_beginbursttransfer,
      avm_byteenable(3 downto 0) => avm_byteenable(3 downto 0),
      avm_read => avm_read,
      avm_readdata(31 downto 0) => avm_readdata(31 downto 0),
      avm_readdatavalid => avm_readdatavalid,
      avm_waitrequest => avm_waitrequest,
      avm_write => avm_write,
      avm_writedata(31 downto 0) => avm_writedata(31 downto 0),
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(29 downto 0) => s_axi_araddr(31 downto 2),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(29 downto 0) => s_axi_awaddr(31 downto 2),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => \^s_axi_bresp\(1),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => \^s_axi_rresp\(1),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZynqDesign_axi_amm_bridge_0_0 is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    avm_address : out STD_LOGIC_VECTOR ( 31 downto 0 );
    avm_write : out STD_LOGIC;
    avm_read : out STD_LOGIC;
    avm_writedata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    avm_readdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    avm_readdatavalid : in STD_LOGIC;
    avm_waitrequest : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ZynqDesign_axi_amm_bridge_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ZynqDesign_axi_amm_bridge_0_0 : entity is "ZynqDesign_axi_amm_bridge_0_0,axi_amm_bridge_v1_0_5_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ZynqDesign_axi_amm_bridge_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ZynqDesign_axi_amm_bridge_0_0 : entity is "axi_amm_bridge_v1_0_5_top,Vivado 2017.4";
end ZynqDesign_axi_amm_bridge_0_0;

architecture STRUCTURE of ZynqDesign_axi_amm_bridge_0_0 is
  signal NLW_inst_avm_beginbursttransfer_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axi_rlast_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_avm_burstcount_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_avm_byteenable_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_s_axi_bid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_s_axi_rid_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute All_zero : string;
  attribute All_zero of inst : label is "1'b0";
  attribute C_ADDRESS_MODE : integer;
  attribute C_ADDRESS_MODE of inst : label is 1;
  attribute C_AVM_BURST_WIDTH : integer;
  attribute C_AVM_BURST_WIDTH of inst : label is 1;
  attribute C_AXI_LOCK_WIDTH : integer;
  attribute C_AXI_LOCK_WIDTH of inst : label is 1;
  attribute C_BASE1_ADDR : string;
  attribute C_BASE1_ADDR of inst : label is "64'b0000000000000000000000000000000000000000000000000000000000000000";
  attribute C_BASE2_ADDR : string;
  attribute C_BASE2_ADDR of inst : label is "64'b0000000000000000000000000000000000000000000000000000000000000100";
  attribute C_BASE3_ADDR : string;
  attribute C_BASE3_ADDR of inst : label is "64'b0000000000000000000000000000000000000000000000000000000000001000";
  attribute C_BASE4_ADDR : string;
  attribute C_BASE4_ADDR of inst : label is "64'b0000000000000000000000000000000000000000000000000000000000001100";
  attribute C_BURST_LENGTH : integer;
  attribute C_BURST_LENGTH of inst : label is 4;
  attribute C_DPHASE_TIMEOUT : integer;
  attribute C_DPHASE_TIMEOUT of inst : label is 256;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "zynq";
  attribute C_FIXED_READ_WAIT : integer;
  attribute C_FIXED_READ_WAIT of inst : label is 1;
  attribute C_FIXED_WRITE_WAIT : integer;
  attribute C_FIXED_WRITE_WAIT of inst : label is 1;
  attribute C_HAS_FIXED_READ_LATENCY : integer;
  attribute C_HAS_FIXED_READ_LATENCY of inst : label is 0;
  attribute C_HAS_FIXED_WAIT : integer;
  attribute C_HAS_FIXED_WAIT of inst : label is 0;
  attribute C_HAS_RESPONSE : integer;
  attribute C_HAS_RESPONSE of inst : label is 0;
  attribute C_HIGH1_ADDR : string;
  attribute C_HIGH1_ADDR of inst : label is "64'b0000000000000000000000000000000000000000000000000000000000000011";
  attribute C_HIGH2_ADDR : string;
  attribute C_HIGH2_ADDR of inst : label is "64'b0000000000000000000000000000000000000000000000000000000000000101";
  attribute C_HIGH3_ADDR : string;
  attribute C_HIGH3_ADDR of inst : label is "64'b0000000000000000000000000000000000000000000000000000000000001001";
  attribute C_HIGH4_ADDR : string;
  attribute C_HIGH4_ADDR of inst : label is "64'b0000000000000000000000000000000000000000000000000000000000001111";
  attribute C_NUM_ADDRESS_RANGES : integer;
  attribute C_NUM_ADDRESS_RANGES of inst : label is 0;
  attribute C_NUM_OUTSTANDING : integer;
  attribute C_NUM_OUTSTANDING of inst : label is 2;
  attribute C_PROTOCOL : integer;
  attribute C_PROTOCOL of inst : label is 0;
  attribute C_READ_LATENCY : integer;
  attribute C_READ_LATENCY of inst : label is 1;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of inst : label is 32;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of inst : label is 32;
  attribute C_S_AXI_ID_WIDTH : integer;
  attribute C_S_AXI_ID_WIDTH of inst : label is 4;
  attribute C_USE_WSTRB : integer;
  attribute C_USE_WSTRB of inst : label is 0;
  attribute DowngradeIPIdentifiedWarnings of inst : label is "yes";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of avm_read : signal is "xilinx.com:interface:avalon:1.0 M_AVALON READ";
  attribute X_INTERFACE_INFO of avm_readdatavalid : signal is "xilinx.com:interface:avalon:1.0 M_AVALON READDATAVALID";
  attribute X_INTERFACE_INFO of avm_waitrequest : signal is "xilinx.com:interface:avalon:1.0 M_AVALON WAITREQUEST";
  attribute X_INTERFACE_INFO of avm_write : signal is "xilinx.com:interface:avalon:1.0 M_AVALON WRITE";
  attribute X_INTERFACE_INFO of s_axi_aclk : signal is "xilinx.com:signal:clock:1.0 s_axi_aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_axi_aclk : signal is "XIL_INTERFACENAME s_axi_aclk, ASSOCIATED_BUSIF S_AXI_LITE:S_AXI_FULL:M_AVALON, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 125000000, PHASE 0.000, CLK_DOMAIN ZynqDesign_CLOCK_PL";
  attribute X_INTERFACE_INFO of s_axi_aresetn : signal is "xilinx.com:signal:reset:1.0 s_axi_aresetn RST";
  attribute X_INTERFACE_PARAMETER of s_axi_aresetn : signal is "XIL_INTERFACENAME s_axi_aresetn, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARREADY";
  attribute X_INTERFACE_INFO of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARVALID";
  attribute X_INTERFACE_INFO of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWREADY";
  attribute X_INTERFACE_INFO of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWVALID";
  attribute X_INTERFACE_INFO of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE BREADY";
  attribute X_INTERFACE_INFO of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE BVALID";
  attribute X_INTERFACE_INFO of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE RREADY";
  attribute X_INTERFACE_PARAMETER of s_axi_rready : signal is "XIL_INTERFACENAME S_AXI_LITE, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 125000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN ZynqDesign_CLOCK_PL, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0";
  attribute X_INTERFACE_INFO of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE RVALID";
  attribute X_INTERFACE_INFO of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE WREADY";
  attribute X_INTERFACE_INFO of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE WVALID";
  attribute X_INTERFACE_INFO of avm_address : signal is "xilinx.com:interface:avalon:1.0 M_AVALON ADDRESS";
  attribute X_INTERFACE_INFO of avm_readdata : signal is "xilinx.com:interface:avalon:1.0 M_AVALON READDATA";
  attribute X_INTERFACE_INFO of avm_writedata : signal is "xilinx.com:interface:avalon:1.0 M_AVALON WRITEDATA";
  attribute X_INTERFACE_INFO of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE ARADDR";
  attribute X_INTERFACE_INFO of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE AWADDR";
  attribute X_INTERFACE_INFO of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE BRESP";
  attribute X_INTERFACE_INFO of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE RDATA";
  attribute X_INTERFACE_INFO of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE RRESP";
  attribute X_INTERFACE_INFO of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE WDATA";
  attribute X_INTERFACE_INFO of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 S_AXI_LITE WSTRB";
begin
inst: entity work.ZynqDesign_axi_amm_bridge_0_0_axi_amm_bridge_v1_0_5_top
     port map (
      avm_address(31 downto 0) => avm_address(31 downto 0),
      avm_beginbursttransfer => NLW_inst_avm_beginbursttransfer_UNCONNECTED,
      avm_burstcount(0) => NLW_inst_avm_burstcount_UNCONNECTED(0),
      avm_byteenable(3 downto 0) => NLW_inst_avm_byteenable_UNCONNECTED(3 downto 0),
      avm_read => avm_read,
      avm_readdata(31 downto 0) => avm_readdata(31 downto 0),
      avm_readdatavalid => avm_readdatavalid,
      avm_resp(1 downto 0) => B"00",
      avm_waitrequest => avm_waitrequest,
      avm_write => avm_write,
      avm_writedata(31 downto 0) => avm_writedata(31 downto 0),
      avm_writeresponsevalid => '0',
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(31 downto 0) => s_axi_araddr(31 downto 0),
      s_axi_arburst(1 downto 0) => B"00",
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arid(3 downto 0) => B"0000",
      s_axi_arlen(7 downto 0) => B"00000000",
      s_axi_arready => s_axi_arready,
      s_axi_arsize(2 downto 0) => B"000",
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(31 downto 0) => s_axi_awaddr(31 downto 0),
      s_axi_awburst(1 downto 0) => B"00",
      s_axi_awid(3 downto 0) => B"0000",
      s_axi_awlen(7 downto 0) => B"00000000",
      s_axi_awready => s_axi_awready,
      s_axi_awsize(2 downto 0) => B"000",
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bid(3 downto 0) => NLW_inst_s_axi_bid_UNCONNECTED(3 downto 0),
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rid(3 downto 0) => NLW_inst_s_axi_rid_UNCONNECTED(3 downto 0),
      s_axi_rlast => NLW_inst_s_axi_rlast_UNCONNECTED,
      s_axi_rready => s_axi_rready,
      s_axi_rresp(1 downto 0) => s_axi_rresp(1 downto 0),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wlast => '0',
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid
    );
end STRUCTURE;
