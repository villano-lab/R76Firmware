----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2019 11:30:54
-- Design Name: 
-- Module Name: top_project_name - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use ieee.math_real.all;
Library xpm;
use xpm.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity TOP_asdf is
 port (
 
   DDR_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
   DDR_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
   DDR_cas_n : inout STD_LOGIC;
   DDR_ck_n : inout STD_LOGIC;
   DDR_ck_p : inout STD_LOGIC;
   DDR_cke : inout STD_LOGIC;
   DDR_cs_n : inout STD_LOGIC;
   DDR_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
   DDR_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
   DDR_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
   DDR_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
   DDR_odt : inout STD_LOGIC;
   DDR_ras_n : inout STD_LOGIC;
   DDR_reset_n : inout STD_LOGIC;
   DDR_we_n : inout STD_LOGIC;
   FIXED_IO_ddr_vrn : inout STD_LOGIC;
   FIXED_IO_ddr_vrp : inout STD_LOGIC;
   FIXED_IO_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
   FIXED_IO_ps_clk : inout STD_LOGIC;
   FIXED_IO_ps_porb : inout STD_LOGIC;
   FIXED_IO_ps_srstb : inout STD_LOGIC;

    GT_REFCLK_0_clk_n : in STD_LOGIC;
    GT_REFCLK_0_clk_p : in STD_LOGIC;
    GT_RX_0_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_0_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_1_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_1_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    --GT_RX_2_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    --GT_RX_2_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    --GT_RX_3_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    --GT_RX_3_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );    
    GT_TX_0_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_0_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_1_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_1_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    --GT_TX_2_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    --GT_TX_2_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    --GT_TX_3_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    --GT_TX_3_txp : out STD_LOGIC_VECTOR ( 0 to 0 );

	

   sCLK_125 : in std_logic;
   sCLK_CH_SEL : out std_logic;
      
   ADC_SERVICE_CLK_OUT_P : out STD_LOGIC;
   ADC_SERVICE_CLK_OUT_N : out STD_LOGIC;
      
   ADC_1_CLK_A_P : in STD_LOGIC;
   ADC_1_CLK_A_N : in STD_LOGIC;
   ADC_1_CLK_B_P : in STD_LOGIC;
   ADC_1_CLK_B_N : in STD_LOGIC;
   
  
   ADC_1_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
   ADC_1_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
   
   ADC_1_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
   ADC_1_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);
   
   SMADC_1_CSA : out std_logic;
   SMADC_1_CSB : out std_logic;
   SMADC_1_CLK : out std_logic;
   SMADC_1_MOSI : out std_logic;
   SMADC_2_MOSI : out std_logic;
   SMADC_3_MOSI : out std_logic;
   SMADC_4_MOSI : out std_logic;
     
   
   ADC_2_CLK_A_P : in STD_LOGIC;
   ADC_2_CLK_A_N : in STD_LOGIC;
   ADC_2_CLK_B_P : in STD_LOGIC;
   ADC_2_CLK_B_N : in STD_LOGIC;
       
       
   ADC_2_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
   ADC_2_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
       
   ADC_2_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
   ADC_2_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);

   ADC_3_CLK_A_P : in STD_LOGIC;
   ADC_3_CLK_A_N : in STD_LOGIC;
   ADC_3_CLK_B_P : in STD_LOGIC;
   ADC_3_CLK_B_N : in STD_LOGIC;
       

       
   ADC_3_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
   ADC_3_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
       
   ADC_3_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
   ADC_3_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);

   
   
   ADC_4_CLK_A_P : in STD_LOGIC;
   ADC_4_CLK_A_N : in STD_LOGIC;
   ADC_4_CLK_B_P : in STD_LOGIC;
   ADC_4_CLK_B_N : in STD_LOGIC;
       

       
   ADC_4_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
   ADC_4_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
       
   ADC_4_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
   ADC_4_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);
   
   
   SYNC_0_INb : in STD_LOGIC;
   SYNC_0_OUTb : out STD_LOGIC;

   SYNC_1_INb : in STD_LOGIC;
   SYNC_1_OUTb : out STD_LOGIC;

   SYNC_2_INb : in STD_LOGIC;
   SYNC_2_OUTb : out STD_LOGIC;

   
   SFP_DISABLE1 : out std_logic;
   SFP_DISABLE2 : out std_logic;
   
      
   Si_ClkOut_p :  out std_logic;
   Si_ClkOut_n :  out std_logic;
   
   Si_ClkIn_p :  in std_logic;
   Si_ClkIn_n :  in std_logic;
   
   SLAVE_I2C_SCL_0 : inout STD_LOGIC;
   SLAVE_I2C_SDA_0 : inout STD_LOGIC;
   
   SPI_MOSI_0 : out STD_LOGIC;
   SPI_MOSI_1 : out STD_LOGIC;
   SPI_CLK : out STD_LOGIC;
   SPI_CS : out STD_LOGIC;
   BOARDPOSITION :  in STD_LOGIC_VECTOR ( 1 downto 0 )     
   
);
end TOP_asdf ;

architecture Behavioral of TOP_asdf is
component ZynqDesign_wrapper is
  port (
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


    
    GT_REFCLK_0_clk_n : in STD_LOGIC;
    GT_REFCLK_0_clk_p : in STD_LOGIC;
--    GT_RX_0_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
--    GT_RX_0_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
--    GT_RX_1_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
--    GT_RX_1_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_2_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_2_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_3_rxn : in STD_LOGIC_VECTOR ( 0 to 0 );
    GT_RX_3_rxp : in STD_LOGIC_VECTOR ( 0 to 0 );    
--    GT_TX_0_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
--    GT_TX_0_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
--    GT_TX_1_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
--    GT_TX_1_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_2_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_2_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_3_txn : out STD_LOGIC_VECTOR ( 0 to 0 );
    GT_TX_3_txp : out STD_LOGIC_VECTOR ( 0 to 0 );
    
      LINK0_FIFO_IN_tvalid : in STD_LOGIC;
      LINK0_FIFO_IN_tready : out STD_LOGIC;
      LINK0_FIFO_IN_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
      LINK0_FIFO_OUT_tvalid : out STD_LOGIC;
      LINK0_FIFO_OUT_tready : in STD_LOGIC;
      LINK0_FIFO_OUT_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
      LINK1_FIFO_IN_tvalid : in STD_LOGIC;
      LINK1_FIFO_IN_tready : out STD_LOGIC;
      LINK1_FIFO_IN_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
      LINK1_FIFO_OUT_tvalid : out STD_LOGIC;
      LINK1_FIFO_OUT_tready : in STD_LOGIC;
      LINK1_FIFO_OUT_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
        
    MAIN_CLOCK : out STD_LOGIC;
    MAIN_RESET : out STD_LOGIC_VECTOR ( 0 to 0 );
    
    M_AVALON_0_address : out STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AVALON_0_read : out STD_LOGIC;
    M_AVALON_0_readdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    M_AVALON_0_readdatavalid : in STD_LOGIC;
    M_AVALON_0_waitrequest : in STD_LOGIC;
    M_AVALON_0_write : out STD_LOGIC;
    M_AVALON_0_writedata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    
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
      cfg_abselector_0 : out STD_LOGIC;
      cfg_channel_selector_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
      cfg_pulse_bitsleep_0 : out STD_LOGIC;
      cfg_selected_prw_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
      cfg_serdes1_delay_0 : out STD_LOGIC_VECTOR ( 4 downto 0 );
      cfg_serdes1_delay_exc_0 : out STD_LOGIC;
      serdes_reset_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
      
      LINK0_RXCLK : out STD_LOGIC;
      SIRcClock : in STD_LOGIC;
      
      FW_VER_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
      FW_RELEASE_DATE_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
      FW_STRING_0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
      BOARDPOSITION : in STD_LOGIC_VECTOR ( 1 downto 0 );     
	  IIC_0_scl_io : inout STD_LOGIC;
      IIC_0_sda_io : inout STD_LOGIC;
      SPI_MOSI_0_0 : out STD_LOGIC;
      SPI_MOSI_1_0 : out STD_LOGIC;
      SPI_CLK_0 : out STD_LOGIC;
      SPI_CS_0 : out STD_LOGIC;
      CLOCK_SOURCE : in STD_LOGIC_VECTOR ( 3 downto 0 );
      CLOCK_PL : in STD_LOGIC;
      CLOCK_RESET : out STD_LOGIC;
      clock_source_commutator : out STD_LOGIC;
      INVALID_EXT_CLK : in STD_LOGIC

  );
end component;



