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

entity TOP_R76Firmware is
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
end TOP_R76Firmware ;

architecture Behavioral of TOP_R76Firmware is
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
		REG_Spectrum_0_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_0_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_0_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_0_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_0_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_0_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_0_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_0_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_0_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_0_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_0_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_0_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_0_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_thrsh_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_thrsh_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_thrsh_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_thrsh_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_thrsh_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_0_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_1_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_2_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_3_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_4_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_5_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_6_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_7_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_8_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_9_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_10_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_11_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_12_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_13_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_14_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_15_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_16_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_17_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_18_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_19_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_20_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_21_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_22_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_23_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_24_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_24_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_24_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_25_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_25_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_25_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_26_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_26_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_26_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_27_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_27_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_27_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_28_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_28_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_28_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_29_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_29_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_29_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_30_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_30_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_30_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_31_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_31_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_31_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_12_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_12_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_12_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_12_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_12_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_12_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_12_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_12_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_12_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_12_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_12_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_12_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_12_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_12_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_12_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_12_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_12_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_12_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_12_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_12_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_12_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_12_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_12_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_1_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_1_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_1_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_1_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_1_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_1_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_1_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_1_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_1_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_1_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_1_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_1_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_1_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_1_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_1_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_1_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_1_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_1_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_1_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_1_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_1_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_1_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_1_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_13_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_13_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_13_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_13_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_13_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_13_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_13_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_13_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_13_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_13_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_13_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_13_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_13_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_13_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_13_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_13_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_13_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_13_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_13_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_13_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_13_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_13_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_13_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_2_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_2_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_2_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_2_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_2_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_2_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_2_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_2_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_2_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_2_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_2_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_2_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_2_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_2_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_2_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_2_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_2_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_2_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_2_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_2_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_2_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_2_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_2_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_14_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_14_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_14_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_14_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_14_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_14_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_14_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_14_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_14_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_14_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_14_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_14_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_14_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_14_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_14_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_14_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_14_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_14_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_14_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_14_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_14_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_14_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_14_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_3_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_3_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_3_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_3_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_3_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_3_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_3_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_3_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_3_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_3_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_3_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_3_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_3_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_3_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_3_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_3_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_3_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_3_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_3_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_3_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_3_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_3_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_3_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_15_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_15_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_15_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_15_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_15_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_15_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_15_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_15_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_15_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_15_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_15_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_15_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_15_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_15_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_15_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_15_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_15_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_15_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_15_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_15_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_15_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_15_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_15_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_4_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_4_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_4_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_4_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_4_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_4_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_4_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_4_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_4_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_4_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_4_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_4_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_4_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_4_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_4_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_4_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_4_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_4_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_4_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_4_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_4_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_4_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_4_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_16_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_16_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_16_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_16_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_16_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_16_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_16_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_16_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_16_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_16_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_16_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_16_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_16_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_16_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_16_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_16_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_16_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_16_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_16_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_16_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_16_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_16_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_16_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_5_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_5_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_5_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_5_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_5_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_5_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_5_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_5_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_5_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_5_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_5_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_5_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_5_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_5_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_5_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_5_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_5_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_5_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_5_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_5_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_5_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_5_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_5_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_17_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_17_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_17_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_17_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_17_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_17_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_17_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_17_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_17_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_17_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_17_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_17_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_17_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_17_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_17_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_17_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_17_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_17_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_17_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_17_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_17_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_17_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_17_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_top_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_top_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_top_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_top_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_top_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_0_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_1_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_2_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_3_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_4_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_5_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_6_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_7_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_8_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_9_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_10_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_11_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_12_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_13_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_14_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_15_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_16_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_17_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_18_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_19_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_20_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_21_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_22_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_23_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_24_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_24_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_24_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_25_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_25_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_25_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_26_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_26_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_26_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_27_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_27_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_27_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_28_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_28_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_28_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_29_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_29_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_29_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_30_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_30_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_30_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_31_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_31_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_31_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_6_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_6_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_6_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_6_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_6_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_6_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_6_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_6_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_6_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_6_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_6_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_6_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_6_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_6_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_6_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_6_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_6_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_6_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_6_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_6_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_6_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_6_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_6_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_18_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_18_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_18_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_18_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_18_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_18_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_18_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_18_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_18_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_18_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_18_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_18_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_18_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_18_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_18_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_18_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_18_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_18_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_18_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_18_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_18_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_18_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_18_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_disable_det_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_disable_det_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_disable_det_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_disable_det_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_disable_det_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_0_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_1_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_2_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_3_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_4_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_5_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_6_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_7_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_8_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_9_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_10_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_11_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_12_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_13_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_14_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_15_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_16_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_17_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_18_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_19_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_20_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_21_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_22_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_23_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_24_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_24_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_24_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_25_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_25_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_25_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_26_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_26_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_26_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_27_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_27_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_27_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_28_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_28_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_28_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_29_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_29_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_29_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_30_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_30_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_30_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_31_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_31_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_31_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_7_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_7_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_7_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_7_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_7_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_7_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_7_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_7_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_7_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_7_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_7_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_7_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_7_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_7_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_7_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_7_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_7_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_7_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_7_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_7_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_7_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_7_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_7_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_19_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_19_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_19_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_19_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_19_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_19_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_19_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_19_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_19_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_19_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_19_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_19_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_19_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_19_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_19_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_19_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_19_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_19_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_19_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_19_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_19_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_19_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_19_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_8_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_8_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_8_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_8_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_8_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_8_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_8_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_8_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_8_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_8_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_8_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_8_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_8_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_8_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_8_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_8_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_8_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_8_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_8_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_8_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_8_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_8_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_8_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_20_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_20_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_20_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_20_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_20_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_20_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_20_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_20_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_20_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_20_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_20_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_20_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_20_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_20_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_20_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_20_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_20_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_20_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_20_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_20_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_20_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_20_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_20_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_9_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_9_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_9_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_9_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_9_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_9_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_9_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_9_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_9_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_9_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_9_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_9_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_9_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_9_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_9_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_9_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_9_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_9_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_9_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_9_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_9_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_9_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_9_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_21_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_21_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_21_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_21_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_21_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_21_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_21_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_21_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_21_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_21_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_21_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_21_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_21_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_21_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_21_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_21_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_21_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_21_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_21_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_21_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_21_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_21_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_21_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_10_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_10_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_10_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_10_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_10_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_10_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_10_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_10_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_10_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_10_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_10_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_10_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_10_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_10_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_10_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_10_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_10_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_10_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_10_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_10_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_10_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_10_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_10_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_22_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_22_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_22_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_22_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_22_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_22_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_22_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_22_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_22_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_22_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_22_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_22_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_22_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_22_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_22_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_22_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_22_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_22_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_22_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_22_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_22_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_22_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_22_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_11_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_11_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_11_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_11_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_11_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_11_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_11_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_11_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_11_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_11_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_11_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_11_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_11_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_11_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_11_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_11_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_11_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_11_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_11_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_11_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_11_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_11_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_11_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_23_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_Spectrum_23_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_23_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Spectrum_23_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_23_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Spectrum_23_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_23_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_23_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_23_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_23_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_23_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_23_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_23_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_23_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_23_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_23_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_23_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_23_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_23_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_23_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Spectrum_23_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Spectrum_23_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Spectrum_23_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_base_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_base_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_base_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_base_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_base_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_0_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_1_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_2_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_3_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_4_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_5_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_6_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_7_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_8_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_9_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_10_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_11_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_12_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_13_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_14_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_15_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_16_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_17_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_18_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_19_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_20_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_21_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_22_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_23_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_24_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_24_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_24_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_25_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_25_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_25_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_26_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_26_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_26_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_27_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_27_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_27_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_28_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_28_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_28_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_29_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_29_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_29_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_30_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_30_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_30_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_31_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_31_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_31_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_int_time_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_int_time_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_int_time_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_int_time_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_pre_int_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_pre_int_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_pre_int_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_pre_int_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_baseline_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_baseline_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_baseline_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_baseline_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_write_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_write_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_write_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_write_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_read_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_read_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_read_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_read_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_stopwrite_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_stopwrite_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_stopwrite_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_stopwrite_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_gate_l_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_gate_l_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_gate_l_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_gate_l_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_gate_u_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_gate_u_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_gate_u_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_gate_u_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_inhib_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_inhib_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_inhib_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_inhib_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_delay_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_delay_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_delay_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_delay_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_polarity_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_polarity_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_polarity_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_polarity_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_skip_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_skip_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_skip_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_skip_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_full_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_full_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_full_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_full_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_timestamp_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_timestamp_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_timestamp_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_timestamp_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_trigger_code_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_trigger_code_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_trigger_code_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_trigger_code_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_reset_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_reset_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_reset_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_reset_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_All_Energies_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_All_Energies_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_All_Energies_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_All_Energies_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_All_Energies_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_All_Energies_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_All_Energies_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_All_Energies_READ_VALID_WORDS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_All_Energies_READ_VALID_WORDS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_All_Energies_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_All_Energies_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_All_Energies_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_0_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_RateMeter_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_NoSkip_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_RateMeter_NoSkip_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_NoSkip_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_NoSkip_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_NoSkip_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_NoSkip_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Syncs_READ_ADDRESS : OUT STD_LOGIC_VECTOR(11 downto 0); 
	BUS_Syncs_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Syncs_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Syncs_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Syncs_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Syncs_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Syncs_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Syncs_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Syncs_READ_POSITION_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Syncs_READ_POSITION_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Syncs_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Syncs_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Syncs_CONFIG_TRIGGER_MODE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Syncs_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Syncs_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Syncs_CONFIG_PRETRIGGER_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Syncs_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Syncs_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Syncs_CONFIG_TRIGGER_LEVEL_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Syncs_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Syncs_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Syncs_CONFIG_ARM_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Syncs_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Syncs_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Syncs_CONFIG_DECIMATOR_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_SyncIn1Meter_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_SyncIn1Meter_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_SyncIn1Meter_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_SyncIn1Meter_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_SyncIn1Meter_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_SyncIn1Meter_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
	BUS_SyncIn2Meter_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_SyncIn2Meter_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_SyncIn2Meter_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_SyncIn2Meter_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_SyncIn2Meter_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_SyncIn2Meter_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
	BUS_SyncIn0Meter_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_SyncIn0Meter_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_SyncIn0Meter_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_SyncIn0Meter_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_SyncIn0Meter_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_SyncIn0Meter_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_sync0_between_sync2_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_sync0_between_sync2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_sync0_between_sync2_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_sync0_between_sync2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_0_READ_ADDRESS : OUT STD_LOGIC_VECTOR(14 downto 0); 
	BUS_Oscilloscope_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Oscilloscope_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Oscilloscope_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Oscilloscope_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_READ_POSITION_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_READ_POSITION_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_CONFIG_PRETRIGGER_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Oscilloscope_0_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_CONFIG_ARM_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Oscilloscope_0_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Oscilloscope_0_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Oscilloscope_0_CONFIG_DECIMATOR_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
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
	
signal U0_out_0 : std_logic_vector(0 downto 0);
signal U1_out_0 : std_logic_vector(15 downto 0);
signal U2_out_0 : std_logic_vector(15 downto 0);
signal U3_A0 : std_logic_vector(15 downto 0);
signal U4_A1 : std_logic_vector(15 downto 0);
signal U5_A2 : std_logic_vector(15 downto 0);
signal U6_A3 : std_logic_vector(15 downto 0);
signal U7_A4 : std_logic_vector(15 downto 0);
signal U8_A5 : std_logic_vector(15 downto 0);
signal U9_A6 : std_logic_vector(15 downto 0);
signal U10_A7 : std_logic_vector(15 downto 0);
signal U11_A8 : std_logic_vector(15 downto 0);
signal U12_A9 : std_logic_vector(15 downto 0);
signal U13_A10 : std_logic_vector(15 downto 0);
signal U14_A11 : std_logic_vector(15 downto 0);
signal U15_A12 : std_logic_vector(15 downto 0);
signal U16_A13 : std_logic_vector(15 downto 0);
signal U17_A14 : std_logic_vector(15 downto 0);
signal U18_A15 : std_logic_vector(15 downto 0);
signal U19_A16 : std_logic_vector(15 downto 0);
signal U20_A17 : std_logic_vector(15 downto 0);
signal U21_A18 : std_logic_vector(15 downto 0);
signal U22_A19 : std_logic_vector(15 downto 0);
signal U23_A20 : std_logic_vector(15 downto 0);
signal U24_A21 : std_logic_vector(15 downto 0);
signal U25_A22 : std_logic_vector(15 downto 0);
signal U26_A23 : std_logic_vector(15 downto 0);
	signal U27_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U28_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal U29_out_0 : std_logic_vector(15 downto 0);
signal U30_out_0 : std_logic_vector(15 downto 0);
signal U31_out_0 : std_logic_vector(0 downto 0);
signal U32_out_0 : std_logic_vector(0 downto 0);
signal U33_out_0 : std_logic_vector(0 downto 0);
signal U34_out_0 : std_logic_vector(31 downto 0);
signal U35_out_0 : std_logic_vector(0 downto 0);
signal U36_out_0 : std_logic_vector(15 downto 0);
signal U37_out_0 : std_logic_vector(15 downto 0);
	signal BUS_Spectrum_1_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_1_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_1_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);

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

	signal BUS_Spectrum_2_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_2_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_2_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_3_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_3_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_3_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_4_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_4_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_4_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_5_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_5_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_5_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_6_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_6_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_6_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_7_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_7_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_7_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_8_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_8_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_8_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_9_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_9_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_9_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_10_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_10_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_10_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_11_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_11_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_11_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_12_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_12_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_12_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_13_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_13_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_13_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_14_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_14_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_14_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_15_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_15_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_15_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_16_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_16_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_16_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_17_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_17_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_17_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_18_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_18_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_18_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_19_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_19_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_19_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_20_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_20_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_20_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_21_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_21_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_21_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_22_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_22_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_22_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_23_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_23_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_23_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal U61_hold : std_logic_vector(31 downto 0);
signal U62_hold : std_logic_vector(31 downto 0);
signal U63_hold : std_logic_vector(31 downto 0);
signal U64_hold : std_logic_vector(31 downto 0);
signal U65_hold : std_logic_vector(31 downto 0);
signal U66_hold : std_logic_vector(31 downto 0);
signal U67_hold : std_logic_vector(31 downto 0);
signal U68_hold : std_logic_vector(31 downto 0);
signal U69_hold : std_logic_vector(31 downto 0);
signal U70_hold : std_logic_vector(31 downto 0);
signal U71_hold : std_logic_vector(31 downto 0);
signal U72_hold : std_logic_vector(31 downto 0);
	signal BUS_Spectrum_0_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Spectrum_0_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Spectrum_0_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal U74_TRIGOUT_0 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_0 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_1 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_1 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_2 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_2 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_3 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_3 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_4 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_4 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_5 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_5 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_6 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_6 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_7 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_7 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_8 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_8 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_9 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_9 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_10 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_10 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_11 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_11 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_12 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_12 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_13 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_13 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_14 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_14 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_15 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_15 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_16 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_16 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_17 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_17 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_18 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_18 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_19 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_19 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_20 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_20 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_21 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_21 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_22 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_22 : std_logic_vector(15 downto 0);
	signal U74_TRIGOUT_23 : std_logic_vector(0 downto 0);
	signal U74_ANALOGOUT_23 : std_logic_vector(15 downto 0);

COMPONENT SUBPAGE_LowerTrigger
PORT(
	AIN : IN std_logic_vector(15 downto 0);
	disable_det : IN std_logic_vector(0 downto 0);
	thrsh : IN std_logic_vector(15 downto 0);
	TRIGOUT : OUT std_logic_vector(0 downto 0);
	ANALOGOUT : OUT std_logic_vector(15 downto 0);
	gate : IN std_logic_vector(15 downto 0);
	polarity : IN std_logic_vector(0 downto 0);
	inhib : IN std_logic_vector(15 downto 0);
	delay : IN std_logic_vector(15 downto 0);
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
	signal U75_Reduced : std_logic_vector(0 downto 0);

COMPONENT SUBPAGE_ReduceRate
PORT(
	Original : IN std_logic_vector(0 downto 0);
	skip : IN std_logic_vector(31 downto 0);
	gate : IN std_logic_vector(15 downto 0);
	reset : IN std_logic_vector(0 downto 0);
	delay : IN std_logic_vector(15 downto 0);
	Reduced : OUT std_logic_vector(0 downto 0);
	GlobalReset: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	CLK_ACQ: in std_logic_vector (0 downto 0);
	BUS_CLK: in std_logic_vector (0 downto 0);
	CLK_40: in std_logic_vector (0 downto 0);
	CLK_50: in std_logic_vector (0 downto 0);
	CLK_80: in std_logic_vector (0 downto 0);
	clk_160: in std_logic_vector (0 downto 0);
	clk_125: in std_logic_vector (0 downto 0);
	clk_320: in std_logic_vector (0 downto 0);
	FAST_CLK_100: in std_logic_vector (0 downto 0);
	FAST_CLK_200: in std_logic_vector (0 downto 0);
	FAST_CLK_250: in std_logic_vector (0 downto 0);
	FAST_CLK_250_90: in std_logic_vector (0 downto 0);
	FAST_CLK_500: in std_logic_vector (0 downto 0);
	FAST_CLK_500_90: in std_logic_vector (0 downto 0);
	GlobalClock: in std_logic_vector (0 downto 0);
	async_clk: IN STD_LOGIC_VECTOR(0 DOWNTO 0));
END COMPONENT;
signal U76_out_0 : std_logic_vector(23 downto 0) := (others => '0');
	signal U77_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal U78_hold : std_logic_vector(31 downto 0);
	signal U79_TIMESTAMP : STD_LOGIC_VECTOR(31 DOWNTO 0);

	COMPONENT TimestampGenerator
		GENERIC( 
			nbits : INTEGER := 32
		);
		PORT( 
			TIMESTAMP : out STD_LOGIC_VECTOR(nbits-1 downto 0);
			T0 : in STD_LOGIC;
			CLK_READ : in STD_LOGIC;
			ClkCounter : in STD_LOGIC
		);
	END COMPONENT;

signal U80_hold : std_logic_vector(31 downto 0);
signal U81_out : std_logic_vector(31 downto 0) := (others => '0');
	signal U82_TRIGOUT_0 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_1 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_2 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_3 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_4 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_5 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_6 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_7 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_8 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_9 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_10 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_11 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_12 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_13 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_14 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_15 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_16 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_17 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_18 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_19 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_20 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_21 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_22 : std_logic_vector(0 downto 0);
	signal U82_TRIGOUT_23 : std_logic_vector(0 downto 0);

COMPONENT SUBPAGE_UpperTrigger
PORT(
	AIN : IN std_logic_vector(15 downto 0);
	top : IN std_logic_vector(15 downto 0);
	TRIGOUT : OUT std_logic_vector(0 downto 0);
	polarity : IN std_logic_vector(0 downto 0);
	gate : IN std_logic_vector(15 downto 0);
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
	signal U83_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal U84_CONST : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
signal U85_0 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_1 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_2 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_3 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_4 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_5 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_6 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_7 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_8 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_9 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_10 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_11 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_12 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_13 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_14 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_15 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_16 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_17 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_18 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_19 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_20 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_21 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_22 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_23 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_24 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_25 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_26 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_27 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_28 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_29 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_30 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_31 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U86_0 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_1 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_2 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_3 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_4 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_5 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_6 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_7 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_8 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_9 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_10 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_11 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_12 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_13 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_14 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_15 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_16 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_17 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_18 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_19 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_20 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_21 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_22 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_23 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_24 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_25 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_26 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_27 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_28 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_29 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_30 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_31 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U87_0 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_1 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_2 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_3 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_4 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_5 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_6 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_7 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_8 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_9 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_10 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_11 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_12 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_13 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_14 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_15 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_16 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_17 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_18 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_19 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_20 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_21 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_22 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_23 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_24 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_25 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_26 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_27 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_28 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_29 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_30 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U87_31 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U88_out_0 : std_logic_vector(0 downto 0);
	signal U89_energy_0 : std_logic_vector(15 downto 0);
	signal U89_valid_0 : std_logic_vector(0 downto 0);
	signal U89_int_gate_0 : std_logic_vector(0 downto 0);
	signal U89_energy_1 : std_logic_vector(15 downto 0);
	signal U89_valid_1 : std_logic_vector(0 downto 0);
	signal U89_int_gate_1 : std_logic_vector(0 downto 0);
	signal U89_energy_2 : std_logic_vector(15 downto 0);
	signal U89_valid_2 : std_logic_vector(0 downto 0);
	signal U89_int_gate_2 : std_logic_vector(0 downto 0);
	signal U89_energy_3 : std_logic_vector(15 downto 0);
	signal U89_valid_3 : std_logic_vector(0 downto 0);
	signal U89_int_gate_3 : std_logic_vector(0 downto 0);
	signal U89_energy_4 : std_logic_vector(15 downto 0);
	signal U89_valid_4 : std_logic_vector(0 downto 0);
	signal U89_int_gate_4 : std_logic_vector(0 downto 0);
	signal U89_energy_5 : std_logic_vector(15 downto 0);
	signal U89_valid_5 : std_logic_vector(0 downto 0);
	signal U89_int_gate_5 : std_logic_vector(0 downto 0);
	signal U89_energy_6 : std_logic_vector(15 downto 0);
	signal U89_valid_6 : std_logic_vector(0 downto 0);
	signal U89_int_gate_6 : std_logic_vector(0 downto 0);
	signal U89_energy_7 : std_logic_vector(15 downto 0);
	signal U89_valid_7 : std_logic_vector(0 downto 0);
	signal U89_int_gate_7 : std_logic_vector(0 downto 0);
	signal U89_energy_8 : std_logic_vector(15 downto 0);
	signal U89_valid_8 : std_logic_vector(0 downto 0);
	signal U89_int_gate_8 : std_logic_vector(0 downto 0);
	signal U89_energy_9 : std_logic_vector(15 downto 0);
	signal U89_valid_9 : std_logic_vector(0 downto 0);
	signal U89_int_gate_9 : std_logic_vector(0 downto 0);
	signal U89_energy_10 : std_logic_vector(15 downto 0);
	signal U89_valid_10 : std_logic_vector(0 downto 0);
	signal U89_int_gate_10 : std_logic_vector(0 downto 0);
	signal U89_energy_11 : std_logic_vector(15 downto 0);
	signal U89_valid_11 : std_logic_vector(0 downto 0);
	signal U89_int_gate_11 : std_logic_vector(0 downto 0);
	signal U89_energy_12 : std_logic_vector(15 downto 0);
	signal U89_valid_12 : std_logic_vector(0 downto 0);
	signal U89_int_gate_12 : std_logic_vector(0 downto 0);
	signal U89_energy_13 : std_logic_vector(15 downto 0);
	signal U89_valid_13 : std_logic_vector(0 downto 0);
	signal U89_int_gate_13 : std_logic_vector(0 downto 0);
	signal U89_energy_14 : std_logic_vector(15 downto 0);
	signal U89_valid_14 : std_logic_vector(0 downto 0);
	signal U89_int_gate_14 : std_logic_vector(0 downto 0);
	signal U89_energy_15 : std_logic_vector(15 downto 0);
	signal U89_valid_15 : std_logic_vector(0 downto 0);
	signal U89_int_gate_15 : std_logic_vector(0 downto 0);
	signal U89_energy_16 : std_logic_vector(15 downto 0);
	signal U89_valid_16 : std_logic_vector(0 downto 0);
	signal U89_int_gate_16 : std_logic_vector(0 downto 0);
	signal U89_energy_17 : std_logic_vector(15 downto 0);
	signal U89_valid_17 : std_logic_vector(0 downto 0);
	signal U89_int_gate_17 : std_logic_vector(0 downto 0);
	signal U89_energy_18 : std_logic_vector(15 downto 0);
	signal U89_valid_18 : std_logic_vector(0 downto 0);
	signal U89_int_gate_18 : std_logic_vector(0 downto 0);
	signal U89_energy_19 : std_logic_vector(15 downto 0);
	signal U89_valid_19 : std_logic_vector(0 downto 0);
	signal U89_int_gate_19 : std_logic_vector(0 downto 0);
	signal U89_energy_20 : std_logic_vector(15 downto 0);
	signal U89_valid_20 : std_logic_vector(0 downto 0);
	signal U89_int_gate_20 : std_logic_vector(0 downto 0);
	signal U89_energy_21 : std_logic_vector(15 downto 0);
	signal U89_valid_21 : std_logic_vector(0 downto 0);
	signal U89_int_gate_21 : std_logic_vector(0 downto 0);
	signal U89_energy_22 : std_logic_vector(15 downto 0);
	signal U89_valid_22 : std_logic_vector(0 downto 0);
	signal U89_int_gate_22 : std_logic_vector(0 downto 0);
	signal U89_energy_23 : std_logic_vector(15 downto 0);
	signal U89_valid_23 : std_logic_vector(0 downto 0);
	signal U89_int_gate_23 : std_logic_vector(0 downto 0);

COMPONENT SUBPAGE_ChargeIntegrator
PORT(
	analog_in : IN std_logic_vector(15 downto 0);
	base : IN std_logic_vector(15 downto 0);
	energy : OUT std_logic_vector(15 downto 0);
	valid : OUT std_logic_vector(0 downto 0);
	int_gate : OUT std_logic_vector(0 downto 0);
	dummy : OUT std_logic_vector(0 downto 0);
	trig : IN std_logic_vector(0 downto 0);
	int_time : IN std_logic_vector(15 downto 0);
	pre_int : IN std_logic_vector(15 downto 0);
	cant_out : IN std_logic_vector(0 downto 0);
	force_out : IN std_logic_vector(0 downto 0);
	force_stop : IN std_logic_vector(0 downto 0);
	manual_base : IN std_logic_vector(0 downto 0);
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
signal U90_0 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_1 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_2 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_3 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_4 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_5 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_6 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_7 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_8 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_9 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_10 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_11 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_12 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_13 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_14 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_15 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_16 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_17 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_18 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_19 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_20 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_21 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_22 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_23 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_24 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_25 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_26 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_27 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_28 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_29 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_30 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U90_31 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U91_hold : std_logic_vector(31 downto 0);
	signal U92_FIFO_FULL : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal BUS_All_Energies_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_All_Energies_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_All_Energies_READ_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal REG_All_Energies_READ_VALID_WORDS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);

	COMPONENT U92_custompacket
		GENERIC( 
			memLength : INTEGER := 32768;
			wordWidth : INTEGER := 32
		);
		PORT( 
			IN_2 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_3 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_4 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_5 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_6 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_7 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_8 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_9 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_10 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_11 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_12 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_13 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_14 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_15 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_16 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_17 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_18 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_19 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_20 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_21 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_22 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_23 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_24 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_25 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_26 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_27 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_28 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_29 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_30 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_31 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_32 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_33 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_1 : in STD_LOGIC_VECTOR(31 downto 0);
			IN_34 : in STD_LOGIC_VECTOR(31 downto 0);
			TRIG : in STD_LOGIC_VECTOR(0 downto 0);
			CLK_WRITE : in STD_LOGIC_VECTOR(0 downto 0);
			SYNC_TRIG : in STD_LOGIC_VECTOR(0 downto 0);
			SYNC_RESET : in STD_LOGIC_VECTOR(0 downto 0);
			SYNC_CLK : in STD_LOGIC_VECTOR(0 downto 0);
			BUSY : out STD_LOGIC_VECTOR(0 downto 0);
			FIFO_FULL : out STD_LOGIC_VECTOR(0 downto 0);
			RUN : out STD_LOGIC_VECTOR(0 downto 0);
			RESET : in STD_LOGIC_VECTOR(0 downto 0);
			CLK_READ : in STD_LOGIC_VECTOR(0 downto 0);
			READ_DATA : out STD_LOGIC_VECTOR(31 downto 0);
			READ_DATAVALID : out STD_LOGIC_VECTOR(0 downto 0);
			READ_RD_INT : in STD_LOGIC_VECTOR(0 downto 0);
			READ_STATUS : out STD_LOGIC_VECTOR(31 downto 0);
			READ_VALID_WORDS : out STD_LOGIC_VECTOR(31 downto 0);
			CONFIG : in STD_LOGIC_VECTOR(31 downto 0)
		);
	END COMPONENT;

	signal U93_SYNC_0 : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal BUS_RateMeter_0_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_RateMeter_0_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);

	COMPONENT MCRateMeter
		GENERIC( 
			CHANNEL_COUNT : INTEGER := 1;
			CLK_FREQ : INTEGER := 1250000000
		);
		PORT( 
			trigger : in STD_LOGIC_VECTOR(CHANNEL_COUNT-1 downto 0);
			VETO : in STD_LOGIC;
			START : in STD_LOGIC;
			CLK : in STD_LOGIC;
			CLK_READ : in STD_LOGIC_VECTOR(0 downto 0);
			READ_ADDRESS : in STD_LOGIC_VECTOR(15 downto 0);
			READ_DATA : out STD_LOGIC_VECTOR(31 downto 0);
			READ_DATAVALID : out STD_LOGIC_VECTOR(0 downto 0)
		);
	END COMPONENT;

	signal BUS_RateMeter_NoSkip_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_RateMeter_NoSkip_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal BUS_Syncs_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Syncs_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Syncs_READ_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal REG_Syncs_READ_POSITION_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);

	COMPONENT xlx_oscilloscope_sync
		GENERIC( 
			channels : INTEGER := 3;
			memLength : INTEGER := 1024;
			wordWidth : INTEGER := 16
		);
		PORT( 
			ANALOG : in STD_LOGIC_VECTOR((wordWidth*channels)-1 downto 0);
			D0 : in STD_LOGIC_VECTOR(channels-1 downto 0);
			D1 : in STD_LOGIC_VECTOR(channels-1 downto 0);
			D2 : in STD_LOGIC_VECTOR(channels-1 downto 0);
			D3 : in STD_LOGIC_VECTOR(channels-1 downto 0);
			TRIG : in STD_LOGIC_VECTOR(0 downto 0);
			BUSY : out STD_LOGIC_VECTOR(0 downto 0);
			CE : in STD_LOGIC_VECTOR(0 downto 0);
			CLK_WRITE : in STD_LOGIC_VECTOR(0 downto 0);
			RESET : in STD_LOGIC_VECTOR(0 downto 0);
			CLK_READ : in STD_LOGIC_VECTOR(0 downto 0);
			READ_ADDRESS : in STD_LOGIC_VECTOR(integer(ceil(log2(real(memLength*channels))))-1 downto 0);
			READ_DATA : out STD_LOGIC_VECTOR(31 downto 0);
			READ_DATAVALID : out STD_LOGIC_VECTOR(0 downto 0);
			READ_STATUS : out STD_LOGIC_VECTOR(31 downto 0);
			READ_POSITION : out STD_LOGIC_VECTOR(31 downto 0);
			CONFIG_TRIGGER_MODE : in STD_LOGIC_VECTOR(31 downto 0);
			CONFIG_TRIGGER_LEVEL : in STD_LOGIC_VECTOR(31 downto 0);
			CONFIG_PRETRIGGER : in STD_LOGIC_VECTOR(31 downto 0);
			CONFIG_DECIMATOR : in STD_LOGIC_VECTOR(31 downto 0);
			CONFIG_ARM : in STD_LOGIC_VECTOR(31 downto 0)
		);
	END COMPONENT;

