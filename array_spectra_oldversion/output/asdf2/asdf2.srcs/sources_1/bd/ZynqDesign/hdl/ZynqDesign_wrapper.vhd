--Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
--Date        : Mon Jul  8 12:28:59 2024
--Host        : PHYS-NC3124-D02 running 64-bit major release  (build 9200)
--Command     : generate_target ZynqDesign_wrapper.bd
--Design      : ZynqDesign_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZynqDesign_wrapper is
  port (
    BOARDPOSITION : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CLOCK_PL : in STD_LOGIC;
    CLOCK_RESET : out STD_LOGIC;
    CLOCK_SOURCE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_0_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_0_cas_n : inout STD_LOGIC;
    DDR_0_ck_n : inout STD_LOGIC;
    DDR_0_ck_p : inout STD_LOGIC;
    DDR_0_cke : inout STD_LOGIC;
    DDR_0_cs_n : inout STD_LOGIC;
    DDR_0_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_0_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_odt : inout STD_LOGIC;
    DDR_0_ras_n : inout STD_LOGIC;
    DDR_0_reset_n : inout STD_LOGIC;
    DDR_0_we_n : inout STD_LOGIC;
    FIXED_IO_0_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_0_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_0_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_0_ps_clk : inout STD_LOGIC;
    FIXED_IO_0_ps_porb : inout STD_LOGIC;
    FIXED_IO_0_ps_srstb : inout STD_LOGIC;
    FS_0_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    FS_0_tready : out STD_LOGIC;
    FS_0_tvalid : in STD_LOGIC;
    FW_RELEASE_DATE_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_STRING_0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    FW_VER_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    GT_REFCLK_0_clk_n : in STD_LOGIC;
    GT_REFCLK_0_clk_p : in STD_LOGIC;
    GT_RX_2_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_2_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_3_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_3_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_2_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_2_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_3_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_3_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    IIC_0_scl_io : inout STD_LOGIC;
    IIC_0_sda_io : inout STD_LOGIC;
    INVALID_EXT_CLK : in STD_LOGIC;
    LINK0_FIFO_IN_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    LINK0_FIFO_IN_tready : out STD_LOGIC;
    LINK0_FIFO_IN_tvalid : in STD_LOGIC;
    LINK0_FIFO_OUT_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    LINK0_FIFO_OUT_tready : in STD_LOGIC;
    LINK0_FIFO_OUT_tvalid : out STD_LOGIC;
    LINK0_RXCLK : out STD_LOGIC;
    LINK1_FIFO_IN_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    LINK1_FIFO_IN_tready : out STD_LOGIC;
    LINK1_FIFO_IN_tvalid : in STD_LOGIC;
    LINK1_FIFO_OUT_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    LINK1_FIFO_OUT_tready : in STD_LOGIC;
    LINK1_FIFO_OUT_tvalid : out STD_LOGIC;
    MAIN_CLOCK : out STD_LOGIC;
    MAIN_RESET : out STD_LOGIC_VECTOR ( 0 to 0 );
    M_AVALON_0_address : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AVALON_0_read : out STD_LOGIC;
    M_AVALON_0_readdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AVALON_0_readdatavalid : in STD_LOGIC;
    M_AVALON_0_waitrequest : in STD_LOGIC;
    M_AVALON_0_write : out STD_LOGIC;
    M_AVALON_0_writedata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    SIRcClock : in STD_LOGIC;
    SMADC_1_CSA_0 : out STD_LOGIC;
    SMADC_1_CSB_0 : out STD_LOGIC;
    SMADC_2_CSA_0 : out STD_LOGIC;
    SMADC_2_CSB_0 : out STD_LOGIC;
    SMADC_3_CSA_0 : out STD_LOGIC;
    SMADC_3_CSB_0 : out STD_LOGIC;
    SMADC_4_CSA_0 : out STD_LOGIC;
    SMADC_4_CSB_0 : out STD_LOGIC;
    SMADC_CLK_0 : out STD_LOGIC;
    SMADC_MOSI_0 : out STD_LOGIC;
    SPI_CLK_0 : out STD_LOGIC;
    SPI_CS_0 : out STD_LOGIC;
    SPI_MOSI_0_0 : out STD_LOGIC;
    SPI_MOSI_1_0 : out STD_LOGIC;
    cfg_abselector_0 : out STD_LOGIC;
    cfg_channel_selector_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_pulse_bitsleep_0 : out STD_LOGIC;
    cfg_selected_prw_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_serdes1_delay_0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    cfg_serdes1_delay_exc_0 : out STD_LOGIC;
    clock_source_commutator : out STD_LOGIC;
    serdes_reset_0 : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end ZynqDesign_wrapper;

architecture STRUCTURE of ZynqDesign_wrapper is
  component ZynqDesign is
  port (
    BOARDPOSITION : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CLOCK_PL : in STD_LOGIC;
    CLOCK_RESET : out STD_LOGIC;
    CLOCK_SOURCE : in STD_LOGIC_VECTOR ( 3 downto 0 );
    FW_RELEASE_DATE_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    FW_STRING_0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    FW_VER_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    INVALID_EXT_CLK : in STD_LOGIC;
    LINK0_RXCLK : out STD_LOGIC;
    MAIN_CLOCK : out STD_LOGIC;
    MAIN_RESET : out STD_LOGIC_VECTOR ( 0 to 0 );
    SIRcClock : in STD_LOGIC;
    SMADC_1_CSA_0 : out STD_LOGIC;
    SMADC_1_CSB_0 : out STD_LOGIC;
    SMADC_2_CSA_0 : out STD_LOGIC;
    SMADC_2_CSB_0 : out STD_LOGIC;
    SMADC_3_CSA_0 : out STD_LOGIC;
    SMADC_3_CSB_0 : out STD_LOGIC;
    SMADC_4_CSA_0 : out STD_LOGIC;
    SMADC_4_CSB_0 : out STD_LOGIC;
    SMADC_CLK_0 : out STD_LOGIC;
    SMADC_MOSI_0 : out STD_LOGIC;
    SPI_CLK_0 : out STD_LOGIC;
    SPI_CS_0 : out STD_LOGIC;
    SPI_MOSI_0_0 : out STD_LOGIC;
    SPI_MOSI_1_0 : out STD_LOGIC;
    cfg_abselector_0 : out STD_LOGIC;
    cfg_channel_selector_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_pulse_bitsleep_0 : out STD_LOGIC;
    cfg_selected_prw_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    cfg_serdes1_delay_0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    cfg_serdes1_delay_exc_0 : out STD_LOGIC;
    clock_source_commutator : out STD_LOGIC;
    serdes_reset_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    FS_0_tvalid : in STD_LOGIC;
    FS_0_tready : out STD_LOGIC;
    FS_0_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    GT_REFCLK_0_clk_n : in STD_LOGIC;
    GT_REFCLK_0_clk_p : in STD_LOGIC;
    GT_RX_3_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_3_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_2_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_2_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_2_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_2_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_3_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_3_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    LINK0_FIFO_IN_tvalid : in STD_LOGIC;
    LINK0_FIFO_IN_tready : out STD_LOGIC;
    LINK0_FIFO_IN_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    LINK1_FIFO_IN_tvalid : in STD_LOGIC;
    LINK1_FIFO_IN_tready : out STD_LOGIC;
    LINK1_FIFO_IN_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    M_AVALON_0_address : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AVALON_0_read : out STD_LOGIC;
    M_AVALON_0_readdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AVALON_0_readdatavalid : in STD_LOGIC;
    M_AVALON_0_waitrequest : in STD_LOGIC;
    M_AVALON_0_write : out STD_LOGIC;
    M_AVALON_0_writedata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IIC_0_scl_i : in STD_LOGIC;
    IIC_0_scl_o : out STD_LOGIC;
    IIC_0_scl_t : out STD_LOGIC;
    IIC_0_sda_i : in STD_LOGIC;
    IIC_0_sda_o : out STD_LOGIC;
    IIC_0_sda_t : out STD_LOGIC;
    LINK0_FIFO_OUT_tvalid : out STD_LOGIC;
    LINK0_FIFO_OUT_tready : in STD_LOGIC;
    LINK0_FIFO_OUT_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    LINK1_FIFO_OUT_tvalid : out STD_LOGIC;
    LINK1_FIFO_OUT_tready : in STD_LOGIC;
    LINK1_FIFO_OUT_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    DDR_0_cas_n : inout STD_LOGIC;
    DDR_0_cke : inout STD_LOGIC;
    DDR_0_ck_n : inout STD_LOGIC;
    DDR_0_ck_p : inout STD_LOGIC;
    DDR_0_cs_n : inout STD_LOGIC;
    DDR_0_reset_n : inout STD_LOGIC;
    DDR_0_odt : inout STD_LOGIC;
    DDR_0_ras_n : inout STD_LOGIC;
    DDR_0_we_n : inout STD_LOGIC;
    DDR_0_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_0_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_0_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_0_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_0_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_0_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_0_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_0_ps_srstb : inout STD_LOGIC;
    FIXED_IO_0_ps_clk : inout STD_LOGIC;
    FIXED_IO_0_ps_porb : inout STD_LOGIC
  );
  end component ZynqDesign;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal IIC_0_scl_i : STD_LOGIC;
  signal IIC_0_scl_o : STD_LOGIC;
  signal IIC_0_scl_t : STD_LOGIC;
  signal IIC_0_sda_i : STD_LOGIC;
  signal IIC_0_sda_o : STD_LOGIC;
  signal IIC_0_sda_t : STD_LOGIC;
begin
IIC_0_scl_iobuf: component IOBUF
     port map (
      I => IIC_0_scl_o,
      IO => IIC_0_scl_io,
      O => IIC_0_scl_i,
      T => IIC_0_scl_t
    );
IIC_0_sda_iobuf: component IOBUF
     port map (
      I => IIC_0_sda_o,
      IO => IIC_0_sda_io,
      O => IIC_0_sda_i,
      T => IIC_0_sda_t
    );
ZynqDesign_i: component ZynqDesign
     port map (
      BOARDPOSITION(1 downto 0) => BOARDPOSITION(1 downto 0),
      CLOCK_PL => CLOCK_PL,
      CLOCK_RESET => CLOCK_RESET,
      CLOCK_SOURCE(3 downto 0) => CLOCK_SOURCE(3 downto 0),
      DDR_0_addr(14 downto 0) => DDR_0_addr(14 downto 0),
      DDR_0_ba(2 downto 0) => DDR_0_ba(2 downto 0),
      DDR_0_cas_n => DDR_0_cas_n,
      DDR_0_ck_n => DDR_0_ck_n,
      DDR_0_ck_p => DDR_0_ck_p,
      DDR_0_cke => DDR_0_cke,
      DDR_0_cs_n => DDR_0_cs_n,
      DDR_0_dm(3 downto 0) => DDR_0_dm(3 downto 0),
      DDR_0_dq(31 downto 0) => DDR_0_dq(31 downto 0),
      DDR_0_dqs_n(3 downto 0) => DDR_0_dqs_n(3 downto 0),
      DDR_0_dqs_p(3 downto 0) => DDR_0_dqs_p(3 downto 0),
      DDR_0_odt => DDR_0_odt,
      DDR_0_ras_n => DDR_0_ras_n,
      DDR_0_reset_n => DDR_0_reset_n,
      DDR_0_we_n => DDR_0_we_n,
      FIXED_IO_0_ddr_vrn => FIXED_IO_0_ddr_vrn,
      FIXED_IO_0_ddr_vrp => FIXED_IO_0_ddr_vrp,
      FIXED_IO_0_mio(53 downto 0) => FIXED_IO_0_mio(53 downto 0),
      FIXED_IO_0_ps_clk => FIXED_IO_0_ps_clk,
      FIXED_IO_0_ps_porb => FIXED_IO_0_ps_porb,
      FIXED_IO_0_ps_srstb => FIXED_IO_0_ps_srstb,
      FS_0_tdata(63 downto 0) => FS_0_tdata(63 downto 0),
      FS_0_tready => FS_0_tready,
      FS_0_tvalid => FS_0_tvalid,
      FW_RELEASE_DATE_0(31 downto 0) => FW_RELEASE_DATE_0(31 downto 0),
      FW_STRING_0(127 downto 0) => FW_STRING_0(127 downto 0),
      FW_VER_0(31 downto 0) => FW_VER_0(31 downto 0),
      GT_REFCLK_0_clk_n => GT_REFCLK_0_clk_n,
      GT_REFCLK_0_clk_p => GT_REFCLK_0_clk_p,
      GT_RX_2_rxn(0) => GT_RX_2_rxn(0),
      GT_RX_2_rxp(0) => GT_RX_2_rxp(0),
      GT_RX_3_rxn(0) => GT_RX_3_rxn(0),
      GT_RX_3_rxp(0) => GT_RX_3_rxp(0),
      GT_TX_2_txn(0) => GT_TX_2_txn(0),
      GT_TX_2_txp(0) => GT_TX_2_txp(0),
      GT_TX_3_txn(0) => GT_TX_3_txn(0),
      GT_TX_3_txp(0) => GT_TX_3_txp(0),
      IIC_0_scl_i => IIC_0_scl_i,
      IIC_0_scl_o => IIC_0_scl_o,
      IIC_0_scl_t => IIC_0_scl_t,
      IIC_0_sda_i => IIC_0_sda_i,
      IIC_0_sda_o => IIC_0_sda_o,
      IIC_0_sda_t => IIC_0_sda_t,
      INVALID_EXT_CLK => INVALID_EXT_CLK,
      LINK0_FIFO_IN_tdata(63 downto 0) => LINK0_FIFO_IN_tdata(63 downto 0),
      LINK0_FIFO_IN_tready => LINK0_FIFO_IN_tready,
      LINK0_FIFO_IN_tvalid => LINK0_FIFO_IN_tvalid,
      LINK0_FIFO_OUT_tdata(63 downto 0) => LINK0_FIFO_OUT_tdata(63 downto 0),
      LINK0_FIFO_OUT_tready => LINK0_FIFO_OUT_tready,
      LINK0_FIFO_OUT_tvalid => LINK0_FIFO_OUT_tvalid,
      LINK0_RXCLK => LINK0_RXCLK,
      LINK1_FIFO_IN_tdata(63 downto 0) => LINK1_FIFO_IN_tdata(63 downto 0),
      LINK1_FIFO_IN_tready => LINK1_FIFO_IN_tready,
      LINK1_FIFO_IN_tvalid => LINK1_FIFO_IN_tvalid,
      LINK1_FIFO_OUT_tdata(63 downto 0) => LINK1_FIFO_OUT_tdata(63 downto 0),
      LINK1_FIFO_OUT_tready => LINK1_FIFO_OUT_tready,
      LINK1_FIFO_OUT_tvalid => LINK1_FIFO_OUT_tvalid,
      MAIN_CLOCK => MAIN_CLOCK,
      MAIN_RESET(0) => MAIN_RESET(0),
      M_AVALON_0_address(31 downto 0) => M_AVALON_0_address(31 downto 0),
      M_AVALON_0_read => M_AVALON_0_read,
      M_AVALON_0_readdata(31 downto 0) => M_AVALON_0_readdata(31 downto 0),
      M_AVALON_0_readdatavalid => M_AVALON_0_readdatavalid,
      M_AVALON_0_waitrequest => M_AVALON_0_waitrequest,
      M_AVALON_0_write => M_AVALON_0_write,
      M_AVALON_0_writedata(31 downto 0) => M_AVALON_0_writedata(31 downto 0),
      SIRcClock => SIRcClock,
      SMADC_1_CSA_0 => SMADC_1_CSA_0,
      SMADC_1_CSB_0 => SMADC_1_CSB_0,
      SMADC_2_CSA_0 => SMADC_2_CSA_0,
      SMADC_2_CSB_0 => SMADC_2_CSB_0,
      SMADC_3_CSA_0 => SMADC_3_CSA_0,
      SMADC_3_CSB_0 => SMADC_3_CSB_0,
      SMADC_4_CSA_0 => SMADC_4_CSA_0,
      SMADC_4_CSB_0 => SMADC_4_CSB_0,
      SMADC_CLK_0 => SMADC_CLK_0,
      SMADC_MOSI_0 => SMADC_MOSI_0,
      SPI_CLK_0 => SPI_CLK_0,
      SPI_CS_0 => SPI_CS_0,
      SPI_MOSI_0_0 => SPI_MOSI_0_0,
      SPI_MOSI_1_0 => SPI_MOSI_1_0,
      cfg_abselector_0 => cfg_abselector_0,
      cfg_channel_selector_0(7 downto 0) => cfg_channel_selector_0(7 downto 0),
      cfg_pulse_bitsleep_0 => cfg_pulse_bitsleep_0,
      cfg_selected_prw_0(15 downto 0) => cfg_selected_prw_0(15 downto 0),
      cfg_serdes1_delay_0(4 downto 0) => cfg_serdes1_delay_0(4 downto 0),
      cfg_serdes1_delay_exc_0 => cfg_serdes1_delay_exc_0,
      clock_source_commutator => clock_source_commutator,
      serdes_reset_0(7 downto 0) => serdes_reset_0(7 downto 0)
    );
end STRUCTURE;