component adcs_top_0 is
    Port (  
          sCLK_125 : in std_logic;
   
          ADC_SERVICE_CLK_OUT_P : out STD_LOGIC;
          ADC_SERVICE_CLK_OUT_N : out STD_LOGIC;
          
          
          ADC_1_CLK_A_P : in STD_LOGIC;
          ADC_1_CLK_A_N : in STD_LOGIC;
          ADC_1_CLK_B_P : in STD_LOGIC;
          ADC_1_CLK_B_N : in STD_LOGIC;
          
          ADC_1_FRAME_A_P : in STD_LOGIC;
          ADC_1_FRAME_A_N : in STD_LOGIC;
          ADC_1_FRAME_B_P : in STD_LOGIC;
          ADC_1_FRAME_B_N : in STD_LOGIC;
          
          ADC_1_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
          ADC_1_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
          
          ADC_1_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
          ADC_1_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);
          
          SMADC_1_CSA : out std_logic;
          SMADC_1_CSB : out std_logic;
          SMADC_1_CLK : out std_logic;
          SMADC_1_MOSI : out std_logic;
          
          
          
          ADC_2_CLK_A_P : in STD_LOGIC;
          ADC_2_CLK_A_N : in STD_LOGIC;
          ADC_2_CLK_B_P : in STD_LOGIC;
          ADC_2_CLK_B_N : in STD_LOGIC;
              
          ADC_2_FRAME_A_P : in STD_LOGIC;
          ADC_2_FRAME_A_N : in STD_LOGIC;
          ADC_2_FRAME_B_P : in STD_LOGIC;
          ADC_2_FRAME_B_N : in STD_LOGIC;
              
          ADC_2_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
          ADC_2_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
              
          ADC_2_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
          ADC_2_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);
          
          SMADC_2_CSA : out std_logic;
          SMADC_2_CSB : out std_logic;
          
          
          
          ADC_3_CLK_A_P : in STD_LOGIC;
          ADC_3_CLK_A_N : in STD_LOGIC;
          ADC_3_CLK_B_P : in STD_LOGIC;
          ADC_3_CLK_B_N : in STD_LOGIC;
              
          ADC_3_FRAME_A_P : in STD_LOGIC;
          ADC_3_FRAME_A_N : in STD_LOGIC;
          ADC_3_FRAME_B_P : in STD_LOGIC;
          ADC_3_FRAME_B_N : in STD_LOGIC;
              
          ADC_3_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
          ADC_3_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
              
          ADC_3_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
          ADC_3_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);
          
          SMADC_3_CSA : out std_logic;
          SMADC_3_CSB : out std_logic;

          
          ADC_4_CLK_A_P : in STD_LOGIC;
          ADC_4_CLK_A_N : in STD_LOGIC;
          ADC_4_CLK_B_P : in STD_LOGIC;
          ADC_4_CLK_B_N : in STD_LOGIC;
              
          ADC_4_FRAME_A_P : in STD_LOGIC;
          ADC_4_FRAME_A_N : in STD_LOGIC;
          ADC_4_FRAME_B_P : in STD_LOGIC;
          ADC_4_FRAME_B_N : in STD_LOGIC;
              
          ADC_4_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
          ADC_4_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
              
          ADC_4_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
          ADC_4_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);
          
          SMADC_4_CSA : out std_logic;
          SMADC_4_CSB : out std_logic;
          
          READOUT_CLK : in STD_LOGIC;
	      READOUT_CLK_OUT : out STD_LOGIC;
          
          CH0 : out std_logic_vector (15 downto 0);
          CH1 : out std_logic_vector (15 downto 0);
          CH2 : out std_logic_vector (15 downto 0);
          CH3 : out std_logic_vector (15 downto 0);                                            
          CH4 : out std_logic_vector (15 downto 0);
          CH5 : out std_logic_vector (15 downto 0);
          CH6 : out std_logic_vector (15 downto 0);
          CH7 : out std_logic_vector (15 downto 0);
          CH8 : out std_logic_vector (15 downto 0);                                                                                     
          CH9 : out std_logic_vector (15 downto 0);
          CH10 : out std_logic_vector (15 downto 0);
          CH11 : out std_logic_vector (15 downto 0);
          CH12 : out std_logic_vector (15 downto 0);
          CH13 : out std_logic_vector (15 downto 0);
          CH14 : out std_logic_vector (15 downto 0);
          CH15 : out std_logic_vector (15 downto 0);
          CH16 : out std_logic_vector (15 downto 0);
          CH17 : out std_logic_vector (15 downto 0);
          CH18 : out std_logic_vector (15 downto 0);
          CH19 : out std_logic_vector (15 downto 0);
          CH20 : out std_logic_vector (15 downto 0);
          CH21 : out std_logic_vector (15 downto 0);
          CH22 : out std_logic_vector (15 downto 0);
          CH23 : out std_logic_vector (15 downto 0);
          CH24 : out std_logic_vector (15 downto 0);
          CH25 : out std_logic_vector (15 downto 0);
          CH26 : out std_logic_vector (15 downto 0);
          CH27 : out std_logic_vector (15 downto 0);
          CH28 : out std_logic_vector (15 downto 0);
          CH29 : out std_logic_vector (15 downto 0);
          CH30 : out std_logic_vector (15 downto 0);
          CH31 : out std_logic_vector (15 downto 0);
          
          CHv0_7 : out STD_LOGIC;
          CHv8_15 : out STD_LOGIC;
          CHv16_23 : out STD_LOGIC;
          CHv24_31 : out STD_LOGIC;
          
          cfg_serdes1_delay : in std_logic_vector(5-1 downto 0);
          cfg_serdes1_delay_exc : in std_logic;
          cfg_pulse_bitsleep : in std_logic;
          cfg_abselector : in std_logic;                  
          cfg_channel_selector : in std_logic_vector(7 downto 0);
          cfg_selected_prw : out std_logic_vector(15 downto 0);
          serdes_reset_0 : in STD_LOGIC_VECTOR ( 7 downto 0 )
    
          );
end component;



component avalon_wrapper is
    Generic (M_AVALON_BA : STD_LOGIC_VECTOR (31 downto 0) := x"10000000");
    Port (  clk : in STD_LOGIC;
            reset : in STD_LOGIC;
            M_AVALON_0_address : in  STD_LOGIC_VECTOR ( 31 downto 0 );
            M_AVALON_0_read : in STD_LOGIC;
            M_AVALON_0_readdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
            M_AVALON_0_readdatavalid : out  STD_LOGIC;
            M_AVALON_0_waitrequest : out STD_LOGIC;
            M_AVALON_0_write : in STD_LOGIC;
            M_AVALON_0_writedata : in STD_LOGIC_VECTOR ( 31 downto 0 );
     
    
			--test
            BUS_Test_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0);
            BUS_Test_0_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
            BUS_Test_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
            BUS_Test_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
            BUS_Test_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
            BUS_Test_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0);               

            -- Register interface          
		REG_pol_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_pol_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_pol_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_pol_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_hithrs_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_hithrs_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_hithrs_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_hithrs_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_lothrsh_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_lothrsh_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_lothrsh_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_lothrsh_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_inhib_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_inhib_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_inhib_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_inhib_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_gatel_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_gatel_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_gatel_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_gatel_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_gateu_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_gateu_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_gateu_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_gateu_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_delay_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_delay_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_delay_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_delay_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_xdelay_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_xdelay_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_xdelay_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_xdelay_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_inttime_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_inttime_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_inttime_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_inttime_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_preint_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_preint_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_preint_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_preint_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_pileup_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_pileup_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_pileup_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_pileup_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_gain_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_gain_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_gain_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_gain_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_ofs_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_ofs_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_ofs_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_ofs_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_bl_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_bl_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_bl_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_bl_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_CH_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_0_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_0_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_0_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_0_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_0_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_0_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_0_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_0_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_0_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_0_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_0_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_0_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_0_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_UNIQUE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_UNIQUE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
	

            REG_FIRMWARE_UNIQUE : IN STD_LOGIC_VECTOR(31 downto 0);
            REG_FIRMWARE_BUILD : IN STD_LOGIC_VECTOR(31 downto 0)    
    );