signal U97_out : std_logic_vector(15 downto 0) := (others => '0');
signal U98_out : std_logic_vector(15 downto 0) := (others => '0');
signal U99_out : std_logic_vector(15 downto 0) := (others => '0');
	signal U100_SYNC_1 : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U101_SYNC_2 : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal BUS_SyncIn1Meter_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_SyncIn1Meter_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal BUS_SyncIn2Meter_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_SyncIn2Meter_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal BUS_SyncIn0Meter_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_SyncIn0Meter_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U105_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U106_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
Component COUNTER_RISING Is
   Generic(bitSize : Integer := 1);
   port(        RESET :  IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CLK: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        SIGIN : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        ENABLE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        COUNTER: OUT STD_LOGIC_VECTOR (31 downto 0);
        OVERFLOW: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
End component;
signal U107_counts : std_logic_vector(31 downto 0) := (others => '0');
signal U108_hold : std_logic_vector(31 downto 0);
	signal BUS_Oscilloscope_0_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Oscilloscope_0_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Oscilloscope_0_READ_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal REG_Oscilloscope_0_READ_POSITION_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal U111_out : std_logic_vector(15 downto 0) := (others => '0');
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
	signal BUS_thrsh_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_thrsh_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_thrsh_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_thrsh_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_thrsh_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_thrsh_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_thrsh_0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_24_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_24_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_25_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_25_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_26_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_26_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_27_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_27_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_28_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_28_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_29_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_29_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_30_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_30_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_31_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_31_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_12_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_12_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_12_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_12_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_12_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_12_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_12_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_12_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_12_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_12_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_12_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_12_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_12_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_12_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_12_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_1_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_1_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_1_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_1_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_1_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_1_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_1_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_1_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_1_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_1_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_1_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_1_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_1_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_1_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_1_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_13_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_13_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_13_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_13_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_13_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_13_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_13_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_13_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_13_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_13_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_13_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_13_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_13_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_13_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_13_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_2_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_2_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_2_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_2_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_2_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_2_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_2_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_2_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_2_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_2_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_2_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_2_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_2_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_2_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_2_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_14_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_14_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_14_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_14_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_14_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_14_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_14_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_14_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_14_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_14_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_14_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_14_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_14_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_14_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_14_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_3_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_3_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_3_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_3_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_3_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_3_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_3_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_3_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_3_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_3_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_3_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_3_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_3_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_3_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_3_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_15_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_15_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_15_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_15_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_15_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_15_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_15_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_15_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_15_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_15_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_15_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_15_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_15_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_15_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_15_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_4_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_4_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_4_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_4_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_4_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_4_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_4_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_4_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_4_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_4_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_4_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_4_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_4_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_4_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_4_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_16_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_16_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_16_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_16_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_16_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_16_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_16_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_16_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_16_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_16_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_16_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_16_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_16_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_16_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_16_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_5_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_5_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_5_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_5_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_5_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_5_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_5_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_5_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_5_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_5_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_5_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_5_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_5_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_5_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_5_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_17_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_17_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_17_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_17_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_17_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_17_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_17_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_17_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_17_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_17_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_17_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_17_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_17_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_17_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_17_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_top_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_top_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_top_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_top_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_top_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_top_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_top_0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_24_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_24_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_25_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_25_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_26_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_26_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_27_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_27_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_28_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_28_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_29_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_29_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_30_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_30_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_31_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_31_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_6_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_6_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_6_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_6_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_6_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_6_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_6_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_6_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_6_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_6_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_6_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_6_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_6_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_6_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_6_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_18_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_18_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_18_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_18_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_18_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_18_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_18_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_18_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_18_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_18_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_18_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_18_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_18_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_18_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_18_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_disable_det_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_disable_det_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_disable_det_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_disable_det_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_disable_det_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_disable_det_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_disable_det_0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_24_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_24_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_25_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_25_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_26_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_26_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_27_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_27_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_28_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_28_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_29_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_29_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_30_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_30_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_31_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_31_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_7_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_7_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_7_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_7_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_7_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_7_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_7_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_7_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_7_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_7_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_7_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_7_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_7_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_7_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_7_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_19_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_19_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_19_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_19_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_19_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_19_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_19_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_19_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_19_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_19_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_19_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_19_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_19_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_19_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_19_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_8_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_8_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_8_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_8_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_8_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_8_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_8_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_8_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_8_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_8_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_8_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_8_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_8_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_8_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_8_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_20_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_20_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_20_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_20_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_20_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_20_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_20_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_20_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_20_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_20_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_20_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_20_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_20_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_20_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_20_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_9_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_9_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_9_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_9_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_9_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_9_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_9_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_9_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_9_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_9_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_9_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_9_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_9_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_9_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_9_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_21_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_21_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_21_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_21_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_21_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_21_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_21_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_21_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_21_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_21_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_21_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_21_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_21_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_21_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_21_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_10_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_10_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_10_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_10_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_10_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_10_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_10_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_10_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_10_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_10_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_10_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_10_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_10_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_10_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_10_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_22_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_22_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_22_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_22_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_22_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_22_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_22_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_22_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_22_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_22_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_22_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_22_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_22_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_22_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_22_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_11_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_11_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_11_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_11_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_11_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_11_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_11_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_11_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_11_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_11_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_11_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_11_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_11_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_11_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_11_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_23_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_Spectrum_23_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Spectrum_23_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Spectrum_23_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Spectrum_23_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_23_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_23_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_23_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_23_CONFIG_LIMIT_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_23_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_23_CONFIG_REBIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_23_CONFIG_MIN_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_23_CONFIG_MIN_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Spectrum_23_CONFIG_MAX_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Spectrum_23_CONFIG_MAX_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_base_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_base_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_base_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_base_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_base_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_base_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_base_0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_24_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_24_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_25_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_25_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_26_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_26_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_27_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_27_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_28_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_28_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_29_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_29_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_30_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_30_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_31_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_31_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_All_Energies_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_All_Energies_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_All_Energies_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_All_Energies_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_All_Energies_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_All_Energies_READ_VALID_WORDS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_All_Energies_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_All_Energies_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_0_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_RateMeter_0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_RateMeter_0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_NoSkip_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_RateMeter_NoSkip_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_RateMeter_NoSkip_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_NoSkip_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Syncs_READ_ADDRESS : STD_LOGIC_VECTOR(11 downto 0);
	signal BUS_Syncs_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Syncs_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Syncs_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Syncs_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Syncs_READ_POSITION_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Syncs_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Syncs_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Syncs_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Syncs_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Syncs_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Syncs_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Syncs_CONFIG_ARM_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Syncs_CONFIG_ARM_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Syncs_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Syncs_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_SyncIn1Meter_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_SyncIn1Meter_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_SyncIn1Meter_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_SyncIn1Meter_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_SyncIn2Meter_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_SyncIn2Meter_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_SyncIn2Meter_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_SyncIn2Meter_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_SyncIn0Meter_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_SyncIn0Meter_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_SyncIn0Meter_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_SyncIn0Meter_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Oscilloscope_0_READ_ADDRESS : STD_LOGIC_VECTOR(14 downto 0);
	signal BUS_Oscilloscope_0_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Oscilloscope_0_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Oscilloscope_0_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Oscilloscope_0_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Oscilloscope_0_READ_POSITION_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_0_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_0_CONFIG_ARM_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_0_CONFIG_ARM_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Oscilloscope_0_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Oscilloscope_0_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_int_time_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_int_time_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_int_time_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_int_time_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_pre_int_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_pre_int_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_pre_int_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_pre_int_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_baseline_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_baseline_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_baseline_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_baseline_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_write_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_write_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_write_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_write_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_read_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_read_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_read_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_read_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_stopwrite_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_stopwrite_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_stopwrite_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_stopwrite_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_gate_l_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_gate_l_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_gate_l_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_gate_l_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_gate_u_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_gate_u_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_gate_u_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_gate_u_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_inhib_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_inhib_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_inhib_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_inhib_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_delay_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_delay_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_delay_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_delay_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_polarity_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_polarity_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_polarity_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_polarity_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_skip_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_skip_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_skip_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_skip_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_full_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_full_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_full_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_full_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_timestamp_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_timestamp_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_timestamp_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_timestamp_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_trigger_code_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_trigger_code_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_trigger_code_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_trigger_code_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_reset_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_reset_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_reset_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_reset_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_sync0_between_sync2_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_sync0_between_sync2_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_sync0_between_sync2_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_sync0_between_sync2_RD : STD_LOGIC_VECTOR(0 downto 0); 
	
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
		REG_Spectrum_0_CONFIG_RD => REG_Spectrum_0_CONFIG_WR,
		REG_Spectrum_0_CONFIG_LIMIT_WR => REG_Spectrum_0_CONFIG_LIMIT_WR,
		INT_Spectrum_0_CONFIG_LIMIT_WR => INT_Spectrum_0_CONFIG_LIMIT_WR,
		REG_Spectrum_0_CONFIG_LIMIT_RD => REG_Spectrum_0_CONFIG_LIMIT_WR,
		REG_Spectrum_0_CONFIG_REBIN_WR => REG_Spectrum_0_CONFIG_REBIN_WR,
		INT_Spectrum_0_CONFIG_REBIN_WR => INT_Spectrum_0_CONFIG_REBIN_WR,
		REG_Spectrum_0_CONFIG_REBIN_RD => REG_Spectrum_0_CONFIG_REBIN_WR,
		REG_Spectrum_0_CONFIG_MIN_WR => REG_Spectrum_0_CONFIG_MIN_WR,
		INT_Spectrum_0_CONFIG_MIN_WR => INT_Spectrum_0_CONFIG_MIN_WR,
		REG_Spectrum_0_CONFIG_MIN_RD => REG_Spectrum_0_CONFIG_MIN_WR,
		REG_Spectrum_0_CONFIG_MAX_WR => REG_Spectrum_0_CONFIG_MAX_WR,
		INT_Spectrum_0_CONFIG_MAX_WR => INT_Spectrum_0_CONFIG_MAX_WR,
		REG_Spectrum_0_CONFIG_MAX_RD => REG_Spectrum_0_CONFIG_MAX_WR,
	BUS_thrsh_READ_DATA => BUS_thrsh_READ_DATA,
	BUS_thrsh_WRITE_DATA => BUS_thrsh_WRITE_DATA,
	BUS_thrsh_W_INT => BUS_thrsh_W_INT,
	BUS_thrsh_R_INT => BUS_thrsh_R_INT,
	BUS_thrsh_VLD => BUS_thrsh_VLD,
		REG_thrsh_0_WR => REG_thrsh_0_WR,
		INT_thrsh_0_WR => INT_thrsh_0_WR,
		REG_thrsh_0_RD => REG_thrsh_0_WR,
		REG_thrsh_1_WR => REG_thrsh_1_WR,
		INT_thrsh_1_WR => INT_thrsh_1_WR,
		REG_thrsh_1_RD => REG_thrsh_1_WR,
		REG_thrsh_2_WR => REG_thrsh_2_WR,
		INT_thrsh_2_WR => INT_thrsh_2_WR,
		REG_thrsh_2_RD => REG_thrsh_2_WR,
		REG_thrsh_3_WR => REG_thrsh_3_WR,
		INT_thrsh_3_WR => INT_thrsh_3_WR,
		REG_thrsh_3_RD => REG_thrsh_3_WR,
		REG_thrsh_4_WR => REG_thrsh_4_WR,
		INT_thrsh_4_WR => INT_thrsh_4_WR,
		REG_thrsh_4_RD => REG_thrsh_4_WR,
		REG_thrsh_5_WR => REG_thrsh_5_WR,
		INT_thrsh_5_WR => INT_thrsh_5_WR,
		REG_thrsh_5_RD => REG_thrsh_5_WR,
		REG_thrsh_6_WR => REG_thrsh_6_WR,
		INT_thrsh_6_WR => INT_thrsh_6_WR,
		REG_thrsh_6_RD => REG_thrsh_6_WR,
		REG_thrsh_7_WR => REG_thrsh_7_WR,
		INT_thrsh_7_WR => INT_thrsh_7_WR,
		REG_thrsh_7_RD => REG_thrsh_7_WR,
		REG_thrsh_8_WR => REG_thrsh_8_WR,
		INT_thrsh_8_WR => INT_thrsh_8_WR,
		REG_thrsh_8_RD => REG_thrsh_8_WR,
		REG_thrsh_9_WR => REG_thrsh_9_WR,
		INT_thrsh_9_WR => INT_thrsh_9_WR,
		REG_thrsh_9_RD => REG_thrsh_9_WR,
		REG_thrsh_10_WR => REG_thrsh_10_WR,
		INT_thrsh_10_WR => INT_thrsh_10_WR,
		REG_thrsh_10_RD => REG_thrsh_10_WR,
		REG_thrsh_11_WR => REG_thrsh_11_WR,
		INT_thrsh_11_WR => INT_thrsh_11_WR,
		REG_thrsh_11_RD => REG_thrsh_11_WR,
		REG_thrsh_12_WR => REG_thrsh_12_WR,
		INT_thrsh_12_WR => INT_thrsh_12_WR,
		REG_thrsh_12_RD => REG_thrsh_12_WR,
		REG_thrsh_13_WR => REG_thrsh_13_WR,
		INT_thrsh_13_WR => INT_thrsh_13_WR,
		REG_thrsh_13_RD => REG_thrsh_13_WR,
		REG_thrsh_14_WR => REG_thrsh_14_WR,
		INT_thrsh_14_WR => INT_thrsh_14_WR,
		REG_thrsh_14_RD => REG_thrsh_14_WR,
		REG_thrsh_15_WR => REG_thrsh_15_WR,
		INT_thrsh_15_WR => INT_thrsh_15_WR,
		REG_thrsh_15_RD => REG_thrsh_15_WR,
		REG_thrsh_16_WR => REG_thrsh_16_WR,
		INT_thrsh_16_WR => INT_thrsh_16_WR,
		REG_thrsh_16_RD => REG_thrsh_16_WR,
		REG_thrsh_17_WR => REG_thrsh_17_WR,
		INT_thrsh_17_WR => INT_thrsh_17_WR,
		REG_thrsh_17_RD => REG_thrsh_17_WR,
		REG_thrsh_18_WR => REG_thrsh_18_WR,
		INT_thrsh_18_WR => INT_thrsh_18_WR,
		REG_thrsh_18_RD => REG_thrsh_18_WR,
		REG_thrsh_19_WR => REG_thrsh_19_WR,
		INT_thrsh_19_WR => INT_thrsh_19_WR,
		REG_thrsh_19_RD => REG_thrsh_19_WR,
		REG_thrsh_20_WR => REG_thrsh_20_WR,
		INT_thrsh_20_WR => INT_thrsh_20_WR,
		REG_thrsh_20_RD => REG_thrsh_20_WR,
		REG_thrsh_21_WR => REG_thrsh_21_WR,
		INT_thrsh_21_WR => INT_thrsh_21_WR,
		REG_thrsh_21_RD => REG_thrsh_21_WR,
		REG_thrsh_22_WR => REG_thrsh_22_WR,
		INT_thrsh_22_WR => INT_thrsh_22_WR,
		REG_thrsh_22_RD => REG_thrsh_22_WR,
		REG_thrsh_23_WR => REG_thrsh_23_WR,
		INT_thrsh_23_WR => INT_thrsh_23_WR,
		REG_thrsh_23_RD => REG_thrsh_23_WR,
		REG_thrsh_24_WR => REG_thrsh_24_WR,
		INT_thrsh_24_WR => INT_thrsh_24_WR,
		REG_thrsh_24_RD => REG_thrsh_24_WR,
		REG_thrsh_25_WR => REG_thrsh_25_WR,
		INT_thrsh_25_WR => INT_thrsh_25_WR,
		REG_thrsh_25_RD => REG_thrsh_25_WR,
		REG_thrsh_26_WR => REG_thrsh_26_WR,
		INT_thrsh_26_WR => INT_thrsh_26_WR,
		REG_thrsh_26_RD => REG_thrsh_26_WR,
		REG_thrsh_27_WR => REG_thrsh_27_WR,
		INT_thrsh_27_WR => INT_thrsh_27_WR,
		REG_thrsh_27_RD => REG_thrsh_27_WR,
		REG_thrsh_28_WR => REG_thrsh_28_WR,
		INT_thrsh_28_WR => INT_thrsh_28_WR,
		REG_thrsh_28_RD => REG_thrsh_28_WR,
		REG_thrsh_29_WR => REG_thrsh_29_WR,
		INT_thrsh_29_WR => INT_thrsh_29_WR,
		REG_thrsh_29_RD => REG_thrsh_29_WR,
		REG_thrsh_30_WR => REG_thrsh_30_WR,
		INT_thrsh_30_WR => INT_thrsh_30_WR,
		REG_thrsh_30_RD => REG_thrsh_30_WR,
		REG_thrsh_31_WR => REG_thrsh_31_WR,
		INT_thrsh_31_WR => INT_thrsh_31_WR,
		REG_thrsh_31_RD => REG_thrsh_31_WR,
	BUS_Spectrum_12_READ_ADDRESS => BUS_Spectrum_12_READ_ADDRESS,
	BUS_Spectrum_12_READ_DATA => BUS_Spectrum_12_READ_DATA,
	BUS_Spectrum_12_WRITE_DATA => BUS_Spectrum_12_WRITE_DATA,
	BUS_Spectrum_12_W_INT => BUS_Spectrum_12_W_INT,
	BUS_Spectrum_12_R_INT => BUS_Spectrum_12_R_INT,
	BUS_Spectrum_12_VLD => BUS_Spectrum_12_VLD,
		REG_Spectrum_12_STATUS_RD => REG_Spectrum_12_STATUS_RD,
		INT_Spectrum_12_STATUS_RD => INT_Spectrum_12_STATUS_RD,
		REG_Spectrum_12_CONFIG_WR => REG_Spectrum_12_CONFIG_WR,
		INT_Spectrum_12_CONFIG_WR => INT_Spectrum_12_CONFIG_WR,
		REG_Spectrum_12_CONFIG_RD => REG_Spectrum_12_CONFIG_WR,
		REG_Spectrum_12_CONFIG_LIMIT_WR => REG_Spectrum_12_CONFIG_LIMIT_WR,
		INT_Spectrum_12_CONFIG_LIMIT_WR => INT_Spectrum_12_CONFIG_LIMIT_WR,
		REG_Spectrum_12_CONFIG_LIMIT_RD => REG_Spectrum_12_CONFIG_LIMIT_WR,
		REG_Spectrum_12_CONFIG_REBIN_WR => REG_Spectrum_12_CONFIG_REBIN_WR,
		INT_Spectrum_12_CONFIG_REBIN_WR => INT_Spectrum_12_CONFIG_REBIN_WR,
		REG_Spectrum_12_CONFIG_REBIN_RD => REG_Spectrum_12_CONFIG_REBIN_WR,
		REG_Spectrum_12_CONFIG_MIN_WR => REG_Spectrum_12_CONFIG_MIN_WR,
		INT_Spectrum_12_CONFIG_MIN_WR => INT_Spectrum_12_CONFIG_MIN_WR,
		REG_Spectrum_12_CONFIG_MIN_RD => REG_Spectrum_12_CONFIG_MIN_WR,
		REG_Spectrum_12_CONFIG_MAX_WR => REG_Spectrum_12_CONFIG_MAX_WR,
		INT_Spectrum_12_CONFIG_MAX_WR => INT_Spectrum_12_CONFIG_MAX_WR,
		REG_Spectrum_12_CONFIG_MAX_RD => REG_Spectrum_12_CONFIG_MAX_WR,
	BUS_Spectrum_1_READ_ADDRESS => BUS_Spectrum_1_READ_ADDRESS,
	BUS_Spectrum_1_READ_DATA => BUS_Spectrum_1_READ_DATA,
	BUS_Spectrum_1_WRITE_DATA => BUS_Spectrum_1_WRITE_DATA,
	BUS_Spectrum_1_W_INT => BUS_Spectrum_1_W_INT,
	BUS_Spectrum_1_R_INT => BUS_Spectrum_1_R_INT,
	BUS_Spectrum_1_VLD => BUS_Spectrum_1_VLD,
		REG_Spectrum_1_STATUS_RD => REG_Spectrum_1_STATUS_RD,
		INT_Spectrum_1_STATUS_RD => INT_Spectrum_1_STATUS_RD,
		REG_Spectrum_1_CONFIG_WR => REG_Spectrum_1_CONFIG_WR,
		INT_Spectrum_1_CONFIG_WR => INT_Spectrum_1_CONFIG_WR,
		REG_Spectrum_1_CONFIG_RD => REG_Spectrum_1_CONFIG_WR,
		REG_Spectrum_1_CONFIG_LIMIT_WR => REG_Spectrum_1_CONFIG_LIMIT_WR,
		INT_Spectrum_1_CONFIG_LIMIT_WR => INT_Spectrum_1_CONFIG_LIMIT_WR,
		REG_Spectrum_1_CONFIG_LIMIT_RD => REG_Spectrum_1_CONFIG_LIMIT_WR,
		REG_Spectrum_1_CONFIG_REBIN_WR => REG_Spectrum_1_CONFIG_REBIN_WR,
		INT_Spectrum_1_CONFIG_REBIN_WR => INT_Spectrum_1_CONFIG_REBIN_WR,
		REG_Spectrum_1_CONFIG_REBIN_RD => REG_Spectrum_1_CONFIG_REBIN_WR,
		REG_Spectrum_1_CONFIG_MIN_WR => REG_Spectrum_1_CONFIG_MIN_WR,
		INT_Spectrum_1_CONFIG_MIN_WR => INT_Spectrum_1_CONFIG_MIN_WR,
		REG_Spectrum_1_CONFIG_MIN_RD => REG_Spectrum_1_CONFIG_MIN_WR,
		REG_Spectrum_1_CONFIG_MAX_WR => REG_Spectrum_1_CONFIG_MAX_WR,
		INT_Spectrum_1_CONFIG_MAX_WR => INT_Spectrum_1_CONFIG_MAX_WR,
		REG_Spectrum_1_CONFIG_MAX_RD => REG_Spectrum_1_CONFIG_MAX_WR,
	BUS_Spectrum_13_READ_ADDRESS => BUS_Spectrum_13_READ_ADDRESS,
	BUS_Spectrum_13_READ_DATA => BUS_Spectrum_13_READ_DATA,
	BUS_Spectrum_13_WRITE_DATA => BUS_Spectrum_13_WRITE_DATA,
	BUS_Spectrum_13_W_INT => BUS_Spectrum_13_W_INT,
	BUS_Spectrum_13_R_INT => BUS_Spectrum_13_R_INT,
	BUS_Spectrum_13_VLD => BUS_Spectrum_13_VLD,
		REG_Spectrum_13_STATUS_RD => REG_Spectrum_13_STATUS_RD,
		INT_Spectrum_13_STATUS_RD => INT_Spectrum_13_STATUS_RD,
		REG_Spectrum_13_CONFIG_WR => REG_Spectrum_13_CONFIG_WR,
		INT_Spectrum_13_CONFIG_WR => INT_Spectrum_13_CONFIG_WR,
		REG_Spectrum_13_CONFIG_RD => REG_Spectrum_13_CONFIG_WR,
		REG_Spectrum_13_CONFIG_LIMIT_WR => REG_Spectrum_13_CONFIG_LIMIT_WR,
		INT_Spectrum_13_CONFIG_LIMIT_WR => INT_Spectrum_13_CONFIG_LIMIT_WR,
		REG_Spectrum_13_CONFIG_LIMIT_RD => REG_Spectrum_13_CONFIG_LIMIT_WR,
		REG_Spectrum_13_CONFIG_REBIN_WR => REG_Spectrum_13_CONFIG_REBIN_WR,
		INT_Spectrum_13_CONFIG_REBIN_WR => INT_Spectrum_13_CONFIG_REBIN_WR,
		REG_Spectrum_13_CONFIG_REBIN_RD => REG_Spectrum_13_CONFIG_REBIN_WR,
		REG_Spectrum_13_CONFIG_MIN_WR => REG_Spectrum_13_CONFIG_MIN_WR,
		INT_Spectrum_13_CONFIG_MIN_WR => INT_Spectrum_13_CONFIG_MIN_WR,
		REG_Spectrum_13_CONFIG_MIN_RD => REG_Spectrum_13_CONFIG_MIN_WR,
		REG_Spectrum_13_CONFIG_MAX_WR => REG_Spectrum_13_CONFIG_MAX_WR,
		INT_Spectrum_13_CONFIG_MAX_WR => INT_Spectrum_13_CONFIG_MAX_WR,
		REG_Spectrum_13_CONFIG_MAX_RD => REG_Spectrum_13_CONFIG_MAX_WR,
	BUS_Spectrum_2_READ_ADDRESS => BUS_Spectrum_2_READ_ADDRESS,
	BUS_Spectrum_2_READ_DATA => BUS_Spectrum_2_READ_DATA,
	BUS_Spectrum_2_WRITE_DATA => BUS_Spectrum_2_WRITE_DATA,
	BUS_Spectrum_2_W_INT => BUS_Spectrum_2_W_INT,
	BUS_Spectrum_2_R_INT => BUS_Spectrum_2_R_INT,
	BUS_Spectrum_2_VLD => BUS_Spectrum_2_VLD,
		REG_Spectrum_2_STATUS_RD => REG_Spectrum_2_STATUS_RD,
		INT_Spectrum_2_STATUS_RD => INT_Spectrum_2_STATUS_RD,
		REG_Spectrum_2_CONFIG_WR => REG_Spectrum_2_CONFIG_WR,
		INT_Spectrum_2_CONFIG_WR => INT_Spectrum_2_CONFIG_WR,
		REG_Spectrum_2_CONFIG_RD => REG_Spectrum_2_CONFIG_WR,
		REG_Spectrum_2_CONFIG_LIMIT_WR => REG_Spectrum_2_CONFIG_LIMIT_WR,
		INT_Spectrum_2_CONFIG_LIMIT_WR => INT_Spectrum_2_CONFIG_LIMIT_WR,
		REG_Spectrum_2_CONFIG_LIMIT_RD => REG_Spectrum_2_CONFIG_LIMIT_WR,
		REG_Spectrum_2_CONFIG_REBIN_WR => REG_Spectrum_2_CONFIG_REBIN_WR,
		INT_Spectrum_2_CONFIG_REBIN_WR => INT_Spectrum_2_CONFIG_REBIN_WR,
		REG_Spectrum_2_CONFIG_REBIN_RD => REG_Spectrum_2_CONFIG_REBIN_WR,
		REG_Spectrum_2_CONFIG_MIN_WR => REG_Spectrum_2_CONFIG_MIN_WR,
		INT_Spectrum_2_CONFIG_MIN_WR => INT_Spectrum_2_CONFIG_MIN_WR,
		REG_Spectrum_2_CONFIG_MIN_RD => REG_Spectrum_2_CONFIG_MIN_WR,
		REG_Spectrum_2_CONFIG_MAX_WR => REG_Spectrum_2_CONFIG_MAX_WR,
		INT_Spectrum_2_CONFIG_MAX_WR => INT_Spectrum_2_CONFIG_MAX_WR,
		REG_Spectrum_2_CONFIG_MAX_RD => REG_Spectrum_2_CONFIG_MAX_WR,
	BUS_Spectrum_14_READ_ADDRESS => BUS_Spectrum_14_READ_ADDRESS,
	BUS_Spectrum_14_READ_DATA => BUS_Spectrum_14_READ_DATA,
	BUS_Spectrum_14_WRITE_DATA => BUS_Spectrum_14_WRITE_DATA,
	BUS_Spectrum_14_W_INT => BUS_Spectrum_14_W_INT,
	BUS_Spectrum_14_R_INT => BUS_Spectrum_14_R_INT,
	BUS_Spectrum_14_VLD => BUS_Spectrum_14_VLD,
		REG_Spectrum_14_STATUS_RD => REG_Spectrum_14_STATUS_RD,
		INT_Spectrum_14_STATUS_RD => INT_Spectrum_14_STATUS_RD,
		REG_Spectrum_14_CONFIG_WR => REG_Spectrum_14_CONFIG_WR,
		INT_Spectrum_14_CONFIG_WR => INT_Spectrum_14_CONFIG_WR,
		REG_Spectrum_14_CONFIG_RD => REG_Spectrum_14_CONFIG_WR,
		REG_Spectrum_14_CONFIG_LIMIT_WR => REG_Spectrum_14_CONFIG_LIMIT_WR,
		INT_Spectrum_14_CONFIG_LIMIT_WR => INT_Spectrum_14_CONFIG_LIMIT_WR,
		REG_Spectrum_14_CONFIG_LIMIT_RD => REG_Spectrum_14_CONFIG_LIMIT_WR,
		REG_Spectrum_14_CONFIG_REBIN_WR => REG_Spectrum_14_CONFIG_REBIN_WR,
		INT_Spectrum_14_CONFIG_REBIN_WR => INT_Spectrum_14_CONFIG_REBIN_WR,
		REG_Spectrum_14_CONFIG_REBIN_RD => REG_Spectrum_14_CONFIG_REBIN_WR,
		REG_Spectrum_14_CONFIG_MIN_WR => REG_Spectrum_14_CONFIG_MIN_WR,
		INT_Spectrum_14_CONFIG_MIN_WR => INT_Spectrum_14_CONFIG_MIN_WR,
		REG_Spectrum_14_CONFIG_MIN_RD => REG_Spectrum_14_CONFIG_MIN_WR,
		REG_Spectrum_14_CONFIG_MAX_WR => REG_Spectrum_14_CONFIG_MAX_WR,
		INT_Spectrum_14_CONFIG_MAX_WR => INT_Spectrum_14_CONFIG_MAX_WR,
		REG_Spectrum_14_CONFIG_MAX_RD => REG_Spectrum_14_CONFIG_MAX_WR,
	BUS_Spectrum_3_READ_ADDRESS => BUS_Spectrum_3_READ_ADDRESS,
	BUS_Spectrum_3_READ_DATA => BUS_Spectrum_3_READ_DATA,
	BUS_Spectrum_3_WRITE_DATA => BUS_Spectrum_3_WRITE_DATA,
	BUS_Spectrum_3_W_INT => BUS_Spectrum_3_W_INT,
	BUS_Spectrum_3_R_INT => BUS_Spectrum_3_R_INT,
	BUS_Spectrum_3_VLD => BUS_Spectrum_3_VLD,
		REG_Spectrum_3_STATUS_RD => REG_Spectrum_3_STATUS_RD,
		INT_Spectrum_3_STATUS_RD => INT_Spectrum_3_STATUS_RD,
		REG_Spectrum_3_CONFIG_WR => REG_Spectrum_3_CONFIG_WR,
		INT_Spectrum_3_CONFIG_WR => INT_Spectrum_3_CONFIG_WR,
		REG_Spectrum_3_CONFIG_RD => REG_Spectrum_3_CONFIG_WR,
		REG_Spectrum_3_CONFIG_LIMIT_WR => REG_Spectrum_3_CONFIG_LIMIT_WR,
		INT_Spectrum_3_CONFIG_LIMIT_WR => INT_Spectrum_3_CONFIG_LIMIT_WR,
		REG_Spectrum_3_CONFIG_LIMIT_RD => REG_Spectrum_3_CONFIG_LIMIT_WR,
		REG_Spectrum_3_CONFIG_REBIN_WR => REG_Spectrum_3_CONFIG_REBIN_WR,
		INT_Spectrum_3_CONFIG_REBIN_WR => INT_Spectrum_3_CONFIG_REBIN_WR,
		REG_Spectrum_3_CONFIG_REBIN_RD => REG_Spectrum_3_CONFIG_REBIN_WR,
		REG_Spectrum_3_CONFIG_MIN_WR => REG_Spectrum_3_CONFIG_MIN_WR,
		INT_Spectrum_3_CONFIG_MIN_WR => INT_Spectrum_3_CONFIG_MIN_WR,
		REG_Spectrum_3_CONFIG_MIN_RD => REG_Spectrum_3_CONFIG_MIN_WR,
		REG_Spectrum_3_CONFIG_MAX_WR => REG_Spectrum_3_CONFIG_MAX_WR,
		INT_Spectrum_3_CONFIG_MAX_WR => INT_Spectrum_3_CONFIG_MAX_WR,
		REG_Spectrum_3_CONFIG_MAX_RD => REG_Spectrum_3_CONFIG_MAX_WR,
	BUS_Spectrum_15_READ_ADDRESS => BUS_Spectrum_15_READ_ADDRESS,
	BUS_Spectrum_15_READ_DATA => BUS_Spectrum_15_READ_DATA,
	BUS_Spectrum_15_WRITE_DATA => BUS_Spectrum_15_WRITE_DATA,
	BUS_Spectrum_15_W_INT => BUS_Spectrum_15_W_INT,
	BUS_Spectrum_15_R_INT => BUS_Spectrum_15_R_INT,
	BUS_Spectrum_15_VLD => BUS_Spectrum_15_VLD,
		REG_Spectrum_15_STATUS_RD => REG_Spectrum_15_STATUS_RD,
		INT_Spectrum_15_STATUS_RD => INT_Spectrum_15_STATUS_RD,
		REG_Spectrum_15_CONFIG_WR => REG_Spectrum_15_CONFIG_WR,
		INT_Spectrum_15_CONFIG_WR => INT_Spectrum_15_CONFIG_WR,
		REG_Spectrum_15_CONFIG_RD => REG_Spectrum_15_CONFIG_WR,
		REG_Spectrum_15_CONFIG_LIMIT_WR => REG_Spectrum_15_CONFIG_LIMIT_WR,
		INT_Spectrum_15_CONFIG_LIMIT_WR => INT_Spectrum_15_CONFIG_LIMIT_WR,
		REG_Spectrum_15_CONFIG_LIMIT_RD => REG_Spectrum_15_CONFIG_LIMIT_WR,
		REG_Spectrum_15_CONFIG_REBIN_WR => REG_Spectrum_15_CONFIG_REBIN_WR,
		INT_Spectrum_15_CONFIG_REBIN_WR => INT_Spectrum_15_CONFIG_REBIN_WR,
		REG_Spectrum_15_CONFIG_REBIN_RD => REG_Spectrum_15_CONFIG_REBIN_WR,
		REG_Spectrum_15_CONFIG_MIN_WR => REG_Spectrum_15_CONFIG_MIN_WR,
		INT_Spectrum_15_CONFIG_MIN_WR => INT_Spectrum_15_CONFIG_MIN_WR,
		REG_Spectrum_15_CONFIG_MIN_RD => REG_Spectrum_15_CONFIG_MIN_WR,
		REG_Spectrum_15_CONFIG_MAX_WR => REG_Spectrum_15_CONFIG_MAX_WR,
		INT_Spectrum_15_CONFIG_MAX_WR => INT_Spectrum_15_CONFIG_MAX_WR,
		REG_Spectrum_15_CONFIG_MAX_RD => REG_Spectrum_15_CONFIG_MAX_WR,
	BUS_Spectrum_4_READ_ADDRESS => BUS_Spectrum_4_READ_ADDRESS,
	BUS_Spectrum_4_READ_DATA => BUS_Spectrum_4_READ_DATA,
	BUS_Spectrum_4_WRITE_DATA => BUS_Spectrum_4_WRITE_DATA,
	BUS_Spectrum_4_W_INT => BUS_Spectrum_4_W_INT,
	BUS_Spectrum_4_R_INT => BUS_Spectrum_4_R_INT,
	BUS_Spectrum_4_VLD => BUS_Spectrum_4_VLD,
		REG_Spectrum_4_STATUS_RD => REG_Spectrum_4_STATUS_RD,
		INT_Spectrum_4_STATUS_RD => INT_Spectrum_4_STATUS_RD,
		REG_Spectrum_4_CONFIG_WR => REG_Spectrum_4_CONFIG_WR,
		INT_Spectrum_4_CONFIG_WR => INT_Spectrum_4_CONFIG_WR,
		REG_Spectrum_4_CONFIG_RD => REG_Spectrum_4_CONFIG_WR,
		REG_Spectrum_4_CONFIG_LIMIT_WR => REG_Spectrum_4_CONFIG_LIMIT_WR,
		INT_Spectrum_4_CONFIG_LIMIT_WR => INT_Spectrum_4_CONFIG_LIMIT_WR,
		REG_Spectrum_4_CONFIG_LIMIT_RD => REG_Spectrum_4_CONFIG_LIMIT_WR,
		REG_Spectrum_4_CONFIG_REBIN_WR => REG_Spectrum_4_CONFIG_REBIN_WR,
		INT_Spectrum_4_CONFIG_REBIN_WR => INT_Spectrum_4_CONFIG_REBIN_WR,
		REG_Spectrum_4_CONFIG_REBIN_RD => REG_Spectrum_4_CONFIG_REBIN_WR,
		REG_Spectrum_4_CONFIG_MIN_WR => REG_Spectrum_4_CONFIG_MIN_WR,
		INT_Spectrum_4_CONFIG_MIN_WR => INT_Spectrum_4_CONFIG_MIN_WR,
		REG_Spectrum_4_CONFIG_MIN_RD => REG_Spectrum_4_CONFIG_MIN_WR,
		REG_Spectrum_4_CONFIG_MAX_WR => REG_Spectrum_4_CONFIG_MAX_WR,
		INT_Spectrum_4_CONFIG_MAX_WR => INT_Spectrum_4_CONFIG_MAX_WR,
		REG_Spectrum_4_CONFIG_MAX_RD => REG_Spectrum_4_CONFIG_MAX_WR,
	BUS_Spectrum_16_READ_ADDRESS => BUS_Spectrum_16_READ_ADDRESS,
	BUS_Spectrum_16_READ_DATA => BUS_Spectrum_16_READ_DATA,
	BUS_Spectrum_16_WRITE_DATA => BUS_Spectrum_16_WRITE_DATA,
	BUS_Spectrum_16_W_INT => BUS_Spectrum_16_W_INT,
	BUS_Spectrum_16_R_INT => BUS_Spectrum_16_R_INT,
	BUS_Spectrum_16_VLD => BUS_Spectrum_16_VLD,
		REG_Spectrum_16_STATUS_RD => REG_Spectrum_16_STATUS_RD,
		INT_Spectrum_16_STATUS_RD => INT_Spectrum_16_STATUS_RD,
		REG_Spectrum_16_CONFIG_WR => REG_Spectrum_16_CONFIG_WR,
		INT_Spectrum_16_CONFIG_WR => INT_Spectrum_16_CONFIG_WR,
		REG_Spectrum_16_CONFIG_RD => REG_Spectrum_16_CONFIG_WR,
		REG_Spectrum_16_CONFIG_LIMIT_WR => REG_Spectrum_16_CONFIG_LIMIT_WR,
		INT_Spectrum_16_CONFIG_LIMIT_WR => INT_Spectrum_16_CONFIG_LIMIT_WR,
		REG_Spectrum_16_CONFIG_LIMIT_RD => REG_Spectrum_16_CONFIG_LIMIT_WR,
		REG_Spectrum_16_CONFIG_REBIN_WR => REG_Spectrum_16_CONFIG_REBIN_WR,
		INT_Spectrum_16_CONFIG_REBIN_WR => INT_Spectrum_16_CONFIG_REBIN_WR,
		REG_Spectrum_16_CONFIG_REBIN_RD => REG_Spectrum_16_CONFIG_REBIN_WR,
		REG_Spectrum_16_CONFIG_MIN_WR => REG_Spectrum_16_CONFIG_MIN_WR,
		INT_Spectrum_16_CONFIG_MIN_WR => INT_Spectrum_16_CONFIG_MIN_WR,
		REG_Spectrum_16_CONFIG_MIN_RD => REG_Spectrum_16_CONFIG_MIN_WR,
		REG_Spectrum_16_CONFIG_MAX_WR => REG_Spectrum_16_CONFIG_MAX_WR,
		INT_Spectrum_16_CONFIG_MAX_WR => INT_Spectrum_16_CONFIG_MAX_WR,
		REG_Spectrum_16_CONFIG_MAX_RD => REG_Spectrum_16_CONFIG_MAX_WR,
	BUS_Spectrum_5_READ_ADDRESS => BUS_Spectrum_5_READ_ADDRESS,
	BUS_Spectrum_5_READ_DATA => BUS_Spectrum_5_READ_DATA,
	BUS_Spectrum_5_WRITE_DATA => BUS_Spectrum_5_WRITE_DATA,
	BUS_Spectrum_5_W_INT => BUS_Spectrum_5_W_INT,
	BUS_Spectrum_5_R_INT => BUS_Spectrum_5_R_INT,
	BUS_Spectrum_5_VLD => BUS_Spectrum_5_VLD,
		REG_Spectrum_5_STATUS_RD => REG_Spectrum_5_STATUS_RD,
		INT_Spectrum_5_STATUS_RD => INT_Spectrum_5_STATUS_RD,
		REG_Spectrum_5_CONFIG_WR => REG_Spectrum_5_CONFIG_WR,
		INT_Spectrum_5_CONFIG_WR => INT_Spectrum_5_CONFIG_WR,
		REG_Spectrum_5_CONFIG_RD => REG_Spectrum_5_CONFIG_WR,
		REG_Spectrum_5_CONFIG_LIMIT_WR => REG_Spectrum_5_CONFIG_LIMIT_WR,
		INT_Spectrum_5_CONFIG_LIMIT_WR => INT_Spectrum_5_CONFIG_LIMIT_WR,
		REG_Spectrum_5_CONFIG_LIMIT_RD => REG_Spectrum_5_CONFIG_LIMIT_WR,
		REG_Spectrum_5_CONFIG_REBIN_WR => REG_Spectrum_5_CONFIG_REBIN_WR,
		INT_Spectrum_5_CONFIG_REBIN_WR => INT_Spectrum_5_CONFIG_REBIN_WR,
		REG_Spectrum_5_CONFIG_REBIN_RD => REG_Spectrum_5_CONFIG_REBIN_WR,
		REG_Spectrum_5_CONFIG_MIN_WR => REG_Spectrum_5_CONFIG_MIN_WR,
		INT_Spectrum_5_CONFIG_MIN_WR => INT_Spectrum_5_CONFIG_MIN_WR,
		REG_Spectrum_5_CONFIG_MIN_RD => REG_Spectrum_5_CONFIG_MIN_WR,
		REG_Spectrum_5_CONFIG_MAX_WR => REG_Spectrum_5_CONFIG_MAX_WR,
		INT_Spectrum_5_CONFIG_MAX_WR => INT_Spectrum_5_CONFIG_MAX_WR,
		REG_Spectrum_5_CONFIG_MAX_RD => REG_Spectrum_5_CONFIG_MAX_WR,
	BUS_Spectrum_17_READ_ADDRESS => BUS_Spectrum_17_READ_ADDRESS,
	BUS_Spectrum_17_READ_DATA => BUS_Spectrum_17_READ_DATA,
	BUS_Spectrum_17_WRITE_DATA => BUS_Spectrum_17_WRITE_DATA,
	BUS_Spectrum_17_W_INT => BUS_Spectrum_17_W_INT,
	BUS_Spectrum_17_R_INT => BUS_Spectrum_17_R_INT,
	BUS_Spectrum_17_VLD => BUS_Spectrum_17_VLD,
		REG_Spectrum_17_STATUS_RD => REG_Spectrum_17_STATUS_RD,
		INT_Spectrum_17_STATUS_RD => INT_Spectrum_17_STATUS_RD,
		REG_Spectrum_17_CONFIG_WR => REG_Spectrum_17_CONFIG_WR,
		INT_Spectrum_17_CONFIG_WR => INT_Spectrum_17_CONFIG_WR,
		REG_Spectrum_17_CONFIG_RD => REG_Spectrum_17_CONFIG_WR,
		REG_Spectrum_17_CONFIG_LIMIT_WR => REG_Spectrum_17_CONFIG_LIMIT_WR,
		INT_Spectrum_17_CONFIG_LIMIT_WR => INT_Spectrum_17_CONFIG_LIMIT_WR,
		REG_Spectrum_17_CONFIG_LIMIT_RD => REG_Spectrum_17_CONFIG_LIMIT_WR,
		REG_Spectrum_17_CONFIG_REBIN_WR => REG_Spectrum_17_CONFIG_REBIN_WR,
		INT_Spectrum_17_CONFIG_REBIN_WR => INT_Spectrum_17_CONFIG_REBIN_WR,
		REG_Spectrum_17_CONFIG_REBIN_RD => REG_Spectrum_17_CONFIG_REBIN_WR,
		REG_Spectrum_17_CONFIG_MIN_WR => REG_Spectrum_17_CONFIG_MIN_WR,
		INT_Spectrum_17_CONFIG_MIN_WR => INT_Spectrum_17_CONFIG_MIN_WR,
		REG_Spectrum_17_CONFIG_MIN_RD => REG_Spectrum_17_CONFIG_MIN_WR,
		REG_Spectrum_17_CONFIG_MAX_WR => REG_Spectrum_17_CONFIG_MAX_WR,
		INT_Spectrum_17_CONFIG_MAX_WR => INT_Spectrum_17_CONFIG_MAX_WR,
		REG_Spectrum_17_CONFIG_MAX_RD => REG_Spectrum_17_CONFIG_MAX_WR,
	BUS_top_READ_DATA => BUS_top_READ_DATA,
	BUS_top_WRITE_DATA => BUS_top_WRITE_DATA,
	BUS_top_W_INT => BUS_top_W_INT,
	BUS_top_R_INT => BUS_top_R_INT,
	BUS_top_VLD => BUS_top_VLD,
		REG_top_0_WR => REG_top_0_WR,
		INT_top_0_WR => INT_top_0_WR,
		REG_top_0_RD => REG_top_0_WR,
		REG_top_1_WR => REG_top_1_WR,
		INT_top_1_WR => INT_top_1_WR,
		REG_top_1_RD => REG_top_1_WR,
		REG_top_2_WR => REG_top_2_WR,
		INT_top_2_WR => INT_top_2_WR,
		REG_top_2_RD => REG_top_2_WR,
		REG_top_3_WR => REG_top_3_WR,
		INT_top_3_WR => INT_top_3_WR,
		REG_top_3_RD => REG_top_3_WR,
		REG_top_4_WR => REG_top_4_WR,
		INT_top_4_WR => INT_top_4_WR,
		REG_top_4_RD => REG_top_4_WR,
		REG_top_5_WR => REG_top_5_WR,
		INT_top_5_WR => INT_top_5_WR,
		REG_top_5_RD => REG_top_5_WR,
		REG_top_6_WR => REG_top_6_WR,
		INT_top_6_WR => INT_top_6_WR,
		REG_top_6_RD => REG_top_6_WR,
		REG_top_7_WR => REG_top_7_WR,
		INT_top_7_WR => INT_top_7_WR,
		REG_top_7_RD => REG_top_7_WR,
		REG_top_8_WR => REG_top_8_WR,
		INT_top_8_WR => INT_top_8_WR,
		REG_top_8_RD => REG_top_8_WR,
		REG_top_9_WR => REG_top_9_WR,
		INT_top_9_WR => INT_top_9_WR,
		REG_top_9_RD => REG_top_9_WR,
		REG_top_10_WR => REG_top_10_WR,
		INT_top_10_WR => INT_top_10_WR,
		REG_top_10_RD => REG_top_10_WR,
		REG_top_11_WR => REG_top_11_WR,
		INT_top_11_WR => INT_top_11_WR,
		REG_top_11_RD => REG_top_11_WR,
		REG_top_12_WR => REG_top_12_WR,
		INT_top_12_WR => INT_top_12_WR,
		REG_top_12_RD => REG_top_12_WR,
		REG_top_13_WR => REG_top_13_WR,
		INT_top_13_WR => INT_top_13_WR,
		REG_top_13_RD => REG_top_13_WR,
		REG_top_14_WR => REG_top_14_WR,
		INT_top_14_WR => INT_top_14_WR,
		REG_top_14_RD => REG_top_14_WR,
		REG_top_15_WR => REG_top_15_WR,
		INT_top_15_WR => INT_top_15_WR,
		REG_top_15_RD => REG_top_15_WR,
		REG_top_16_WR => REG_top_16_WR,
		INT_top_16_WR => INT_top_16_WR,
		REG_top_16_RD => REG_top_16_WR,
		REG_top_17_WR => REG_top_17_WR,
		INT_top_17_WR => INT_top_17_WR,
		REG_top_17_RD => REG_top_17_WR,
		REG_top_18_WR => REG_top_18_WR,
		INT_top_18_WR => INT_top_18_WR,
		REG_top_18_RD => REG_top_18_WR,
		REG_top_19_WR => REG_top_19_WR,
		INT_top_19_WR => INT_top_19_WR,
		REG_top_19_RD => REG_top_19_WR,
		REG_top_20_WR => REG_top_20_WR,
		INT_top_20_WR => INT_top_20_WR,
		REG_top_20_RD => REG_top_20_WR,
		REG_top_21_WR => REG_top_21_WR,
		INT_top_21_WR => INT_top_21_WR,
		REG_top_21_RD => REG_top_21_WR,
		REG_top_22_WR => REG_top_22_WR,
		INT_top_22_WR => INT_top_22_WR,
		REG_top_22_RD => REG_top_22_WR,
		REG_top_23_WR => REG_top_23_WR,
		INT_top_23_WR => INT_top_23_WR,
		REG_top_23_RD => REG_top_23_WR,
		REG_top_24_WR => REG_top_24_WR,
		INT_top_24_WR => INT_top_24_WR,
		REG_top_24_RD => REG_top_24_WR,
		REG_top_25_WR => REG_top_25_WR,
		INT_top_25_WR => INT_top_25_WR,
		REG_top_25_RD => REG_top_25_WR,
		REG_top_26_WR => REG_top_26_WR,
		INT_top_26_WR => INT_top_26_WR,
		REG_top_26_RD => REG_top_26_WR,
		REG_top_27_WR => REG_top_27_WR,
		INT_top_27_WR => INT_top_27_WR,
		REG_top_27_RD => REG_top_27_WR,
		REG_top_28_WR => REG_top_28_WR,
		INT_top_28_WR => INT_top_28_WR,
		REG_top_28_RD => REG_top_28_WR,
		REG_top_29_WR => REG_top_29_WR,
		INT_top_29_WR => INT_top_29_WR,
		REG_top_29_RD => REG_top_29_WR,
		REG_top_30_WR => REG_top_30_WR,
		INT_top_30_WR => INT_top_30_WR,
		REG_top_30_RD => REG_top_30_WR,
		REG_top_31_WR => REG_top_31_WR,
		INT_top_31_WR => INT_top_31_WR,
		REG_top_31_RD => REG_top_31_WR,
	BUS_Spectrum_6_READ_ADDRESS => BUS_Spectrum_6_READ_ADDRESS,
	BUS_Spectrum_6_READ_DATA => BUS_Spectrum_6_READ_DATA,
	BUS_Spectrum_6_WRITE_DATA => BUS_Spectrum_6_WRITE_DATA,
	BUS_Spectrum_6_W_INT => BUS_Spectrum_6_W_INT,
	BUS_Spectrum_6_R_INT => BUS_Spectrum_6_R_INT,
	BUS_Spectrum_6_VLD => BUS_Spectrum_6_VLD,
		REG_Spectrum_6_STATUS_RD => REG_Spectrum_6_STATUS_RD,
		INT_Spectrum_6_STATUS_RD => INT_Spectrum_6_STATUS_RD,
		REG_Spectrum_6_CONFIG_WR => REG_Spectrum_6_CONFIG_WR,
		INT_Spectrum_6_CONFIG_WR => INT_Spectrum_6_CONFIG_WR,
		REG_Spectrum_6_CONFIG_RD => REG_Spectrum_6_CONFIG_WR,
		REG_Spectrum_6_CONFIG_LIMIT_WR => REG_Spectrum_6_CONFIG_LIMIT_WR,
		INT_Spectrum_6_CONFIG_LIMIT_WR => INT_Spectrum_6_CONFIG_LIMIT_WR,
		REG_Spectrum_6_CONFIG_LIMIT_RD => REG_Spectrum_6_CONFIG_LIMIT_WR,
		REG_Spectrum_6_CONFIG_REBIN_WR => REG_Spectrum_6_CONFIG_REBIN_WR,
		INT_Spectrum_6_CONFIG_REBIN_WR => INT_Spectrum_6_CONFIG_REBIN_WR,
		REG_Spectrum_6_CONFIG_REBIN_RD => REG_Spectrum_6_CONFIG_REBIN_WR,
		REG_Spectrum_6_CONFIG_MIN_WR => REG_Spectrum_6_CONFIG_MIN_WR,
		INT_Spectrum_6_CONFIG_MIN_WR => INT_Spectrum_6_CONFIG_MIN_WR,
		REG_Spectrum_6_CONFIG_MIN_RD => REG_Spectrum_6_CONFIG_MIN_WR,
		REG_Spectrum_6_CONFIG_MAX_WR => REG_Spectrum_6_CONFIG_MAX_WR,
		INT_Spectrum_6_CONFIG_MAX_WR => INT_Spectrum_6_CONFIG_MAX_WR,
		REG_Spectrum_6_CONFIG_MAX_RD => REG_Spectrum_6_CONFIG_MAX_WR,
	BUS_Spectrum_18_READ_ADDRESS => BUS_Spectrum_18_READ_ADDRESS,
	BUS_Spectrum_18_READ_DATA => BUS_Spectrum_18_READ_DATA,
	BUS_Spectrum_18_WRITE_DATA => BUS_Spectrum_18_WRITE_DATA,
	BUS_Spectrum_18_W_INT => BUS_Spectrum_18_W_INT,
	BUS_Spectrum_18_R_INT => BUS_Spectrum_18_R_INT,
	BUS_Spectrum_18_VLD => BUS_Spectrum_18_VLD,
		REG_Spectrum_18_STATUS_RD => REG_Spectrum_18_STATUS_RD,
		INT_Spectrum_18_STATUS_RD => INT_Spectrum_18_STATUS_RD,
		REG_Spectrum_18_CONFIG_WR => REG_Spectrum_18_CONFIG_WR,
		INT_Spectrum_18_CONFIG_WR => INT_Spectrum_18_CONFIG_WR,
		REG_Spectrum_18_CONFIG_RD => REG_Spectrum_18_CONFIG_WR,
		REG_Spectrum_18_CONFIG_LIMIT_WR => REG_Spectrum_18_CONFIG_LIMIT_WR,
		INT_Spectrum_18_CONFIG_LIMIT_WR => INT_Spectrum_18_CONFIG_LIMIT_WR,
		REG_Spectrum_18_CONFIG_LIMIT_RD => REG_Spectrum_18_CONFIG_LIMIT_WR,
		REG_Spectrum_18_CONFIG_REBIN_WR => REG_Spectrum_18_CONFIG_REBIN_WR,
		INT_Spectrum_18_CONFIG_REBIN_WR => INT_Spectrum_18_CONFIG_REBIN_WR,
		REG_Spectrum_18_CONFIG_REBIN_RD => REG_Spectrum_18_CONFIG_REBIN_WR,
		REG_Spectrum_18_CONFIG_MIN_WR => REG_Spectrum_18_CONFIG_MIN_WR,
		INT_Spectrum_18_CONFIG_MIN_WR => INT_Spectrum_18_CONFIG_MIN_WR,
		REG_Spectrum_18_CONFIG_MIN_RD => REG_Spectrum_18_CONFIG_MIN_WR,
		REG_Spectrum_18_CONFIG_MAX_WR => REG_Spectrum_18_CONFIG_MAX_WR,
		INT_Spectrum_18_CONFIG_MAX_WR => INT_Spectrum_18_CONFIG_MAX_WR,
		REG_Spectrum_18_CONFIG_MAX_RD => REG_Spectrum_18_CONFIG_MAX_WR,
	BUS_disable_det_READ_DATA => BUS_disable_det_READ_DATA,
	BUS_disable_det_WRITE_DATA => BUS_disable_det_WRITE_DATA,
	BUS_disable_det_W_INT => BUS_disable_det_W_INT,
	BUS_disable_det_R_INT => BUS_disable_det_R_INT,
	BUS_disable_det_VLD => BUS_disable_det_VLD,
		REG_disable_det_0_WR => REG_disable_det_0_WR,
		INT_disable_det_0_WR => INT_disable_det_0_WR,
		REG_disable_det_0_RD => REG_disable_det_0_WR,
		REG_disable_det_1_WR => REG_disable_det_1_WR,
		INT_disable_det_1_WR => INT_disable_det_1_WR,
		REG_disable_det_1_RD => REG_disable_det_1_WR,
		REG_disable_det_2_WR => REG_disable_det_2_WR,
		INT_disable_det_2_WR => INT_disable_det_2_WR,
		REG_disable_det_2_RD => REG_disable_det_2_WR,
		REG_disable_det_3_WR => REG_disable_det_3_WR,
		INT_disable_det_3_WR => INT_disable_det_3_WR,
		REG_disable_det_3_RD => REG_disable_det_3_WR,
		REG_disable_det_4_WR => REG_disable_det_4_WR,
		INT_disable_det_4_WR => INT_disable_det_4_WR,
		REG_disable_det_4_RD => REG_disable_det_4_WR,
		REG_disable_det_5_WR => REG_disable_det_5_WR,
		INT_disable_det_5_WR => INT_disable_det_5_WR,
		REG_disable_det_5_RD => REG_disable_det_5_WR,
		REG_disable_det_6_WR => REG_disable_det_6_WR,
		INT_disable_det_6_WR => INT_disable_det_6_WR,
		REG_disable_det_6_RD => REG_disable_det_6_WR,
		REG_disable_det_7_WR => REG_disable_det_7_WR,
		INT_disable_det_7_WR => INT_disable_det_7_WR,
		REG_disable_det_7_RD => REG_disable_det_7_WR,
		REG_disable_det_8_WR => REG_disable_det_8_WR,
		INT_disable_det_8_WR => INT_disable_det_8_WR,
		REG_disable_det_8_RD => REG_disable_det_8_WR,
		REG_disable_det_9_WR => REG_disable_det_9_WR,
		INT_disable_det_9_WR => INT_disable_det_9_WR,
		REG_disable_det_9_RD => REG_disable_det_9_WR,
		REG_disable_det_10_WR => REG_disable_det_10_WR,
		INT_disable_det_10_WR => INT_disable_det_10_WR,
		REG_disable_det_10_RD => REG_disable_det_10_WR,
		REG_disable_det_11_WR => REG_disable_det_11_WR,
		INT_disable_det_11_WR => INT_disable_det_11_WR,
		REG_disable_det_11_RD => REG_disable_det_11_WR,
		REG_disable_det_12_WR => REG_disable_det_12_WR,
		INT_disable_det_12_WR => INT_disable_det_12_WR,
		REG_disable_det_12_RD => REG_disable_det_12_WR,
		REG_disable_det_13_WR => REG_disable_det_13_WR,
		INT_disable_det_13_WR => INT_disable_det_13_WR,
		REG_disable_det_13_RD => REG_disable_det_13_WR,
		REG_disable_det_14_WR => REG_disable_det_14_WR,
		INT_disable_det_14_WR => INT_disable_det_14_WR,
		REG_disable_det_14_RD => REG_disable_det_14_WR,
		REG_disable_det_15_WR => REG_disable_det_15_WR,
		INT_disable_det_15_WR => INT_disable_det_15_WR,
		REG_disable_det_15_RD => REG_disable_det_15_WR,
		REG_disable_det_16_WR => REG_disable_det_16_WR,
		INT_disable_det_16_WR => INT_disable_det_16_WR,
		REG_disable_det_16_RD => REG_disable_det_16_WR,
		REG_disable_det_17_WR => REG_disable_det_17_WR,
		INT_disable_det_17_WR => INT_disable_det_17_WR,
		REG_disable_det_17_RD => REG_disable_det_17_WR,
		REG_disable_det_18_WR => REG_disable_det_18_WR,
		INT_disable_det_18_WR => INT_disable_det_18_WR,
		REG_disable_det_18_RD => REG_disable_det_18_WR,
		REG_disable_det_19_WR => REG_disable_det_19_WR,
		INT_disable_det_19_WR => INT_disable_det_19_WR,
		REG_disable_det_19_RD => REG_disable_det_19_WR,
		REG_disable_det_20_WR => REG_disable_det_20_WR,
		INT_disable_det_20_WR => INT_disable_det_20_WR,
		REG_disable_det_20_RD => REG_disable_det_20_WR,
		REG_disable_det_21_WR => REG_disable_det_21_WR,
		INT_disable_det_21_WR => INT_disable_det_21_WR,
		REG_disable_det_21_RD => REG_disable_det_21_WR,
		REG_disable_det_22_WR => REG_disable_det_22_WR,
		INT_disable_det_22_WR => INT_disable_det_22_WR,
		REG_disable_det_22_RD => REG_disable_det_22_WR,
		REG_disable_det_23_WR => REG_disable_det_23_WR,
		INT_disable_det_23_WR => INT_disable_det_23_WR,
		REG_disable_det_23_RD => REG_disable_det_23_WR,
		REG_disable_det_24_WR => REG_disable_det_24_WR,
		INT_disable_det_24_WR => INT_disable_det_24_WR,
		REG_disable_det_24_RD => REG_disable_det_24_WR,
		REG_disable_det_25_WR => REG_disable_det_25_WR,
		INT_disable_det_25_WR => INT_disable_det_25_WR,
		REG_disable_det_25_RD => REG_disable_det_25_WR,
		REG_disable_det_26_WR => REG_disable_det_26_WR,
		INT_disable_det_26_WR => INT_disable_det_26_WR,
		REG_disable_det_26_RD => REG_disable_det_26_WR,
		REG_disable_det_27_WR => REG_disable_det_27_WR,
		INT_disable_det_27_WR => INT_disable_det_27_WR,
		REG_disable_det_27_RD => REG_disable_det_27_WR,
		REG_disable_det_28_WR => REG_disable_det_28_WR,
		INT_disable_det_28_WR => INT_disable_det_28_WR,
		REG_disable_det_28_RD => REG_disable_det_28_WR,
		REG_disable_det_29_WR => REG_disable_det_29_WR,
		INT_disable_det_29_WR => INT_disable_det_29_WR,
		REG_disable_det_29_RD => REG_disable_det_29_WR,
		REG_disable_det_30_WR => REG_disable_det_30_WR,
		INT_disable_det_30_WR => INT_disable_det_30_WR,
		REG_disable_det_30_RD => REG_disable_det_30_WR,
		REG_disable_det_31_WR => REG_disable_det_31_WR,
		INT_disable_det_31_WR => INT_disable_det_31_WR,
		REG_disable_det_31_RD => REG_disable_det_31_WR,
	BUS_Spectrum_7_READ_ADDRESS => BUS_Spectrum_7_READ_ADDRESS,
	BUS_Spectrum_7_READ_DATA => BUS_Spectrum_7_READ_DATA,
	BUS_Spectrum_7_WRITE_DATA => BUS_Spectrum_7_WRITE_DATA,
	BUS_Spectrum_7_W_INT => BUS_Spectrum_7_W_INT,
	BUS_Spectrum_7_R_INT => BUS_Spectrum_7_R_INT,
	BUS_Spectrum_7_VLD => BUS_Spectrum_7_VLD,
		REG_Spectrum_7_STATUS_RD => REG_Spectrum_7_STATUS_RD,
		INT_Spectrum_7_STATUS_RD => INT_Spectrum_7_STATUS_RD,
		REG_Spectrum_7_CONFIG_WR => REG_Spectrum_7_CONFIG_WR,
		INT_Spectrum_7_CONFIG_WR => INT_Spectrum_7_CONFIG_WR,
		REG_Spectrum_7_CONFIG_RD => REG_Spectrum_7_CONFIG_WR,
		REG_Spectrum_7_CONFIG_LIMIT_WR => REG_Spectrum_7_CONFIG_LIMIT_WR,
		INT_Spectrum_7_CONFIG_LIMIT_WR => INT_Spectrum_7_CONFIG_LIMIT_WR,
		REG_Spectrum_7_CONFIG_LIMIT_RD => REG_Spectrum_7_CONFIG_LIMIT_WR,
		REG_Spectrum_7_CONFIG_REBIN_WR => REG_Spectrum_7_CONFIG_REBIN_WR,
		INT_Spectrum_7_CONFIG_REBIN_WR => INT_Spectrum_7_CONFIG_REBIN_WR,
		REG_Spectrum_7_CONFIG_REBIN_RD => REG_Spectrum_7_CONFIG_REBIN_WR,
		REG_Spectrum_7_CONFIG_MIN_WR => REG_Spectrum_7_CONFIG_MIN_WR,
		INT_Spectrum_7_CONFIG_MIN_WR => INT_Spectrum_7_CONFIG_MIN_WR,
		REG_Spectrum_7_CONFIG_MIN_RD => REG_Spectrum_7_CONFIG_MIN_WR,
		REG_Spectrum_7_CONFIG_MAX_WR => REG_Spectrum_7_CONFIG_MAX_WR,
		INT_Spectrum_7_CONFIG_MAX_WR => INT_Spectrum_7_CONFIG_MAX_WR,
		REG_Spectrum_7_CONFIG_MAX_RD => REG_Spectrum_7_CONFIG_MAX_WR,
	BUS_Spectrum_19_READ_ADDRESS => BUS_Spectrum_19_READ_ADDRESS,
	BUS_Spectrum_19_READ_DATA => BUS_Spectrum_19_READ_DATA,
	BUS_Spectrum_19_WRITE_DATA => BUS_Spectrum_19_WRITE_DATA,
	BUS_Spectrum_19_W_INT => BUS_Spectrum_19_W_INT,
	BUS_Spectrum_19_R_INT => BUS_Spectrum_19_R_INT,
	BUS_Spectrum_19_VLD => BUS_Spectrum_19_VLD,
		REG_Spectrum_19_STATUS_RD => REG_Spectrum_19_STATUS_RD,
		INT_Spectrum_19_STATUS_RD => INT_Spectrum_19_STATUS_RD,
		REG_Spectrum_19_CONFIG_WR => REG_Spectrum_19_CONFIG_WR,
		INT_Spectrum_19_CONFIG_WR => INT_Spectrum_19_CONFIG_WR,
		REG_Spectrum_19_CONFIG_RD => REG_Spectrum_19_CONFIG_WR,
		REG_Spectrum_19_CONFIG_LIMIT_WR => REG_Spectrum_19_CONFIG_LIMIT_WR,
		INT_Spectrum_19_CONFIG_LIMIT_WR => INT_Spectrum_19_CONFIG_LIMIT_WR,
		REG_Spectrum_19_CONFIG_LIMIT_RD => REG_Spectrum_19_CONFIG_LIMIT_WR,
		REG_Spectrum_19_CONFIG_REBIN_WR => REG_Spectrum_19_CONFIG_REBIN_WR,
		INT_Spectrum_19_CONFIG_REBIN_WR => INT_Spectrum_19_CONFIG_REBIN_WR,
		REG_Spectrum_19_CONFIG_REBIN_RD => REG_Spectrum_19_CONFIG_REBIN_WR,
		REG_Spectrum_19_CONFIG_MIN_WR => REG_Spectrum_19_CONFIG_MIN_WR,
		INT_Spectrum_19_CONFIG_MIN_WR => INT_Spectrum_19_CONFIG_MIN_WR,
		REG_Spectrum_19_CONFIG_MIN_RD => REG_Spectrum_19_CONFIG_MIN_WR,
		REG_Spectrum_19_CONFIG_MAX_WR => REG_Spectrum_19_CONFIG_MAX_WR,
		INT_Spectrum_19_CONFIG_MAX_WR => INT_Spectrum_19_CONFIG_MAX_WR,
		REG_Spectrum_19_CONFIG_MAX_RD => REG_Spectrum_19_CONFIG_MAX_WR,
	BUS_Spectrum_8_READ_ADDRESS => BUS_Spectrum_8_READ_ADDRESS,
	BUS_Spectrum_8_READ_DATA => BUS_Spectrum_8_READ_DATA,
	BUS_Spectrum_8_WRITE_DATA => BUS_Spectrum_8_WRITE_DATA,
	BUS_Spectrum_8_W_INT => BUS_Spectrum_8_W_INT,
	BUS_Spectrum_8_R_INT => BUS_Spectrum_8_R_INT,
	BUS_Spectrum_8_VLD => BUS_Spectrum_8_VLD,
		REG_Spectrum_8_STATUS_RD => REG_Spectrum_8_STATUS_RD,
		INT_Spectrum_8_STATUS_RD => INT_Spectrum_8_STATUS_RD,
		REG_Spectrum_8_CONFIG_WR => REG_Spectrum_8_CONFIG_WR,
		INT_Spectrum_8_CONFIG_WR => INT_Spectrum_8_CONFIG_WR,
		REG_Spectrum_8_CONFIG_RD => REG_Spectrum_8_CONFIG_WR,
		REG_Spectrum_8_CONFIG_LIMIT_WR => REG_Spectrum_8_CONFIG_LIMIT_WR,
		INT_Spectrum_8_CONFIG_LIMIT_WR => INT_Spectrum_8_CONFIG_LIMIT_WR,
		REG_Spectrum_8_CONFIG_LIMIT_RD => REG_Spectrum_8_CONFIG_LIMIT_WR,
		REG_Spectrum_8_CONFIG_REBIN_WR => REG_Spectrum_8_CONFIG_REBIN_WR,
		INT_Spectrum_8_CONFIG_REBIN_WR => INT_Spectrum_8_CONFIG_REBIN_WR,
		REG_Spectrum_8_CONFIG_REBIN_RD => REG_Spectrum_8_CONFIG_REBIN_WR,
		REG_Spectrum_8_CONFIG_MIN_WR => REG_Spectrum_8_CONFIG_MIN_WR,
		INT_Spectrum_8_CONFIG_MIN_WR => INT_Spectrum_8_CONFIG_MIN_WR,
		REG_Spectrum_8_CONFIG_MIN_RD => REG_Spectrum_8_CONFIG_MIN_WR,
		REG_Spectrum_8_CONFIG_MAX_WR => REG_Spectrum_8_CONFIG_MAX_WR,
		INT_Spectrum_8_CONFIG_MAX_WR => INT_Spectrum_8_CONFIG_MAX_WR,
		REG_Spectrum_8_CONFIG_MAX_RD => REG_Spectrum_8_CONFIG_MAX_WR,
	BUS_Spectrum_20_READ_ADDRESS => BUS_Spectrum_20_READ_ADDRESS,
	BUS_Spectrum_20_READ_DATA => BUS_Spectrum_20_READ_DATA,
	BUS_Spectrum_20_WRITE_DATA => BUS_Spectrum_20_WRITE_DATA,
	BUS_Spectrum_20_W_INT => BUS_Spectrum_20_W_INT,
	BUS_Spectrum_20_R_INT => BUS_Spectrum_20_R_INT,
	BUS_Spectrum_20_VLD => BUS_Spectrum_20_VLD,
		REG_Spectrum_20_STATUS_RD => REG_Spectrum_20_STATUS_RD,
		INT_Spectrum_20_STATUS_RD => INT_Spectrum_20_STATUS_RD,
		REG_Spectrum_20_CONFIG_WR => REG_Spectrum_20_CONFIG_WR,
		INT_Spectrum_20_CONFIG_WR => INT_Spectrum_20_CONFIG_WR,
		REG_Spectrum_20_CONFIG_RD => REG_Spectrum_20_CONFIG_WR,
		REG_Spectrum_20_CONFIG_LIMIT_WR => REG_Spectrum_20_CONFIG_LIMIT_WR,
		INT_Spectrum_20_CONFIG_LIMIT_WR => INT_Spectrum_20_CONFIG_LIMIT_WR,
		REG_Spectrum_20_CONFIG_LIMIT_RD => REG_Spectrum_20_CONFIG_LIMIT_WR,
		REG_Spectrum_20_CONFIG_REBIN_WR => REG_Spectrum_20_CONFIG_REBIN_WR,
		INT_Spectrum_20_CONFIG_REBIN_WR => INT_Spectrum_20_CONFIG_REBIN_WR,
		REG_Spectrum_20_CONFIG_REBIN_RD => REG_Spectrum_20_CONFIG_REBIN_WR,
		REG_Spectrum_20_CONFIG_MIN_WR => REG_Spectrum_20_CONFIG_MIN_WR,
		INT_Spectrum_20_CONFIG_MIN_WR => INT_Spectrum_20_CONFIG_MIN_WR,
		REG_Spectrum_20_CONFIG_MIN_RD => REG_Spectrum_20_CONFIG_MIN_WR,
		REG_Spectrum_20_CONFIG_MAX_WR => REG_Spectrum_20_CONFIG_MAX_WR,
		INT_Spectrum_20_CONFIG_MAX_WR => INT_Spectrum_20_CONFIG_MAX_WR,
		REG_Spectrum_20_CONFIG_MAX_RD => REG_Spectrum_20_CONFIG_MAX_WR,
	BUS_Spectrum_9_READ_ADDRESS => BUS_Spectrum_9_READ_ADDRESS,
	BUS_Spectrum_9_READ_DATA => BUS_Spectrum_9_READ_DATA,
	BUS_Spectrum_9_WRITE_DATA => BUS_Spectrum_9_WRITE_DATA,
	BUS_Spectrum_9_W_INT => BUS_Spectrum_9_W_INT,
	BUS_Spectrum_9_R_INT => BUS_Spectrum_9_R_INT,
	BUS_Spectrum_9_VLD => BUS_Spectrum_9_VLD,
		REG_Spectrum_9_STATUS_RD => REG_Spectrum_9_STATUS_RD,
		INT_Spectrum_9_STATUS_RD => INT_Spectrum_9_STATUS_RD,
		REG_Spectrum_9_CONFIG_WR => REG_Spectrum_9_CONFIG_WR,
		INT_Spectrum_9_CONFIG_WR => INT_Spectrum_9_CONFIG_WR,
		REG_Spectrum_9_CONFIG_RD => REG_Spectrum_9_CONFIG_WR,
		REG_Spectrum_9_CONFIG_LIMIT_WR => REG_Spectrum_9_CONFIG_LIMIT_WR,
		INT_Spectrum_9_CONFIG_LIMIT_WR => INT_Spectrum_9_CONFIG_LIMIT_WR,
		REG_Spectrum_9_CONFIG_LIMIT_RD => REG_Spectrum_9_CONFIG_LIMIT_WR,
		REG_Spectrum_9_CONFIG_REBIN_WR => REG_Spectrum_9_CONFIG_REBIN_WR,
		INT_Spectrum_9_CONFIG_REBIN_WR => INT_Spectrum_9_CONFIG_REBIN_WR,
		REG_Spectrum_9_CONFIG_REBIN_RD => REG_Spectrum_9_CONFIG_REBIN_WR,
		REG_Spectrum_9_CONFIG_MIN_WR => REG_Spectrum_9_CONFIG_MIN_WR,
		INT_Spectrum_9_CONFIG_MIN_WR => INT_Spectrum_9_CONFIG_MIN_WR,
		REG_Spectrum_9_CONFIG_MIN_RD => REG_Spectrum_9_CONFIG_MIN_WR,
		REG_Spectrum_9_CONFIG_MAX_WR => REG_Spectrum_9_CONFIG_MAX_WR,
		INT_Spectrum_9_CONFIG_MAX_WR => INT_Spectrum_9_CONFIG_MAX_WR,
		REG_Spectrum_9_CONFIG_MAX_RD => REG_Spectrum_9_CONFIG_MAX_WR,
	BUS_Spectrum_21_READ_ADDRESS => BUS_Spectrum_21_READ_ADDRESS,
	BUS_Spectrum_21_READ_DATA => BUS_Spectrum_21_READ_DATA,
	BUS_Spectrum_21_WRITE_DATA => BUS_Spectrum_21_WRITE_DATA,
	BUS_Spectrum_21_W_INT => BUS_Spectrum_21_W_INT,
	BUS_Spectrum_21_R_INT => BUS_Spectrum_21_R_INT,
	BUS_Spectrum_21_VLD => BUS_Spectrum_21_VLD,
		REG_Spectrum_21_STATUS_RD => REG_Spectrum_21_STATUS_RD,
		INT_Spectrum_21_STATUS_RD => INT_Spectrum_21_STATUS_RD,
		REG_Spectrum_21_CONFIG_WR => REG_Spectrum_21_CONFIG_WR,
		INT_Spectrum_21_CONFIG_WR => INT_Spectrum_21_CONFIG_WR,
		REG_Spectrum_21_CONFIG_RD => REG_Spectrum_21_CONFIG_WR,
		REG_Spectrum_21_CONFIG_LIMIT_WR => REG_Spectrum_21_CONFIG_LIMIT_WR,
		INT_Spectrum_21_CONFIG_LIMIT_WR => INT_Spectrum_21_CONFIG_LIMIT_WR,
		REG_Spectrum_21_CONFIG_LIMIT_RD => REG_Spectrum_21_CONFIG_LIMIT_WR,
		REG_Spectrum_21_CONFIG_REBIN_WR => REG_Spectrum_21_CONFIG_REBIN_WR,
		INT_Spectrum_21_CONFIG_REBIN_WR => INT_Spectrum_21_CONFIG_REBIN_WR,
		REG_Spectrum_21_CONFIG_REBIN_RD => REG_Spectrum_21_CONFIG_REBIN_WR,
		REG_Spectrum_21_CONFIG_MIN_WR => REG_Spectrum_21_CONFIG_MIN_WR,
		INT_Spectrum_21_CONFIG_MIN_WR => INT_Spectrum_21_CONFIG_MIN_WR,
		REG_Spectrum_21_CONFIG_MIN_RD => REG_Spectrum_21_CONFIG_MIN_WR,
		REG_Spectrum_21_CONFIG_MAX_WR => REG_Spectrum_21_CONFIG_MAX_WR,
		INT_Spectrum_21_CONFIG_MAX_WR => INT_Spectrum_21_CONFIG_MAX_WR,
		REG_Spectrum_21_CONFIG_MAX_RD => REG_Spectrum_21_CONFIG_MAX_WR,
	BUS_Spectrum_10_READ_ADDRESS => BUS_Spectrum_10_READ_ADDRESS,
	BUS_Spectrum_10_READ_DATA => BUS_Spectrum_10_READ_DATA,
	BUS_Spectrum_10_WRITE_DATA => BUS_Spectrum_10_WRITE_DATA,
	BUS_Spectrum_10_W_INT => BUS_Spectrum_10_W_INT,
	BUS_Spectrum_10_R_INT => BUS_Spectrum_10_R_INT,
	BUS_Spectrum_10_VLD => BUS_Spectrum_10_VLD,
		REG_Spectrum_10_STATUS_RD => REG_Spectrum_10_STATUS_RD,
		INT_Spectrum_10_STATUS_RD => INT_Spectrum_10_STATUS_RD,
		REG_Spectrum_10_CONFIG_WR => REG_Spectrum_10_CONFIG_WR,
		INT_Spectrum_10_CONFIG_WR => INT_Spectrum_10_CONFIG_WR,
		REG_Spectrum_10_CONFIG_RD => REG_Spectrum_10_CONFIG_WR,
		REG_Spectrum_10_CONFIG_LIMIT_WR => REG_Spectrum_10_CONFIG_LIMIT_WR,
		INT_Spectrum_10_CONFIG_LIMIT_WR => INT_Spectrum_10_CONFIG_LIMIT_WR,
		REG_Spectrum_10_CONFIG_LIMIT_RD => REG_Spectrum_10_CONFIG_LIMIT_WR,
		REG_Spectrum_10_CONFIG_REBIN_WR => REG_Spectrum_10_CONFIG_REBIN_WR,
		INT_Spectrum_10_CONFIG_REBIN_WR => INT_Spectrum_10_CONFIG_REBIN_WR,
		REG_Spectrum_10_CONFIG_REBIN_RD => REG_Spectrum_10_CONFIG_REBIN_WR,
		REG_Spectrum_10_CONFIG_MIN_WR => REG_Spectrum_10_CONFIG_MIN_WR,
		INT_Spectrum_10_CONFIG_MIN_WR => INT_Spectrum_10_CONFIG_MIN_WR,
		REG_Spectrum_10_CONFIG_MIN_RD => REG_Spectrum_10_CONFIG_MIN_WR,
		REG_Spectrum_10_CONFIG_MAX_WR => REG_Spectrum_10_CONFIG_MAX_WR,
		INT_Spectrum_10_CONFIG_MAX_WR => INT_Spectrum_10_CONFIG_MAX_WR,
		REG_Spectrum_10_CONFIG_MAX_RD => REG_Spectrum_10_CONFIG_MAX_WR,
	BUS_Spectrum_22_READ_ADDRESS => BUS_Spectrum_22_READ_ADDRESS,
	BUS_Spectrum_22_READ_DATA => BUS_Spectrum_22_READ_DATA,
	BUS_Spectrum_22_WRITE_DATA => BUS_Spectrum_22_WRITE_DATA,
	BUS_Spectrum_22_W_INT => BUS_Spectrum_22_W_INT,
	BUS_Spectrum_22_R_INT => BUS_Spectrum_22_R_INT,
	BUS_Spectrum_22_VLD => BUS_Spectrum_22_VLD,
		REG_Spectrum_22_STATUS_RD => REG_Spectrum_22_STATUS_RD,
		INT_Spectrum_22_STATUS_RD => INT_Spectrum_22_STATUS_RD,
		REG_Spectrum_22_CONFIG_WR => REG_Spectrum_22_CONFIG_WR,
		INT_Spectrum_22_CONFIG_WR => INT_Spectrum_22_CONFIG_WR,
		REG_Spectrum_22_CONFIG_RD => REG_Spectrum_22_CONFIG_WR,
		REG_Spectrum_22_CONFIG_LIMIT_WR => REG_Spectrum_22_CONFIG_LIMIT_WR,
		INT_Spectrum_22_CONFIG_LIMIT_WR => INT_Spectrum_22_CONFIG_LIMIT_WR,
		REG_Spectrum_22_CONFIG_LIMIT_RD => REG_Spectrum_22_CONFIG_LIMIT_WR,
		REG_Spectrum_22_CONFIG_REBIN_WR => REG_Spectrum_22_CONFIG_REBIN_WR,
		INT_Spectrum_22_CONFIG_REBIN_WR => INT_Spectrum_22_CONFIG_REBIN_WR,
		REG_Spectrum_22_CONFIG_REBIN_RD => REG_Spectrum_22_CONFIG_REBIN_WR,
		REG_Spectrum_22_CONFIG_MIN_WR => REG_Spectrum_22_CONFIG_MIN_WR,
		INT_Spectrum_22_CONFIG_MIN_WR => INT_Spectrum_22_CONFIG_MIN_WR,
		REG_Spectrum_22_CONFIG_MIN_RD => REG_Spectrum_22_CONFIG_MIN_WR,
		REG_Spectrum_22_CONFIG_MAX_WR => REG_Spectrum_22_CONFIG_MAX_WR,
		INT_Spectrum_22_CONFIG_MAX_WR => INT_Spectrum_22_CONFIG_MAX_WR,
		REG_Spectrum_22_CONFIG_MAX_RD => REG_Spectrum_22_CONFIG_MAX_WR,
	BUS_Spectrum_11_READ_ADDRESS => BUS_Spectrum_11_READ_ADDRESS,
	BUS_Spectrum_11_READ_DATA => BUS_Spectrum_11_READ_DATA,
	BUS_Spectrum_11_WRITE_DATA => BUS_Spectrum_11_WRITE_DATA,
	BUS_Spectrum_11_W_INT => BUS_Spectrum_11_W_INT,
	BUS_Spectrum_11_R_INT => BUS_Spectrum_11_R_INT,
	BUS_Spectrum_11_VLD => BUS_Spectrum_11_VLD,
		REG_Spectrum_11_STATUS_RD => REG_Spectrum_11_STATUS_RD,
		INT_Spectrum_11_STATUS_RD => INT_Spectrum_11_STATUS_RD,
		REG_Spectrum_11_CONFIG_WR => REG_Spectrum_11_CONFIG_WR,
		INT_Spectrum_11_CONFIG_WR => INT_Spectrum_11_CONFIG_WR,
		REG_Spectrum_11_CONFIG_RD => REG_Spectrum_11_CONFIG_WR,
		REG_Spectrum_11_CONFIG_LIMIT_WR => REG_Spectrum_11_CONFIG_LIMIT_WR,
		INT_Spectrum_11_CONFIG_LIMIT_WR => INT_Spectrum_11_CONFIG_LIMIT_WR,
		REG_Spectrum_11_CONFIG_LIMIT_RD => REG_Spectrum_11_CONFIG_LIMIT_WR,
		REG_Spectrum_11_CONFIG_REBIN_WR => REG_Spectrum_11_CONFIG_REBIN_WR,
		INT_Spectrum_11_CONFIG_REBIN_WR => INT_Spectrum_11_CONFIG_REBIN_WR,
		REG_Spectrum_11_CONFIG_REBIN_RD => REG_Spectrum_11_CONFIG_REBIN_WR,
		REG_Spectrum_11_CONFIG_MIN_WR => REG_Spectrum_11_CONFIG_MIN_WR,
		INT_Spectrum_11_CONFIG_MIN_WR => INT_Spectrum_11_CONFIG_MIN_WR,
		REG_Spectrum_11_CONFIG_MIN_RD => REG_Spectrum_11_CONFIG_MIN_WR,
		REG_Spectrum_11_CONFIG_MAX_WR => REG_Spectrum_11_CONFIG_MAX_WR,
		INT_Spectrum_11_CONFIG_MAX_WR => INT_Spectrum_11_CONFIG_MAX_WR,
		REG_Spectrum_11_CONFIG_MAX_RD => REG_Spectrum_11_CONFIG_MAX_WR,
	BUS_Spectrum_23_READ_ADDRESS => BUS_Spectrum_23_READ_ADDRESS,
	BUS_Spectrum_23_READ_DATA => BUS_Spectrum_23_READ_DATA,
	BUS_Spectrum_23_WRITE_DATA => BUS_Spectrum_23_WRITE_DATA,
	BUS_Spectrum_23_W_INT => BUS_Spectrum_23_W_INT,
	BUS_Spectrum_23_R_INT => BUS_Spectrum_23_R_INT,
	BUS_Spectrum_23_VLD => BUS_Spectrum_23_VLD,
		REG_Spectrum_23_STATUS_RD => REG_Spectrum_23_STATUS_RD,
		INT_Spectrum_23_STATUS_RD => INT_Spectrum_23_STATUS_RD,
		REG_Spectrum_23_CONFIG_WR => REG_Spectrum_23_CONFIG_WR,
		INT_Spectrum_23_CONFIG_WR => INT_Spectrum_23_CONFIG_WR,
		REG_Spectrum_23_CONFIG_RD => REG_Spectrum_23_CONFIG_WR,
		REG_Spectrum_23_CONFIG_LIMIT_WR => REG_Spectrum_23_CONFIG_LIMIT_WR,
		INT_Spectrum_23_CONFIG_LIMIT_WR => INT_Spectrum_23_CONFIG_LIMIT_WR,
		REG_Spectrum_23_CONFIG_LIMIT_RD => REG_Spectrum_23_CONFIG_LIMIT_WR,
		REG_Spectrum_23_CONFIG_REBIN_WR => REG_Spectrum_23_CONFIG_REBIN_WR,
		INT_Spectrum_23_CONFIG_REBIN_WR => INT_Spectrum_23_CONFIG_REBIN_WR,
		REG_Spectrum_23_CONFIG_REBIN_RD => REG_Spectrum_23_CONFIG_REBIN_WR,
		REG_Spectrum_23_CONFIG_MIN_WR => REG_Spectrum_23_CONFIG_MIN_WR,
		INT_Spectrum_23_CONFIG_MIN_WR => INT_Spectrum_23_CONFIG_MIN_WR,
		REG_Spectrum_23_CONFIG_MIN_RD => REG_Spectrum_23_CONFIG_MIN_WR,
		REG_Spectrum_23_CONFIG_MAX_WR => REG_Spectrum_23_CONFIG_MAX_WR,
		INT_Spectrum_23_CONFIG_MAX_WR => INT_Spectrum_23_CONFIG_MAX_WR,
		REG_Spectrum_23_CONFIG_MAX_RD => REG_Spectrum_23_CONFIG_MAX_WR,
	BUS_base_READ_DATA => BUS_base_READ_DATA,
	BUS_base_WRITE_DATA => BUS_base_WRITE_DATA,
	BUS_base_W_INT => BUS_base_W_INT,
	BUS_base_R_INT => BUS_base_R_INT,
	BUS_base_VLD => BUS_base_VLD,
		REG_base_0_WR => REG_base_0_WR,
		INT_base_0_WR => INT_base_0_WR,
		REG_base_0_RD => REG_base_0_WR,
		REG_base_1_WR => REG_base_1_WR,
		INT_base_1_WR => INT_base_1_WR,
		REG_base_1_RD => REG_base_1_WR,
		REG_base_2_WR => REG_base_2_WR,
		INT_base_2_WR => INT_base_2_WR,
		REG_base_2_RD => REG_base_2_WR,
		REG_base_3_WR => REG_base_3_WR,
		INT_base_3_WR => INT_base_3_WR,
		REG_base_3_RD => REG_base_3_WR,
		REG_base_4_WR => REG_base_4_WR,
		INT_base_4_WR => INT_base_4_WR,
		REG_base_4_RD => REG_base_4_WR,
		REG_base_5_WR => REG_base_5_WR,
		INT_base_5_WR => INT_base_5_WR,
		REG_base_5_RD => REG_base_5_WR,
		REG_base_6_WR => REG_base_6_WR,
		INT_base_6_WR => INT_base_6_WR,
		REG_base_6_RD => REG_base_6_WR,
		REG_base_7_WR => REG_base_7_WR,
		INT_base_7_WR => INT_base_7_WR,
		REG_base_7_RD => REG_base_7_WR,
		REG_base_8_WR => REG_base_8_WR,
		INT_base_8_WR => INT_base_8_WR,
		REG_base_8_RD => REG_base_8_WR,
		REG_base_9_WR => REG_base_9_WR,
		INT_base_9_WR => INT_base_9_WR,
		REG_base_9_RD => REG_base_9_WR,
		REG_base_10_WR => REG_base_10_WR,
		INT_base_10_WR => INT_base_10_WR,
		REG_base_10_RD => REG_base_10_WR,
		REG_base_11_WR => REG_base_11_WR,
		INT_base_11_WR => INT_base_11_WR,
		REG_base_11_RD => REG_base_11_WR,
		REG_base_12_WR => REG_base_12_WR,
		INT_base_12_WR => INT_base_12_WR,
		REG_base_12_RD => REG_base_12_WR,
		REG_base_13_WR => REG_base_13_WR,
		INT_base_13_WR => INT_base_13_WR,
		REG_base_13_RD => REG_base_13_WR,
		REG_base_14_WR => REG_base_14_WR,
		INT_base_14_WR => INT_base_14_WR,
		REG_base_14_RD => REG_base_14_WR,
		REG_base_15_WR => REG_base_15_WR,
		INT_base_15_WR => INT_base_15_WR,
		REG_base_15_RD => REG_base_15_WR,
		REG_base_16_WR => REG_base_16_WR,
		INT_base_16_WR => INT_base_16_WR,
		REG_base_16_RD => REG_base_16_WR,
		REG_base_17_WR => REG_base_17_WR,
		INT_base_17_WR => INT_base_17_WR,
		REG_base_17_RD => REG_base_17_WR,
		REG_base_18_WR => REG_base_18_WR,
		INT_base_18_WR => INT_base_18_WR,
		REG_base_18_RD => REG_base_18_WR,
		REG_base_19_WR => REG_base_19_WR,
		INT_base_19_WR => INT_base_19_WR,
		REG_base_19_RD => REG_base_19_WR,
		REG_base_20_WR => REG_base_20_WR,
		INT_base_20_WR => INT_base_20_WR,
		REG_base_20_RD => REG_base_20_WR,
		REG_base_21_WR => REG_base_21_WR,
		INT_base_21_WR => INT_base_21_WR,
		REG_base_21_RD => REG_base_21_WR,
		REG_base_22_WR => REG_base_22_WR,
		INT_base_22_WR => INT_base_22_WR,
		REG_base_22_RD => REG_base_22_WR,
		REG_base_23_WR => REG_base_23_WR,
		INT_base_23_WR => INT_base_23_WR,
		REG_base_23_RD => REG_base_23_WR,
		REG_base_24_WR => REG_base_24_WR,
		INT_base_24_WR => INT_base_24_WR,
		REG_base_24_RD => REG_base_24_WR,
		REG_base_25_WR => REG_base_25_WR,
		INT_base_25_WR => INT_base_25_WR,
		REG_base_25_RD => REG_base_25_WR,
		REG_base_26_WR => REG_base_26_WR,
		INT_base_26_WR => INT_base_26_WR,
		REG_base_26_RD => REG_base_26_WR,
		REG_base_27_WR => REG_base_27_WR,
		INT_base_27_WR => INT_base_27_WR,
		REG_base_27_RD => REG_base_27_WR,
		REG_base_28_WR => REG_base_28_WR,
		INT_base_28_WR => INT_base_28_WR,
		REG_base_28_RD => REG_base_28_WR,
		REG_base_29_WR => REG_base_29_WR,
		INT_base_29_WR => INT_base_29_WR,
		REG_base_29_RD => REG_base_29_WR,
		REG_base_30_WR => REG_base_30_WR,
		INT_base_30_WR => INT_base_30_WR,
		REG_base_30_RD => REG_base_30_WR,
		REG_base_31_WR => REG_base_31_WR,
		INT_base_31_WR => INT_base_31_WR,
		REG_base_31_RD => REG_base_31_WR,
		REG_int_time_RD => REG_int_time_RD,
		REG_int_time_WR => REG_int_time_WR,
		INT_int_time_RD => INT_int_time_RD,
		INT_int_time_WR => INT_int_time_WR,
		REG_pre_int_RD => REG_pre_int_RD,
		REG_pre_int_WR => REG_pre_int_WR,
		INT_pre_int_RD => INT_pre_int_RD,
		INT_pre_int_WR => INT_pre_int_WR,
		REG_baseline_RD => REG_baseline_RD,
		REG_baseline_WR => REG_baseline_WR,
		INT_baseline_RD => INT_baseline_RD,
		INT_baseline_WR => INT_baseline_WR,
		REG_write_RD => REG_write_RD,
		REG_write_WR => REG_write_WR,
		INT_write_RD => INT_write_RD,
		INT_write_WR => INT_write_WR,
		REG_read_RD => REG_read_RD,
		REG_read_WR => REG_read_WR,
		INT_read_RD => INT_read_RD,
		INT_read_WR => INT_read_WR,
		REG_stopwrite_RD => REG_stopwrite_RD,
		REG_stopwrite_WR => REG_stopwrite_WR,
		INT_stopwrite_RD => INT_stopwrite_RD,
		INT_stopwrite_WR => INT_stopwrite_WR,
		REG_gate_l_RD => REG_gate_l_RD,
		REG_gate_l_WR => REG_gate_l_WR,
		INT_gate_l_RD => INT_gate_l_RD,
		INT_gate_l_WR => INT_gate_l_WR,
		REG_gate_u_RD => REG_gate_u_RD,
		REG_gate_u_WR => REG_gate_u_WR,
		INT_gate_u_RD => INT_gate_u_RD,
		INT_gate_u_WR => INT_gate_u_WR,
		REG_inhib_RD => REG_inhib_RD,
		REG_inhib_WR => REG_inhib_WR,
		INT_inhib_RD => INT_inhib_RD,
		INT_inhib_WR => INT_inhib_WR,
		REG_delay_RD => REG_delay_RD,
		REG_delay_WR => REG_delay_WR,
		INT_delay_RD => INT_delay_RD,
		INT_delay_WR => INT_delay_WR,
		REG_polarity_RD => REG_polarity_RD,
		REG_polarity_WR => REG_polarity_WR,
		INT_polarity_RD => INT_polarity_RD,
		INT_polarity_WR => INT_polarity_WR,
		REG_skip_RD => REG_skip_RD,
		REG_skip_WR => REG_skip_WR,
		INT_skip_RD => INT_skip_RD,
		INT_skip_WR => INT_skip_WR,
		REG_full_RD => REG_full_RD,
		REG_full_WR => REG_full_WR,
		INT_full_RD => INT_full_RD,
		INT_full_WR => INT_full_WR,
		REG_timestamp_RD => REG_timestamp_RD,
		REG_timestamp_WR => REG_timestamp_WR,
		INT_timestamp_RD => INT_timestamp_RD,
		INT_timestamp_WR => INT_timestamp_WR,
		REG_trigger_code_RD => REG_trigger_code_RD,
		REG_trigger_code_WR => REG_trigger_code_WR,
		INT_trigger_code_RD => INT_trigger_code_RD,
		INT_trigger_code_WR => INT_trigger_code_WR,
		REG_reset_RD => REG_reset_RD,
		REG_reset_WR => REG_reset_WR,
		INT_reset_RD => INT_reset_RD,
		INT_reset_WR => INT_reset_WR,
	BUS_All_Energies_READ_DATA => BUS_All_Energies_READ_DATA,
	BUS_All_Energies_WRITE_DATA => BUS_All_Energies_WRITE_DATA,
	BUS_All_Energies_W_INT => BUS_All_Energies_W_INT,
	BUS_All_Energies_R_INT => BUS_All_Energies_R_INT,
	BUS_All_Energies_VLD => BUS_All_Energies_VLD,
		REG_All_Energies_READ_STATUS_RD => REG_All_Energies_READ_STATUS_RD,
		INT_All_Energies_READ_STATUS_RD => INT_All_Energies_READ_STATUS_RD,
		REG_All_Energies_READ_VALID_WORDS_RD => REG_All_Energies_READ_VALID_WORDS_RD,
		INT_All_Energies_READ_VALID_WORDS_RD => INT_All_Energies_READ_VALID_WORDS_RD,
		REG_All_Energies_CONFIG_WR => REG_All_Energies_CONFIG_WR,
		INT_All_Energies_CONFIG_WR => INT_All_Energies_CONFIG_WR,
		REG_All_Energies_CONFIG_RD => REG_All_Energies_CONFIG_WR,
	BUS_RateMeter_0_READ_ADDRESS => BUS_RateMeter_0_READ_ADDRESS,
	BUS_RateMeter_0_READ_DATA => BUS_RateMeter_0_READ_DATA,
	BUS_RateMeter_0_WRITE_DATA => BUS_RateMeter_0_WRITE_DATA,
	BUS_RateMeter_0_W_INT => BUS_RateMeter_0_W_INT,
	BUS_RateMeter_0_R_INT => BUS_RateMeter_0_R_INT,
	BUS_RateMeter_0_VLD => BUS_RateMeter_0_VLD,
	BUS_RateMeter_NoSkip_READ_ADDRESS => BUS_RateMeter_NoSkip_READ_ADDRESS,
	BUS_RateMeter_NoSkip_READ_DATA => BUS_RateMeter_NoSkip_READ_DATA,
	BUS_RateMeter_NoSkip_WRITE_DATA => BUS_RateMeter_NoSkip_WRITE_DATA,
	BUS_RateMeter_NoSkip_W_INT => BUS_RateMeter_NoSkip_W_INT,
	BUS_RateMeter_NoSkip_R_INT => BUS_RateMeter_NoSkip_R_INT,
	BUS_RateMeter_NoSkip_VLD => BUS_RateMeter_NoSkip_VLD,
	BUS_Syncs_READ_ADDRESS => BUS_Syncs_READ_ADDRESS,
	BUS_Syncs_READ_DATA => BUS_Syncs_READ_DATA,
	BUS_Syncs_WRITE_DATA => BUS_Syncs_WRITE_DATA,
	BUS_Syncs_W_INT => BUS_Syncs_W_INT,
	BUS_Syncs_R_INT => BUS_Syncs_R_INT,
	BUS_Syncs_VLD => BUS_Syncs_VLD,
		REG_Syncs_READ_STATUS_RD => REG_Syncs_READ_STATUS_RD,
		INT_Syncs_READ_STATUS_RD => INT_Syncs_READ_STATUS_RD,
		REG_Syncs_READ_POSITION_RD => REG_Syncs_READ_POSITION_RD,
		INT_Syncs_READ_POSITION_RD => INT_Syncs_READ_POSITION_RD,
		REG_Syncs_CONFIG_TRIGGER_MODE_WR => REG_Syncs_CONFIG_TRIGGER_MODE_WR,
		INT_Syncs_CONFIG_TRIGGER_MODE_WR => INT_Syncs_CONFIG_TRIGGER_MODE_WR,
		REG_Syncs_CONFIG_TRIGGER_MODE_RD => REG_Syncs_CONFIG_TRIGGER_MODE_WR,
		REG_Syncs_CONFIG_PRETRIGGER_WR => REG_Syncs_CONFIG_PRETRIGGER_WR,
		INT_Syncs_CONFIG_PRETRIGGER_WR => INT_Syncs_CONFIG_PRETRIGGER_WR,
		REG_Syncs_CONFIG_PRETRIGGER_RD => REG_Syncs_CONFIG_PRETRIGGER_WR,
		REG_Syncs_CONFIG_TRIGGER_LEVEL_WR => REG_Syncs_CONFIG_TRIGGER_LEVEL_WR,
		INT_Syncs_CONFIG_TRIGGER_LEVEL_WR => INT_Syncs_CONFIG_TRIGGER_LEVEL_WR,
		REG_Syncs_CONFIG_TRIGGER_LEVEL_RD => REG_Syncs_CONFIG_TRIGGER_LEVEL_WR,
		REG_Syncs_CONFIG_ARM_WR => REG_Syncs_CONFIG_ARM_WR,
		INT_Syncs_CONFIG_ARM_WR => INT_Syncs_CONFIG_ARM_WR,
		REG_Syncs_CONFIG_ARM_RD => REG_Syncs_CONFIG_ARM_WR,
		REG_Syncs_CONFIG_DECIMATOR_WR => REG_Syncs_CONFIG_DECIMATOR_WR,
		INT_Syncs_CONFIG_DECIMATOR_WR => INT_Syncs_CONFIG_DECIMATOR_WR,
		REG_Syncs_CONFIG_DECIMATOR_RD => REG_Syncs_CONFIG_DECIMATOR_WR,
	BUS_SyncIn1Meter_READ_ADDRESS => BUS_SyncIn1Meter_READ_ADDRESS,
	BUS_SyncIn1Meter_READ_DATA => BUS_SyncIn1Meter_READ_DATA,
	BUS_SyncIn1Meter_WRITE_DATA => BUS_SyncIn1Meter_WRITE_DATA,
	BUS_SyncIn1Meter_W_INT => BUS_SyncIn1Meter_W_INT,
	BUS_SyncIn1Meter_R_INT => BUS_SyncIn1Meter_R_INT,
	BUS_SyncIn1Meter_VLD => BUS_SyncIn1Meter_VLD,
	BUS_SyncIn2Meter_READ_ADDRESS => BUS_SyncIn2Meter_READ_ADDRESS,
	BUS_SyncIn2Meter_READ_DATA => BUS_SyncIn2Meter_READ_DATA,
	BUS_SyncIn2Meter_WRITE_DATA => BUS_SyncIn2Meter_WRITE_DATA,
	BUS_SyncIn2Meter_W_INT => BUS_SyncIn2Meter_W_INT,
	BUS_SyncIn2Meter_R_INT => BUS_SyncIn2Meter_R_INT,
	BUS_SyncIn2Meter_VLD => BUS_SyncIn2Meter_VLD,
	BUS_SyncIn0Meter_READ_ADDRESS => BUS_SyncIn0Meter_READ_ADDRESS,
	BUS_SyncIn0Meter_READ_DATA => BUS_SyncIn0Meter_READ_DATA,
	BUS_SyncIn0Meter_WRITE_DATA => BUS_SyncIn0Meter_WRITE_DATA,
	BUS_SyncIn0Meter_W_INT => BUS_SyncIn0Meter_W_INT,
	BUS_SyncIn0Meter_R_INT => BUS_SyncIn0Meter_R_INT,
	BUS_SyncIn0Meter_VLD => BUS_SyncIn0Meter_VLD,
		REG_sync0_between_sync2_RD => REG_sync0_between_sync2_RD,
		REG_sync0_between_sync2_WR => REG_sync0_between_sync2_WR,
		INT_sync0_between_sync2_RD => INT_sync0_between_sync2_RD,
		INT_sync0_between_sync2_WR => INT_sync0_between_sync2_WR,
	BUS_Oscilloscope_0_READ_ADDRESS => BUS_Oscilloscope_0_READ_ADDRESS,
	BUS_Oscilloscope_0_READ_DATA => BUS_Oscilloscope_0_READ_DATA,
	BUS_Oscilloscope_0_WRITE_DATA => BUS_Oscilloscope_0_WRITE_DATA,
	BUS_Oscilloscope_0_W_INT => BUS_Oscilloscope_0_W_INT,
	BUS_Oscilloscope_0_R_INT => BUS_Oscilloscope_0_R_INT,
	BUS_Oscilloscope_0_VLD => BUS_Oscilloscope_0_VLD,
		REG_Oscilloscope_0_READ_STATUS_RD => REG_Oscilloscope_0_READ_STATUS_RD,
		INT_Oscilloscope_0_READ_STATUS_RD => INT_Oscilloscope_0_READ_STATUS_RD,
		REG_Oscilloscope_0_READ_POSITION_RD => REG_Oscilloscope_0_READ_POSITION_RD,
		INT_Oscilloscope_0_READ_POSITION_RD => INT_Oscilloscope_0_READ_POSITION_RD,
		REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR => REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR,
		INT_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR => INT_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR,
		REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_RD => REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR,
		REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR => REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR,
		INT_Oscilloscope_0_CONFIG_PRETRIGGER_WR => INT_Oscilloscope_0_CONFIG_PRETRIGGER_WR,
		REG_Oscilloscope_0_CONFIG_PRETRIGGER_RD => REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR,
		REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR => REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR,
		INT_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR => INT_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR,
		REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_RD => REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR,
		REG_Oscilloscope_0_CONFIG_ARM_WR => REG_Oscilloscope_0_CONFIG_ARM_WR,
		INT_Oscilloscope_0_CONFIG_ARM_WR => INT_Oscilloscope_0_CONFIG_ARM_WR,
		REG_Oscilloscope_0_CONFIG_ARM_RD => REG_Oscilloscope_0_CONFIG_ARM_WR,
		REG_Oscilloscope_0_CONFIG_DECIMATOR_WR => REG_Oscilloscope_0_CONFIG_DECIMATOR_WR,
		INT_Oscilloscope_0_CONFIG_DECIMATOR_WR => INT_Oscilloscope_0_CONFIG_DECIMATOR_WR,
		REG_Oscilloscope_0_CONFIG_DECIMATOR_RD => REG_Oscilloscope_0_CONFIG_DECIMATOR_WR,
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

	  U0_out_0 <= REG_polarity_WR(0 downto 0);
U1_out_0 <= REG_inhib_WR(15 downto 0);
U2_out_0 <= REG_delay_WR(15 downto 0);
U3_A0 <= CHA0;
U4_A1 <= CHA1;
U5_A2 <= CHA2;
U6_A3 <= CHA3;
U7_A4 <= CHA4;
U8_A5 <= CHA5;
U9_A6 <= CHA6;
U10_A7 <= CHA7;
U11_A8 <= CHA8;
U12_A9 <= CHA9;
U13_A10 <= CHA10;
U14_A11 <= CHA11;
U15_A12 <= CHA12;
U16_A13 <= CHA13;
U17_A14 <= CHA14;
U18_A15 <= CHA15;
U19_A16 <= CHA16;
U20_A17 <= CHA17;
U21_A18 <= CHA18;
U22_A19 <= CHA19;
U23_A20 <= CHA20;
U24_A21 <= CHA21;
U25_A22 <= CHA22;
U26_A23 <= CHA23;
U27_OUT <= U82_TRIGOUT_0 OR U82_TRIGOUT_1 OR U82_TRIGOUT_2 OR U82_TRIGOUT_3 OR U82_TRIGOUT_4 OR U82_TRIGOUT_5 OR U82_TRIGOUT_6 OR U82_TRIGOUT_7 OR U82_TRIGOUT_8 OR U82_TRIGOUT_9 OR U82_TRIGOUT_10 OR U82_TRIGOUT_11 OR U82_TRIGOUT_12 OR U82_TRIGOUT_13 OR U82_TRIGOUT_14 OR U82_TRIGOUT_15 OR U82_TRIGOUT_16 OR U82_TRIGOUT_17 OR U82_TRIGOUT_18 OR U82_TRIGOUT_19 OR U82_TRIGOUT_20 OR U82_TRIGOUT_21 OR U82_TRIGOUT_22 OR U82_TRIGOUT_23;
U28_OUT <= U77_OUT AND ( NOT sxt(U27_OUT,1));
U29_out_0 <= REG_gate_l_WR(15 downto 0);
U30_out_0 <= REG_gate_u_WR(15 downto 0);
U31_out_0 <= REG_read_WR(0 downto 0);
U32_out_0 <= REG_write_WR(0 downto 0);
U33_out_0 <= REG_stopwrite_WR(0 downto 0);
U34_out_0 <= REG_skip_WR(31 downto 0);
U35_out_0 <= REG_reset_WR(0 downto 0);
U36_out_0 <= REG_int_time_WR(15 downto 0);
U37_out_0 <= REG_pre_int_WR(15 downto 0);

	U38 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_1,
		ENERGY_STROBE => U89_valid_1,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_1_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_1_READ_DATA,
		READ_INT => BUS_Spectrum_1_R_INT,
		READ_DATAVALID => BUS_Spectrum_1_VLD,
		STATUS => REG_Spectrum_1_STATUS_RD,
		CONFIG => REG_Spectrum_1_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_1_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_1_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_1_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_1_CONFIG_MAX_WR
	);


	U39 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_2,
		ENERGY_STROBE => U89_valid_2,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_2_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_2_READ_DATA,
		READ_INT => BUS_Spectrum_2_R_INT,
		READ_DATAVALID => BUS_Spectrum_2_VLD,
		STATUS => REG_Spectrum_2_STATUS_RD,
		CONFIG => REG_Spectrum_2_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_2_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_2_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_2_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_2_CONFIG_MAX_WR
	);


	U40 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_3,
		ENERGY_STROBE => U89_valid_3,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_3_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_3_READ_DATA,
		READ_INT => BUS_Spectrum_3_R_INT,
		READ_DATAVALID => BUS_Spectrum_3_VLD,
		STATUS => REG_Spectrum_3_STATUS_RD,
		CONFIG => REG_Spectrum_3_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_3_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_3_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_3_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_3_CONFIG_MAX_WR
	);


	U41 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_4,
		ENERGY_STROBE => U89_valid_4,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_4_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_4_READ_DATA,
		READ_INT => BUS_Spectrum_4_R_INT,
		READ_DATAVALID => BUS_Spectrum_4_VLD,
		STATUS => REG_Spectrum_4_STATUS_RD,
		CONFIG => REG_Spectrum_4_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_4_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_4_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_4_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_4_CONFIG_MAX_WR
	);


	U42 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_5,
		ENERGY_STROBE => U89_valid_5,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_5_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_5_READ_DATA,
		READ_INT => BUS_Spectrum_5_R_INT,
		READ_DATAVALID => BUS_Spectrum_5_VLD,
		STATUS => REG_Spectrum_5_STATUS_RD,
		CONFIG => REG_Spectrum_5_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_5_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_5_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_5_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_5_CONFIG_MAX_WR
	);


	U43 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_6,
		ENERGY_STROBE => U89_valid_6,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_6_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_6_READ_DATA,
		READ_INT => BUS_Spectrum_6_R_INT,
		READ_DATAVALID => BUS_Spectrum_6_VLD,
		STATUS => REG_Spectrum_6_STATUS_RD,
		CONFIG => REG_Spectrum_6_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_6_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_6_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_6_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_6_CONFIG_MAX_WR
	);


	U44 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_7,
		ENERGY_STROBE => U89_valid_7,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_7_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_7_READ_DATA,
		READ_INT => BUS_Spectrum_7_R_INT,
		READ_DATAVALID => BUS_Spectrum_7_VLD,
		STATUS => REG_Spectrum_7_STATUS_RD,
		CONFIG => REG_Spectrum_7_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_7_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_7_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_7_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_7_CONFIG_MAX_WR
	);


	U45 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_8,
		ENERGY_STROBE => U89_valid_8,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_8_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_8_READ_DATA,
		READ_INT => BUS_Spectrum_8_R_INT,
		READ_DATAVALID => BUS_Spectrum_8_VLD,
		STATUS => REG_Spectrum_8_STATUS_RD,
		CONFIG => REG_Spectrum_8_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_8_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_8_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_8_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_8_CONFIG_MAX_WR
	);


	U46 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_9,
		ENERGY_STROBE => U89_valid_9,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_9_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_9_READ_DATA,
		READ_INT => BUS_Spectrum_9_R_INT,
		READ_DATAVALID => BUS_Spectrum_9_VLD,
		STATUS => REG_Spectrum_9_STATUS_RD,
		CONFIG => REG_Spectrum_9_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_9_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_9_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_9_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_9_CONFIG_MAX_WR
	);


	U47 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_10,
		ENERGY_STROBE => U89_valid_10,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_10_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_10_READ_DATA,
		READ_INT => BUS_Spectrum_10_R_INT,
		READ_DATAVALID => BUS_Spectrum_10_VLD,
		STATUS => REG_Spectrum_10_STATUS_RD,
		CONFIG => REG_Spectrum_10_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_10_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_10_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_10_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_10_CONFIG_MAX_WR
	);


	U48 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_11,
		ENERGY_STROBE => U89_valid_11,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_11_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_11_READ_DATA,
		READ_INT => BUS_Spectrum_11_R_INT,
		READ_DATAVALID => BUS_Spectrum_11_VLD,
		STATUS => REG_Spectrum_11_STATUS_RD,
		CONFIG => REG_Spectrum_11_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_11_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_11_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_11_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_11_CONFIG_MAX_WR
	);


	U49 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_12,
		ENERGY_STROBE => U89_valid_12,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_12_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_12_READ_DATA,
		READ_INT => BUS_Spectrum_12_R_INT,
		READ_DATAVALID => BUS_Spectrum_12_VLD,
		STATUS => REG_Spectrum_12_STATUS_RD,
		CONFIG => REG_Spectrum_12_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_12_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_12_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_12_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_12_CONFIG_MAX_WR
	);


	U50 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_13,
		ENERGY_STROBE => U89_valid_13,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_13_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_13_READ_DATA,
		READ_INT => BUS_Spectrum_13_R_INT,
		READ_DATAVALID => BUS_Spectrum_13_VLD,
		STATUS => REG_Spectrum_13_STATUS_RD,
		CONFIG => REG_Spectrum_13_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_13_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_13_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_13_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_13_CONFIG_MAX_WR
	);


	U51 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_14,
		ENERGY_STROBE => U89_valid_14,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_14_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_14_READ_DATA,
		READ_INT => BUS_Spectrum_14_R_INT,
		READ_DATAVALID => BUS_Spectrum_14_VLD,
		STATUS => REG_Spectrum_14_STATUS_RD,
		CONFIG => REG_Spectrum_14_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_14_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_14_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_14_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_14_CONFIG_MAX_WR
	);


	U52 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_15,
		ENERGY_STROBE => U89_valid_15,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_15_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_15_READ_DATA,
		READ_INT => BUS_Spectrum_15_R_INT,
		READ_DATAVALID => BUS_Spectrum_15_VLD,
		STATUS => REG_Spectrum_15_STATUS_RD,
		CONFIG => REG_Spectrum_15_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_15_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_15_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_15_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_15_CONFIG_MAX_WR
	);


	U53 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_16,
		ENERGY_STROBE => U89_valid_16,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_16_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_16_READ_DATA,
		READ_INT => BUS_Spectrum_16_R_INT,
		READ_DATAVALID => BUS_Spectrum_16_VLD,
		STATUS => REG_Spectrum_16_STATUS_RD,
		CONFIG => REG_Spectrum_16_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_16_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_16_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_16_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_16_CONFIG_MAX_WR
	);


	U54 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_17,
		ENERGY_STROBE => U89_valid_17,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_17_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_17_READ_DATA,
		READ_INT => BUS_Spectrum_17_R_INT,
		READ_DATAVALID => BUS_Spectrum_17_VLD,
		STATUS => REG_Spectrum_17_STATUS_RD,
		CONFIG => REG_Spectrum_17_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_17_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_17_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_17_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_17_CONFIG_MAX_WR
	);


	U55 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_18,
		ENERGY_STROBE => U89_valid_18,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_18_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_18_READ_DATA,
		READ_INT => BUS_Spectrum_18_R_INT,
		READ_DATAVALID => BUS_Spectrum_18_VLD,
		STATUS => REG_Spectrum_18_STATUS_RD,
		CONFIG => REG_Spectrum_18_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_18_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_18_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_18_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_18_CONFIG_MAX_WR
	);


	U56 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_19,
		ENERGY_STROBE => U89_valid_19,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_19_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_19_READ_DATA,
		READ_INT => BUS_Spectrum_19_R_INT,
		READ_DATAVALID => BUS_Spectrum_19_VLD,
		STATUS => REG_Spectrum_19_STATUS_RD,
		CONFIG => REG_Spectrum_19_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_19_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_19_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_19_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_19_CONFIG_MAX_WR
	);


	U57 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_20,
		ENERGY_STROBE => U89_valid_20,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_20_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_20_READ_DATA,
		READ_INT => BUS_Spectrum_20_R_INT,
		READ_DATAVALID => BUS_Spectrum_20_VLD,
		STATUS => REG_Spectrum_20_STATUS_RD,
		CONFIG => REG_Spectrum_20_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_20_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_20_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_20_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_20_CONFIG_MAX_WR
	);


	U58 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_21,
		ENERGY_STROBE => U89_valid_21,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_21_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_21_READ_DATA,
		READ_INT => BUS_Spectrum_21_R_INT,
		READ_DATAVALID => BUS_Spectrum_21_VLD,
		STATUS => REG_Spectrum_21_STATUS_RD,
		CONFIG => REG_Spectrum_21_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_21_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_21_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_21_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_21_CONFIG_MAX_WR
	);


	U59 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_22,
		ENERGY_STROBE => U89_valid_22,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_22_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_22_READ_DATA,
		READ_INT => BUS_Spectrum_22_R_INT,
		READ_DATAVALID => BUS_Spectrum_22_VLD,
		STATUS => REG_Spectrum_22_STATUS_RD,
		CONFIG => REG_Spectrum_22_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_22_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_22_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_22_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_22_CONFIG_MAX_WR
	);


	U60 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_23,
		ENERGY_STROBE => U89_valid_23,
		P_running => open,
		P_acceptedPulse => open,
		CLK_WRITE => CLK_ACQ,
		CE => "1",
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Spectrum_23_READ_ADDRESS,
		READ_DATA => BUS_Spectrum_23_READ_DATA,
		READ_INT => BUS_Spectrum_23_R_INT,
		READ_DATAVALID => BUS_Spectrum_23_VLD,
		STATUS => REG_Spectrum_23_STATUS_RD,
		CONFIG => REG_Spectrum_23_CONFIG_WR,
		CONFIG_LIMIT => REG_Spectrum_23_CONFIG_LIMIT_WR,
		CONFIG_REBIN => REG_Spectrum_23_CONFIG_REBIN_WR,
		CONFIG_MIN => REG_Spectrum_23_CONFIG_MIN_WR,
		CONFIG_MAX => REG_Spectrum_23_CONFIG_MAX_WR
	);

