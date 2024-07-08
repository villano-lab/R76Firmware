----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2016 19:00:34
-- Design Name: 
-- Module Name: adc_interface - Behavioral
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


use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Library xpm;
use xpm.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity adc_interface is
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
           
           ext_serdes1_delay : in std_logic_vector(5-1 downto 0);
           ext_serdes1_delay_exc1 : in std_logic_vector(8 downto 0);
           ext_serdes1_delay_exc2 : in std_logic_vector(8 downto 0);
           
           ext_bitsleep1 : in std_logic_vector(8 downto 0);
           ext_bitsleep2 : in std_logic_vector(8 downto 0);
           
           eDATA_OUT: out STD_LOGIC_VECTOR((16*8)-1 downto 0);
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
end adc_interface;

architecture Behavioral of adc_interface is
signal counter : std_logic_vector (26 downto 0);
    signal clk : std_logic;

    component ADC_REC_1
    generic
     (-- width of the data for the system
      SYS_W       : integer := 9;
      -- width of the data for the device
      DEV_W       : integer := 72);
    port
     (
      -- From the system into the device
      data_in_from_pins_p     : in    std_logic_vector(SYS_W-1 downto 0);
      data_in_from_pins_n     : in    std_logic_vector(SYS_W-1 downto 0);
      data_in_to_device       : out   std_logic_vector(DEV_W-1 downto 0);
      
      in_delay_reset          : in std_logic_vector(SYS_W-1 downto 0);
      in_delay_data_ce        : in    std_logic_vector(SYS_W-1 downto 0);
      in_delay_data_inc       : in    std_logic_vector(SYS_W-1 downto 0);
      in_delay_tap_in         : in    std_logic_vector(5-1 downto 0);
      in_delay_tap_out        : out   std_logic_vector((5*SYS_W)-1 downto 0);
     
      delay_locked            : out   std_logic;
      ref_clock               : in    std_logic;

      bitslip                 : in    std_logic_vector(SYS_W-1 downto 0);                    -- Bitslip module is enabled in NETWORKING mode
                                                                    -- User should tie it to '0' if not needed
     
    -- Clock and reset signals
      clk_in_p                : in    std_logic;                    -- Differential fast clock from IOB
      clk_in_n                : in    std_logic;
      clk_div_out             : out   std_logic;                    -- Slow clock output
      clk_reset               : in    std_logic;                    -- Reset signal for Clock circuit
      io_reset                : in    std_logic);                   -- Reset signal for IO circuit
    end component;    
    
    component ADC_REC_2
    generic
     (-- width of the data for the system
      SYS_W       : integer := 9;
      -- width of the data for the device
      DEV_W       : integer := 72);
    port
     (
      -- From the system into the device
      data_in_from_pins_p     : in    std_logic_vector(SYS_W-1 downto 0);
      data_in_from_pins_n     : in    std_logic_vector(SYS_W-1 downto 0);
      data_in_to_device       : out   std_logic_vector(DEV_W-1 downto 0);
      
      in_delay_reset          : in std_logic_vector(SYS_W-1 downto 0);
      in_delay_data_ce        : in    std_logic_vector(SYS_W-1 downto 0);
      in_delay_data_inc       : in    std_logic_vector(SYS_W-1 downto 0);
      in_delay_tap_in         : in    std_logic_vector(5-1 downto 0);
      in_delay_tap_out        : out   std_logic_vector((5*SYS_W)-1 downto 0);
     
      delay_locked            : out   std_logic;
      ref_clock               : in    std_logic;

      bitslip                 : in    std_logic_vector(SYS_W-1 downto 0);                    -- Bitslip module is enabled in NETWORKING mode
                                                                    -- User should tie it to '0' if not needed
     
    -- Clock and reset signals
      clk_in_p                : in    std_logic;                    -- Differential fast clock from IOB
      clk_in_n                : in    std_logic;
      clk_div_out             : out   std_logic;                    -- Slow clock output
      clk_reset               : in    std_logic;                    -- Reset signal for Clock circuit
      io_reset                : in    std_logic);                   -- Reset signal for IO circuit
    end component;
    
    
    component adc_sync 
        Port ( 
        clk : in std_logic;
        ce : in std_logic;
        start_delay : in std_logic;
        bitsleep : out std_logic_vector(8 downto 0);
        probe_data_A0 : in  std_logic_vector (7 downto 0);
        probe_data_B0 : in  std_logic_vector (7 downto 0);
        probe_data_A1 : in  std_logic_vector (7 downto 0);
        probe_data_B1 : in  std_logic_vector (7 downto 0);
        probe_data_A2 : in  std_logic_vector (7 downto 0);
        probe_data_B2 : in  std_logic_vector (7 downto 0);
        probe_data_A3 : in  std_logic_vector (7 downto 0);
        probe_data_B3 : in  std_logic_vector (7 downto 0);
        adc_frame : in std_logic_vector (7 downto 0);
        serdes_delay : out std_logic_vector(7 downto 0);
        serdes_dprog : out std_logic_vector(8 downto 0);
        obit_locked : out std_logic;
        initialized : out std_logic
        );
    end component;
    
    
    component fifo_generator_0 
      PORT (
        rst : IN STD_LOGIC;
        wr_clk : IN STD_LOGIC;
        rd_clk : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
        wr_en : IN STD_LOGIC;
        rd_en : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
        full : OUT STD_LOGIC;
        empty : OUT STD_LOGIC
      );
    END component;
    
    
    signal data_in_to_device1 : std_logic_vector (71 downto 0) := (others => '0');
    signal data_in_to_device2 : std_logic_vector (71 downto 0) := (others => '0');
    
    signal clk_div_out1             :    std_logic :='0';
    signal clk_div_out2             :    std_logic :='0';

    attribute keep : string; 
    
    
    signal ADC_F_0 : std_logic_vector (7 downto 0);
    signal ADC_F_1 : std_logic_vector (7 downto 0);
    signal ADC_A_0 : std_logic_vector (7 downto 0);
    signal ADC_B_0 : std_logic_vector (7 downto 0);
    signal ADC_A_1 : std_logic_vector (7 downto 0);
    signal ADC_B_1 : std_logic_vector (7 downto 0);
    signal ADC_A_2 : std_logic_vector (7 downto 0);
    signal ADC_B_2 : std_logic_vector (7 downto 0);
    signal ADC_A_3 : std_logic_vector (7 downto 0);
    signal ADC_B_3 : std_logic_vector (7 downto 0);
    signal ADC_A_4 : std_logic_vector (7 downto 0);
    signal ADC_B_4 : std_logic_vector (7 downto 0);
    signal ADC_A_5 : std_logic_vector (7 downto 0);
    signal ADC_B_5 : std_logic_vector (7 downto 0);
    signal ADC_A_6 : std_logic_vector (7 downto 0);
    signal ADC_B_6 : std_logic_vector (7 downto 0);
    signal ADC_A_7 : std_logic_vector (7 downto 0);
    signal ADC_B_7 : std_logic_vector (7 downto 0);
   

   
    signal DATA_A_0 : std_logic_vector (15 downto 0);
    signal DATA_A_1 : std_logic_vector (15 downto 0);
    signal DATA_A_2 : std_logic_vector (15 downto 0);
    signal DATA_A_3 : std_logic_vector (15 downto 0);
    signal DATA_A_4 : std_logic_vector (15 downto 0);
    signal DATA_A_5 : std_logic_vector (15 downto 0);
    signal DATA_A_6 : std_logic_vector (15 downto 0);
    signal DATA_A_7 : std_logic_vector (15 downto 0);

 

   attribute keep of ADC_F_0: signal is "true";
   attribute keep of ADC_F_1: signal is "true";
   
   attribute keep of ADC_A_0: signal is "true";
   attribute keep of ADC_B_0: signal is "true";
   attribute keep of ADC_A_1: signal is "true";
   attribute keep of ADC_B_1: signal is "true";
   attribute keep of ADC_A_2: signal is "true";
   attribute keep of ADC_B_2: signal is "true";
   attribute keep of ADC_A_3: signal is "true";
   attribute keep of ADC_B_3: signal is "true";
   attribute keep of ADC_A_4: signal is "true";
   attribute keep of ADC_B_4: signal is "true";
   attribute keep of ADC_A_5: signal is "true";
   attribute keep of ADC_B_5: signal is "true";
   attribute keep of ADC_A_6: signal is "true";
   attribute keep of ADC_B_6: signal is "true";
   attribute keep of ADC_A_7: signal is "true";
   attribute keep of ADC_B_7: signal is "true";
   
   attribute keep of DATA_A_0: signal is "true";
   attribute keep of DATA_A_1: signal is "true";
   attribute keep of DATA_A_2: signal is "true";
   attribute keep of DATA_A_3: signal is "true";
   attribute keep of DATA_A_4: signal is "true";
   attribute keep of DATA_A_5: signal is "true";
   attribute keep of DATA_A_6: signal is "true";
   attribute keep of DATA_A_7: signal is "true";   
        
    signal SMADC_CS :  std_logic := '1';

   signal bitsleep1 : std_logic_vector(8 downto 0) := "000000000";
   signal bitsleep2 : std_logic_vector(8 downto 0) := "000000000";
   
   signal start_delay : std_logic := '0';

   
   signal reset_counter : integer :=0;
   signal reset_sm : std_logic_vector(3 downto 0) := x"0";
   signal reset_sm_d : std_logic_vector(3 downto 0) := x"0";
   signal delay_rs : std_logic_vector(15 downto 0) := x"0000";    
   signal reset_clkref_dcm : std_logic := '0';


   signal serdes_ioreset : std_logic := '0';
   signal serdes_delayreset : std_logic := '0';
   signal serdes_reset : std_logic := '0';
   
  
   --signal serdes1_program_delay : std_logic_vector(8 downto 0) := "000000000";
   signal serdes1_delaylock : std_logic := '0';
   --signal serdes1_delay : std_logic_vector( (5*9) -1 downto 0) := (others => '0');
   --signal serdes1_delay_temp : std_logic_vector( 7 downto 0) := (others => '0');
   
   
   --signal serdes2_program_delay : std_logic_vector(8 downto 0) := "000000000";
   signal serdes2_delaylock : std_logic := '0';
   --signal serdes2_delay : std_logic_vector( (5*9) -1 downto 0) := (others => '0');
   --signal serdes2_delay_temp : std_logic_vector( 7 downto 0) := (others => '0');   
   
   signal adc_programmed : std_logic := '0';
   
   
   signal bit_locked1 : std_logic := '0';
   signal initialized1 :std_logic := '0';
   signal bit_locked2 : std_logic := '0';
   signal initialized2 :std_logic := '0';   
    
    attribute keep of bit_locked1: signal is "true";
    attribute keep of initialized1: signal is "true";
    attribute keep of bit_locked2: signal is "true";
    attribute keep of initialized2: signal is "true";

    signal FIFO1_DIN : std_logic_vector(63 downto 0);
    signal FIFO1_DOUT : std_logic_vector(63 downto 0);
    signal FIFO1_empty : std_logic;
    
    signal FIFO2_DIN : std_logic_vector(63 downto 0);
    signal FIFO2_DOUT : std_logic_vector(63 downto 0);
    signal FIFO2_empty : std_logic;    
    signal ADC_READY : STD_LOGIC;
    attribute keep of ADC_READY: signal is "true";
    
    
       signal serdes1_delay : std_logic_vector(7 downto 0);
       signal serdes2_delay : std_logic_vector(7 downto 0);
       
       signal serdes1_program_delay : std_logic_vector (8 downto 0) := "000000000";
       signal serdes2_program_delay : std_logic_vector (8 downto 0) := "000000000";

       signal ibitslip1 : std_logic_vector (8 downto 0) := "000000000";
       signal ibitslip2 : std_logic_vector (8 downto 0) := "000000000";

       signal obitslip1 : std_logic_vector (8 downto 0) := "000000000";
       signal obitslip2 : std_logic_vector (8 downto 0) := "000000000";
                 