end component;

    attribute keep            : string;
    
    signal CHA0 :  std_logic_vector (15 downto 0);
    signal CHA1 :  std_logic_vector (15 downto 0);
    signal CHA2 :  std_logic_vector (15 downto 0);
    signal CHA3 :  std_logic_vector (15 downto 0);                                            
    signal CHA4 :  std_logic_vector (15 downto 0);
    signal CHA5 :  std_logic_vector (15 downto 0);
    signal CHA6 :  std_logic_vector (15 downto 0);
    signal CHA7 :  std_logic_vector (15 downto 0);
    signal CHA8 :  std_logic_vector (15 downto 0);                                                                                     
    signal CHA9 :  std_logic_vector (15 downto 0);
    signal CHA10 :  std_logic_vector (15 downto 0);
    signal CHA11 :  std_logic_vector (15 downto 0);
    signal CHA12 :  std_logic_vector (15 downto 0);
    signal CHA13 :  std_logic_vector (15 downto 0);
    signal CHA14 :  std_logic_vector (15 downto 0);
    signal CHA15 :  std_logic_vector (15 downto 0);
    signal CHA16 :  std_logic_vector (15 downto 0);
    signal CHA17 :  std_logic_vector (15 downto 0);
    signal CHA18 :  std_logic_vector (15 downto 0);
    signal CHA19 :  std_logic_vector (15 downto 0);
    signal CHA20 :  std_logic_vector (15 downto 0);
    signal CHA21 :  std_logic_vector (15 downto 0);
    signal CHA22 :  std_logic_vector (15 downto 0);
    signal CHA23 :  std_logic_vector (15 downto 0);
    signal CHA24 :  std_logic_vector (15 downto 0);
    signal CHA25 :  std_logic_vector (15 downto 0);
    signal CHA26 :  std_logic_vector (15 downto 0);
    signal CHA27 :  std_logic_vector (15 downto 0);
    signal CHA28 :  std_logic_vector (15 downto 0);
    signal CHA29 :  std_logic_vector (15 downto 0);
    signal CHA30 :  std_logic_vector (15 downto 0);
    signal CHA31 :  std_logic_vector (15 downto 0);
    
	
	
    signal CH0 :  std_logic_vector (15 downto 0);
    signal CH1 :  std_logic_vector (15 downto 0);
    signal CH2 :  std_logic_vector (15 downto 0);
    signal CH3 :  std_logic_vector (15 downto 0);                                            
    signal CH4 :  std_logic_vector (15 downto 0);
    signal CH5 :  std_logic_vector (15 downto 0);
    signal CH6 :  std_logic_vector (15 downto 0);
    signal CH7 :  std_logic_vector (15 downto 0);
    signal CH8 :  std_logic_vector (15 downto 0);                                                                                     
    signal CH9 :  std_logic_vector (15 downto 0);
    signal CH10 :  std_logic_vector (15 downto 0);
    signal CH11 :  std_logic_vector (15 downto 0);
    signal CH12 :  std_logic_vector (15 downto 0);
    signal CH13 :  std_logic_vector (15 downto 0);
    signal CH14 :  std_logic_vector (15 downto 0);
    signal CH15 :  std_logic_vector (15 downto 0);
    signal CH16 :  std_logic_vector (15 downto 0);
    signal CH17 :  std_logic_vector (15 downto 0);
    signal CH18 :  std_logic_vector (15 downto 0);
    signal CH19 :  std_logic_vector (15 downto 0);
    signal CH20 :  std_logic_vector (15 downto 0);
    signal CH21 :  std_logic_vector (15 downto 0);
    signal CH22 :  std_logic_vector (15 downto 0);
    signal CH23 :  std_logic_vector (15 downto 0);
    signal CH24 :  std_logic_vector (15 downto 0);
    signal CH25 :  std_logic_vector (15 downto 0);
    signal CH26 :  std_logic_vector (15 downto 0);
    signal CH27 :  std_logic_vector (15 downto 0);
    signal CH28 :  std_logic_vector (15 downto 0);
    signal CH29 :  std_logic_vector (15 downto 0);
    signal CH30 :  std_logic_vector (15 downto 0);
    signal CH31 :  std_logic_vector (15 downto 0);
    
	
    signal CHv0_7 : STD_LOGIC;
    signal CHv8_15 : STD_LOGIC;
    signal CHv16_23 : STD_LOGIC;
    signal CHv24_31 : STD_LOGIC;


    attribute keep of CHA0  : signal is "true";
    attribute keep of CHA1  : signal is "true";
    attribute keep of CHA2  : signal is "true";
    attribute keep of CHA3  : signal is "true";
    attribute keep of CHA4  : signal is "true";
    attribute keep of CHA5  : signal is "true";
    attribute keep of CHA6  : signal is "true";
    attribute keep of CHA7  : signal is "true";
    attribute keep of CHA8  : signal is "true";
    attribute keep of CHA9  : signal is "true";
    attribute keep of CHA10  : signal is "true";
    attribute keep of CHA11  : signal is "true";
    attribute keep of CHA12  : signal is "true";
    attribute keep of CHA13  : signal is "true";
    attribute keep of CHA14  : signal is "true";
    attribute keep of CHA15  : signal is "true";
    attribute keep of CHA16  : signal is "true";
    attribute keep of CHA17  : signal is "true";
    attribute keep of CHA18  : signal is "true";
    attribute keep of CHA19  : signal is "true";
    attribute keep of CHA20  : signal is "true";
    attribute keep of CHA21  : signal is "true";
    attribute keep of CHA22  : signal is "true";
    attribute keep of CHA23  : signal is "true";
    attribute keep of CHA24  : signal is "true";
    attribute keep of CHA25  : signal is "true";
    attribute keep of CHA26  : signal is "true";
    attribute keep of CHA27  : signal is "true";
    attribute keep of CHA28  : signal is "true";
    attribute keep of CHA29  : signal is "true";
    attribute keep of CHA30  : signal is "true";
    attribute keep of CHA31  : signal is "true";

    
    signal M_AVALON_0_address :  STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M_AVALON_0_read :  STD_LOGIC;
    signal M_AVALON_0_readdata :  STD_LOGIC_VECTOR ( 31 downto 0 );
    signal M_AVALON_0_readdatavalid :  STD_LOGIC;
    signal M_AVALON_0_waitrequest :  STD_LOGIC;
    signal M_AVALON_0_write : STD_LOGIC;
    signal M_AVALON_0_writedata : STD_LOGIC_VECTOR ( 31 downto 0 );
    
	    
    attribute keep of M_AVALON_0_address  : signal is "true";
    attribute keep of M_AVALON_0_read  : signal is "true";        
    attribute keep of M_AVALON_0_readdata  : signal is "true";
    attribute keep of M_AVALON_0_write  : signal is "true";
    attribute keep of M_AVALON_0_writedata  : signal is "true";

    signal MOSI : STD_LOGIC;
    
    
    signal  cfg_serdes1_delay :  std_logic_vector(5-1 downto 0) := (others => '0');
    signal  cfg_serdes1_delay_exc :  std_logic := '0';
    signal  cfg_pulse_bitsleep :  std_logic := '0';
    signal  cfg_abselector :  std_logic := '0';       
    signal  cfg_channel_selector :  std_logic_vector(7 downto 0)  := (others => '0');
    signal  cfg_selected_prw :  std_logic_vector(15 downto 0)  := (others => '0');
    
    signal serdes_reset_0 : STD_LOGIC_VECTOR ( 7 downto 0 );    
    
    signal BOARD_CLOCK : STD_LOGIC;
	signal MAIN_RESET : STD_LOGIC_VECTOR ( 0 to 0 );
    
    signal TEST_REG : STD_LOGIC_VECTOR ( 31 downto 0 );
    
    signal HLINK0_FIFO_IN_tdata :  STD_LOGIC_VECTOR ( 63 downto 0 );
    signal HLINK0_FIFO_IN_tready :  STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal HLINK0_FIFO_IN_tvalid :  STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal HLINK0_FIFO_OUT_tdata :  STD_LOGIC_VECTOR ( 63 downto 0 );
    signal HLINK0_FIFO_OUT_tready :  STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal HLINK0_FIFO_OUT_tvalid :  STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal HLINK1_FIFO_IN_tdata :  STD_LOGIC_VECTOR ( 63 downto 0 );
    signal HLINK1_FIFO_IN_tready :  STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal HLINK1_FIFO_IN_tvalid :  STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal HLINK1_FIFO_OUT_tdata :  STD_LOGIC_VECTOR ( 63 downto 0 );
    signal HLINK1_FIFO_OUT_tready :  STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal HLINK1_FIFO_OUT_tvalid :  STD_LOGIC_VECTOR (0 downto 0) := "0"; 

	
	signal BUS_Test_0_READ_DATA :  STD_LOGIC_VECTOR(31 downto 0);
    signal BUS_Test_0_ADDRESS :  STD_LOGIC_VECTOR(15 downto 0); 
    signal BUS_Test_0_WRITE_DATA :  STD_LOGIC_VECTOR(31 downto 0); 
    signal BUS_Test_0_W_INT :  STD_LOGIC_VECTOR(0 downto 0); 
    signal BUS_Test_0_R_INT :  STD_LOGIC_VECTOR(0 downto 0); 
    signal BUS_Test_0_VLD :  STD_LOGIC_VECTOR(0 downto 0);   
    
    signal REG_FIRMWARE_UNIQUE : STD_LOGIC_VECTOR(31 downto 0) := x"11111111";
    signal REG_FIRMWARE_BUILD :  STD_LOGIC_VECTOR(31 downto 0) := x"19030700";    
    signal FW_VER_0 :  STD_LOGIC_VECTOR ( 31 downto 0 );        
    signal FW_RELEASE_DATE_0 :  STD_LOGIC_VECTOR ( 31 downto 0 );
    signal FW_STRING_0 :  STD_LOGIC_VECTOR ( 127 downto 0 );
            
     
	signal CLK_LINK : std_logic_vector (0 downto 0) := "0";
	
	signal	CLK_40 :  std_logic_vector (0 downto 0);
	signal	CLK_80 :  std_logic_vector (0 downto 0);
	signal	clk_160 :  std_logic_vector (0 downto 0);
	signal	clk_320 :  std_logic_vector (0 downto 0);
	signal CLK_125 : std_logic_vector(0 downto 0);	
    signal FAST_CLK_100 : std_logic_vector (0 downto 0) := "0";
    signal FAST_CLK_200 : std_logic_vector (0 downto 0) := "0";
    signal FAST_CLK_250 : std_logic_vector (0 downto 0) := "0";
    signal FAST_CLK_250_90 : std_logic_vector (0 downto 0) := "0";
    signal FAST_CLK_500 : std_logic_vector (0 downto 0) := "0";
    signal FAST_CLK_500_90 : std_logic_vector (0 downto 0) := "0";
    
    signal async_clk : std_logic_vector (0 downto 0) := "0";
    signal GlobalClock : std_logic_vector (0 downto 0) := "0";
    signal BUS_CLK : std_logic_vector (0 downto 0) := "0";
    signal GlobalReset : std_logic_vector (0 downto 0) := "0";         

    signal CLK_ACQ : std_logic_vector (0 downto 0) := "0";
	
	signal SYNC_0_OUT : std_logic_vector(0 downto 0) := "0";
	signal SYNC_1_OUT : std_logic_vector(0 downto 0) := "0";
	signal SYNC_2_OUT : std_logic_vector(0 downto 0) := "0";

	signal SYNC_0_IN : std_logic_vector(0 downto 0) := "0";
	signal SYNC_1_IN : std_logic_vector(0 downto 0) := "0";
	signal SYNC_2_IN : std_logic_vector(0 downto 0) := "0";
	
	signal FS_0_tdata : STD_LOGIC_VECTOR ( 63 downto 0 ) := (others => '0');
    signal FS_0_tready :  STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal FS_0_tvalid :  STD_LOGIC_VECTOR(0 downto 0) := "0";
	
	signal FS_1_tdata : STD_LOGIC_VECTOR ( 63 downto 0 ) := (others => '0');
    signal FS_1_tready :  STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal FS_1_tvalid :  STD_LOGIC_VECTOR(0 downto 0) := "0";

	signal FS_2_tdata : STD_LOGIC_VECTOR ( 63 downto 0 ) := (others => '0');
    signal FS_2_tready :  STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal FS_2_tvalid :  STD_LOGIC_VECTOR(0 downto 0) := "0";

	signal FS_3_tdata : STD_LOGIC_VECTOR ( 63 downto 0 ) := (others => '0');
    signal FS_3_tready :  STD_LOGIC_VECTOR(0 downto 0) := "0";
    signal FS_3_tvalid :  STD_LOGIC_VECTOR(0 downto 0) := "0";
	

    signal iSiClkOut : std_logic;
    signal iSiClkIn : std_logic;
	
