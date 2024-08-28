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
	BUS_Energies_READ_ADDRESS : OUT STD_LOGIC_VECTOR(14 downto 0); 
	BUS_Energies_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Energies_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Energies_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Energies_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Energies_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Energies_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Energies_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Energies_READ_POSITION_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Energies_READ_POSITION_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Energies_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Energies_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Energies_CONFIG_TRIGGER_MODE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Energies_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Energies_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Energies_CONFIG_PRETRIGGER_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Energies_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Energies_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Energies_CONFIG_TRIGGER_LEVEL_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Energies_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Energies_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Energies_CONFIG_ARM_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Energies_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Energies_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Energies_CONFIG_DECIMATOR_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Analog_READ_ADDRESS : OUT STD_LOGIC_VECTOR(14 downto 0); 
	BUS_Analog_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Analog_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Analog_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Analog_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Analog_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_READ_POSITION_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_READ_POSITION_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_CONFIG_TRIGGER_MODE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Analog_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_CONFIG_PRETRIGGER_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Analog_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_CONFIG_TRIGGER_LEVEL_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Analog_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_CONFIG_ARM_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Analog_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_CONFIG_DECIMATOR_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_RateMeter_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_RateMeter_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_RateMeter_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
	BUS_thrsh_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_thrsh_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_thrsh_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_thrsh_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_thrsh_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH0_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH1_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH2_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH3_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH4_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH5_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH6_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH7_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH8_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH9_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH10_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH11_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH12_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH13_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH14_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH15_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH16_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH17_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH18_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH19_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH20_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH21_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH22_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_thrsh_CH23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_thrsh_CH23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_thrsh_CH23_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_diag_READ_ADDRESS : OUT STD_LOGIC_VECTOR(11 downto 0); 
	BUS_diag_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_diag_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_diag_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_diag_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_diag_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_diag_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_diag_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_diag_READ_POSITION_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_diag_READ_POSITION_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_diag_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_diag_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_diag_CONFIG_TRIGGER_MODE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_diag_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_diag_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_diag_CONFIG_PRETRIGGER_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_diag_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_diag_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_diag_CONFIG_TRIGGER_LEVEL_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_diag_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_diag_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_diag_CONFIG_ARM_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_diag_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_diag_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_diag_CONFIG_DECIMATOR_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_top_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_top_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_top_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_top_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_top_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH0_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH1_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH2_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH3_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH4_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH5_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH6_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH7_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH8_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH9_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH10_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH11_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH12_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH13_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH14_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH15_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH16_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH17_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH18_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH19_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH20_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH21_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH22_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_top_CH23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_top_CH23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_top_CH23_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_disable_det_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_disable_det_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_disable_det_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_disable_det_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_disable_det_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH0_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH1_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH2_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH3_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH4_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH5_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH6_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH7_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH8_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH9_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH10_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH11_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH12_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH13_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH14_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH15_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH16_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH17_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH18_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH19_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH20_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH21_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH22_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_disable_det_CH23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_disable_det_CH23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_disable_det_CH23_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Analog_In_Unflipped_READ_ADDRESS : OUT STD_LOGIC_VECTOR(14 downto 0); 
	BUS_Analog_In_Unflipped_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Analog_In_Unflipped_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_Analog_In_Unflipped_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Analog_In_Unflipped_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_Analog_In_Unflipped_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_In_Unflipped_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_In_Unflipped_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_In_Unflipped_READ_POSITION_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_In_Unflipped_READ_POSITION_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Analog_In_Unflipped_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_In_Unflipped_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_In_Unflipped_CONFIG_ARM_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_Analog_In_Unflipped_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_Analog_In_Unflipped_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_Analog_In_Unflipped_CONFIG_DECIMATOR_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_dummy_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_dummy_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_dummy_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_dummy_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_forcetrig_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_forcetrig_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_forcetrig_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_forcetrig_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_full_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_full_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_full_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_full_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_trigger_code_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_trigger_code_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_trigger_code_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_trigger_code_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_reset_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_reset_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_reset_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_reset_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_timestamp_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_timestamp_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_timestamp_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_timestamp_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_received_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_received_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_received_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		INT_received_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_base_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_base_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_base_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_base_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_base_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH0_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH0_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH0_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH1_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH1_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH1_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH2_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH2_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH2_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH3_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH3_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH3_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH4_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH4_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH4_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH5_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH5_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH5_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH6_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH6_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH6_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH7_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH7_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH7_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH8_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH8_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH8_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH9_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH9_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH9_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH10_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH10_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH10_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH11_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH11_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH11_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH12_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH12_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH12_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH13_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH13_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH13_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH14_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH14_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH14_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH15_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH15_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH15_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH16_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH16_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH16_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH17_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH17_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH17_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH18_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH18_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH18_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH19_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH19_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH19_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH20_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH20_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH20_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH21_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH21_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH21_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH22_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH22_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH22_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_base_CH23_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_base_CH23_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_base_CH23_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_baselines_READ_ADDRESS : OUT STD_LOGIC_VECTOR(14 downto 0); 
	BUS_baselines_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_baselines_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_baselines_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_baselines_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_baselines_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_baselines_READ_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_baselines_READ_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_baselines_READ_POSITION_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_baselines_READ_POSITION_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_baselines_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_baselines_CONFIG_TRIGGER_MODE_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_baselines_CONFIG_TRIGGER_MODE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_baselines_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_baselines_CONFIG_PRETRIGGER_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_baselines_CONFIG_PRETRIGGER_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_baselines_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_baselines_CONFIG_TRIGGER_LEVEL_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_baselines_CONFIG_TRIGGER_LEVEL_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_baselines_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_baselines_CONFIG_ARM_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_baselines_CONFIG_ARM_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_baselines_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_baselines_CONFIG_DECIMATOR_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_baselines_CONFIG_DECIMATOR_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_int_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_int_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_int_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_int_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_int_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_int_time_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_int_time_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_int_time_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_int_pre_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_int_pre_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_int_pre_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_int_base_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_int_base_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_int_base_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_int_scale_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_int_scale_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_int_scale_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
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
	BUS_trig_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_trig_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_trig_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_trig_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_trig_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_trig_gate_l_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_trig_gate_l_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_trig_gate_l_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_trig_gate_u_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_trig_gate_u_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_trig_gate_u_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_trig_delay_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_trig_delay_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_trig_delay_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_trig_mode_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_trig_mode_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_trig_mode_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_io_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_io_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_io_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_io_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_io_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_io_stamptype_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_io_stamptype_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_io_stamptype_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_io_lemo2out_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_io_lemo2out_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_io_lemo2out_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_io_divide_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_io_divide_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_io_divide_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
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
	
signal U0_A0 : std_logic_vector(15 downto 0);
signal U1_A1 : std_logic_vector(15 downto 0);
signal U2_A2 : std_logic_vector(15 downto 0);
signal U3_A3 : std_logic_vector(15 downto 0);
signal U4_A4 : std_logic_vector(15 downto 0);
signal U5_A5 : std_logic_vector(15 downto 0);
signal U6_A6 : std_logic_vector(15 downto 0);
signal U7_A7 : std_logic_vector(15 downto 0);
signal U8_A8 : std_logic_vector(15 downto 0);
signal U9_A9 : std_logic_vector(15 downto 0);
signal U10_A10 : std_logic_vector(15 downto 0);
signal U11_A11 : std_logic_vector(15 downto 0);
signal U12_A12 : std_logic_vector(15 downto 0);
signal U13_A13 : std_logic_vector(15 downto 0);
signal U14_A14 : std_logic_vector(15 downto 0);
signal U15_A15 : std_logic_vector(15 downto 0);
signal U16_A16 : std_logic_vector(15 downto 0);
signal U17_A17 : std_logic_vector(15 downto 0);
signal U18_A18 : std_logic_vector(15 downto 0);
signal U19_A19 : std_logic_vector(15 downto 0);
signal U20_A20 : std_logic_vector(15 downto 0);
signal U21_A21 : std_logic_vector(15 downto 0);
signal U22_A22 : std_logic_vector(15 downto 0);
signal U23_A23 : std_logic_vector(15 downto 0);
	signal U24_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U25_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal U26_out_0 : std_logic_vector(0 downto 0);
signal U26_int : std_logic_vector(0 downto 0);
signal U27_out_0 : std_logic_vector(23 downto 0) := (others => '0');
	signal U28_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal U29_hold : std_logic_vector(31 downto 0);
	signal U30_TIMESTAMP : STD_LOGIC_VECTOR(31 DOWNTO 0);

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

signal U31_out : std_logic_vector(31 downto 0) := (others => '0');
signal U32_hold : std_logic_vector(31 downto 0);
	signal U34_clk : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
signal U35_out : std_logic_vector(15 downto 0) := (others => '0');
signal U36_out : std_logic_vector(15 downto 0);
signal U37_out : std_logic_vector(15 downto 0) := (others => '0');
signal U38_hold : std_logic_vector(31 downto 0);
signal U39_hold : std_logic_vector(31 downto 0);
signal U40_out : std_logic_vector(31 downto 0);
signal U41_CONST : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal U42_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);

	COMPONENT SW_GATE_AND_DELAY
		GENERIC( 
			maxDelay : INTEGER := 128
		);
		PORT( 
			PORT_IN : in STD_LOGIC_VECTOR(0 downto 0);
			GATE : in INTEGER;
			DELAY : in INTEGER;
			PORT_OUT : out STD_LOGIC_VECTOR(0 downto 0);
			CLK : in STD_LOGIC_VECTOR(0 downto 0);
			RESET : in STD_LOGIC_VECTOR(0 downto 0)
		);
	END COMPONENT;

	signal U43_int : integer  := 0;
signal U44_out : std_logic_vector(0 downto 0);
signal U45_CONST : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
signal U46_out : std_logic_vector(0 downto 0);
	signal U47_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal BUS_RateMeter_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_RateMeter_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);

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

	signal BUS_Analog_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Analog_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Analog_READ_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal REG_Analog_READ_POSITION_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);

	COMPONENT xlx_oscilloscope_sync
		GENERIC( 
			channels : INTEGER := 24;
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

	signal BUS_Energies_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Energies_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Energies_READ_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal REG_Energies_READ_POSITION_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal U51_out : std_logic_vector(15 downto 0) := (others => '0');
signal U52_CH0 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH1 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH2 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH3 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH4 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH5 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH6 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH7 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH8 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH9 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH10 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH11 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH12 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH13 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH14 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH15 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH16 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH17 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH18 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH19 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH20 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH21 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH22 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U52_CH23 : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U53_CH0 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH1 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH2 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH3 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH4 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH5 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH6 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH7 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH8 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH9 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH10 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH11 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH12 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH13 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH14 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH15 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH16 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH17 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH18 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH19 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH20 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH21 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH22 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U53_CH23 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH0 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH1 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH2 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH3 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH4 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH5 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH6 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH7 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH8 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH9 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH10 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH11 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH12 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH13 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH14 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH15 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH16 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH17 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH18 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH19 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH20 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH21 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH22 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U54_CH23 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
	signal U55_OUT : STD_LOGIC_VECTOR(15 DOWNTO 0);

	COMPONENT d_latch
		GENERIC( 
			IN_SIZE : INTEGER := 16;
			EDGE : STRING := "rising"
		);
		PORT( 
			a : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
			CE : in STD_LOGIC;
			clk : in STD_LOGIC;
			reset : in STD_LOGIC;
			reset_val : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
			b : out STD_LOGIC_VECTOR(IN_SIZE-1 downto 0)
		);
	END COMPONENT;

	signal U56_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal U57_out : std_logic_vector(15 downto 0) := (others => '0');
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
signal U58_counts : std_logic_vector(31 downto 0) := (others => '0');
	signal BUS_Analog_In_Unflipped_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_Analog_In_Unflipped_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_Analog_In_Unflipped_READ_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal REG_Analog_In_Unflipped_READ_POSITION_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal U60_Tx_Done : STD_LOGIC_VECTOR(0 downto 0) := "0";
	signal U60_FMData_Out : STD_LOGIC_VECTOR(0 DOWNTO 0);

	COMPONENT U60_UserHDL_Serial_Tx
		PORT( 
			clock : in STD_LOGIC;
			reset : in STD_LOGIC;
			Tx_En : in STD_LOGIC;
			pdata_in : in STD_LOGIC_VECTOR(15 downto 0);
			Tx_Done : out STD_LOGIC;
			FMData_Out : out STD_LOGIC_VECTOR(0 downto 0)
		);
	END COMPONENT;

	signal U62_pdata_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal U62_Rx_Done : STD_LOGIC_VECTOR(0 downto 0) := "0";

	COMPONENT U62_UserHDL_Serial_Rx
		PORT( 
			sysclk : in STD_LOGIC;
			rxclock : in STD_LOGIC;
			reset : in STD_LOGIC;
			FMData_in : in STD_LOGIC;
			Clr_Err : in STD_LOGIC;
			pdata_out : out STD_LOGIC_VECTOR(15 downto 0);
			Rx_Done : out STD_LOGIC;
			Parity_Err : out STD_LOGIC_VECTOR(0 downto 0)
		);
	END COMPONENT;

signal U63_CONST : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

COMPONENT SCALER
PORT(
    RESET: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    CE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    PORT_IN: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    PORT_SCALE: IN INTEGER; 
    PORT_OUT: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)); 
END COMPONENT;
signal U64_out : std_logic_vector(0 downto 0) := (others => '0');
	signal BUS_diag_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_diag_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_diag_READ_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal REG_diag_READ_POSITION_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal U68_CH0 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH1 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH2 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH3 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH4 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH5 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH6 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH7 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH8 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH9 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH10 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH11 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH12 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH13 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH14 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH15 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH16 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH17 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH18 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH19 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH20 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH21 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH22 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U68_CH23 : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
	signal BUS_baselines_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_baselines_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_baselines_READ_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal REG_baselines_READ_POSITION_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal U70_out : std_logic_vector(15 downto 0) := (others => '0');
signal U71_out : std_logic_vector(15 downto 0) := (others => '0');
	signal U72_OUT : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal U73_time : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U73_pre : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U73_base : STD_LOGIC_VECTOR( 7 downto 0 ) := (others => '0');
signal U73_scale : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
	signal U74_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U75_max_out_0 : std_logic_vector(15 downto 0);
	signal U75_ready_0 : std_logic_vector(0 downto 0);
	signal U75_max_out_1 : std_logic_vector(15 downto 0);
	signal U75_ready_1 : std_logic_vector(0 downto 0);
	signal U75_max_out_2 : std_logic_vector(15 downto 0);
	signal U75_ready_2 : std_logic_vector(0 downto 0);
	signal U75_max_out_3 : std_logic_vector(15 downto 0);
	signal U75_ready_3 : std_logic_vector(0 downto 0);
	signal U75_max_out_4 : std_logic_vector(15 downto 0);
	signal U75_ready_4 : std_logic_vector(0 downto 0);
	signal U75_max_out_5 : std_logic_vector(15 downto 0);
	signal U75_ready_5 : std_logic_vector(0 downto 0);
	signal U75_max_out_6 : std_logic_vector(15 downto 0);
	signal U75_ready_6 : std_logic_vector(0 downto 0);
	signal U75_max_out_7 : std_logic_vector(15 downto 0);
	signal U75_ready_7 : std_logic_vector(0 downto 0);
	signal U75_max_out_8 : std_logic_vector(15 downto 0);
	signal U75_ready_8 : std_logic_vector(0 downto 0);
	signal U75_max_out_9 : std_logic_vector(15 downto 0);
	signal U75_ready_9 : std_logic_vector(0 downto 0);
	signal U75_max_out_10 : std_logic_vector(15 downto 0);
	signal U75_ready_10 : std_logic_vector(0 downto 0);
	signal U75_max_out_11 : std_logic_vector(15 downto 0);
	signal U75_ready_11 : std_logic_vector(0 downto 0);
	signal U75_max_out_12 : std_logic_vector(15 downto 0);
	signal U75_ready_12 : std_logic_vector(0 downto 0);
	signal U75_max_out_13 : std_logic_vector(15 downto 0);
	signal U75_ready_13 : std_logic_vector(0 downto 0);
	signal U75_max_out_14 : std_logic_vector(15 downto 0);
	signal U75_ready_14 : std_logic_vector(0 downto 0);
	signal U75_max_out_15 : std_logic_vector(15 downto 0);
	signal U75_ready_15 : std_logic_vector(0 downto 0);
	signal U75_max_out_16 : std_logic_vector(15 downto 0);
	signal U75_ready_16 : std_logic_vector(0 downto 0);
	signal U75_max_out_17 : std_logic_vector(15 downto 0);
	signal U75_ready_17 : std_logic_vector(0 downto 0);
	signal U75_max_out_18 : std_logic_vector(15 downto 0);
	signal U75_ready_18 : std_logic_vector(0 downto 0);
	signal U75_max_out_19 : std_logic_vector(15 downto 0);
	signal U75_ready_19 : std_logic_vector(0 downto 0);
	signal U75_max_out_20 : std_logic_vector(15 downto 0);
	signal U75_ready_20 : std_logic_vector(0 downto 0);
	signal U75_max_out_21 : std_logic_vector(15 downto 0);
	signal U75_ready_21 : std_logic_vector(0 downto 0);
	signal U75_max_out_22 : std_logic_vector(15 downto 0);
	signal U75_ready_22 : std_logic_vector(0 downto 0);
	signal U75_max_out_23 : std_logic_vector(15 downto 0);
	signal U75_ready_23 : std_logic_vector(0 downto 0);