--attribute IODELAY_GROUP : STRING;
--attribute IODELAY_GROUP of IDELAYCTRL_inst: label is IODELAY_GROUP_NAME;
begin


    ADC_OUTFIFO1: fifo_generator_0 
      PORT MAP(
        rst => serdes_reset,
        wr_clk => clk_div_out1,
        rd_clk  => eCLK,
        din  => FIFO1_DIN,
        wr_en  => '1',
        rd_en  => eREAD,
        dout =>  FIFO1_DOUT,
        full  => open,
        empty  => FIFO1_empty
      );
      
    ADC_OUTFIFO2 : fifo_generator_0 
        PORT MAP(
          rst => serdes_reset,
          wr_clk => clk_div_out2,
          rd_clk  => eCLK,
          din  => FIFO2_DIN,
          wr_en  => '1',
          rd_en  => eREAD,
          dout =>  FIFO2_DOUT,
          full  => open,
          empty  => FIFO2_empty
        );      
        

    eDATA_OUT( (16*1)-1 downto	(16*(1-1))) <=       FIFO1_DOUT( (16*1)-1 downto	(16*(1-1)) ) ;     --0 
    eDATA_OUT( (16*2)-1 downto	(16*(2-1))) <=       FIFO2_DOUT( (16*1)-1 downto	(16*(1-1)) ) ;     --1
    eDATA_OUT( (16*3)-1 downto	(16*(3-1))) <=       FIFO1_DOUT( (16*2)-1 downto	(16*(2-1)) ) ;     --2
    eDATA_OUT( (16*4)-1 downto	(16*(4-1))) <=       FIFO2_DOUT( (16*2)-1 downto	(16*(2-1)) ) ;     --3
    eDATA_OUT( (16*5)-1 downto	(16*(5-1))) <=       FIFO1_DOUT( (16*3)-1 downto	(16*(3-1)) ) ;     --4
    eDATA_OUT( (16*6)-1 downto	(16*(6-1))) <=       FIFO2_DOUT( (16*3)-1 downto	(16*(3-1)) ) ;     --5
    eDATA_OUT( (16*7)-1 downto	(16*(7-1))) <=       FIFO1_DOUT( (16*4)-1 downto	(16*(4-1)) ) ;     --6
    eDATA_OUT( (16*8)-1 downto	(16*(8-1))) <=       FIFO2_DOUT( (16*4)-1 downto	(16*(4-1)) ) ;     --7 

    eEMPTY <= FIFO1_empty or FIFO2_empty;          

    FIFO1_DIN <= DATA_A_6 & DATA_A_4 & DATA_A_2 & DATA_A_0 ;
    FIFO2_DIN <= DATA_A_7 & DATA_A_5 & DATA_A_3 & DATA_A_1 ;

    adcCLKout <= clk_div_out1;