PROCESS_REG_U61 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U61_hold <= EXT(U34_out_0,32);
    end if;
end process;
REG_skip_RD <= EXT(U34_out_0,32);
PROCESS_REG_U62 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U62_hold <= EXT(U35_out_0,32);
    end if;
end process;
REG_reset_RD <= EXT(U35_out_0,32);
PROCESS_REG_U63 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U63_hold <= EXT(U36_out_0,32);
    end if;
end process;
REG_int_time_RD <= EXT(U36_out_0,32);
PROCESS_REG_U64 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U64_hold <= EXT(U37_out_0,32);
    end if;
end process;
REG_pre_int_RD <= EXT(U37_out_0,32);
PROCESS_REG_U65 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U65_hold <= EXT(U33_out_0,32);
    end if;
end process;
REG_stopwrite_RD <= EXT(U33_out_0,32);
PROCESS_REG_U66 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U66_hold <= EXT(U31_out_0,32);
    end if;
end process;
REG_read_RD <= EXT(U31_out_0,32);
PROCESS_REG_U67 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U67_hold <= EXT(U32_out_0,32);
    end if;
end process;
REG_write_RD <= EXT(U32_out_0,32);
PROCESS_REG_U68 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U68_hold <= EXT(U30_out_0,32);
    end if;