signal U0_A1 : std_logic_vector(15 downto 0);
signal U1_A2 : std_logic_vector(15 downto 0);
signal U2_A3 : std_logic_vector(15 downto 0);
signal U3_A4 : std_logic_vector(15 downto 0);
signal U4_A5 : std_logic_vector(15 downto 0);
signal U5_A6 : std_logic_vector(15 downto 0);
signal U6_A7 : std_logic_vector(15 downto 0);
signal U7_A8 : std_logic_vector(15 downto 0);
signal U8_A9 : std_logic_vector(15 downto 0);
signal U9_A10 : std_logic_vector(15 downto 0);
signal U10_A11 : std_logic_vector(15 downto 0);
signal U11_A12 : std_logic_vector(15 downto 0);
signal U12_A13 : std_logic_vector(15 downto 0);
signal U13_A14 : std_logic_vector(15 downto 0);
signal U14_A15 : std_logic_vector(15 downto 0);
signal U15_A16 : std_logic_vector(15 downto 0);
signal U16_A17 : std_logic_vector(15 downto 0);
signal U17_A18 : std_logic_vector(15 downto 0);
signal U18_A19 : std_logic_vector(15 downto 0);
signal U19_A20 : std_logic_vector(15 downto 0);
signal U20_A21 : std_logic_vector(15 downto 0);
signal U21_A22 : std_logic_vector(15 downto 0);
signal U22_A23 : std_logic_vector(15 downto 0);
signal U23_out_0 : std_logic_vector(15 downto 0);
signal U24_out_0 : std_logic_vector(15 downto 0);
signal U25_out_0 : std_logic_vector(15 downto 0);
signal U26_out_0 : std_logic_vector(15 downto 0);
signal U27_out_0 : std_logic_vector(15 downto 0);
signal U28_out_0 : std_logic_vector(15 downto 0);
signal U29_out_0 : std_logic_vector(15 downto 0);
	signal U30_delayed_data_0 : std_logic_vector(15 downto 0);
	signal U30_trigout_0 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_1 : std_logic_vector(15 downto 0);
	signal U30_trigout_1 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_2 : std_logic_vector(15 downto 0);
	signal U30_trigout_2 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_3 : std_logic_vector(15 downto 0);
	signal U30_trigout_3 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_4 : std_logic_vector(15 downto 0);
	signal U30_trigout_4 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_5 : std_logic_vector(15 downto 0);
	signal U30_trigout_5 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_6 : std_logic_vector(15 downto 0);
	signal U30_trigout_6 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_7 : std_logic_vector(15 downto 0);
	signal U30_trigout_7 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_8 : std_logic_vector(15 downto 0);
	signal U30_trigout_8 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_9 : std_logic_vector(15 downto 0);
	signal U30_trigout_9 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_10 : std_logic_vector(15 downto 0);
	signal U30_trigout_10 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_11 : std_logic_vector(15 downto 0);
	signal U30_trigout_11 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_12 : std_logic_vector(15 downto 0);
	signal U30_trigout_12 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_13 : std_logic_vector(15 downto 0);
	signal U30_trigout_13 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_14 : std_logic_vector(15 downto 0);
	signal U30_trigout_14 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_15 : std_logic_vector(15 downto 0);
	signal U30_trigout_15 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_16 : std_logic_vector(15 downto 0);
	signal U30_trigout_16 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_17 : std_logic_vector(15 downto 0);
	signal U30_trigout_17 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_18 : std_logic_vector(15 downto 0);
	signal U30_trigout_18 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_19 : std_logic_vector(15 downto 0);
	signal U30_trigout_19 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_20 : std_logic_vector(15 downto 0);
	signal U30_trigout_20 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_21 : std_logic_vector(15 downto 0);
	signal U30_trigout_21 : std_logic_vector(0 downto 0);
	signal U30_delayed_data_22 : std_logic_vector(15 downto 0);
	signal U30_trigout_22 : std_logic_vector(0 downto 0);

COMPONENT SUBPAGE_subdesign_1
PORT(
	ain : IN std_logic_vector(15 downto 0);
	delayed_data : OUT std_logic_vector(15 downto 0);
	trigout : OUT std_logic_vector(0 downto 0);
	pol : IN std_logic_vector(0 downto 0);
	hithrs : IN std_logic_vector(15 downto 0);
	lothrs : IN std_logic_vector(15 downto 0);
	inhib : IN std_logic_vector(15 downto 0);
	gatel : IN std_logic_vector(15 downto 0);
	gateu : IN std_logic_vector(15 downto 0);
	delay : IN std_logic_vector(15 downto 0);
	xdelay : IN std_logic_vector(15 downto 0);
	GlobalReset: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	CLK_ACQ: in std_logic_vector (0 downto 0);
	BUS_CLK: in std_logic_vector (0 downto 0);
	CLK_40: in std_logic_vector (0 downto 0);
	CLK_50: in std_logic_vector (0 downto 0);
	CLK_80: in std_logic_vector (0 downto 0);
	clk_160: in std_logic_vector (0 downto 0);
	clk_320: in std_logic_vector (0 downto 0);
	clk_125: in std_logic_vector (0 downto 0);
	FAST_CLK_100: in std_logic_vector (0 downto 0);
	FAST_CLK_200: in std_logic_vector (0 downto 0);
	FAST_CLK_250: in std_logic_vector (0 downto 0);
	FAST_CLK_250_90: in std_logic_vector (0 downto 0);
	FAST_CLK_500: in std_logic_vector (0 downto 0);
	FAST_CLK_500_90: in std_logic_vector (0 downto 0);
	GlobalClock: in std_logic_vector (0 downto 0);
	async_clk: IN STD_LOGIC_VECTOR(0 DOWNTO 0));
END COMPONENT;
signal U31_out_0 : std_logic_vector(0 downto 0);
	signal U32_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U33_E_0 : std_logic_vector(15 downto 0);
	signal U33_E_1 : std_logic_vector(15 downto 0);
	signal U33_E_2 : std_logic_vector(15 downto 0);
	signal U33_E_3 : std_logic_vector(15 downto 0);
	signal U33_E_4 : std_logic_vector(15 downto 0);
	signal U33_E_5 : std_logic_vector(15 downto 0);
	signal U33_E_6 : std_logic_vector(15 downto 0);
	signal U33_E_7 : std_logic_vector(15 downto 0);
	signal U33_E_8 : std_logic_vector(15 downto 0);
	signal U33_E_9 : std_logic_vector(15 downto 0);
	signal U33_E_10 : std_logic_vector(15 downto 0);
	signal U33_E_11 : std_logic_vector(15 downto 0);
	signal U33_E_12 : std_logic_vector(15 downto 0);
	signal U33_E_13 : std_logic_vector(15 downto 0);
	signal U33_E_14 : std_logic_vector(15 downto 0);
	signal U33_E_15 : std_logic_vector(15 downto 0);
	signal U33_E_16 : std_logic_vector(15 downto 0);
	signal U33_E_17 : std_logic_vector(15 downto 0);
	signal U33_E_18 : std_logic_vector(15 downto 0);
	signal U33_E_19 : std_logic_vector(15 downto 0);
	signal U33_E_20 : std_logic_vector(15 downto 0);
	signal U33_E_21 : std_logic_vector(15 downto 0);
	signal U33_E_22 : std_logic_vector(15 downto 0);

COMPONENT SUBPAGE_subdesign_2
PORT(
	data_in : IN std_logic_vector(15 downto 0);
	E : OUT std_logic_vector(15 downto 0);
	trig : IN std_logic_vector(0 downto 0);
	inttime : IN std_logic_vector(15 downto 0);
	preint : IN std_logic_vector(15 downto 0);
	pileup : IN std_logic_vector(15 downto 0);
	gain : IN std_logic_vector(15 downto 0);
	ofs : IN std_logic_vector(15 downto 0);
	bl : IN std_logic_vector(15 downto 0);
	GlobalReset: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	CLK_ACQ: in std_logic_vector (0 downto 0);
	BUS_CLK: in std_logic_vector (0 downto 0);
	CLK_40: in std_logic_vector (0 downto 0);
	CLK_50: in std_logic_vector (0 downto 0);
	CLK_80: in std_logic_vector (0 downto 0);
	clk_160: in std_logic_vector (0 downto 0);
	clk_320: in std_logic_vector (0 downto 0);
	clk_125: in std_logic_vector (0 downto 0);
	FAST_CLK_100: in std_logic_vector (0 downto 0);
	FAST_CLK_200: in std_logic_vector (0 downto 0);
	FAST_CLK_250: in std_logic_vector (0 downto 0);
	FAST_CLK_250_90: in std_logic_vector (0 downto 0);
	FAST_CLK_500: in std_logic_vector (0 downto 0);
	FAST_CLK_500_90: in std_logic_vector (0 downto 0);
	GlobalClock: in std_logic_vector (0 downto 0);
	async_clk: IN STD_LOGIC_VECTOR(0 DOWNTO 0));