-- <-----Cut code below this line and paste into the architecture body---->

   -- IDELAYCTRL: IDELAYE2/ODELAYE2 Tap Delay Value Control
   --             Artix-7
   -- Xilinx HDL Language Template, version 2016.3
   
   

--   IDELAYCTRL_inst : IDELAYCTRL
--   port map (
--      RDY => open,       -- 1-bit output: Ready output
--      REFCLK => clock_ref, -- 1-bit input: Reference clock input
--      RST => serdes_ioreset        -- 1-bit input: Active high reset input
--   );


serdes_reset <=serdes_reset_0(0);
serdes_ioreset <= serdes_reset_0(1);


reset_process : process(sCLK_25)
    begin
    
        if rising_edge(sCLK_25) then
            case reset_sm is
                when x"0" =>
                    reset_clkref_dcm <= '1';
                    delay_rs <= x"000F";
                    reset_sm_d <= x"1";
                    reset_sm <= x"F";
                 
                when x"1" =>
                    reset_clkref_dcm <= '0';
                    if locked_dcmref = '1' then
                        reset_sm <= x"2";
                    end if;
                    
                when x"2" =>
                    delay_rs <= x"003F";
                    reset_sm_d <= x"3";
                    reset_sm <= x"F";
                when x"3" =>
                    
                    delay_rs <= x"003F";
                    reset_sm_d <= x"4";
                    reset_sm <= x"F";
                when x"4" =>
                   
                   delay_rs <= x"000F";
                   reset_sm_d <= x"5";
                   reset_sm <= x"F";               
                when x"5" =>
                   
                   delay_rs <= x"003F";
                   reset_sm_d <= x"6";
                    reset_sm <= x"F";
                when x"6" =>
                   
                   delay_rs <= x"005F";
                   reset_sm_d <= x"7";
                   reset_sm <= x"F";
                when x"7" =>
                   
                   delay_rs <= x"003F";
                   reset_sm_d <= x"8";                                                                    
                   reset_sm <= x"F";
                when x"8" =>
                   if serdes1_delaylock = '1' then
                     --start_delay <= '1';
                   end if;
                    
                when x"F" =>
                    if delay_rs = x"0000" then
                        reset_sm <= reset_sm_d;
                    else
                        delay_rs <= delay_rs-1;
                    end if;
                when others =>
                  reset_sm <= x"0";
              end case;
        end  if;
    
    end process;

    clk <= sCLK_25;

   