end process;
REG_gate_u_RD <= EXT(U30_out_0,32);
PROCESS_REG_U69 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U69_hold <= EXT(U29_out_0,32);
    end if;
end process;
REG_gate_l_RD <= EXT(U29_out_0,32);
PROCESS_REG_U70 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U70_hold <= EXT(U0_out_0,32);
    end if;
end process;
REG_polarity_RD <= EXT(U0_out_0,32);
PROCESS_REG_U71 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U71_hold <= EXT(U1_out_0,32);
    end if;
end process;
REG_inhib_RD <= EXT(U1_out_0,32);
PROCESS_REG_U72 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U72_hold <= EXT(U2_out_0,32);
    end if;
end process;
REG_delay_RD <= EXT(U2_out_0,32);

	U73 : xlx_spectrum
	Generic map(
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ENERGY => U89_energy_0,
		ENERGY_STROBE => U89_valid_0,
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


U74_0:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U3_A0,
	disable_det => U86_0,
	thrsh => U85_0,
	TRIGOUT => U74_TRIGOUT_0,
	ANALOGOUT => U74_ANALOGOUT_0,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_1:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U4_A1,
	disable_det => U86_1,
	thrsh => U85_1,
	TRIGOUT => U74_TRIGOUT_1,
	ANALOGOUT => U74_ANALOGOUT_1,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_2:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U5_A2,
	disable_det => U86_2,
	thrsh => U85_2,
	TRIGOUT => U74_TRIGOUT_2,
	ANALOGOUT => U74_ANALOGOUT_2,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_3:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U6_A3,
	disable_det => U86_3,
	thrsh => U85_3,
	TRIGOUT => U74_TRIGOUT_3,
	ANALOGOUT => U74_ANALOGOUT_3,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_4:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U7_A4,
	disable_det => U86_4,
	thrsh => U85_4,
	TRIGOUT => U74_TRIGOUT_4,
	ANALOGOUT => U74_ANALOGOUT_4,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_5:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U8_A5,
	disable_det => U86_5,
	thrsh => U85_5,
	TRIGOUT => U74_TRIGOUT_5,
	ANALOGOUT => U74_ANALOGOUT_5,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_6:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U9_A6,
	disable_det => U86_6,
	thrsh => U85_6,
	TRIGOUT => U74_TRIGOUT_6,
	ANALOGOUT => U74_ANALOGOUT_6,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_7:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U10_A7,
	disable_det => U86_7,
	thrsh => U85_7,
	TRIGOUT => U74_TRIGOUT_7,
	ANALOGOUT => U74_ANALOGOUT_7,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_8:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U11_A8,
	disable_det => U86_8,
	thrsh => U85_8,
	TRIGOUT => U74_TRIGOUT_8,
	ANALOGOUT => U74_ANALOGOUT_8,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_9:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U12_A9,
	disable_det => U86_9,
	thrsh => U85_9,
	TRIGOUT => U74_TRIGOUT_9,
	ANALOGOUT => U74_ANALOGOUT_9,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_10:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U13_A10,
	disable_det => U86_10,
	thrsh => U85_10,
	TRIGOUT => U74_TRIGOUT_10,
	ANALOGOUT => U74_ANALOGOUT_10,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_11:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U14_A11,
	disable_det => U86_11,
	thrsh => U85_11,
	TRIGOUT => U74_TRIGOUT_11,
	ANALOGOUT => U74_ANALOGOUT_11,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_12:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U15_A12,
	disable_det => U86_12,
	thrsh => U85_12,
	TRIGOUT => U74_TRIGOUT_12,
	ANALOGOUT => U74_ANALOGOUT_12,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_13:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U16_A13,
	disable_det => U86_13,
	thrsh => U85_13,
	TRIGOUT => U74_TRIGOUT_13,
	ANALOGOUT => U74_ANALOGOUT_13,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_14:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U17_A14,
	disable_det => U86_14,
	thrsh => U85_14,
	TRIGOUT => U74_TRIGOUT_14,
	ANALOGOUT => U74_ANALOGOUT_14,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_15:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U18_A15,
	disable_det => U86_15,
	thrsh => U85_15,
	TRIGOUT => U74_TRIGOUT_15,
	ANALOGOUT => U74_ANALOGOUT_15,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_16:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U19_A16,
	disable_det => U86_16,
	thrsh => U85_16,
	TRIGOUT => U74_TRIGOUT_16,
	ANALOGOUT => U74_ANALOGOUT_16,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_17:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U20_A17,
	disable_det => U86_17,
	thrsh => U85_17,
	TRIGOUT => U74_TRIGOUT_17,
	ANALOGOUT => U74_ANALOGOUT_17,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_18:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U21_A18,
	disable_det => U86_18,
	thrsh => U85_18,
	TRIGOUT => U74_TRIGOUT_18,
	ANALOGOUT => U74_ANALOGOUT_18,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_19:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U22_A19,
	disable_det => U86_19,
	thrsh => U85_19,
	TRIGOUT => U74_TRIGOUT_19,
	ANALOGOUT => U74_ANALOGOUT_19,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_20:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U23_A20,
	disable_det => U86_20,
	thrsh => U85_20,
	TRIGOUT => U74_TRIGOUT_20,
	ANALOGOUT => U74_ANALOGOUT_20,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_21:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U24_A21,
	disable_det => U86_21,
	thrsh => U85_21,
	TRIGOUT => U74_TRIGOUT_21,
	ANALOGOUT => U74_ANALOGOUT_21,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_22:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U25_A22,
	disable_det => U86_22,
	thrsh => U85_22,
	TRIGOUT => U74_TRIGOUT_22,
	ANALOGOUT => U74_ANALOGOUT_22,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U74_23:SUBPAGE_LowerTrigger
PORT MAP(
	AIN => U26_A23,
	disable_det => U86_23,
	thrsh => U85_23,
	TRIGOUT => U74_TRIGOUT_23,
	ANALOGOUT => U74_ANALOGOUT_23,
	gate => U29_out_0,
	polarity => U0_out_0,
	inhib => U1_out_0,
	delay => U2_out_0,
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

U75:SUBPAGE_ReduceRate
PORT MAP(
	Original => U28_OUT,
	skip => U34_out_0,
	gate => U30_out_0,
	reset => U35_out_0,
	delay => U2_out_0,
	Reduced => U75_Reduced,
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
U76_out_0 <= U74_TRIGOUT_0 & U74_TRIGOUT_1 & U74_TRIGOUT_2 & U74_TRIGOUT_3 & U74_TRIGOUT_4 & U74_TRIGOUT_5 & U74_TRIGOUT_6 & U74_TRIGOUT_7 & U74_TRIGOUT_8 & U74_TRIGOUT_9 & U74_TRIGOUT_10 & U74_TRIGOUT_11 & U74_TRIGOUT_12 & U74_TRIGOUT_13 & U74_TRIGOUT_14 & U74_TRIGOUT_15 & U74_TRIGOUT_16 & U74_TRIGOUT_17 & U74_TRIGOUT_18 & U74_TRIGOUT_19 & U74_TRIGOUT_20 & U74_TRIGOUT_21 & U74_TRIGOUT_22 & U74_TRIGOUT_23 ;
U77_OUT <= U74_TRIGOUT_0 OR U74_TRIGOUT_1 OR U74_TRIGOUT_2 OR U74_TRIGOUT_3 OR U74_TRIGOUT_4 OR U74_TRIGOUT_5 OR U74_TRIGOUT_6 OR U74_TRIGOUT_7 OR U74_TRIGOUT_8 OR U74_TRIGOUT_9 OR U74_TRIGOUT_10 OR U74_TRIGOUT_11 OR U74_TRIGOUT_12 OR U74_TRIGOUT_13 OR U74_TRIGOUT_14 OR U74_TRIGOUT_15 OR U74_TRIGOUT_16 OR U74_TRIGOUT_17 OR U74_TRIGOUT_18 OR U74_TRIGOUT_19 OR U74_TRIGOUT_20 OR U74_TRIGOUT_21 OR U74_TRIGOUT_22 OR U74_TRIGOUT_23 OR "0" OR "0" OR "0" OR "0" OR "0" OR "0" OR "0" OR "0";
PROCESS_REG_U78 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0)) and U28_OUT = "1" then
         U78_hold <= EXT(U76_out_0,32);
    end if;
end process;
REG_trigger_code_RD <= EXT(U76_out_0,32) when U28_OUT="1" else U78_hold;

	U79 : TimestampGenerator
	Generic map(
		nbits => 	32
	)
	PORT MAP(
		TIMESTAMP => U79_TIMESTAMP,
		T0 => '0',
		CLK_READ => CLK_125(0),
		ClkCounter => CLK_125(0)
	);

PROCESS_REG_U80 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0)) and U28_OUT = "1" then
         U80_hold <= EXT(U79_TIMESTAMP,32);
    end if;
