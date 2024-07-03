-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Wed Jul  3 12:43:28 2024
-- Host        : Hraesvelgr running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Users/Owner/Documents/GitHub/R76Firmware/r5560_sdk/NaI_array_spectra/V2/retarget/output/killspectra/killspectra.srcs/sources_1/ip/main_clock/main_clock_sim_netlist.vhdl
-- Design      : main_clock
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z030fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity main_clockmain_clock_clk_wiz is
  port (
    clk_adc : in STD_LOGIC;
    clk_in_sel : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    clk_out4 : out STD_LOGIC;
    clk_out5 : out STD_LOGIC;
    clk_out6 : out STD_LOGIC;
    clk_out7 : out STD_LOGIC;
    reset : in STD_LOGIC;
    input_clk_stopped : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_board : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of main_clockmain_clock_clk_wiz : entity is "main_clock_clk_wiz";
end main_clockmain_clock_clk_wiz;

architecture STRUCTURE of main_clockmain_clock_clk_wiz is
  signal clk_adc_main_clock : STD_LOGIC;
  signal clk_board_main_clock : STD_LOGIC;
  signal clk_out1_main_clock : STD_LOGIC;
  signal clk_out2_main_clock : STD_LOGIC;
  signal clk_out3_main_clock : STD_LOGIC;
  signal clk_out4_main_clock : STD_LOGIC;
  signal clk_out5_main_clock : STD_LOGIC;
  signal clk_out6_main_clock : STD_LOGIC;
  signal clk_out7_main_clock : STD_LOGIC;
  signal clkfbout_buf_main_clock : STD_LOGIC;
  signal clkfbout_main_clock : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin1_bufg : label is "PRIMITIVE";
  attribute BOX_TYPE of clkin2_bufg : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout3_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout4_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout5_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout6_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout7_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_main_clock,
      O => clkfbout_buf_main_clock
    );
clkin1_bufg: unisim.vcomponents.BUFG
     port map (
      I => clk_board,
      O => clk_board_main_clock
    );
clkin2_bufg: unisim.vcomponents.BUFG
     port map (
      I => clk_adc,
      O => clk_adc_main_clock
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out1_main_clock,
      O => clk_out1
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out2_main_clock,
      O => clk_out2
    );
clkout3_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out3_main_clock,
      O => clk_out3
    );
clkout4_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out4_main_clock,
      O => clk_out4
    );
clkout5_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out5_main_clock,
      O => clk_out5
    );
clkout6_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out6_main_clock,
      O => clk_out6
    );
clkout7_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_out7_main_clock,
      O => clk_out7
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 8.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 8.000000,
      CLKIN2_PERIOD => 8.000000,
      CLKOUT0_DIVIDE_F => 10.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 8,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 5,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 4,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 4,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 90.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 2,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 2,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 90.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "BUF_IN",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_main_clock,
      CLKFBOUT => clkfbout_main_clock,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_board_main_clock,
      CLKIN2 => clk_adc_main_clock,
      CLKINSEL => clk_in_sel,
      CLKINSTOPPED => input_clk_stopped,
      CLKOUT0 => clk_out1_main_clock,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => clk_out2_main_clock,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => clk_out3_main_clock,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => clk_out4_main_clock,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => clk_out5_main_clock,
      CLKOUT5 => clk_out6_main_clock,
      CLKOUT6 => clk_out7_main_clock,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity main_clock is
  port (
    clk_adc : in STD_LOGIC;
    clk_in_sel : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    clk_out3 : out STD_LOGIC;
    clk_out4 : out STD_LOGIC;
    clk_out5 : out STD_LOGIC;
    clk_out6 : out STD_LOGIC;
    clk_out7 : out STD_LOGIC;
    reset : in STD_LOGIC;
    input_clk_stopped : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_board : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of main_clock : entity is true;
end main_clock;

architecture STRUCTURE of main_clock is
begin
inst: entity work.main_clockmain_clock_clk_wiz
     port map (
      clk_adc => clk_adc,
      clk_board => clk_board,
      clk_in_sel => clk_in_sel,
      clk_out1 => clk_out1,
      clk_out2 => clk_out2,
      clk_out3 => clk_out3,
      clk_out4 => clk_out4,
      clk_out5 => clk_out5,
      clk_out6 => clk_out6,
      clk_out7 => clk_out7,
      input_clk_stopped => input_clk_stopped,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