--    SMADC_CSA <= SMADC_CS;
--    SMADC_CSB <= SMADC_CS;
--aaprog: block
--        signal SMADC : std_logic_vector(3 downto 0) := x"0";
--        signal SMADCnew : std_logic_vector(3 downto 0) := x"0";
--        signal SMADCwordwrite : std_logic_vector(23 downto 0) := x"000000";
--        signal SMID : integer :=0;
--        signal idx : integer := 0;
--        signal SMdelay : std_logic_vector(15 downto 0);
--        signal ramp_counter : std_logic_vector(13 downto 0):= (others => '0');
--        signal ramp_next : std_logic;
--        attribute keep of ramp_next: signal is "true";
--        attribute keep of ramp_counter: signal is "true";
--    begin
--        programmachine : process (clk) 
--        begin
--            if rising_edge(clk) then
--            ramp_next <= '0';
--                case SMADC is
                    
--                    when x"0" =>
--                        SMADC_CS <= '1';
--                        SMADC_MOSI <= '1';
--                        idx <= 0;
--                        case SMID is
--                            when 0 =>
--                                ADC_READY <= '0'; 
--                                SMADC <= x"F";
--                                SMADCnew <= x"0";
--                                SMdelay <= x"03FF";                        
--                                SMID <= SMID +1;
--                            when 1 =>
--                                    SMADCwordwrite <= X"000D08";
--                                    SMID <= SMID +1;
--                                    SMADC <= x"1";
--                            when 2 =>
--                                SMADC <= x"F";
--                                SMADCnew <= x"0";
--                                SMdelay <= x"FFFF";                        
--                                SMID <= SMID +1;                                                            
--                            when 3 =>
--                                SMADCwordwrite <= X"001400";
--                                SMID <= SMID +1;
--                                SMADC <= x"1";
--                            when 4 =>
--                                    SMADCwordwrite <= X"002134";
--                                    SMID <= SMID +1;
--                                    SMADC <= x"1";
--                            when 5 =>
--                                    SMADCwordwrite <= X"001955";
--                                    SMID <= SMID +1;
--                                    SMADC <= x"1";
--                            when 6 =>
--                                    SMADCwordwrite <= X"001A55";
--                                    SMID <= SMID +1;
--                                    SMADC <= x"1";
--                            when 7 =>
--                                    SMADCwordwrite <= X"001B55";
--                                    SMID <= SMID +1;
--                                    SMADC <= x"1";
--                            when 8 =>
--                                    SMADCwordwrite <= X"001C55";
--                                    SMID <= SMID +1;
--                                    SMADC <= x"1";

--                            when 9 =>
--                                adc_programmed <= '1'; 
--                                if initialized1 = '1' and initialized2 = '1'  then
--                                    SMID <= 12;
--                                    SMADC <= x"F";
--                                    SMADCnew <= x"0";
--                                    SMdelay <= x"FFFF";    
--                                end if;
--                            when 10=>
--                                ramp_next <= '1';   
--                                --SMADCwordwrite <= X"03" & "10" & ramp_counter(13 downto 8);
--                                SMID <= SMID +1;
--                                SMADC <= x"1";                               
--                            when 11=>
--                                --SMADCwordwrite <= X"04" & ramp_counter(7 downto 0);
--                                SMID <= 7;
--                                SMADC <= x"1";                        
--                                ramp_counter <= ramp_counter +1;   
                            
--                            when 12 =>
--                                SMADCwordwrite <= X"000D00";
                            
--                                SMID <= 13;
--                                SMADC <= x"1";
                                
--                           when 13 =>                                

                                   
--                            when others =>
--                        end case;
--                    when x"1" => 
--                        SMADC_CLK <= '0';
--                        SMADC_CS <= '0';
--                        SMADC <= x"F";
--                        SMADCnew <= x"2";
--                        SMdelay <= x"00FF";
                        
--                    when x"2" =>
--                        SMADC_CLK <= '0';
--                        SMADC_CS <= '0';
--                        SMADC_MOSI <= SMADCwordwrite(23-idx);   
--                        idx <= idx +1;
--                        SMdelay <= x"00FF";
--                        SMADC <= x"F";
--                        SMADCnew <= x"3";
                        
--                    when x"3" =>
--                        SMADC_CLK <= '1';
--                        SMdelay <= x"00FF";
--                        SMADC <= x"F";
--                        SMADCnew <= x"2";
                        
--                        if idx = 24 then
--                            SMdelay <= x"00FF";
--                            SMADC <= x"F";
--                            SMADCnew <= x"A";
--                        end if;
                        
--                    when x"A" =>
--                         SMADC_CS <= '1';
--                         SMdelay <= x"01FF";
--                         SMADC <= x"F";
--                         SMADCnew <= x"0";                     
      
          
--                    when x"F" => 
--                        if SMdelay = x"0000" then
--                            SMADC <= SMADCnew;
--                        else
--                            SMdelay <= SMdelay-1; 
--                        end if;
                        
                        
--                    when others =>
--                 end case;
                            
--            end if;
--        end process;
        