end process;
REG_timestamp_RD <= EXT(U79_TIMESTAMP,32) when U28_OUT="1" else U80_hold;
U81_out <= ext(U76_out_0 , 32);

U82_0:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U3_A0,
	top => U87_0,
	TRIGOUT => U82_TRIGOUT_0,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_1:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U4_A1,
	top => U87_1,
	TRIGOUT => U82_TRIGOUT_1,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_2:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U5_A2,
	top => U87_2,
	TRIGOUT => U82_TRIGOUT_2,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_3:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U6_A3,
	top => U87_3,
	TRIGOUT => U82_TRIGOUT_3,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_4:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U7_A4,
	top => U87_4,
	TRIGOUT => U82_TRIGOUT_4,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_5:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U8_A5,
	top => U87_5,
	TRIGOUT => U82_TRIGOUT_5,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_6:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U9_A6,
	top => U87_6,
	TRIGOUT => U82_TRIGOUT_6,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_7:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U10_A7,
	top => U87_7,
	TRIGOUT => U82_TRIGOUT_7,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_8:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U11_A8,
	top => U87_8,
	TRIGOUT => U82_TRIGOUT_8,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_9:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U12_A9,
	top => U87_9,
	TRIGOUT => U82_TRIGOUT_9,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_10:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U13_A10,
	top => U87_10,
	TRIGOUT => U82_TRIGOUT_10,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_11:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U14_A11,
	top => U87_11,
	TRIGOUT => U82_TRIGOUT_11,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_12:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U15_A12,
	top => U87_12,
	TRIGOUT => U82_TRIGOUT_12,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_13:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U16_A13,
	top => U87_13,
	TRIGOUT => U82_TRIGOUT_13,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_14:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U17_A14,
	top => U87_14,
	TRIGOUT => U82_TRIGOUT_14,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_15:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U18_A15,
	top => U87_15,
	TRIGOUT => U82_TRIGOUT_15,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_16:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U19_A16,
	top => U87_16,
	TRIGOUT => U82_TRIGOUT_16,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_17:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U20_A17,
	top => U87_17,
	TRIGOUT => U82_TRIGOUT_17,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_18:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U21_A18,
	top => U87_18,
	TRIGOUT => U82_TRIGOUT_18,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_19:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U22_A19,
	top => U87_19,
	TRIGOUT => U82_TRIGOUT_19,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_20:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U23_A20,
	top => U87_20,
	TRIGOUT => U82_TRIGOUT_20,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_21:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U24_A21,
	top => U87_21,
	TRIGOUT => U82_TRIGOUT_21,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_22:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U25_A22,
	top => U87_22,
	TRIGOUT => U82_TRIGOUT_22,
	polarity => U0_out_0,
	gate => U30_out_0,
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