END COMPONENT;
signal U34_out_0 : std_logic_vector(15 downto 0);
signal U35_out_0 : std_logic_vector(15 downto 0);
signal U36_out_0 : std_logic_vector(15 downto 0);
signal U37_out_0 : std_logic_vector(15 downto 0);
signal U38_out_0 : std_logic_vector(15 downto 0);
signal U39_out_0 : std_logic_vector(15 downto 0);
signal U40_out : std_logic_vector(15 downto 0);
signal U41_out_0 : std_logic_vector(4 downto 0);
	signal BUS_Spectrum_0_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_0_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_0_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);

	COMPONENT xlx_spectrum
		GENERIC( 
			memLength : INTEGER := 1024;
			wordWidth : INTEGER := 16
		);
		PORT( 
			ENERGY : in STD_LOGIC_VECTOR(15 downto 0);
			ENERGY_STROBE : in STD_LOGIC_VECTOR(0 downto 0);
			P_running : out STD_LOGIC_VECTOR(0 downto 0);
			P_acceptedPulse : out STD_LOGIC_VECTOR(0 downto 0);
			CLK_WRITE : in STD_LOGIC_VECTOR(0 downto 0);
			CE : in STD_LOGIC_VECTOR(0 downto 0);
			RESET : in STD_LOGIC_VECTOR(0 downto 0);
			CLK_READ : in STD_LOGIC_VECTOR(0 downto 0);
			READ_ADDRESS : in STD_LOGIC_VECTOR(15 downto 0);
			READ_DATA : out STD_LOGIC_VECTOR(31 downto 0);
			READ_INT : in STD_LOGIC_VECTOR(0 downto 0);
			READ_DATAVALID : out STD_LOGIC_VECTOR(0 downto 0);
			STATUS : out STD_LOGIC_VECTOR(31 downto 0);
			CONFIG : in STD_LOGIC_VECTOR(31 downto 0);
			CONFIG_LIMIT : in STD_LOGIC_VECTOR(31 downto 0);
			CONFIG_REBIN : in STD_LOGIC_VECTOR(31 downto 0);
			CONFIG_MIN : in STD_LOGIC_VECTOR(31 downto 0);
			CONFIG_MAX : in STD_LOGIC_VECTOR(31 downto 0)
		);
	END COMPONENT;

	signal BUS_Spectrum_0_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_0_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_0_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_0_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_0_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_0_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_0_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_0_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_0_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_0_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_0_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_0_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_pol_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_pol_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_pol_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_pol_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_hithrs_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_hithrs_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_hithrs_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_hithrs_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_lothrsh_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_lothrsh_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_lothrsh_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_lothrsh_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_inhib_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_inhib_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_inhib_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_inhib_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_gatel_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_gatel_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_gatel_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_gatel_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_gateu_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_gateu_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_gateu_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_gateu_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_delay_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_delay_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_delay_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_delay_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_xdelay_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_xdelay_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_xdelay_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_xdelay_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_inttime_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_inttime_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_inttime_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_inttime_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_preint_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_preint_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_preint_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_preint_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_pileup_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_pileup_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_pileup_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_pileup_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_gain_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_gain_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_gain_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_gain_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_ofs_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_ofs_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_ofs_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_ofs_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_bl_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_bl_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_bl_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_bl_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_CH_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_CH_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_CH_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_CH_RD : STD_LOGIC_VECTOR(0 downto 0); 
	
	component main_clock 
     port (
      clk_board : in std_logic;
      clk_adc : in std_logic;
      clk_in_sel : in std_logic;
     
      clk_out1 : out std_logic;
      clk_out2 : out std_logic;
      clk_out3 : out std_logic;
      clk_out4 : out std_logic;
      clk_out5 : out std_logic;
      clk_out6 : out std_logic;
      clk_out7 : out std_logic;
      
      reset : in std_logic;
      input_clk_stopped : out std_logic;
      locked : out std_logic
     );
     end component;

	signal NO_CLOCK_FLAG : std_logic := '0';
    signal CLOCK_INPUT_SEL : std_logic := '1';
    signal clock_source_commutator : std_logic := '0';
    signal CLOCK_ADC : std_logic := '0';
    signal CLOCK_MAIN : std_logic := '0';

	signal CLOCK_SOURCE : STD_LOGIC_VECTOR ( 3 downto 0 ) := x"0";
    signal CLOCK_SOURCE_EXT : STD_LOGIC_VECTOR ( 3 downto 0 ) := x"1";
    signal CLOCK_PL : STD_LOGIC;
    signal clock_source_commutator_b : std_logic;
    signal CLOCK_RESET :  STD_LOGIC;
    signal INVALID_CLOCK :  STD_LOGIC;
    signal CLOCK_TEST_COUNTER : STD_LOGIC_VECTOR(15 downto 0);
    signal CLOCK_TEST_OS1 : STD_LOGIC;
    signal CLOCK_TEST_OS2 : STD_LOGIC;
    
begin

ext_clock_verifier_2 : process(CLOCK_ADC) 
begin
    if rising_edge(CLOCK_ADC) then
        CLOCK_TEST_COUNTER <= CLOCK_TEST_COUNTER + 1;
    end if;    
end process;


XPM_CLK_VER: xpm_cdc_single
  generic map (
     DEST_SYNC_FF   => 4, 
     INIT_SYNC_FF   => 0,
     SIM_ASSERT_CHK => 0,
     SRC_INPUT_REG  => 1 
  )
  port map (
     src_clk  => CLOCK_ADC,
     src_in   => CLOCK_TEST_COUNTER(15),
     dest_clk => CLOCK_MAIN,
     dest_out => CLOCK_TEST_OS1
  );
  
ext_clock_verifier : process(CLOCK_MAIN) 
variable counter_int : integer;
begin
    if rising_edge(CLOCK_MAIN) then
        CLOCK_TEST_OS2 <= CLOCK_TEST_OS1;
        if CLOCK_TEST_OS1 /= CLOCK_TEST_OS2 then
            INVALID_CLOCK <= '0';
            counter_int := 0;
        else
            if counter_int = 12500000 then
                INVALID_CLOCK <= '1';
            else
                counter_int := counter_int + 1;
            end if;
        end if;
    end if;
    
end process;

  
    CLOCK_INPUT_SEL <= ((not clock_source_commutator) or INVALID_CLOCK) when CLOCK_SOURCE_EXT = x"1" else '1';
    CLOCK_SOURCE <= x"0" when CLOCK_INPUT_SEL = '1' else  CLOCK_SOURCE_EXT;

    main_clock_gen : main_clock 
     port map(
      clk_board     => CLOCK_MAIN,
      clk_adc       => CLOCK_ADC,
      clk_in_sel    => CLOCK_INPUT_SEL,
     
      clk_out1      => FAST_CLK_100(0) ,
      clk_out2      => CLOCK_PL,
      clk_out3      => FAST_CLK_200(0),
      clk_out4      => FAST_CLK_250(0),
      clk_out5      => FAST_CLK_250_90(0),
      clk_out6      => FAST_CLK_500(0),
      clk_out7      => FAST_CLK_500_90(0),
      
      reset                  => CLOCK_RESET,
      input_clk_stopped      => NO_CLOCK_FLAG, 
      locked                 => open
     );
     
     
    BOARD_CLOCK <= CLOCK_PL;


	async_clk(0) <= BOARD_CLOCK;
	CLK_ACQ(0) <= BOARD_CLOCK;
	GlobalClock(0) <= BOARD_CLOCK;
	BUS_CLK(0) <= BOARD_CLOCK;
	CLK_125(0) <= BOARD_CLOCK;
	
	GlobalReset(0) <= '0';
	
SFP_DISABLE1 <= '1';
SFP_DISABLE2 <= '1';

	SYNC_0_OUTb <= SYNC_0_OUT(0);
	SYNC_1_OUTb <= SYNC_1_OUT(0);
	SYNC_2_OUTb <= SYNC_2_OUT(0);

	SYNC_0_IN(0) <= SYNC_0_INb;
	SYNC_1_IN(0) <= SYNC_1_INb;
	SYNC_2_IN(0) <= SYNC_2_INb;
	
zynq_subsystem : component ZynqDesign_wrapper
     port map (
         DDR_0_addr(14 downto 0) => DDR_addr(14 downto 0),
         
         DDR_0_ba(2 downto 0) => DDR_ba(2 downto 0),
         DDR_0_cas_n => DDR_cas_n,
         DDR_0_ck_n => DDR_ck_n,
         DDR_0_ck_p => DDR_ck_p,
         DDR_0_cke => DDR_cke,
         DDR_0_cs_n => DDR_cs_n,
         DDR_0_dm(3 downto 0) => DDR_dm(3 downto 0),
         DDR_0_dq(31 downto 0) => DDR_dq(31 downto 0),
         DDR_0_dqs_n(3 downto 0) => DDR_dqs_n(3 downto 0),
         DDR_0_dqs_p(3 downto 0) => DDR_dqs_p(3 downto 0),
         DDR_0_odt => DDR_odt,
         DDR_0_ras_n => DDR_ras_n,
         DDR_0_reset_n => DDR_reset_n,
         DDR_0_we_n => DDR_we_n,
         FIXED_IO_0_ddr_vrn => FIXED_IO_ddr_vrn,
         FIXED_IO_0_ddr_vrp => FIXED_IO_ddr_vrp,
         FIXED_IO_0_mio(53 downto 0) => FIXED_IO_mio(53 downto 0),
         FIXED_IO_0_ps_clk => FIXED_IO_ps_clk,
         FIXED_IO_0_ps_porb => FIXED_IO_ps_porb,
         FIXED_IO_0_ps_srstb => FIXED_IO_ps_srstb,
         
         FS_0_tdata  => FS_0_tdata,
         FS_0_tready => FS_0_tready(0),
         FS_0_tvalid => FS_0_tvalid(0),

         
         GT_REFCLK_0_clk_n => GT_REFCLK_0_clk_n,
         GT_REFCLK_0_clk_p => GT_REFCLK_0_clk_p,
         GT_RX_2_rxn(0) => GT_RX_0_rxn(0),
         GT_RX_2_rxp(0) => GT_RX_0_rxp(0),
         GT_RX_3_rxn(0) => GT_RX_1_rxn(0),
         GT_RX_3_rxp(0) => GT_RX_1_rxp(0),
         --GT_RX_2_rxn(0) => GT_RX_2_rxn(0),
         --GT_RX_2_rxp(0) => GT_RX_2_rxp(0),
         --GT_RX_3_rxn(0) => GT_RX_3_rxn(0),
         --GT_RX_3_rxp(0) => GT_RX_3_rxp(0),         
         GT_TX_2_txn(0) => GT_TX_0_txn(0),
         GT_TX_2_txp(0) => GT_TX_0_txp(0),
         GT_TX_3_txn(0) => GT_TX_1_txn(0),
         GT_TX_3_txp(0) => GT_TX_1_txp(0),
         --GT_TX_2_txn(0) => GT_TX_2_txn(0),
         --GT_TX_2_txp(0) => GT_TX_2_txp(0),
         --GT_TX_3_txn(0) => GT_TX_3_txn(0),
         --GT_TX_3_txp(0) => GT_TX_3_txp(0),
         
         LINK0_FIFO_IN_tdata => HLINK0_FIFO_IN_tdata, 
         LINK0_FIFO_IN_tready => HLINK0_FIFO_IN_tready(0),
         LINK0_FIFO_IN_tvalid => HLINK0_FIFO_IN_tvalid(0),
         LINK0_FIFO_OUT_tdata => HLINK0_FIFO_OUT_tdata,
         LINK0_FIFO_OUT_tready => HLINK0_FIFO_OUT_tready(0),
         LINK0_FIFO_OUT_tvalid => HLINK0_FIFO_OUT_tvalid(0),
         LINK1_FIFO_IN_tdata => HLINK1_FIFO_IN_tdata,
         LINK1_FIFO_IN_tready => HLINK1_FIFO_IN_tready(0),
         LINK1_FIFO_IN_tvalid => HLINK1_FIFO_IN_tvalid(0),
         LINK1_FIFO_OUT_tdata => HLINK1_FIFO_OUT_tdata,
         LINK1_FIFO_OUT_tready => HLINK1_FIFO_OUT_tready(0),
         LINK1_FIFO_OUT_tvalid => HLINK1_FIFO_OUT_tvalid(0),
         
         INVALID_EXT_CLK => INVALID_CLOCK,       
         clock_source_commutator => clock_source_commutator,
         CLOCK_RESET => CLOCK_RESET,
         
         CLOCK_PL => CLOCK_PL,
         CLOCK_SOURCE => CLOCK_SOURCE,
         MAIN_CLOCK => CLOCK_MAIN,
         MAIN_RESET => MAIN_RESET,
         
         M_AVALON_0_address => M_AVALON_0_address,
         M_AVALON_0_read => M_AVALON_0_read,
         M_AVALON_0_readdata => M_AVALON_0_readdata,
         M_AVALON_0_readdatavalid => M_AVALON_0_readdatavalid,
         M_AVALON_0_waitrequest => M_AVALON_0_waitrequest,
         M_AVALON_0_write => M_AVALON_0_write,
         M_AVALON_0_writedata => M_AVALON_0_writedata,         
         cfg_abselector_0 => cfg_abselector,
         cfg_channel_selector_0 => cfg_channel_selector,
         cfg_pulse_bitsleep_0 => cfg_pulse_bitsleep,
         cfg_selected_prw_0 => cfg_selected_prw,
         cfg_serdes1_delay_0 => cfg_serdes1_delay,
         cfg_serdes1_delay_exc_0 => cfg_serdes1_delay_exc,
         SMADC_1_CSA_0 => SMADC_1_CSA,
         SMADC_1_CSB_0 => SMADC_1_CSB,
         SMADC_2_CSA_0 => open,
         SMADC_2_CSB_0 => open,
         SMADC_3_CSA_0 => open,
         SMADC_3_CSB_0 => open,
         SMADC_4_CSA_0 => open,
         SMADC_4_CSB_0 => open,
         SMADC_CLK_0 => SMADC_1_CLK,
         SMADC_MOSI_0 => MOSI,
         serdes_reset_0 => serdes_reset_0,
         
         LINK0_RXCLK => iSiClkOut,
         SIRcClock =>  iSiClkIn,
         FW_VER_0 =>  FW_VER_0,       
         FW_RELEASE_DATE_0 => FW_RELEASE_DATE_0,
         FW_STRING_0 => FW_STRING_0,
         BOARDPOSITION => BOARDPOSITION,
    
 		 IIC_0_scl_io => SLAVE_I2C_SCL_0,
         IIC_0_sda_io => SLAVE_I2C_SDA_0,

        SPI_MOSI_0_0 => SPI_MOSI_0,
        SPI_MOSI_1_0 => SPI_MOSI_1,
        SPI_CLK_0 => SPI_CLK,
        SPI_CS_0 => SPI_CS          );

   FW_VEr_0 <= REG_FIRMWARE_UNIQUE;
   FW_RELEASE_DATE_0 <= REG_FIRMWARE_BUILD;
   
   
   SMADC_1_MOSI <= MOSI;
   SMADC_2_MOSI <= MOSI;
   SMADC_3_MOSI <= MOSI;
   SMADC_4_MOSI <= MOSI;