--      end block; 
    
    


    
    ADDESR: for I in 0 to 7 generate
       begin
        ADS1: process(clk_div_out1) 
           begin
               
               if rising_edge(clk_div_out1) then
               --frame
                  -- ADC_F_0(I) <=   data_in_to_device1 ( (I * 9) + 0 );
            
               --A 0
                   if ADC_A_INV(0) = '0' then
                   ADC_A_0(I) <=   data_in_to_device1 ( (I * 9) + 1 );
            
                   else
                   ADC_A_0(I) <=   not data_in_to_device1 ( (I * 9) + 1 );
            
                   end if;
               --B 0
                   if ADC_B_INV(0) = '0' then
                   ADC_B_0(I) <=   data_in_to_device1 ( (I * 9) + 2 );
            
                   else
                   ADC_B_0(I) <=   not data_in_to_device1 ( (I * 9) + 2 );
            
                   end if;
               --A 2
                   if ADC_A_INV(2) = '0' then    
                    ADC_A_2(I) <=   data_in_to_device1 ( (I * 9) + 3 );
                    
                   else
                    ADC_A_2(I) <=   not data_in_to_device1 ( (I * 9) + 3 );
                    
                   end if;
               --B 2
                   if ADC_B_INV(2) = '0' then   
                    ADC_B_2(I) <=   data_in_to_device1 ( (I * 9) + 4 );
                    
                   else
                    ADC_B_2(I) <=   not data_in_to_device1 ( (I * 9) + 4 );
                    
                   end if;
               --A 4
                   if ADC_A_INV(4) = '0' then                    
                    ADC_A_4(I) <=   data_in_to_device1 ( (I * 9) + 5 );
                    
                   else
                    ADC_A_4(I) <=   not data_in_to_device1 ( (I * 9) + 5 );
                    
                   end if;
               --B 4
                   if ADC_B_INV(4) = '0' then  
                    ADC_B_4(I) <=   data_in_to_device1 ( (I * 9) + 6 );
                    
                   else
                    ADC_B_4(I) <=   not data_in_to_device1 ( (I * 9) + 6 );
                    
                   end if;
               --A 6
                   if ADC_A_INV(6) = '0' then  
                    ADC_A_6(I) <=   data_in_to_device1 ( (I * 9) + 7 );
                    
                   else
                    ADC_A_6(I) <=   not data_in_to_device1 ( (I * 9) + 7 );
                    
                   end if;
               --B 6 
                   if ADC_B_INV(6) = '0' then
                    ADC_B_6(I) <=   data_in_to_device1 ( (I * 9) + 8 ); 
                     
                   else
                    ADC_B_6(I) <=   not data_in_to_device1 ( (I * 9) + 8 ); 
                     
                   end if;
                   --ADC_B_7(I) <=   not data_in_to_device1 ( (I * 9) + 8 );                                                           
               end if;
           end process; 
           
        ADS2: process(clk_div_out2) 
           begin
               if rising_edge(clk_div_out2) then
                  --data_in_to_device2_m1 <= data_in_to_device2;
               --frame
                 -- ADC_F_1(I) <=   data_in_to_device2 ( (I * 9) + 0 );
                  
              --A 1
                  if ADC_A_INV(1) = '0' then
                   ADC_A_1(I) <=   data_in_to_device2 ( (I * 9) + 1 );
                   
                  else
                   ADC_A_1(I) <=   not data_in_to_device2 ( (I * 9) + 1 );
                   
                  end if;
              --B 1
                  if ADC_B_INV(1) = '0' then
                   ADC_B_1(I) <=   data_in_to_device2 ( (I * 9) + 2 );
                   
                  else
                   ADC_B_1(I) <=   not data_in_to_device2 ( (I * 9) + 2 );
                   
                  end if;
              --A 3
                  if ADC_A_INV(3) = '0' then    
                   ADC_A_3(I) <=   data_in_to_device2 ( (I * 9) + 3 );
                   
                  else
                   ADC_A_3(I) <=   not data_in_to_device2 ( (I * 9) + 3 );
                   
                  end if;
              --B 3
                  if ADC_B_INV(3) = '0' then   
                   ADC_B_3(I) <=   data_in_to_device2 ( (I * 9) + 4 );
                   
                  else
                   ADC_B_3(I) <=   not data_in_to_device2 ( (I * 9) + 4 );
                   
                  end if;
              --A 5
                  if ADC_A_INV(5) = '0' then                    
                   ADC_A_5(I) <=   data_in_to_device2 ( (I * 9) + 5 );
                   
                  else
                   ADC_A_5(I) <=   not data_in_to_device2 ( (I * 9) + 5 );
                   
                  end if;
              --B 5
                  if ADC_B_INV(5) = '0' then  
                   ADC_B_5(I) <=   data_in_to_device2 ( (I * 9) + 6 );
                   
                  else
                   ADC_B_5(I) <=   not data_in_to_device2 ( (I * 9) + 6 );
                   
                  end if;
              --A 7
                  if ADC_A_INV(7) = '0' then  
                   ADC_A_7(I) <=   data_in_to_device2 ( (I * 9) + 7 );
                   
                  else
                   ADC_A_7(I) <=   not data_in_to_device2 ( (I * 9) + 7 );
                   
                  end if;
              --B 7 
                  if ADC_B_INV(7) = '0' then
                   ADC_B_7(I) <=   data_in_to_device2 ( (I * 9) + 8 ); 
                    
                  else
                   ADC_B_7(I) <=   not data_in_to_device2 ( (I * 9) + 8 ); 
                    
                  end if;
                             
               end if;
           end process;           
    end generate;
             
     DATA_A_0 <= ADC_B_0(0) & ADC_B_0(1) & ADC_B_0(2) & ADC_B_0(3) & ADC_B_0(4) & ADC_B_0(5) & ADC_B_0(6) & ADC_B_0(7) & ADC_A_0(0) & ADC_A_0(1) & ADC_A_0(2) & ADC_A_0(3) & ADC_A_0(4) & ADC_A_0(5) & ADC_A_0(6) & ADC_A_0(7);
     DATA_A_1 <= ADC_B_1(0) & ADC_B_1(1) & ADC_B_1(2) & ADC_B_1(3) & ADC_B_1(4) & ADC_B_1(5) & ADC_B_1(6) & ADC_B_1(7) & ADC_A_1(0) & ADC_A_1(1) & ADC_A_1(2) & ADC_A_1(3) & ADC_A_1(4) & ADC_A_1(5) & ADC_A_1(6) & ADC_A_1(7);
     DATA_A_2 <= ADC_B_2(0) & ADC_B_2(1) & ADC_B_2(2) & ADC_B_2(3) & ADC_B_2(4) & ADC_B_2(5) & ADC_B_2(6) & ADC_B_2(7) & ADC_A_2(0) & ADC_A_2(1) & ADC_A_2(2) & ADC_A_2(3) & ADC_A_2(4) & ADC_A_2(5) & ADC_A_2(6) & ADC_A_2(7);
     DATA_A_3 <= ADC_B_3(0) & ADC_B_3(1) & ADC_B_3(2) & ADC_B_3(3) & ADC_B_3(4) & ADC_B_3(5) & ADC_B_3(6) & ADC_B_3(7) & ADC_A_3(0) & ADC_A_3(1) & ADC_A_3(2) & ADC_A_3(3) & ADC_A_3(4) & ADC_A_3(5) & ADC_A_3(6) & ADC_A_3(7);
     DATA_A_4 <= ADC_B_4(0) & ADC_B_4(1) & ADC_B_4(2) & ADC_B_4(3) & ADC_B_4(4) & ADC_B_4(5) & ADC_B_4(6) & ADC_B_4(7) & ADC_A_4(0) & ADC_A_4(1) & ADC_A_4(2) & ADC_A_4(3) & ADC_A_4(4) & ADC_A_4(5) & ADC_A_4(6) & ADC_A_4(7);
     DATA_A_5 <= ADC_B_5(0) & ADC_B_5(1) & ADC_B_5(2) & ADC_B_5(3) & ADC_B_5(4) & ADC_B_5(5) & ADC_B_5(6) & ADC_B_5(7) & ADC_A_5(0) & ADC_A_5(1) & ADC_A_5(2) & ADC_A_5(3) & ADC_A_5(4) & ADC_A_5(5) & ADC_A_5(6) & ADC_A_5(7);
     DATA_A_6 <= ADC_B_6(0) & ADC_B_6(1) & ADC_B_6(2) & ADC_B_6(3) & ADC_B_6(4) & ADC_B_6(5) & ADC_B_6(6) & ADC_B_6(7) & ADC_A_6(0) & ADC_A_6(1) & ADC_A_6(2) & ADC_A_6(3) & ADC_A_6(4) & ADC_A_6(5) & ADC_A_6(6) & ADC_A_6(7);
     DATA_A_7 <= ADC_B_7(0) & ADC_B_7(1) & ADC_B_7(2) & ADC_B_7(3) & ADC_B_7(4) & ADC_B_7(5) & ADC_B_7(6) & ADC_B_7(7) & ADC_A_7(0) & ADC_A_7(1) & ADC_A_7(2) & ADC_A_7(3) & ADC_A_7(4) & ADC_A_7(5) & ADC_A_7(6) & ADC_A_7(7);
     
