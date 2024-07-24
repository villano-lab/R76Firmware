----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2019 15:43:42
-- Design Name: 
-- Module Name: avalon_wrapper - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity avalon_wrapper is
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
	BUS_trig_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_trig_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_trig_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_trig_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_trig_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_trig_polarity_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_trig_polarity_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_trig_polarity_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_trig_inhib_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_trig_inhib_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_trig_inhib_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
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
	BUS_SyncIn_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_SyncIn_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_SyncIn_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_SyncIn_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_SyncIn_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_SyncIn_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
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
	BUS_io_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_io_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_io_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_io_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_io_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_io_to_encode_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_io_to_encode_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_io_to_encode_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_io_stamptype_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_io_stamptype_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_io_stamptype_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_io_lemo2out_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_io_lemo2out_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_io_lemo2out_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_io_divide_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_io_divide_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_io_divide_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
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
		REG_UNIQUE_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_UNIQUE_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
	

            REG_FIRMWARE_UNIQUE : IN STD_LOGIC_VECTOR(31 downto 0);
            REG_FIRMWARE_BUILD : IN STD_LOGIC_VECTOR(31 downto 0)    
    );
end avalon_wrapper;

architecture Behavioral of avalon_wrapper is
    --DA FPGA A PC
	signal f_BUS_INT_RD 	 :  STD_LOGIC;						--INTERRUPT DI LETTURA
	signal f_BUS_DATASTROBE  :  STD_LOGIC;						--CONFERMA CHE I DATI RICHIESTI SONO DISPONIBILI
	signal f_BUS_DATASTROBE_REG  :  STD_LOGIC;						--CONFERMA CHE I DATI RICHIESTI SONO DISPONIBILI (REGISTRI)
	signal f_BUS_DATA_RD	 :  STD_LOGIC_VECTOR(31 downto 0);	--DATI DA INVIARE AL PC
	signal f_BUS_DATA_RD_REG :  STD_LOGIC_VECTOR(31 downto 0);	--DATI DA INVIARE AL PC (REGISTRI)
	signal BUS_ADDR :  STD_LOGIC_VECTOR(31 downto 0);	         --INDIRIZZI
	
	--DA PC A FPGA
	signal f_BUS_INT_WR 	 :  STD_LOGIC;						--INTERRUPT DI SCRITTURA
	signal f_BUS_DATA_WR	 :  STD_LOGIC_VECTOR(31 downto 0);	--DATI DA INVIATI DAL PC
	signal wreg				 :  STD_LOGIC_VECTOR(31 downto 0);
	signal addr 			 : STD_LOGIC_VECTOR(31 downto 0);
	
	attribute keep : string;  
	attribute keep of BUS_ADDR: signal is "true"; 
	
begin


--    BUS_Test_0_R_INT(0) <= f_BUS_INT_RD when (addr >= x"03FE0000" And addr < x"03FEFFFF") else '0';
    BUS_Test_0_ADDRESS  <=  BUS_ADDR(15 downto 0) when (addr >= x"03FE0000" And addr < x"03FEFFFF") else (others => '0');
    BUS_Test_0_WRITE_DATA  <= f_BUS_DATA_WR;    
    BUS_Test_0_W_INT (0) <=  f_BUS_INT_WR when (addr >= x"03FE0000" And addr < x"03FEFFFF") else '0';
--    f_BUS_DATA_RD    <=     BUS_Test_0_READ_DATA when  (addr >= x"03FE0000" And addr < x"03FEFFFF") else 
--                             f_BUS_DATA_RD_REG;  
    
BUS_Energies_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00000000" And addr < x"00008000") else '0';
BUS_Energies_READ_ADDRESS <= BUS_ADDR(14 downto 0) when (addr >= x"00000000" And addr < x"00008000") else (others => '0');BUS_Analog_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00010000" And addr < x"00018000") else '0';
BUS_Analog_READ_ADDRESS <= BUS_ADDR(14 downto 0) when (addr >= x"00010000" And addr < x"00018000") else (others => '0');BUS_RateMeter_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00020000" And addr < x"00030000") else '0';
BUS_RateMeter_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00020000" And addr < x"00030000") else (others => '0');BUS_diag_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00031000" And addr < x"00032000") else '0';
BUS_diag_READ_ADDRESS <= BUS_ADDR(11 downto 0) when (addr >= x"00031000" And addr < x"00032000") else (others => '0');BUS_All_Energies_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00032008" And addr < x"00032009") else '0';BUS_Spectrum_0_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00040000" And addr < x"00050000") else '0';
BUS_Spectrum_0_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00040000" And addr < x"00050000") else (others => '0');BUS_Analog_In_Unflipped_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00058000" And addr < x"00060000") else '0';
BUS_Analog_In_Unflipped_READ_ADDRESS <= BUS_ADDR(14 downto 0) when (addr >= x"00058000" And addr < x"00060000") else (others => '0');BUS_Spectrum_12_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00070000" And addr < x"00080000") else '0';
BUS_Spectrum_12_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00070000" And addr < x"00080000") else (others => '0');BUS_Spectrum_1_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00090000" And addr < x"000A0000") else '0';
BUS_Spectrum_1_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00090000" And addr < x"000A0000") else (others => '0');BUS_Spectrum_13_R_INT(0) <= f_BUS_INT_RD when (addr >= x"000B0000" And addr < x"000C0000") else '0';
BUS_Spectrum_13_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"000B0000" And addr < x"000C0000") else (others => '0');BUS_Spectrum_2_R_INT(0) <= f_BUS_INT_RD when (addr >= x"000D0000" And addr < x"000E0000") else '0';
BUS_Spectrum_2_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"000D0000" And addr < x"000E0000") else (others => '0');BUS_Spectrum_14_R_INT(0) <= f_BUS_INT_RD when (addr >= x"000F0000" And addr < x"00100000") else '0';
BUS_Spectrum_14_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"000F0000" And addr < x"00100000") else (others => '0');BUS_Spectrum_3_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00110000" And addr < x"00120000") else '0';
BUS_Spectrum_3_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00110000" And addr < x"00120000") else (others => '0');BUS_Spectrum_15_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00130000" And addr < x"00140000") else '0';
BUS_Spectrum_15_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00130000" And addr < x"00140000") else (others => '0');BUS_Spectrum_4_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00150000" And addr < x"00160000") else '0';
BUS_Spectrum_4_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00150000" And addr < x"00160000") else (others => '0');BUS_Spectrum_16_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00170000" And addr < x"00180000") else '0';
BUS_Spectrum_16_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00170000" And addr < x"00180000") else (others => '0');BUS_Spectrum_5_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00190000" And addr < x"001A0000") else '0';
BUS_Spectrum_5_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00190000" And addr < x"001A0000") else (others => '0');BUS_Spectrum_17_R_INT(0) <= f_BUS_INT_RD when (addr >= x"001B0000" And addr < x"001C0000") else '0';
BUS_Spectrum_17_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"001B0000" And addr < x"001C0000") else (others => '0');BUS_Spectrum_6_R_INT(0) <= f_BUS_INT_RD when (addr >= x"001D0000" And addr < x"001E0000") else '0';
BUS_Spectrum_6_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"001D0000" And addr < x"001E0000") else (others => '0');BUS_Spectrum_18_R_INT(0) <= f_BUS_INT_RD when (addr >= x"001F0000" And addr < x"00200000") else '0';
BUS_Spectrum_18_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"001F0000" And addr < x"00200000") else (others => '0');BUS_Spectrum_7_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00210000" And addr < x"00220000") else '0';
BUS_Spectrum_7_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00210000" And addr < x"00220000") else (others => '0');BUS_Spectrum_19_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00230000" And addr < x"00240000") else '0';
BUS_Spectrum_19_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00230000" And addr < x"00240000") else (others => '0');BUS_Spectrum_8_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00250000" And addr < x"00260000") else '0';
BUS_Spectrum_8_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00250000" And addr < x"00260000") else (others => '0');BUS_Spectrum_20_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00270000" And addr < x"00280000") else '0';
BUS_Spectrum_20_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00270000" And addr < x"00280000") else (others => '0');BUS_Spectrum_9_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00290000" And addr < x"002A0000") else '0';
BUS_Spectrum_9_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00290000" And addr < x"002A0000") else (others => '0');BUS_Spectrum_21_R_INT(0) <= f_BUS_INT_RD when (addr >= x"002B0000" And addr < x"002C0000") else '0';
BUS_Spectrum_21_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"002B0000" And addr < x"002C0000") else (others => '0');BUS_SyncIn_R_INT(0) <= f_BUS_INT_RD when (addr >= x"002D0000" And addr < x"002E0000") else '0';
BUS_SyncIn_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"002D0000" And addr < x"002E0000") else (others => '0');BUS_Spectrum_10_R_INT(0) <= f_BUS_INT_RD when (addr >= x"002F0000" And addr < x"00300000") else '0';
BUS_Spectrum_10_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"002F0000" And addr < x"00300000") else (others => '0');BUS_Spectrum_22_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00310000" And addr < x"00320000") else '0';
BUS_Spectrum_22_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00310000" And addr < x"00320000") else (others => '0');BUS_Spectrum_11_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00330000" And addr < x"00340000") else '0';
BUS_Spectrum_11_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00330000" And addr < x"00340000") else (others => '0');BUS_Spectrum_23_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00350000" And addr < x"00360000") else '0';
BUS_Spectrum_23_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00350000" And addr < x"00360000") else (others => '0');BUS_Syncs_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00361000" And addr < x"00362000") else '0';
BUS_Syncs_READ_ADDRESS <= BUS_ADDR(11 downto 0) when (addr >= x"00361000" And addr < x"00362000") else (others => '0');BUS_baselines_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00368000" And addr < x"00370000") else '0';
BUS_baselines_READ_ADDRESS <= BUS_ADDR(14 downto 0) when (addr >= x"00368000" And addr < x"00370000") else (others => '0');
f_BUS_DATA_RD <= BUS_Test_0_READ_DATA when  (addr >= x"03FE0000" And addr < x"03FEFFFF") else 
BUS_Energies_READ_DATA  when  addr >= x"00000000" and addr < x"00008000" else 
BUS_Analog_READ_DATA  when  addr >= x"00010000" and addr < x"00018000" else 
BUS_RateMeter_READ_DATA  when  addr >= x"00020000" and addr < x"00030000" else 
BUS_diag_READ_DATA  when  addr >= x"00031000" and addr < x"00032000" else 
 BUS_All_Energies_READ_DATA when (addr >= x"00032008" And addr < x"00032009") else BUS_Spectrum_0_READ_DATA  when  addr >= x"00040000" and addr < x"00050000" else 
BUS_Analog_In_Unflipped_READ_DATA  when  addr >= x"00058000" and addr < x"00060000" else 
BUS_Spectrum_12_READ_DATA  when  addr >= x"00070000" and addr < x"00080000" else 
BUS_Spectrum_1_READ_DATA  when  addr >= x"00090000" and addr < x"000A0000" else 
BUS_Spectrum_13_READ_DATA  when  addr >= x"000B0000" and addr < x"000C0000" else 
BUS_Spectrum_2_READ_DATA  when  addr >= x"000D0000" and addr < x"000E0000" else 
BUS_Spectrum_14_READ_DATA  when  addr >= x"000F0000" and addr < x"00100000" else 
BUS_Spectrum_3_READ_DATA  when  addr >= x"00110000" and addr < x"00120000" else 
BUS_Spectrum_15_READ_DATA  when  addr >= x"00130000" and addr < x"00140000" else 
BUS_Spectrum_4_READ_DATA  when  addr >= x"00150000" and addr < x"00160000" else 
BUS_Spectrum_16_READ_DATA  when  addr >= x"00170000" and addr < x"00180000" else 
BUS_Spectrum_5_READ_DATA  when  addr >= x"00190000" and addr < x"001A0000" else 
BUS_Spectrum_17_READ_DATA  when  addr >= x"001B0000" and addr < x"001C0000" else 
BUS_Spectrum_6_READ_DATA  when  addr >= x"001D0000" and addr < x"001E0000" else 
BUS_Spectrum_18_READ_DATA  when  addr >= x"001F0000" and addr < x"00200000" else 
BUS_Spectrum_7_READ_DATA  when  addr >= x"00210000" and addr < x"00220000" else 
BUS_Spectrum_19_READ_DATA  when  addr >= x"00230000" and addr < x"00240000" else 
BUS_Spectrum_8_READ_DATA  when  addr >= x"00250000" and addr < x"00260000" else 
BUS_Spectrum_20_READ_DATA  when  addr >= x"00270000" and addr < x"00280000" else 
BUS_Spectrum_9_READ_DATA  when  addr >= x"00290000" and addr < x"002A0000" else 
BUS_Spectrum_21_READ_DATA  when  addr >= x"002B0000" and addr < x"002C0000" else 
BUS_SyncIn_READ_DATA  when  addr >= x"002D0000" and addr < x"002E0000" else 
BUS_Spectrum_10_READ_DATA  when  addr >= x"002F0000" and addr < x"00300000" else 
BUS_Spectrum_22_READ_DATA  when  addr >= x"00310000" and addr < x"00320000" else 
BUS_Spectrum_11_READ_DATA  when  addr >= x"00330000" and addr < x"00340000" else 
BUS_Spectrum_23_READ_DATA  when  addr >= x"00350000" and addr < x"00360000" else 
BUS_Syncs_READ_DATA  when  addr >= x"00361000" and addr < x"00362000" else 
BUS_baselines_READ_DATA  when  addr >= x"00368000" and addr < x"00370000" else 
 f_BUS_DATA_RD_REG;
 f_BUS_DATASTROBE <=BUS_Test_0_VLD(0) when  (addr >= x"03FE0000" And addr < x"03FEFFFF") else 
 BUS_Energies_VLD(0) when  addr >= x"00000000" and addr < x"00008000" else 
 BUS_Analog_VLD(0) when  addr >= x"00010000" and addr < x"00018000" else 
 BUS_RateMeter_VLD(0) when  addr >= x"00020000" and addr < x"00030000" else 
 BUS_diag_VLD(0) when  addr >= x"00031000" and addr < x"00032000" else 
  BUS_All_Energies_VLD(0) when (addr >= x"00032008" And addr < x"00032009") else  BUS_Spectrum_0_VLD(0) when  addr >= x"00040000" and addr < x"00050000" else 
 BUS_Analog_In_Unflipped_VLD(0) when  addr >= x"00058000" and addr < x"00060000" else 
 BUS_Spectrum_12_VLD(0) when  addr >= x"00070000" and addr < x"00080000" else 
 BUS_Spectrum_1_VLD(0) when  addr >= x"00090000" and addr < x"000A0000" else 
 BUS_Spectrum_13_VLD(0) when  addr >= x"000B0000" and addr < x"000C0000" else 
 BUS_Spectrum_2_VLD(0) when  addr >= x"000D0000" and addr < x"000E0000" else 
 BUS_Spectrum_14_VLD(0) when  addr >= x"000F0000" and addr < x"00100000" else 
 BUS_Spectrum_3_VLD(0) when  addr >= x"00110000" and addr < x"00120000" else 
 BUS_Spectrum_15_VLD(0) when  addr >= x"00130000" and addr < x"00140000" else 
 BUS_Spectrum_4_VLD(0) when  addr >= x"00150000" and addr < x"00160000" else 
 BUS_Spectrum_16_VLD(0) when  addr >= x"00170000" and addr < x"00180000" else 
 BUS_Spectrum_5_VLD(0) when  addr >= x"00190000" and addr < x"001A0000" else 
 BUS_Spectrum_17_VLD(0) when  addr >= x"001B0000" and addr < x"001C0000" else 
 BUS_Spectrum_6_VLD(0) when  addr >= x"001D0000" and addr < x"001E0000" else 
 BUS_Spectrum_18_VLD(0) when  addr >= x"001F0000" and addr < x"00200000" else 
 BUS_Spectrum_7_VLD(0) when  addr >= x"00210000" and addr < x"00220000" else 
 BUS_Spectrum_19_VLD(0) when  addr >= x"00230000" and addr < x"00240000" else 
 BUS_Spectrum_8_VLD(0) when  addr >= x"00250000" and addr < x"00260000" else 
 BUS_Spectrum_20_VLD(0) when  addr >= x"00270000" and addr < x"00280000" else 
 BUS_Spectrum_9_VLD(0) when  addr >= x"00290000" and addr < x"002A0000" else 
 BUS_Spectrum_21_VLD(0) when  addr >= x"002B0000" and addr < x"002C0000" else 
 BUS_SyncIn_VLD(0) when  addr >= x"002D0000" and addr < x"002E0000" else 
 BUS_Spectrum_10_VLD(0) when  addr >= x"002F0000" and addr < x"00300000" else 
 BUS_Spectrum_22_VLD(0) when  addr >= x"00310000" and addr < x"00320000" else 
 BUS_Spectrum_11_VLD(0) when  addr >= x"00330000" and addr < x"00340000" else 
 BUS_Spectrum_23_VLD(0) when  addr >= x"00350000" and addr < x"00360000" else 
 BUS_Syncs_VLD(0) when  addr >= x"00361000" and addr < x"00362000" else 
 BUS_baselines_VLD(0) when  addr >= x"00368000" and addr < x"00370000" else 
 f_BUS_DATASTROBE_REG;    

        
    addr <= BUS_ADDR;
    wreg <= f_BUS_DATA_WR;
        
        register_manager : process(clk)
            variable rreg    :  STD_LOGIC_VECTOR(31 downto 0);
        begin
            if reset='1' then