sCLK_CH_SEL <= '1';

adcs: component adcs_top_0 
Port map(  
      sCLK_125 => sCLK_125,

      ADC_SERVICE_CLK_OUT_P => ADC_SERVICE_CLK_OUT_P,
      ADC_SERVICE_CLK_OUT_N => ADC_SERVICE_CLK_OUT_N,

      
      
      ADC_1_CLK_A_P => ADC_1_CLK_A_P,
      ADC_1_CLK_A_N => ADC_1_CLK_A_N,
      ADC_1_CLK_B_P => ADC_1_CLK_B_P,
      ADC_1_CLK_B_N => ADC_1_CLK_B_N,
      
      ADC_1_FRAME_A_P => '0',
      ADC_1_FRAME_A_N => '0',
      ADC_1_FRAME_B_P => '0',
      ADC_1_FRAME_B_N => '0',
      
      ADC_1_DATA_A_P => ADC_1_DATA_A_P,
      ADC_1_DATA_A_N => ADC_1_DATA_A_N,
      
      ADC_1_DATA_B_P => ADC_1_DATA_B_P,
      ADC_1_DATA_B_N => ADC_1_DATA_B_N,
      
      SMADC_1_CSA => open,
      SMADC_1_CSB => open,
      SMADC_1_CLK => open,
      SMADC_1_MOSI => open,
      
      
      
      ADC_2_CLK_A_P => ADC_2_CLK_A_P,
      ADC_2_CLK_A_N => ADC_2_CLK_A_N,
      ADC_2_CLK_B_P => ADC_2_CLK_B_P,
      ADC_2_CLK_B_N => ADC_2_CLK_B_N,
          
      ADC_2_FRAME_A_P => '0',
      ADC_2_FRAME_A_N => '0',
      ADC_2_FRAME_B_P => '0',
      ADC_2_FRAME_B_N => '0',
          
      ADC_2_DATA_A_P => ADC_2_DATA_A_P,
      ADC_2_DATA_A_N => ADC_2_DATA_A_N,
          
      ADC_2_DATA_B_P => ADC_2_DATA_B_P,
      ADC_2_DATA_B_N => ADC_2_DATA_B_N,
      
--          SMADC_2_CSA  => SMADC_2_CSA,
--          SMADC_2_CSB  => SMADC_2_CSB,
      
      
      
      ADC_3_CLK_A_P  => ADC_3_CLK_A_P,
      ADC_3_CLK_A_N  => ADC_3_CLK_A_N,
      ADC_3_CLK_B_P  => ADC_3_CLK_B_P,
      ADC_3_CLK_B_N  => ADC_3_CLK_B_N,
          
      ADC_3_FRAME_A_P  => '0',
      ADC_3_FRAME_A_N  => '0',
      ADC_3_FRAME_B_P  => '0',
      ADC_3_FRAME_B_N  => '0',
          
      ADC_3_DATA_A_P => ADC_3_DATA_A_P,
      ADC_3_DATA_A_N => ADC_3_DATA_A_N,
          
      ADC_3_DATA_B_P => ADC_3_DATA_B_P,
      ADC_3_DATA_B_N => ADC_3_DATA_B_N,
      
--          SMADC_3_CSA  => SMADC_3_CSA,
--          SMADC_3_CSB  => SMADC_3_CSB,

      
      ADC_4_CLK_A_P  => ADC_4_CLK_A_P,
      ADC_4_CLK_A_N  => ADC_4_CLK_A_N,
      ADC_4_CLK_B_P  => ADC_4_CLK_B_P,
      ADC_4_CLK_B_N  => ADC_4_CLK_B_N,
          
      ADC_4_FRAME_A_P  => '0',
      ADC_4_FRAME_A_N  => '0',
      ADC_4_FRAME_B_P  => '0',
      ADC_4_FRAME_B_N  => '0',
          
      ADC_4_DATA_A_P  => ADC_4_DATA_A_P,
      ADC_4_DATA_A_N  => ADC_4_DATA_A_N,
          
      ADC_4_DATA_B_P => ADC_4_DATA_B_P,
      ADC_4_DATA_B_N => ADC_4_DATA_B_N,
      
--          SMADC_4_CSA  => SMADC_4_CSA,
--          SMADC_4_CSB  => SMADC_4_CSB,
      
      READOUT_CLK  => CLK_ACQ(0),
      
      CH0  =>  CH0,
      CH1  =>  CH1,
      CH2  =>  CH2,
      CH3  =>  CH3,                                            
      CH4  =>  CH4,
      CH5  =>  CH5,
      CH6  =>  CH6,
      CH7  =>  CH7,
      CH8  =>  CH8,                                                                                     
      CH9  =>  CH9,
      CH10  => CH10,
      CH11  => CH11,
      CH12  => CH12,
      CH13  => CH13,
      CH14  => CH14,
      CH15  => CH15,
      CH16  => CH16,
      CH17  => CH17,
      CH18  => CH18,
      CH19  => CH19,
      CH20  => CH20,
      CH21  => CH21,
      CH22  => CH22,
      CH23  => CH23,
      CH24  => CH24,
      CH25  => CH25,
      CH26  => CH26,
      CH27  => CH27,
      CH28  => CH28,
      CH29  => CH29,
      CH30  => CH30,
      CH31  => CH31,
      CHv0_7  => CHv0_7,
      CHv8_15  => CHv8_15,
      CHv16_23  => CHv16_23,
      CHv24_31  => CHv24_31,
      
      cfg_abselector => cfg_abselector,
      cfg_channel_selector => cfg_channel_selector,
      cfg_pulse_bitsleep => cfg_pulse_bitsleep,
      cfg_selected_prw => cfg_selected_prw,
      cfg_serdes1_delay => cfg_serdes1_delay,
      cfg_serdes1_delay_exc => cfg_serdes1_delay_exc,
      
      serdes_reset_0 => serdes_reset_0        

      );


	CHA0<=CH23;
	CHA1<=CH22;
	CHA2<=CH21;
	CHA3<=CH20;
	CHA4<=CH19;
	CHA5<=CH18;
	CHA6<=CH17;
	CHA7<=CH16;
	CHA8<=CH7;
	CHA9<=CH6;
	CHA10<=CH5;
	CHA11<=CH4;
	CHA12<=CH3;
	CHA13<=CH2;
	CHA14<=CH1;
	CHA15<=CH0;
	CHA16<=CH31;
	CHA17<=CH30;
	CHA18<=CH29;
	CHA19<=CH28;
	CHA20<=CH27;
	CHA21<=CH26;
	CHA22<=CH25;
	CHA23<=CH24;
	CHA24<=CH15;
	CHA25<=CH14;
	CHA26<=CH13;
	CHA27<=CH12;
	CHA28<=CH11;
	CHA29<=CH10;
	CHA30<=CH9;
	CHA31<=CH8;


