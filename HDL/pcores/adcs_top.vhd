----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2016 19:06:35
-- Design Name: 
-- Module Name: adcs_top - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


Library UNISIM;
use UNISIM.vcomponents.all;

entity adcs_top_0 is
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
end adcs_top_0;

architecture Behavioral of adcs_top_0 is
    component clk_wiz_0
    port
    (  
     signal clk_out1 : out std_logic;
     signal clk_out2 : out std_logic;
     signal clk_out3 : out std_logic;
     signal clk_out4 : out std_logic;
     signal clk_out5 : out std_logic;
     signal reset : in std_logic;
     signal locked : out std_logic;
     signal clk_in1  :  in std_logic
    );
    end component;
    
    
    component adc_interface 
        Generic (ADC_A_INV : std_logic_vector(7 downto 0) := x"00";
                 ADC_B_INV : std_logic_vector(7 downto 0) := x"00";
                 IODELAY_GROUP_NAME : string := "ADC_DESER_group"
        );    
        Port ( clock_ref : in STD_LOGIC;
               locked_dcmref : in STD_LOGIC;
               
               sCLK_25 : in std_logic;
               
             
               ADC_BUS_CLK_A_P : in STD_LOGIC;
               ADC_BUS_CLK_A_N : in STD_LOGIC;
               ADC_BUS_CLK_B_P : in STD_LOGIC;
               ADC_BUS_CLK_B_N : in STD_LOGIC;
               
               ADC_BUS_FRAME_A_P : in STD_LOGIC;
               ADC_BUS_FRAME_A_N : in STD_LOGIC;
               ADC_BUS_FRAME_B_P : in STD_LOGIC;
               ADC_BUS_FRAME_B_N : in STD_LOGIC;
               
               ADC_BUS_DATA_A_P: in STD_LOGIC_VECTOR(7 downto 0);
               ADC_BUS_DATA_A_N: in STD_LOGIC_VECTOR(7 downto 0);
               
               ADC_BUS_DATA_B_P: in STD_LOGIC_VECTOR(7 downto 0);
               ADC_BUS_DATA_B_N: in STD_LOGIC_VECTOR(7 downto 0);
               
               eDATA_OUT: out STD_LOGIC_VECTOR((16*8)-1 downto 0);
               
               ext_serdes1_delay : in std_logic_vector(5-1 downto 0);
               ext_serdes1_delay_exc1 : in std_logic_vector(8 downto 0);
               ext_serdes1_delay_exc2 : in std_logic_vector(8 downto 0);
                          
               ext_bitsleep1 : in std_logic_vector(8 downto 0);
               ext_bitsleep2 : in std_logic_vector(8 downto 0);


               eEMPTY : out STD_LOGIC;
               eCLK : in STD_LOGIC;
               eREAD : in STD_LOGIC;
                  
               SMADC_CSA : out std_logic;
               SMADC_CSB : out std_logic;
               SMADC_CLK : out std_logic;
               SMADC_MOSI : out std_logic;
               
               adcCLKout : out std_logic;
               serdes_reset_0 : in STD_LOGIC_VECTOR ( 7 downto 0 )
    
               );
    end component;
    
    
    
    
    signal locked_dcmref : std_logic := '0';
    signal clock_ref : std_logic;       
    
    signal clock_ref1 : std_logic; 
    signal clock_ref2 : std_logic; 
    signal clock_ref3 : std_logic; 
    signal clock_ref4 : std_logic;                  
    signal clk : std_logic;
    
    signal ADC_CS : std_logic;
    
    SIGNAL  eDATA_OUT1 : STD_LOGIC_VECTOR((16*8)-1 downto 0);
    SIGNAL  eEMPTY1    : STD_LOGIC := '0';
    SIGNAL  eREAD1     : STD_LOGIC := '0';
    
    SIGNAL  eDATA_OUT2 : STD_LOGIC_VECTOR((16*8)-1 downto 0);
    SIGNAL  eEMPTY2    : STD_LOGIC := '0';
    SIGNAL  eREAD2     : STD_LOGIC := '0';   
    
    SIGNAL  eDATA_OUT3 : STD_LOGIC_VECTOR((16*8)-1 downto 0);
    SIGNAL  eEMPTY3    : STD_LOGIC := '0';
    SIGNAL  eREAD3     : STD_LOGIC := '0';   
    
    SIGNAL  eDATA_OUT4 : STD_LOGIC_VECTOR((16*8)-1 downto 0);
    SIGNAL  eEMPTY4    : STD_LOGIC := '0';
    SIGNAL  eREAD4     : STD_LOGIC := '0';          
    
    
    signal ext_serdes1_delay_1 : std_logic_vector(5-1 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_1 : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_1 : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_1_a : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_1_a : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_1_b : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_1_b : std_logic_vector(8 downto 0) := (others => '0');


    signal ext_serdes1_delay_2 : std_logic_vector(5-1 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_2 : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_2 : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_2_a : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_2_a : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_2_b : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_2_b : std_logic_vector(8 downto 0) := (others => '0');


    signal ext_serdes1_delay_3 : std_logic_vector(5-1 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_3 : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_3 : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_3_a : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_3_a : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_3_b : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_3_b : std_logic_vector(8 downto 0) := (others => '0');
    

    signal ext_serdes1_delay_4 : std_logic_vector(5-1 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_4 : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_4 : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_4_a : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_4_a : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_serdes1_delay_exc_4_b : std_logic_vector(8 downto 0) := (others => '0');
    signal ext_bitsleep_4_b : std_logic_vector(8 downto 0) := (others => '0');        
             
    attribute keep : string; 

    attribute keep of eEMPTY1: signal is "true";   
    attribute keep of eEMPTY2: signal is "true";          
    attribute keep of eEMPTY3: signal is "true";   
    attribute keep of eEMPTY4: signal is "true";     
    
    signal testADCClk : std_logic; 
    
    signal iCH0 : std_logic_vector(15 downto 0);
    signal iCH1 : std_logic_vector(15 downto 0);
    signal iCH2 : std_logic_vector(15 downto 0);
    signal iCH3 : std_logic_vector(15 downto 0);
    signal iCH4 : std_logic_vector(15 downto 0);
    signal iCH5 : std_logic_vector(15 downto 0);
    signal iCH6 : std_logic_vector(15 downto 0);
    signal iCH7 : std_logic_vector(15 downto 0);
    signal iCH8 : std_logic_vector(15 downto 0);
    signal iCH9 : std_logic_vector(15 downto 0);
    signal iCH10 : std_logic_vector(15 downto 0);
    signal iCH11 : std_logic_vector(15 downto 0);
    signal iCH12 : std_logic_vector(15 downto 0);
    signal iCH13 : std_logic_vector(15 downto 0);
    signal iCH14 : std_logic_vector(15 downto 0);
    signal iCH15 : std_logic_vector(15 downto 0);
    signal iCH16 : std_logic_vector(15 downto 0);
    signal iCH17 : std_logic_vector(15 downto 0);
    signal iCH18 : std_logic_vector(15 downto 0);
    signal iCH19 : std_logic_vector(15 downto 0);
    signal iCH20 : std_logic_vector(15 downto 0);
    signal iCH21 : std_logic_vector(15 downto 0);
    signal iCH22 : std_logic_vector(15 downto 0);
    signal iCH23 : std_logic_vector(15 downto 0);
    signal iCH24 : std_logic_vector(15 downto 0);
    signal iCH25 : std_logic_vector(15 downto 0);
    signal iCH26 : std_logic_vector(15 downto 0);
    signal iCH27 : std_logic_vector(15 downto 0);
    signal iCH28 : std_logic_vector(15 downto 0);
    signal iCH29 : std_logic_vector(15 downto 0);
    signal iCH30 : std_logic_vector(15 downto 0);
    signal iCH31 : std_logic_vector(15 downto 0);
    
    
begin
      
    ext_serdes1_delay_1 <= cfg_serdes1_delay;
    ext_serdes1_delay_2 <= cfg_serdes1_delay;
    ext_serdes1_delay_3 <= cfg_serdes1_delay;
    ext_serdes1_delay_4 <= cfg_serdes1_delay;
    
    ext_serdes1_delay_exc_1_a(1) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"00" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_1_a(2) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"00" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_1_a(3) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"02" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_1_a(4) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"02" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_1_a(5) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"04" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_1_a(6) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"04" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_1_a(7) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"06" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_1_a(8) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"06" and  cfg_abselector = '1' else '0';

    ext_serdes1_delay_exc_1_b(1) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"01" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_1_b(2) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"01" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_1_b(3) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"03" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_1_b(4) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"03" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_1_b(5) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"05" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_1_b(6) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"05" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_1_b(7) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"07" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_1_b(8) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"07" and  cfg_abselector = '1' else '0';

    ext_serdes1_delay_exc_2_a(1) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"08" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_2_a(2) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"08" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_2_a(3) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0A" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_2_a(4) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0A" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_2_a(5) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0C" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_2_a(6) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0C" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_2_a(7) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0E" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_2_a(8) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0E" and  cfg_abselector = '1' else '0';

    ext_serdes1_delay_exc_2_b(1) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"09" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_2_b(2) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"09" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_2_b(3) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0B" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_2_b(4) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0B" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_2_b(5) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0D" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_2_b(6) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0D" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_2_b(7) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0F" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_2_b(8) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"0F" and  cfg_abselector = '1' else '0';

    ext_serdes1_delay_exc_3_a(1) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"10" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_3_a(2) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"10" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_3_a(3) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"12" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_3_a(4) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"12" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_3_a(5) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"14" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_3_a(6) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"14" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_3_a(7) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"16" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_3_a(8) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"16" and  cfg_abselector = '1' else '0';

    ext_serdes1_delay_exc_3_b(1) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"11" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_3_b(2) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"11" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_3_b(3) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"13" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_3_b(4) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"13" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_3_b(5) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"15" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_3_b(6) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"15" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_3_b(7) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"17" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_3_b(8) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"17" and  cfg_abselector = '1' else '0';
    
    ext_serdes1_delay_exc_4_a(1) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"18" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_4_a(2) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"18" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_4_a(3) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1A" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_4_a(4) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1A" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_4_a(5) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1C" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_4_a(6) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1C" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_4_a(7) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1E" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_4_a(8) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1E" and  cfg_abselector = '1' else '0';

    ext_serdes1_delay_exc_4_b(1) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"19" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_4_b(2) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"19" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_4_b(3) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1B" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_4_b(4) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1B" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_4_b(5) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1D" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_4_b(6) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1D" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_4_b(7) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1F" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_4_b(8) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"1F" and  cfg_abselector = '1' else '0';    

        
    ext_serdes1_delay_exc_1_a(0) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"20" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_2_a(0) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"21" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_3_a(0) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"22" and  cfg_abselector = '0' else '0';
    ext_serdes1_delay_exc_4_a(0) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"23" and  cfg_abselector = '0' else '0';
    
    ext_serdes1_delay_exc_1_b(0) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"20" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_2_b(0) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"21" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_3_b(0) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"22" and  cfg_abselector = '1' else '0';
    ext_serdes1_delay_exc_4_b(0) <= cfg_serdes1_delay_exc when cfg_channel_selector =x"23" and  cfg_abselector = '1' else '0';
    
    
    ext_bitsleep_1_a(1) <= cfg_pulse_bitsleep when cfg_channel_selector =x"00" and  cfg_abselector = '0' else '0';
    ext_bitsleep_1_a(2) <= cfg_pulse_bitsleep when cfg_channel_selector =x"00" and  cfg_abselector = '1' else '0';
    ext_bitsleep_1_a(3) <= cfg_pulse_bitsleep when cfg_channel_selector =x"02" and  cfg_abselector = '0' else '0';
    ext_bitsleep_1_a(4) <= cfg_pulse_bitsleep when cfg_channel_selector =x"02" and  cfg_abselector = '1' else '0';
    ext_bitsleep_1_a(5) <= cfg_pulse_bitsleep when cfg_channel_selector =x"04" and  cfg_abselector = '0' else '0';
    ext_bitsleep_1_a(6) <= cfg_pulse_bitsleep when cfg_channel_selector =x"04" and  cfg_abselector = '1' else '0';
    ext_bitsleep_1_a(7) <= cfg_pulse_bitsleep when cfg_channel_selector =x"06" and  cfg_abselector = '0' else '0';
    ext_bitsleep_1_a(8) <= cfg_pulse_bitsleep when cfg_channel_selector =x"06" and  cfg_abselector = '1' else '0';

    ext_bitsleep_1_b(1) <= cfg_pulse_bitsleep when cfg_channel_selector =x"01" and  cfg_abselector = '0' else '0';
    ext_bitsleep_1_b(2) <= cfg_pulse_bitsleep when cfg_channel_selector =x"01" and  cfg_abselector = '1' else '0';
    ext_bitsleep_1_b(3) <= cfg_pulse_bitsleep when cfg_channel_selector =x"03" and  cfg_abselector = '0' else '0';
    ext_bitsleep_1_b(4) <= cfg_pulse_bitsleep when cfg_channel_selector =x"03" and  cfg_abselector = '1' else '0';
    ext_bitsleep_1_b(5) <= cfg_pulse_bitsleep when cfg_channel_selector =x"05" and  cfg_abselector = '0' else '0';
    ext_bitsleep_1_b(6) <= cfg_pulse_bitsleep when cfg_channel_selector =x"05" and  cfg_abselector = '1' else '0';
    ext_bitsleep_1_b(7) <= cfg_pulse_bitsleep when cfg_channel_selector =x"07" and  cfg_abselector = '0' else '0';
    ext_bitsleep_1_b(8) <= cfg_pulse_bitsleep when cfg_channel_selector =x"07" and  cfg_abselector = '1' else '0';

    ext_bitsleep_2_a(1) <= cfg_pulse_bitsleep when cfg_channel_selector =x"08" and  cfg_abselector = '0' else '0';
    ext_bitsleep_2_a(2) <= cfg_pulse_bitsleep when cfg_channel_selector =x"08" and  cfg_abselector = '1' else '0';
    ext_bitsleep_2_a(3) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0A" and  cfg_abselector = '0' else '0';
    ext_bitsleep_2_a(4) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0A" and  cfg_abselector = '1' else '0';
    ext_bitsleep_2_a(5) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0C" and  cfg_abselector = '0' else '0';
    ext_bitsleep_2_a(6) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0C" and  cfg_abselector = '1' else '0';
    ext_bitsleep_2_a(7) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0E" and  cfg_abselector = '0' else '0';
    ext_bitsleep_2_a(8) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0E" and  cfg_abselector = '1' else '0';

    ext_bitsleep_2_b(1) <= cfg_pulse_bitsleep when cfg_channel_selector =x"09" and  cfg_abselector = '0' else '0';
    ext_bitsleep_2_b(2) <= cfg_pulse_bitsleep when cfg_channel_selector =x"09" and  cfg_abselector = '1' else '0';
    ext_bitsleep_2_b(3) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0B" and  cfg_abselector = '0' else '0';
    ext_bitsleep_2_b(4) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0B" and  cfg_abselector = '1' else '0';
    ext_bitsleep_2_b(5) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0D" and  cfg_abselector = '0' else '0';
    ext_bitsleep_2_b(6) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0D" and  cfg_abselector = '1' else '0';
    ext_bitsleep_2_b(7) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0F" and  cfg_abselector = '0' else '0';
    ext_bitsleep_2_b(8) <= cfg_pulse_bitsleep when cfg_channel_selector =x"0F" and  cfg_abselector = '1' else '0';

    ext_bitsleep_3_a(1) <= cfg_pulse_bitsleep when cfg_channel_selector =x"10" and  cfg_abselector = '0' else '0';
    ext_bitsleep_3_a(2) <= cfg_pulse_bitsleep when cfg_channel_selector =x"10" and  cfg_abselector = '1' else '0';
    ext_bitsleep_3_a(3) <= cfg_pulse_bitsleep when cfg_channel_selector =x"12" and  cfg_abselector = '0' else '0';
    ext_bitsleep_3_a(4) <= cfg_pulse_bitsleep when cfg_channel_selector =x"12" and  cfg_abselector = '1' else '0';
    ext_bitsleep_3_a(5) <= cfg_pulse_bitsleep when cfg_channel_selector =x"14" and  cfg_abselector = '0' else '0';
    ext_bitsleep_3_a(6) <= cfg_pulse_bitsleep when cfg_channel_selector =x"14" and  cfg_abselector = '1' else '0';
    ext_bitsleep_3_a(7) <= cfg_pulse_bitsleep when cfg_channel_selector =x"16" and  cfg_abselector = '0' else '0';
    ext_bitsleep_3_a(8) <= cfg_pulse_bitsleep when cfg_channel_selector =x"16" and  cfg_abselector = '1' else '0';

    ext_bitsleep_3_b(1) <= cfg_pulse_bitsleep when cfg_channel_selector =x"11" and  cfg_abselector = '0' else '0';
    ext_bitsleep_3_b(2) <= cfg_pulse_bitsleep when cfg_channel_selector =x"11" and  cfg_abselector = '1' else '0';
    ext_bitsleep_3_b(3) <= cfg_pulse_bitsleep when cfg_channel_selector =x"13" and  cfg_abselector = '0' else '0';
    ext_bitsleep_3_b(4) <= cfg_pulse_bitsleep when cfg_channel_selector =x"13" and  cfg_abselector = '1' else '0';
    ext_bitsleep_3_b(5) <= cfg_pulse_bitsleep when cfg_channel_selector =x"15" and  cfg_abselector = '0' else '0';
    ext_bitsleep_3_b(6) <= cfg_pulse_bitsleep when cfg_channel_selector =x"15" and  cfg_abselector = '1' else '0';
    ext_bitsleep_3_b(7) <= cfg_pulse_bitsleep when cfg_channel_selector =x"17" and  cfg_abselector = '0' else '0';
    ext_bitsleep_3_b(8) <= cfg_pulse_bitsleep when cfg_channel_selector =x"17" and  cfg_abselector = '1' else '0';
    
    ext_bitsleep_4_a(1) <= cfg_pulse_bitsleep when cfg_channel_selector =x"18" and  cfg_abselector = '0' else '0';
    ext_bitsleep_4_a(2) <= cfg_pulse_bitsleep when cfg_channel_selector =x"18" and  cfg_abselector = '1' else '0';
    ext_bitsleep_4_a(3) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1A" and  cfg_abselector = '0' else '0';
    ext_bitsleep_4_a(4) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1A" and  cfg_abselector = '1' else '0';
    ext_bitsleep_4_a(5) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1C" and  cfg_abselector = '0' else '0';
    ext_bitsleep_4_a(6) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1C" and  cfg_abselector = '1' else '0';
    ext_bitsleep_4_a(7) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1E" and  cfg_abselector = '0' else '0';
    ext_bitsleep_4_a(8) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1E" and  cfg_abselector = '1' else '0';

    ext_bitsleep_4_b(1) <= cfg_pulse_bitsleep when cfg_channel_selector =x"19" and  cfg_abselector = '0' else '0';
    ext_bitsleep_4_b(2) <= cfg_pulse_bitsleep when cfg_channel_selector =x"19" and  cfg_abselector = '1' else '0';
    ext_bitsleep_4_b(3) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1B" and  cfg_abselector = '0' else '0';
    ext_bitsleep_4_b(4) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1B" and  cfg_abselector = '1' else '0';
    ext_bitsleep_4_b(5) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1D" and  cfg_abselector = '0' else '0';
    ext_bitsleep_4_b(6) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1D" and  cfg_abselector = '1' else '0';
    ext_bitsleep_4_b(7) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1F" and  cfg_abselector = '0' else '0';
    ext_bitsleep_4_b(8) <= cfg_pulse_bitsleep when cfg_channel_selector =x"1F" and  cfg_abselector = '1' else '0';    

        
    ext_bitsleep_1_a(0) <= cfg_pulse_bitsleep when cfg_channel_selector =x"20" and  cfg_abselector = '0' else '0';
    ext_bitsleep_2_a(0) <= cfg_pulse_bitsleep when cfg_channel_selector =x"21" and  cfg_abselector = '0' else '0';
    ext_bitsleep_3_a(0) <= cfg_pulse_bitsleep when cfg_channel_selector =x"22" and  cfg_abselector = '0' else '0';
    ext_bitsleep_4_a(0) <= cfg_pulse_bitsleep when cfg_channel_selector =x"23" and  cfg_abselector = '0' else '0';
    
    ext_bitsleep_1_b(0) <= cfg_pulse_bitsleep when cfg_channel_selector =x"20" and  cfg_abselector = '1' else '0';
    ext_bitsleep_2_b(0) <= cfg_pulse_bitsleep when cfg_channel_selector =x"21" and  cfg_abselector = '1' else '0';
    ext_bitsleep_3_b(0) <= cfg_pulse_bitsleep when cfg_channel_selector =x"22" and  cfg_abselector = '1' else '0';
    ext_bitsleep_4_b(0) <= cfg_pulse_bitsleep when cfg_channel_selector =x"23" and  cfg_abselector = '1' else '0';    
    
    
    cfg_selected_prw <= iCH0 when   cfg_channel_selector =x"00" else
                        iCH1 when   cfg_channel_selector =x"01" else
                        iCH2 when   cfg_channel_selector =x"02" else
                        iCH3 when   cfg_channel_selector =x"03" else
                        iCH4 when   cfg_channel_selector =x"04" else
                        iCH5 when   cfg_channel_selector =x"05" else
                        iCH6 when   cfg_channel_selector =x"06" else
                        iCH7 when   cfg_channel_selector =x"07" else
                        iCH8 when   cfg_channel_selector =x"08" else
                        iCH9 when   cfg_channel_selector =x"09" else
                        iCH10 when   cfg_channel_selector =x"A" else
                        iCH11 when   cfg_channel_selector =x"B" else
                        iCH12 when   cfg_channel_selector =x"C" else
                        iCH13 when   cfg_channel_selector =x"D" else
                        iCH14 when   cfg_channel_selector =x"E" else
                        iCH15 when   cfg_channel_selector =x"F" else
                        iCH16 when   cfg_channel_selector =x"10" else
                        iCH17 when   cfg_channel_selector =x"11" else
                        iCH18 when   cfg_channel_selector =x"12" else
                        iCH19 when   cfg_channel_selector =x"13" else
                        iCH20 when   cfg_channel_selector =x"14" else
                        iCH21 when   cfg_channel_selector =x"15" else
                        iCH22 when   cfg_channel_selector =x"16" else
                        iCH23 when   cfg_channel_selector =x"17" else
                        iCH24 when   cfg_channel_selector =x"18" else
                        iCH25 when   cfg_channel_selector =x"19" else
                        iCH26 when   cfg_channel_selector =x"1A" else
                        iCH27 when   cfg_channel_selector =x"1B" else
                        iCH28 when   cfg_channel_selector =x"1C" else
                        iCH29 when   cfg_channel_selector =x"1D" else
                        iCH30 when   cfg_channel_selector =x"1E" else
                        iCH31 when   cfg_channel_selector =x"1F" else
                        x"0000";


 

   dcm_ref: clk_wiz_0
port map
 (
   clk_out1 => clock_ref1,
   clk_out2 => clock_ref2,
   clk_out3 => clk,
   clk_out4 => clock_ref3,
   clk_out5 => clock_ref4,
   reset => '0',
   locked =>locked_dcmref ,
   clk_in1  => sCLK_125
 );
 
 
OBUFDS_inst : OBUFDS
 generic map (
    IOSTANDARD => "DEFAULT", -- Specify the output I/O standard
    SLEW => "FAST")          -- Specify the output slew rate
 port map (
    O => ADC_SERVICE_CLK_OUT_P,     
    OB => ADC_SERVICE_CLK_OUT_N,  
    I => sCLK_125      -- Buffer input 
 );
 

SMADC_1_CSA <= ADC_CS;
SMADC_2_CSA <= ADC_CS;
SMADC_3_CSA <= ADC_CS;
SMADC_4_CSA <= ADC_CS;

SMADC_1_CSB <= ADC_CS;
SMADC_2_CSB <= ADC_CS;
SMADC_3_CSB <= ADC_CS;
SMADC_4_CSB <= ADC_CS;
    
adc_interface1:  adc_interface 
generic map(
    ADC_A_INV => "00000000",
    ADC_B_INV => "00000000",
    IODELAY_GROUP_NAME =>  "ADC_DESER_group1"
)
port map
( clock_ref => clock_ref1,
  locked_dcmref => locked_dcmref,
  
  sCLK_25 => clk,
  
  ADC_BUS_CLK_A_P => ADC_1_CLK_A_P,
  ADC_BUS_CLK_A_N => ADC_1_CLK_A_N,
  ADC_BUS_CLK_B_P => ADC_1_CLK_B_P,
  ADC_BUS_CLK_B_N => ADC_1_CLK_B_N,
  
  ADC_BUS_FRAME_A_P => ADC_1_FRAME_A_P,
  ADC_BUS_FRAME_A_N => ADC_1_FRAME_A_N,
  ADC_BUS_FRAME_B_P => ADC_1_FRAME_B_P,
  ADC_BUS_FRAME_B_N => ADC_1_FRAME_B_N,
  
  ADC_BUS_DATA_A_P => ADC_1_DATA_A_P,
  ADC_BUS_DATA_A_N => ADC_1_DATA_A_N,
                          
  ADC_BUS_DATA_B_P => ADC_1_DATA_B_P,
  ADC_BUS_DATA_B_N => ADC_1_DATA_B_N,
  
  eDATA_OUT => eDATA_OUT1,
  eEMPTY => eEMPTY1, 
  eCLK =>  READOUT_CLK, 
  eREAD => eREAD1,
    
  SMADC_CSA => ADC_CS,
  SMADC_CSB => open,
  SMADC_CLK => SMADC_1_CLK,
  SMADC_MOSI=> SMADC_1_MOSI,
  adcCLKout => testADCClk,
  ext_serdes1_delay => ext_serdes1_delay_1,
  ext_serdes1_delay_exc1 => ext_serdes1_delay_exc_1_a,
  ext_serdes1_delay_exc2 => ext_serdes1_delay_exc_1_b,
  ext_bitsleep1 => ext_bitsleep_1_a,
  ext_bitsleep2 => ext_bitsleep_1_b,
  serdes_reset_0=>serdes_reset_0
  );
  
 eREAD1 <= NOT eEMPTY1;
 
    BUFG_inst : BUFG
 port map (
    O => READOUT_CLK_OUT, 
    I => testADCClk
 );
 
 adc_interface2:  adc_interface 
 generic map(
     ADC_A_INV => "00000000",
     ADC_B_INV => "00000000",
     IODELAY_GROUP_NAME =>  "ADC_DESER_group2"
 )
 port map
 ( clock_ref => clock_ref2,
   locked_dcmref => locked_dcmref,
   
   sCLK_25 => clk,
   
   ADC_BUS_CLK_A_P => ADC_2_CLK_A_P,
   ADC_BUS_CLK_A_N => ADC_2_CLK_A_N,
   ADC_BUS_CLK_B_P => ADC_2_CLK_B_P,
   ADC_BUS_CLK_B_N => ADC_2_CLK_B_N,
   
   ADC_BUS_FRAME_A_P => ADC_2_FRAME_A_P,
   ADC_BUS_FRAME_A_N => ADC_2_FRAME_A_N,
   ADC_BUS_FRAME_B_P => ADC_2_FRAME_B_P,
   ADC_BUS_FRAME_B_N => ADC_2_FRAME_B_N,
   
   ADC_BUS_DATA_A_P => ADC_2_DATA_A_P,
   ADC_BUS_DATA_A_N => ADC_2_DATA_A_N,
                           
   ADC_BUS_DATA_B_P => ADC_2_DATA_B_P,
   ADC_BUS_DATA_B_N => ADC_2_DATA_B_N,
   
   eDATA_OUT => eDATA_OUT2,
   eEMPTY => eEMPTY2, 
   eCLK =>  READOUT_CLK, 
   eREAD => eREAD2,
     
   SMADC_CSA => OPEN,
   SMADC_CSB => open,
   SMADC_CLK => OPEN,
   SMADC_MOSI=> OPEN,
   adcCLKout => OPEN,
   
   ext_serdes1_delay => ext_serdes1_delay_2,
  ext_serdes1_delay_exc1 => ext_serdes1_delay_exc_2_a,
   ext_serdes1_delay_exc2 => ext_serdes1_delay_exc_2_b,
   ext_bitsleep1 => ext_bitsleep_2_a,
   ext_bitsleep2 => ext_bitsleep_2_b,
   serdes_reset_0=>serdes_reset_0

 
   );
   
  eREAD2 <= NOT eEMPTY2;
  
  
  
  
 adc_interface3:  adc_interface 
   generic map(
       ADC_A_INV => "00000000",
       ADC_B_INV => "00000000",
       IODELAY_GROUP_NAME =>  "ADC_DESER_group3"
   )
   port map
   ( clock_ref => clock_ref3,
     locked_dcmref => locked_dcmref,
     
     sCLK_25 => clk,
     
     ADC_BUS_CLK_A_P => ADC_3_CLK_A_P,
     ADC_BUS_CLK_A_N => ADC_3_CLK_A_N,
     ADC_BUS_CLK_B_P => ADC_3_CLK_B_P,
     ADC_BUS_CLK_B_N => ADC_3_CLK_B_N,
     
     ADC_BUS_FRAME_A_P => ADC_3_FRAME_A_P,
     ADC_BUS_FRAME_A_N => ADC_3_FRAME_A_N,
     ADC_BUS_FRAME_B_P => ADC_3_FRAME_B_P,
     ADC_BUS_FRAME_B_N => ADC_3_FRAME_B_N,
     
     ADC_BUS_DATA_A_P => ADC_3_DATA_A_P,
     ADC_BUS_DATA_A_N => ADC_3_DATA_A_N,
                             
     ADC_BUS_DATA_B_P => ADC_3_DATA_B_P,
     ADC_BUS_DATA_B_N => ADC_3_DATA_B_N,
     
     eDATA_OUT => eDATA_OUT3,
     eEMPTY => eEMPTY3, 
     eCLK =>  READOUT_CLK, 
     eREAD => eREAD3,
       
     SMADC_CSA => OPEN,
     SMADC_CSB => open,
     SMADC_CLK => OPEN,
     SMADC_MOSI=> OPEN,
     adcCLKout => OPEN,
     
     ext_serdes1_delay => ext_serdes1_delay_3,
     ext_serdes1_delay_exc1 => ext_serdes1_delay_exc_3_a,
     ext_serdes1_delay_exc2 => ext_serdes1_delay_exc_3_b,
     ext_bitsleep1 => ext_bitsleep_3_a,
     ext_bitsleep2 => ext_bitsleep_3_b,
     serdes_reset_0=>serdes_reset_0  
     );
     
    eREAD3 <= NOT eEMPTY3;
    
    
    
 adc_interface4:  adc_interface 
   generic map(
       ADC_A_INV => "00000000",
       ADC_B_INV => "00000000",
       IODELAY_GROUP_NAME =>  "ADC_DESER_group4"
   )
   port map
   ( clock_ref => clock_ref4,
     locked_dcmref => locked_dcmref,
     
     sCLK_25 => clk,
     
     ADC_BUS_CLK_A_P => ADC_4_CLK_A_P,
     ADC_BUS_CLK_A_N => ADC_4_CLK_A_N,
     ADC_BUS_CLK_B_P => ADC_4_CLK_B_P,
     ADC_BUS_CLK_B_N => ADC_4_CLK_B_N,
     
     ADC_BUS_FRAME_A_P => ADC_4_FRAME_A_P,
     ADC_BUS_FRAME_A_N => ADC_4_FRAME_A_N,
     ADC_BUS_FRAME_B_P => ADC_4_FRAME_B_P,
     ADC_BUS_FRAME_B_N => ADC_4_FRAME_B_N,
     
     ADC_BUS_DATA_A_P => ADC_4_DATA_A_P,
     ADC_BUS_DATA_A_N => ADC_4_DATA_A_N,
                             
     ADC_BUS_DATA_B_P => ADC_4_DATA_B_P,
     ADC_BUS_DATA_B_N => ADC_4_DATA_B_N,
     
     eDATA_OUT => eDATA_OUT4,
     eEMPTY => eEMPTY4, 
     eCLK =>  READOUT_CLK, 
     eREAD => eREAD4,
       
     SMADC_CSA => OPEN,
     SMADC_CSB => open,
     SMADC_CLK => OPEN,
     SMADC_MOSI=> OPEN,
     adcCLKout => OPEN,
     
     ext_serdes1_delay => ext_serdes1_delay_4,
     ext_serdes1_delay_exc1 => ext_serdes1_delay_exc_4_a,
     ext_serdes1_delay_exc2 => ext_serdes1_delay_exc_4_b,
     ext_bitsleep1 => ext_bitsleep_4_a,
     ext_bitsleep2 => ext_bitsleep_4_b,
     serdes_reset_0=>serdes_reset_0

   
     );
     
    eREAD4 <= NOT eEMPTY4;
 
iCH0 <= EXT(eDATA_OUT1( (16*1)-1 downto	(16*(1-1))),16);
iCH1 <= EXT(eDATA_OUT1( (16*2)-1 downto	(16*(2-1))),16);
iCH2 <= EXT(eDATA_OUT1( (16*3)-1 downto	(16*(3-1))),16);
iCH3 <= EXT(eDATA_OUT1( (16*4)-1 downto	(16*(4-1))),16);
iCH4 <= EXT(eDATA_OUT1( (16*5)-1 downto	(16*(5-1))),16);
iCH5 <= EXT(eDATA_OUT1( (16*6)-1 downto	(16*(6-1))),16);
iCH6 <= EXT(eDATA_OUT1( (16*7)-1 downto	(16*(7-1))),16);
iCH7 <= EXT(eDATA_OUT1( (16*8)-1 downto	(16*(8-1))),16);
CHv0_7 <= not eEMPTY1;


iCH8 <= EXT(eDATA_OUT2( (16*1)-1 downto	(16*(1-1))),16);
iCH9 <= EXT(eDATA_OUT2( (16*2)-1 downto	(16*(2-1))),16);
iCH10 <= EXT(eDATA_OUT2( (16*3)-1 downto	(16*(3-1))),16);
iCH11 <= EXT(eDATA_OUT2( (16*4)-1 downto	(16*(4-1))),16);
iCH12 <= EXT(eDATA_OUT2( (16*5)-1 downto	(16*(5-1))),16);
iCH13 <= EXT(eDATA_OUT2( (16*6)-1 downto	(16*(6-1))),16);
iCH14 <= EXT(eDATA_OUT2( (16*7)-1 downto	(16*(7-1))),16);
iCH15 <= EXT(eDATA_OUT2( (16*8)-1 downto	(16*(8-1))),16);
CHv8_15 <= not eEMPTY2;


iCH16 <= EXT(eDATA_OUT3( (16*1)-1 downto	(16*(1-1))),16);
iCH17 <= EXT(eDATA_OUT3( (16*2)-1 downto	(16*(2-1))),16);
iCH18 <= EXT(eDATA_OUT3( (16*3)-1 downto	(16*(3-1))),16);
iCH19 <= EXT(eDATA_OUT3( (16*4)-1 downto	(16*(4-1))),16);
iCH20 <= EXT(eDATA_OUT3( (16*5)-1 downto	(16*(5-1))),16);
iCH21 <= EXT(eDATA_OUT3( (16*6)-1 downto	(16*(6-1))),16);
iCH22 <= EXT(eDATA_OUT3( (16*7)-1 downto	(16*(7-1))),16);
iCH23 <= EXT(eDATA_OUT3( (16*8)-1 downto	(16*(8-1))),16);
CHv16_23 <= not eEMPTY3;

iCH24 <= EXT(eDATA_OUT4( (16*1)-1 downto	(16*(1-1))),16);
iCH25 <= EXT(eDATA_OUT4( (16*2)-1 downto	(16*(2-1))),16);
iCH26 <= EXT(eDATA_OUT4( (16*3)-1 downto	(16*(3-1))),16);
iCH27 <= EXT(eDATA_OUT4( (16*4)-1 downto	(16*(4-1))),16);
iCH28 <= EXT(eDATA_OUT4( (16*5)-1 downto	(16*(5-1))),16);
iCH29 <= EXT(eDATA_OUT4( (16*6)-1 downto	(16*(6-1))),16);
iCH30 <= EXT(eDATA_OUT4( (16*7)-1 downto	(16*(7-1))),16);
iCH31 <= EXT(eDATA_OUT4( (16*8)-1 downto	(16*(8-1))),16);
CHv24_31 <= not eEMPTY4;

CH0 <= EXT(iCH0(15 downto 2),16);
CH1 <= EXT(iCH1(15 downto 2),16);
CH2 <= EXT(iCH2(15 downto 2),16);
CH3 <= EXT(iCH3(15 downto 2),16);
CH4 <= EXT(iCH4(15 downto 2),16);
CH5 <= EXT(iCH5(15 downto 2),16);
CH6 <= EXT(iCH6(15 downto 2),16);
CH7 <= EXT(iCH7(15 downto 2),16);
CH8 <= EXT(iCH8(15 downto 2),16);
CH9 <= EXT(iCH9(15 downto 2),16);
CH10 <= EXT(iCH10(15 downto 2),16);
CH11 <= EXT(iCH11(15 downto 2),16);
CH12 <= EXT(iCH12(15 downto 2),16);
CH13 <= EXT(iCH13(15 downto 2),16);
CH14 <= EXT(iCH14(15 downto 2),16);
CH15 <= EXT(iCH15(15 downto 2),16);
CH16 <= EXT(iCH16(15 downto 2),16);
CH17 <= EXT(iCH17(15 downto 2),16);
CH18 <= EXT(iCH18(15 downto 2),16);
CH19 <= EXT(iCH19(15 downto 2),16);
CH20 <= EXT(iCH20(15 downto 2),16);
CH21 <= EXT(iCH21(15 downto 2),16);
CH22 <= EXT(iCH22(15 downto 2),16);
CH23 <= EXT(iCH23(15 downto 2),16);
CH24 <= EXT(iCH24(15 downto 2),16);
CH25 <= EXT(iCH25(15 downto 2),16);
CH26 <= EXT(iCH26(15 downto 2),16);
CH27 <= EXT(iCH27(15 downto 2),16);
CH28 <= EXT(iCH28(15 downto 2),16);
CH29 <= EXT(iCH29(15 downto 2),16);
CH30 <= EXT(iCH30(15 downto 2),16);
CH31 <= EXT(iCH31(15 downto 2),16);
end Behavioral;