--DATA_A_0 <= ADC_B_0(0) & ADC_A_0(0) & ADC_B_0(1) & ADC_A_0(1) & ADC_B_0(2) & ADC_A_0(2) & ADC_B_0(3) & ADC_A_0(3) & ADC_B_0(4) & ADC_A_0(4) & ADC_B_0(5) & ADC_A_0(5) & ADC_B_0(6) & ADC_A_0(6) & ADC_B_0(7) & ADC_A_0(7) ;
--DATA_A_1 <= ADC_B_1(0) & ADC_A_1(0) & ADC_B_1(1) & ADC_A_1(1) & ADC_B_1(2) & ADC_A_1(2) & ADC_B_1(3) & ADC_A_1(3) & ADC_B_1(4) & ADC_A_1(4) & ADC_B_1(5) & ADC_A_1(5) & ADC_B_1(6) & ADC_A_1(6) & ADC_B_1(7) & ADC_A_1(7) ;
--DATA_A_2 <= ADC_B_2(0) & ADC_A_2(0) & ADC_B_2(1) & ADC_A_2(1) & ADC_B_2(2) & ADC_A_2(2) & ADC_B_2(3) & ADC_A_2(3) & ADC_B_2(4) & ADC_A_2(4) & ADC_B_2(5) & ADC_A_2(5) & ADC_B_2(6) & ADC_A_2(6) & ADC_B_2(7) & ADC_A_2(7) ;
--DATA_A_3 <= ADC_B_3(0) & ADC_A_3(0) & ADC_B_3(1) & ADC_A_3(1) & ADC_B_3(2) & ADC_A_3(2) & ADC_B_3(3) & ADC_A_3(3) & ADC_B_3(4) & ADC_A_3(4) & ADC_B_3(5) & ADC_A_3(5) & ADC_B_3(6) & ADC_A_3(6) & ADC_B_3(7) & ADC_A_3(7) ;
--DATA_A_4 <= ADC_B_4(0) & ADC_A_4(0) & ADC_B_4(1) & ADC_A_4(1) & ADC_B_4(2) & ADC_A_4(2) & ADC_B_4(3) & ADC_A_4(3) & ADC_B_4(4) & ADC_A_4(4) & ADC_B_4(5) & ADC_A_4(5) & ADC_B_4(6) & ADC_A_4(6) & ADC_B_4(7) & ADC_A_4(7) ;
--DATA_A_5 <= ADC_B_5(0) & ADC_A_5(0) & ADC_B_5(1) & ADC_A_5(1) & ADC_B_5(2) & ADC_A_5(2) & ADC_B_5(3) & ADC_A_5(3) & ADC_B_5(4) & ADC_A_5(4) & ADC_B_5(5) & ADC_A_5(5) & ADC_B_5(6) & ADC_A_5(6) & ADC_B_5(7) & ADC_A_5(7) ;
--DATA_A_6 <= ADC_B_6(0) & ADC_A_6(0) & ADC_B_6(1) & ADC_A_6(1) & ADC_B_6(2) & ADC_A_6(2) & ADC_B_6(3) & ADC_A_6(3) & ADC_B_6(4) & ADC_A_6(4) & ADC_B_6(5) & ADC_A_6(5) & ADC_B_6(6) & ADC_A_6(6) & ADC_B_6(7) & ADC_A_6(7) ;
--DATA_A_7 <= ADC_B_7(0) & ADC_A_7(0) & ADC_B_7(1) & ADC_A_7(1) & ADC_B_7(2) & ADC_A_7(2) & ADC_B_7(3) & ADC_A_7(3) & ADC_B_7(4) & ADC_A_7(4) & ADC_B_7(5) & ADC_A_7(5) & ADC_B_7(6) & ADC_A_7(6) & ADC_B_7(7) & ADC_A_7(7) ;
          
     
      ADC_DESER1 : ADC_REC_1
       port map 
       ( 
       data_in_from_pins_p(0) => ADC_BUS_FRAME_A_P,
       data_in_from_pins_p(1) => ADC_BUS_DATA_A_P(0),     --1
       data_in_from_pins_p(2) => ADC_BUS_DATA_B_P(0), 
       data_in_from_pins_p(3) => ADC_BUS_DATA_A_P(2),     --4
       data_in_from_pins_p(4) => ADC_BUS_DATA_B_P(2),
       data_in_from_pins_p(5) => ADC_BUS_DATA_A_P(4),     --5
       data_in_from_pins_p(6) => ADC_BUS_DATA_B_P(4),     
       data_in_from_pins_p(7) => ADC_BUS_DATA_A_P(6),     --8
       data_in_from_pins_p(8) => ADC_BUS_DATA_B_P(6),
       data_in_from_pins_n(0) => ADC_BUS_FRAME_A_N,
       data_in_from_pins_n(1) => ADC_BUS_DATA_A_N(0),
       data_in_from_pins_n(2) => ADC_BUS_DATA_B_N(0),
       data_in_from_pins_n(3) => ADC_BUS_DATA_A_N(2),
       data_in_from_pins_n(4) => ADC_BUS_DATA_B_N(2),
       data_in_from_pins_n(5) => ADC_BUS_DATA_A_N(4),
       data_in_from_pins_n(6) => ADC_BUS_DATA_B_N(4),
       data_in_from_pins_n(7) => ADC_BUS_DATA_A_N(6),
       data_in_from_pins_n(8) => ADC_BUS_DATA_B_N(6),
       data_in_to_device => data_in_to_device1,
       bitslip => bitsleep1,                           
       clk_in_p => ADC_BUS_CLK_A_P,                          
       clk_in_n => ADC_BUS_CLK_A_N,
       clk_div_out => clk_div_out1,                       
       clk_reset => serdes_ioreset,
       io_reset => serdes_reset,

       in_delay_reset          => serdes1_program_delay,
       in_delay_data_ce        => "000000000",
       in_delay_data_inc       => "000000000",
       in_delay_tap_in         => serdes1_delay(4 downto 0),
       in_delay_tap_out        => open,
       delay_locked            => serdes1_delaylock,
       ref_clock               => clock_ref
       
       
    );
    