AW_MEMORY_MANAGER : avalon_wrapper 
    Generic Map (M_AVALON_BA  => x"14000000")
    Port Map(  clk => BUS_CLK(0),
            reset => '0',
            M_AVALON_0_address => M_AVALON_0_address,
            M_AVALON_0_read => M_AVALON_0_read,
            M_AVALON_0_readdata => M_AVALON_0_readdata,
            M_AVALON_0_readdatavalid => M_AVALON_0_readdatavalid,
            M_AVALON_0_waitrequest => M_AVALON_0_waitrequest,
            M_AVALON_0_write => M_AVALON_0_write,
            M_AVALON_0_writedata => M_AVALON_0_writedata,
     
    
			--test
            BUS_Test_0_READ_DATA => BUS_Test_0_READ_DATA,
            BUS_Test_0_ADDRESS => BUS_Test_0_ADDRESS, 
            BUS_Test_0_WRITE_DATA => BUS_Test_0_WRITE_DATA, 
            BUS_Test_0_W_INT => BUS_Test_0_W_INT, 
            BUS_Test_0_R_INT => BUS_Test_0_R_INT, 
            BUS_Test_0_VLD => BUS_Test_0_VLD,               

            -- Register interface          
		REG_pol_RD => REG_pol_RD,
		REG_pol_WR => REG_pol_WR,
		INT_pol_RD => INT_pol_RD,
		INT_pol_WR => INT_pol_WR,
		REG_hithrs_RD => REG_hithrs_RD,
		REG_hithrs_WR => REG_hithrs_WR,
		INT_hithrs_RD => INT_hithrs_RD,
		INT_hithrs_WR => INT_hithrs_WR,
		REG_lothrsh_RD => REG_lothrsh_RD,
		REG_lothrsh_WR => REG_lothrsh_WR,
		INT_lothrsh_RD => INT_lothrsh_RD,
		INT_lothrsh_WR => INT_lothrsh_WR,
		REG_inhib_RD => REG_inhib_RD,
		REG_inhib_WR => REG_inhib_WR,
		INT_inhib_RD => INT_inhib_RD,
		INT_inhib_WR => INT_inhib_WR,
		REG_gatel_RD => REG_gatel_RD,
		REG_gatel_WR => REG_gatel_WR,
		INT_gatel_RD => INT_gatel_RD,
		INT_gatel_WR => INT_gatel_WR,
		REG_gateu_RD => REG_gateu_RD,
		REG_gateu_WR => REG_gateu_WR,
		INT_gateu_RD => INT_gateu_RD,
		INT_gateu_WR => INT_gateu_WR,
		REG_delay_RD => REG_delay_RD,
		REG_delay_WR => REG_delay_WR,
		INT_delay_RD => INT_delay_RD,
		INT_delay_WR => INT_delay_WR,
		REG_xdelay_RD => REG_xdelay_RD,
		REG_xdelay_WR => REG_xdelay_WR,
		INT_xdelay_RD => INT_xdelay_RD,
		INT_xdelay_WR => INT_xdelay_WR,
		REG_inttime_RD => REG_inttime_RD,
		REG_inttime_WR => REG_inttime_WR,
		INT_inttime_RD => INT_inttime_RD,
		INT_inttime_WR => INT_inttime_WR,
		REG_preint_RD => REG_preint_RD,
		REG_preint_WR => REG_preint_WR,
		INT_preint_RD => INT_preint_RD,
		INT_preint_WR => INT_preint_WR,
		REG_pileup_RD => REG_pileup_RD,
		REG_pileup_WR => REG_pileup_WR,
		INT_pileup_RD => INT_pileup_RD,
		INT_pileup_WR => INT_pileup_WR,
		REG_gain_RD => REG_gain_RD,
		REG_gain_WR => REG_gain_WR,
		INT_gain_RD => INT_gain_RD,
		INT_gain_WR => INT_gain_WR,
		REG_ofs_RD => REG_ofs_RD,
		REG_ofs_WR => REG_ofs_WR,
		INT_ofs_RD => INT_ofs_RD,
		INT_ofs_WR => INT_ofs_WR,
		REG_bl_RD => REG_bl_RD,
		REG_bl_WR => REG_bl_WR,
		INT_bl_RD => INT_bl_RD,
		INT_bl_WR => INT_bl_WR,
		REG_CH_RD => REG_CH_RD,
		REG_CH_WR => REG_CH_WR,
		INT_CH_RD => INT_CH_RD,
		INT_CH_WR => INT_CH_WR,
	BUS_Spectrum_0_READ_ADDRESS => BUS_Spectrum_0_READ_ADDRESS,
	BUS_Spectrum_0_READ_DATA => BUS_Spectrum_0_READ_DATA,
	BUS_Spectrum_0_WRITE_DATA => BUS_Spectrum_0_WRITE_DATA,
	BUS_Spectrum_0_W_INT => BUS_Spectrum_0_W_INT,
	BUS_Spectrum_0_R_INT => BUS_Spectrum_0_R_INT,
	BUS_Spectrum_0_VLD => BUS_Spectrum_0_VLD,
		REG_Spectrum_0_STATUS_RD => REG_Spectrum_0_STATUS_RD,
		INT_Spectrum_0_STATUS_RD => INT_Spectrum_0_STATUS_RD,
		REG_Spectrum_0_CONFIG_WR => REG_Spectrum_0_CONFIG_WR,
		INT_Spectrum_0_CONFIG_WR => INT_Spectrum_0_CONFIG_WR,
		REG_Spectrum_0_CONFIG_LIMIT_WR => REG_Spectrum_0_CONFIG_LIMIT_WR,
		INT_Spectrum_0_CONFIG_LIMIT_WR => INT_Spectrum_0_CONFIG_LIMIT_WR,
		REG_Spectrum_0_CONFIG_REBIN_WR => REG_Spectrum_0_CONFIG_REBIN_WR,
		INT_Spectrum_0_CONFIG_REBIN_WR => INT_Spectrum_0_CONFIG_REBIN_WR,
		REG_Spectrum_0_CONFIG_MIN_WR => REG_Spectrum_0_CONFIG_MIN_WR,
		INT_Spectrum_0_CONFIG_MIN_WR => INT_Spectrum_0_CONFIG_MIN_WR,
		REG_Spectrum_0_CONFIG_MAX_WR => REG_Spectrum_0_CONFIG_MAX_WR,
		INT_Spectrum_0_CONFIG_MAX_WR => INT_Spectrum_0_CONFIG_MAX_WR,
		REG_UNIQUE_RD => x"00112233",
		REG_UNIQUE_WR => open,
   

            REG_FIRMWARE_UNIQUE => REG_FIRMWARE_UNIQUE,
            REG_FIRMWARE_BUILD => REG_FIRMWARE_BUILD    
    );


--xpm_memory_spram_inst : xpm_memory_spram
--    generic map (
--        -- Common module generics
--        MEMORY_SIZE => 2048, --positive integer
--        MEMORY_PRIMITIVE => "auto", --string; "auto", "distributed", "block" or "ultra" ;
--        MEMORY_INIT_FILE => "none", --string; "none" or "<filename>.mem"
--        MEMORY_INIT_PARAM => "", --string;
--        USE_MEM_INIT => 1, --integer; 0,1
--        WAKEUP_TIME => "disable_sleep",--string; "disable_sleep" or "use_sleep_pin"
--        MESSAGE_CONTROL => 0, --integer; 0,1
--        -- Port A module generics
--        WRITE_DATA_WIDTH_A => 32, --positive integer
--        READ_DATA_WIDTH_A => 32, --positive integer
--        BYTE_WRITE_WIDTH_A => 32, --integer; 8, 9, or WRITE_DATA_WIDTH_A value
--        ADDR_WIDTH_A => 6, --positive integer
--        READ_RESET_VALUE_A => "0", --string
--        READ_LATENCY_A => 1, --non-negative integer
--        WRITE_MODE_A => "write_first" --string; "write_first", "read_first", "no_change"
--    )
--    port map (
--        -- Common module ports
--        sleep => '0',
--        -- Port A module ports
--        clka => BUS_CLK(0),
--        rsta => '0',
--        ena => '1',
--        regcea => '1',
--        wea => BUS_Test_0_W_INT,
--        addra => BUS_Test_0_ADDRESS(5 downto 0),
--        dina => BUS_Test_0_WRITE_DATA,
--        injectsbiterra => '0', --do not change
--        injectdbiterra => '0', --do not change
--        douta => BUS_Test_0_READ_DATA,
--        sbiterra => open, --do not change
--        dbiterra => open --do not change
--);	  


   SiClkIn : IBUFDS
   generic map (
      DIFF_TERM => TRUE, -- Differential Termination 
      IBUF_LOW_PWR => TRUE, -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
      IOSTANDARD => "DEFAULT")
   port map (
      O => iSiClkIn,  -- Buffer output
      I => Si_ClkIn_p,  -- Diff_p buffer input (connect directly to top-level port)
      IB => Si_ClkIn_n -- Diff_n buffer input (connect directly to top-level port)
   );

   SiClkOut : OBUFDS
   generic map (
      IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
      SLEW => "SLOW")          -- Specify the output slew rate
   port map (
      O => Si_ClkOut_p,     -- Diff_p output (connect directly to top-level port)
      OB => Si_ClkOut_n,   -- Diff_n output (connect directly to top-level port)
      I => iSiClkOut      -- Buffer input 
   );
  
  
  CLK_LINK(0) <= iSiClkIn;

	  U0_A1 <= CHA1;
U1_A2 <= CHA2;
U2_A3 <= CHA3;
U3_A4 <= CHA4;
U4_A5 <= CHA5;
U5_A6 <= CHA6;
U6_A7 <= CHA7;
U7_A8 <= CHA8;
U8_A9 <= CHA9;
U9_A10 <= CHA10;
U10_A11 <= CHA11;
U11_A12 <= CHA12;
U12_A13 <= CHA13;
U13_A14 <= CHA14;
U14_A15 <= CHA15;
U15_A16 <= CHA16;
U16_A17 <= CHA17;
U17_A18 <= CHA18;
U18_A19 <= CHA19;
U19_A20 <= CHA20;
U20_A21 <= CHA21;
U21_A22 <= CHA22;
U22_A23 <= CHA23;
U23_out_0 <= REG_hithrs_WR(15 downto 0);
U24_out_0 <= REG_lothrsh_WR(15 downto 0);
U25_out_0 <= REG_inhib_WR(15 downto 0);
U26_out_0 <= REG_gatel_WR(15 downto 0);
U27_out_0 <= REG_gateu_WR(15 downto 0);
U28_out_0 <= REG_delay_WR(15 downto 0);
U29_out_0 <= REG_xdelay_WR(15 downto 0);

