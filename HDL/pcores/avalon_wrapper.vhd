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
BUS_diag_READ_ADDRESS <= BUS_ADDR(11 downto 0) when (addr >= x"00031000" And addr < x"00032000") else (others => '0');BUS_Analog_In_Unflipped_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00038000" And addr < x"00040000") else '0';
BUS_Analog_In_Unflipped_READ_ADDRESS <= BUS_ADDR(14 downto 0) when (addr >= x"00038000" And addr < x"00040000") else (others => '0');BUS_baselines_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00048000" And addr < x"00050000") else '0';
BUS_baselines_READ_ADDRESS <= BUS_ADDR(14 downto 0) when (addr >= x"00048000" And addr < x"00050000") else (others => '0');BUS_All_Energies_R_INT(0) <= f_BUS_INT_RD when (addr >= x"0005000E" And addr < x"0005000F") else '0';
f_BUS_DATA_RD <= BUS_Test_0_READ_DATA when  (addr >= x"03FE0000" And addr < x"03FEFFFF") else 
BUS_Energies_READ_DATA  when  addr >= x"00000000" and addr < x"00008000" else 
BUS_Analog_READ_DATA  when  addr >= x"00010000" and addr < x"00018000" else 
BUS_RateMeter_READ_DATA  when  addr >= x"00020000" and addr < x"00030000" else 
BUS_diag_READ_DATA  when  addr >= x"00031000" and addr < x"00032000" else 
BUS_Analog_In_Unflipped_READ_DATA  when  addr >= x"00038000" and addr < x"00040000" else 
BUS_baselines_READ_DATA  when  addr >= x"00048000" and addr < x"00050000" else 
 BUS_All_Energies_READ_DATA when (addr >= x"0005000E" And addr < x"0005000F") else  f_BUS_DATA_RD_REG;
 f_BUS_DATASTROBE <=BUS_Test_0_VLD(0) when  (addr >= x"03FE0000" And addr < x"03FEFFFF") else 
 BUS_Energies_VLD(0) when  addr >= x"00000000" and addr < x"00008000" else 
 BUS_Analog_VLD(0) when  addr >= x"00010000" and addr < x"00018000" else 
 BUS_RateMeter_VLD(0) when  addr >= x"00020000" and addr < x"00030000" else 
 BUS_diag_VLD(0) when  addr >= x"00031000" and addr < x"00032000" else 
 BUS_Analog_In_Unflipped_VLD(0) when  addr >= x"00038000" and addr < x"00040000" else 
 BUS_baselines_VLD(0) when  addr >= x"00048000" and addr < x"00050000" else 
  BUS_All_Energies_VLD(0) when (addr >= x"0005000E" And addr < x"0005000F") else  f_BUS_DATASTROBE_REG;    

        
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
		REG_int_scale_WR <= (others => '0');
		INT_int_scale_WR <= "0";
	BUS_All_Energies_W_INT <= "0";
		INT_All_Energies_READ_STATUS_RD <= "0";
		INT_All_Energies_READ_VALID_WORDS_RD <= "0";
		REG_All_Energies_CONFIG_WR <= (others => '0');
		INT_All_Energies_CONFIG_WR <= "0";
	BUS_trig_W_INT <= "0";
		REG_trig_gate_l_WR <= (others => '0');
		INT_trig_gate_l_WR <= "0";
		REG_trig_gate_u_WR <= (others => '0');
		INT_trig_gate_u_WR <= "0";
		REG_trig_delay_WR <= (others => '0');
		INT_trig_delay_WR <= "0";
		REG_trig_mode_WR <= (others => '0');
		INT_trig_mode_WR <= "0";
	BUS_io_W_INT <= "0";
		REG_io_stamptype_WR <= (others => '0');
		INT_io_stamptype_WR <= "0";
		REG_io_lemo2out_WR <= (others => '0');
		INT_io_lemo2out_WR <= "0";
		REG_io_divide_WR <= (others => '0');
		INT_io_divide_WR <= "0";
            
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
	BUS_Analog_In_Unflipped_W_INT <= "0";
		INT_Analog_In_Unflipped_READ_STATUS_RD <= "0";
		INT_Analog_In_Unflipped_READ_POSITION_RD <= "0";
		INT_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR <= "0";
		INT_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR <= "0";
		INT_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR <= "0";
		INT_Analog_In_Unflipped_CONFIG_ARM_WR <= "0";
		INT_Analog_In_Unflipped_CONFIG_DECIMATOR_WR <= "0";
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
		INT_int_scale_WR <= "0";
	BUS_All_Energies_W_INT <= "0";
		INT_All_Energies_READ_STATUS_RD <= "0";
		INT_All_Energies_READ_VALID_WORDS_RD <= "0";
		INT_All_Energies_CONFIG_WR <= "0";
	BUS_trig_W_INT <= "0";
		INT_trig_gate_l_WR <= "0";
		INT_trig_gate_u_WR <= "0";
		INT_trig_delay_WR <= "0";
		INT_trig_mode_WR <= "0";
	BUS_io_W_INT <= "0";
		INT_io_stamptype_WR <= "0";
		INT_io_lemo2out_WR <= "0";
		INT_io_divide_WR <= "0";
  
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
			BUS_top_WRITE_DATA <= wreg; 
			BUS_top_W_INT <= "1"; 
		End If;
		if addr = x"00032009" then
			REG_top_CH0_WR <= wreg; 
			INT_top_CH0_WR <= "1"; 
		end if;
		if addr = x"0003200A" then
			REG_top_CH1_WR <= wreg; 
			INT_top_CH1_WR <= "1"; 
		end if;
		if addr = x"0003200B" then
			REG_top_CH2_WR <= wreg; 
			INT_top_CH2_WR <= "1"; 
		end if;
		if addr = x"0003200C" then
			REG_top_CH3_WR <= wreg; 
			INT_top_CH3_WR <= "1"; 
		end if;
		if addr = x"0003200D" then
			REG_top_CH4_WR <= wreg; 
			INT_top_CH4_WR <= "1"; 
		end if;
		if addr = x"0003200E" then
			REG_top_CH5_WR <= wreg; 
			INT_top_CH5_WR <= "1"; 
		end if;
		if addr = x"0003200F" then
			REG_top_CH6_WR <= wreg; 
			INT_top_CH6_WR <= "1"; 
		end if;
		if addr = x"00032010" then
			REG_top_CH7_WR <= wreg; 
			INT_top_CH7_WR <= "1"; 
		end if;
		if addr = x"00032011" then
			REG_top_CH8_WR <= wreg; 
			INT_top_CH8_WR <= "1"; 
		end if;
		if addr = x"00032012" then
			REG_top_CH9_WR <= wreg; 
			INT_top_CH9_WR <= "1"; 
		end if;
		if addr = x"00032013" then
			REG_top_CH10_WR <= wreg; 
			INT_top_CH10_WR <= "1"; 
		end if;
		if addr = x"00032014" then
			REG_top_CH11_WR <= wreg; 
			INT_top_CH11_WR <= "1"; 
		end if;
		if addr = x"00032015" then
			REG_top_CH12_WR <= wreg; 
			INT_top_CH12_WR <= "1"; 
		end if;
		if addr = x"00032016" then
			REG_top_CH13_WR <= wreg; 
			INT_top_CH13_WR <= "1"; 
		end if;
		if addr = x"00032017" then
			REG_top_CH14_WR <= wreg; 
			INT_top_CH14_WR <= "1"; 
		end if;
		if addr = x"00032018" then
			REG_top_CH15_WR <= wreg; 
			INT_top_CH15_WR <= "1"; 
		end if;
		if addr = x"00032019" then
			REG_top_CH16_WR <= wreg; 
			INT_top_CH16_WR <= "1"; 
		end if;
		if addr = x"0003201A" then
			REG_top_CH17_WR <= wreg; 
			INT_top_CH17_WR <= "1"; 
		end if;
		if addr = x"0003201B" then
			REG_top_CH18_WR <= wreg; 
			INT_top_CH18_WR <= "1"; 
		end if;
		if addr = x"0003201C" then
			REG_top_CH19_WR <= wreg; 
			INT_top_CH19_WR <= "1"; 
		end if;
		if addr = x"0003201D" then
			REG_top_CH20_WR <= wreg; 
			INT_top_CH20_WR <= "1"; 
		end if;
		if addr = x"0003201E" then
			REG_top_CH21_WR <= wreg; 
			INT_top_CH21_WR <= "1"; 
		end if;
		if addr = x"0003201F" then
			REG_top_CH22_WR <= wreg; 
			INT_top_CH22_WR <= "1"; 
		end if;
		if addr = x"00032020" then
			REG_top_CH23_WR <= wreg; 
			INT_top_CH23_WR <= "1"; 
		end if;
		If addr >= x"00032022" And addr < x"00032023" Then
			BUS_disable_det_WRITE_DATA <= wreg; 
			BUS_disable_det_W_INT <= "1"; 
		End If;
		if addr = x"00032023" then
			REG_disable_det_CH0_WR <= wreg; 
			INT_disable_det_CH0_WR <= "1"; 
		end if;
		if addr = x"00032024" then
			REG_disable_det_CH1_WR <= wreg; 
			INT_disable_det_CH1_WR <= "1"; 
		end if;
		if addr = x"00032025" then
			REG_disable_det_CH2_WR <= wreg; 
			INT_disable_det_CH2_WR <= "1"; 
		end if;
		if addr = x"00032026" then
			REG_disable_det_CH3_WR <= wreg; 
			INT_disable_det_CH3_WR <= "1"; 
		end if;
		if addr = x"00032027" then
			REG_disable_det_CH4_WR <= wreg; 
			INT_disable_det_CH4_WR <= "1"; 
		end if;
		if addr = x"00032028" then
			REG_disable_det_CH5_WR <= wreg; 
			INT_disable_det_CH5_WR <= "1"; 
		end if;
		if addr = x"00032029" then
			REG_disable_det_CH6_WR <= wreg; 
			INT_disable_det_CH6_WR <= "1"; 
		end if;
		if addr = x"0003202A" then
			REG_disable_det_CH7_WR <= wreg; 
			INT_disable_det_CH7_WR <= "1"; 
		end if;
		if addr = x"0003202B" then
			REG_disable_det_CH8_WR <= wreg; 
			INT_disable_det_CH8_WR <= "1"; 
		end if;
		if addr = x"0003202C" then
			REG_disable_det_CH9_WR <= wreg; 
			INT_disable_det_CH9_WR <= "1"; 
		end if;
		if addr = x"0003202D" then
			REG_disable_det_CH10_WR <= wreg; 
			INT_disable_det_CH10_WR <= "1"; 
		end if;
		if addr = x"0003202E" then
			REG_disable_det_CH11_WR <= wreg; 
			INT_disable_det_CH11_WR <= "1"; 
		end if;
		if addr = x"0003202F" then
			REG_disable_det_CH12_WR <= wreg; 
			INT_disable_det_CH12_WR <= "1"; 
		end if;
		if addr = x"00032030" then
			REG_disable_det_CH13_WR <= wreg; 
			INT_disable_det_CH13_WR <= "1"; 
		end if;
		if addr = x"00032031" then
			REG_disable_det_CH14_WR <= wreg; 
			INT_disable_det_CH14_WR <= "1"; 
		end if;
		if addr = x"00032032" then
			REG_disable_det_CH15_WR <= wreg; 
			INT_disable_det_CH15_WR <= "1"; 
		end if;
		if addr = x"00032033" then
			REG_disable_det_CH16_WR <= wreg; 
			INT_disable_det_CH16_WR <= "1"; 
		end if;
		if addr = x"00032034" then
			REG_disable_det_CH17_WR <= wreg; 
			INT_disable_det_CH17_WR <= "1"; 
		end if;
		if addr = x"00032035" then
			REG_disable_det_CH18_WR <= wreg; 
			INT_disable_det_CH18_WR <= "1"; 
		end if;
		if addr = x"00032036" then
			REG_disable_det_CH19_WR <= wreg; 
			INT_disable_det_CH19_WR <= "1"; 
		end if;
		if addr = x"00032037" then
			REG_disable_det_CH20_WR <= wreg; 
			INT_disable_det_CH20_WR <= "1"; 
		end if;
		if addr = x"00032038" then
			REG_disable_det_CH21_WR <= wreg; 
			INT_disable_det_CH21_WR <= "1"; 
		end if;
		if addr = x"00032039" then
			REG_disable_det_CH22_WR <= wreg; 
			INT_disable_det_CH22_WR <= "1"; 
		end if;
		if addr = x"0003203A" then
			REG_disable_det_CH23_WR <= wreg; 
			INT_disable_det_CH23_WR <= "1"; 
		end if;
		If addr >= x"00038000" And addr < x"00040000" Then
			BUS_Analog_In_Unflipped_WRITE_DATA <= wreg; 
			BUS_Analog_In_Unflipped_W_INT <= "1"; 
		End If;
		if addr = x"00040002" then
			REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR <= wreg; 
			INT_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_WR <= "1"; 
		end if;
		if addr = x"00040003" then
			REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR <= wreg; 
			INT_Analog_In_Unflipped_CONFIG_PRETRIGGER_WR <= "1"; 
		end if;
		if addr = x"00040004" then
			REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR <= wreg; 
			INT_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_WR <= "1"; 
		end if;
		if addr = x"00040005" then
			REG_Analog_In_Unflipped_CONFIG_ARM_WR <= wreg; 
			INT_Analog_In_Unflipped_CONFIG_ARM_WR <= "1"; 
		end if;
		if addr = x"00040006" then
			REG_Analog_In_Unflipped_CONFIG_DECIMATOR_WR <= wreg; 
			INT_Analog_In_Unflipped_CONFIG_DECIMATOR_WR <= "1"; 
		end if;
		if addr = x"00040007" then
			REG_dummy_WR <= wreg; 
			INT_dummy_WR <= "1"; 
		end if;
		if addr = x"00040008" then
			REG_forcetrig_WR <= wreg; 
			INT_forcetrig_WR <= "1"; 
		end if;
		if addr = x"00040009" then
			REG_full_WR <= wreg; 
			INT_full_WR <= "1"; 
		end if;
		if addr = x"0004000A" then
			REG_trigger_code_WR <= wreg; 
			INT_trigger_code_WR <= "1"; 
		end if;
		if addr = x"0004000B" then
			REG_reset_WR <= wreg; 
			INT_reset_WR <= "1"; 
		end if;
		if addr = x"0004000C" then
			REG_timestamp_WR <= wreg; 
			INT_timestamp_WR <= "1"; 
		end if;
		if addr = x"0004000D" then
			REG_received_WR <= wreg; 
			INT_received_WR <= "1"; 
		end if;
		If addr >= x"0004000F" And addr < x"00040010" Then
			BUS_base_WRITE_DATA <= wreg; 
			BUS_base_W_INT <= "1"; 
		End If;
		if addr = x"00040010" then
			REG_base_CH0_WR <= wreg; 
			INT_base_CH0_WR <= "1"; 
		end if;
		if addr = x"00040011" then
			REG_base_CH1_WR <= wreg; 
			INT_base_CH1_WR <= "1"; 
		end if;
		if addr = x"00040012" then
			REG_base_CH2_WR <= wreg; 
			INT_base_CH2_WR <= "1"; 
		end if;
		if addr = x"00040013" then
			REG_base_CH3_WR <= wreg; 
			INT_base_CH3_WR <= "1"; 
		end if;
		if addr = x"00040014" then
			REG_base_CH4_WR <= wreg; 
			INT_base_CH4_WR <= "1"; 
		end if;
		if addr = x"00040015" then
			REG_base_CH5_WR <= wreg; 
			INT_base_CH5_WR <= "1"; 
		end if;
		if addr = x"00040016" then
			REG_base_CH6_WR <= wreg; 
			INT_base_CH6_WR <= "1"; 
		end if;
		if addr = x"00040017" then
			REG_base_CH7_WR <= wreg; 
			INT_base_CH7_WR <= "1"; 
		end if;
		if addr = x"00040018" then
			REG_base_CH8_WR <= wreg; 
			INT_base_CH8_WR <= "1"; 
		end if;
		if addr = x"00040019" then
			REG_base_CH9_WR <= wreg; 
			INT_base_CH9_WR <= "1"; 
		end if;
		if addr = x"0004001A" then
			REG_base_CH10_WR <= wreg; 
			INT_base_CH10_WR <= "1"; 
		end if;
		if addr = x"0004001B" then
			REG_base_CH11_WR <= wreg; 
			INT_base_CH11_WR <= "1"; 
		end if;
		if addr = x"0004001C" then
			REG_base_CH12_WR <= wreg; 
			INT_base_CH12_WR <= "1"; 
		end if;
		if addr = x"0004001D" then
			REG_base_CH13_WR <= wreg; 
			INT_base_CH13_WR <= "1"; 
		end if;
		if addr = x"0004001E" then
			REG_base_CH14_WR <= wreg; 
			INT_base_CH14_WR <= "1"; 
		end if;
		if addr = x"0004001F" then
			REG_base_CH15_WR <= wreg; 
			INT_base_CH15_WR <= "1"; 
		end if;
		if addr = x"00040020" then
			REG_base_CH16_WR <= wreg; 
			INT_base_CH16_WR <= "1"; 
		end if;
		if addr = x"00040021" then
			REG_base_CH17_WR <= wreg; 
			INT_base_CH17_WR <= "1"; 
		end if;
		if addr = x"00040022" then
			REG_base_CH18_WR <= wreg; 
			INT_base_CH18_WR <= "1"; 
		end if;
		if addr = x"00040023" then
			REG_base_CH19_WR <= wreg; 
			INT_base_CH19_WR <= "1"; 
		end if;
		if addr = x"00040024" then
			REG_base_CH20_WR <= wreg; 
			INT_base_CH20_WR <= "1"; 
		end if;
		if addr = x"00040025" then
			REG_base_CH21_WR <= wreg; 
			INT_base_CH21_WR <= "1"; 
		end if;
		if addr = x"00040026" then
			REG_base_CH22_WR <= wreg; 
			INT_base_CH22_WR <= "1"; 
		end if;
		if addr = x"00040027" then
			REG_base_CH23_WR <= wreg; 
			INT_base_CH23_WR <= "1"; 
		end if;
		If addr >= x"00048000" And addr < x"00050000" Then
			BUS_baselines_WRITE_DATA <= wreg; 
			BUS_baselines_W_INT <= "1"; 
		End If;
		if addr = x"00050002" then
			REG_baselines_CONFIG_TRIGGER_MODE_WR <= wreg; 
			INT_baselines_CONFIG_TRIGGER_MODE_WR <= "1"; 
		end if;
		if addr = x"00050003" then
			REG_baselines_CONFIG_PRETRIGGER_WR <= wreg; 
			INT_baselines_CONFIG_PRETRIGGER_WR <= "1"; 
		end if;
		if addr = x"00050004" then
			REG_baselines_CONFIG_TRIGGER_LEVEL_WR <= wreg; 
			INT_baselines_CONFIG_TRIGGER_LEVEL_WR <= "1"; 
		end if;
		if addr = x"00050005" then
			REG_baselines_CONFIG_ARM_WR <= wreg; 
			INT_baselines_CONFIG_ARM_WR <= "1"; 
		end if;
		if addr = x"00050006" then
			REG_baselines_CONFIG_DECIMATOR_WR <= wreg; 
			INT_baselines_CONFIG_DECIMATOR_WR <= "1"; 
		end if;
		If addr >= x"00050008" And addr < x"00050009" Then
			BUS_int_WRITE_DATA <= wreg; 
			BUS_int_W_INT <= "1"; 
		End If;
		if addr = x"00050009" then
			REG_int_time_WR <= wreg; 
			INT_int_time_WR <= "1"; 
		end if;
		if addr = x"0005000A" then
			REG_int_pre_WR <= wreg; 
			INT_int_pre_WR <= "1"; 
		end if;
		if addr = x"0005000B" then
			REG_int_base_WR <= wreg; 
			INT_int_base_WR <= "1"; 
		end if;
		if addr = x"0005000C" then
			REG_int_scale_WR <= wreg; 
			INT_int_scale_WR <= "1"; 
		end if;
		If addr >= x"0005000E" And addr < x"0005000F" Then
			BUS_All_Energies_WRITE_DATA <= wreg; 
			BUS_All_Energies_W_INT <= "1"; 
		End If;
		if addr = x"00050011" then
			REG_All_Energies_CONFIG_WR <= wreg; 
			INT_All_Energies_CONFIG_WR <= "1"; 
		end if;
		If addr >= x"00050013" And addr < x"00050014" Then
			BUS_trig_WRITE_DATA <= wreg; 
			BUS_trig_W_INT <= "1"; 
		End If;
		if addr = x"00050014" then
			REG_trig_gate_l_WR <= wreg; 
			INT_trig_gate_l_WR <= "1"; 
		end if;
		if addr = x"00050015" then
			REG_trig_gate_u_WR <= wreg; 
			INT_trig_gate_u_WR <= "1"; 
		end if;
		if addr = x"00050016" then
			REG_trig_delay_WR <= wreg; 
			INT_trig_delay_WR <= "1"; 
		end if;
		if addr = x"00050017" then
			REG_trig_mode_WR <= wreg; 
			INT_trig_mode_WR <= "1"; 
		end if;
		If addr >= x"00050019" And addr < x"0005001A" Then
			BUS_io_WRITE_DATA <= wreg; 
			BUS_io_W_INT <= "1"; 
		End If;
		if addr = x"0005001A" then
			REG_io_stamptype_WR <= wreg; 
			INT_io_stamptype_WR <= "1"; 
		end if;
		if addr = x"0005001B" then
			REG_io_lemo2out_WR <= wreg; 
			INT_io_lemo2out_WR <= "1"; 
		end if;
		if addr = x"0005001C" then
			REG_io_divide_WR <= wreg; 
			INT_io_divide_WR <= "1"; 
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
			rreg := REG_top_CH0_RD; 
		End If;
		if addr = x"0003200A" then
			rreg := REG_top_CH1_RD; 
		End If;
		if addr = x"0003200B" then
			rreg := REG_top_CH2_RD; 
		End If;
		if addr = x"0003200C" then
			rreg := REG_top_CH3_RD; 
		End If;
		if addr = x"0003200D" then
			rreg := REG_top_CH4_RD; 
		End If;
		if addr = x"0003200E" then
			rreg := REG_top_CH5_RD; 
		End If;
		if addr = x"0003200F" then
			rreg := REG_top_CH6_RD; 
		End If;
		if addr = x"00032010" then
			rreg := REG_top_CH7_RD; 
		End If;
		if addr = x"00032011" then
			rreg := REG_top_CH8_RD; 
		End If;
		if addr = x"00032012" then
			rreg := REG_top_CH9_RD; 
		End If;
		if addr = x"00032013" then
			rreg := REG_top_CH10_RD; 
		End If;
		if addr = x"00032014" then
			rreg := REG_top_CH11_RD; 
		End If;
		if addr = x"00032015" then
			rreg := REG_top_CH12_RD; 
		End If;
		if addr = x"00032016" then
			rreg := REG_top_CH13_RD; 
		End If;
		if addr = x"00032017" then
			rreg := REG_top_CH14_RD; 
		End If;
		if addr = x"00032018" then
			rreg := REG_top_CH15_RD; 
		End If;
		if addr = x"00032019" then
			rreg := REG_top_CH16_RD; 
		End If;
		if addr = x"0003201A" then
			rreg := REG_top_CH17_RD; 
		End If;
		if addr = x"0003201B" then
			rreg := REG_top_CH18_RD; 
		End If;
		if addr = x"0003201C" then
			rreg := REG_top_CH19_RD; 
		End If;
		if addr = x"0003201D" then
			rreg := REG_top_CH20_RD; 
		End If;
		if addr = x"0003201E" then
			rreg := REG_top_CH21_RD; 
		End If;
		if addr = x"0003201F" then
			rreg := REG_top_CH22_RD; 
		End If;
		if addr = x"00032020" then
			rreg := REG_top_CH23_RD; 
		End If;
		if addr = x"00032023" then
			rreg := REG_disable_det_CH0_RD; 
		End If;
		if addr = x"00032024" then
			rreg := REG_disable_det_CH1_RD; 
		End If;
		if addr = x"00032025" then
			rreg := REG_disable_det_CH2_RD; 
		End If;
		if addr = x"00032026" then
			rreg := REG_disable_det_CH3_RD; 
		End If;
		if addr = x"00032027" then
			rreg := REG_disable_det_CH4_RD; 
		End If;
		if addr = x"00032028" then
			rreg := REG_disable_det_CH5_RD; 
		End If;
		if addr = x"00032029" then
			rreg := REG_disable_det_CH6_RD; 
		End If;
		if addr = x"0003202A" then
			rreg := REG_disable_det_CH7_RD; 
		End If;
		if addr = x"0003202B" then
			rreg := REG_disable_det_CH8_RD; 
		End If;
		if addr = x"0003202C" then
			rreg := REG_disable_det_CH9_RD; 
		End If;
		if addr = x"0003202D" then
			rreg := REG_disable_det_CH10_RD; 
		End If;
		if addr = x"0003202E" then
			rreg := REG_disable_det_CH11_RD; 
		End If;
		if addr = x"0003202F" then
			rreg := REG_disable_det_CH12_RD; 
		End If;
		if addr = x"00032030" then
			rreg := REG_disable_det_CH13_RD; 
		End If;
		if addr = x"00032031" then
			rreg := REG_disable_det_CH14_RD; 
		End If;
		if addr = x"00032032" then
			rreg := REG_disable_det_CH15_RD; 
		End If;
		if addr = x"00032033" then
			rreg := REG_disable_det_CH16_RD; 
		End If;
		if addr = x"00032034" then
			rreg := REG_disable_det_CH17_RD; 
		End If;
		if addr = x"00032035" then
			rreg := REG_disable_det_CH18_RD; 
		End If;
		if addr = x"00032036" then
			rreg := REG_disable_det_CH19_RD; 
		End If;
		if addr = x"00032037" then
			rreg := REG_disable_det_CH20_RD; 
		End If;
		if addr = x"00032038" then
			rreg := REG_disable_det_CH21_RD; 
		End If;
		if addr = x"00032039" then
			rreg := REG_disable_det_CH22_RD; 
		End If;
		if addr = x"0003203A" then
			rreg := REG_disable_det_CH23_RD; 
		End If;
		if addr = x"00040000" then
			rreg := REG_Analog_In_Unflipped_READ_STATUS_RD; 
		End If;
		if addr = x"00040001" then
			rreg := REG_Analog_In_Unflipped_READ_POSITION_RD; 
		End If;
		if addr = x"00040002" then
			rreg := REG_Analog_In_Unflipped_CONFIG_TRIGGER_MODE_RD; 
		End If;
		if addr = x"00040003" then
			rreg := REG_Analog_In_Unflipped_CONFIG_PRETRIGGER_RD; 
		End If;
		if addr = x"00040004" then
			rreg := REG_Analog_In_Unflipped_CONFIG_TRIGGER_LEVEL_RD; 
		End If;
		if addr = x"00040005" then
			rreg := REG_Analog_In_Unflipped_CONFIG_ARM_RD; 
		End If;
		if addr = x"00040006" then
			rreg := REG_Analog_In_Unflipped_CONFIG_DECIMATOR_RD; 
		End If;
		if addr = x"00040007" then
			rreg := REG_dummy_RD; 
		End If;
		if addr = x"00040008" then
			rreg := REG_forcetrig_RD; 
		End If;
		if addr = x"00040009" then
			rreg := REG_full_RD; 
		End If;
		if addr = x"0004000A" then
			rreg := REG_trigger_code_RD; 
		End If;
		if addr = x"0004000B" then
			rreg := REG_reset_RD; 
		End If;
		if addr = x"0004000C" then
			rreg := REG_timestamp_RD; 
		End If;
		if addr = x"0004000D" then
			rreg := REG_received_RD; 
		End If;
		if addr = x"00040010" then
			rreg := REG_base_CH0_RD; 
		End If;
		if addr = x"00040011" then
			rreg := REG_base_CH1_RD; 
		End If;
		if addr = x"00040012" then
			rreg := REG_base_CH2_RD; 
		End If;
		if addr = x"00040013" then
			rreg := REG_base_CH3_RD; 
		End If;
		if addr = x"00040014" then
			rreg := REG_base_CH4_RD; 
		End If;
		if addr = x"00040015" then
			rreg := REG_base_CH5_RD; 
		End If;
		if addr = x"00040016" then
			rreg := REG_base_CH6_RD; 
		End If;
		if addr = x"00040017" then
			rreg := REG_base_CH7_RD; 
		End If;
		if addr = x"00040018" then
			rreg := REG_base_CH8_RD; 
		End If;
		if addr = x"00040019" then
			rreg := REG_base_CH9_RD; 
		End If;
		if addr = x"0004001A" then
			rreg := REG_base_CH10_RD; 
		End If;
		if addr = x"0004001B" then
			rreg := REG_base_CH11_RD; 
		End If;
		if addr = x"0004001C" then
			rreg := REG_base_CH12_RD; 
		End If;
		if addr = x"0004001D" then
			rreg := REG_base_CH13_RD; 
		End If;
		if addr = x"0004001E" then
			rreg := REG_base_CH14_RD; 
		End If;
		if addr = x"0004001F" then
			rreg := REG_base_CH15_RD; 
		End If;
		if addr = x"00040020" then
			rreg := REG_base_CH16_RD; 
		End If;
		if addr = x"00040021" then
			rreg := REG_base_CH17_RD; 
		End If;
		if addr = x"00040022" then
			rreg := REG_base_CH18_RD; 
		End If;
		if addr = x"00040023" then
			rreg := REG_base_CH19_RD; 
		End If;
		if addr = x"00040024" then
			rreg := REG_base_CH20_RD; 
		End If;
		if addr = x"00040025" then
			rreg := REG_base_CH21_RD; 
		End If;
		if addr = x"00040026" then
			rreg := REG_base_CH22_RD; 
		End If;
		if addr = x"00040027" then
			rreg := REG_base_CH23_RD; 
		End If;
		if addr = x"00050000" then
			rreg := REG_baselines_READ_STATUS_RD; 
		End If;
		if addr = x"00050001" then
			rreg := REG_baselines_READ_POSITION_RD; 
		End If;
		if addr = x"00050002" then
			rreg := REG_baselines_CONFIG_TRIGGER_MODE_RD; 
		End If;
		if addr = x"00050003" then
			rreg := REG_baselines_CONFIG_PRETRIGGER_RD; 
		End If;
		if addr = x"00050004" then
			rreg := REG_baselines_CONFIG_TRIGGER_LEVEL_RD; 
		End If;
		if addr = x"00050005" then
			rreg := REG_baselines_CONFIG_ARM_RD; 
		End If;
		if addr = x"00050006" then
			rreg := REG_baselines_CONFIG_DECIMATOR_RD; 
		End If;
		if addr = x"00050009" then
			rreg := REG_int_time_RD; 
		End If;
		if addr = x"0005000A" then
			rreg := REG_int_pre_RD; 
		End If;
		if addr = x"0005000B" then
			rreg := REG_int_base_RD; 
		End If;
		if addr = x"0005000C" then
			rreg := REG_int_scale_RD; 
		End If;
		if addr = x"0005000F" then
			rreg := REG_All_Energies_READ_STATUS_RD; 
		End If;
		if addr = x"00050010" then
			rreg := REG_All_Energies_READ_VALID_WORDS_RD; 
		End If;
		if addr = x"00050011" then
			rreg := REG_All_Energies_CONFIG_RD; 
		End If;
		if addr = x"00050014" then
			rreg := REG_trig_gate_l_RD; 
		End If;
		if addr = x"00050015" then
			rreg := REG_trig_gate_u_RD; 
		End If;
		if addr = x"00050016" then
			rreg := REG_trig_delay_RD; 
		End If;
		if addr = x"00050017" then
			rreg := REG_trig_mode_RD; 
		End If;
		if addr = x"0005001A" then
			rreg := REG_io_stamptype_RD; 
		End If;
		if addr = x"0005001B" then
			rreg := REG_io_lemo2out_RD; 
		End If;
		if addr = x"0005001C" then
			rreg := REG_io_divide_RD; 
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