COMPONENT SUBPAGE_PulseHeightFinder
PORT(
	analog_in : IN std_logic_vector(15 downto 0);
	max_out : OUT std_logic_vector(15 downto 0);
	ready : OUT std_logic_vector(0 downto 0);
	window : IN std_logic_vector(15 downto 0);
	trig : IN std_logic_vector(0 downto 0);
	pre_int : IN std_logic_vector(15 downto 0);
	trig_delay : IN std_logic_vector(15 downto 0);
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
	signal U76_energy_0 : std_logic_vector(15 downto 0);
	signal U76_valid_0 : std_logic_vector(0 downto 0);
	signal U76_int_gate_0 : std_logic_vector(0 downto 0);
	signal U76_baseline_0 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_0 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_0 : std_logic_vector(0 downto 0);
	signal U76_energy_1 : std_logic_vector(15 downto 0);
	signal U76_valid_1 : std_logic_vector(0 downto 0);
	signal U76_int_gate_1 : std_logic_vector(0 downto 0);
	signal U76_baseline_1 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_1 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_1 : std_logic_vector(0 downto 0);
	signal U76_energy_2 : std_logic_vector(15 downto 0);
	signal U76_valid_2 : std_logic_vector(0 downto 0);
	signal U76_int_gate_2 : std_logic_vector(0 downto 0);
	signal U76_baseline_2 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_2 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_2 : std_logic_vector(0 downto 0);
	signal U76_energy_3 : std_logic_vector(15 downto 0);
	signal U76_valid_3 : std_logic_vector(0 downto 0);
	signal U76_int_gate_3 : std_logic_vector(0 downto 0);
	signal U76_baseline_3 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_3 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_3 : std_logic_vector(0 downto 0);
	signal U76_energy_4 : std_logic_vector(15 downto 0);
	signal U76_valid_4 : std_logic_vector(0 downto 0);
	signal U76_int_gate_4 : std_logic_vector(0 downto 0);
	signal U76_baseline_4 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_4 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_4 : std_logic_vector(0 downto 0);
	signal U76_energy_5 : std_logic_vector(15 downto 0);
	signal U76_valid_5 : std_logic_vector(0 downto 0);
	signal U76_int_gate_5 : std_logic_vector(0 downto 0);
	signal U76_baseline_5 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_5 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_5 : std_logic_vector(0 downto 0);
	signal U76_energy_6 : std_logic_vector(15 downto 0);
	signal U76_valid_6 : std_logic_vector(0 downto 0);
	signal U76_int_gate_6 : std_logic_vector(0 downto 0);
	signal U76_baseline_6 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_6 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_6 : std_logic_vector(0 downto 0);
	signal U76_energy_7 : std_logic_vector(15 downto 0);
	signal U76_valid_7 : std_logic_vector(0 downto 0);
	signal U76_int_gate_7 : std_logic_vector(0 downto 0);
	signal U76_baseline_7 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_7 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_7 : std_logic_vector(0 downto 0);
	signal U76_energy_8 : std_logic_vector(15 downto 0);
	signal U76_valid_8 : std_logic_vector(0 downto 0);
	signal U76_int_gate_8 : std_logic_vector(0 downto 0);
	signal U76_baseline_8 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_8 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_8 : std_logic_vector(0 downto 0);
	signal U76_energy_9 : std_logic_vector(15 downto 0);
	signal U76_valid_9 : std_logic_vector(0 downto 0);
	signal U76_int_gate_9 : std_logic_vector(0 downto 0);
	signal U76_baseline_9 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_9 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_9 : std_logic_vector(0 downto 0);
	signal U76_energy_10 : std_logic_vector(15 downto 0);
	signal U76_valid_10 : std_logic_vector(0 downto 0);
	signal U76_int_gate_10 : std_logic_vector(0 downto 0);
	signal U76_baseline_10 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_10 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_10 : std_logic_vector(0 downto 0);
	signal U76_energy_11 : std_logic_vector(15 downto 0);
	signal U76_valid_11 : std_logic_vector(0 downto 0);
	signal U76_int_gate_11 : std_logic_vector(0 downto 0);
	signal U76_baseline_11 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_11 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_11 : std_logic_vector(0 downto 0);
	signal U76_energy_12 : std_logic_vector(15 downto 0);
	signal U76_valid_12 : std_logic_vector(0 downto 0);
	signal U76_int_gate_12 : std_logic_vector(0 downto 0);
	signal U76_baseline_12 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_12 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_12 : std_logic_vector(0 downto 0);
	signal U76_energy_13 : std_logic_vector(15 downto 0);
	signal U76_valid_13 : std_logic_vector(0 downto 0);
	signal U76_int_gate_13 : std_logic_vector(0 downto 0);
	signal U76_baseline_13 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_13 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_13 : std_logic_vector(0 downto 0);
	signal U76_energy_14 : std_logic_vector(15 downto 0);
	signal U76_valid_14 : std_logic_vector(0 downto 0);
	signal U76_int_gate_14 : std_logic_vector(0 downto 0);
	signal U76_baseline_14 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_14 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_14 : std_logic_vector(0 downto 0);
	signal U76_energy_15 : std_logic_vector(15 downto 0);
	signal U76_valid_15 : std_logic_vector(0 downto 0);
	signal U76_int_gate_15 : std_logic_vector(0 downto 0);
	signal U76_baseline_15 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_15 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_15 : std_logic_vector(0 downto 0);
	signal U76_energy_16 : std_logic_vector(15 downto 0);
	signal U76_valid_16 : std_logic_vector(0 downto 0);
	signal U76_int_gate_16 : std_logic_vector(0 downto 0);
	signal U76_baseline_16 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_16 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_16 : std_logic_vector(0 downto 0);
	signal U76_energy_17 : std_logic_vector(15 downto 0);
	signal U76_valid_17 : std_logic_vector(0 downto 0);
	signal U76_int_gate_17 : std_logic_vector(0 downto 0);
	signal U76_baseline_17 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_17 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_17 : std_logic_vector(0 downto 0);
	signal U76_energy_18 : std_logic_vector(15 downto 0);
	signal U76_valid_18 : std_logic_vector(0 downto 0);
	signal U76_int_gate_18 : std_logic_vector(0 downto 0);
	signal U76_baseline_18 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_18 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_18 : std_logic_vector(0 downto 0);
	signal U76_energy_19 : std_logic_vector(15 downto 0);
	signal U76_valid_19 : std_logic_vector(0 downto 0);
	signal U76_int_gate_19 : std_logic_vector(0 downto 0);
	signal U76_baseline_19 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_19 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_19 : std_logic_vector(0 downto 0);
	signal U76_energy_20 : std_logic_vector(15 downto 0);
	signal U76_valid_20 : std_logic_vector(0 downto 0);
	signal U76_int_gate_20 : std_logic_vector(0 downto 0);
	signal U76_baseline_20 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_20 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_20 : std_logic_vector(0 downto 0);
	signal U76_energy_21 : std_logic_vector(15 downto 0);
	signal U76_valid_21 : std_logic_vector(0 downto 0);
	signal U76_int_gate_21 : std_logic_vector(0 downto 0);
	signal U76_baseline_21 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_21 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_21 : std_logic_vector(0 downto 0);
	signal U76_energy_22 : std_logic_vector(15 downto 0);
	signal U76_valid_22 : std_logic_vector(0 downto 0);
	signal U76_int_gate_22 : std_logic_vector(0 downto 0);
	signal U76_baseline_22 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_22 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_22 : std_logic_vector(0 downto 0);
	signal U76_energy_23 : std_logic_vector(15 downto 0);
	signal U76_valid_23 : std_logic_vector(0 downto 0);
	signal U76_int_gate_23 : std_logic_vector(0 downto 0);
	signal U76_baseline_23 : std_logic_vector(15 downto 0);
	signal U76_baseline_valid_23 : std_logic_vector(0 downto 0);
	signal U76_baseline_calculating_23 : std_logic_vector(0 downto 0);

COMPONENT SUBPAGE_ChargeIntegrator
PORT(
	analog_in : IN std_logic_vector(15 downto 0);
	base : IN std_logic_vector(15 downto 0);
	energy : OUT std_logic_vector(15 downto 0);
	valid : OUT std_logic_vector(0 downto 0);
	int_gate : OUT std_logic_vector(0 downto 0);
	baseline : OUT std_logic_vector(15 downto 0);
	baseline_valid : OUT std_logic_vector(0 downto 0);
	baseline_calculating : OUT std_logic_vector(0 downto 0);
	scale : IN std_logic_vector(15 downto 0);
	pre_int : IN std_logic_vector(15 downto 0);
	trig : IN std_logic_vector(0 downto 0);
	manual_base : IN std_logic_vector(7 downto 0);
	int_time : IN std_logic_vector(15 downto 0);
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
	signal U77_TRIGOUT_0 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_1 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_2 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_3 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_4 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_5 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_6 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_7 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_8 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_9 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_10 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_11 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_12 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_13 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_14 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_15 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_16 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_17 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_18 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_19 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_20 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_21 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_22 : std_logic_vector(0 downto 0);
	signal U77_TRIGOUT_23 : std_logic_vector(0 downto 0);

COMPONENT SUBPAGE_UpperTrigger
PORT(
	AIN : IN std_logic_vector(15 downto 0);
	top : IN std_logic_vector(15 downto 0);
	TRIGOUT : OUT std_logic_vector(0 downto 0);
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
	signal U78_ANALOGOUT_0 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_0 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_0 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_1 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_1 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_1 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_2 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_2 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_2 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_3 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_3 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_3 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_4 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_4 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_4 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_5 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_5 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_5 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_6 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_6 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_6 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_7 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_7 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_7 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_8 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_8 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_8 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_9 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_9 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_9 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_10 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_10 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_10 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_11 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_11 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_11 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_12 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_12 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_12 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_13 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_13 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_13 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_14 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_14 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_14 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_15 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_15 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_15 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_16 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_16 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_16 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_17 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_17 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_17 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_18 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_18 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_18 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_19 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_19 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_19 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_20 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_20 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_20 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_21 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_21 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_21 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_22 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_22 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_22 : std_logic_vector(0 downto 0);
	signal U78_ANALOGOUT_23 : std_logic_vector(15 downto 0);
	signal U78_TRIGOUT_23 : std_logic_vector(0 downto 0);
	signal U78_trig_nodelay_23 : std_logic_vector(0 downto 0);

COMPONENT SUBPAGE_Trigger
PORT(
	AIN : IN std_logic_vector(15 downto 0);
	auto_baseline : IN std_logic_vector(15 downto 0);
	thrsh : IN std_logic_vector(15 downto 0);
	disable_det : IN std_logic_vector(0 downto 0);
	ANALOGOUT : OUT std_logic_vector(15 downto 0);
	TRIGOUT : OUT std_logic_vector(0 downto 0);
	trig_nodelay : OUT std_logic_vector(0 downto 0);
	inhib : IN std_logic_vector(15 downto 0);
	baseline : IN std_logic_vector(7 downto 0);
	gate : IN std_logic_vector(15 downto 0);
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
	signal U79_saturated_0 : std_logic_vector(0 downto 0);
	signal U79_saturated_1 : std_logic_vector(0 downto 0);
	signal U79_saturated_2 : std_logic_vector(0 downto 0);
	signal U79_saturated_3 : std_logic_vector(0 downto 0);
	signal U79_saturated_4 : std_logic_vector(0 downto 0);
	signal U79_saturated_5 : std_logic_vector(0 downto 0);
	signal U79_saturated_6 : std_logic_vector(0 downto 0);
	signal U79_saturated_7 : std_logic_vector(0 downto 0);
	signal U79_saturated_8 : std_logic_vector(0 downto 0);
	signal U79_saturated_9 : std_logic_vector(0 downto 0);
	signal U79_saturated_10 : std_logic_vector(0 downto 0);
	signal U79_saturated_11 : std_logic_vector(0 downto 0);
	signal U79_saturated_12 : std_logic_vector(0 downto 0);
	signal U79_saturated_13 : std_logic_vector(0 downto 0);
	signal U79_saturated_14 : std_logic_vector(0 downto 0);
	signal U79_saturated_15 : std_logic_vector(0 downto 0);
	signal U79_saturated_16 : std_logic_vector(0 downto 0);
	signal U79_saturated_17 : std_logic_vector(0 downto 0);
	signal U79_saturated_18 : std_logic_vector(0 downto 0);
	signal U79_saturated_19 : std_logic_vector(0 downto 0);
	signal U79_saturated_20 : std_logic_vector(0 downto 0);
	signal U79_saturated_21 : std_logic_vector(0 downto 0);
	signal U79_saturated_22 : std_logic_vector(0 downto 0);
	signal U79_saturated_23 : std_logic_vector(0 downto 0);

COMPONENT SUBPAGE_SaturationDetector
PORT(
	analog_in : IN std_logic_vector(15 downto 0);
	saturated : OUT std_logic_vector(0 downto 0);
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
	signal U80_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal U81_out : std_logic_vector(15 downto 0);
signal U82_CONST : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal U83_CONST : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	signal U84_BUSY : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U84_FIFO_FULL : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal BUS_All_Energies_READ_DATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal BUS_All_Energies_VLD : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal REG_All_Energies_READ_STATUS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);
	signal REG_All_Energies_READ_VALID_WORDS_RD : STD_LOGIC_VECTOR(31 DOWNTO 0);

	COMPONENT U84_custompacket
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
			IN_34 : in STD_LOGIC_VECTOR(31 downto 0);
			IN_35 : in STD_LOGIC_VECTOR(31 downto 0);
			IN_1 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_38 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_40 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_42 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_44 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_46 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_48 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_50 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_52 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_54 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_56 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_58 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_60 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_62 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_64 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_36 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_37 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_39 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_41 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_43 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_45 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_47 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_49 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_51 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_53 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_55 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_57 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_59 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_61 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_63 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_65 : in STD_LOGIC_VECTOR(15 downto 0);
			IN_66 : in STD_LOGIC_VECTOR(15 downto 0);
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

signal U85_gate_l : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_gate_u : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_delay : STD_LOGIC_VECTOR( 15 downto 0 ) := (others => '0');
signal U85_mode : STD_LOGIC_VECTOR( 0 downto 0 ) := (others => '0');
signal U86_out_0 : std_logic_vector(15 downto 0);
signal U86_int : std_logic_vector(0 downto 0);
signal U87_stamptype : STD_LOGIC_VECTOR( 1 downto 0 ) := (others => '0');
signal U87_lemo2out : STD_LOGIC_VECTOR( 1 downto 0 ) := (others => '0');
signal U87_divide : INTEGER := 0;
	signal BUS_Energies_READ_ADDRESS : STD_LOGIC_VECTOR(14 downto 0);
	signal BUS_Energies_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Energies_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Energies_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Energies_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Energies_READ_POSITION_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Energies_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Energies_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Energies_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Energies_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Energies_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Energies_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Energies_CONFIG_ARM_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Energies_CONFIG_ARM_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Energies_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Energies_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Analog_READ_ADDRESS : STD_LOGIC_VECTOR(14 downto 0);
	signal BUS_Analog_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Analog_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Analog_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Analog_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Analog_READ_POSITION_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Analog_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Analog_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Analog_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Analog_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Analog_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Analog_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Analog_CONFIG_ARM_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Analog_CONFIG_ARM_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Analog_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Analog_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_READ_ADDRESS : STD_LOGIC_VECTOR(15 downto 0);
	signal BUS_RateMeter_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_RateMeter_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_RateMeter_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_thrsh_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_thrsh_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_thrsh_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_thrsh_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_thrsh_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_thrsh_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_thrsh_CH0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_thrsh_CH23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_thrsh_CH23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_diag_READ_ADDRESS : STD_LOGIC_VECTOR(11 downto 0);
	signal BUS_diag_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_diag_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_diag_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_diag_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_diag_READ_POSITION_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_diag_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_diag_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_diag_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_diag_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_diag_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_diag_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_diag_CONFIG_ARM_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_diag_CONFIG_ARM_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_diag_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_diag_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_top_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_top_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_top_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_top_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_top_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_top_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_top_CH0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_top_CH23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_top_CH23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_disable_det_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_disable_det_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_disable_det_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_disable_det_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_disable_det_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_disable_det_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_disable_det_CH0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_disable_det_CH23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_disable_det_CH23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Analog_In_Unflipped_READ_ADDRESS : STD_LOGIC_VECTOR(14 downto 0);
	signal BUS_Analog_In_Unflipped_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_Analog_In_Unflipped_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_Analog_In_Unflipped_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Analog_In_Unflipped_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_Analog_In_Unflipped_READ_POSITION_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Analog_In_Unflipped_CONFIG_ARM_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Analog_In_Unflipped_CONFIG_ARM_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_Analog_In_Unflipped_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_Analog_In_Unflipped_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_base_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_base_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_base_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_base_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_base_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_base_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_base_CH0_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH0_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH1_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH1_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH2_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH2_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH3_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH3_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH4_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH4_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH5_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH5_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH6_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH6_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH7_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH7_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH8_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH8_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH9_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH9_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH10_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH10_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH11_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH11_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH12_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH12_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH13_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH13_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH14_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH14_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH15_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH15_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH16_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH16_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH17_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH17_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH18_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH18_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH19_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH19_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH20_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH20_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH21_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH21_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH22_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH22_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_base_CH23_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_base_CH23_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_baselines_READ_ADDRESS : STD_LOGIC_VECTOR(14 downto 0);
	signal BUS_baselines_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_baselines_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_baselines_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_baselines_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_baselines_READ_POSITION_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_baselines_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_baselines_CONFIG_TRIGGER_MODE_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_baselines_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_baselines_CONFIG_PRETRIGGER_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_baselines_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_baselines_CONFIG_TRIGGER_LEVEL_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_baselines_CONFIG_ARM_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_baselines_CONFIG_ARM_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_baselines_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_baselines_CONFIG_DECIMATOR_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_int_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_int_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_int_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_int_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_int_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_int_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_int_time_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_int_time_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_int_pre_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_int_pre_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_int_base_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_int_base_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_int_scale_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_int_scale_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_All_Energies_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_All_Energies_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_All_Energies_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_All_Energies_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_All_Energies_READ_STATUS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal INT_All_Energies_READ_VALID_WORDS_RD : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_All_Energies_CONFIG_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_All_Energies_CONFIG_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_trig_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_trig_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_trig_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_trig_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_trig_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_trig_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_trig_gate_l_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_trig_gate_l_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_trig_gate_u_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_trig_gate_u_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_trig_delay_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_trig_delay_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_trig_mode_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_trig_mode_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_io_READ_ADDRESS : STD_LOGIC_VECTOR(-1 downto 0);
	signal BUS_io_READ_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_io_WRITE_DATA : STD_LOGIC_VECTOR(31 downto 0);
	signal BUS_io_W_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_io_R_INT : STD_LOGIC_VECTOR(0 downto 0);
	signal BUS_io_VLD : STD_LOGIC_VECTOR(0 downto 0) := "1";
	signal REG_io_stamptype_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_io_stamptype_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_io_lemo2out_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_io_lemo2out_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_io_divide_WR : STD_LOGIC_VECTOR(31 downto 0);
	signal INT_io_divide_WR : STD_LOGIC_VECTOR(0 downto 0);
	signal REG_dummy_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_dummy_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_dummy_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_dummy_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_forcetrig_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_forcetrig_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_forcetrig_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_forcetrig_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_full_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_full_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_full_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_full_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_trigger_code_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_trigger_code_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_trigger_code_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_trigger_code_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_reset_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_reset_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_reset_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_reset_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_timestamp_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_timestamp_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_timestamp_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_timestamp_RD : STD_LOGIC_VECTOR(0 downto 0); 
	signal REG_received_RD : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal REG_received_WR : STD_LOGIC_VECTOR(31 downto 0) := x"00000000"; 
	signal INT_received_WR : STD_LOGIC_VECTOR(0 downto 0); 
	signal INT_received_RD : STD_LOGIC_VECTOR(0 downto 0); 
	
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
	BUS_Energies_READ_ADDRESS => BUS_Energies_READ_ADDRESS,
	BUS_Energies_READ_DATA => BUS_Energies_READ_DATA,
	BUS_Energies_WRITE_DATA => BUS_Energies_WRITE_DATA,
	BUS_Energies_W_INT => BUS_Energies_W_INT,
	BUS_Energies_R_INT => BUS_Energies_R_INT,
	BUS_Energies_VLD => BUS_Energies_VLD,
		REG_Energies_READ_STATUS_RD => REG_Energies_READ_STATUS_RD,
		INT_Energies_READ_STATUS_RD => INT_Energies_READ_STATUS_RD,
		REG_Energies_READ_POSITION_RD => REG_Energies_READ_POSITION_RD,
		INT_Energies_READ_POSITION_RD => INT_Energies_READ_POSITION_RD,
		REG_Energies_CONFIG_TRIGGER_MODE_WR => REG_Energies_CONFIG_TRIGGER_MODE_WR,
		INT_Energies_CONFIG_TRIGGER_MODE_WR => INT_Energies_CONFIG_TRIGGER_MODE_WR,
		REG_Energies_CONFIG_TRIGGER_MODE_RD => REG_Energies_CONFIG_TRIGGER_MODE_WR,
		REG_Energies_CONFIG_PRETRIGGER_WR => REG_Energies_CONFIG_PRETRIGGER_WR,
		INT_Energies_CONFIG_PRETRIGGER_WR => INT_Energies_CONFIG_PRETRIGGER_WR,
		REG_Energies_CONFIG_PRETRIGGER_RD => REG_Energies_CONFIG_PRETRIGGER_WR,
		REG_Energies_CONFIG_TRIGGER_LEVEL_WR => REG_Energies_CONFIG_TRIGGER_LEVEL_WR,
		INT_Energies_CONFIG_TRIGGER_LEVEL_WR => INT_Energies_CONFIG_TRIGGER_LEVEL_WR,
		REG_Energies_CONFIG_TRIGGER_LEVEL_RD => REG_Energies_CONFIG_TRIGGER_LEVEL_WR,
		REG_Energies_CONFIG_ARM_WR => REG_Energies_CONFIG_ARM_WR,
		INT_Energies_CONFIG_ARM_WR => INT_Energies_CONFIG_ARM_WR,
		REG_Energies_CONFIG_ARM_RD => REG_Energies_CONFIG_ARM_WR,
		REG_Energies_CONFIG_DECIMATOR_WR => REG_Energies_CONFIG_DECIMATOR_WR,
		INT_Energies_CONFIG_DECIMATOR_WR => INT_Energies_CONFIG_DECIMATOR_WR,
		REG_Energies_CONFIG_DECIMATOR_RD => REG_Energies_CONFIG_DECIMATOR_WR,
	BUS_Analog_READ_ADDRESS => BUS_Analog_READ_ADDRESS,
	BUS_Analog_READ_DATA => BUS_Analog_READ_DATA,
	BUS_Analog_WRITE_DATA => BUS_Analog_WRITE_DATA,
	BUS_Analog_W_INT => BUS_Analog_W_INT,
	BUS_Analog_R_INT => BUS_Analog_R_INT,
	BUS_Analog_VLD => BUS_Analog_VLD,
		REG_Analog_READ_STATUS_RD => REG_Analog_READ_STATUS_RD,
		INT_Analog_READ_STATUS_RD => INT_Analog_READ_STATUS_RD,
		REG_Analog_READ_POSITION_RD => REG_Analog_READ_POSITION_RD,
		INT_Analog_READ_POSITION_RD => INT_Analog_READ_POSITION_RD,
		REG_Analog_CONFIG_TRIGGER_MODE_WR => REG_Analog_CONFIG_TRIGGER_MODE_WR,
		INT_Analog_CONFIG_TRIGGER_MODE_WR => INT_Analog_CONFIG_TRIGGER_MODE_WR,
		REG_Analog_CONFIG_TRIGGER_MODE_RD => REG_Analog_CONFIG_TRIGGER_MODE_WR,
		REG_Analog_CONFIG_PRETRIGGER_WR => REG_Analog_CONFIG_PRETRIGGER_WR,
		INT_Analog_CONFIG_PRETRIGGER_WR => INT_Analog_CONFIG_PRETRIGGER_WR,
		REG_Analog_CONFIG_PRETRIGGER_RD => REG_Analog_CONFIG_PRETRIGGER_WR,
		REG_Analog_CONFIG_TRIGGER_LEVEL_WR => REG_Analog_CONFIG_TRIGGER_LEVEL_WR,
		INT_Analog_CONFIG_TRIGGER_LEVEL_WR => INT_Analog_CONFIG_TRIGGER_LEVEL_WR,
		REG_Analog_CONFIG_TRIGGER_LEVEL_RD => REG_Analog_CONFIG_TRIGGER_LEVEL_WR,
		REG_Analog_CONFIG_ARM_WR => REG_Analog_CONFIG_ARM_WR,
		INT_Analog_CONFIG_ARM_WR => INT_Analog_CONFIG_ARM_WR,
		REG_Analog_CONFIG_ARM_RD => REG_Analog_CONFIG_ARM_WR,
		REG_Analog_CONFIG_DECIMATOR_WR => REG_Analog_CONFIG_DECIMATOR_WR,
		INT_Analog_CONFIG_DECIMATOR_WR => INT_Analog_CONFIG_DECIMATOR_WR,
		REG_Analog_CONFIG_DECIMATOR_RD => REG_Analog_CONFIG_DECIMATOR_WR,
	BUS_RateMeter_READ_ADDRESS => BUS_RateMeter_READ_ADDRESS,
	BUS_RateMeter_READ_DATA => BUS_RateMeter_READ_DATA,
	BUS_RateMeter_WRITE_DATA => BUS_RateMeter_WRITE_DATA,
	BUS_RateMeter_W_INT => BUS_RateMeter_W_INT,
	BUS_RateMeter_R_INT => BUS_RateMeter_R_INT,
	BUS_RateMeter_VLD => BUS_RateMeter_VLD,
	BUS_thrsh_READ_DATA => BUS_thrsh_READ_DATA,
	BUS_thrsh_WRITE_DATA => BUS_thrsh_WRITE_DATA,
	BUS_thrsh_W_INT => BUS_thrsh_W_INT,
	BUS_thrsh_R_INT => BUS_thrsh_R_INT,
	BUS_thrsh_VLD => BUS_thrsh_VLD,
		REG_thrsh_CH0_WR => REG_thrsh_CH0_WR,
		INT_thrsh_CH0_WR => INT_thrsh_CH0_WR,
		REG_thrsh_CH0_RD => REG_thrsh_CH0_WR,
		REG_thrsh_CH1_WR => REG_thrsh_CH1_WR,
		INT_thrsh_CH1_WR => INT_thrsh_CH1_WR,
		REG_thrsh_CH1_RD => REG_thrsh_CH1_WR,
		REG_thrsh_CH2_WR => REG_thrsh_CH2_WR,
		INT_thrsh_CH2_WR => INT_thrsh_CH2_WR,
		REG_thrsh_CH2_RD => REG_thrsh_CH2_WR,
		REG_thrsh_CH3_WR => REG_thrsh_CH3_WR,
		INT_thrsh_CH3_WR => INT_thrsh_CH3_WR,
		REG_thrsh_CH3_RD => REG_thrsh_CH3_WR,
		REG_thrsh_CH4_WR => REG_thrsh_CH4_WR,
		INT_thrsh_CH4_WR => INT_thrsh_CH4_WR,
		REG_thrsh_CH4_RD => REG_thrsh_CH4_WR,
		REG_thrsh_CH5_WR => REG_thrsh_CH5_WR,
		INT_thrsh_CH5_WR => INT_thrsh_CH5_WR,
		REG_thrsh_CH5_RD => REG_thrsh_CH5_WR,
		REG_thrsh_CH6_WR => REG_thrsh_CH6_WR,
		INT_thrsh_CH6_WR => INT_thrsh_CH6_WR,
		REG_thrsh_CH6_RD => REG_thrsh_CH6_WR,
		REG_thrsh_CH7_WR => REG_thrsh_CH7_WR,
		INT_thrsh_CH7_WR => INT_thrsh_CH7_WR,
		REG_thrsh_CH7_RD => REG_thrsh_CH7_WR,
		REG_thrsh_CH8_WR => REG_thrsh_CH8_WR,
		INT_thrsh_CH8_WR => INT_thrsh_CH8_WR,
		REG_thrsh_CH8_RD => REG_thrsh_CH8_WR,
		REG_thrsh_CH9_WR => REG_thrsh_CH9_WR,
		INT_thrsh_CH9_WR => INT_thrsh_CH9_WR,
		REG_thrsh_CH9_RD => REG_thrsh_CH9_WR,
		REG_thrsh_CH10_WR => REG_thrsh_CH10_WR,
		INT_thrsh_CH10_WR => INT_thrsh_CH10_WR,
		REG_thrsh_CH10_RD => REG_thrsh_CH10_WR,
		REG_thrsh_CH11_WR => REG_thrsh_CH11_WR,
		INT_thrsh_CH11_WR => INT_thrsh_CH11_WR,
		REG_thrsh_CH11_RD => REG_thrsh_CH11_WR,
		REG_thrsh_CH12_WR => REG_thrsh_CH12_WR,
		INT_thrsh_CH12_WR => INT_thrsh_CH12_WR,
		REG_thrsh_CH12_RD => REG_thrsh_CH12_WR,
		REG_thrsh_CH13_WR => REG_thrsh_CH13_WR,
		INT_thrsh_CH13_WR => INT_thrsh_CH13_WR,
		REG_thrsh_CH13_RD => REG_thrsh_CH13_WR,
		REG_thrsh_CH14_WR => REG_thrsh_CH14_WR,
		INT_thrsh_CH14_WR => INT_thrsh_CH14_WR,
		REG_thrsh_CH14_RD => REG_thrsh_CH14_WR,
		REG_thrsh_CH15_WR => REG_thrsh_CH15_WR,
		INT_thrsh_CH15_WR => INT_thrsh_CH15_WR,
		REG_thrsh_CH15_RD => REG_thrsh_CH15_WR,
		REG_thrsh_CH16_WR => REG_thrsh_CH16_WR,
		INT_thrsh_CH16_WR => INT_thrsh_CH16_WR,
		REG_thrsh_CH16_RD => REG_thrsh_CH16_WR,
		REG_thrsh_CH17_WR => REG_thrsh_CH17_WR,
		INT_thrsh_CH17_WR => INT_thrsh_CH17_WR,
		REG_thrsh_CH17_RD => REG_thrsh_CH17_WR,
		REG_thrsh_CH18_WR => REG_thrsh_CH18_WR,
		INT_thrsh_CH18_WR => INT_thrsh_CH18_WR,
		REG_thrsh_CH18_RD => REG_thrsh_CH18_WR,
		REG_thrsh_CH19_WR => REG_thrsh_CH19_WR,
		INT_thrsh_CH19_WR => INT_thrsh_CH19_WR,
		REG_thrsh_CH19_RD => REG_thrsh_CH19_WR,
		REG_thrsh_CH20_WR => REG_thrsh_CH20_WR,
		INT_thrsh_CH20_WR => INT_thrsh_CH20_WR,
		REG_thrsh_CH20_RD => REG_thrsh_CH20_WR,
		REG_thrsh_CH21_WR => REG_thrsh_CH21_WR,
		INT_thrsh_CH21_WR => INT_thrsh_CH21_WR,
		REG_thrsh_CH21_RD => REG_thrsh_CH21_WR,
		REG_thrsh_CH22_WR => REG_thrsh_CH22_WR,
		INT_thrsh_CH22_WR => INT_thrsh_CH22_WR,
		REG_thrsh_CH22_RD => REG_thrsh_CH22_WR,
		REG_thrsh_CH23_WR => REG_thrsh_CH23_WR,
		INT_thrsh_CH23_WR => INT_thrsh_CH23_WR,
		REG_thrsh_CH23_RD => REG_thrsh_CH23_WR,
	BUS_diag_READ_ADDRESS => BUS_diag_READ_ADDRESS,
	BUS_diag_READ_DATA => BUS_diag_READ_DATA,
	BUS_diag_WRITE_DATA => BUS_diag_WRITE_DATA,
	BUS_diag_W_INT => BUS_diag_W_INT,
	BUS_diag_R_INT => BUS_diag_R_INT,
	BUS_diag_VLD => BUS_diag_VLD,
		REG_diag_READ_STATUS_RD => REG_diag_READ_STATUS_RD,
		INT_diag_READ_STATUS_RD => INT_diag_READ_STATUS_RD,
		REG_diag_READ_POSITION_RD => REG_diag_READ_POSITION_RD,
		INT_diag_READ_POSITION_RD => INT_diag_READ_POSITION_RD,
		REG_diag_CONFIG_TRIGGER_MODE_WR => REG_diag_CONFIG_TRIGGER_MODE_WR,
		INT_diag_CONFIG_TRIGGER_MODE_WR => INT_diag_CONFIG_TRIGGER_MODE_WR,
		REG_diag_CONFIG_TRIGGER_MODE_RD => REG_diag_CONFIG_TRIGGER_MODE_WR,
		REG_diag_CONFIG_PRETRIGGER_WR => REG_diag_CONFIG_PRETRIGGER_WR,
		INT_diag_CONFIG_PRETRIGGER_WR => INT_diag_CONFIG_PRETRIGGER_WR,
		REG_diag_CONFIG_PRETRIGGER_RD => REG_diag_CONFIG_PRETRIGGER_WR,
		REG_diag_CONFIG_TRIGGER_LEVEL_WR => REG_diag_CONFIG_TRIGGER_LEVEL_WR,
		INT_diag_CONFIG_TRIGGER_LEVEL_WR => INT_diag_CONFIG_TRIGGER_LEVEL_WR,
		REG_diag_CONFIG_TRIGGER_LEVEL_RD => REG_diag_CONFIG_TRIGGER_LEVEL_WR,
		REG_diag_CONFIG_ARM_WR => REG_diag_CONFIG_ARM_WR,
		INT_diag_CONFIG_ARM_WR => INT_diag_CONFIG_ARM_WR,
		REG_diag_CONFIG_ARM_RD => REG_diag_CONFIG_ARM_WR,
		REG_diag_CONFIG_DECIMATOR_WR => REG_diag_CONFIG_DECIMATOR_WR,
		INT_diag_CONFIG_DECIMATOR_WR => INT_diag_CONFIG_DECIMATOR_WR,
		REG_diag_CONFIG_DECIMATOR_RD => REG_diag_CONFIG_DECIMATOR_WR,
	BUS_top_READ_DATA => BUS_top_READ_DATA,
	BUS_top_WRITE_DATA => BUS_top_WRITE_DATA,
	BUS_top_W_INT => BUS_top_W_INT,
	BUS_top_R_INT => BUS_top_R_INT,
	BUS_top_VLD => BUS_top_VLD,
		REG_top_CH0_WR => REG_top_CH0_WR,
		INT_top_CH0_WR => INT_top_CH0_WR,
		REG_top_CH0_RD => REG_top_CH0_WR,
		REG_top_CH1_WR => REG_top_CH1_WR,
		INT_top_CH1_WR => INT_top_CH1_WR,
		REG_top_CH1_RD => REG_top_CH1_WR,
		REG_top_CH2_WR => REG_top_CH2_WR,
		INT_top_CH2_WR => INT_top_CH2_WR,
		REG_top_CH2_RD => REG_top_CH2_WR,
		REG_top_CH3_WR => REG_top_CH3_WR,
		INT_top_CH3_WR => INT_top_CH3_WR,
		REG_top_CH3_RD => REG_top_CH3_WR,
		REG_top_CH4_WR => REG_top_CH4_WR,
		INT_top_CH4_WR => INT_top_CH4_WR,
		REG_top_CH4_RD => REG_top_CH4_WR,
		REG_top_CH5_WR => REG_top_CH5_WR,
		INT_top_CH5_WR => INT_top_CH5_WR,
		REG_top_CH5_RD => REG_top_CH5_WR,
		REG_top_CH6_WR => REG_top_CH6_WR,
		INT_top_CH6_WR => INT_top_CH6_WR,
		REG_top_CH6_RD => REG_top_CH6_WR,
		REG_top_CH7_WR => REG_top_CH7_WR,
		INT_top_CH7_WR => INT_top_CH7_WR,
		REG_top_CH7_RD => REG_top_CH7_WR,
		REG_top_CH8_WR => REG_top_CH8_WR,
		INT_top_CH8_WR => INT_top_CH8_WR,
		REG_top_CH8_RD => REG_top_CH8_WR,
		REG_top_CH9_WR => REG_top_CH9_WR,
		INT_top_CH9_WR => INT_top_CH9_WR,
		REG_top_CH9_RD => REG_top_CH9_WR,
		REG_top_CH10_WR => REG_top_CH10_WR,
		INT_top_CH10_WR => INT_top_CH10_WR,
		REG_top_CH10_RD => REG_top_CH10_WR,
		REG_top_CH11_WR => REG_top_CH11_WR,
		INT_top_CH11_WR => INT_top_CH11_WR,
		REG_top_CH11_RD => REG_top_CH11_WR,
		REG_top_CH12_WR => REG_top_CH12_WR,
		INT_top_CH12_WR => INT_top_CH12_WR,
		REG_top_CH12_RD => REG_top_CH12_WR,
		REG_top_CH13_WR => REG_top_CH13_WR,
		INT_top_CH13_WR => INT_top_CH13_WR,
		REG_top_CH13_RD => REG_top_CH13_WR,
		REG_top_CH14_WR => REG_top_CH14_WR,
		INT_top_CH14_WR => INT_top_CH14_WR,
		REG_top_CH14_RD => REG_top_CH14_WR,
		REG_top_CH15_WR => REG_top_CH15_WR,
		INT_top_CH15_WR => INT_top_CH15_WR,
		REG_top_CH15_RD => REG_top_CH15_WR,
		REG_top_CH16_WR => REG_top_CH16_WR,
		INT_top_CH16_WR => INT_top_CH16_WR,
		REG_top_CH16_RD => REG_top_CH16_WR,
		REG_top_CH17_WR => REG_top_CH17_WR,
		INT_top_CH17_WR => INT_top_CH17_WR,
		REG_top_CH17_RD => REG_top_CH17_WR,
		REG_top_CH18_WR => REG_top_CH18_WR,
		INT_top_CH18_WR => INT_top_CH18_WR,
		REG_top_CH18_RD => REG_top_CH18_WR,
		REG_top_CH19_WR => REG_top_CH19_WR,
		INT_top_CH19_WR => INT_top_CH19_WR,
		REG_top_CH19_RD => REG_top_CH19_WR,
		REG_top_CH20_WR => REG_top_CH20_WR,
		INT_top_CH20_WR => INT_top_CH20_WR,
		REG_top_CH20_RD => REG_top_CH20_WR,
		REG_top_CH21_WR => REG_top_CH21_WR,
		INT_top_CH21_WR => INT_top_CH21_WR,
		REG_top_CH21_RD => REG_top_CH21_WR,
		REG_top_CH22_WR => REG_top_CH22_WR,
		INT_top_CH22_WR => INT_top_CH22_WR,
		REG_top_CH22_RD => REG_top_CH22_WR,
		REG_top_CH23_WR => REG_top_CH23_WR,
		INT_top_CH23_WR => INT_top_CH23_WR,
		REG_top_CH23_RD => REG_top_CH23_WR,
	BUS_disable_det_READ_DATA => BUS_disable_det_READ_DATA,
	BUS_disable_det_WRITE_DATA => BUS_disable_det_WRITE_DATA,
	BUS_disable_det_W_INT => BUS_disable_det_W_INT,
	BUS_disable_det_R_INT => BUS_disable_det_R_INT,
	BUS_disable_det_VLD => BUS_disable_det_VLD,
		REG_disable_det_CH0_WR => REG_disable_det_CH0_WR,
		INT_disable_det_CH0_WR => INT_disable_det_CH0_WR,
		REG_disable_det_CH0_RD => REG_disable_det_CH0_WR,
		REG_disable_det_CH1_WR => REG_disable_det_CH1_WR,
		INT_disable_det_CH1_WR => INT_disable_det_CH1_WR,
		REG_disable_det_CH1_RD => REG_disable_det_CH1_WR,
		REG_disable_det_CH2_WR => REG_disable_det_CH2_WR,
		INT_disable_det_CH2_WR => INT_disable_det_CH2_WR,
		REG_disable_det_CH2_RD => REG_disable_det_CH2_WR,
		REG_disable_det_CH3_WR => REG_disable_det_CH3_WR,
		INT_disable_det_CH3_WR => INT_disable_det_CH3_WR,
		REG_disable_det_CH3_RD => REG_disable_det_CH3_WR,
		REG_disable_det_CH4_WR => REG_disable_det_CH4_WR,
		INT_disable_det_CH4_WR => INT_disable_det_CH4_WR,
		REG_disable_det_CH4_RD => REG_disable_det_CH4_WR,
		REG_disable_det_CH5_WR => REG_disable_det_CH5_WR,
		INT_disable_det_CH5_WR => INT_disable_det_CH5_WR,
		REG_disable_det_CH5_RD => REG_disable_det_CH5_WR,
		REG_disable_det_CH6_WR => REG_disable_det_CH6_WR,
		INT_disable_det_CH6_WR => INT_disable_det_CH6_WR,
		REG_disable_det_CH6_RD => REG_disable_det_CH6_WR,
		REG_disable_det_CH7_WR => REG_disable_det_CH7_WR,
		INT_disable_det_CH7_WR => INT_disable_det_CH7_WR,
		REG_disable_det_CH7_RD => REG_disable_det_CH7_WR,
		REG_disable_det_CH8_WR => REG_disable_det_CH8_WR,
		INT_disable_det_CH8_WR => INT_disable_det_CH8_WR,
		REG_disable_det_CH8_RD => REG_disable_det_CH8_WR,
		REG_disable_det_CH9_WR => REG_disable_det_CH9_WR,
		INT_disable_det_CH9_WR => INT_disable_det_CH9_WR,
		REG_disable_det_CH9_RD => REG_disable_det_CH9_WR,
		REG_disable_det_CH10_WR => REG_disable_det_CH10_WR,
		INT_disable_det_CH10_WR => INT_disable_det_CH10_WR,
		REG_disable_det_CH10_RD => REG_disable_det_CH10_WR,
		REG_disable_det_CH11_WR => REG_disable_det_CH11_WR,
		INT_disable_det_CH11_WR => INT_disable_det_CH11_WR,
		REG_disable_det_CH11_RD => REG_disable_det_CH11_WR,
		REG_disable_det_CH12_WR => REG_disable_det_CH12_WR,
		INT_disable_det_CH12_WR => INT_disable_det_CH12_WR,
		REG_disable_det_CH12_RD => REG_disable_det_CH12_WR,
		REG_disable_det_CH13_WR => REG_disable_det_CH13_WR,
		INT_disable_det_CH13_WR => INT_disable_det_CH13_WR,
		REG_disable_det_CH13_RD => REG_disable_det_CH13_WR,
		REG_disable_det_CH14_WR => REG_disable_det_CH14_WR,
		INT_disable_det_CH14_WR => INT_disable_det_CH14_WR,
		REG_disable_det_CH14_RD => REG_disable_det_CH14_WR,
		REG_disable_det_CH15_WR => REG_disable_det_CH15_WR,
		INT_disable_det_CH15_WR => INT_disable_det_CH15_WR,
		REG_disable_det_CH15_RD => REG_disable_det_CH15_WR,
		REG_disable_det_CH16_WR => REG_disable_det_CH16_WR,
		INT_disable_det_CH16_WR => INT_disable_det_CH16_WR,
		REG_disable_det_CH16_RD => REG_disable_det_CH16_WR,
		REG_disable_det_CH17_WR => REG_disable_det_CH17_WR,
		INT_disable_det_CH17_WR => INT_disable_det_CH17_WR,
		REG_disable_det_CH17_RD => REG_disable_det_CH17_WR,
		REG_disable_det_CH18_WR => REG_disable_det_CH18_WR,
		INT_disable_det_CH18_WR => INT_disable_det_CH18_WR,
		REG_disable_det_CH18_RD => REG_disable_det_CH18_WR,
		REG_disable_det_CH19_WR => REG_disable_det_CH19_WR,
		INT_disable_det_CH19_WR => INT_disable_det_CH19_WR,
		REG_disable_det_CH19_RD => REG_disable_det_CH19_WR,
		REG_disable_det_CH20_WR => REG_disable_det_CH20_WR,
		INT_disable_det_CH20_WR => INT_disable_det_CH20_WR,
		REG_disable_det_CH20_RD => REG_disable_det_CH20_WR,
		REG_disable_det_CH21_WR => REG_disable_det_CH21_WR,
		INT_disable_det_CH21_WR => INT_disable_det_CH21_WR,
		REG_disable_det_CH21_RD => REG_disable_det_CH21_WR,
		REG_disable_det_CH22_WR => REG_disable_det_CH22_WR,
		INT_disable_det_CH22_WR => INT_disable_det_CH22_WR,
		REG_disable_det_CH22_RD => REG_disable_det_CH22_WR,
		REG_disable_det_CH23_WR => REG_disable_det_CH23_WR,
		INT_disable_det_CH23_WR => INT_disable_det_CH23_WR,
		REG_disable_det_CH23_RD => REG_disable_det_CH23_WR,
	BUS_Analog_In_Unflipped_READ_ADDRESS => BUS_Analog_In_Unflipped_READ_ADDRESS,
	BUS_Analog_In_Unflipped_READ_DATA => BUS_Analog_In_Unflipped_READ_DATA,
	BUS_Analog_In_Unflipped_WRITE_DATA => BUS_Analog_In_Unflipped_WRITE_DATA,
	BUS_Analog_In_Unflipped_W_INT => BUS_Analog_In_Unflipped_W_INT,
	BUS_Analog_In_Unflipped_R_INT => BUS_Analog_In_Unflipped_R_INT,
	BUS_Analog_In_Unflipped_VLD => BUS_Analog_In_Unflipped_VLD,
		REG_Analog_In_Unflipped_READ_STATUS_RD => REG_Analog_In_Unflipped_READ_STATUS_RD,
		INT_Analog_In_Unflipped_READ_STATUS_RD => INT_Analog_In_Unflipped_READ_STATUS_RD,
		REG_Analog_In_Unflipped_READ_POSITION_RD => REG_Analog_In_Unflipped_READ_POSITION_RD,
		INT_Analog_In_Unflipped_READ_POSITION_RD => INT_Analog_In_Unflipped_READ_POSITION_RD,
		REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR => REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR,
		INT_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR => INT_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR,
		REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_RD => REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR,
		REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR => REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR,
		INT_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR => INT_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR,
		REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_RD => REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR,
		REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR => REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR,
		INT_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR => INT_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR,
		REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_RD => REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR,
		REG_Analog_In_Unflipped_CONFIG_ARM_WR => REG_Analog_In_Unflipped_CONFIG_ARM_WR,
		INT_Analog_In_Unflipped_CONFIG_ARM_WR => INT_Analog_In_Unflipped_CONFIG_ARM_WR,
		REG_Analog_In_Unflipped_CONFIG_ARM_RD => REG_Analog_In_Unflipped_CONFIG_ARM_WR,
		REG_Analog_In_Unflipped_CONFIG_DECIMATOR_WR => REG_Analog_In_Unflipped_CONFIG_DECIMATOR_WR,
		INT_Analog_In_Unflipped_CONFIG_DECIMATOR_WR => INT_Analog_In_Unflipped_CONFIG_DECIMATOR_WR,
		REG_Analog_In_Unflipped_CONFIG_DECIMATOR_RD => REG_Analog_In_Unflipped_CONFIG_DECIMATOR_WR,
		REG_dummy_RD => REG_dummy_RD,
		REG_dummy_WR => REG_dummy_WR,
		INT_dummy_RD => INT_dummy_RD,
		INT_dummy_WR => INT_dummy_WR,
		REG_forcetrig_RD => REG_forcetrig_RD,
		REG_forcetrig_WR => REG_forcetrig_WR,
		INT_forcetrig_RD => INT_forcetrig_RD,
		INT_forcetrig_WR => INT_forcetrig_WR,
		REG_full_RD => REG_full_RD,
		REG_full_WR => REG_full_WR,
		INT_full_RD => INT_full_RD,
		INT_full_WR => INT_full_WR,
		REG_trigger_code_RD => REG_trigger_code_RD,
		REG_trigger_code_WR => REG_trigger_code_WR,
		INT_trigger_code_RD => INT_trigger_code_RD,
		INT_trigger_code_WR => INT_trigger_code_WR,
		REG_reset_RD => REG_reset_RD,
		REG_reset_WR => REG_reset_WR,
		INT_reset_RD => INT_reset_RD,
		INT_reset_WR => INT_reset_WR,
		REG_timestamp_RD => REG_timestamp_RD,
		REG_timestamp_WR => REG_timestamp_WR,
		INT_timestamp_RD => INT_timestamp_RD,
		INT_timestamp_WR => INT_timestamp_WR,
		REG_received_RD => REG_received_RD,
		REG_received_WR => REG_received_WR,
		INT_received_RD => INT_received_RD,
		INT_received_WR => INT_received_WR,
	BUS_base_READ_DATA => BUS_base_READ_DATA,
	BUS_base_WRITE_DATA => BUS_base_WRITE_DATA,
	BUS_base_W_INT => BUS_base_W_INT,
	BUS_base_R_INT => BUS_base_R_INT,
	BUS_base_VLD => BUS_base_VLD,
		REG_base_CH0_WR => REG_base_CH0_WR,
		INT_base_CH0_WR => INT_base_CH0_WR,
		REG_base_CH0_RD => REG_base_CH0_WR,
		REG_base_CH1_WR => REG_base_CH1_WR,
		INT_base_CH1_WR => INT_base_CH1_WR,
		REG_base_CH1_RD => REG_base_CH1_WR,
		REG_base_CH2_WR => REG_base_CH2_WR,
		INT_base_CH2_WR => INT_base_CH2_WR,
		REG_base_CH2_RD => REG_base_CH2_WR,
		REG_base_CH3_WR => REG_base_CH3_WR,
		INT_base_CH3_WR => INT_base_CH3_WR,
		REG_base_CH3_RD => REG_base_CH3_WR,
		REG_base_CH4_WR => REG_base_CH4_WR,
		INT_base_CH4_WR => INT_base_CH4_WR,
		REG_base_CH4_RD => REG_base_CH4_WR,
		REG_base_CH5_WR => REG_base_CH5_WR,
		INT_base_CH5_WR => INT_base_CH5_WR,
		REG_base_CH5_RD => REG_base_CH5_WR,
		REG_base_CH6_WR => REG_base_CH6_WR,
		INT_base_CH6_WR => INT_base_CH6_WR,
		REG_base_CH6_RD => REG_base_CH6_WR,
		REG_base_CH7_WR => REG_base_CH7_WR,
		INT_base_CH7_WR => INT_base_CH7_WR,
		REG_base_CH7_RD => REG_base_CH7_WR,
		REG_base_CH8_WR => REG_base_CH8_WR,
		INT_base_CH8_WR => INT_base_CH8_WR,
		REG_base_CH8_RD => REG_base_CH8_WR,
		REG_base_CH9_WR => REG_base_CH9_WR,
		INT_base_CH9_WR => INT_base_CH9_WR,
		REG_base_CH9_RD => REG_base_CH9_WR,
		REG_base_CH10_WR => REG_base_CH10_WR,
		INT_base_CH10_WR => INT_base_CH10_WR,
		REG_base_CH10_RD => REG_base_CH10_WR,
		REG_base_CH11_WR => REG_base_CH11_WR,
		INT_base_CH11_WR => INT_base_CH11_WR,
		REG_base_CH11_RD => REG_base_CH11_WR,
		REG_base_CH12_WR => REG_base_CH12_WR,
		INT_base_CH12_WR => INT_base_CH12_WR,
		REG_base_CH12_RD => REG_base_CH12_WR,
		REG_base_CH13_WR => REG_base_CH13_WR,
		INT_base_CH13_WR => INT_base_CH13_WR,
		REG_base_CH13_RD => REG_base_CH13_WR,
		REG_base_CH14_WR => REG_base_CH14_WR,
		INT_base_CH14_WR => INT_base_CH14_WR,
		REG_base_CH14_RD => REG_base_CH14_WR,
		REG_base_CH15_WR => REG_base_CH15_WR,
		INT_base_CH15_WR => INT_base_CH15_WR,
		REG_base_CH15_RD => REG_base_CH15_WR,
		REG_base_CH16_WR => REG_base_CH16_WR,
		INT_base_CH16_WR => INT_base_CH16_WR,
		REG_base_CH16_RD => REG_base_CH16_WR,
		REG_base_CH17_WR => REG_base_CH17_WR,
		INT_base_CH17_WR => INT_base_CH17_WR,
		REG_base_CH17_RD => REG_base_CH17_WR,
		REG_base_CH18_WR => REG_base_CH18_WR,
		INT_base_CH18_WR => INT_base_CH18_WR,
		REG_base_CH18_RD => REG_base_CH18_WR,
		REG_base_CH19_WR => REG_base_CH19_WR,
		INT_base_CH19_WR => INT_base_CH19_WR,
		REG_base_CH19_RD => REG_base_CH19_WR,
		REG_base_CH20_WR => REG_base_CH20_WR,
		INT_base_CH20_WR => INT_base_CH20_WR,
		REG_base_CH20_RD => REG_base_CH20_WR,
		REG_base_CH21_WR => REG_base_CH21_WR,
		INT_base_CH21_WR => INT_base_CH21_WR,
		REG_base_CH21_RD => REG_base_CH21_WR,
		REG_base_CH22_WR => REG_base_CH22_WR,
		INT_base_CH22_WR => INT_base_CH22_WR,
		REG_base_CH22_RD => REG_base_CH22_WR,
		REG_base_CH23_WR => REG_base_CH23_WR,
		INT_base_CH23_WR => INT_base_CH23_WR,
		REG_base_CH23_RD => REG_base_CH23_WR,
	BUS_baselines_READ_ADDRESS => BUS_baselines_READ_ADDRESS,
	BUS_baselines_READ_DATA => BUS_baselines_READ_DATA,
	BUS_baselines_WRITE_DATA => BUS_baselines_WRITE_DATA,
	BUS_baselines_W_INT => BUS_baselines_W_INT,
	BUS_baselines_R_INT => BUS_baselines_R_INT,
	BUS_baselines_VLD => BUS_baselines_VLD,
		REG_baselines_READ_STATUS_RD => REG_baselines_READ_STATUS_RD,
		INT_baselines_READ_STATUS_RD => INT_baselines_READ_STATUS_RD,
		REG_baselines_READ_POSITION_RD => REG_baselines_READ_POSITION_RD,
		INT_baselines_READ_POSITION_RD => INT_baselines_READ_POSITION_RD,
		REG_baselines_CONFIG_TRIGGER_MODE_WR => REG_baselines_CONFIG_TRIGGER_MODE_WR,
		INT_baselines_CONFIG_TRIGGER_MODE_WR => INT_baselines_CONFIG_TRIGGER_MODE_WR,
		REG_baselines_CONFIG_TRIGGER_MODE_RD => REG_baselines_CONFIG_TRIGGER_MODE_WR,
		REG_baselines_CONFIG_PRETRIGGER_WR => REG_baselines_CONFIG_PRETRIGGER_WR,
		INT_baselines_CONFIG_PRETRIGGER_WR => INT_baselines_CONFIG_PRETRIGGER_WR,
		REG_baselines_CONFIG_PRETRIGGER_RD => REG_baselines_CONFIG_PRETRIGGER_WR,
		REG_baselines_CONFIG_TRIGGER_LEVEL_WR => REG_baselines_CONFIG_TRIGGER_LEVEL_WR,
		INT_baselines_CONFIG_TRIGGER_LEVEL_WR => INT_baselines_CONFIG_TRIGGER_LEVEL_WR,
		REG_baselines_CONFIG_TRIGGER_LEVEL_RD => REG_baselines_CONFIG_TRIGGER_LEVEL_WR,
		REG_baselines_CONFIG_ARM_WR => REG_baselines_CONFIG_ARM_WR,
		INT_baselines_CONFIG_ARM_WR => INT_baselines_CONFIG_ARM_WR,
		REG_baselines_CONFIG_ARM_RD => REG_baselines_CONFIG_ARM_WR,
		REG_baselines_CONFIG_DECIMATOR_WR => REG_baselines_CONFIG_DECIMATOR_WR,
		INT_baselines_CONFIG_DECIMATOR_WR => INT_baselines_CONFIG_DECIMATOR_WR,
		REG_baselines_CONFIG_DECIMATOR_RD => REG_baselines_CONFIG_DECIMATOR_WR,
	BUS_int_READ_DATA => BUS_int_READ_DATA,
	BUS_int_WRITE_DATA => BUS_int_WRITE_DATA,
	BUS_int_W_INT => BUS_int_W_INT,
	BUS_int_R_INT => BUS_int_R_INT,
	BUS_int_VLD => BUS_int_VLD,
		REG_int_time_WR => REG_int_time_WR,
		INT_int_time_WR => INT_int_time_WR,
		REG_int_time_RD => REG_int_time_WR,
		REG_int_pre_WR => REG_int_pre_WR,
		INT_int_pre_WR => INT_int_pre_WR,
		REG_int_pre_RD => REG_int_pre_WR,
		REG_int_base_WR => REG_int_base_WR,
		INT_int_base_WR => INT_int_base_WR,
		REG_int_base_RD => REG_int_base_WR,
		REG_int_scale_WR => REG_int_scale_WR,
		INT_int_scale_WR => INT_int_scale_WR,
		REG_int_scale_RD => REG_int_scale_WR,
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
	BUS_trig_READ_DATA => BUS_trig_READ_DATA,
	BUS_trig_WRITE_DATA => BUS_trig_WRITE_DATA,
	BUS_trig_W_INT => BUS_trig_W_INT,
	BUS_trig_R_INT => BUS_trig_R_INT,
	BUS_trig_VLD => BUS_trig_VLD,
		REG_trig_gate_l_WR => REG_trig_gate_l_WR,
		INT_trig_gate_l_WR => INT_trig_gate_l_WR,
		REG_trig_gate_l_RD => REG_trig_gate_l_WR,
		REG_trig_gate_u_WR => REG_trig_gate_u_WR,
		INT_trig_gate_u_WR => INT_trig_gate_u_WR,
		REG_trig_gate_u_RD => REG_trig_gate_u_WR,
		REG_trig_delay_WR => REG_trig_delay_WR,
		INT_trig_delay_WR => INT_trig_delay_WR,
		REG_trig_delay_RD => REG_trig_delay_WR,
		REG_trig_mode_WR => REG_trig_mode_WR,
		INT_trig_mode_WR => INT_trig_mode_WR,
		REG_trig_mode_RD => REG_trig_mode_WR,
	BUS_io_READ_DATA => BUS_io_READ_DATA,
	BUS_io_WRITE_DATA => BUS_io_WRITE_DATA,
	BUS_io_W_INT => BUS_io_W_INT,
	BUS_io_R_INT => BUS_io_R_INT,
	BUS_io_VLD => BUS_io_VLD,
		REG_io_stamptype_WR => REG_io_stamptype_WR,
		INT_io_stamptype_WR => INT_io_stamptype_WR,
		REG_io_stamptype_RD => REG_io_stamptype_WR,
		REG_io_lemo2out_WR => REG_io_lemo2out_WR,
		INT_io_lemo2out_WR => INT_io_lemo2out_WR,
		REG_io_lemo2out_RD => REG_io_lemo2out_WR,
		REG_io_divide_WR => REG_io_divide_WR,
		INT_io_divide_WR => INT_io_divide_WR,
		REG_io_divide_RD => REG_io_divide_WR,
		REG_UNIQUE_RD => x"361567DF",
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

	  U0_A0 <= CHA0;
U1_A1 <= CHA1;
U2_A2 <= CHA2;
U3_A3 <= CHA3;
U4_A4 <= CHA4;
U5_A5 <= CHA5;
U6_A6 <= CHA6;
U7_A7 <= CHA7;
U8_A8 <= CHA8;
U9_A9 <= CHA9;
U10_A10 <= CHA10;
U11_A11 <= CHA11;
U12_A12 <= CHA12;
U13_A13 <= CHA13;
U14_A14 <= CHA14;
U15_A15 <= CHA15;
U16_A16 <= CHA16;
U17_A17 <= CHA17;
U18_A18 <= CHA18;
U19_A19 <= CHA19;
U20_A20 <= CHA20;
U21_A21 <= CHA21;
U22_A22 <= CHA22;
U23_A23 <= CHA23;
U24_OUT <= U77_TRIGOUT_0 OR U77_TRIGOUT_1 OR U77_TRIGOUT_2 OR U77_TRIGOUT_3 OR U77_TRIGOUT_4 OR U77_TRIGOUT_5 OR U77_TRIGOUT_6 OR U77_TRIGOUT_7 OR U77_TRIGOUT_8 OR U77_TRIGOUT_9 OR U77_TRIGOUT_10 OR U77_TRIGOUT_11 OR U77_TRIGOUT_12 OR U77_TRIGOUT_13 OR U77_TRIGOUT_14 OR U77_TRIGOUT_15 OR U77_TRIGOUT_16 OR U77_TRIGOUT_17 OR U77_TRIGOUT_18 OR U77_TRIGOUT_19 OR U77_TRIGOUT_20 OR U77_TRIGOUT_21 OR U77_TRIGOUT_22 OR U77_TRIGOUT_23;
U25_OUT <= U28_OUT AND ( NOT sxt(U24_OUT,1));
U26_int <= INT_reset_WR;
U26_out_0 <= REG_reset_WR(0 downto 0);
REG_reset_RD  <= REG_reset_WR;
U27_out_0 <= U78_TRIGOUT_23 & U78_TRIGOUT_22 & U78_TRIGOUT_21 & U78_TRIGOUT_20 & U78_TRIGOUT_19 & U78_TRIGOUT_18 & U78_TRIGOUT_17 & U78_TRIGOUT_16 & U78_TRIGOUT_15 & U78_TRIGOUT_14 & U78_TRIGOUT_13 & U78_TRIGOUT_12 & U78_TRIGOUT_11 & U78_TRIGOUT_10 & U78_TRIGOUT_9 & U78_TRIGOUT_8 & U78_TRIGOUT_7 & U78_TRIGOUT_6 & U78_TRIGOUT_5 & U78_TRIGOUT_4 & U78_TRIGOUT_3 & U78_TRIGOUT_2 & U78_TRIGOUT_1 & U78_TRIGOUT_0 ;
U28_OUT <= U78_TRIGOUT_0 OR U78_TRIGOUT_1 OR U78_TRIGOUT_2 OR U78_TRIGOUT_3 OR U78_TRIGOUT_4 OR U78_TRIGOUT_5 OR U78_TRIGOUT_6 OR U78_TRIGOUT_7 OR U78_TRIGOUT_8 OR U78_TRIGOUT_9 OR U78_TRIGOUT_10 OR U78_TRIGOUT_11 OR U78_TRIGOUT_12 OR U78_TRIGOUT_13 OR U78_TRIGOUT_14 OR U78_TRIGOUT_15 OR U78_TRIGOUT_16 OR U78_TRIGOUT_17 OR U78_TRIGOUT_18 OR U78_TRIGOUT_19 OR U78_TRIGOUT_20 OR U78_TRIGOUT_21 OR U78_TRIGOUT_22 OR U78_TRIGOUT_23 OR "0" OR "0" OR "0" OR "0" OR "0" OR "0" OR "0" OR "0";
PROCESS_REG_U29 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0)) and U44_out = "1" then
         U29_hold <= EXT(U27_out_0,32);
    end if;
end process;
REG_trigger_code_RD <= EXT(U27_out_0,32) when U44_out="1" else U29_hold;

	U30 : TimestampGenerator
	Generic map(
		nbits => 	32
	)
	PORT MAP(
		TIMESTAMP => U30_TIMESTAMP,
		T0 => U26_int(0),
		CLK_READ => CLK_125(0),
		ClkCounter => CLK_125(0)
	);

U31_out <= ext(U27_out_0 , 32);
PROCESS_REG_U32 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0))  then
         U32_hold <= EXT(U84_FIFO_FULL,32);
    end if;