U82_23:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U26_A23,
	top => U87_23,
	TRIGOUT => U82_TRIGOUT_23,
	polarity => U0_out_0,
	gate => U30_out_0,
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
U83_OUT <= U89_valid_0 AND U89_valid_1 AND U89_valid_2 AND U89_valid_3 AND U89_valid_4 AND U89_valid_5 AND U89_valid_6 AND U89_valid_7 AND U89_valid_8 AND U89_valid_9 AND U89_valid_10 AND U89_valid_11 AND U89_valid_12 AND U89_valid_13 AND U89_valid_14 AND U89_valid_15 AND U89_valid_16 AND U89_valid_17 AND U89_valid_18 AND U89_valid_19 AND U89_valid_20 AND U89_valid_21 AND U89_valid_22 AND U89_valid_23 AND U84_CONST AND U84_CONST AND U84_CONST AND U84_CONST AND U84_CONST AND U84_CONST AND U84_CONST AND U84_CONST;
U84_CONST <= conv_std_logic_vector(1,1);
U85_0 <= REG_thrsh_0_WR( 15 downto 0 );
U85_1 <= REG_thrsh_1_WR( 15 downto 0 );
U85_2 <= REG_thrsh_2_WR( 15 downto 0 );
U85_3 <= REG_thrsh_3_WR( 15 downto 0 );
U85_4 <= REG_thrsh_4_WR( 15 downto 0 );
U85_5 <= REG_thrsh_5_WR( 15 downto 0 );
U85_6 <= REG_thrsh_6_WR( 15 downto 0 );
U85_7 <= REG_thrsh_7_WR( 15 downto 0 );
U85_8 <= REG_thrsh_8_WR( 15 downto 0 );
U85_9 <= REG_thrsh_9_WR( 15 downto 0 );
U85_10 <= REG_thrsh_10_WR( 15 downto 0 );
U85_11 <= REG_thrsh_11_WR( 15 downto 0 );
U85_12 <= REG_thrsh_12_WR( 15 downto 0 );
U85_13 <= REG_thrsh_13_WR( 15 downto 0 );
U85_14 <= REG_thrsh_14_WR( 15 downto 0 );
U85_15 <= REG_thrsh_15_WR( 15 downto 0 );
U85_16 <= REG_thrsh_16_WR( 15 downto 0 );
U85_17 <= REG_thrsh_17_WR( 15 downto 0 );
U85_18 <= REG_thrsh_18_WR( 15 downto 0 );
U85_19 <= REG_thrsh_19_WR( 15 downto 0 );
U85_20 <= REG_thrsh_20_WR( 15 downto 0 );
U85_21 <= REG_thrsh_21_WR( 15 downto 0 );
U85_22 <= REG_thrsh_22_WR( 15 downto 0 );
U85_23 <= REG_thrsh_23_WR( 15 downto 0 );
U85_24 <= REG_thrsh_24_WR( 15 downto 0 );
U85_25 <= REG_thrsh_25_WR( 15 downto 0 );
U85_26 <= REG_thrsh_26_WR( 15 downto 0 );
U85_27 <= REG_thrsh_27_WR( 15 downto 0 );
U85_28 <= REG_thrsh_28_WR( 15 downto 0 );
U85_29 <= REG_thrsh_29_WR( 15 downto 0 );
U85_30 <= REG_thrsh_30_WR( 15 downto 0 );
U85_31 <= REG_thrsh_31_WR( 15 downto 0 );
U86_0 <= REG_disable_det_0_WR( 0 downto 0 );
U86_1 <= REG_disable_det_1_WR( 0 downto 0 );
U86_2 <= REG_disable_det_2_WR( 0 downto 0 );
U86_3 <= REG_disable_det_3_WR( 0 downto 0 );
U86_4 <= REG_disable_det_4_WR( 0 downto 0 );
U86_5 <= REG_disable_det_5_WR( 0 downto 0 );
U86_6 <= REG_disable_det_6_WR( 0 downto 0 );
U86_7 <= REG_disable_det_7_WR( 0 downto 0 );
U86_8 <= REG_disable_det_8_WR( 0 downto 0 );
U86_9 <= REG_disable_det_9_WR( 0 downto 0 );
U86_10 <= REG_disable_det_10_WR( 0 downto 0 );
U86_11 <= REG_disable_det_11_WR( 0 downto 0 );
U86_12 <= REG_disable_det_12_WR( 0 downto 0 );
U86_13 <= REG_disable_det_13_WR( 0 downto 0 );
U86_14 <= REG_disable_det_14_WR( 0 downto 0 );
U86_15 <= REG_disable_det_15_WR( 0 downto 0 );
U86_16 <= REG_disable_det_16_WR( 0 downto 0 );
U86_17 <= REG_disable_det_17_WR( 0 downto 0 );
U86_18 <= REG_disable_det_18_WR( 0 downto 0 );
U86_19 <= REG_disable_det_19_WR( 0 downto 0 );
U86_20 <= REG_disable_det_20_WR( 0 downto 0 );
U86_21 <= REG_disable_det_21_WR( 0 downto 0 );
U86_22 <= REG_disable_det_22_WR( 0 downto 0 );
U86_23 <= REG_disable_det_23_WR( 0 downto 0 );
U86_24 <= REG_disable_det_24_WR( 0 downto 0 );
U86_25 <= REG_disable_det_25_WR( 0 downto 0 );
U86_26 <= REG_disable_det_26_WR( 0 downto 0 );
U86_27 <= REG_disable_det_27_WR( 0 downto 0 );
U86_28 <= REG_disable_det_28_WR( 0 downto 0 );
U86_29 <= REG_disable_det_29_WR( 0 downto 0 );
U86_30 <= REG_disable_det_30_WR( 0 downto 0 );
U86_31 <= REG_disable_det_31_WR( 0 downto 0 );
U87_0 <= REG_top_0_WR( 15 downto 0 );
U87_1 <= REG_top_1_WR( 15 downto 0 );
U87_2 <= REG_top_2_WR( 15 downto 0 );
U87_3 <= REG_top_3_WR( 15 downto 0 );
U87_4 <= REG_top_4_WR( 15 downto 0 );
U87_5 <= REG_top_5_WR( 15 downto 0 );
U87_6 <= REG_top_6_WR( 15 downto 0 );
U87_7 <= REG_top_7_WR( 15 downto 0 );
U87_8 <= REG_top_8_WR( 15 downto 0 );
U87_9 <= REG_top_9_WR( 15 downto 0 );
U87_10 <= REG_top_10_WR( 15 downto 0 );
U87_11 <= REG_top_11_WR( 15 downto 0 );
U87_12 <= REG_top_12_WR( 15 downto 0 );
U87_13 <= REG_top_13_WR( 15 downto 0 );
U87_14 <= REG_top_14_WR( 15 downto 0 );
U87_15 <= REG_top_15_WR( 15 downto 0 );
U87_16 <= REG_top_16_WR( 15 downto 0 );
U87_17 <= REG_top_17_WR( 15 downto 0 );
U87_18 <= REG_top_18_WR( 15 downto 0 );
U87_19 <= REG_top_19_WR( 15 downto 0 );
U87_20 <= REG_top_20_WR( 15 downto 0 );
U87_21 <= REG_top_21_WR( 15 downto 0 );
U87_22 <= REG_top_22_WR( 15 downto 0 );
U87_23 <= REG_top_23_WR( 15 downto 0 );
U87_24 <= REG_top_24_WR( 15 downto 0 );
U87_25 <= REG_top_25_WR( 15 downto 0 );
U87_26 <= REG_top_26_WR( 15 downto 0 );
U87_27 <= REG_top_27_WR( 15 downto 0 );
U87_28 <= REG_top_28_WR( 15 downto 0 );
U87_29 <= REG_top_29_WR( 15 downto 0 );
U87_30 <= REG_top_30_WR( 15 downto 0 );
U87_31 <= REG_top_31_WR( 15 downto 0 );
U88_out_0 <= REG_baseline_WR(0 downto 0);
REG_baseline_RD  <= REG_baseline_WR;