xpm_cdc_serdes1_delay_1: xpm_cdc_array_single
      generic map (
    
        -- Common module generics
        DEST_SYNC_FF   => 4, -- integer; range: 2-10
        INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
        SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
        SRC_INPUT_REG  => 0, -- integer; 0=do not register input, 1=register input
        WIDTH          => 5  -- integer; range: 1-1024
    
      )
      port map (
    
        src_clk  => '1',  -- optional; required when SRC_INPUT_REG = 1
        src_in   => ext_serdes1_delay,
        dest_clk => clk_div_out1,
        dest_out =>  serdes1_delay(4 downto 0)
      );
      
xpm_cdc_serdes1_program_delay_1:  xpm_cdc_array_single
       generic map (
     
         -- Common module generics
         DEST_SYNC_FF   => 4, -- integer; range: 2-10
         INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
         SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
         SRC_INPUT_REG  => 0, -- integer; 0=do not register input, 1=register input
         WIDTH          => 9  -- integer; range: 1-1024
     
       )
    port map (
       src_clk  => '1',  -- optional; required when SRC_INPUT_REG = 1
       src_in   => ext_serdes1_delay_exc1,
       dest_clk => clk_div_out1,
       dest_out => serdes1_program_delay
    );  
    

xpm_cdc_bitsleep_1: xpm_cdc_array_single
    generic map (
  
      -- Common module generics
      DEST_SYNC_FF   => 4, -- integer; range: 2-10
      INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
      SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
      SRC_INPUT_REG  => 0, -- integer; 0=do not register input, 1=register input
      WIDTH          => 9  -- integer; range: 1-1024
  
    )
    port map (
  
      src_clk  => '1',  -- optional; required when SRC_INPUT_REG = 1
      src_in   => ext_bitsleep1,
      dest_clk => clk_div_out1,
      dest_out =>  ibitslip1
    ); 
    
    bitsliepGen1 : process (clk_div_out1)
    begin
        if rising_edge(clk_div_out1) then
            obitslip1 <= ibitslip1;
            bitsleep1 <= ibitslip1 and (not obitslip1);
        end if;
    end process; 
          