end process;
REG_full_RD <= EXT(U84_FIFO_FULL,32);
SYNC_0_OUT <= U44_out;

	U34_clk <= FAST_CLK_100;
U35_out <= U30_TIMESTAMP(15 downto 0);

U36 : block
begin
U36_out <= U35_out when U87_stamptype = "00" else U37_out when U87_stamptype = "01" else U86_out_0 when U87_stamptype = "10" else U57_out when U87_stamptype = "11"  else U57_out;

end block;
U37_out <= U30_TIMESTAMP(31 downto 16);
PROCESS_REG_U38 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0)) and U44_out = "1" then
         U38_hold <= EXT(U36_out,32);
    end if;
end process;
REG_timestamp_RD <= EXT(U36_out,32) when U44_out="1" else U38_hold;
PROCESS_REG_U39 : process(BUS_CLK,GlobalReset)
begin
    if rising_edge(BUS_CLK(0)) and U62_Rx_Done = "1" then
         U39_hold <= EXT(U62_pdata_out,32);
    end if;
end process;
REG_received_RD <= EXT(U62_pdata_out,32) when U62_Rx_Done="1" else U39_hold;

U40 : block
begin
U40_out <= U63_CONST when U42_OUT = "0" else U41_CONST when U42_OUT = "1"  else (others=>'0');