--                	BUS_Energies_W_INT <= "0";
		INT_Energies_READ_STATUS_RD <= "0";
		INT_Energies_READ_POSITION_RD <= "0";
		REG_Energies_CONFIG_TRIGGER_MODE_WR <= (others => '0');
		INT_Energies_CONFIG_TRIGGER_MODE_WR <= "0";
		REG_Energies_CONFIG_PRETRIGGER_WR <= (others => '0');
		INT_Energies_CONFIG_PRETRIGGER_WR <= "0";
		REG_Energies_CONFIG_TRIGGER_LEVEL_WR <= (others => '0');
		INT_Energies_CONFIG_TRIGGER_LEVEL_WR <= "0";
		REG_Energies_CONFIG_ARM_WR <= (others => '0');
		INT_Energies_CONFIG_ARM_WR <= "0";
		REG_Energies_CONFIG_DECIMATOR_WR <= (others => '0');
		INT_Energies_CONFIG_DECIMATOR_WR <= "0";
	BUS_Analog_W_INT <= "0";
		INT_Analog_READ_STATUS_RD <= "0";
		INT_Analog_READ_POSITION_RD <= "0";
		REG_Analog_CONFIG_TRIGGER_MODE_WR <= (others => '0');
		INT_Analog_CONFIG_TRIGGER_MODE_WR <= "0";
		REG_Analog_CONFIG_PRETRIGGER_WR <= (others => '0');
		INT_Analog_CONFIG_PRETRIGGER_WR <= "0";
		REG_Analog_CONFIG_TRIGGER_LEVEL_WR <= (others => '0');
		INT_Analog_CONFIG_TRIGGER_LEVEL_WR <= "0";
		REG_Analog_CONFIG_ARM_WR <= (others => '0');
		INT_Analog_CONFIG_ARM_WR <= "0";
		REG_Analog_CONFIG_DECIMATOR_WR <= (others => '0');
		INT_Analog_CONFIG_DECIMATOR_WR <= "0";
	BUS_trig_W_INT <= "0";
		REG_trig_polarity_WR <= (others => '0');
		INT_trig_polarity_WR <= "0";
		REG_trig_inhib_WR <= (others => '0');
		INT_trig_inhib_WR <= "0";
		REG_trig_gate_l_WR <= (others => '0');
		INT_trig_gate_l_WR <= "0";
		REG_trig_gate_u_WR <= (others => '0');
		INT_trig_gate_u_WR <= "0";
		REG_trig_delay_WR <= (others => '0');
		INT_trig_delay_WR <= "0";
		REG_trig_mode_WR <= (others => '0');
		INT_trig_mode_WR <= "0";
	BUS_RateMeter_W_INT <= "0";
	BUS_thrsh_W_INT <= "0";
		REG_thrsh_CH0_WR <= (others => '0');
		INT_thrsh_CH0_WR <= "0";
		REG_thrsh_CH1_WR <= (others => '0');
		INT_thrsh_CH1_WR <= "0";
		REG_thrsh_CH2_WR <= (others => '0');
		INT_thrsh_CH2_WR <= "0";
		REG_thrsh_CH3_WR <= (others => '0');
		INT_thrsh_CH3_WR <= "0";
		REG_thrsh_CH4_WR <= (others => '0');
		INT_thrsh_CH4_WR <= "0";
		REG_thrsh_CH5_WR <= (others => '0');
		INT_thrsh_CH5_WR <= "0";
		REG_thrsh_CH6_WR <= (others => '0');
		INT_thrsh_CH6_WR <= "0";
		REG_thrsh_CH7_WR <= (others => '0');
		INT_thrsh_CH7_WR <= "0";
		REG_thrsh_CH8_WR <= (others => '0');
		INT_thrsh_CH8_WR <= "0";
		REG_thrsh_CH9_WR <= (others => '0');
		INT_thrsh_CH9_WR <= "0";
		REG_thrsh_CH10_WR <= (others => '0');
		INT_thrsh_CH10_WR <= "0";
		REG_thrsh_CH11_WR <= (others => '0');
		INT_thrsh_CH11_WR <= "0";
		REG_thrsh_CH12_WR <= (others => '0');
		INT_thrsh_CH12_WR <= "0";
		REG_thrsh_CH13_WR <= (others => '0');
		INT_thrsh_CH13_WR <= "0";
		REG_thrsh_CH14_WR <= (others => '0');
		INT_thrsh_CH14_WR <= "0";
		REG_thrsh_CH15_WR <= (others => '0');
		INT_thrsh_CH15_WR <= "0";
		REG_thrsh_CH16_WR <= (others => '0');
		INT_thrsh_CH16_WR <= "0";
		REG_thrsh_CH17_WR <= (others => '0');
		INT_thrsh_CH17_WR <= "0";
		REG_thrsh_CH18_WR <= (others => '0');
		INT_thrsh_CH18_WR <= "0";
		REG_thrsh_CH19_WR <= (others => '0');
		INT_thrsh_CH19_WR <= "0";
		REG_thrsh_CH20_WR <= (others => '0');
		INT_thrsh_CH20_WR <= "0";
		REG_thrsh_CH21_WR <= (others => '0');
		INT_thrsh_CH21_WR <= "0";
		REG_thrsh_CH22_WR <= (others => '0');
		INT_thrsh_CH22_WR <= "0";
		REG_thrsh_CH23_WR <= (others => '0');
		INT_thrsh_CH23_WR <= "0";
	BUS_diag_W_INT <= "0";
		INT_diag_READ_STATUS_RD <= "0";
		INT_diag_READ_POSITION_RD <= "0";
		REG_diag_CONFIG_TRIGGER_MODE_WR <= (others => '0');
		INT_diag_CONFIG_TRIGGER_MODE_WR <= "0";
		REG_diag_CONFIG_PRETRIGGER_WR <= (others => '0');
		INT_diag_CONFIG_PRETRIGGER_WR <= "0";
		REG_diag_CONFIG_TRIGGER_LEVEL_WR <= (others => '0');
		INT_diag_CONFIG_TRIGGER_LEVEL_WR <= "0";
		REG_diag_CONFIG_ARM_WR <= (others => '0');
		INT_diag_CONFIG_ARM_WR <= "0";
		REG_diag_CONFIG_DECIMATOR_WR <= (others => '0');
		INT_diag_CONFIG_DECIMATOR_WR <= "0";
	BUS_All_Energies_W_INT <= "0";
		INT_All_Energies_READ_STATUS_RD <= "0";
		INT_All_Energies_READ_VALID_WORDS_RD <= "0";
		REG_All_Energies_CONFIG_WR <= (others => '0');
		INT_All_Energies_CONFIG_WR <= "0";
	BUS_top_W_INT <= "0";
		REG_top_CH0_WR <= (others => '0');
		INT_top_CH0_WR <= "0";
		REG_top_CH1_WR <= (others => '0');
		INT_top_CH1_WR <= "0";
		REG_top_CH2_WR <= (others => '0');
		INT_top_CH2_WR <= "0";
		REG_top_CH3_WR <= (others => '0');
		INT_top_CH3_WR <= "0";
		REG_top_CH4_WR <= (others => '0');
		INT_top_CH4_WR <= "0";
		REG_top_CH5_WR <= (others => '0');
		INT_top_CH5_WR <= "0";
		REG_top_CH6_WR <= (others => '0');
		INT_top_CH6_WR <= "0";
		REG_top_CH7_WR <= (others => '0');
		INT_top_CH7_WR <= "0";
		REG_top_CH8_WR <= (others => '0');
		INT_top_CH8_WR <= "0";
		REG_top_CH9_WR <= (others => '0');
		INT_top_CH9_WR <= "0";
		REG_top_CH10_WR <= (others => '0');
		INT_top_CH10_WR <= "0";
		REG_top_CH11_WR <= (others => '0');
		INT_top_CH11_WR <= "0";
		REG_top_CH12_WR <= (others => '0');
		INT_top_CH12_WR <= "0";
		REG_top_CH13_WR <= (others => '0');
		INT_top_CH13_WR <= "0";
		REG_top_CH14_WR <= (others => '0');
		INT_top_CH14_WR <= "0";
		REG_top_CH15_WR <= (others => '0');
		INT_top_CH15_WR <= "0";
		REG_top_CH16_WR <= (others => '0');
		INT_top_CH16_WR <= "0";
		REG_top_CH17_WR <= (others => '0');
		INT_top_CH17_WR <= "0";
		REG_top_CH18_WR <= (others => '0');
		INT_top_CH18_WR <= "0";
		REG_top_CH19_WR <= (others => '0');
		INT_top_CH19_WR <= "0";
		REG_top_CH20_WR <= (others => '0');
		INT_top_CH20_WR <= "0";
		REG_top_CH21_WR <= (others => '0');
		INT_top_CH21_WR <= "0";
		REG_top_CH22_WR <= (others => '0');
		INT_top_CH22_WR <= "0";
		REG_top_CH23_WR <= (others => '0');
		INT_top_CH23_WR <= "0";
	BUS_base_W_INT <= "0";
		REG_base_CH0_WR <= (others => '0');
		INT_base_CH0_WR <= "0";
		REG_base_CH1_WR <= (others => '0');
		INT_base_CH1_WR <= "0";
		REG_base_CH2_WR <= (others => '0');
		INT_base_CH2_WR <= "0";
		REG_base_CH3_WR <= (others => '0');
		INT_base_CH3_WR <= "0";
		REG_base_CH4_WR <= (others => '0');
		INT_base_CH4_WR <= "0";
		REG_base_CH5_WR <= (others => '0');
		INT_base_CH5_WR <= "0";
		REG_base_CH6_WR <= (others => '0');
		INT_base_CH6_WR <= "0";
		REG_base_CH7_WR <= (others => '0');
		INT_base_CH7_WR <= "0";
		REG_base_CH8_WR <= (others => '0');
		INT_base_CH8_WR <= "0";
		REG_base_CH9_WR <= (others => '0');
		INT_base_CH9_WR <= "0";
		REG_base_CH10_WR <= (others => '0');
		INT_base_CH10_WR <= "0";
		REG_base_CH11_WR <= (others => '0');
		INT_base_CH11_WR <= "0";
		REG_base_CH12_WR <= (others => '0');
		INT_base_CH12_WR <= "0";
		REG_base_CH13_WR <= (others => '0');
		INT_base_CH13_WR <= "0";
		REG_base_CH14_WR <= (others => '0');
		INT_base_CH14_WR <= "0";
		REG_base_CH15_WR <= (others => '0');
		INT_base_CH15_WR <= "0";
		REG_base_CH16_WR <= (others => '0');
		INT_base_CH16_WR <= "0";
		REG_base_CH17_WR <= (others => '0');
		INT_base_CH17_WR <= "0";
		REG_base_CH18_WR <= (others => '0');
		INT_base_CH18_WR <= "0";
		REG_base_CH19_WR <= (others => '0');
		INT_base_CH19_WR <= "0";
		REG_base_CH20_WR <= (others => '0');
		INT_base_CH20_WR <= "0";
		REG_base_CH21_WR <= (others => '0');
		INT_base_CH21_WR <= "0";
		REG_base_CH22_WR <= (others => '0');
		INT_base_CH22_WR <= "0";
		REG_base_CH23_WR <= (others => '0');
		INT_base_CH23_WR <= "0";
	BUS_disable_det_W_INT <= "0";
		REG_disable_det_CH0_WR <= (others => '0');
		INT_disable_det_CH0_WR <= "0";
		REG_disable_det_CH1_WR <= (others => '0');
		INT_disable_det_CH1_WR <= "0";
		REG_disable_det_CH2_WR <= (others => '0');
		INT_disable_det_CH2_WR <= "0";
		REG_disable_det_CH3_WR <= (others => '0');
		INT_disable_det_CH3_WR <= "0";
		REG_disable_det_CH4_WR <= (others => '0');
		INT_disable_det_CH4_WR <= "0";
		REG_disable_det_CH5_WR <= (others => '0');
		INT_disable_det_CH5_WR <= "0";
		REG_disable_det_CH6_WR <= (others => '0');
		INT_disable_det_CH6_WR <= "0";
		REG_disable_det_CH7_WR <= (others => '0');
		INT_disable_det_CH7_WR <= "0";
		REG_disable_det_CH8_WR <= (others => '0');
		INT_disable_det_CH8_WR <= "0";
		REG_disable_det_CH9_WR <= (others => '0');
		INT_disable_det_CH9_WR <= "0";
		REG_disable_det_CH10_WR <= (others => '0');
		INT_disable_det_CH10_WR <= "0";
		REG_disable_det_CH11_WR <= (others => '0');
		INT_disable_det_CH11_WR <= "0";
		REG_disable_det_CH12_WR <= (others => '0');
		INT_disable_det_CH12_WR <= "0";
		REG_disable_det_CH13_WR <= (others => '0');
		INT_disable_det_CH13_WR <= "0";
		REG_disable_det_CH14_WR <= (others => '0');
		INT_disable_det_CH14_WR <= "0";
		REG_disable_det_CH15_WR <= (others => '0');
		INT_disable_det_CH15_WR <= "0";
		REG_disable_det_CH16_WR <= (others => '0');
		INT_disable_det_CH16_WR <= "0";
		REG_disable_det_CH17_WR <= (others => '0');
		INT_disable_det_CH17_WR <= "0";
		REG_disable_det_CH18_WR <= (others => '0');
		INT_disable_det_CH18_WR <= "0";
		REG_disable_det_CH19_WR <= (others => '0');
		INT_disable_det_CH19_WR <= "0";
		REG_disable_det_CH20_WR <= (others => '0');
		INT_disable_det_CH20_WR <= "0";
		REG_disable_det_CH21_WR <= (others => '0');
		INT_disable_det_CH21_WR <= "0";
		REG_disable_det_CH22_WR <= (others => '0');
		INT_disable_det_CH22_WR <= "0";
		REG_disable_det_CH23_WR <= (others => '0');
		INT_disable_det_CH23_WR <= "0";
	BUS_Spectrum_0_W_INT <= "0";
		INT_Spectrum_0_STATUS_RD <= "0";
		REG_Spectrum_0_CONFIG_WR <= (others => '0');
		INT_Spectrum_0_CONFIG_WR <= "0";
		REG_Spectrum_0_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_0_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_0_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_0_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_0_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_0_CONFIG_MIN_WR <= "0";
		REG_Spectrum_0_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_0_CONFIG_MAX_WR <= "0";
	BUS_Analog_In_Unflipped_W_INT <= "0";
		INT_Analog_In_Unflipped_READ_STATUS_RD <= "0";
		INT_Analog_In_Unflipped_READ_POSITION_RD <= "0";
		REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR <= (others => '0');
		INT_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR <= "0";
		REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR <= (others => '0');
		INT_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR <= "0";
		REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR <= (others => '0');
		INT_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR <= "0";
		REG_Analog_In_Unflipped_CONFIG_ARM_WR <= (others => '0');
		INT_Analog_In_Unflipped_CONFIG_ARM_WR <= "0";
		REG_Analog_In_Unflipped_CONFIG_DECIMATOR_WR <= (others => '0');
		INT_Analog_In_Unflipped_CONFIG_DECIMATOR_WR <= "0";
	BUS_Spectrum_12_W_INT <= "0";
		INT_Spectrum_12_STATUS_RD <= "0";
		REG_Spectrum_12_CONFIG_WR <= (others => '0');
		INT_Spectrum_12_CONFIG_WR <= "0";
		REG_Spectrum_12_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_12_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_12_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_12_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_12_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_12_CONFIG_MIN_WR <= "0";
		REG_Spectrum_12_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_12_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_1_W_INT <= "0";
		INT_Spectrum_1_STATUS_RD <= "0";
		REG_Spectrum_1_CONFIG_WR <= (others => '0');
		INT_Spectrum_1_CONFIG_WR <= "0";
		REG_Spectrum_1_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_1_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_1_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_1_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_1_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_1_CONFIG_MIN_WR <= "0";
		REG_Spectrum_1_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_1_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_13_W_INT <= "0";
		INT_Spectrum_13_STATUS_RD <= "0";
		REG_Spectrum_13_CONFIG_WR <= (others => '0');
		INT_Spectrum_13_CONFIG_WR <= "0";
		REG_Spectrum_13_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_13_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_13_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_13_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_13_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_13_CONFIG_MIN_WR <= "0";
		REG_Spectrum_13_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_13_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_2_W_INT <= "0";
		INT_Spectrum_2_STATUS_RD <= "0";
		REG_Spectrum_2_CONFIG_WR <= (others => '0');
		INT_Spectrum_2_CONFIG_WR <= "0";
		REG_Spectrum_2_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_2_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_2_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_2_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_2_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_2_CONFIG_MIN_WR <= "0";
		REG_Spectrum_2_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_2_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_14_W_INT <= "0";
		INT_Spectrum_14_STATUS_RD <= "0";
		REG_Spectrum_14_CONFIG_WR <= (others => '0');
		INT_Spectrum_14_CONFIG_WR <= "0";
		REG_Spectrum_14_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_14_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_14_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_14_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_14_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_14_CONFIG_MIN_WR <= "0";
		REG_Spectrum_14_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_14_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_3_W_INT <= "0";
		INT_Spectrum_3_STATUS_RD <= "0";
		REG_Spectrum_3_CONFIG_WR <= (others => '0');
		INT_Spectrum_3_CONFIG_WR <= "0";
		REG_Spectrum_3_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_3_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_3_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_3_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_3_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_3_CONFIG_MIN_WR <= "0";
		REG_Spectrum_3_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_3_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_15_W_INT <= "0";
		INT_Spectrum_15_STATUS_RD <= "0";
		REG_Spectrum_15_CONFIG_WR <= (others => '0');
		INT_Spectrum_15_CONFIG_WR <= "0";
		REG_Spectrum_15_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_15_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_15_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_15_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_15_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_15_CONFIG_MIN_WR <= "0";
		REG_Spectrum_15_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_15_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_4_W_INT <= "0";
		INT_Spectrum_4_STATUS_RD <= "0";
		REG_Spectrum_4_CONFIG_WR <= (others => '0');
		INT_Spectrum_4_CONFIG_WR <= "0";
		REG_Spectrum_4_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_4_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_4_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_4_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_4_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_4_CONFIG_MIN_WR <= "0";
		REG_Spectrum_4_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_4_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_16_W_INT <= "0";
		INT_Spectrum_16_STATUS_RD <= "0";
		REG_Spectrum_16_CONFIG_WR <= (others => '0');
		INT_Spectrum_16_CONFIG_WR <= "0";
		REG_Spectrum_16_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_16_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_16_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_16_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_16_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_16_CONFIG_MIN_WR <= "0";
		REG_Spectrum_16_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_16_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_5_W_INT <= "0";
		INT_Spectrum_5_STATUS_RD <= "0";
		REG_Spectrum_5_CONFIG_WR <= (others => '0');
		INT_Spectrum_5_CONFIG_WR <= "0";
		REG_Spectrum_5_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_5_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_5_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_5_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_5_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_5_CONFIG_MIN_WR <= "0";
		REG_Spectrum_5_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_5_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_17_W_INT <= "0";
		INT_Spectrum_17_STATUS_RD <= "0";
		REG_Spectrum_17_CONFIG_WR <= (others => '0');
		INT_Spectrum_17_CONFIG_WR <= "0";
		REG_Spectrum_17_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_17_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_17_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_17_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_17_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_17_CONFIG_MIN_WR <= "0";
		REG_Spectrum_17_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_17_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_6_W_INT <= "0";
		INT_Spectrum_6_STATUS_RD <= "0";
		REG_Spectrum_6_CONFIG_WR <= (others => '0');
		INT_Spectrum_6_CONFIG_WR <= "0";
		REG_Spectrum_6_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_6_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_6_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_6_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_6_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_6_CONFIG_MIN_WR <= "0";
		REG_Spectrum_6_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_6_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_18_W_INT <= "0";
		INT_Spectrum_18_STATUS_RD <= "0";
		REG_Spectrum_18_CONFIG_WR <= (others => '0');
		INT_Spectrum_18_CONFIG_WR <= "0";
		REG_Spectrum_18_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_18_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_18_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_18_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_18_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_18_CONFIG_MIN_WR <= "0";
		REG_Spectrum_18_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_18_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_7_W_INT <= "0";
		INT_Spectrum_7_STATUS_RD <= "0";
		REG_Spectrum_7_CONFIG_WR <= (others => '0');
		INT_Spectrum_7_CONFIG_WR <= "0";
		REG_Spectrum_7_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_7_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_7_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_7_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_7_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_7_CONFIG_MIN_WR <= "0";
		REG_Spectrum_7_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_7_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_19_W_INT <= "0";
		INT_Spectrum_19_STATUS_RD <= "0";
		REG_Spectrum_19_CONFIG_WR <= (others => '0');
		INT_Spectrum_19_CONFIG_WR <= "0";
		REG_Spectrum_19_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_19_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_19_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_19_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_19_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_19_CONFIG_MIN_WR <= "0";
		REG_Spectrum_19_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_19_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_8_W_INT <= "0";
		INT_Spectrum_8_STATUS_RD <= "0";
		REG_Spectrum_8_CONFIG_WR <= (others => '0');
		INT_Spectrum_8_CONFIG_WR <= "0";
		REG_Spectrum_8_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_8_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_8_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_8_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_8_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_8_CONFIG_MIN_WR <= "0";
		REG_Spectrum_8_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_8_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_20_W_INT <= "0";
		INT_Spectrum_20_STATUS_RD <= "0";
		REG_Spectrum_20_CONFIG_WR <= (others => '0');
		INT_Spectrum_20_CONFIG_WR <= "0";
		REG_Spectrum_20_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_20_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_20_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_20_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_20_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_20_CONFIG_MIN_WR <= "0";
		REG_Spectrum_20_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_20_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_9_W_INT <= "0";
		INT_Spectrum_9_STATUS_RD <= "0";
		REG_Spectrum_9_CONFIG_WR <= (others => '0');
		INT_Spectrum_9_CONFIG_WR <= "0";
		REG_Spectrum_9_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_9_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_9_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_9_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_9_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_9_CONFIG_MIN_WR <= "0";
		REG_Spectrum_9_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_9_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_21_W_INT <= "0";
		INT_Spectrum_21_STATUS_RD <= "0";
		REG_Spectrum_21_CONFIG_WR <= (others => '0');
		INT_Spectrum_21_CONFIG_WR <= "0";
		REG_Spectrum_21_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_21_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_21_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_21_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_21_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_21_CONFIG_MIN_WR <= "0";
		REG_Spectrum_21_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_21_CONFIG_MAX_WR <= "0";
	BUS_SyncIn_W_INT <= "0";
	BUS_Spectrum_10_W_INT <= "0";
		INT_Spectrum_10_STATUS_RD <= "0";
		REG_Spectrum_10_CONFIG_WR <= (others => '0');
		INT_Spectrum_10_CONFIG_WR <= "0";
		REG_Spectrum_10_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_10_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_10_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_10_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_10_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_10_CONFIG_MIN_WR <= "0";
		REG_Spectrum_10_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_10_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_22_W_INT <= "0";
		INT_Spectrum_22_STATUS_RD <= "0";
		REG_Spectrum_22_CONFIG_WR <= (others => '0');
		INT_Spectrum_22_CONFIG_WR <= "0";
		REG_Spectrum_22_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_22_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_22_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_22_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_22_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_22_CONFIG_MIN_WR <= "0";
		REG_Spectrum_22_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_22_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_11_W_INT <= "0";
		INT_Spectrum_11_STATUS_RD <= "0";
		REG_Spectrum_11_CONFIG_WR <= (others => '0');
		INT_Spectrum_11_CONFIG_WR <= "0";
		REG_Spectrum_11_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_11_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_11_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_11_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_11_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_11_CONFIG_MIN_WR <= "0";
		REG_Spectrum_11_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_11_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_23_W_INT <= "0";
		INT_Spectrum_23_STATUS_RD <= "0";
		REG_Spectrum_23_CONFIG_WR <= (others => '0');
		INT_Spectrum_23_CONFIG_WR <= "0";
		REG_Spectrum_23_CONFIG_LIMIT_WR <= (others => '0');
		INT_Spectrum_23_CONFIG_LIMIT_WR <= "0";
		REG_Spectrum_23_CONFIG_REBIN_WR <= (others => '0');
		INT_Spectrum_23_CONFIG_REBIN_WR <= "0";
		REG_Spectrum_23_CONFIG_MIN_WR <= (others => '0');
		INT_Spectrum_23_CONFIG_MIN_WR <= "0";
		REG_Spectrum_23_CONFIG_MAX_WR <= (others => '0');
		INT_Spectrum_23_CONFIG_MAX_WR <= "0";
	BUS_Syncs_W_INT <= "0";
		INT_Syncs_READ_STATUS_RD <= "0";
		INT_Syncs_READ_POSITION_RD <= "0";
		REG_Syncs_CONFIG_TRIGGER_MODE_WR <= (others => '0');
		INT_Syncs_CONFIG_TRIGGER_MODE_WR <= "0";
		REG_Syncs_CONFIG_PRETRIGGER_WR <= (others => '0');
		INT_Syncs_CONFIG_PRETRIGGER_WR <= "0";
		REG_Syncs_CONFIG_TRIGGER_LEVEL_WR <= (others => '0');
		INT_Syncs_CONFIG_TRIGGER_LEVEL_WR <= "0";
		REG_Syncs_CONFIG_ARM_WR <= (others => '0');
		INT_Syncs_CONFIG_ARM_WR <= "0";
		REG_Syncs_CONFIG_DECIMATOR_WR <= (others => '0');
		INT_Syncs_CONFIG_DECIMATOR_WR <= "0";
	BUS_io_W_INT <= "0";
		REG_io_to_encode_WR <= (others => '0');
		INT_io_to_encode_WR <= "0";
		REG_io_stamptype_WR <= (others => '0');
		INT_io_stamptype_WR <= "0";
		REG_io_lemo2out_WR <= (others => '0');
		INT_io_lemo2out_WR <= "0";
		REG_io_divide_WR <= (others => '0');
		INT_io_divide_WR <= "0";
		REG_dummy_WR <= (others => '0');
		INT_dummy_WR <= "0";
		INT_dummy_RD <= "0";
		REG_forcetrig_WR <= (others => '0');
		INT_forcetrig_WR <= "0";
		INT_forcetrig_RD <= "0";
		REG_full_WR <= (others => '0');
		INT_full_WR <= "0";
		INT_full_RD <= "0";
		REG_trigger_code_WR <= (others => '0');
		INT_trigger_code_WR <= "0";
		INT_trigger_code_RD <= "0";
		REG_reset_WR <= (others => '0');
		INT_reset_WR <= "0";
		INT_reset_RD <= "0";
		REG_timestamp_WR <= (others => '0');
		INT_timestamp_WR <= "0";
		INT_timestamp_RD <= "0";
		REG_received_WR <= (others => '0');
		INT_received_WR <= "0";
		INT_received_RD <= "0";
	BUS_baselines_W_INT <= "0";
		INT_baselines_READ_STATUS_RD <= "0";
		INT_baselines_READ_POSITION_RD <= "0";
		REG_baselines_CONFIG_TRIGGER_MODE_WR <= (others => '0');
		INT_baselines_CONFIG_TRIGGER_MODE_WR <= "0";
		REG_baselines_CONFIG_PRETRIGGER_WR <= (others => '0');
		INT_baselines_CONFIG_PRETRIGGER_WR <= "0";
		REG_baselines_CONFIG_TRIGGER_LEVEL_WR <= (others => '0');
		INT_baselines_CONFIG_TRIGGER_LEVEL_WR <= "0";
		REG_baselines_CONFIG_ARM_WR <= (others => '0');
		INT_baselines_CONFIG_ARM_WR <= "0";
		REG_baselines_CONFIG_DECIMATOR_WR <= (others => '0');
		INT_baselines_CONFIG_DECIMATOR_WR <= "0";
	BUS_int_W_INT <= "0";
		REG_int_time_WR <= (others => '0');
		INT_int_time_WR <= "0";
		REG_int_pre_WR <= (others => '0');
		INT_int_pre_WR <= "0";
		REG_int_base_WR <= (others => '0');
		INT_int_base_WR <= "0";
            
                f_BUS_DATASTROBE_REG <= '0';
                M_AVALON_0_readdatavalid <= '0';
            elsif rising_edge(clk) then
            
            M_AVALON_0_readdatavalid <= '0';
    	BUS_Energies_W_INT <= "0";
		INT_Energies_READ_STATUS_RD <= "0";
		INT_Energies_READ_POSITION_RD <= "0";
		INT_Energies_CONFIG_TRIGGER_MODE_WR <= "0";
		INT_Energies_CONFIG_PRETRIGGER_WR <= "0";
		INT_Energies_CONFIG_TRIGGER_LEVEL_WR <= "0";
		INT_Energies_CONFIG_ARM_WR <= "0";
		INT_Energies_CONFIG_DECIMATOR_WR <= "0";
	BUS_Analog_W_INT <= "0";
		INT_Analog_READ_STATUS_RD <= "0";
		INT_Analog_READ_POSITION_RD <= "0";
		INT_Analog_CONFIG_TRIGGER_MODE_WR <= "0";
		INT_Analog_CONFIG_PRETRIGGER_WR <= "0";
		INT_Analog_CONFIG_TRIGGER_LEVEL_WR <= "0";
		INT_Analog_CONFIG_ARM_WR <= "0";
		INT_Analog_CONFIG_DECIMATOR_WR <= "0";
	BUS_trig_W_INT <= "0";
		INT_trig_polarity_WR <= "0";
		INT_trig_inhib_WR <= "0";
		INT_trig_gate_l_WR <= "0";
		INT_trig_gate_u_WR <= "0";
		INT_trig_delay_WR <= "0";
		INT_trig_mode_WR <= "0";
	BUS_RateMeter_W_INT <= "0";
	BUS_thrsh_W_INT <= "0";
		INT_thrsh_CH0_WR <= "0";
		INT_thrsh_CH1_WR <= "0";
		INT_thrsh_CH2_WR <= "0";
		INT_thrsh_CH3_WR <= "0";
		INT_thrsh_CH4_WR <= "0";
		INT_thrsh_CH5_WR <= "0";
		INT_thrsh_CH6_WR <= "0";
		INT_thrsh_CH7_WR <= "0";
		INT_thrsh_CH8_WR <= "0";
		INT_thrsh_CH9_WR <= "0";
		INT_thrsh_CH10_WR <= "0";
		INT_thrsh_CH11_WR <= "0";
		INT_thrsh_CH12_WR <= "0";
		INT_thrsh_CH13_WR <= "0";
		INT_thrsh_CH14_WR <= "0";
		INT_thrsh_CH15_WR <= "0";
		INT_thrsh_CH16_WR <= "0";
		INT_thrsh_CH17_WR <= "0";
		INT_thrsh_CH18_WR <= "0";
		INT_thrsh_CH19_WR <= "0";
		INT_thrsh_CH20_WR <= "0";
		INT_thrsh_CH21_WR <= "0";
		INT_thrsh_CH22_WR <= "0";
		INT_thrsh_CH23_WR <= "0";
	BUS_diag_W_INT <= "0";
		INT_diag_READ_STATUS_RD <= "0";
		INT_diag_READ_POSITION_RD <= "0";
		INT_diag_CONFIG_TRIGGER_MODE_WR <= "0";
		INT_diag_CONFIG_PRETRIGGER_WR <= "0";
		INT_diag_CONFIG_TRIGGER_LEVEL_WR <= "0";
		INT_diag_CONFIG_ARM_WR <= "0";
		INT_diag_CONFIG_DECIMATOR_WR <= "0";
	BUS_All_Energies_W_INT <= "0";
		INT_All_Energies_READ_STATUS_RD <= "0";
		INT_All_Energies_READ_VALID_WORDS_RD <= "0";
		INT_All_Energies_CONFIG_WR <= "0";
	BUS_top_W_INT <= "0";
		INT_top_CH0_WR <= "0";
		INT_top_CH1_WR <= "0";
		INT_top_CH2_WR <= "0";
		INT_top_CH3_WR <= "0";
		INT_top_CH4_WR <= "0";
		INT_top_CH5_WR <= "0";
		INT_top_CH6_WR <= "0";
		INT_top_CH7_WR <= "0";
		INT_top_CH8_WR <= "0";
		INT_top_CH9_WR <= "0";
		INT_top_CH10_WR <= "0";
		INT_top_CH11_WR <= "0";
		INT_top_CH12_WR <= "0";
		INT_top_CH13_WR <= "0";
		INT_top_CH14_WR <= "0";
		INT_top_CH15_WR <= "0";
		INT_top_CH16_WR <= "0";
		INT_top_CH17_WR <= "0";
		INT_top_CH18_WR <= "0";
		INT_top_CH19_WR <= "0";
		INT_top_CH20_WR <= "0";
		INT_top_CH21_WR <= "0";
		INT_top_CH22_WR <= "0";
		INT_top_CH23_WR <= "0";
	BUS_base_W_INT <= "0";
		INT_base_CH0_WR <= "0";
		INT_base_CH1_WR <= "0";
		INT_base_CH2_WR <= "0";
		INT_base_CH3_WR <= "0";
		INT_base_CH4_WR <= "0";
		INT_base_CH5_WR <= "0";
		INT_base_CH6_WR <= "0";
		INT_base_CH7_WR <= "0";
		INT_base_CH8_WR <= "0";
		INT_base_CH9_WR <= "0";
		INT_base_CH10_WR <= "0";
		INT_base_CH11_WR <= "0";
		INT_base_CH12_WR <= "0";
		INT_base_CH13_WR <= "0";
		INT_base_CH14_WR <= "0";
		INT_base_CH15_WR <= "0";
		INT_base_CH16_WR <= "0";
		INT_base_CH17_WR <= "0";
		INT_base_CH18_WR <= "0";
		INT_base_CH19_WR <= "0";
		INT_base_CH20_WR <= "0";
		INT_base_CH21_WR <= "0";
		INT_base_CH22_WR <= "0";
		INT_base_CH23_WR <= "0";
	BUS_disable_det_W_INT <= "0";
		INT_disable_det_CH0_WR <= "0";
		INT_disable_det_CH1_WR <= "0";
		INT_disable_det_CH2_WR <= "0";
		INT_disable_det_CH3_WR <= "0";
		INT_disable_det_CH4_WR <= "0";
		INT_disable_det_CH5_WR <= "0";
		INT_disable_det_CH6_WR <= "0";
		INT_disable_det_CH7_WR <= "0";
		INT_disable_det_CH8_WR <= "0";
		INT_disable_det_CH9_WR <= "0";
		INT_disable_det_CH10_WR <= "0";
		INT_disable_det_CH11_WR <= "0";
		INT_disable_det_CH12_WR <= "0";
		INT_disable_det_CH13_WR <= "0";
		INT_disable_det_CH14_WR <= "0";
		INT_disable_det_CH15_WR <= "0";
		INT_disable_det_CH16_WR <= "0";
		INT_disable_det_CH17_WR <= "0";
		INT_disable_det_CH18_WR <= "0";
		INT_disable_det_CH19_WR <= "0";
		INT_disable_det_CH20_WR <= "0";
		INT_disable_det_CH21_WR <= "0";
		INT_disable_det_CH22_WR <= "0";
		INT_disable_det_CH23_WR <= "0";
	BUS_Spectrum_0_W_INT <= "0";
		INT_Spectrum_0_STATUS_RD <= "0";
		INT_Spectrum_0_CONFIG_WR <= "0";
		INT_Spectrum_0_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_0_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_0_CONFIG_MIN_WR <= "0";
		INT_Spectrum_0_CONFIG_MAX_WR <= "0";
	BUS_Analog_In_Unflipped_W_INT <= "0";
		INT_Analog_In_Unflipped_READ_STATUS_RD <= "0";
		INT_Analog_In_Unflipped_READ_POSITION_RD <= "0";
		INT_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR <= "0";
		INT_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR <= "0";
		INT_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR <= "0";
		INT_Analog_In_Unflipped_CONFIG_ARM_WR <= "0";
		INT_Analog_In_Unflipped_CONFIG_DECIMATOR_WR <= "0";
	BUS_Spectrum_12_W_INT <= "0";
		INT_Spectrum_12_STATUS_RD <= "0";
		INT_Spectrum_12_CONFIG_WR <= "0";
		INT_Spectrum_12_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_12_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_12_CONFIG_MIN_WR <= "0";
		INT_Spectrum_12_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_1_W_INT <= "0";
		INT_Spectrum_1_STATUS_RD <= "0";
		INT_Spectrum_1_CONFIG_WR <= "0";
		INT_Spectrum_1_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_1_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_1_CONFIG_MIN_WR <= "0";
		INT_Spectrum_1_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_13_W_INT <= "0";
		INT_Spectrum_13_STATUS_RD <= "0";
		INT_Spectrum_13_CONFIG_WR <= "0";
		INT_Spectrum_13_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_13_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_13_CONFIG_MIN_WR <= "0";
		INT_Spectrum_13_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_2_W_INT <= "0";
		INT_Spectrum_2_STATUS_RD <= "0";
		INT_Spectrum_2_CONFIG_WR <= "0";
		INT_Spectrum_2_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_2_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_2_CONFIG_MIN_WR <= "0";
		INT_Spectrum_2_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_14_W_INT <= "0";
		INT_Spectrum_14_STATUS_RD <= "0";
		INT_Spectrum_14_CONFIG_WR <= "0";
		INT_Spectrum_14_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_14_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_14_CONFIG_MIN_WR <= "0";
		INT_Spectrum_14_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_3_W_INT <= "0";
		INT_Spectrum_3_STATUS_RD <= "0";
		INT_Spectrum_3_CONFIG_WR <= "0";
		INT_Spectrum_3_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_3_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_3_CONFIG_MIN_WR <= "0";
		INT_Spectrum_3_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_15_W_INT <= "0";
		INT_Spectrum_15_STATUS_RD <= "0";
		INT_Spectrum_15_CONFIG_WR <= "0";
		INT_Spectrum_15_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_15_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_15_CONFIG_MIN_WR <= "0";
		INT_Spectrum_15_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_4_W_INT <= "0";
		INT_Spectrum_4_STATUS_RD <= "0";
		INT_Spectrum_4_CONFIG_WR <= "0";
		INT_Spectrum_4_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_4_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_4_CONFIG_MIN_WR <= "0";
		INT_Spectrum_4_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_16_W_INT <= "0";
		INT_Spectrum_16_STATUS_RD <= "0";
		INT_Spectrum_16_CONFIG_WR <= "0";
		INT_Spectrum_16_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_16_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_16_CONFIG_MIN_WR <= "0";
		INT_Spectrum_16_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_5_W_INT <= "0";
		INT_Spectrum_5_STATUS_RD <= "0";
		INT_Spectrum_5_CONFIG_WR <= "0";
		INT_Spectrum_5_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_5_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_5_CONFIG_MIN_WR <= "0";
		INT_Spectrum_5_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_17_W_INT <= "0";
		INT_Spectrum_17_STATUS_RD <= "0";
		INT_Spectrum_17_CONFIG_WR <= "0";
		INT_Spectrum_17_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_17_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_17_CONFIG_MIN_WR <= "0";
		INT_Spectrum_17_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_6_W_INT <= "0";
		INT_Spectrum_6_STATUS_RD <= "0";
		INT_Spectrum_6_CONFIG_WR <= "0";
		INT_Spectrum_6_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_6_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_6_CONFIG_MIN_WR <= "0";
		INT_Spectrum_6_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_18_W_INT <= "0";
		INT_Spectrum_18_STATUS_RD <= "0";
		INT_Spectrum_18_CONFIG_WR <= "0";
		INT_Spectrum_18_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_18_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_18_CONFIG_MIN_WR <= "0";
		INT_Spectrum_18_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_7_W_INT <= "0";
		INT_Spectrum_7_STATUS_RD <= "0";
		INT_Spectrum_7_CONFIG_WR <= "0";
		INT_Spectrum_7_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_7_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_7_CONFIG_MIN_WR <= "0";
		INT_Spectrum_7_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_19_W_INT <= "0";
		INT_Spectrum_19_STATUS_RD <= "0";
		INT_Spectrum_19_CONFIG_WR <= "0";
		INT_Spectrum_19_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_19_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_19_CONFIG_MIN_WR <= "0";
		INT_Spectrum_19_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_8_W_INT <= "0";
		INT_Spectrum_8_STATUS_RD <= "0";
		INT_Spectrum_8_CONFIG_WR <= "0";
		INT_Spectrum_8_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_8_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_8_CONFIG_MIN_WR <= "0";
		INT_Spectrum_8_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_20_W_INT <= "0";
		INT_Spectrum_20_STATUS_RD <= "0";
		INT_Spectrum_20_CONFIG_WR <= "0";
		INT_Spectrum_20_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_20_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_20_CONFIG_MIN_WR <= "0";
		INT_Spectrum_20_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_9_W_INT <= "0";
		INT_Spectrum_9_STATUS_RD <= "0";
		INT_Spectrum_9_CONFIG_WR <= "0";
		INT_Spectrum_9_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_9_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_9_CONFIG_MIN_WR <= "0";
		INT_Spectrum_9_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_21_W_INT <= "0";
		INT_Spectrum_21_STATUS_RD <= "0";
		INT_Spectrum_21_CONFIG_WR <= "0";
		INT_Spectrum_21_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_21_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_21_CONFIG_MIN_WR <= "0";
		INT_Spectrum_21_CONFIG_MAX_WR <= "0";
	BUS_SyncIn_W_INT <= "0";
	BUS_Spectrum_10_W_INT <= "0";
		INT_Spectrum_10_STATUS_RD <= "0";
		INT_Spectrum_10_CONFIG_WR <= "0";
		INT_Spectrum_10_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_10_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_10_CONFIG_MIN_WR <= "0";
		INT_Spectrum_10_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_22_W_INT <= "0";
		INT_Spectrum_22_STATUS_RD <= "0";
		INT_Spectrum_22_CONFIG_WR <= "0";
		INT_Spectrum_22_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_22_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_22_CONFIG_MIN_WR <= "0";
		INT_Spectrum_22_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_11_W_INT <= "0";
		INT_Spectrum_11_STATUS_RD <= "0";
		INT_Spectrum_11_CONFIG_WR <= "0";
		INT_Spectrum_11_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_11_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_11_CONFIG_MIN_WR <= "0";
		INT_Spectrum_11_CONFIG_MAX_WR <= "0";
	BUS_Spectrum_23_W_INT <= "0";
		INT_Spectrum_23_STATUS_RD <= "0";
		INT_Spectrum_23_CONFIG_WR <= "0";
		INT_Spectrum_23_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_23_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_23_CONFIG_MIN_WR <= "0";
		INT_Spectrum_23_CONFIG_MAX_WR <= "0";
	BUS_Syncs_W_INT <= "0";
		INT_Syncs_READ_STATUS_RD <= "0";
		INT_Syncs_READ_POSITION_RD <= "0";
		INT_Syncs_CONFIG_TRIGGER_MODE_WR <= "0";
		INT_Syncs_CONFIG_PRETRIGGER_WR <= "0";
		INT_Syncs_CONFIG_TRIGGER_LEVEL_WR <= "0";
		INT_Syncs_CONFIG_ARM_WR <= "0";
		INT_Syncs_CONFIG_DECIMATOR_WR <= "0";
	BUS_io_W_INT <= "0";
		INT_io_to_encode_WR <= "0";
		INT_io_stamptype_WR <= "0";
		INT_io_lemo2out_WR <= "0";
		INT_io_divide_WR <= "0";
		INT_dummy_WR <= "0";
		INT_dummy_RD <= "0";
		INT_forcetrig_WR <= "0";
		INT_forcetrig_RD <= "0";
		INT_full_WR <= "0";
		INT_full_RD <= "0";
		INT_trigger_code_WR <= "0";
		INT_trigger_code_RD <= "0";
		INT_reset_WR <= "0";
		INT_reset_RD <= "0";
		INT_timestamp_WR <= "0";
		INT_timestamp_RD <= "0";
		INT_received_WR <= "0";
		INT_received_RD <= "0";
	BUS_baselines_W_INT <= "0";
		INT_baselines_READ_STATUS_RD <= "0";
		INT_baselines_READ_POSITION_RD <= "0";
		INT_baselines_CONFIG_TRIGGER_MODE_WR <= "0";
		INT_baselines_CONFIG_PRETRIGGER_WR <= "0";
		INT_baselines_CONFIG_TRIGGER_LEVEL_WR <= "0";
		INT_baselines_CONFIG_ARM_WR <= "0";
		INT_baselines_CONFIG_DECIMATOR_WR <= "0";
	BUS_int_W_INT <= "0";
		INT_int_time_WR <= "0";
		INT_int_pre_WR <= "0";
		INT_int_base_WR <= "0";
  
                f_BUS_DATASTROBE_REG <= '0';
                
               if f_BUS_INT_WR = '1' then
        
        
    		If addr >= x"00000000" And addr < x"00008000" Then
			BUS_Energies_WRITE_DATA <= wreg; 
			BUS_Energies_W_INT <= "1"; 
		End If;
		if addr = x"00008002" then
			REG_Energies_CONFIG_TRIGGER_MODE_WR <= wreg; 
			INT_Energies_CONFIG_TRIGGER_MODE_WR <= "1"; 
		end if;
		if addr = x"00008003" then
			REG_Energies_CONFIG_PRETRIGGER_WR <= wreg; 
			INT_Energies_CONFIG_PRETRIGGER_WR <= "1"; 
		end if;
		if addr = x"00008004" then
			REG_Energies_CONFIG_TRIGGER_LEVEL_WR <= wreg; 
			INT_Energies_CONFIG_TRIGGER_LEVEL_WR <= "1"; 
		end if;
		if addr = x"00008005" then
			REG_Energies_CONFIG_ARM_WR <= wreg; 
			INT_Energies_CONFIG_ARM_WR <= "1"; 
		end if;
		if addr = x"00008006" then
			REG_Energies_CONFIG_DECIMATOR_WR <= wreg; 
			INT_Energies_CONFIG_DECIMATOR_WR <= "1"; 
		end if;
		If addr >= x"00010000" And addr < x"00018000" Then
			BUS_Analog_WRITE_DATA <= wreg; 
			BUS_Analog_W_INT <= "1"; 
		End If;
		if addr = x"00018002" then
			REG_Analog_CONFIG_TRIGGER_MODE_WR <= wreg; 
			INT_Analog_CONFIG_TRIGGER_MODE_WR <= "1"; 
		end if;
		if addr = x"00018003" then
			REG_Analog_CONFIG_PRETRIGGER_WR <= wreg; 
			INT_Analog_CONFIG_PRETRIGGER_WR <= "1"; 
		end if;
		if addr = x"00018004" then
			REG_Analog_CONFIG_TRIGGER_LEVEL_WR <= wreg; 
			INT_Analog_CONFIG_TRIGGER_LEVEL_WR <= "1"; 
		end if;
		if addr = x"00018005" then
			REG_Analog_CONFIG_ARM_WR <= wreg; 
			INT_Analog_CONFIG_ARM_WR <= "1"; 
		end if;
		if addr = x"00018006" then
			REG_Analog_CONFIG_DECIMATOR_WR <= wreg; 
			INT_Analog_CONFIG_DECIMATOR_WR <= "1"; 
		end if;
		If addr >= x"00018008" And addr < x"00018009" Then
			BUS_trig_WRITE_DATA <= wreg; 
			BUS_trig_W_INT <= "1"; 
		End If;
		if addr = x"00018009" then
			REG_trig_polarity_WR <= wreg; 
			INT_trig_polarity_WR <= "1"; 
		end if;
		if addr = x"0001800A" then
			REG_trig_inhib_WR <= wreg; 
			INT_trig_inhib_WR <= "1"; 
		end if;
		if addr = x"0001800B" then
			REG_trig_gate_l_WR <= wreg; 
			INT_trig_gate_l_WR <= "1"; 
		end if;
		if addr = x"0001800C" then
			REG_trig_gate_u_WR <= wreg; 
			INT_trig_gate_u_WR <= "1"; 
		end if;
		if addr = x"0001800D" then
			REG_trig_delay_WR <= wreg; 
			INT_trig_delay_WR <= "1"; 
		end if;
		if addr = x"0001800E" then
			REG_trig_mode_WR <= wreg; 
			INT_trig_mode_WR <= "1"; 
		end if;
		If addr >= x"00020000" And addr < x"00030000" Then
			BUS_RateMeter_WRITE_DATA <= wreg; 
			BUS_RateMeter_W_INT <= "1"; 
		End If;
		If addr >= x"00030001" And addr < x"00030002" Then
			BUS_thrsh_WRITE_DATA <= wreg; 
			BUS_thrsh_W_INT <= "1"; 
		End If;
		if addr = x"00030002" then
			REG_thrsh_CH0_WR <= wreg; 
			INT_thrsh_CH0_WR <= "1"; 
		end if;
		if addr = x"00030003" then
			REG_thrsh_CH1_WR <= wreg; 
			INT_thrsh_CH1_WR <= "1"; 
		end if;
		if addr = x"00030004" then
			REG_thrsh_CH2_WR <= wreg; 
			INT_thrsh_CH2_WR <= "1"; 
		end if;
		if addr = x"00030005" then
			REG_thrsh_CH3_WR <= wreg; 
			INT_thrsh_CH3_WR <= "1"; 
		end if;
		if addr = x"00030006" then
			REG_thrsh_CH4_WR <= wreg; 
			INT_thrsh_CH4_WR <= "1"; 
		end if;
		if addr = x"00030007" then
			REG_thrsh_CH5_WR <= wreg; 
			INT_thrsh_CH5_WR <= "1"; 
		end if;
		if addr = x"00030008" then
			REG_thrsh_CH6_WR <= wreg; 
			INT_thrsh_CH6_WR <= "1"; 
		end if;
		if addr = x"00030009" then
			REG_thrsh_CH7_WR <= wreg; 
			INT_thrsh_CH7_WR <= "1"; 
		end if;
		if addr = x"0003000A" then
			REG_thrsh_CH8_WR <= wreg; 
			INT_thrsh_CH8_WR <= "1"; 
		end if;
		if addr = x"0003000B" then
			REG_thrsh_CH9_WR <= wreg; 
			INT_thrsh_CH9_WR <= "1"; 
		end if;
		if addr = x"0003000C" then
			REG_thrsh_CH10_WR <= wreg; 
			INT_thrsh_CH10_WR <= "1"; 
		end if;
		if addr = x"0003000D" then
			REG_thrsh_CH11_WR <= wreg; 
			INT_thrsh_CH11_WR <= "1"; 
		end if;
		if addr = x"0003000E" then
			REG_thrsh_CH12_WR <= wreg; 
			INT_thrsh_CH12_WR <= "1"; 
		end if;
		if addr = x"0003000F" then
			REG_thrsh_CH13_WR <= wreg; 
			INT_thrsh_CH13_WR <= "1"; 
		end if;
		if addr = x"00030010" then
			REG_thrsh_CH14_WR <= wreg; 
			INT_thrsh_CH14_WR <= "1"; 
		end if;
		if addr = x"00030011" then
			REG_thrsh_CH15_WR <= wreg; 
			INT_thrsh_CH15_WR <= "1"; 
		end if;
		if addr = x"00030012" then
			REG_thrsh_CH16_WR <= wreg; 
			INT_thrsh_CH16_WR <= "1"; 
		end if;
		if addr = x"00030013" then
			REG_thrsh_CH17_WR <= wreg; 
			INT_thrsh_CH17_WR <= "1"; 
		end if;
		if addr = x"00030014" then
			REG_thrsh_CH18_WR <= wreg; 
			INT_thrsh_CH18_WR <= "1"; 
		end if;
		if addr = x"00030015" then
			REG_thrsh_CH19_WR <= wreg; 
			INT_thrsh_CH19_WR <= "1"; 
		end if;
		if addr = x"00030016" then
			REG_thrsh_CH20_WR <= wreg; 
			INT_thrsh_CH20_WR <= "1"; 
		end if;
		if addr = x"00030017" then
			REG_thrsh_CH21_WR <= wreg; 
			INT_thrsh_CH21_WR <= "1"; 
		end if;
		if addr = x"00030018" then
			REG_thrsh_CH22_WR <= wreg; 
			INT_thrsh_CH22_WR <= "1"; 
		end if;
		if addr = x"00030019" then
			REG_thrsh_CH23_WR <= wreg; 
			INT_thrsh_CH23_WR <= "1"; 
		end if;
		If addr >= x"00031000" And addr < x"00032000" Then
			BUS_diag_WRITE_DATA <= wreg; 
			BUS_diag_W_INT <= "1"; 
		End If;
		if addr = x"00032002" then
			REG_diag_CONFIG_TRIGGER_MODE_WR <= wreg; 
			INT_diag_CONFIG_TRIGGER_MODE_WR <= "1"; 
		end if;
		if addr = x"00032003" then
			REG_diag_CONFIG_PRETRIGGER_WR <= wreg; 
			INT_diag_CONFIG_PRETRIGGER_WR <= "1"; 
		end if;
		if addr = x"00032004" then
			REG_diag_CONFIG_TRIGGER_LEVEL_WR <= wreg; 
			INT_diag_CONFIG_TRIGGER_LEVEL_WR <= "1"; 
		end if;
		if addr = x"00032005" then
			REG_diag_CONFIG_ARM_WR <= wreg; 
			INT_diag_CONFIG_ARM_WR <= "1"; 
		end if;
		if addr = x"00032006" then
			REG_diag_CONFIG_DECIMATOR_WR <= wreg; 
			INT_diag_CONFIG_DECIMATOR_WR <= "1"; 
		end if;
		If addr >= x"00032008" And addr < x"00032009" Then
			BUS_All_Energies_WRITE_DATA <= wreg; 
			BUS_All_Energies_W_INT <= "1"; 
		End If;
		if addr = x"0003200B" then
			REG_All_Energies_CONFIG_WR <= wreg; 
			INT_All_Energies_CONFIG_WR <= "1"; 
		end if;
		If addr >= x"00032012" And addr < x"00032013" Then
			BUS_top_WRITE_DATA <= wreg; 
			BUS_top_W_INT <= "1"; 
		End If;
		if addr = x"00032013" then
			REG_top_CH0_WR <= wreg; 
			INT_top_CH0_WR <= "1"; 
		end if;
		if addr = x"00032014" then
			REG_top_CH1_WR <= wreg; 
			INT_top_CH1_WR <= "1"; 
		end if;
		if addr = x"00032015" then
			REG_top_CH2_WR <= wreg; 
			INT_top_CH2_WR <= "1"; 
		end if;
		if addr = x"00032016" then
			REG_top_CH3_WR <= wreg; 
			INT_top_CH3_WR <= "1"; 
		end if;
		if addr = x"00032017" then
			REG_top_CH4_WR <= wreg; 
			INT_top_CH4_WR <= "1"; 
		end if;
		if addr = x"00032018" then
			REG_top_CH5_WR <= wreg; 
			INT_top_CH5_WR <= "1"; 
		end if;
		if addr = x"00032019" then
			REG_top_CH6_WR <= wreg; 
			INT_top_CH6_WR <= "1"; 
		end if;
		if addr = x"0003201A" then
			REG_top_CH7_WR <= wreg; 
			INT_top_CH7_WR <= "1"; 
		end if;
		if addr = x"0003201B" then
			REG_top_CH8_WR <= wreg; 
			INT_top_CH8_WR <= "1"; 
		end if;
		if addr = x"0003201C" then
			REG_top_CH9_WR <= wreg; 
			INT_top_CH9_WR <= "1"; 
		end if;
		if addr = x"0003201D" then
			REG_top_CH10_WR <= wreg; 
			INT_top_CH10_WR <= "1"; 
		end if;
		if addr = x"0003201E" then
			REG_top_CH11_WR <= wreg; 
			INT_top_CH11_WR <= "1"; 
		end if;
		if addr = x"0003201F" then
			REG_top_CH12_WR <= wreg; 
			INT_top_CH12_WR <= "1"; 
		end if;
		if addr = x"00032020" then
			REG_top_CH13_WR <= wreg; 
			INT_top_CH13_WR <= "1"; 
		end if;
		if addr = x"00032021" then
			REG_top_CH14_WR <= wreg; 
			INT_top_CH14_WR <= "1"; 
		end if;
		if addr = x"00032022" then
			REG_top_CH15_WR <= wreg; 
			INT_top_CH15_WR <= "1"; 
		end if;
		if addr = x"00032023" then
			REG_top_CH16_WR <= wreg; 
			INT_top_CH16_WR <= "1"; 
		end if;
		if addr = x"00032024" then
			REG_top_CH17_WR <= wreg; 
			INT_top_CH17_WR <= "1"; 
		end if;
		if addr = x"00032025" then
			REG_top_CH18_WR <= wreg; 
			INT_top_CH18_WR <= "1"; 
		end if;
		if addr = x"00032026" then
			REG_top_CH19_WR <= wreg; 
			INT_top_CH19_WR <= "1"; 
		end if;
		if addr = x"00032027" then
			REG_top_CH20_WR <= wreg; 
			INT_top_CH20_WR <= "1"; 
		end if;
		if addr = x"00032028" then
			REG_top_CH21_WR <= wreg; 
			INT_top_CH21_WR <= "1"; 
		end if;
		if addr = x"00032029" then
			REG_top_CH22_WR <= wreg; 
			INT_top_CH22_WR <= "1"; 
		end if;
		if addr = x"0003202A" then
			REG_top_CH23_WR <= wreg; 
			INT_top_CH23_WR <= "1"; 
		end if;
		If addr >= x"0003202C" And addr < x"0003202D" Then
			BUS_base_WRITE_DATA <= wreg; 
			BUS_base_W_INT <= "1"; 
		End If;
		if addr = x"0003202D" then
			REG_base_CH0_WR <= wreg; 
			INT_base_CH0_WR <= "1"; 
		end if;
		if addr = x"0003202E" then
			REG_base_CH1_WR <= wreg; 
			INT_base_CH1_WR <= "1"; 
		end if;
		if addr = x"0003202F" then
			REG_base_CH2_WR <= wreg; 
			INT_base_CH2_WR <= "1"; 
		end if;
		if addr = x"00032030" then
			REG_base_CH3_WR <= wreg; 
			INT_base_CH3_WR <= "1"; 
		end if;
		if addr = x"00032031" then
			REG_base_CH4_WR <= wreg; 
			INT_base_CH4_WR <= "1"; 
		end if;
		if addr = x"00032032" then
			REG_base_CH5_WR <= wreg; 
			INT_base_CH5_WR <= "1"; 
		end if;
		if addr = x"00032033" then
			REG_base_CH6_WR <= wreg; 
			INT_base_CH6_WR <= "1"; 
		end if;
		if addr = x"00032034" then
			REG_base_CH7_WR <= wreg; 
			INT_base_CH7_WR <= "1"; 
		end if;
		if addr = x"00032035" then
			REG_base_CH8_WR <= wreg; 
			INT_base_CH8_WR <= "1"; 
		end if;
		if addr = x"00032036" then
			REG_base_CH9_WR <= wreg; 
			INT_base_CH9_WR <= "1"; 
		end if;
		if addr = x"00032037" then
			REG_base_CH10_WR <= wreg; 
			INT_base_CH10_WR <= "1"; 
		end if;
		if addr = x"00032038" then
			REG_base_CH11_WR <= wreg; 
			INT_base_CH11_WR <= "1"; 
		end if;
		if addr = x"00032039" then
			REG_base_CH12_WR <= wreg; 
			INT_base_CH12_WR <= "1"; 
		end if;
		if addr = x"0003203A" then
			REG_base_CH13_WR <= wreg; 
			INT_base_CH13_WR <= "1"; 
		end if;
		if addr = x"0003203B" then
			REG_base_CH14_WR <= wreg; 
			INT_base_CH14_WR <= "1"; 
		end if;
		if addr = x"0003203C" then
			REG_base_CH15_WR <= wreg; 
			INT_base_CH15_WR <= "1"; 
		end if;
		if addr = x"0003203D" then
			REG_base_CH16_WR <= wreg; 
			INT_base_CH16_WR <= "1"; 
		end if;
		if addr = x"0003203E" then
			REG_base_CH17_WR <= wreg; 
			INT_base_CH17_WR <= "1"; 
		end if;
		if addr = x"0003203F" then
			REG_base_CH18_WR <= wreg; 
			INT_base_CH18_WR <= "1"; 
		end if;
		if addr = x"00032040" then
			REG_base_CH19_WR <= wreg; 
			INT_base_CH19_WR <= "1"; 
		end if;
		if addr = x"00032041" then
			REG_base_CH20_WR <= wreg; 
			INT_base_CH20_WR <= "1"; 
		end if;
		if addr = x"00032042" then
			REG_base_CH21_WR <= wreg; 
			INT_base_CH21_WR <= "1"; 
		end if;
		if addr = x"00032043" then
			REG_base_CH22_WR <= wreg; 
			INT_base_CH22_WR <= "1"; 
		end if;
		if addr = x"00032044" then
			REG_base_CH23_WR <= wreg; 
			INT_base_CH23_WR <= "1"; 
		end if;
		If addr >= x"00032046" And addr < x"00032047" Then
			BUS_disable_det_WRITE_DATA <= wreg; 
			BUS_disable_det_W_INT <= "1"; 
		End If;
		if addr = x"00032047" then
			REG_disable_det_CH0_WR <= wreg; 
			INT_disable_det_CH0_WR <= "1"; 
		end if;
		if addr = x"00032048" then
			REG_disable_det_CH1_WR <= wreg; 
			INT_disable_det_CH1_WR <= "1"; 
		end if;
		if addr = x"00032049" then
			REG_disable_det_CH2_WR <= wreg; 
			INT_disable_det_CH2_WR <= "1"; 
		end if;
		if addr = x"0003204A" then
			REG_disable_det_CH3_WR <= wreg; 
			INT_disable_det_CH3_WR <= "1"; 
		end if;
		if addr = x"0003204B" then
			REG_disable_det_CH4_WR <= wreg; 
			INT_disable_det_CH4_WR <= "1"; 
		end if;
		if addr = x"0003204C" then
			REG_disable_det_CH5_WR <= wreg; 
			INT_disable_det_CH5_WR <= "1"; 
		end if;
		if addr = x"0003204D" then
			REG_disable_det_CH6_WR <= wreg; 
			INT_disable_det_CH6_WR <= "1"; 
		end if;
		if addr = x"0003204E" then
			REG_disable_det_CH7_WR <= wreg; 
			INT_disable_det_CH7_WR <= "1"; 
		end if;
		if addr = x"0003204F" then
			REG_disable_det_CH8_WR <= wreg; 
			INT_disable_det_CH8_WR <= "1"; 
		end if;
		if addr = x"00032050" then
			REG_disable_det_CH9_WR <= wreg; 
			INT_disable_det_CH9_WR <= "1"; 
		end if;
		if addr = x"00032051" then
			REG_disable_det_CH10_WR <= wreg; 
			INT_disable_det_CH10_WR <= "1"; 
		end if;
		if addr = x"00032052" then
			REG_disable_det_CH11_WR <= wreg; 
			INT_disable_det_CH11_WR <= "1"; 
		end if;
		if addr = x"00032053" then
			REG_disable_det_CH12_WR <= wreg; 
			INT_disable_det_CH12_WR <= "1"; 
		end if;
		if addr = x"00032054" then
			REG_disable_det_CH13_WR <= wreg; 
			INT_disable_det_CH13_WR <= "1"; 
		end if;
		if addr = x"00032055" then
			REG_disable_det_CH14_WR <= wreg; 
			INT_disable_det_CH14_WR <= "1"; 
		end if;
		if addr = x"00032056" then
			REG_disable_det_CH15_WR <= wreg; 
			INT_disable_det_CH15_WR <= "1"; 
		end if;
		if addr = x"00032057" then
			REG_disable_det_CH16_WR <= wreg; 
			INT_disable_det_CH16_WR <= "1"; 
		end if;
		if addr = x"00032058" then
			REG_disable_det_CH17_WR <= wreg; 
			INT_disable_det_CH17_WR <= "1"; 
		end if;
		if addr = x"00032059" then
			REG_disable_det_CH18_WR <= wreg; 
			INT_disable_det_CH18_WR <= "1"; 
		end if;
		if addr = x"0003205A" then
			REG_disable_det_CH19_WR <= wreg; 
			INT_disable_det_CH19_WR <= "1"; 
		end if;
		if addr = x"0003205B" then
			REG_disable_det_CH20_WR <= wreg; 
			INT_disable_det_CH20_WR <= "1"; 
		end if;
		if addr = x"0003205C" then
			REG_disable_det_CH21_WR <= wreg; 
			INT_disable_det_CH21_WR <= "1"; 
		end if;
		if addr = x"0003205D" then
			REG_disable_det_CH22_WR <= wreg; 
			INT_disable_det_CH22_WR <= "1"; 
		end if;
		if addr = x"0003205E" then
			REG_disable_det_CH23_WR <= wreg; 
			INT_disable_det_CH23_WR <= "1"; 
		end if;
		If addr >= x"00040000" And addr < x"00050000" Then
			BUS_Spectrum_0_WRITE_DATA <= wreg; 
			BUS_Spectrum_0_W_INT <= "1"; 
		End If;
		if addr = x"00050001" then
			REG_Spectrum_0_CONFIG_WR <= wreg; 
			INT_Spectrum_0_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00050002" then
			REG_Spectrum_0_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_0_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00050003" then
			REG_Spectrum_0_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_0_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00050004" then
			REG_Spectrum_0_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_0_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00050005" then
			REG_Spectrum_0_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_0_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00058000" And addr < x"00060000" Then
			BUS_Analog_In_Unflipped_WRITE_DATA <= wreg; 
			BUS_Analog_In_Unflipped_W_INT <= "1"; 
		End If;
		if addr = x"00060002" then
			REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR <= wreg; 
			INT_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR <= "1"; 
		end if;
		if addr = x"00060003" then
			REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR <= wreg; 
			INT_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR <= "1"; 
		end if;
		if addr = x"00060004" then
			REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR <= wreg; 
			INT_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR <= "1"; 
		end if;
		if addr = x"00060005" then
			REG_Analog_In_Unflipped_CONFIG_ARM_WR <= wreg; 
			INT_Analog_In_Unflipped_CONFIG_ARM_WR <= "1"; 
		end if;
		if addr = x"00060006" then
			REG_Analog_In_Unflipped_CONFIG_DECIMATOR_WR <= wreg; 
			INT_Analog_In_Unflipped_CONFIG_DECIMATOR_WR <= "1"; 
		end if;
		If addr >= x"00070000" And addr < x"00080000" Then
			BUS_Spectrum_12_WRITE_DATA <= wreg; 
			BUS_Spectrum_12_W_INT <= "1"; 
		End If;
		if addr = x"00080001" then
			REG_Spectrum_12_CONFIG_WR <= wreg; 
			INT_Spectrum_12_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00080002" then
			REG_Spectrum_12_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_12_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00080003" then
			REG_Spectrum_12_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_12_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00080004" then
			REG_Spectrum_12_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_12_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00080005" then
			REG_Spectrum_12_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_12_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00090000" And addr < x"000A0000" Then
			BUS_Spectrum_1_WRITE_DATA <= wreg; 
			BUS_Spectrum_1_W_INT <= "1"; 
		End If;
		if addr = x"000A0001" then
			REG_Spectrum_1_CONFIG_WR <= wreg; 
			INT_Spectrum_1_CONFIG_WR <= "1"; 
		end if;
		if addr = x"000A0002" then
			REG_Spectrum_1_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_1_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"000A0003" then
			REG_Spectrum_1_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_1_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"000A0004" then
			REG_Spectrum_1_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_1_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"000A0005" then
			REG_Spectrum_1_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_1_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"000B0000" And addr < x"000C0000" Then
			BUS_Spectrum_13_WRITE_DATA <= wreg; 
			BUS_Spectrum_13_W_INT <= "1"; 
		End If;
		if addr = x"000C0001" then
			REG_Spectrum_13_CONFIG_WR <= wreg; 
			INT_Spectrum_13_CONFIG_WR <= "1"; 
		end if;
		if addr = x"000C0002" then
			REG_Spectrum_13_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_13_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"000C0003" then
			REG_Spectrum_13_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_13_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"000C0004" then
			REG_Spectrum_13_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_13_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"000C0005" then
			REG_Spectrum_13_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_13_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"000D0000" And addr < x"000E0000" Then
			BUS_Spectrum_2_WRITE_DATA <= wreg; 
			BUS_Spectrum_2_W_INT <= "1"; 
		End If;
		if addr = x"000E0001" then
			REG_Spectrum_2_CONFIG_WR <= wreg; 
			INT_Spectrum_2_CONFIG_WR <= "1"; 
		end if;
		if addr = x"000E0002" then
			REG_Spectrum_2_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_2_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"000E0003" then
			REG_Spectrum_2_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_2_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"000E0004" then
			REG_Spectrum_2_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_2_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"000E0005" then
			REG_Spectrum_2_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_2_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"000F0000" And addr < x"00100000" Then
			BUS_Spectrum_14_WRITE_DATA <= wreg; 
			BUS_Spectrum_14_W_INT <= "1"; 
		End If;
		if addr = x"00100001" then
			REG_Spectrum_14_CONFIG_WR <= wreg; 
			INT_Spectrum_14_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00100002" then
			REG_Spectrum_14_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_14_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00100003" then
			REG_Spectrum_14_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_14_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00100004" then
			REG_Spectrum_14_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_14_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00100005" then
			REG_Spectrum_14_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_14_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00110000" And addr < x"00120000" Then
			BUS_Spectrum_3_WRITE_DATA <= wreg; 
			BUS_Spectrum_3_W_INT <= "1"; 
		End If;
		if addr = x"00120001" then
			REG_Spectrum_3_CONFIG_WR <= wreg; 
			INT_Spectrum_3_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00120002" then
			REG_Spectrum_3_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_3_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00120003" then
			REG_Spectrum_3_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_3_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00120004" then
			REG_Spectrum_3_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_3_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00120005" then
			REG_Spectrum_3_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_3_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00130000" And addr < x"00140000" Then
			BUS_Spectrum_15_WRITE_DATA <= wreg; 
			BUS_Spectrum_15_W_INT <= "1"; 
		End If;
		if addr = x"00140001" then
			REG_Spectrum_15_CONFIG_WR <= wreg; 
			INT_Spectrum_15_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00140002" then
			REG_Spectrum_15_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_15_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00140003" then
			REG_Spectrum_15_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_15_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00140004" then
			REG_Spectrum_15_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_15_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00140005" then
			REG_Spectrum_15_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_15_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00150000" And addr < x"00160000" Then
			BUS_Spectrum_4_WRITE_DATA <= wreg; 
			BUS_Spectrum_4_W_INT <= "1"; 
		End If;
		if addr = x"00160001" then
			REG_Spectrum_4_CONFIG_WR <= wreg; 
			INT_Spectrum_4_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00160002" then
			REG_Spectrum_4_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_4_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00160003" then
			REG_Spectrum_4_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_4_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00160004" then
			REG_Spectrum_4_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_4_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00160005" then
			REG_Spectrum_4_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_4_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00170000" And addr < x"00180000" Then
			BUS_Spectrum_16_WRITE_DATA <= wreg; 
			BUS_Spectrum_16_W_INT <= "1"; 
		End If;
		if addr = x"00180001" then
			REG_Spectrum_16_CONFIG_WR <= wreg; 
			INT_Spectrum_16_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00180002" then
			REG_Spectrum_16_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_16_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00180003" then
			REG_Spectrum_16_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_16_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00180004" then
			REG_Spectrum_16_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_16_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00180005" then
			REG_Spectrum_16_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_16_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00190000" And addr < x"001A0000" Then
			BUS_Spectrum_5_WRITE_DATA <= wreg; 
			BUS_Spectrum_5_W_INT <= "1"; 
		End If;
		if addr = x"001A0001" then
			REG_Spectrum_5_CONFIG_WR <= wreg; 
			INT_Spectrum_5_CONFIG_WR <= "1"; 
		end if;
		if addr = x"001A0002" then
			REG_Spectrum_5_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_5_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"001A0003" then
			REG_Spectrum_5_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_5_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"001A0004" then
			REG_Spectrum_5_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_5_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"001A0005" then
			REG_Spectrum_5_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_5_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"001B0000" And addr < x"001C0000" Then
			BUS_Spectrum_17_WRITE_DATA <= wreg; 
			BUS_Spectrum_17_W_INT <= "1"; 
		End If;
		if addr = x"001C0001" then
			REG_Spectrum_17_CONFIG_WR <= wreg; 
			INT_Spectrum_17_CONFIG_WR <= "1"; 
		end if;
		if addr = x"001C0002" then
			REG_Spectrum_17_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_17_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"001C0003" then
			REG_Spectrum_17_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_17_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"001C0004" then
			REG_Spectrum_17_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_17_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"001C0005" then
			REG_Spectrum_17_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_17_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"001D0000" And addr < x"001E0000" Then
			BUS_Spectrum_6_WRITE_DATA <= wreg; 
			BUS_Spectrum_6_W_INT <= "1"; 
		End If;
		if addr = x"001E0001" then
			REG_Spectrum_6_CONFIG_WR <= wreg; 
			INT_Spectrum_6_CONFIG_WR <= "1"; 
		end if;
		if addr = x"001E0002" then
			REG_Spectrum_6_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_6_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"001E0003" then
			REG_Spectrum_6_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_6_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"001E0004" then
			REG_Spectrum_6_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_6_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"001E0005" then
			REG_Spectrum_6_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_6_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"001F0000" And addr < x"00200000" Then
			BUS_Spectrum_18_WRITE_DATA <= wreg; 
			BUS_Spectrum_18_W_INT <= "1"; 
		End If;
		if addr = x"00200001" then
			REG_Spectrum_18_CONFIG_WR <= wreg; 
			INT_Spectrum_18_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00200002" then
			REG_Spectrum_18_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_18_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00200003" then
			REG_Spectrum_18_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_18_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00200004" then
			REG_Spectrum_18_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_18_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00200005" then
			REG_Spectrum_18_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_18_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00210000" And addr < x"00220000" Then
			BUS_Spectrum_7_WRITE_DATA <= wreg; 
			BUS_Spectrum_7_W_INT <= "1"; 
		End If;
		if addr = x"00220001" then
			REG_Spectrum_7_CONFIG_WR <= wreg; 
			INT_Spectrum_7_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00220002" then
			REG_Spectrum_7_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_7_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00220003" then
			REG_Spectrum_7_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_7_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00220004" then
			REG_Spectrum_7_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_7_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00220005" then
			REG_Spectrum_7_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_7_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00230000" And addr < x"00240000" Then
			BUS_Spectrum_19_WRITE_DATA <= wreg; 
			BUS_Spectrum_19_W_INT <= "1"; 
		End If;
		if addr = x"00240001" then
			REG_Spectrum_19_CONFIG_WR <= wreg; 
			INT_Spectrum_19_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00240002" then
			REG_Spectrum_19_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_19_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00240003" then
			REG_Spectrum_19_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_19_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00240004" then
			REG_Spectrum_19_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_19_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00240005" then
			REG_Spectrum_19_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_19_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00250000" And addr < x"00260000" Then
			BUS_Spectrum_8_WRITE_DATA <= wreg; 
			BUS_Spectrum_8_W_INT <= "1"; 
		End If;
		if addr = x"00260001" then
			REG_Spectrum_8_CONFIG_WR <= wreg; 
			INT_Spectrum_8_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00260002" then
			REG_Spectrum_8_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_8_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00260003" then
			REG_Spectrum_8_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_8_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00260004" then
			REG_Spectrum_8_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_8_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00260005" then
			REG_Spectrum_8_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_8_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00270000" And addr < x"00280000" Then
			BUS_Spectrum_20_WRITE_DATA <= wreg; 
			BUS_Spectrum_20_W_INT <= "1"; 
		End If;
		if addr = x"00280001" then
			REG_Spectrum_20_CONFIG_WR <= wreg; 
			INT_Spectrum_20_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00280002" then
			REG_Spectrum_20_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_20_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00280003" then
			REG_Spectrum_20_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_20_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00280004" then
			REG_Spectrum_20_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_20_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00280005" then
			REG_Spectrum_20_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_20_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00290000" And addr < x"002A0000" Then
			BUS_Spectrum_9_WRITE_DATA <= wreg; 
			BUS_Spectrum_9_W_INT <= "1"; 
		End If;
		if addr = x"002A0001" then
			REG_Spectrum_9_CONFIG_WR <= wreg; 
			INT_Spectrum_9_CONFIG_WR <= "1"; 
		end if;
		if addr = x"002A0002" then
			REG_Spectrum_9_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_9_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"002A0003" then
			REG_Spectrum_9_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_9_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"002A0004" then
			REG_Spectrum_9_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_9_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"002A0005" then
			REG_Spectrum_9_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_9_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"002B0000" And addr < x"002C0000" Then
			BUS_Spectrum_21_WRITE_DATA <= wreg; 
			BUS_Spectrum_21_W_INT <= "1"; 
		End If;
		if addr = x"002C0001" then
			REG_Spectrum_21_CONFIG_WR <= wreg; 
			INT_Spectrum_21_CONFIG_WR <= "1"; 
		end if;
		if addr = x"002C0002" then
			REG_Spectrum_21_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_21_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"002C0003" then
			REG_Spectrum_21_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_21_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"002C0004" then
			REG_Spectrum_21_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_21_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"002C0005" then
			REG_Spectrum_21_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_21_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"002D0000" And addr < x"002E0000" Then
			BUS_SyncIn_WRITE_DATA <= wreg; 
			BUS_SyncIn_W_INT <= "1"; 
		End If;
		If addr >= x"002F0000" And addr < x"00300000" Then
			BUS_Spectrum_10_WRITE_DATA <= wreg; 
			BUS_Spectrum_10_W_INT <= "1"; 
		End If;
		if addr = x"00300001" then
			REG_Spectrum_10_CONFIG_WR <= wreg; 
			INT_Spectrum_10_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00300002" then
			REG_Spectrum_10_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_10_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00300003" then
			REG_Spectrum_10_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_10_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00300004" then
			REG_Spectrum_10_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_10_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00300005" then
			REG_Spectrum_10_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_10_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00310000" And addr < x"00320000" Then
			BUS_Spectrum_22_WRITE_DATA <= wreg; 
			BUS_Spectrum_22_W_INT <= "1"; 
		End If;
		if addr = x"00320001" then
			REG_Spectrum_22_CONFIG_WR <= wreg; 
			INT_Spectrum_22_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00320002" then
			REG_Spectrum_22_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_22_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00320003" then
			REG_Spectrum_22_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_22_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00320004" then
			REG_Spectrum_22_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_22_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00320005" then
			REG_Spectrum_22_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_22_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00330000" And addr < x"00340000" Then
			BUS_Spectrum_11_WRITE_DATA <= wreg; 
			BUS_Spectrum_11_W_INT <= "1"; 
		End If;
		if addr = x"00340001" then
			REG_Spectrum_11_CONFIG_WR <= wreg; 
			INT_Spectrum_11_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00340002" then
			REG_Spectrum_11_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_11_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00340003" then
			REG_Spectrum_11_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_11_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00340004" then
			REG_Spectrum_11_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_11_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00340005" then
			REG_Spectrum_11_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_11_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00350000" And addr < x"00360000" Then
			BUS_Spectrum_23_WRITE_DATA <= wreg; 
			BUS_Spectrum_23_W_INT <= "1"; 
		End If;
		if addr = x"00360001" then
			REG_Spectrum_23_CONFIG_WR <= wreg; 
			INT_Spectrum_23_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00360002" then
			REG_Spectrum_23_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_23_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00360003" then
			REG_Spectrum_23_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_23_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00360004" then
			REG_Spectrum_23_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_23_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00360005" then
			REG_Spectrum_23_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_23_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00361000" And addr < x"00362000" Then
			BUS_Syncs_WRITE_DATA <= wreg; 
			BUS_Syncs_W_INT <= "1"; 
		End If;
		if addr = x"00362002" then
			REG_Syncs_CONFIG_TRIGGER_MODE_WR <= wreg; 
			INT_Syncs_CONFIG_TRIGGER_MODE_WR <= "1"; 
		end if;
		if addr = x"00362003" then
			REG_Syncs_CONFIG_PRETRIGGER_WR <= wreg; 
			INT_Syncs_CONFIG_PRETRIGGER_WR <= "1"; 
		end if;
		if addr = x"00362004" then
			REG_Syncs_CONFIG_TRIGGER_LEVEL_WR <= wreg; 
			INT_Syncs_CONFIG_TRIGGER_LEVEL_WR <= "1"; 
		end if;
		if addr = x"00362005" then
			REG_Syncs_CONFIG_ARM_WR <= wreg; 
			INT_Syncs_CONFIG_ARM_WR <= "1"; 
		end if;
		if addr = x"00362006" then
			REG_Syncs_CONFIG_DECIMATOR_WR <= wreg; 
			INT_Syncs_CONFIG_DECIMATOR_WR <= "1"; 
		end if;
		If addr >= x"00362008" And addr < x"00362009" Then
			BUS_io_WRITE_DATA <= wreg; 
			BUS_io_W_INT <= "1"; 
		End If;
		if addr = x"00362009" then
			REG_io_to_encode_WR <= wreg; 
			INT_io_to_encode_WR <= "1"; 
		end if;
		if addr = x"0036200A" then
			REG_io_stamptype_WR <= wreg; 
			INT_io_stamptype_WR <= "1"; 
		end if;
		if addr = x"0036200B" then
			REG_io_lemo2out_WR <= wreg; 
			INT_io_lemo2out_WR <= "1"; 
		end if;
		if addr = x"0036200C" then
			REG_io_divide_WR <= wreg; 
			INT_io_divide_WR <= "1"; 
		end if;
		if addr = x"0036200D" then
			REG_dummy_WR <= wreg; 
			INT_dummy_WR <= "1"; 
		end if;
		if addr = x"0036200E" then
			REG_forcetrig_WR <= wreg; 
			INT_forcetrig_WR <= "1"; 
		end if;
		if addr = x"0036200F" then
			REG_full_WR <= wreg; 
			INT_full_WR <= "1"; 
		end if;
		if addr = x"00362010" then
			REG_trigger_code_WR <= wreg; 
			INT_trigger_code_WR <= "1"; 
		end if;
		if addr = x"00362011" then
			REG_reset_WR <= wreg; 
			INT_reset_WR <= "1"; 
		end if;
		if addr = x"00362012" then
			REG_timestamp_WR <= wreg; 
			INT_timestamp_WR <= "1"; 
		end if;
		if addr = x"00362013" then
			REG_received_WR <= wreg; 
			INT_received_WR <= "1"; 
		end if;
		If addr >= x"00368000" And addr < x"00370000" Then
			BUS_baselines_WRITE_DATA <= wreg; 
			BUS_baselines_W_INT <= "1"; 
		End If;
		if addr = x"00370002" then
			REG_baselines_CONFIG_TRIGGER_MODE_WR <= wreg; 
			INT_baselines_CONFIG_TRIGGER_MODE_WR <= "1"; 
		end if;
		if addr = x"00370003" then
			REG_baselines_CONFIG_PRETRIGGER_WR <= wreg; 
			INT_baselines_CONFIG_PRETRIGGER_WR <= "1"; 
		end if;
		if addr = x"00370004" then
			REG_baselines_CONFIG_TRIGGER_LEVEL_WR <= wreg; 
			INT_baselines_CONFIG_TRIGGER_LEVEL_WR <= "1"; 
		end if;
		if addr = x"00370005" then
			REG_baselines_CONFIG_ARM_WR <= wreg; 
			INT_baselines_CONFIG_ARM_WR <= "1"; 
		end if;
		if addr = x"00370006" then
			REG_baselines_CONFIG_DECIMATOR_WR <= wreg; 
			INT_baselines_CONFIG_DECIMATOR_WR <= "1"; 
		end if;
		If addr >= x"0003200D" And addr < x"0003200E" Then
			BUS_int_WRITE_DATA <= wreg; 
			BUS_int_W_INT <= "1"; 
		End If;
		if addr = x"0003200E" then
			REG_int_time_WR <= wreg; 
			INT_int_time_WR <= "1"; 
		end if;
		if addr = x"0003200F" then
			REG_int_pre_WR <= wreg; 
			INT_int_pre_WR <= "1"; 
		end if;
		if addr = x"00032010" then
			REG_int_base_WR <= wreg; 
			INT_int_base_WR <= "1"; 
		end if;

                end if;
        
        
                if f_BUS_INT_RD = '1' then
                    f_BUS_DATASTROBE_REG <= '1';
                    rreg := x"DEADBEEF";
    
    		if addr = x"00008000" then
			rreg := REG_Energies_READ_STATUS_RD; 
		End If;
		if addr = x"00008001" then
			rreg := REG_Energies_READ_POSITION_RD; 
		End If;
		if addr = x"00008002" then
			rreg := REG_Energies_CONFIG_TRIGGER_MODE_RD; 
		End If;
		if addr = x"00008003" then
			rreg := REG_Energies_CONFIG_PRETRIGGER_RD; 
		End If;
		if addr = x"00008004" then
			rreg := REG_Energies_CONFIG_TRIGGER_LEVEL_RD; 
		End If;
		if addr = x"00008005" then
			rreg := REG_Energies_CONFIG_ARM_RD; 
		End If;
		if addr = x"00008006" then
			rreg := REG_Energies_CONFIG_DECIMATOR_RD; 
		End If;
		if addr = x"00018000" then
			rreg := REG_Analog_READ_STATUS_RD; 
		End If;
		if addr = x"00018001" then
			rreg := REG_Analog_READ_POSITION_RD; 
		End If;
		if addr = x"00018002" then
			rreg := REG_Analog_CONFIG_TRIGGER_MODE_RD; 
		End If;
		if addr = x"00018003" then
			rreg := REG_Analog_CONFIG_PRETRIGGER_RD; 
		End If;
		if addr = x"00018004" then
			rreg := REG_Analog_CONFIG_TRIGGER_LEVEL_RD; 
		End If;
		if addr = x"00018005" then
			rreg := REG_Analog_CONFIG_ARM_RD; 
		End If;
		if addr = x"00018006" then
			rreg := REG_Analog_CONFIG_DECIMATOR_RD; 
		End If;
		if addr = x"00018009" then
			rreg := REG_trig_polarity_RD; 
		End If;
		if addr = x"0001800A" then
			rreg := REG_trig_inhib_RD; 
		End If;
		if addr = x"0001800B" then
			rreg := REG_trig_gate_l_RD; 
		End If;
		if addr = x"0001800C" then
			rreg := REG_trig_gate_u_RD; 
		End If;
		if addr = x"0001800D" then
			rreg := REG_trig_delay_RD; 
		End If;
		if addr = x"0001800E" then
			rreg := REG_trig_mode_RD; 
		End If;
		if addr = x"00030002" then
			rreg := REG_thrsh_CH0_RD; 
		End If;
		if addr = x"00030003" then
			rreg := REG_thrsh_CH1_RD; 
		End If;
		if addr = x"00030004" then
			rreg := REG_thrsh_CH2_RD; 
		End If;
		if addr = x"00030005" then
			rreg := REG_thrsh_CH3_RD; 
		End If;
		if addr = x"00030006" then
			rreg := REG_thrsh_CH4_RD; 
		End If;
		if addr = x"00030007" then
			rreg := REG_thrsh_CH5_RD; 
		End If;
		if addr = x"00030008" then
			rreg := REG_thrsh_CH6_RD; 
		End If;
		if addr = x"00030009" then
			rreg := REG_thrsh_CH7_RD; 
		End If;
		if addr = x"0003000A" then
			rreg := REG_thrsh_CH8_RD; 
		End If;
		if addr = x"0003000B" then
			rreg := REG_thrsh_CH9_RD; 
		End If;
		if addr = x"0003000C" then
			rreg := REG_thrsh_CH10_RD; 
		End If;
		if addr = x"0003000D" then
			rreg := REG_thrsh_CH11_RD; 
		End If;
		if addr = x"0003000E" then
			rreg := REG_thrsh_CH12_RD; 
		End If;
		if addr = x"0003000F" then
			rreg := REG_thrsh_CH13_RD; 
		End If;
		if addr = x"00030010" then
			rreg := REG_thrsh_CH14_RD; 
		End If;
		if addr = x"00030011" then
			rreg := REG_thrsh_CH15_RD; 
		End If;
		if addr = x"00030012" then
			rreg := REG_thrsh_CH16_RD; 
		End If;
		if addr = x"00030013" then
			rreg := REG_thrsh_CH17_RD; 
		End If;
		if addr = x"00030014" then
			rreg := REG_thrsh_CH18_RD; 
		End If;
		if addr = x"00030015" then
			rreg := REG_thrsh_CH19_RD; 
		End If;
		if addr = x"00030016" then
			rreg := REG_thrsh_CH20_RD; 
		End If;
		if addr = x"00030017" then
			rreg := REG_thrsh_CH21_RD; 
		End If;
		if addr = x"00030018" then
			rreg := REG_thrsh_CH22_RD; 
		End If;
		if addr = x"00030019" then
			rreg := REG_thrsh_CH23_RD; 
		End If;
		if addr = x"00032000" then
			rreg := REG_diag_READ_STATUS_RD; 
		End If;
		if addr = x"00032001" then
			rreg := REG_diag_READ_POSITION_RD; 
		End If;
		if addr = x"00032002" then
			rreg := REG_diag_CONFIG_TRIGGER_MODE_RD; 
		End If;
		if addr = x"00032003" then
			rreg := REG_diag_CONFIG_PRETRIGGER_RD; 
		End If;
		if addr = x"00032004" then
			rreg := REG_diag_CONFIG_TRIGGER_LEVEL_RD; 
		End If;
		if addr = x"00032005" then
			rreg := REG_diag_CONFIG_ARM_RD; 
		End If;
		if addr = x"00032006" then
			rreg := REG_diag_CONFIG_DECIMATOR_RD; 
		End If;
		if addr = x"00032009" then
			rreg := REG_All_Energies_READ_STATUS_RD; 
		End If;
		if addr = x"0003200A" then
			rreg := REG_All_Energies_READ_VALID_WORDS_RD; 
		End If;
		if addr = x"0003200B" then
			rreg := REG_All_Energies_CONFIG_RD; 
		End If;
		if addr = x"00032013" then
			rreg := REG_top_CH0_RD; 
		End If;
		if addr = x"00032014" then
			rreg := REG_top_CH1_RD; 
		End If;
		if addr = x"00032015" then
			rreg := REG_top_CH2_RD; 
		End If;
		if addr = x"00032016" then
			rreg := REG_top_CH3_RD; 
		End If;
		if addr = x"00032017" then
			rreg := REG_top_CH4_RD; 
		End If;
		if addr = x"00032018" then
			rreg := REG_top_CH5_RD; 
		End If;
		if addr = x"00032019" then
			rreg := REG_top_CH6_RD; 
		End If;
		if addr = x"0003201A" then
			rreg := REG_top_CH7_RD; 
		End If;
		if addr = x"0003201B" then
			rreg := REG_top_CH8_RD; 
		End If;
		if addr = x"0003201C" then
			rreg := REG_top_CH9_RD; 
		End If;
		if addr = x"0003201D" then
			rreg := REG_top_CH10_RD; 
		End If;
		if addr = x"0003201E" then
			rreg := REG_top_CH11_RD; 
		End If;
		if addr = x"0003201F" then
			rreg := REG_top_CH12_RD; 
		End If;
		if addr = x"00032020" then
			rreg := REG_top_CH13_RD; 
		End If;
		if addr = x"00032021" then
			rreg := REG_top_CH14_RD; 
		End If;
		if addr = x"00032022" then
			rreg := REG_top_CH15_RD; 
		End If;
		if addr = x"00032023" then
			rreg := REG_top_CH16_RD; 
		End If;
		if addr = x"00032024" then
			rreg := REG_top_CH17_RD; 
		End If;
		if addr = x"00032025" then
			rreg := REG_top_CH18_RD; 
		End If;
		if addr = x"00032026" then
			rreg := REG_top_CH19_RD; 
		End If;
		if addr = x"00032027" then
			rreg := REG_top_CH20_RD; 
		End If;
		if addr = x"00032028" then
			rreg := REG_top_CH21_RD; 
		End If;
		if addr = x"00032029" then
			rreg := REG_top_CH22_RD; 
		End If;
		if addr = x"0003202A" then
			rreg := REG_top_CH23_RD; 
		End If;
		if addr = x"0003202D" then
			rreg := REG_base_CH0_RD; 
		End If;
		if addr = x"0003202E" then
			rreg := REG_base_CH1_RD; 
		End If;
		if addr = x"0003202F" then
			rreg := REG_base_CH2_RD; 
		End If;
		if addr = x"00032030" then
			rreg := REG_base_CH3_RD; 
		End If;
		if addr = x"00032031" then
			rreg := REG_base_CH4_RD; 
		End If;
		if addr = x"00032032" then
			rreg := REG_base_CH5_RD; 
		End If;
		if addr = x"00032033" then
			rreg := REG_base_CH6_RD; 
		End If;
		if addr = x"00032034" then
			rreg := REG_base_CH7_RD; 
		End If;
		if addr = x"00032035" then
			rreg := REG_base_CH8_RD; 
		End If;
		if addr = x"00032036" then
			rreg := REG_base_CH9_RD; 
		End If;
		if addr = x"00032037" then
			rreg := REG_base_CH10_RD; 
		End If;
		if addr = x"00032038" then
			rreg := REG_base_CH11_RD; 
		End If;
		if addr = x"00032039" then
			rreg := REG_base_CH12_RD; 
		End If;
		if addr = x"0003203A" then
			rreg := REG_base_CH13_RD; 
		End If;
		if addr = x"0003203B" then
			rreg := REG_base_CH14_RD; 
		End If;
		if addr = x"0003203C" then
			rreg := REG_base_CH15_RD; 
		End If;
		if addr = x"0003203D" then
			rreg := REG_base_CH16_RD; 
		End If;
		if addr = x"0003203E" then
			rreg := REG_base_CH17_RD; 
		End If;
		if addr = x"0003203F" then
			rreg := REG_base_CH18_RD; 
		End If;
		if addr = x"00032040" then
			rreg := REG_base_CH19_RD; 
		End If;
		if addr = x"00032041" then
			rreg := REG_base_CH20_RD; 
		End If;
		if addr = x"00032042" then
			rreg := REG_base_CH21_RD; 
		End If;
		if addr = x"00032043" then
			rreg := REG_base_CH22_RD; 
		End If;
		if addr = x"00032044" then
			rreg := REG_base_CH23_RD; 
		End If;
		if addr = x"00032047" then
			rreg := REG_disable_det_CH0_RD; 
		End If;
		if addr = x"00032048" then
			rreg := REG_disable_det_CH1_RD; 
		End If;
		if addr = x"00032049" then
			rreg := REG_disable_det_CH2_RD; 
		End If;
		if addr = x"0003204A" then
			rreg := REG_disable_det_CH3_RD; 
		End If;
		if addr = x"0003204B" then
			rreg := REG_disable_det_CH4_RD; 
		End If;
		if addr = x"0003204C" then
			rreg := REG_disable_det_CH5_RD; 
		End If;
		if addr = x"0003204D" then
			rreg := REG_disable_det_CH6_RD; 
		End If;
		if addr = x"0003204E" then
			rreg := REG_disable_det_CH7_RD; 
		End If;
		if addr = x"0003204F" then
			rreg := REG_disable_det_CH8_RD; 
		End If;
		if addr = x"00032050" then
			rreg := REG_disable_det_CH9_RD; 
		End If;
		if addr = x"00032051" then
			rreg := REG_disable_det_CH10_RD; 
		End If;
		if addr = x"00032052" then
			rreg := REG_disable_det_CH11_RD; 
		End If;
		if addr = x"00032053" then
			rreg := REG_disable_det_CH12_RD; 
		End If;
		if addr = x"00032054" then
			rreg := REG_disable_det_CH13_RD; 
		End If;
		if addr = x"00032055" then
			rreg := REG_disable_det_CH14_RD; 
		End If;
		if addr = x"00032056" then
			rreg := REG_disable_det_CH15_RD; 
		End If;
		if addr = x"00032057" then
			rreg := REG_disable_det_CH16_RD; 
		End If;
		if addr = x"00032058" then
			rreg := REG_disable_det_CH17_RD; 
		End If;
		if addr = x"00032059" then
			rreg := REG_disable_det_CH18_RD; 
		End If;
		if addr = x"0003205A" then
			rreg := REG_disable_det_CH19_RD; 
		End If;
		if addr = x"0003205B" then
			rreg := REG_disable_det_CH20_RD; 
		End If;
		if addr = x"0003205C" then
			rreg := REG_disable_det_CH21_RD; 
		End If;
		if addr = x"0003205D" then
			rreg := REG_disable_det_CH22_RD; 
		End If;
		if addr = x"0003205E" then
			rreg := REG_disable_det_CH23_RD; 
		End If;
		if addr = x"00050000" then
			rreg := REG_Spectrum_0_STATUS_RD; 
		End If;
		if addr = x"00050001" then
			rreg := REG_Spectrum_0_CONFIG_RD; 
		End If;
		if addr = x"00050002" then
			rreg := REG_Spectrum_0_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00050003" then
			rreg := REG_Spectrum_0_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00050004" then
			rreg := REG_Spectrum_0_CONFIG_MIN_RD; 
		End If;
		if addr = x"00050005" then
			rreg := REG_Spectrum_0_CONFIG_MAX_RD; 
		End If;
		if addr = x"00060000" then
			rreg := REG_Analog_In_Unflipped_READ_STATUS_RD; 
		End If;
		if addr = x"00060001" then
			rreg := REG_Analog_In_Unflipped_READ_POSITION_RD; 
		End If;
		if addr = x"00060002" then
			rreg := REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_RD; 
		End If;
		if addr = x"00060003" then
			rreg := REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_RD; 
		End If;
		if addr = x"00060004" then
			rreg := REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_RD; 
		End If;
		if addr = x"00060005" then
			rreg := REG_Analog_In_Unflipped_CONFIG_ARM_RD; 
		End If;
		if addr = x"00060006" then
			rreg := REG_Analog_In_Unflipped_CONFIG_DECIMATOR_RD; 
		End If;
		if addr = x"00080000" then
			rreg := REG_Spectrum_12_STATUS_RD; 
		End If;
		if addr = x"00080001" then
			rreg := REG_Spectrum_12_CONFIG_RD; 
		End If;
		if addr = x"00080002" then
			rreg := REG_Spectrum_12_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00080003" then
			rreg := REG_Spectrum_12_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00080004" then
			rreg := REG_Spectrum_12_CONFIG_MIN_RD; 
		End If;
		if addr = x"00080005" then
			rreg := REG_Spectrum_12_CONFIG_MAX_RD; 
		End If;
		if addr = x"000A0000" then
			rreg := REG_Spectrum_1_STATUS_RD; 
		End If;
		if addr = x"000A0001" then
			rreg := REG_Spectrum_1_CONFIG_RD; 
		End If;
		if addr = x"000A0002" then
			rreg := REG_Spectrum_1_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"000A0003" then
			rreg := REG_Spectrum_1_CONFIG_REBIN_RD; 
		End If;
		if addr = x"000A0004" then
			rreg := REG_Spectrum_1_CONFIG_MIN_RD; 
		End If;
		if addr = x"000A0005" then
			rreg := REG_Spectrum_1_CONFIG_MAX_RD; 
		End If;
		if addr = x"000C0000" then
			rreg := REG_Spectrum_13_STATUS_RD; 
		End If;
		if addr = x"000C0001" then
			rreg := REG_Spectrum_13_CONFIG_RD; 
		End If;
		if addr = x"000C0002" then
			rreg := REG_Spectrum_13_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"000C0003" then
			rreg := REG_Spectrum_13_CONFIG_REBIN_RD; 
		End If;
		if addr = x"000C0004" then
			rreg := REG_Spectrum_13_CONFIG_MIN_RD; 
		End If;
		if addr = x"000C0005" then
			rreg := REG_Spectrum_13_CONFIG_MAX_RD; 
		End If;
		if addr = x"000E0000" then
			rreg := REG_Spectrum_2_STATUS_RD; 
		End If;
		if addr = x"000E0001" then
			rreg := REG_Spectrum_2_CONFIG_RD; 
		End If;
		if addr = x"000E0002" then
			rreg := REG_Spectrum_2_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"000E0003" then
			rreg := REG_Spectrum_2_CONFIG_REBIN_RD; 
		End If;
		if addr = x"000E0004" then
			rreg := REG_Spectrum_2_CONFIG_MIN_RD; 
		End If;
		if addr = x"000E0005" then
			rreg := REG_Spectrum_2_CONFIG_MAX_RD; 
		End If;
		if addr = x"00100000" then
			rreg := REG_Spectrum_14_STATUS_RD; 
		End If;
		if addr = x"00100001" then
			rreg := REG_Spectrum_14_CONFIG_RD; 
		End If;
		if addr = x"00100002" then
			rreg := REG_Spectrum_14_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00100003" then
			rreg := REG_Spectrum_14_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00100004" then
			rreg := REG_Spectrum_14_CONFIG_MIN_RD; 
		End If;
		if addr = x"00100005" then
			rreg := REG_Spectrum_14_CONFIG_MAX_RD; 
		End If;
		if addr = x"00120000" then
			rreg := REG_Spectrum_3_STATUS_RD; 
		End If;
		if addr = x"00120001" then
			rreg := REG_Spectrum_3_CONFIG_RD; 
		End If;
		if addr = x"00120002" then
			rreg := REG_Spectrum_3_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00120003" then
			rreg := REG_Spectrum_3_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00120004" then
			rreg := REG_Spectrum_3_CONFIG_MIN_RD; 
		End If;
		if addr = x"00120005" then
			rreg := REG_Spectrum_3_CONFIG_MAX_RD; 
		End If;
		if addr = x"00140000" then
			rreg := REG_Spectrum_15_STATUS_RD; 
		End If;
		if addr = x"00140001" then
			rreg := REG_Spectrum_15_CONFIG_RD; 
		End If;
		if addr = x"00140002" then
			rreg := REG_Spectrum_15_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00140003" then
			rreg := REG_Spectrum_15_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00140004" then
			rreg := REG_Spectrum_15_CONFIG_MIN_RD; 
		End If;
		if addr = x"00140005" then
			rreg := REG_Spectrum_15_CONFIG_MAX_RD; 
		End If;
		if addr = x"00160000" then
			rreg := REG_Spectrum_4_STATUS_RD; 
		End If;
		if addr = x"00160001" then
			rreg := REG_Spectrum_4_CONFIG_RD; 
		End If;
		if addr = x"00160002" then
			rreg := REG_Spectrum_4_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00160003" then
			rreg := REG_Spectrum_4_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00160004" then
			rreg := REG_Spectrum_4_CONFIG_MIN_RD; 
		End If;
		if addr = x"00160005" then
			rreg := REG_Spectrum_4_CONFIG_MAX_RD; 
		End If;
		if addr = x"00180000" then
			rreg := REG_Spectrum_16_STATUS_RD; 
		End If;
		if addr = x"00180001" then
			rreg := REG_Spectrum_16_CONFIG_RD; 
		End If;
		if addr = x"00180002" then
			rreg := REG_Spectrum_16_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00180003" then
			rreg := REG_Spectrum_16_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00180004" then
			rreg := REG_Spectrum_16_CONFIG_MIN_RD; 
		End If;
		if addr = x"00180005" then
			rreg := REG_Spectrum_16_CONFIG_MAX_RD; 
		End If;
		if addr = x"001A0000" then
			rreg := REG_Spectrum_5_STATUS_RD; 
		End If;
		if addr = x"001A0001" then
			rreg := REG_Spectrum_5_CONFIG_RD; 
		End If;
		if addr = x"001A0002" then
			rreg := REG_Spectrum_5_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"001A0003" then
			rreg := REG_Spectrum_5_CONFIG_REBIN_RD; 
		End If;
		if addr = x"001A0004" then
			rreg := REG_Spectrum_5_CONFIG_MIN_RD; 
		End If;
		if addr = x"001A0005" then
			rreg := REG_Spectrum_5_CONFIG_MAX_RD; 
		End If;
		if addr = x"001C0000" then
			rreg := REG_Spectrum_17_STATUS_RD; 
		End If;
		if addr = x"001C0001" then
			rreg := REG_Spectrum_17_CONFIG_RD; 
		End If;
		if addr = x"001C0002" then
			rreg := REG_Spectrum_17_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"001C0003" then
			rreg := REG_Spectrum_17_CONFIG_REBIN_RD; 
		End If;
		if addr = x"001C0004" then
			rreg := REG_Spectrum_17_CONFIG_MIN_RD; 
		End If;
		if addr = x"001C0005" then
			rreg := REG_Spectrum_17_CONFIG_MAX_RD; 
		End If;
		if addr = x"001E0000" then
			rreg := REG_Spectrum_6_STATUS_RD; 
		End If;
		if addr = x"001E0001" then
			rreg := REG_Spectrum_6_CONFIG_RD; 
		End If;
		if addr = x"001E0002" then
			rreg := REG_Spectrum_6_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"001E0003" then
			rreg := REG_Spectrum_6_CONFIG_REBIN_RD; 
		End If;
		if addr = x"001E0004" then
			rreg := REG_Spectrum_6_CONFIG_MIN_RD; 
		End If;
		if addr = x"001E0005" then
			rreg := REG_Spectrum_6_CONFIG_MAX_RD; 
		End If;
		if addr = x"00200000" then
			rreg := REG_Spectrum_18_STATUS_RD; 
		End If;
		if addr = x"00200001" then
			rreg := REG_Spectrum_18_CONFIG_RD; 
		End If;
		if addr = x"00200002" then
			rreg := REG_Spectrum_18_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00200003" then
			rreg := REG_Spectrum_18_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00200004" then
			rreg := REG_Spectrum_18_CONFIG_MIN_RD; 
		End If;
		if addr = x"00200005" then
			rreg := REG_Spectrum_18_CONFIG_MAX_RD; 
		End If;
		if addr = x"00220000" then
			rreg := REG_Spectrum_7_STATUS_RD; 
		End If;
		if addr = x"00220001" then
			rreg := REG_Spectrum_7_CONFIG_RD; 
		End If;
		if addr = x"00220002" then
			rreg := REG_Spectrum_7_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00220003" then
			rreg := REG_Spectrum_7_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00220004" then
			rreg := REG_Spectrum_7_CONFIG_MIN_RD; 
		End If;
		if addr = x"00220005" then
			rreg := REG_Spectrum_7_CONFIG_MAX_RD; 
		End If;
		if addr = x"00240000" then
			rreg := REG_Spectrum_19_STATUS_RD; 
		End If;
		if addr = x"00240001" then
			rreg := REG_Spectrum_19_CONFIG_RD; 
		End If;
		if addr = x"00240002" then
			rreg := REG_Spectrum_19_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00240003" then
			rreg := REG_Spectrum_19_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00240004" then
			rreg := REG_Spectrum_19_CONFIG_MIN_RD; 
		End If;
		if addr = x"00240005" then
			rreg := REG_Spectrum_19_CONFIG_MAX_RD; 
		End If;
		if addr = x"00260000" then
			rreg := REG_Spectrum_8_STATUS_RD; 
		End If;
		if addr = x"00260001" then
			rreg := REG_Spectrum_8_CONFIG_RD; 
		End If;
		if addr = x"00260002" then
			rreg := REG_Spectrum_8_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00260003" then
			rreg := REG_Spectrum_8_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00260004" then
			rreg := REG_Spectrum_8_CONFIG_MIN_RD; 
		End If;
		if addr = x"00260005" then
			rreg := REG_Spectrum_8_CONFIG_MAX_RD; 
		End If;
		if addr = x"00280000" then
			rreg := REG_Spectrum_20_STATUS_RD; 
		End If;
		if addr = x"00280001" then
			rreg := REG_Spectrum_20_CONFIG_RD; 
		End If;
		if addr = x"00280002" then
			rreg := REG_Spectrum_20_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00280003" then
			rreg := REG_Spectrum_20_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00280004" then
			rreg := REG_Spectrum_20_CONFIG_MIN_RD; 
		End If;
		if addr = x"00280005" then
			rreg := REG_Spectrum_20_CONFIG_MAX_RD; 
		End If;
		if addr = x"002A0000" then
			rreg := REG_Spectrum_9_STATUS_RD; 
		End If;
		if addr = x"002A0001" then
			rreg := REG_Spectrum_9_CONFIG_RD; 
		End If;
		if addr = x"002A0002" then
			rreg := REG_Spectrum_9_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"002A0003" then
			rreg := REG_Spectrum_9_CONFIG_REBIN_RD; 
		End If;
		if addr = x"002A0004" then
			rreg := REG_Spectrum_9_CONFIG_MIN_RD; 
		End If;
		if addr = x"002A0005" then
			rreg := REG_Spectrum_9_CONFIG_MAX_RD; 
		End If;
		if addr = x"002C0000" then
			rreg := REG_Spectrum_21_STATUS_RD; 
		End If;
		if addr = x"002C0001" then
			rreg := REG_Spectrum_21_CONFIG_RD; 
		End If;
		if addr = x"002C0002" then
			rreg := REG_Spectrum_21_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"002C0003" then
			rreg := REG_Spectrum_21_CONFIG_REBIN_RD; 
		End If;
		if addr = x"002C0004" then
			rreg := REG_Spectrum_21_CONFIG_MIN_RD; 
		End If;
		if addr = x"002C0005" then
			rreg := REG_Spectrum_21_CONFIG_MAX_RD; 
		End If;
		if addr = x"00300000" then
			rreg := REG_Spectrum_10_STATUS_RD; 
		End If;
		if addr = x"00300001" then
			rreg := REG_Spectrum_10_CONFIG_RD; 
		End If;
		if addr = x"00300002" then
			rreg := REG_Spectrum_10_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00300003" then
			rreg := REG_Spectrum_10_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00300004" then
			rreg := REG_Spectrum_10_CONFIG_MIN_RD; 
		End If;
		if addr = x"00300005" then
			rreg := REG_Spectrum_10_CONFIG_MAX_RD; 
		End If;
		if addr = x"00320000" then
			rreg := REG_Spectrum_22_STATUS_RD; 
		End If;
		if addr = x"00320001" then
			rreg := REG_Spectrum_22_CONFIG_RD; 
		End If;
		if addr = x"00320002" then
			rreg := REG_Spectrum_22_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00320003" then
			rreg := REG_Spectrum_22_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00320004" then
			rreg := REG_Spectrum_22_CONFIG_MIN_RD; 
		End If;
		if addr = x"00320005" then
			rreg := REG_Spectrum_22_CONFIG_MAX_RD; 
		End If;
		if addr = x"00340000" then
			rreg := REG_Spectrum_11_STATUS_RD; 
		End If;
		if addr = x"00340001" then
			rreg := REG_Spectrum_11_CONFIG_RD; 
		End If;
		if addr = x"00340002" then
			rreg := REG_Spectrum_11_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00340003" then
			rreg := REG_Spectrum_11_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00340004" then
			rreg := REG_Spectrum_11_CONFIG_MIN_RD; 
		End If;
		if addr = x"00340005" then
			rreg := REG_Spectrum_11_CONFIG_MAX_RD; 
		End If;
		if addr = x"00360000" then
			rreg := REG_Spectrum_23_STATUS_RD; 
		End If;
		if addr = x"00360001" then
			rreg := REG_Spectrum_23_CONFIG_RD; 
		End If;
		if addr = x"00360002" then
			rreg := REG_Spectrum_23_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00360003" then
			rreg := REG_Spectrum_23_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00360004" then
			rreg := REG_Spectrum_23_CONFIG_MIN_RD; 
		End If;
		if addr = x"00360005" then
			rreg := REG_Spectrum_23_CONFIG_MAX_RD; 
		End If;
		if addr = x"00362000" then
			rreg := REG_Syncs_READ_STATUS_RD; 
		End If;
		if addr = x"00362001" then
			rreg := REG_Syncs_READ_POSITION_RD; 
		End If;
		if addr = x"00362002" then
			rreg := REG_Syncs_CONFIG_TRIGGER_MODE_RD; 
		End If;
		if addr = x"00362003" then
			rreg := REG_Syncs_CONFIG_PRETRIGGER_RD; 
		End If;
		if addr = x"00362004" then
			rreg := REG_Syncs_CONFIG_TRIGGER_LEVEL_RD; 
		End If;
		if addr = x"00362005" then
			rreg := REG_Syncs_CONFIG_ARM_RD; 
		End If;
		if addr = x"00362006" then
			rreg := REG_Syncs_CONFIG_DECIMATOR_RD; 
		End If;
		if addr = x"00362009" then
			rreg := REG_io_to_encode_RD; 
		End If;
		if addr = x"0036200A" then
			rreg := REG_io_stamptype_RD; 
		End If;
		if addr = x"0036200B" then
			rreg := REG_io_lemo2out_RD; 
		End If;
		if addr = x"0036200C" then
			rreg := REG_io_divide_RD; 
		End If;
		if addr = x"0036200D" then
			rreg := REG_dummy_RD; 
		End If;
		if addr = x"0036200E" then
			rreg := REG_forcetrig_RD; 
		End If;
		if addr = x"0036200F" then
			rreg := REG_full_RD; 
		End If;
		if addr = x"00362010" then
			rreg := REG_trigger_code_RD; 
		End If;
		if addr = x"00362011" then
			rreg := REG_reset_RD; 
		End If;
		if addr = x"00362012" then
			rreg := REG_timestamp_RD; 
		End If;
		if addr = x"00362013" then
			rreg := REG_received_RD; 
		End If;
		if addr = x"00370000" then
			rreg := REG_baselines_READ_STATUS_RD; 
		End If;
		if addr = x"00370001" then
			rreg := REG_baselines_READ_POSITION_RD; 
		End If;
		if addr = x"00370002" then
			rreg := REG_baselines_CONFIG_TRIGGER_MODE_RD; 
		End If;
		if addr = x"00370003" then
			rreg := REG_baselines_CONFIG_PRETRIGGER_RD; 
		End If;
		if addr = x"00370004" then
			rreg := REG_baselines_CONFIG_TRIGGER_LEVEL_RD; 
		End If;
		if addr = x"00370005" then
			rreg := REG_baselines_CONFIG_ARM_RD; 
		End If;
		if addr = x"00370006" then
			rreg := REG_baselines_CONFIG_DECIMATOR_RD; 
		End If;
		if addr = x"0003200E" then
			rreg := REG_int_time_RD; 
		End If;
		if addr = x"0003200F" then
			rreg := REG_int_pre_RD; 
		End If;
		if addr = x"00032010" then
			rreg := REG_int_base_RD; 
		End If;
    
                   
                    if addr = x"03FFFFFF" then
                        rreg := x"00556000"; 
                    End If;    
                    if addr = x"03FFFFFE" then
                        rreg := REG_FIRMWARE_BUILD; 
                    End If; 
                    if addr = x"03FFFFFD" then
                        rreg := REG_FIRMWARE_UNIQUE; 
                    End If; 

                    f_BUS_DATA_RD_REG <= rreg;
                    
                    M_AVALON_0_readdatavalid <= '1';
                end if;
    
            end if;
        end process;
            
    M_AVALON_0_waitrequest <= '0';
    
    BUS_ADDR <= M_AVALON_0_address - M_AVALON_BA;
    f_BUS_INT_RD <= M_AVALON_0_read;
    f_BUS_INT_WR <= M_AVALON_0_write;
    M_AVALON_0_readdata <= f_BUS_DATA_RD;
    f_BUS_DATA_WR <= M_AVALON_0_writedata;
    
--    test_reg_process : process (clk)
--    begin
--        if rising_edge(clk) then
            
            
--            if M_AVALON_0_write= '1' then
--                TEST_REG <= M_AVALON_0_writedata +1;
--            end if;
            
--            M_AVALON_0_readdatavalid <= '0';
            
--            if M_AVALON_0_read= '1' then
--                M_AVALON_0_readdata <= M_AVALON_0_address;
--                if M_AVALON_0_address=x"10000000" then
                
--                else
--                    M_AVALON_0_readdatavalid <= '1';
--                end if;
--            end if;
--        end if;
--    end process;

end Behavioral;