--    ADC_SYNC1: adc_sync
--    Port Map(       
--         clk => clk_div_out1,
--         ce => '1',
--         start_delay => start_delay,
--         bitsleep => bitsleep1,
--         probe_data_A0 => ADC_A_0,
--         probe_data_B0 => ADC_B_0,
--         probe_data_A1 => ADC_A_1,
--         probe_data_B1 => ADC_B_1,
--         probe_data_A2 => ADC_A_2,
--         probe_data_B2 => ADC_B_2,
--         probe_data_A3 => ADC_A_3,
--         probe_data_B3 => ADC_B_3,
--         adc_frame => ADC_F_0,
--         serdes_delay => serdes1_delay,
--         serdes_dprog => serdes1_program_delay,
--         obit_locked => bit_locked1,
--         initialized => initialized1
--   );


      ADC_DESER2 : ADC_REC_2    
       port map 
       ( 
          data_in_from_pins_p(0) => ADC_BUS_FRAME_B_P,
         data_in_from_pins_p(1) => ADC_BUS_DATA_A_P(1),  --2 
         data_in_from_pins_p(2) => ADC_BUS_DATA_B_P(1),       
         data_in_from_pins_p(3) => ADC_BUS_DATA_A_P(3),  --3
         data_in_from_pins_p(4) => ADC_BUS_DATA_B_P(3),
         data_in_from_pins_p(5) => ADC_BUS_DATA_A_P(5),  --6
         data_in_from_pins_p(6) => ADC_BUS_DATA_B_P(5),
         data_in_from_pins_p(7) => ADC_BUS_DATA_A_P(7),  --7
         data_in_from_pins_p(8) => ADC_BUS_DATA_B_P(7),
         data_in_from_pins_n(0) => ADC_BUS_FRAME_B_N,
         data_in_from_pins_n(1) => ADC_BUS_DATA_A_N(1),
         data_in_from_pins_n(2) => ADC_BUS_DATA_B_N(1),
         data_in_from_pins_n(3) => ADC_BUS_DATA_A_N(3),
         data_in_from_pins_n(4) => ADC_BUS_DATA_B_N(3),
         data_in_from_pins_n(5) => ADC_BUS_DATA_A_N(5),
         data_in_from_pins_n(6) => ADC_BUS_DATA_B_N(5),
         data_in_from_pins_n(7) => ADC_BUS_DATA_A_N(7),
         data_in_from_pins_n(8) => ADC_BUS_DATA_B_N(7),
         data_in_to_device => data_in_to_device2,
       bitslip => bitsleep2,                           
       clk_in_p => ADC_BUS_CLK_B_P,                          
       clk_in_n => ADC_BUS_CLK_B_N,
       clk_div_out => clk_div_out2,                       
       clk_reset => serdes_ioreset,
       io_reset => serdes_reset,

       in_delay_reset          => serdes2_program_delay,
       in_delay_data_ce        => "000000000",
       in_delay_data_inc       => "000000000",
       in_delay_tap_in         => serdes2_delay(4 downto 0),
       in_delay_tap_out        => open,
       delay_locked            => serdes2_delaylock,
       ref_clock               => clock_ref
       
       
    );
    
   
 xpm_cdc_serdes1_delay_2: xpm_cdc_array_single
       generic map (
     
         -- Common module generics
         DEST_SYNC_FF   => 4, -- integer; range: 2-10
         INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
         SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
         SRC_INPUT_REG  => 0, -- integer; 0=do not register input, 1=register input
         WIDTH          => 5  -- integer; range: 1-1024
     
       )
       port map (
     
         src_clk  => '1',  -- optional; required when SRC_INPUT_REG = 1
         src_in   => ext_serdes1_delay,
         dest_clk => clk_div_out2,
         dest_out =>  serdes2_delay(4 downto 0)
       );
       
 xpm_cdc_serdes1_program_delay_2:  xpm_cdc_array_single
        generic map (
      
          -- Common module generics
          DEST_SYNC_FF   => 4, -- integer; range: 2-10
          INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
          SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
          SRC_INPUT_REG  => 0, -- integer; 0=do not register input, 1=register input
          WIDTH          => 9  -- integer; range: 1-1024
      
        )
     port map (
        src_clk  => '1',  -- optional; required when SRC_INPUT_REG = 1
        src_in   => ext_serdes1_delay_exc2,
        dest_clk => clk_div_out2,
        dest_out => serdes2_program_delay
     );  
     
 
 xpm_cdc_bitsleep_2: xpm_cdc_array_single
     generic map (
   
       -- Common module generics
       DEST_SYNC_FF   => 4, -- integer; range: 2-10
       INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
       SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
       SRC_INPUT_REG  => 0, -- integer; 0=do not register input, 1=register input
       WIDTH          => 9  -- integer; range: 1-1024
   
     )
     port map (
   
       src_clk  => '1',  -- optional; required when SRC_INPUT_REG = 1
       src_in   => ext_bitsleep2,
       dest_clk => clk_div_out2,
       dest_out =>  ibitslip2
     );      
 
     bitsliepGen2 : process (clk_div_out2)
     begin
         if rising_edge(clk_div_out2) then
             obitslip2 <= ibitslip2;
             bitsleep2 <= ibitslip2 and (not obitslip2);
         end if;
     end process; 
 
--    ADC_SYNC2: adc_sync
--        Port Map(       
--             clk => clk_div_out2,
--             ce => '1',
--             start_delay => start_delay,
--             bitsleep => bitsleep2,
--             probe_data_A0 => ADC_A_1,
--             probe_data_B0 => ADC_B_1,
--             probe_data_A1 => ADC_A_3,
--             probe_data_B1 => ADC_B_3,
--             probe_data_A2 => ADC_A_5,
--             probe_data_B2 => ADC_B_5,
--             probe_data_A3 => ADC_A_7,
--             probe_data_B3 => ADC_B_7,
--             adc_frame => ADC_F_1,
--             serdes_delay => serdes2_delay,
--             serdes_dprog => serdes2_program_delay,
--             obit_locked => bit_locked2,
--             initialized => initialized2
--       );


end Behavioral;