U30_0:SUBPAGE_subdesign_1
PORT MAP(
	ain => U0_A1,
	delayed_data => U30_delayed_data_0,
	trigout => U30_trigout_0,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_1:SUBPAGE_subdesign_1
PORT MAP(
	ain => U1_A2,
	delayed_data => U30_delayed_data_1,
	trigout => U30_trigout_1,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_2:SUBPAGE_subdesign_1
PORT MAP(
	ain => U2_A3,
	delayed_data => U30_delayed_data_2,
	trigout => U30_trigout_2,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_3:SUBPAGE_subdesign_1
PORT MAP(
	ain => U3_A4,
	delayed_data => U30_delayed_data_3,
	trigout => U30_trigout_3,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_4:SUBPAGE_subdesign_1
PORT MAP(
	ain => U4_A5,
	delayed_data => U30_delayed_data_4,
	trigout => U30_trigout_4,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_5:SUBPAGE_subdesign_1
PORT MAP(
	ain => U5_A6,
	delayed_data => U30_delayed_data_5,
	trigout => U30_trigout_5,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_6:SUBPAGE_subdesign_1
PORT MAP(
	ain => U6_A7,
	delayed_data => U30_delayed_data_6,
	trigout => U30_trigout_6,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_7:SUBPAGE_subdesign_1
PORT MAP(
	ain => U7_A8,
	delayed_data => U30_delayed_data_7,
	trigout => U30_trigout_7,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_8:SUBPAGE_subdesign_1
PORT MAP(
	ain => U8_A9,
	delayed_data => U30_delayed_data_8,
	trigout => U30_trigout_8,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_9:SUBPAGE_subdesign_1
PORT MAP(
	ain => U9_A10,
	delayed_data => U30_delayed_data_9,
	trigout => U30_trigout_9,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_10:SUBPAGE_subdesign_1
PORT MAP(
	ain => U10_A11,
	delayed_data => U30_delayed_data_10,
	trigout => U30_trigout_10,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_11:SUBPAGE_subdesign_1
PORT MAP(
	ain => U11_A12,
	delayed_data => U30_delayed_data_11,
	trigout => U30_trigout_11,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_12:SUBPAGE_subdesign_1
PORT MAP(
	ain => U12_A13,
	delayed_data => U30_delayed_data_12,
	trigout => U30_trigout_12,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_13:SUBPAGE_subdesign_1
PORT MAP(
	ain => U13_A14,
	delayed_data => U30_delayed_data_13,
	trigout => U30_trigout_13,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_14:SUBPAGE_subdesign_1
PORT MAP(
	ain => U14_A15,
	delayed_data => U30_delayed_data_14,
	trigout => U30_trigout_14,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_15:SUBPAGE_subdesign_1
PORT MAP(
	ain => U15_A16,
	delayed_data => U30_delayed_data_15,
	trigout => U30_trigout_15,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_16:SUBPAGE_subdesign_1
PORT MAP(
	ain => U16_A17,
	delayed_data => U30_delayed_data_16,
	trigout => U30_trigout_16,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_17:SUBPAGE_subdesign_1
PORT MAP(
	ain => U17_A18,
	delayed_data => U30_delayed_data_17,
	trigout => U30_trigout_17,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_18:SUBPAGE_subdesign_1
PORT MAP(
	ain => U18_A19,
	delayed_data => U30_delayed_data_18,
	trigout => U30_trigout_18,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_19:SUBPAGE_subdesign_1
PORT MAP(
	ain => U19_A20,
	delayed_data => U30_delayed_data_19,
	trigout => U30_trigout_19,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_20:SUBPAGE_subdesign_1
PORT MAP(
	ain => U20_A21,
	delayed_data => U30_delayed_data_20,
	trigout => U30_trigout_20,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_21:SUBPAGE_subdesign_1
PORT MAP(
	ain => U21_A22,
	delayed_data => U30_delayed_data_21,
	trigout => U30_trigout_21,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U30_22:SUBPAGE_subdesign_1
PORT MAP(
	ain => U22_A23,
	delayed_data => U30_delayed_data_22,
	trigout => U30_trigout_22,
	pol => U31_out_0,
	hithrs => U23_out_0,
	lothrs => U24_out_0,
	inhib => U25_out_0,
	gatel => U26_out_0,
	gateu => U27_out_0,
	delay => U28_out_0,
	xdelay => U29_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);
U31_out_0 <= REG_pol_WR(0 downto 0);
U32_OUT <= U30_trigout_0 OR U30_trigout_1 OR U30_trigout_2 OR U30_trigout_3 OR U30_trigout_4 OR U30_trigout_5 OR U30_trigout_6 OR U30_trigout_7 OR U30_trigout_8 OR U30_trigout_9 OR U30_trigout_10 OR U30_trigout_11 OR U30_trigout_12 OR U30_trigout_13 OR U30_trigout_14 OR U30_trigout_15 OR U30_trigout_16 OR U30_trigout_17 OR U30_trigout_18 OR U30_trigout_19 OR U30_trigout_20 OR U30_trigout_21 OR U30_trigout_22;

U33_0:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_0,
	E => U33_E_0,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_1:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_1,
	E => U33_E_1,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_2:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_2,
	E => U33_E_2,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_3:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_3,
	E => U33_E_3,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_4:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_4,
	E => U33_E_4,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_5:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_5,
	E => U33_E_5,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_6:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_6,
	E => U33_E_6,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_7:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_7,
	E => U33_E_7,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_8:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_8,
	E => U33_E_8,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_9:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_9,
	E => U33_E_9,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_10:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_10,
	E => U33_E_10,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_11:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_11,
	E => U33_E_11,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_12:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_12,
	E => U33_E_12,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_13:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_13,
	E => U33_E_13,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_14:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_14,
	E => U33_E_14,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_15:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_15,
	E => U33_E_15,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_16:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_16,
	E => U33_E_16,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_17:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_17,
	E => U33_E_17,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_18:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_18,
	E => U33_E_18,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_19:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_19,
	E => U33_E_19,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_20:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_20,
	E => U33_E_20,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_21:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_21,
	E => U33_E_21,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);

U33_22:SUBPAGE_subdesign_2
PORT MAP(
	data_in => U30_delayed_data_22,
	E => U33_E_22,
	trig => U32_OUT,
	inttime => U34_out_0,
	preint => U35_out_0,
	pileup => U36_out_0,
	gain => U37_out_0,
	ofs => U38_out_0,
	bl => U39_out_0,
	GlobalReset => GlobalReset,
	CLK_ACQ=>CLK_ACQ ,
	BUS_CLK=>BUS_CLK ,
	CLK_40=>CLK_40 ,
	CLK_50 => "0" ,
	CLK_80=>CLK_80 ,
	clk_160=>clk_160 ,
	clk_320=>clk_320 ,
	clk_125=>clk_125 ,
	FAST_CLK_100=>FAST_CLK_100 ,
	FAST_CLK_200=>FAST_CLK_200 ,
	FAST_CLK_250=>FAST_CLK_250 ,
	FAST_CLK_250_90=>FAST_CLK_250_90 ,
	FAST_CLK_500=>FAST_CLK_500 ,
	FAST_CLK_500_90=>FAST_CLK_500_90 ,
	GlobalClock=>GlobalClock ,
	async_clk => async_clk 
);
U34_out_0 <= REG_inttime_WR(15 downto 0);
U35_out_0 <= REG_preint_WR(15 downto 0);
U36_out_0 <= REG_pileup_WR(15 downto 0);
U37_out_0 <= REG_gain_WR(15 downto 0);
U38_out_0 <= REG_ofs_WR(15 downto 0);
U39_out_0 <= REG_bl_WR(15 downto 0);

U40 : block
begin
U40_out <= U33_E_0 when U41_out_0 = "00000" else U33_E_1 when U41_out_0 = "00001" else U33_E_2 when U41_out_0 = "00010" else U33_E_3 when U41_out_0 = "00011" else U33_E_4 when U41_out_0 = "00100" else U33_E_5 when U41_out_0 = "00101" else U33_E_6 when U41_out_0 = "00110" else U33_E_7 when U41_out_0 = "00111" else U33_E_8 when U41_out_0 = "01000" else U33_E_9 when U41_out_0 = "01001" else U33_E_10 when U41_out_0 = "01010" else U33_E_11 when U41_out_0 = "01011" else U33_E_12 when U41_out_0 = "01100" else U33_E_13 when U41_out_0 = "01101" else U33_E_14 when U41_out_0 = "01110" else U33_E_15 when U41_out_0 = "01111" else U33_E_16 when U41_out_0 = "10000" else U33_E_17 when U41_out_0 = "10001" else U33_E_18 when U41_out_0 = "10010" else U33_E_19 when U41_out_0 = "10011" else U33_E_20 when U41_out_0 = "10100" else U33_E_21 when U41_out_0 = "10101" else U33_E_22 when U41_out_0 = "10110"  else (others=>'0');

end block;
U41_out_0 <= REG_CH_WR(4 downto 0);

	U42 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U40_out,
		ENERGY_STROBE => U32_OUT,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_0_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_0_READ_DATA,
		READ_INT => BUS_Spectrum_0_R_INT,
		READ_DATAVALID => BUS_Spectrum_0_VLD,
		STATUS => REG_Spectrum_0_STATUS_RD,
		CONFIG => REG_Spectrum_0_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_0_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_0_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_0_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_0_CONFIG_MAX_WR
	);

REG_FIRMWARE_BUILD <= x"20240706";
FW_STRING_0 <= x"61736466000000000000000000000000";

end Behavioral;