end block;
U41_CONST <= std_logic_vector(ieee.numeric_std.resize(ieee.numeric_std.unsigned'(x"80000000"),32));

	U42 : SW_GATE_AND_DELAY
	Generic map(
		maxDelay => 	128
	)
	PORT MAP(
		PORT_IN => U60_Tx_Done,
		GATE => U43_int,
		DELAY => 0,
		PORT_OUT => U42_OUT,
		CLK => CLK_ACQ,
		RESET => U26_int
	);

	U43_int <= conv_integer(U73_time);

U44 : block
begin
U44_out <= U25_OUT when U85_mode = "0" else U86_int when U85_mode = "1"  else U86_int;

end block;
U45_CONST <= conv_std_logic_vector(1,1);

U46 : block
begin
U46_out <= U44_out when U87_lemo2out = "00" else U60_FMData_Out when U87_lemo2out = "01" else U64_out when U87_lemo2out = "10" else U64_out when U87_lemo2out = "11"  else U64_out;

end block;
U47_OUT <= U76_valid_0 AND U76_valid_1 AND U76_valid_2 AND U76_valid_3 AND U76_valid_4 AND U76_valid_5 AND U76_valid_6 AND U76_valid_7 AND U76_valid_8 AND U76_valid_9 AND U76_valid_10 AND U76_valid_11 AND U76_valid_12 AND U76_valid_13 AND U76_valid_14 AND U76_valid_15 AND U76_valid_16 AND U76_valid_17 AND U76_valid_18 AND U76_valid_19 AND U76_valid_20 AND U76_valid_21 AND U76_valid_22 AND U76_valid_23 AND U45_CONST AND U45_CONST AND U45_CONST AND U45_CONST AND U45_CONST AND U45_CONST AND U45_CONST AND U45_CONST;

	U48 : MCRateMeter
	Generic map(
		CHANNEL_COUNT => 	1,
		CLK_FREQ => 	1250000000
	)
	PORT MAP(
		trigger => U44_out,
		VETO => '0',
		START => U26_int(0),
		CLK => CLK_ACQ(0),
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_RateMeter_READ_ADDRESS,
		READ_DATA => BUS_RateMeter_READ_DATA,
		READ_DATAVALID => BUS_RateMeter_VLD
	);


	U49 : xlx_oscilloscope_sync
	Generic map(
		channels => 	24,
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ANALOG => U78_ANALOGOUT_23 & U78_ANALOGOUT_22 & U78_ANALOGOUT_21 & U78_ANALOGOUT_20 & U78_ANALOGOUT_19 & U78_ANALOGOUT_18 & U78_ANALOGOUT_17 & U78_ANALOGOUT_16 & U78_ANALOGOUT_15 & U78_ANALOGOUT_14 & U78_ANALOGOUT_13 & U78_ANALOGOUT_12 & U78_ANALOGOUT_11 & U78_ANALOGOUT_10 & U78_ANALOGOUT_9 & U78_ANALOGOUT_8 & U78_ANALOGOUT_7 & U78_ANALOGOUT_6 & U78_ANALOGOUT_5 & U78_ANALOGOUT_4 & U78_ANALOGOUT_3 & U78_ANALOGOUT_2 & U78_ANALOGOUT_1 & U78_ANALOGOUT_0,
		D0 => U78_TRIGOUT_23 & U78_TRIGOUT_22 & U78_TRIGOUT_21 & U78_TRIGOUT_20 & U78_TRIGOUT_19 & U78_TRIGOUT_18 & U78_TRIGOUT_17 & U78_TRIGOUT_16 & U78_TRIGOUT_15 & U78_TRIGOUT_14 & U78_TRIGOUT_13 & U78_TRIGOUT_12 & U78_TRIGOUT_11 & U78_TRIGOUT_10 & U78_TRIGOUT_9 & U78_TRIGOUT_8 & U78_TRIGOUT_7 & U78_TRIGOUT_6 & U78_TRIGOUT_5 & U78_TRIGOUT_4 & U78_TRIGOUT_3 & U78_TRIGOUT_2 & U78_TRIGOUT_1 & U78_TRIGOUT_0,
		D1 => U77_TRIGOUT_23 & U77_TRIGOUT_22 & U77_TRIGOUT_21 & U77_TRIGOUT_20 & U77_TRIGOUT_19 & U77_TRIGOUT_18 & U77_TRIGOUT_17 & U77_TRIGOUT_16 & U77_TRIGOUT_15 & U77_TRIGOUT_14 & U77_TRIGOUT_13 & U77_TRIGOUT_12 & U77_TRIGOUT_11 & U77_TRIGOUT_10 & U77_TRIGOUT_9 & U77_TRIGOUT_8 & U77_TRIGOUT_7 & U77_TRIGOUT_6 & U77_TRIGOUT_5 & U77_TRIGOUT_4 & U77_TRIGOUT_3 & U77_TRIGOUT_2 & U77_TRIGOUT_1 & U77_TRIGOUT_0,
		D2 => "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0",
		D3 => "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0",
		TRIG => U44_out,
		BUSY => open,
		CE => "1",
		CLK_WRITE => CLK_ACQ,
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Analog_READ_ADDRESS,
		READ_DATA => BUS_Analog_READ_DATA,
		READ_DATAVALID => BUS_Analog_VLD,
		READ_STATUS => REG_Analog_READ_STATUS_RD,
		READ_POSITION => REG_Analog_READ_POSITION_RD,
		CONFIG_TRIGGER_MODE => REG_Analog_CONFIG_TRIGGER_MODE_WR,
		CONFIG_TRIGGER_LEVEL => REG_Analog_CONFIG_TRIGGER_LEVEL_WR,
		CONFIG_PRETRIGGER => REG_Analog_CONFIG_PRETRIGGER_WR,
		CONFIG_DECIMATOR => REG_Analog_CONFIG_DECIMATOR_WR,
		CONFIG_ARM => REG_Analog_CONFIG_ARM_WR
	);


	U50 : xlx_oscilloscope_sync
	Generic map(
		channels => 	24,
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ANALOG => U76_energy_23 & U76_energy_22 & U76_energy_21 & U76_energy_20 & U76_energy_19 & U76_energy_18 & U76_energy_17 & U76_energy_16 & U76_energy_15 & U76_energy_14 & U76_energy_13 & U76_energy_12 & U76_energy_11 & U76_energy_10 & U76_energy_9 & U76_energy_8 & U76_energy_7 & U76_energy_6 & U76_energy_5 & x"0000" & U76_energy_3 & U76_energy_2 & U76_energy_1 & U76_energy_0,
		D0 => U76_valid_23 & U76_valid_22 & U76_valid_21 & U76_valid_20 & U76_valid_19 & U76_valid_18 & U76_valid_17 & U76_valid_16 & U76_valid_15 & U76_valid_14 & U76_valid_13 & U76_valid_12 & U76_valid_11 & U76_valid_10 & U76_valid_9 & U76_valid_8 & U76_valid_7 & U76_valid_6 & U76_valid_5 & U76_valid_4 & U76_valid_3 & U76_valid_2 & U76_valid_1 & U76_valid_0,
		D1 => U76_int_gate_23 & U76_int_gate_22 & U76_int_gate_21 & U76_int_gate_20 & U76_int_gate_19 & U76_int_gate_18 & U76_int_gate_17 & U76_int_gate_16 & U76_int_gate_15 & U76_int_gate_14 & U76_int_gate_13 & U76_int_gate_12 & U76_int_gate_11 & U76_int_gate_10 & U76_int_gate_9 & U76_int_gate_8 & U76_int_gate_7 & U76_int_gate_6 & U76_int_gate_5 & U76_int_gate_4 & U76_int_gate_3 & U76_int_gate_2 & U76_int_gate_1 & U76_int_gate_0,
		D2 => U75_ready_23 & U75_ready_22 & U75_ready_21 & U75_ready_20 & U75_ready_19 & U75_ready_18 & U75_ready_17 & U75_ready_16 & U75_ready_15 & U75_ready_14 & U75_ready_13 & U75_ready_12 & U75_ready_11 & U75_ready_10 & U75_ready_9 & U75_ready_8 & U75_ready_7 & U75_ready_6 & U75_ready_5 & U75_ready_4 & U75_ready_3 & U75_ready_2 & U75_ready_1 & U75_ready_0,
		D3 => "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0",
		TRIG => U44_out,
		BUSY => open,
		CE => "1",
		CLK_WRITE => CLK_ACQ,
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Energies_READ_ADDRESS,
		READ_DATA => BUS_Energies_READ_DATA,
		READ_DATAVALID => BUS_Energies_VLD,
		READ_STATUS => REG_Energies_READ_STATUS_RD,
		READ_POSITION => REG_Energies_READ_POSITION_RD,
		CONFIG_TRIGGER_MODE => REG_Energies_CONFIG_TRIGGER_MODE_WR,
		CONFIG_TRIGGER_LEVEL => REG_Energies_CONFIG_TRIGGER_LEVEL_WR,
		CONFIG_PRETRIGGER => REG_Energies_CONFIG_PRETRIGGER_WR,
		CONFIG_DECIMATOR => REG_Energies_CONFIG_DECIMATOR_WR,
		CONFIG_ARM => REG_Energies_CONFIG_ARM_WR
	);

U51_out <= U40_out(15 downto 0);
U52_CH0 <= REG_disable_det_CH0_WR( 0 downto 0 );
U52_CH1 <= REG_disable_det_CH1_WR( 0 downto 0 );
U52_CH2 <= REG_disable_det_CH2_WR( 0 downto 0 );
U52_CH3 <= REG_disable_det_CH3_WR( 0 downto 0 );
U52_CH4 <= REG_disable_det_CH4_WR( 0 downto 0 );
U52_CH5 <= REG_disable_det_CH5_WR( 0 downto 0 );
U52_CH6 <= REG_disable_det_CH6_WR( 0 downto 0 );
U52_CH7 <= REG_disable_det_CH7_WR( 0 downto 0 );
U52_CH8 <= REG_disable_det_CH8_WR( 0 downto 0 );
U52_CH9 <= REG_disable_det_CH9_WR( 0 downto 0 );
U52_CH10 <= REG_disable_det_CH10_WR( 0 downto 0 );
U52_CH11 <= REG_disable_det_CH11_WR( 0 downto 0 );
U52_CH12 <= REG_disable_det_CH12_WR( 0 downto 0 );
U52_CH13 <= REG_disable_det_CH13_WR( 0 downto 0 );
U52_CH14 <= REG_disable_det_CH14_WR( 0 downto 0 );
U52_CH15 <= REG_disable_det_CH15_WR( 0 downto 0 );
U52_CH16 <= REG_disable_det_CH16_WR( 0 downto 0 );
U52_CH17 <= REG_disable_det_CH17_WR( 0 downto 0 );
U52_CH18 <= REG_disable_det_CH18_WR( 0 downto 0 );
U52_CH19 <= REG_disable_det_CH19_WR( 0 downto 0 );
U52_CH20 <= REG_disable_det_CH20_WR( 0 downto 0 );
U52_CH21 <= REG_disable_det_CH21_WR( 0 downto 0 );
U52_CH22 <= REG_disable_det_CH22_WR( 0 downto 0 );
U52_CH23 <= REG_disable_det_CH23_WR( 0 downto 0 );
U53_CH0 <= REG_top_CH0_WR( 15 downto 0 );
U53_CH1 <= REG_top_CH1_WR( 15 downto 0 );
U53_CH2 <= REG_top_CH2_WR( 15 downto 0 );
U53_CH3 <= REG_top_CH3_WR( 15 downto 0 );
U53_CH4 <= REG_top_CH4_WR( 15 downto 0 );
U53_CH5 <= REG_top_CH5_WR( 15 downto 0 );
U53_CH6 <= REG_top_CH6_WR( 15 downto 0 );
U53_CH7 <= REG_top_CH7_WR( 15 downto 0 );
U53_CH8 <= REG_top_CH8_WR( 15 downto 0 );
U53_CH9 <= REG_top_CH9_WR( 15 downto 0 );
U53_CH10 <= REG_top_CH10_WR( 15 downto 0 );
U53_CH11 <= REG_top_CH11_WR( 15 downto 0 );
U53_CH12 <= REG_top_CH12_WR( 15 downto 0 );
U53_CH13 <= REG_top_CH13_WR( 15 downto 0 );
U53_CH14 <= REG_top_CH14_WR( 15 downto 0 );
U53_CH15 <= REG_top_CH15_WR( 15 downto 0 );
U53_CH16 <= REG_top_CH16_WR( 15 downto 0 );
U53_CH17 <= REG_top_CH17_WR( 15 downto 0 );
U53_CH18 <= REG_top_CH18_WR( 15 downto 0 );
U53_CH19 <= REG_top_CH19_WR( 15 downto 0 );
U53_CH20 <= REG_top_CH20_WR( 15 downto 0 );
U53_CH21 <= REG_top_CH21_WR( 15 downto 0 );
U53_CH22 <= REG_top_CH22_WR( 15 downto 0 );
U53_CH23 <= REG_top_CH23_WR( 15 downto 0 );
U54_CH0 <= REG_thrsh_CH0_WR( 15 downto 0 );
U54_CH1 <= REG_thrsh_CH1_WR( 15 downto 0 );
U54_CH2 <= REG_thrsh_CH2_WR( 15 downto 0 );
U54_CH3 <= REG_thrsh_CH3_WR( 15 downto 0 );
U54_CH4 <= REG_thrsh_CH4_WR( 15 downto 0 );
U54_CH5 <= REG_thrsh_CH5_WR( 15 downto 0 );
U54_CH6 <= REG_thrsh_CH6_WR( 15 downto 0 );
U54_CH7 <= REG_thrsh_CH7_WR( 15 downto 0 );
U54_CH8 <= REG_thrsh_CH8_WR( 15 downto 0 );
U54_CH9 <= REG_thrsh_CH9_WR( 15 downto 0 );
U54_CH10 <= REG_thrsh_CH10_WR( 15 downto 0 );
U54_CH11 <= REG_thrsh_CH11_WR( 15 downto 0 );
U54_CH12 <= REG_thrsh_CH12_WR( 15 downto 0 );
U54_CH13 <= REG_thrsh_CH13_WR( 15 downto 0 );
U54_CH14 <= REG_thrsh_CH14_WR( 15 downto 0 );
U54_CH15 <= REG_thrsh_CH15_WR( 15 downto 0 );
U54_CH16 <= REG_thrsh_CH16_WR( 15 downto 0 );
U54_CH17 <= REG_thrsh_CH17_WR( 15 downto 0 );
U54_CH18 <= REG_thrsh_CH18_WR( 15 downto 0 );
U54_CH19 <= REG_thrsh_CH19_WR( 15 downto 0 );
U54_CH20 <= REG_thrsh_CH20_WR( 15 downto 0 );
U54_CH21 <= REG_thrsh_CH21_WR( 15 downto 0 );
U54_CH22 <= REG_thrsh_CH22_WR( 15 downto 0 );
U54_CH23 <= REG_thrsh_CH23_WR( 15 downto 0 );

	U55 : d_latch
	Generic map(
		IN_SIZE => 	16,
		EDGE => 	"rising"
	)
	PORT MAP(
		a => U36_out,
		CE => U44_out(0),
		clk => U34_clk(0),
		reset => U56_OUT(0),
		reset_val => x"0000",
		b => U55_OUT
	);

U56_OUT <= NOT U26_out_0;
U57_out <= U58_counts(15 downto 0);
U58 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U26_int, 
        CE => "1",
        CLK => U34_clk,
        SIGIN => U44_out,
        ENABLE => "1",
        COUNTER => U58_counts,
        OVERFLOW => open
    );

	U59 : xlx_oscilloscope_sync
	Generic map(
		channels => 	32,
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ANALOG => x"0000" & x"0000" & x"0000" & x"0000" & x"0000" & x"0000" & x"0000" & x"0000" & U23_A23 & U22_A22 & U21_A21 & U20_A20 & U19_A19 & U18_A18 & U17_A17 & U16_A16 & U15_A15 & U14_A14 & U13_A13 & U12_A12 & U11_A11 & U10_A10 & U9_A9 & U8_A8 & U7_A7 & U6_A6 & U5_A5 & U4_A4 & U3_A3 & U2_A2 & U1_A1 & U0_A0,
		D0 => "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0",
		D1 => "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0",
		D2 => "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0",
		D3 => "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0",
		TRIG => U44_out,
		BUSY => open,
		CE => "1",
		CLK_WRITE => U34_clk,
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_Analog_In_Unflipped_READ_ADDRESS,
		READ_DATA => BUS_Analog_In_Unflipped_READ_DATA,
		READ_DATAVALID => BUS_Analog_In_Unflipped_VLD,
		READ_STATUS => REG_Analog_In_Unflipped_READ_STATUS_RD,
		READ_POSITION => REG_Analog_In_Unflipped_READ_POSITION_RD,
		CONFIG_TRIGGER_MODE => REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR,
		CONFIG_TRIGGER_LEVEL => REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR,
		CONFIG_PRETRIGGER => REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR,
		CONFIG_DECIMATOR => REG_Analog_In_Unflipped_CONFIG_DECIMATOR_WR,
		CONFIG_ARM => REG_Analog_In_Unflipped_CONFIG_ARM_WR
	);


	U60 : U60_UserHDL_Serial_Tx
	PORT MAP(
		clock => U34_clk(0),
		reset => U26_out_0(0),
		Tx_En => U44_out(0),
		pdata_in => U36_out,
		Tx_Done => U60_Tx_Done(0),
		FMData_Out => U60_FMData_Out
	);

SYNC_1_OUT <= U60_FMData_Out;

	U62 : U62_UserHDL_Serial_Rx
	PORT MAP(
		sysclk => U34_clk(0),
		rxclock => U34_clk(0),
		reset => U26_out_0(0),
		FMData_in => U60_FMData_Out(0),
		Clr_Err => '0',
		pdata_out => U62_pdata_out,
		Rx_Done => U62_Rx_Done(0),
		Parity_Err => open
	);

U63_CONST <= std_logic_vector(ieee.numeric_std.resize(ieee.numeric_std.unsigned'(x"4A14A14A"),32));

U64:SCALER
PORT MAP(
    RESET => GlobalReset,
    CE => "1",
    PORT_IN => U34_clk,
    PORT_SCALE => U87_divide,
    PORT_OUT => U64_out
);

	U65 : xlx_oscilloscope_sync
	Generic map(
		channels => 	4,
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ANALOG => x"0000" & U70_out & U71_out & U51_out,
		D0 => "0" & U64_out & U60_FMData_Out & U46_out,
		D1 => U47_OUT & U24_OUT & U28_OUT & U44_out,
		D2 => U84_FIFO_FULL & U84_BUSY & "0" & "0",
		D3 => "0" & "0" & U42_OUT & U60_Tx_Done,
		TRIG => U44_out,
		BUSY => open,
		CE => "1",
		CLK_WRITE => U34_clk,
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_diag_READ_ADDRESS,
		READ_DATA => BUS_diag_READ_DATA,
		READ_DATAVALID => BUS_diag_VLD,
		READ_STATUS => REG_diag_READ_STATUS_RD,
		READ_POSITION => REG_diag_READ_POSITION_RD,
		CONFIG_TRIGGER_MODE => REG_diag_CONFIG_TRIGGER_MODE_WR,
		CONFIG_TRIGGER_LEVEL => REG_diag_CONFIG_TRIGGER_LEVEL_WR,
		CONFIG_PRETRIGGER => REG_diag_CONFIG_PRETRIGGER_WR,
		CONFIG_DECIMATOR => REG_diag_CONFIG_DECIMATOR_WR,
		CONFIG_ARM => REG_diag_CONFIG_ARM_WR
	);

SYNC_2_OUT <= U46_out;
SYNC_0_OUT <= U64_out;
U68_CH0 <= REG_base_CH0_WR( 15 downto 0 );
U68_CH1 <= REG_base_CH1_WR( 15 downto 0 );
U68_CH2 <= REG_base_CH2_WR( 15 downto 0 );
U68_CH3 <= REG_base_CH3_WR( 15 downto 0 );
U68_CH4 <= REG_base_CH4_WR( 15 downto 0 );
U68_CH5 <= REG_base_CH5_WR( 15 downto 0 );
U68_CH6 <= REG_base_CH6_WR( 15 downto 0 );
U68_CH7 <= REG_base_CH7_WR( 15 downto 0 );
U68_CH8 <= REG_base_CH8_WR( 15 downto 0 );
U68_CH9 <= REG_base_CH9_WR( 15 downto 0 );
U68_CH10 <= REG_base_CH10_WR( 15 downto 0 );
U68_CH11 <= REG_base_CH11_WR( 15 downto 0 );
U68_CH12 <= REG_base_CH12_WR( 15 downto 0 );
U68_CH13 <= REG_base_CH13_WR( 15 downto 0 );
U68_CH14 <= REG_base_CH14_WR( 15 downto 0 );
U68_CH15 <= REG_base_CH15_WR( 15 downto 0 );
U68_CH16 <= REG_base_CH16_WR( 15 downto 0 );
U68_CH17 <= REG_base_CH17_WR( 15 downto 0 );
U68_CH18 <= REG_base_CH18_WR( 15 downto 0 );
U68_CH19 <= REG_base_CH19_WR( 15 downto 0 );
U68_CH20 <= REG_base_CH20_WR( 15 downto 0 );
U68_CH21 <= REG_base_CH21_WR( 15 downto 0 );
U68_CH22 <= REG_base_CH22_WR( 15 downto 0 );
U68_CH23 <= REG_base_CH23_WR( 15 downto 0 );

	U69 : xlx_oscilloscope_sync
	Generic map(
		channels => 	24,
		memLength => 	1024,
		wordWidth => 	16
	)
	PORT MAP(
		ANALOG => U76_baseline_23 & U76_baseline_22 & U76_baseline_21 & U76_baseline_20 & U76_baseline_19 & U76_baseline_18 & U76_baseline_17 & U76_baseline_16 & U76_baseline_15 & U76_baseline_14 & U76_baseline_13 & U76_baseline_12 & U76_baseline_11 & U76_baseline_10 & U76_baseline_9 & U76_baseline_8 & U76_baseline_7 & U76_baseline_6 & U76_baseline_5 & U76_baseline_4 & U76_baseline_3 & U76_baseline_2 & U76_baseline_1 & U76_baseline_0,
		D0 => U76_baseline_valid_23 & U76_baseline_valid_22 & U76_baseline_valid_21 & U76_baseline_valid_20 & U76_baseline_valid_19 & U76_baseline_valid_18 & U76_baseline_valid_17 & U76_baseline_valid_16 & U76_baseline_valid_15 & U76_baseline_valid_14 & U76_baseline_valid_13 & U76_baseline_valid_12 & U76_baseline_valid_11 & U76_baseline_valid_10 & U76_baseline_valid_9 & U76_baseline_valid_8 & U76_baseline_valid_7 & U76_baseline_valid_6 & U76_baseline_valid_5 & U76_baseline_valid_4 & U76_baseline_valid_3 & U76_baseline_valid_2 & U76_baseline_valid_1 & U76_baseline_valid_0,
		D1 => U76_baseline_calculating_23 & U76_baseline_calculating_22 & U76_baseline_calculating_21 & U76_baseline_calculating_20 & U76_baseline_calculating_19 & U76_baseline_calculating_18 & U76_baseline_calculating_17 & U76_baseline_calculating_16 & U76_baseline_calculating_15 & U76_baseline_calculating_14 & U76_baseline_calculating_13 & U76_baseline_calculating_12 & U76_baseline_calculating_11 & U76_baseline_calculating_10 & U76_baseline_calculating_9 & U76_baseline_calculating_8 & U76_baseline_calculating_7 & U76_baseline_calculating_6 & U76_baseline_calculating_5 & U76_baseline_calculating_4 & U76_baseline_calculating_3 & U76_baseline_calculating_2 & U76_baseline_calculating_1 & U76_baseline_calculating_0,
		D2 => "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0",
		D3 => "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0",
		TRIG => U44_out,
		BUSY => open,
		CE => "1",
		CLK_WRITE => U34_clk,
		RESET => "0",
		CLK_READ => BUS_CLK,
		READ_ADDRESS => BUS_baselines_READ_ADDRESS,
		READ_DATA => BUS_baselines_READ_DATA,
		READ_DATAVALID => BUS_baselines_VLD,
		READ_STATUS => REG_baselines_READ_STATUS_RD,
		READ_POSITION => REG_baselines_READ_POSITION_RD,
		CONFIG_TRIGGER_MODE => REG_baselines_CONFIG_TRIGGER_MODE_WR,
		CONFIG_TRIGGER_LEVEL => REG_baselines_CONFIG_TRIGGER_LEVEL_WR,
		CONFIG_PRETRIGGER => REG_baselines_CONFIG_PRETRIGGER_WR,
		CONFIG_DECIMATOR => REG_baselines_CONFIG_DECIMATOR_WR,
		CONFIG_ARM => REG_baselines_CONFIG_ARM_WR
	);

U70_out <= U72_OUT(15 downto 0);
U71_out <= U72_OUT(31 downto 16);

	U72 : d_latch
	Generic map(
		IN_SIZE => 	32,
		EDGE => 	"rising"
	)
	PORT MAP(
		a => U31_out,
		CE => '1',
		clk => U44_out(0),
		reset => U26_int(0),
		reset_val => x"00000000",
		b => U72_OUT
	);

U73_time <= REG_int_time_WR( 15 downto 0 );
U73_pre <= REG_int_pre_WR( 15 downto 0 );
U73_base <= REG_int_base_WR( 7 downto 0 );
U73_scale <= REG_int_scale_WR( 15 downto 0 );
U74_OUT <= U78_trig_nodelay_0 OR U78_trig_nodelay_1 OR U78_trig_nodelay_2 OR U78_trig_nodelay_3 OR U78_trig_nodelay_4 OR U78_trig_nodelay_5 OR U78_trig_nodelay_6 OR U78_trig_nodelay_7 OR U78_trig_nodelay_8 OR U78_trig_nodelay_9 OR U78_trig_nodelay_10 OR U78_trig_nodelay_11 OR U78_trig_nodelay_12 OR U78_trig_nodelay_13 OR U78_trig_nodelay_14 OR U78_trig_nodelay_15 OR U78_trig_nodelay_16 OR U78_trig_nodelay_17 OR U78_trig_nodelay_18 OR U78_trig_nodelay_19 OR U78_trig_nodelay_20 OR U78_trig_nodelay_21 OR U78_trig_nodelay_22 OR U78_trig_nodelay_23;

U75_0:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_0,
	max_out => U75_max_out_0,
	ready => U75_ready_0,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_1:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_1,
	max_out => U75_max_out_1,
	ready => U75_ready_1,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_2:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_2,
	max_out => U75_max_out_2,
	ready => U75_ready_2,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_3:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_3,
	max_out => U75_max_out_3,
	ready => U75_ready_3,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_4:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_4,
	max_out => U75_max_out_4,
	ready => U75_ready_4,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_5:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_5,
	max_out => U75_max_out_5,
	ready => U75_ready_5,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_6:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_6,
	max_out => U75_max_out_6,
	ready => U75_ready_6,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_7:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_7,
	max_out => U75_max_out_7,
	ready => U75_ready_7,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_8:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_8,
	max_out => U75_max_out_8,
	ready => U75_ready_8,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_9:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_9,
	max_out => U75_max_out_9,
	ready => U75_ready_9,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_10:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_10,
	max_out => U75_max_out_10,
	ready => U75_ready_10,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_11:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_11,
	max_out => U75_max_out_11,
	ready => U75_ready_11,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_12:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_12,
	max_out => U75_max_out_12,
	ready => U75_ready_12,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_13:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_13,
	max_out => U75_max_out_13,
	ready => U75_ready_13,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_14:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_14,
	max_out => U75_max_out_14,
	ready => U75_ready_14,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_15:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_15,
	max_out => U75_max_out_15,
	ready => U75_ready_15,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_16:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_16,
	max_out => U75_max_out_16,
	ready => U75_ready_16,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_17:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_17,
	max_out => U75_max_out_17,
	ready => U75_ready_17,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_18:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_18,
	max_out => U75_max_out_18,
	ready => U75_ready_18,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_19:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_19,
	max_out => U75_max_out_19,
	ready => U75_ready_19,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_20:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_20,
	max_out => U75_max_out_20,
	ready => U75_ready_20,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_21:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_21,
	max_out => U75_max_out_21,
	ready => U75_ready_21,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_22:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_22,
	max_out => U75_max_out_22,
	ready => U75_ready_22,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U75_23:SUBPAGE_PulseHeightFinder
PORT MAP(
	analog_in => U78_ANALOGOUT_23,
	max_out => U75_max_out_23,
	ready => U75_ready_23,
	window => U73_time,
	trig => U74_OUT,
	pre_int => U73_pre,
	trig_delay => U85_delay,
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
	async_clk => async_clk);

U76_0:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_0,
	base => U68_CH0,
	energy => U76_energy_0,
	valid => U76_valid_0,
	int_gate => U76_int_gate_0,
	baseline => U76_baseline_0,
	baseline_valid => U76_baseline_valid_0,
	baseline_calculating => U76_baseline_calculating_0,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_1:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_1,
	base => U68_CH1,
	energy => U76_energy_1,
	valid => U76_valid_1,
	int_gate => U76_int_gate_1,
	baseline => U76_baseline_1,
	baseline_valid => U76_baseline_valid_1,
	baseline_calculating => U76_baseline_calculating_1,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_2:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_2,
	base => U68_CH2,
	energy => U76_energy_2,
	valid => U76_valid_2,
	int_gate => U76_int_gate_2,
	baseline => U76_baseline_2,
	baseline_valid => U76_baseline_valid_2,
	baseline_calculating => U76_baseline_calculating_2,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_3:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_3,
	base => U68_CH3,
	energy => U76_energy_3,
	valid => U76_valid_3,
	int_gate => U76_int_gate_3,
	baseline => U76_baseline_3,
	baseline_valid => U76_baseline_valid_3,
	baseline_calculating => U76_baseline_calculating_3,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_4:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_4,
	base => U68_CH4,
	energy => U76_energy_4,
	valid => U76_valid_4,
	int_gate => U76_int_gate_4,
	baseline => U76_baseline_4,
	baseline_valid => U76_baseline_valid_4,
	baseline_calculating => U76_baseline_calculating_4,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_5:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_5,
	base => U68_CH5,
	energy => U76_energy_5,
	valid => U76_valid_5,
	int_gate => U76_int_gate_5,
	baseline => U76_baseline_5,
	baseline_valid => U76_baseline_valid_5,
	baseline_calculating => U76_baseline_calculating_5,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_6:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_6,
	base => U68_CH6,
	energy => U76_energy_6,
	valid => U76_valid_6,
	int_gate => U76_int_gate_6,
	baseline => U76_baseline_6,
	baseline_valid => U76_baseline_valid_6,
	baseline_calculating => U76_baseline_calculating_6,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_7:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_7,
	base => U68_CH7,
	energy => U76_energy_7,
	valid => U76_valid_7,
	int_gate => U76_int_gate_7,
	baseline => U76_baseline_7,
	baseline_valid => U76_baseline_valid_7,
	baseline_calculating => U76_baseline_calculating_7,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_8:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_8,
	base => U68_CH8,
	energy => U76_energy_8,
	valid => U76_valid_8,
	int_gate => U76_int_gate_8,
	baseline => U76_baseline_8,
	baseline_valid => U76_baseline_valid_8,
	baseline_calculating => U76_baseline_calculating_8,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_9:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_9,
	base => U68_CH9,
	energy => U76_energy_9,
	valid => U76_valid_9,
	int_gate => U76_int_gate_9,
	baseline => U76_baseline_9,
	baseline_valid => U76_baseline_valid_9,
	baseline_calculating => U76_baseline_calculating_9,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_10:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_10,
	base => U68_CH10,
	energy => U76_energy_10,
	valid => U76_valid_10,
	int_gate => U76_int_gate_10,
	baseline => U76_baseline_10,
	baseline_valid => U76_baseline_valid_10,
	baseline_calculating => U76_baseline_calculating_10,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_11:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_11,
	base => U68_CH11,
	energy => U76_energy_11,
	valid => U76_valid_11,
	int_gate => U76_int_gate_11,
	baseline => U76_baseline_11,
	baseline_valid => U76_baseline_valid_11,
	baseline_calculating => U76_baseline_calculating_11,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_12:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_12,
	base => U68_CH12,
	energy => U76_energy_12,
	valid => U76_valid_12,
	int_gate => U76_int_gate_12,
	baseline => U76_baseline_12,
	baseline_valid => U76_baseline_valid_12,
	baseline_calculating => U76_baseline_calculating_12,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_13:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_13,
	base => U68_CH13,
	energy => U76_energy_13,
	valid => U76_valid_13,
	int_gate => U76_int_gate_13,
	baseline => U76_baseline_13,
	baseline_valid => U76_baseline_valid_13,
	baseline_calculating => U76_baseline_calculating_13,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_14:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_14,
	base => U68_CH14,
	energy => U76_energy_14,
	valid => U76_valid_14,
	int_gate => U76_int_gate_14,
	baseline => U76_baseline_14,
	baseline_valid => U76_baseline_valid_14,
	baseline_calculating => U76_baseline_calculating_14,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_15:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_15,
	base => U68_CH15,
	energy => U76_energy_15,
	valid => U76_valid_15,
	int_gate => U76_int_gate_15,
	baseline => U76_baseline_15,
	baseline_valid => U76_baseline_valid_15,
	baseline_calculating => U76_baseline_calculating_15,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_16:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_16,
	base => U68_CH16,
	energy => U76_energy_16,
	valid => U76_valid_16,
	int_gate => U76_int_gate_16,
	baseline => U76_baseline_16,
	baseline_valid => U76_baseline_valid_16,
	baseline_calculating => U76_baseline_calculating_16,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_17:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_17,
	base => U68_CH17,
	energy => U76_energy_17,
	valid => U76_valid_17,
	int_gate => U76_int_gate_17,
	baseline => U76_baseline_17,
	baseline_valid => U76_baseline_valid_17,
	baseline_calculating => U76_baseline_calculating_17,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_18:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_18,
	base => U68_CH18,
	energy => U76_energy_18,
	valid => U76_valid_18,
	int_gate => U76_int_gate_18,
	baseline => U76_baseline_18,
	baseline_valid => U76_baseline_valid_18,
	baseline_calculating => U76_baseline_calculating_18,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_19:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_19,
	base => U68_CH19,
	energy => U76_energy_19,
	valid => U76_valid_19,
	int_gate => U76_int_gate_19,
	baseline => U76_baseline_19,
	baseline_valid => U76_baseline_valid_19,
	baseline_calculating => U76_baseline_calculating_19,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_20:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_20,
	base => U68_CH20,
	energy => U76_energy_20,
	valid => U76_valid_20,
	int_gate => U76_int_gate_20,
	baseline => U76_baseline_20,
	baseline_valid => U76_baseline_valid_20,
	baseline_calculating => U76_baseline_calculating_20,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_21:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_21,
	base => U68_CH21,
	energy => U76_energy_21,
	valid => U76_valid_21,
	int_gate => U76_int_gate_21,
	baseline => U76_baseline_21,
	baseline_valid => U76_baseline_valid_21,
	baseline_calculating => U76_baseline_calculating_21,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_22:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_22,
	base => U68_CH22,
	energy => U76_energy_22,
	valid => U76_valid_22,
	int_gate => U76_int_gate_22,
	baseline => U76_baseline_22,
	baseline_valid => U76_baseline_valid_22,
	baseline_calculating => U76_baseline_calculating_22,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U76_23:SUBPAGE_ChargeIntegrator
PORT MAP(
	analog_in => U78_ANALOGOUT_23,
	base => U68_CH23,
	energy => U76_energy_23,
	valid => U76_valid_23,
	int_gate => U76_int_gate_23,
	baseline => U76_baseline_23,
	baseline_valid => U76_baseline_valid_23,
	baseline_calculating => U76_baseline_calculating_23,
	scale => U73_scale,
	pre_int => U73_pre,
	trig => U44_out,
	manual_base => U73_base,
	int_time => U73_time,
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
	async_clk => async_clk);

U77_0:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U0_A0,
	top => U53_CH0,
	TRIGOUT => U77_TRIGOUT_0,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_1:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U1_A1,
	top => U53_CH1,
	TRIGOUT => U77_TRIGOUT_1,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_2:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U2_A2,
	top => U53_CH2,
	TRIGOUT => U77_TRIGOUT_2,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_3:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U3_A3,
	top => U53_CH3,
	TRIGOUT => U77_TRIGOUT_3,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_4:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U4_A4,
	top => U53_CH4,
	TRIGOUT => U77_TRIGOUT_4,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_5:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U5_A5,
	top => U53_CH5,
	TRIGOUT => U77_TRIGOUT_5,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_6:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U6_A6,
	top => U53_CH6,
	TRIGOUT => U77_TRIGOUT_6,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_7:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U7_A7,
	top => U53_CH7,
	TRIGOUT => U77_TRIGOUT_7,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_8:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U8_A8,
	top => U53_CH8,
	TRIGOUT => U77_TRIGOUT_8,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_9:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U9_A9,
	top => U53_CH9,
	TRIGOUT => U77_TRIGOUT_9,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_10:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U10_A10,
	top => U53_CH10,
	TRIGOUT => U77_TRIGOUT_10,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_11:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U11_A11,
	top => U53_CH11,
	TRIGOUT => U77_TRIGOUT_11,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_12:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U12_A12,
	top => U53_CH12,
	TRIGOUT => U77_TRIGOUT_12,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_13:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U13_A13,
	top => U53_CH13,
	TRIGOUT => U77_TRIGOUT_13,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_14:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U14_A14,
	top => U53_CH14,
	TRIGOUT => U77_TRIGOUT_14,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_15:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U15_A15,
	top => U53_CH15,
	TRIGOUT => U77_TRIGOUT_15,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_16:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U16_A16,
	top => U53_CH16,
	TRIGOUT => U77_TRIGOUT_16,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_17:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U17_A17,
	top => U53_CH17,
	TRIGOUT => U77_TRIGOUT_17,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_18:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U18_A18,
	top => U53_CH18,
	TRIGOUT => U77_TRIGOUT_18,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_19:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U19_A19,
	top => U53_CH19,
	TRIGOUT => U77_TRIGOUT_19,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_20:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U20_A20,
	top => U53_CH20,
	TRIGOUT => U77_TRIGOUT_20,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_21:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U21_A21,
	top => U53_CH21,
	TRIGOUT => U77_TRIGOUT_21,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_22:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U22_A22,
	top => U53_CH22,
	TRIGOUT => U77_TRIGOUT_22,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U77_23:SUBPAGE_UpperTrigger
PORT MAP(
	AIN => U23_A23,
	top => U53_CH23,
	TRIGOUT => U77_TRIGOUT_23,
	gate => U85_gate_u,
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
	async_clk => async_clk);

U78_0:SUBPAGE_Trigger
PORT MAP(
	AIN => U0_A0,
	auto_baseline => U76_baseline_0,
	thrsh => U54_CH0,
	disable_det => U52_CH0,
	ANALOGOUT => U78_ANALOGOUT_0,
	TRIGOUT => U78_TRIGOUT_0,
	trig_nodelay => U78_trig_nodelay_0,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_1:SUBPAGE_Trigger
PORT MAP(
	AIN => U1_A1,
	auto_baseline => U76_baseline_1,
	thrsh => U54_CH1,
	disable_det => U52_CH1,
	ANALOGOUT => U78_ANALOGOUT_1,
	TRIGOUT => U78_TRIGOUT_1,
	trig_nodelay => U78_trig_nodelay_1,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_2:SUBPAGE_Trigger
PORT MAP(
	AIN => U2_A2,
	auto_baseline => U76_baseline_2,
	thrsh => U54_CH2,
	disable_det => U52_CH2,
	ANALOGOUT => U78_ANALOGOUT_2,
	TRIGOUT => U78_TRIGOUT_2,
	trig_nodelay => U78_trig_nodelay_2,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_3:SUBPAGE_Trigger
PORT MAP(
	AIN => U3_A3,
	auto_baseline => U76_baseline_3,
	thrsh => U54_CH3,
	disable_det => U52_CH3,
	ANALOGOUT => U78_ANALOGOUT_3,
	TRIGOUT => U78_TRIGOUT_3,
	trig_nodelay => U78_trig_nodelay_3,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_4:SUBPAGE_Trigger
PORT MAP(
	AIN => U4_A4,
	auto_baseline => U76_baseline_4,
	thrsh => U54_CH4,
	disable_det => U52_CH4,
	ANALOGOUT => U78_ANALOGOUT_4,
	TRIGOUT => U78_TRIGOUT_4,
	trig_nodelay => U78_trig_nodelay_4,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_5:SUBPAGE_Trigger
PORT MAP(
	AIN => U5_A5,
	auto_baseline => U76_baseline_5,
	thrsh => U54_CH5,
	disable_det => U52_CH5,
	ANALOGOUT => U78_ANALOGOUT_5,
	TRIGOUT => U78_TRIGOUT_5,
	trig_nodelay => U78_trig_nodelay_5,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_6:SUBPAGE_Trigger
PORT MAP(
	AIN => U6_A6,
	auto_baseline => U76_baseline_6,
	thrsh => U54_CH6,
	disable_det => U52_CH6,
	ANALOGOUT => U78_ANALOGOUT_6,
	TRIGOUT => U78_TRIGOUT_6,
	trig_nodelay => U78_trig_nodelay_6,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_7:SUBPAGE_Trigger
PORT MAP(
	AIN => U7_A7,
	auto_baseline => U76_baseline_7,
	thrsh => U54_CH7,
	disable_det => U52_CH7,
	ANALOGOUT => U78_ANALOGOUT_7,
	TRIGOUT => U78_TRIGOUT_7,
	trig_nodelay => U78_trig_nodelay_7,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_8:SUBPAGE_Trigger
PORT MAP(
	AIN => U8_A8,
	auto_baseline => U76_baseline_8,
	thrsh => U54_CH8,
	disable_det => U52_CH8,
	ANALOGOUT => U78_ANALOGOUT_8,
	TRIGOUT => U78_TRIGOUT_8,
	trig_nodelay => U78_trig_nodelay_8,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_9:SUBPAGE_Trigger
PORT MAP(
	AIN => U9_A9,
	auto_baseline => U76_baseline_9,
	thrsh => U54_CH9,
	disable_det => U52_CH9,
	ANALOGOUT => U78_ANALOGOUT_9,
	TRIGOUT => U78_TRIGOUT_9,
	trig_nodelay => U78_trig_nodelay_9,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_10:SUBPAGE_Trigger
PORT MAP(
	AIN => U10_A10,
	auto_baseline => U76_baseline_10,
	thrsh => U54_CH10,
	disable_det => U52_CH10,
	ANALOGOUT => U78_ANALOGOUT_10,
	TRIGOUT => U78_TRIGOUT_10,
	trig_nodelay => U78_trig_nodelay_10,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_11:SUBPAGE_Trigger
PORT MAP(
	AIN => U11_A11,
	auto_baseline => U76_baseline_11,
	thrsh => U54_CH11,
	disable_det => U52_CH11,
	ANALOGOUT => U78_ANALOGOUT_11,
	TRIGOUT => U78_TRIGOUT_11,
	trig_nodelay => U78_trig_nodelay_11,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_12:SUBPAGE_Trigger
PORT MAP(
	AIN => U12_A12,
	auto_baseline => U76_baseline_12,
	thrsh => U54_CH12,
	disable_det => U52_CH12,
	ANALOGOUT => U78_ANALOGOUT_12,
	TRIGOUT => U78_TRIGOUT_12,
	trig_nodelay => U78_trig_nodelay_12,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_13:SUBPAGE_Trigger
PORT MAP(
	AIN => U13_A13,
	auto_baseline => U76_baseline_13,
	thrsh => U54_CH13,
	disable_det => U52_CH13,
	ANALOGOUT => U78_ANALOGOUT_13,
	TRIGOUT => U78_TRIGOUT_13,
	trig_nodelay => U78_trig_nodelay_13,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_14:SUBPAGE_Trigger
PORT MAP(
	AIN => U14_A14,
	auto_baseline => U76_baseline_14,
	thrsh => U54_CH14,
	disable_det => U52_CH14,
	ANALOGOUT => U78_ANALOGOUT_14,
	TRIGOUT => U78_TRIGOUT_14,
	trig_nodelay => U78_trig_nodelay_14,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_15:SUBPAGE_Trigger
PORT MAP(
	AIN => U15_A15,
	auto_baseline => U76_baseline_15,
	thrsh => U54_CH15,
	disable_det => U52_CH15,
	ANALOGOUT => U78_ANALOGOUT_15,
	TRIGOUT => U78_TRIGOUT_15,
	trig_nodelay => U78_trig_nodelay_15,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_16:SUBPAGE_Trigger
PORT MAP(
	AIN => U16_A16,
	auto_baseline => U76_baseline_16,
	thrsh => U54_CH16,
	disable_det => U52_CH16,
	ANALOGOUT => U78_ANALOGOUT_16,
	TRIGOUT => U78_TRIGOUT_16,
	trig_nodelay => U78_trig_nodelay_16,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_17:SUBPAGE_Trigger
PORT MAP(
	AIN => U17_A17,
	auto_baseline => U76_baseline_17,
	thrsh => U54_CH17,
	disable_det => U52_CH17,
	ANALOGOUT => U78_ANALOGOUT_17,
	TRIGOUT => U78_TRIGOUT_17,
	trig_nodelay => U78_trig_nodelay_17,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_18:SUBPAGE_Trigger
PORT MAP(
	AIN => U18_A18,
	auto_baseline => U76_baseline_18,
	thrsh => U54_CH18,
	disable_det => U52_CH18,
	ANALOGOUT => U78_ANALOGOUT_18,
	TRIGOUT => U78_TRIGOUT_18,
	trig_nodelay => U78_trig_nodelay_18,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_19:SUBPAGE_Trigger
PORT MAP(
	AIN => U19_A19,
	auto_baseline => U76_baseline_19,
	thrsh => U54_CH19,
	disable_det => U52_CH19,
	ANALOGOUT => U78_ANALOGOUT_19,
	TRIGOUT => U78_TRIGOUT_19,
	trig_nodelay => U78_trig_nodelay_19,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_20:SUBPAGE_Trigger
PORT MAP(
	AIN => U20_A20,
	auto_baseline => U76_baseline_20,
	thrsh => U54_CH20,
	disable_det => U52_CH20,
	ANALOGOUT => U78_ANALOGOUT_20,
	TRIGOUT => U78_TRIGOUT_20,
	trig_nodelay => U78_trig_nodelay_20,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_21:SUBPAGE_Trigger
PORT MAP(
	AIN => U21_A21,
	auto_baseline => U76_baseline_21,
	thrsh => U54_CH21,
	disable_det => U52_CH21,
	ANALOGOUT => U78_ANALOGOUT_21,
	TRIGOUT => U78_TRIGOUT_21,
	trig_nodelay => U78_trig_nodelay_21,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_22:SUBPAGE_Trigger
PORT MAP(
	AIN => U22_A22,
	auto_baseline => U76_baseline_22,
	thrsh => U54_CH22,
	disable_det => U52_CH22,
	ANALOGOUT => U78_ANALOGOUT_22,
	TRIGOUT => U78_TRIGOUT_22,
	trig_nodelay => U78_trig_nodelay_22,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U78_23:SUBPAGE_Trigger
PORT MAP(
	AIN => U23_A23,
	auto_baseline => U76_baseline_23,
	thrsh => U54_CH23,
	disable_det => U52_CH23,
	ANALOGOUT => U78_ANALOGOUT_23,
	TRIGOUT => U78_TRIGOUT_23,
	trig_nodelay => U78_trig_nodelay_23,
	inhib => U73_time,
	baseline => U73_base,
	gate => U85_gate_l,
	delay => U85_delay,
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
	async_clk => async_clk);

U79_0:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_0,
	saturated => U79_saturated_0,
	gate => U73_time,
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
	async_clk => async_clk);

U79_1:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_1,
	saturated => U79_saturated_1,
	gate => U73_time,
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
	async_clk => async_clk);

U79_2:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_2,
	saturated => U79_saturated_2,
	gate => U73_time,
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
	async_clk => async_clk);

U79_3:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_3,
	saturated => U79_saturated_3,
	gate => U73_time,
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
	async_clk => async_clk);

U79_4:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_4,
	saturated => U79_saturated_4,
	gate => U73_time,
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
	async_clk => async_clk);

U79_5:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_5,
	saturated => U79_saturated_5,
	gate => U73_time,
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
	async_clk => async_clk);

U79_6:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_6,
	saturated => U79_saturated_6,
	gate => U73_time,
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
	async_clk => async_clk);

U79_7:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_7,
	saturated => U79_saturated_7,
	gate => U73_time,
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
	async_clk => async_clk);

U79_8:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_8,
	saturated => U79_saturated_8,
	gate => U73_time,
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
	async_clk => async_clk);

U79_9:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_9,
	saturated => U79_saturated_9,
	gate => U73_time,
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
	async_clk => async_clk);

U79_10:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_10,
	saturated => U79_saturated_10,
	gate => U73_time,
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
	async_clk => async_clk);

U79_11:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_11,
	saturated => U79_saturated_11,
	gate => U73_time,
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
	async_clk => async_clk);

U79_12:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_12,
	saturated => U79_saturated_12,
	gate => U73_time,
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
	async_clk => async_clk);

U79_13:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_13,
	saturated => U79_saturated_13,
	gate => U73_time,
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
	async_clk => async_clk);

U79_14:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_14,
	saturated => U79_saturated_14,
	gate => U73_time,
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
	async_clk => async_clk);

U79_15:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_15,
	saturated => U79_saturated_15,
	gate => U73_time,
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
	async_clk => async_clk);

U79_16:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_16,
	saturated => U79_saturated_16,
	gate => U73_time,
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
	async_clk => async_clk);

U79_17:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_17,
	saturated => U79_saturated_17,
	gate => U73_time,
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
	async_clk => async_clk);

U79_18:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_18,
	saturated => U79_saturated_18,
	gate => U73_time,
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
	async_clk => async_clk);

U79_19:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_19,
	saturated => U79_saturated_19,
	gate => U73_time,
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
	async_clk => async_clk);

U79_20:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_20,
	saturated => U79_saturated_20,
	gate => U73_time,
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
	async_clk => async_clk);

U79_21:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_21,
	saturated => U79_saturated_21,
	gate => U73_time,
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
	async_clk => async_clk);

U79_22:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_22,
	saturated => U79_saturated_22,
	gate => U73_time,
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
	async_clk => async_clk);

U79_23:SUBPAGE_SaturationDetector
PORT MAP(
	analog_in => U78_ANALOGOUT_23,
	saturated => U79_saturated_23,
	gate => U73_time,
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
	async_clk => async_clk);
U80_OUT <= U79_saturated_0 OR U79_saturated_1 OR U79_saturated_2 OR U79_saturated_3 OR U79_saturated_4 OR U79_saturated_5 OR U79_saturated_6 OR U79_saturated_7 OR U79_saturated_8 OR U79_saturated_9 OR U79_saturated_10 OR U79_saturated_11 OR U79_saturated_12 OR U79_saturated_13 OR U79_saturated_14 OR U79_saturated_15 OR U79_saturated_16 OR U79_saturated_17 OR U79_saturated_18 OR U79_saturated_19 OR U79_saturated_20 OR U79_saturated_21 OR U79_saturated_22 OR U79_saturated_23;

U81 : block
begin
U81_out <= U82_CONST when U80_OUT = "0000000000000000" else U83_CONST when U80_OUT = "0000000000000001"  else (others=>'0');

end block;
U82_CONST <= std_logic_vector(ieee.numeric_std.resize(ieee.numeric_std.unsigned'(x"C001"),16));
U83_CONST <= std_logic_vector(ieee.numeric_std.resize(ieee.numeric_std.unsigned'(x"5A7C"),16));

	U84 : U84_custompacket
	Generic map(
		memLength => 	32768,
		wordWidth => 	32
	)
	PORT MAP(
		IN_2 => U76_energy_0,
		IN_3 => U76_energy_1,
		IN_4 => U76_energy_2,
		IN_5 => U76_energy_3,
		IN_6 => U76_energy_4,
		IN_7 => U76_energy_5,
		IN_8 => U76_energy_6,
		IN_9 => U76_energy_7,
		IN_10 => U76_energy_8,
		IN_11 => U76_energy_9,
		IN_12 => U76_energy_10,
		IN_13 => U76_energy_11,
		IN_14 => U76_energy_12,
		IN_15 => U76_energy_13,
		IN_16 => U76_energy_14,
		IN_17 => U76_energy_15,
		IN_18 => U76_energy_16,
		IN_19 => U76_energy_17,
		IN_20 => U76_energy_18,
		IN_21 => U76_energy_19,
		IN_22 => U76_energy_20,
		IN_23 => U76_energy_21,
		IN_24 => U76_energy_22,
		IN_25 => U76_energy_23,
		IN_26 => x"0000",
		IN_27 => x"0000",
		IN_28 => x"0000",
		IN_29 => x"0000",
		IN_30 => x"0000",
		IN_31 => x"0000",
		IN_32 => x"0000",
		IN_33 => x"0000",
		IN_34 => U72_OUT,
		IN_35 => U40_out,
		IN_1 => U55_OUT,
		IN_38 => U75_max_out_2,
		IN_40 => U75_max_out_4,
		IN_42 => U75_max_out_6,
		IN_44 => U75_max_out_8,
		IN_46 => U75_max_out_10,
		IN_48 => U75_max_out_12,
		IN_50 => U75_max_out_14,
		IN_52 => U75_max_out_16,
		IN_54 => U75_max_out_18,
		IN_56 => U75_max_out_20,
		IN_58 => U75_max_out_22,
		IN_60 => x"0000",
		IN_62 => x"0000",
		IN_64 => x"0000",
		IN_36 => U75_max_out_0,
		IN_37 => U75_max_out_1,
		IN_39 => U75_max_out_3,
		IN_41 => U75_max_out_5,
		IN_43 => U75_max_out_7,
		IN_45 => U75_max_out_9,
		IN_47 => U75_max_out_11,
		IN_49 => U75_max_out_13,
		IN_51 => U75_max_out_15,
		IN_53 => U75_max_out_17,
		IN_55 => U75_max_out_19,
		IN_57 => U75_max_out_21,
		IN_59 => U75_max_out_23,
		IN_61 => x"0000",
		IN_63 => x"0000",
		IN_65 => x"0000",
		IN_66 => U81_out,
		TRIG => U47_OUT,
		CLK_WRITE => U34_clk,
		SYNC_TRIG => "0",
		SYNC_RESET => "0",
		SYNC_CLK => "0",
		BUSY => U84_BUSY,
		FIFO_FULL => U84_FIFO_FULL,
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

U85_gate_l <= REG_trig_gate_l_WR( 15 downto 0 );
U85_gate_u <= REG_trig_gate_u_WR( 15 downto 0 );
U85_delay <= REG_trig_delay_WR( 15 downto 0 );
U85_mode <= REG_trig_mode_WR( 0 downto 0 );
U86_int <= INT_forcetrig_WR;
U86_out_0 <= REG_forcetrig_WR(15 downto 0);
REG_forcetrig_RD  <= REG_forcetrig_WR;
U87_stamptype <= REG_io_stamptype_WR( 1 downto 0 );
U87_lemo2out <= REG_io_lemo2out_WR( 1 downto 0 );
U87_divide <= conv_integer(REG_io_divide_WR);
REG_FIRMWARE_BUILD <= x"20240828";
REG_FIRMWARE_UNIQUE <= x"361567DF";
FW_STRING_0 <= x"5237364669726D776172650000000000";

end Behavioral;