U89_0:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_0,
	base => U90_0,
	energy => U89_energy_0,
	valid => U89_valid_0,
	int_gate => U89_int_gate_0,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_1:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_1,
	base => U90_1,
	energy => U89_energy_1,
	valid => U89_valid_1,
	int_gate => U89_int_gate_1,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_2:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_2,
	base => U90_2,
	energy => U89_energy_2,
	valid => U89_valid_2,
	int_gate => U89_int_gate_2,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_3:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_3,
	base => U90_3,
	energy => U89_energy_3,
	valid => U89_valid_3,
	int_gate => U89_int_gate_3,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_4:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_4,
	base => U90_4,
	energy => U89_energy_4,
	valid => U89_valid_4,
	int_gate => U89_int_gate_4,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_5:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_5,
	base => U90_5,
	energy => U89_energy_5,
	valid => U89_valid_5,
	int_gate => U89_int_gate_5,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_6:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_6,
	base => U90_6,
	energy => U89_energy_6,
	valid => U89_valid_6,
	int_gate => U89_int_gate_6,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_7:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_7,
	base => U90_7,
	energy => U89_energy_7,
	valid => U89_valid_7,
	int_gate => U89_int_gate_7,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_8:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_8,
	base => U90_8,
	energy => U89_energy_8,
	valid => U89_valid_8,
	int_gate => U89_int_gate_8,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_9:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_9,
	base => U90_9,
	energy => U89_energy_9,
	valid => U89_valid_9,
	int_gate => U89_int_gate_9,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_10:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_10,
	base => U90_10,
	energy => U89_energy_10,
	valid => U89_valid_10,
	int_gate => U89_int_gate_10,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_11:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_11,
	base => U90_11,
	energy => U89_energy_11,
	valid => U89_valid_11,
	int_gate => U89_int_gate_11,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_12:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_12,
	base => U90_12,
	energy => U89_energy_12,
	valid => U89_valid_12,
	int_gate => U89_int_gate_12,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_13:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_13,
	base => U90_13,
	energy => U89_energy_13,
	valid => U89_valid_13,
	int_gate => U89_int_gate_13,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_14:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_14,
	base => U90_14,
	energy => U89_energy_14,
	valid => U89_valid_14,
	int_gate => U89_int_gate_14,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_15:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_15,
	base => U90_15,
	energy => U89_energy_15,
	valid => U89_valid_15,
	int_gate => U89_int_gate_15,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_16:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_16,
	base => U90_16,
	energy => U89_energy_16,
	valid => U89_valid_16,
	int_gate => U89_int_gate_16,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_17:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_17,
	base => U90_17,
	energy => U89_energy_17,
	valid => U89_valid_17,
	int_gate => U89_int_gate_17,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_18:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_18,
	base => U90_18,
	energy => U89_energy_18,
	valid => U89_valid_18,
	int_gate => U89_int_gate_18,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_19:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_19,
	base => U90_19,
	energy => U89_energy_19,
	valid => U89_valid_19,
	int_gate => U89_int_gate_19,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_20:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_20,
	base => U90_20,
	energy => U89_energy_20,
	valid => U89_valid_20,
	int_gate => U89_int_gate_20,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_21:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_21,
	base => U90_21,
	energy => U89_energy_21,
	valid => U89_valid_21,
	int_gate => U89_int_gate_21,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_22:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_22,
	base => U90_22,
	energy => U89_energy_22,
	valid => U89_valid_22,
	int_gate => U89_int_gate_22,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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

U89_23:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U74_ANALOGOUT_23,
	base => U90_23,
	energy => U89_energy_23,
	valid => U89_valid_23,
	int_gate => U89_int_gate_23,
	dummy => open,
	trig => U75_Reduced,
	int_time => U36_out_0,
	pre_int => U37_out_0,
	cant_out => U92_FIFO_FULL,
	force_out => U32_out_0,
	force_stop => U33_out_0,
	manual_base => U88_out_0,
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
U90_0 <= REG_base_0_WR( 15 downto 0 );
U90_1 <= REG_base_1_WR( 15 downto 0 );
U90_2 <= REG_base_2_WR( 15 downto 0 );
U90_3 <= REG_base_3_WR( 15 downto 0 );
U90_4 <= REG_base_4_WR( 15 downto 0 );
U90_5 <= REG_base_5_WR( 15 downto 0 );
U90_6 <= REG_base_6_WR( 15 downto 0 );
U90_7 <= REG_base_7_WR( 15 downto 0 );
U90_8 <= REG_base_8_WR( 15 downto 0 );
U90_9 <= REG_base_9_WR( 15 downto 0 );
U90_10 <= REG_base_10_WR( 15 downto 0 );
U90_11 <= REG_base_11_WR( 15 downto 0 );
U90_12 <= REG_base_12_WR( 15 downto 0 );
U90_13 <= REG_base_13_WR( 15 downto 0 );
U90_14 <= REG_base_14_WR( 15 downto 0 );
U90_15 <= REG_base_15_WR( 15 downto 0 );
U90_16 <= REG_base_16_WR( 15 downto 0 );
U90_17 <= REG_base_17_WR( 15 downto 0 );
U90_18 <= REG_base_18_WR( 15 downto 0 );
U90_19 <= REG_base_19_WR( 15 downto 0 );
U90_20 <= REG_base_20_WR( 15 downto 0 );
U90_21 <= REG_base_21_WR( 15 downto 0 );
U90_22 <= REG_base_22_WR( 15 downto 0 );
U90_23 <= REG_base_23_WR( 15 downto 0 );
U90_24 <= REG_base_24_WR( 15 downto 0 );
U90_25 <= REG_base_25_WR( 15 downto 0 );
U90_26 <= REG_base_26_WR( 15 downto 0 );
U90_27 <= REG_base_27_WR( 15 downto 0 );
U90_28 <= REG_base_28_WR( 15 downto 0 );
U90_29 <= REG_base_29_WR( 15 downto 0 );
U90_30 <= REG_base_30_WR( 15 downto 0 );
U90_31 <= REG_base_31_WR( 15 downto 0 );
PROCESS_REG_U91 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U91_hold <= EXT(U92_FIFO_FULL,32);
    end if;
end process;
REG_full_RD <= EXT(U92_FIFO_FULL,32);

	U92 : U92_custompacket
	Generic map(
		memLength => 	32768,
		wordWidth => 	32
	)
	PORT MAP(
		IN_2 => U89_energy_0,
		IN_3 => U89_energy_1,
		IN_4 => U89_energy_2,
		IN_5 => U89_energy_3,
		IN_6 => U89_energy_4,
		IN_7 => U89_energy_5,
		IN_8 => U89_energy_6,
		IN_9 => U89_energy_7,
		IN_10 => U89_energy_8,
		IN_11 => U89_energy_9,
		IN_12 => U89_energy_10,
		IN_13 => U89_energy_11,
		IN_14 => U89_energy_12,
		IN_15 => U89_energy_13,
		IN_16 => U89_energy_14,
		IN_17 => U89_energy_15,
		IN_18 => U89_energy_16,
		IN_19 => U89_energy_17,
		IN_20 => U89_energy_18,
		IN_21 => U89_energy_19,
		IN_22 => U89_energy_20,
		IN_23 => U89_energy_21,
		IN_24 => U89_energy_22,
		IN_25 => U89_energy_23,
		IN_26 => x"0000",
		IN_27 => x"0000",
		IN_28 => x"0000",
		IN_29 => x"0000",
		IN_30 => x"0000",
		IN_31 => x"0000",
		IN_32 => x"0000",
		IN_33 => x"0000",
		IN_1 => U79_TIMESTAMP,
		IN_34 => U81_out,
		TRIG => U83_OUT,
		CLK_WRITE => CLK_ACQ,
		SYNC_TRIG => "0",
		SYNC_RESET => "0",
		SYNC_CLK => "0",
		BUSY => open,
		FIFO_FULL => U92_FIFO_FULL,
		RUN => open,
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_DATA => BUS_All_Energies_READ_DATA,
		READ_DATAVALID => BUS_All_Energies_VLD,
		READ_RD_INT => BUS_All_Energies_R_INT,
		READ_STATUS => REG_All_Energies_READ_STATUS_RD,
		READ_VALID_WORDS => REG_All_Energies_READ_VALID_WORDS_RD,
		CONFIG => REG_All_Energies_CONFIG_WR
	);

U93_SYNC_0 <= SYNC_0_IN;


	U94 : MCRateMeter
	Generic map(
		CHANNEL_COUNT => 	1,
		CLK_FREQ => 	1250000000
	)
	PORT MAP(
		trigger => U75_Reduced,
		VETO => '0',
		START => U35_out_0(0),
		CLK => CLK_ACQ(0),
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_RateMeter_0_READ_ADDRESS,
		READ_DATA => BUS_RateMeter_0_READ_DATA,
		READ_DATAVALID => BUS_RateMeter_0_VLD
	);


	U95 : MCRateMeter
	Generic map(
		CHANNEL_COUNT => 	1,
		CLK_FREQ => 	1250000000
	)
	PORT MAP(
		trigger => U28_OUT,
		VETO => '0',
		START => U35_out_0(0),
		CLK => CLK_ACQ(0),
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_RateMeter_NoSkip_READ_ADDRESS,
		READ_DATA => BUS_RateMeter_NoSkip_READ_DATA,
		READ_DATAVALID => BUS_RateMeter_NoSkip_VLD
	);


	U96 : xlx_oscilloscope_sync
	Generic map(
		channels => 	3,
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ANALOG => U98_out & U99_out & U97_out,
		D0 => U101_SYNC_2 & U100_SYNC_1 & U93_SYNC_0,
		D1 => U106_OUT & U105_OUT & "0",
		D2 => "0" & "0" & "0",
		D3 => "0" & "0" & "0",
		TRIG => "0",
		BUSY => open,
		CE => "1",
		CLK_WRITE => CLK_ACQ,
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Syncs_READ_ADDRESS,
		READ_DATA => BUS_Syncs_READ_DATA,
		READ_DATAVALID => BUS_Syncs_VLD,
		READ_STATUS => REG_Syncs_READ_STATUS_RD,
		READ_POSITION => REG_Syncs_READ_POSITION_RD,
		CONFIG_TRIGGER_MODE => REG_Syncs_CONFIG_TRIGGER_MODE_WR,
		CONFIG_TRIGGER_LEVEL => REG_Syncs_CONFIG_TRIGGER_LEVEL_WR,
		CONFIG_PRETRIGGER => REG_Syncs_CONFIG_PRETRIGGER_WR,
		CONFIG_DECIMATOR => REG_Syncs_CONFIG_DECIMATOR_WR,
		CONFIG_ARM => REG_Syncs_CONFIG_ARM_WR
	);

U97_out <= ext(U93_SYNC_0 , 16);
U98_out <= ext(U101_SYNC_2 , 16);
U99_out <= ext(U100_SYNC_1 , 16);
U100_SYNC_1 <= SYNC_1_IN;

U101_SYNC_2 <= SYNC_2_IN;


	U102 : MCRateMeter
	Generic map(
		CHANNEL_COUNT => 	1,
		CLK_FREQ => 	1250000000
	)
	PORT MAP(
		trigger => U105_OUT,
		VETO => '0',
		START => '0',
		CLK => CLK_ACQ(0),
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_SyncIn1Meter_READ_ADDRESS,
		READ_DATA => BUS_SyncIn1Meter_READ_DATA,
		READ_DATAVALID => BUS_SyncIn1Meter_VLD
	);


	U103 : MCRateMeter
	Generic map(
		CHANNEL_COUNT => 	1,
		CLK_FREQ => 	1250000000
	)
	PORT MAP(
		trigger => U106_OUT,
		VETO => '0',
		START => '0',
		CLK => CLK_ACQ(0),
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_SyncIn2Meter_READ_ADDRESS,
		READ_DATA => BUS_SyncIn2Meter_READ_DATA,
		READ_DATAVALID => BUS_SyncIn2Meter_VLD
	);


	U104 : MCRateMeter
	Generic map(
		CHANNEL_COUNT => 	1,
		CLK_FREQ => 	1250000000
	)
	PORT MAP(
		trigger => U93_SYNC_0,
		VETO => '0',
		START => '0',
		CLK => CLK_ACQ(0),
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_SyncIn0Meter_READ_ADDRESS,
		READ_DATA => BUS_SyncIn0Meter_READ_DATA,
		READ_DATAVALID => BUS_SyncIn0Meter_VLD
	);

U105_OUT <= NOT U100_SYNC_1;
U106_OUT <= NOT U101_SYNC_2;
U107 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U106_OUT, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U93_SYNC_0,
        ENABLE => "1",
        COUNTER => U107_counts,
        OVERFLOW => open
    );
PROCESS_REG_U108 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0)) and U106_OUT = "1" then
         U108_hold <= EXT(U107_counts,32);
    end if;
end process;
REG_sync0_between_sync2_RD <= EXT(U107_counts,32) when U106_OUT="1" else U108_hold;
SYNC_0_OUT <= U75_Reduced;

	U110 : xlx_oscilloscope_sync
	Generic map(
		channels => 	25,
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ANALOG => U111_out & U74_ANALOGOUT_23 & U74_ANALOGOUT_22 & U74_ANALOGOUT_21 & U74_ANALOGOUT_20 & U74_ANALOGOUT_19 & U74_ANALOGOUT_18 & U74_ANALOGOUT_17 & U74_ANALOGOUT_16 & U74_ANALOGOUT_15 & U74_ANALOGOUT_14 & U74_ANALOGOUT_13 & U74_ANALOGOUT_12 & U74_ANALOGOUT_11 & U74_ANALOGOUT_10 & U74_ANALOGOUT_9 & U74_ANALOGOUT_8 & U74_ANALOGOUT_7 & U74_ANALOGOUT_6 & U74_ANALOGOUT_5 & U74_ANALOGOUT_4 & U74_ANALOGOUT_3 & U74_ANALOGOUT_2 & U74_ANALOGOUT_1 & U74_ANALOGOUT_0,
		D0 => U75_Reduced & U74_TRIGOUT_23 & U74_TRIGOUT_22 & U74_TRIGOUT_21 & U74_TRIGOUT_20 & U74_TRIGOUT_19 & U74_TRIGOUT_16 & U74_TRIGOUT_17 & U74_TRIGOUT_16 & U74_TRIGOUT_15 & U74_TRIGOUT_14 & U74_TRIGOUT_13 & U74_TRIGOUT_12 & U74_TRIGOUT_11 & U74_TRIGOUT_10 & U74_TRIGOUT_9 & U74_TRIGOUT_8 & U74_TRIGOUT_7 & U74_TRIGOUT_6 & U74_TRIGOUT_5 & U74_TRIGOUT_4 & U74_TRIGOUT_3 & U74_TRIGOUT_2 & U74_TRIGOUT_1 & U74_TRIGOUT_0,
		D1 => U28_OUT & U82_TRIGOUT_23 & U82_TRIGOUT_22 & U82_TRIGOUT_21 & U82_TRIGOUT_20 & U82_TRIGOUT_15 & U82_TRIGOUT_18 & U82_TRIGOUT_17 & U82_TRIGOUT_16 & U82_TRIGOUT_15 & U82_TRIGOUT_10 & U82_TRIGOUT_13 & U82_TRIGOUT_12 & U82_TRIGOUT_11 & U82_TRIGOUT_10 & U82_TRIGOUT_9 & U82_TRIGOUT_8 & U82_TRIGOUT_7 & U82_TRIGOUT_6 & U82_TRIGOUT_5 & U82_TRIGOUT_4 & U82_TRIGOUT_3 & U82_TRIGOUT_2 & U82_TRIGOUT_1 & U82_TRIGOUT_0,
		D2 => "0" & U89_valid_23 & U89_valid_22 & U89_valid_21 & U89_valid_20 & U89_valid_19 & U89_valid_18 & U89_valid_17 & U89_valid_16 & U89_valid_15 & U89_valid_14 & U89_valid_13 & U89_valid_12 & U89_valid_11 & U89_valid_10 & U89_valid_9 & U89_valid_8 & U89_valid_7 & U89_valid_6 & U89_valid_5 & U89_valid_4 & U89_valid_3 & U89_valid_2 & U89_valid_1 & U89_valid_0,
		D3 => "0" & U89_int_gate_23 & U89_int_gate_22 & U89_int_gate_21 & U89_int_gate_20 & U89_int_gate_19 & U89_int_gate_18 & U89_int_gate_17 & U89_int_gate_16 & U89_int_gate_15 & U89_int_gate_14 & U89_int_gate_13 & U89_int_gate_12 & U89_int_gate_11 & U89_int_gate_10 & U89_int_gate_9 & U89_int_gate_8 & U89_int_gate_7 & U89_int_gate_6 & U89_int_gate_5 & U89_int_gate_4 & U89_int_gate_3 & U89_int_gate_2 & U89_int_gate_1 & U89_int_gate_0,
		TRIG => "0",
		BUSY => open,
		CE => "1",
		CLK_WRITE => CLK_ACQ,
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Oscilloscope_0_READ_ADDRESS,
		READ_DATA => BUS_Oscilloscope_0_READ_DATA,
		READ_DATAVALID => BUS_Oscilloscope_0_VLD,
		READ_STATUS => REG_Oscilloscope_0_READ_STATUS_RD,
		READ_POSITION => REG_Oscilloscope_0_READ_POSITION_RD,
		CONFIG_TRIGGER_MODE => REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR,
		CONFIG_TRIGGER_LEVEL => REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR,
		CONFIG_PRETRIGGER => REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR,
		CONFIG_DECIMATOR => REG_Oscilloscope_0_CONFIG_DECIMATOR_WR,
		CONFIG_ARM => REG_Oscilloscope_0_CONFIG_ARM_WR
	);

U111_out <= ext(U75_Reduced , 16);
REG_FIRMWARE_BUILD <= x"20240213";
FW_STRING_0 <= x"5237364669726D776172650000000000";

end Behavioral;
