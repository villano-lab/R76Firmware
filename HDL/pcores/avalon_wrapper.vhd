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
    
BUS_Spectrum_0_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00000000" And addr < x"00010000") else '0';
BUS_Spectrum_0_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00000000" And addr < x"00010000") else (others => '0');BUS_Spectrum_12_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00020000" And addr < x"00030000") else '0';
BUS_Spectrum_12_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00020000" And addr < x"00030000") else (others => '0');BUS_Spectrum_1_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00040000" And addr < x"00050000") else '0';
BUS_Spectrum_1_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00040000" And addr < x"00050000") else (others => '0');BUS_Spectrum_13_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00060000" And addr < x"00070000") else '0';
BUS_Spectrum_13_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00060000" And addr < x"00070000") else (others => '0');BUS_Spectrum_2_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00080000" And addr < x"00090000") else '0';
BUS_Spectrum_2_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00080000" And addr < x"00090000") else (others => '0');BUS_Spectrum_14_R_INT(0) <= f_BUS_INT_RD when (addr >= x"000A0000" And addr < x"000B0000") else '0';
BUS_Spectrum_14_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"000A0000" And addr < x"000B0000") else (others => '0');BUS_Spectrum_3_R_INT(0) <= f_BUS_INT_RD when (addr >= x"000C0000" And addr < x"000D0000") else '0';
BUS_Spectrum_3_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"000C0000" And addr < x"000D0000") else (others => '0');BUS_Spectrum_15_R_INT(0) <= f_BUS_INT_RD when (addr >= x"000E0000" And addr < x"000F0000") else '0';
BUS_Spectrum_15_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"000E0000" And addr < x"000F0000") else (others => '0');BUS_Spectrum_4_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00100000" And addr < x"00110000") else '0';
BUS_Spectrum_4_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00100000" And addr < x"00110000") else (others => '0');BUS_Spectrum_16_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00120000" And addr < x"00130000") else '0';
BUS_Spectrum_16_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00120000" And addr < x"00130000") else (others => '0');BUS_Spectrum_5_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00140000" And addr < x"00150000") else '0';
BUS_Spectrum_5_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00140000" And addr < x"00150000") else (others => '0');BUS_Spectrum_17_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00160000" And addr < x"00170000") else '0';
BUS_Spectrum_17_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00160000" And addr < x"00170000") else (others => '0');BUS_Spectrum_6_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00180000" And addr < x"00190000") else '0';
BUS_Spectrum_6_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00180000" And addr < x"00190000") else (others => '0');BUS_Spectrum_18_R_INT(0) <= f_BUS_INT_RD when (addr >= x"001A0000" And addr < x"001B0000") else '0';
BUS_Spectrum_18_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"001A0000" And addr < x"001B0000") else (others => '0');BUS_Spectrum_7_R_INT(0) <= f_BUS_INT_RD when (addr >= x"001C0000" And addr < x"001D0000") else '0';
BUS_Spectrum_7_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"001C0000" And addr < x"001D0000") else (others => '0');BUS_Spectrum_19_R_INT(0) <= f_BUS_INT_RD when (addr >= x"001E0000" And addr < x"001F0000") else '0';
BUS_Spectrum_19_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"001E0000" And addr < x"001F0000") else (others => '0');BUS_Spectrum_8_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00200000" And addr < x"00210000") else '0';
BUS_Spectrum_8_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00200000" And addr < x"00210000") else (others => '0');BUS_Spectrum_20_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00220000" And addr < x"00230000") else '0';
BUS_Spectrum_20_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00220000" And addr < x"00230000") else (others => '0');BUS_Spectrum_9_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00240000" And addr < x"00250000") else '0';
BUS_Spectrum_9_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00240000" And addr < x"00250000") else (others => '0');BUS_Spectrum_21_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00260000" And addr < x"00270000") else '0';
BUS_Spectrum_21_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00260000" And addr < x"00270000") else (others => '0');BUS_Spectrum_10_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00280000" And addr < x"00290000") else '0';
BUS_Spectrum_10_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00280000" And addr < x"00290000") else (others => '0');BUS_Spectrum_22_R_INT(0) <= f_BUS_INT_RD when (addr >= x"002A0000" And addr < x"002B0000") else '0';
BUS_Spectrum_22_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"002A0000" And addr < x"002B0000") else (others => '0');BUS_Spectrum_11_R_INT(0) <= f_BUS_INT_RD when (addr >= x"002C0000" And addr < x"002D0000") else '0';
BUS_Spectrum_11_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"002C0000" And addr < x"002D0000") else (others => '0');BUS_Spectrum_23_R_INT(0) <= f_BUS_INT_RD when (addr >= x"002E0000" And addr < x"002F0000") else '0';
BUS_Spectrum_23_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"002E0000" And addr < x"002F0000") else (others => '0');BUS_All_Energies_R_INT(0) <= f_BUS_INT_RD when (addr >= x"002F0039" And addr < x"002F003A") else '0';BUS_RateMeter_0_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00300000" And addr < x"00310000") else '0';
BUS_RateMeter_0_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00300000" And addr < x"00310000") else (others => '0');BUS_RateMeter_NoSkip_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00340000" And addr < x"00350000") else '0';
BUS_RateMeter_NoSkip_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00340000" And addr < x"00350000") else (others => '0');BUS_Syncs_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00311000" And addr < x"00312000") else '0';
BUS_Syncs_READ_ADDRESS <= BUS_ADDR(11 downto 0) when (addr >= x"00311000" And addr < x"00312000") else (others => '0');BUS_SyncIn1Meter_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00320000" And addr < x"00330000") else '0';
BUS_SyncIn1Meter_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00320000" And addr < x"00330000") else (others => '0');BUS_SyncIn2Meter_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00690000" And addr < x"006A0000") else '0';
BUS_SyncIn2Meter_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00690000" And addr < x"006A0000") else (others => '0');BUS_SyncIn0Meter_R_INT(0) <= f_BUS_INT_RD when (addr >= x"006B0000" And addr < x"006C0000") else '0';
BUS_SyncIn0Meter_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"006B0000" And addr < x"006C0000") else (others => '0');BUS_Oscilloscope_0_R_INT(0) <= f_BUS_INT_RD when (addr >= x"006C8000" And addr < x"006D0000") else '0';
BUS_Oscilloscope_0_READ_ADDRESS <= BUS_ADDR(14 downto 0) when (addr >= x"006C8000" And addr < x"006D0000") else (others => '0');
f_BUS_DATA_RD <= BUS_Test_0_READ_DATA when  (addr >= x"03FE0000" And addr < x"03FEFFFF") else 
BUS_Spectrum_0_READ_DATA  when  addr >= x"00000000" and addr < x"00010000" else 
BUS_Spectrum_12_READ_DATA  when  addr >= x"00020000" and addr < x"00030000" else 
BUS_Spectrum_1_READ_DATA  when  addr >= x"00040000" and addr < x"00050000" else 
BUS_Spectrum_13_READ_DATA  when  addr >= x"00060000" and addr < x"00070000" else 
BUS_Spectrum_2_READ_DATA  when  addr >= x"00080000" and addr < x"00090000" else 
BUS_Spectrum_14_READ_DATA  when  addr >= x"000A0000" and addr < x"000B0000" else 
BUS_Spectrum_3_READ_DATA  when  addr >= x"000C0000" and addr < x"000D0000" else 
BUS_Spectrum_15_READ_DATA  when  addr >= x"000E0000" and addr < x"000F0000" else 
BUS_Spectrum_4_READ_DATA  when  addr >= x"00100000" and addr < x"00110000" else 
BUS_Spectrum_16_READ_DATA  when  addr >= x"00120000" and addr < x"00130000" else 
BUS_Spectrum_5_READ_DATA  when  addr >= x"00140000" and addr < x"00150000" else 
BUS_Spectrum_17_READ_DATA  when  addr >= x"00160000" and addr < x"00170000" else 
BUS_Spectrum_6_READ_DATA  when  addr >= x"00180000" and addr < x"00190000" else 
BUS_Spectrum_18_READ_DATA  when  addr >= x"001A0000" and addr < x"001B0000" else 
BUS_Spectrum_7_READ_DATA  when  addr >= x"001C0000" and addr < x"001D0000" else 
BUS_Spectrum_19_READ_DATA  when  addr >= x"001E0000" and addr < x"001F0000" else 
BUS_Spectrum_8_READ_DATA  when  addr >= x"00200000" and addr < x"00210000" else 
BUS_Spectrum_20_READ_DATA  when  addr >= x"00220000" and addr < x"00230000" else 
BUS_Spectrum_9_READ_DATA  when  addr >= x"00240000" and addr < x"00250000" else 
BUS_Spectrum_21_READ_DATA  when  addr >= x"00260000" and addr < x"00270000" else 
BUS_Spectrum_10_READ_DATA  when  addr >= x"00280000" and addr < x"00290000" else 
BUS_Spectrum_22_READ_DATA  when  addr >= x"002A0000" and addr < x"002B0000" else 
BUS_Spectrum_11_READ_DATA  when  addr >= x"002C0000" and addr < x"002D0000" else 
BUS_Spectrum_23_READ_DATA  when  addr >= x"002E0000" and addr < x"002F0000" else 
 BUS_All_Energies_READ_DATA when (addr >= x"002F0039" And addr < x"002F003A") else BUS_RateMeter_0_READ_DATA  when  addr >= x"00300000" and addr < x"00310000" else 
BUS_RateMeter_NoSkip_READ_DATA  when  addr >= x"00340000" and addr < x"00350000" else 
BUS_Syncs_READ_DATA  when  addr >= x"00311000" and addr < x"00312000" else 
BUS_SyncIn1Meter_READ_DATA  when  addr >= x"00320000" and addr < x"00330000" else 
BUS_SyncIn2Meter_READ_DATA  when  addr >= x"00690000" and addr < x"006A0000" else 
BUS_SyncIn0Meter_READ_DATA  when  addr >= x"006B0000" and addr < x"006C0000" else 
BUS_Oscilloscope_0_READ_DATA  when  addr >= x"006C8000" and addr < x"006D0000" else 
 f_BUS_DATA_RD_REG;
 f_BUS_DATASTROBE <=BUS_Test_0_VLD(0) when  (addr >= x"03FE0000" And addr < x"03FEFFFF") else 
 BUS_Spectrum_0_VLD(0) when  addr >= x"00000000" and addr < x"00010000" else 
 BUS_Spectrum_12_VLD(0) when  addr >= x"00020000" and addr < x"00030000" else 
 BUS_Spectrum_1_VLD(0) when  addr >= x"00040000" and addr < x"00050000" else 
 BUS_Spectrum_13_VLD(0) when  addr >= x"00060000" and addr < x"00070000" else 
 BUS_Spectrum_2_VLD(0) when  addr >= x"00080000" and addr < x"00090000" else 
 BUS_Spectrum_14_VLD(0) when  addr >= x"000A0000" and addr < x"000B0000" else 
 BUS_Spectrum_3_VLD(0) when  addr >= x"000C0000" and addr < x"000D0000" else 
 BUS_Spectrum_15_VLD(0) when  addr >= x"000E0000" and addr < x"000F0000" else 
 BUS_Spectrum_4_VLD(0) when  addr >= x"00100000" and addr < x"00110000" else 
 BUS_Spectrum_16_VLD(0) when  addr >= x"00120000" and addr < x"00130000" else 
 BUS_Spectrum_5_VLD(0) when  addr >= x"00140000" and addr < x"00150000" else 
 BUS_Spectrum_17_VLD(0) when  addr >= x"00160000" and addr < x"00170000" else 
 BUS_Spectrum_6_VLD(0) when  addr >= x"00180000" and addr < x"00190000" else 
 BUS_Spectrum_18_VLD(0) when  addr >= x"001A0000" and addr < x"001B0000" else 
 BUS_Spectrum_7_VLD(0) when  addr >= x"001C0000" and addr < x"001D0000" else 
 BUS_Spectrum_19_VLD(0) when  addr >= x"001E0000" and addr < x"001F0000" else 
 BUS_Spectrum_8_VLD(0) when  addr >= x"00200000" and addr < x"00210000" else 
 BUS_Spectrum_20_VLD(0) when  addr >= x"00220000" and addr < x"00230000" else 
 BUS_Spectrum_9_VLD(0) when  addr >= x"00240000" and addr < x"00250000" else 
 BUS_Spectrum_21_VLD(0) when  addr >= x"00260000" and addr < x"00270000" else 
 BUS_Spectrum_10_VLD(0) when  addr >= x"00280000" and addr < x"00290000" else 
 BUS_Spectrum_22_VLD(0) when  addr >= x"002A0000" and addr < x"002B0000" else 
 BUS_Spectrum_11_VLD(0) when  addr >= x"002C0000" and addr < x"002D0000" else 
 BUS_Spectrum_23_VLD(0) when  addr >= x"002E0000" and addr < x"002F0000" else 
  BUS_All_Energies_VLD(0) when (addr >= x"002F0039" And addr < x"002F003A") else  BUS_RateMeter_0_VLD(0) when  addr >= x"00300000" and addr < x"00310000" else 
 BUS_RateMeter_NoSkip_VLD(0) when  addr >= x"00340000" and addr < x"00350000" else 
 BUS_Syncs_VLD(0) when  addr >= x"00311000" and addr < x"00312000" else 
 BUS_SyncIn1Meter_VLD(0) when  addr >= x"00320000" and addr < x"00330000" else 
 BUS_SyncIn2Meter_VLD(0) when  addr >= x"00690000" and addr < x"006A0000" else 
 BUS_SyncIn0Meter_VLD(0) when  addr >= x"006B0000" and addr < x"006C0000" else 
 BUS_Oscilloscope_0_VLD(0) when  addr >= x"006C8000" and addr < x"006D0000" else 
 f_BUS_DATASTROBE_REG;    

        
    addr <= BUS_ADDR;
    wreg <= f_BUS_DATA_WR;
        
        register_manager : process(clk)
            variable rreg    :  STD_LOGIC_VECTOR(31 downto 0);
        begin
            if reset='1' then
--                	BUS_Spectrum_0_W_INT <= "0";
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
	BUS_thrsh_W_INT <= "0";
		REG_thrsh_0_WR <= (others => '0');
		INT_thrsh_0_WR <= "0";
		REG_thrsh_1_WR <= (others => '0');
		INT_thrsh_1_WR <= "0";
		REG_thrsh_2_WR <= (others => '0');
		INT_thrsh_2_WR <= "0";
		REG_thrsh_3_WR <= (others => '0');
		INT_thrsh_3_WR <= "0";
		REG_thrsh_4_WR <= (others => '0');
		INT_thrsh_4_WR <= "0";
		REG_thrsh_5_WR <= (others => '0');
		INT_thrsh_5_WR <= "0";
		REG_thrsh_6_WR <= (others => '0');
		INT_thrsh_6_WR <= "0";
		REG_thrsh_7_WR <= (others => '0');
		INT_thrsh_7_WR <= "0";
		REG_thrsh_8_WR <= (others => '0');
		INT_thrsh_8_WR <= "0";
		REG_thrsh_9_WR <= (others => '0');
		INT_thrsh_9_WR <= "0";
		REG_thrsh_10_WR <= (others => '0');
		INT_thrsh_10_WR <= "0";
		REG_thrsh_11_WR <= (others => '0');
		INT_thrsh_11_WR <= "0";
		REG_thrsh_12_WR <= (others => '0');
		INT_thrsh_12_WR <= "0";
		REG_thrsh_13_WR <= (others => '0');
		INT_thrsh_13_WR <= "0";
		REG_thrsh_14_WR <= (others => '0');
		INT_thrsh_14_WR <= "0";
		REG_thrsh_15_WR <= (others => '0');
		INT_thrsh_15_WR <= "0";
		REG_thrsh_16_WR <= (others => '0');
		INT_thrsh_16_WR <= "0";
		REG_thrsh_17_WR <= (others => '0');
		INT_thrsh_17_WR <= "0";
		REG_thrsh_18_WR <= (others => '0');
		INT_thrsh_18_WR <= "0";
		REG_thrsh_19_WR <= (others => '0');
		INT_thrsh_19_WR <= "0";
		REG_thrsh_20_WR <= (others => '0');
		INT_thrsh_20_WR <= "0";
		REG_thrsh_21_WR <= (others => '0');
		INT_thrsh_21_WR <= "0";
		REG_thrsh_22_WR <= (others => '0');
		INT_thrsh_22_WR <= "0";
		REG_thrsh_23_WR <= (others => '0');
		INT_thrsh_23_WR <= "0";
		REG_thrsh_24_WR <= (others => '0');
		INT_thrsh_24_WR <= "0";
		REG_thrsh_25_WR <= (others => '0');
		INT_thrsh_25_WR <= "0";
		REG_thrsh_26_WR <= (others => '0');
		INT_thrsh_26_WR <= "0";
		REG_thrsh_27_WR <= (others => '0');
		INT_thrsh_27_WR <= "0";
		REG_thrsh_28_WR <= (others => '0');
		INT_thrsh_28_WR <= "0";
		REG_thrsh_29_WR <= (others => '0');
		INT_thrsh_29_WR <= "0";
		REG_thrsh_30_WR <= (others => '0');
		INT_thrsh_30_WR <= "0";
		REG_thrsh_31_WR <= (others => '0');
		INT_thrsh_31_WR <= "0";
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
	BUS_top_W_INT <= "0";
		REG_top_0_WR <= (others => '0');
		INT_top_0_WR <= "0";
		REG_top_1_WR <= (others => '0');
		INT_top_1_WR <= "0";
		REG_top_2_WR <= (others => '0');
		INT_top_2_WR <= "0";
		REG_top_3_WR <= (others => '0');
		INT_top_3_WR <= "0";
		REG_top_4_WR <= (others => '0');
		INT_top_4_WR <= "0";
		REG_top_5_WR <= (others => '0');
		INT_top_5_WR <= "0";
		REG_top_6_WR <= (others => '0');
		INT_top_6_WR <= "0";
		REG_top_7_WR <= (others => '0');
		INT_top_7_WR <= "0";
		REG_top_8_WR <= (others => '0');
		INT_top_8_WR <= "0";
		REG_top_9_WR <= (others => '0');
		INT_top_9_WR <= "0";
		REG_top_10_WR <= (others => '0');
		INT_top_10_WR <= "0";
		REG_top_11_WR <= (others => '0');
		INT_top_11_WR <= "0";
		REG_top_12_WR <= (others => '0');
		INT_top_12_WR <= "0";
		REG_top_13_WR <= (others => '0');
		INT_top_13_WR <= "0";
		REG_top_14_WR <= (others => '0');
		INT_top_14_WR <= "0";
		REG_top_15_WR <= (others => '0');
		INT_top_15_WR <= "0";
		REG_top_16_WR <= (others => '0');
		INT_top_16_WR <= "0";
		REG_top_17_WR <= (others => '0');
		INT_top_17_WR <= "0";
		REG_top_18_WR <= (others => '0');
		INT_top_18_WR <= "0";
		REG_top_19_WR <= (others => '0');
		INT_top_19_WR <= "0";
		REG_top_20_WR <= (others => '0');
		INT_top_20_WR <= "0";
		REG_top_21_WR <= (others => '0');
		INT_top_21_WR <= "0";
		REG_top_22_WR <= (others => '0');
		INT_top_22_WR <= "0";
		REG_top_23_WR <= (others => '0');
		INT_top_23_WR <= "0";
		REG_top_24_WR <= (others => '0');
		INT_top_24_WR <= "0";
		REG_top_25_WR <= (others => '0');
		INT_top_25_WR <= "0";
		REG_top_26_WR <= (others => '0');
		INT_top_26_WR <= "0";
		REG_top_27_WR <= (others => '0');
		INT_top_27_WR <= "0";
		REG_top_28_WR <= (others => '0');
		INT_top_28_WR <= "0";
		REG_top_29_WR <= (others => '0');
		INT_top_29_WR <= "0";
		REG_top_30_WR <= (others => '0');
		INT_top_30_WR <= "0";
		REG_top_31_WR <= (others => '0');
		INT_top_31_WR <= "0";
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
	BUS_disable_det_W_INT <= "0";
		REG_disable_det_0_WR <= (others => '0');
		INT_disable_det_0_WR <= "0";
		REG_disable_det_1_WR <= (others => '0');
		INT_disable_det_1_WR <= "0";
		REG_disable_det_2_WR <= (others => '0');
		INT_disable_det_2_WR <= "0";
		REG_disable_det_3_WR <= (others => '0');
		INT_disable_det_3_WR <= "0";
		REG_disable_det_4_WR <= (others => '0');
		INT_disable_det_4_WR <= "0";
		REG_disable_det_5_WR <= (others => '0');
		INT_disable_det_5_WR <= "0";
		REG_disable_det_6_WR <= (others => '0');
		INT_disable_det_6_WR <= "0";
		REG_disable_det_7_WR <= (others => '0');
		INT_disable_det_7_WR <= "0";
		REG_disable_det_8_WR <= (others => '0');
		INT_disable_det_8_WR <= "0";
		REG_disable_det_9_WR <= (others => '0');
		INT_disable_det_9_WR <= "0";
		REG_disable_det_10_WR <= (others => '0');
		INT_disable_det_10_WR <= "0";
		REG_disable_det_11_WR <= (others => '0');
		INT_disable_det_11_WR <= "0";
		REG_disable_det_12_WR <= (others => '0');
		INT_disable_det_12_WR <= "0";
		REG_disable_det_13_WR <= (others => '0');
		INT_disable_det_13_WR <= "0";
		REG_disable_det_14_WR <= (others => '0');
		INT_disable_det_14_WR <= "0";
		REG_disable_det_15_WR <= (others => '0');
		INT_disable_det_15_WR <= "0";
		REG_disable_det_16_WR <= (others => '0');
		INT_disable_det_16_WR <= "0";
		REG_disable_det_17_WR <= (others => '0');
		INT_disable_det_17_WR <= "0";
		REG_disable_det_18_WR <= (others => '0');
		INT_disable_det_18_WR <= "0";
		REG_disable_det_19_WR <= (others => '0');
		INT_disable_det_19_WR <= "0";
		REG_disable_det_20_WR <= (others => '0');
		INT_disable_det_20_WR <= "0";
		REG_disable_det_21_WR <= (others => '0');
		INT_disable_det_21_WR <= "0";
		REG_disable_det_22_WR <= (others => '0');
		INT_disable_det_22_WR <= "0";
		REG_disable_det_23_WR <= (others => '0');
		INT_disable_det_23_WR <= "0";
		REG_disable_det_24_WR <= (others => '0');
		INT_disable_det_24_WR <= "0";
		REG_disable_det_25_WR <= (others => '0');
		INT_disable_det_25_WR <= "0";
		REG_disable_det_26_WR <= (others => '0');
		INT_disable_det_26_WR <= "0";
		REG_disable_det_27_WR <= (others => '0');
		INT_disable_det_27_WR <= "0";
		REG_disable_det_28_WR <= (others => '0');
		INT_disable_det_28_WR <= "0";
		REG_disable_det_29_WR <= (others => '0');
		INT_disable_det_29_WR <= "0";
		REG_disable_det_30_WR <= (others => '0');
		INT_disable_det_30_WR <= "0";
		REG_disable_det_31_WR <= (others => '0');
		INT_disable_det_31_WR <= "0";
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
	BUS_base_W_INT <= "0";
		REG_base_0_WR <= (others => '0');
		INT_base_0_WR <= "0";
		REG_base_1_WR <= (others => '0');
		INT_base_1_WR <= "0";
		REG_base_2_WR <= (others => '0');
		INT_base_2_WR <= "0";
		REG_base_3_WR <= (others => '0');
		INT_base_3_WR <= "0";
		REG_base_4_WR <= (others => '0');
		INT_base_4_WR <= "0";
		REG_base_5_WR <= (others => '0');
		INT_base_5_WR <= "0";
		REG_base_6_WR <= (others => '0');
		INT_base_6_WR <= "0";
		REG_base_7_WR <= (others => '0');
		INT_base_7_WR <= "0";
		REG_base_8_WR <= (others => '0');
		INT_base_8_WR <= "0";
		REG_base_9_WR <= (others => '0');
		INT_base_9_WR <= "0";
		REG_base_10_WR <= (others => '0');
		INT_base_10_WR <= "0";
		REG_base_11_WR <= (others => '0');
		INT_base_11_WR <= "0";
		REG_base_12_WR <= (others => '0');
		INT_base_12_WR <= "0";
		REG_base_13_WR <= (others => '0');
		INT_base_13_WR <= "0";
		REG_base_14_WR <= (others => '0');
		INT_base_14_WR <= "0";
		REG_base_15_WR <= (others => '0');
		INT_base_15_WR <= "0";
		REG_base_16_WR <= (others => '0');
		INT_base_16_WR <= "0";
		REG_base_17_WR <= (others => '0');
		INT_base_17_WR <= "0";
		REG_base_18_WR <= (others => '0');
		INT_base_18_WR <= "0";
		REG_base_19_WR <= (others => '0');
		INT_base_19_WR <= "0";
		REG_base_20_WR <= (others => '0');
		INT_base_20_WR <= "0";
		REG_base_21_WR <= (others => '0');
		INT_base_21_WR <= "0";
		REG_base_22_WR <= (others => '0');
		INT_base_22_WR <= "0";
		REG_base_23_WR <= (others => '0');
		INT_base_23_WR <= "0";
		REG_base_24_WR <= (others => '0');
		INT_base_24_WR <= "0";
		REG_base_25_WR <= (others => '0');
		INT_base_25_WR <= "0";
		REG_base_26_WR <= (others => '0');
		INT_base_26_WR <= "0";
		REG_base_27_WR <= (others => '0');
		INT_base_27_WR <= "0";
		REG_base_28_WR <= (others => '0');
		INT_base_28_WR <= "0";
		REG_base_29_WR <= (others => '0');
		INT_base_29_WR <= "0";
		REG_base_30_WR <= (others => '0');
		INT_base_30_WR <= "0";
		REG_base_31_WR <= (others => '0');
		INT_base_31_WR <= "0";
		REG_int_time_WR <= (others => '0');
		INT_int_time_WR <= "0";
		INT_int_time_RD <= "0";
		REG_pre_int_WR <= (others => '0');
		INT_pre_int_WR <= "0";
		INT_pre_int_RD <= "0";
		REG_baseline_WR <= (others => '0');
		INT_baseline_WR <= "0";
		INT_baseline_RD <= "0";
		REG_write_WR <= (others => '0');
		INT_write_WR <= "0";
		INT_write_RD <= "0";
		REG_read_WR <= (others => '0');
		INT_read_WR <= "0";
		INT_read_RD <= "0";
		REG_stopwrite_WR <= (others => '0');
		INT_stopwrite_WR <= "0";
		INT_stopwrite_RD <= "0";
		REG_gate_l_WR <= (others => '0');
		INT_gate_l_WR <= "0";
		INT_gate_l_RD <= "0";
		REG_gate_u_WR <= (others => '0');
		INT_gate_u_WR <= "0";
		INT_gate_u_RD <= "0";
		REG_inhib_WR <= (others => '0');
		INT_inhib_WR <= "0";
		INT_inhib_RD <= "0";
		REG_delay_WR <= (others => '0');
		INT_delay_WR <= "0";
		INT_delay_RD <= "0";
		REG_polarity_WR <= (others => '0');
		INT_polarity_WR <= "0";
		INT_polarity_RD <= "0";
		REG_skip_WR <= (others => '0');
		INT_skip_WR <= "0";
		INT_skip_RD <= "0";
		REG_full_WR <= (others => '0');
		INT_full_WR <= "0";
		INT_full_RD <= "0";
		REG_timestamp_WR <= (others => '0');
		INT_timestamp_WR <= "0";
		INT_timestamp_RD <= "0";
		REG_trigger_code_WR <= (others => '0');
		INT_trigger_code_WR <= "0";
		INT_trigger_code_RD <= "0";
		REG_reset_WR <= (others => '0');
		INT_reset_WR <= "0";
		INT_reset_RD <= "0";
	BUS_All_Energies_W_INT <= "0";
		INT_All_Energies_READ_STATUS_RD <= "0";
		INT_All_Energies_READ_VALID_WORDS_RD <= "0";
		REG_All_Energies_CONFIG_WR <= (others => '0');
		INT_All_Energies_CONFIG_WR <= "0";
	BUS_RateMeter_0_W_INT <= "0";
	BUS_RateMeter_NoSkip_W_INT <= "0";
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
	BUS_SyncIn1Meter_W_INT <= "0";
	BUS_SyncIn2Meter_W_INT <= "0";
	BUS_SyncIn0Meter_W_INT <= "0";
		REG_sync0_between_sync2_WR <= (others => '0');
		INT_sync0_between_sync2_WR <= "0";
		INT_sync0_between_sync2_RD <= "0";
	BUS_Oscilloscope_0_W_INT <= "0";
		INT_Oscilloscope_0_READ_STATUS_RD <= "0";
		INT_Oscilloscope_0_READ_POSITION_RD <= "0";
		REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR <= (others => '0');
		INT_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR <= "0";
		REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR <= (others => '0');
		INT_Oscilloscope_0_CONFIG_PRETRIGGER_WR <= "0";
		REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR <= (others => '0');
		INT_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR <= "0";
		REG_Oscilloscope_0_CONFIG_ARM_WR <= (others => '0');
		INT_Oscilloscope_0_CONFIG_ARM_WR <= "0";
		REG_Oscilloscope_0_CONFIG_DECIMATOR_WR <= (others => '0');
		INT_Oscilloscope_0_CONFIG_DECIMATOR_WR <= "0";
            
                f_BUS_DATASTROBE_REG <= '0';
                M_AVALON_0_readdatavalid <= '0';
            elsif rising_edge(clk) then
            
            M_AVALON_0_readdatavalid <= '0';
    	BUS_Spectrum_0_W_INT <= "0";
		INT_Spectrum_0_STATUS_RD <= "0";
		INT_Spectrum_0_CONFIG_WR <= "0";
		INT_Spectrum_0_CONFIG_LIMIT_WR <= "0";
		INT_Spectrum_0_CONFIG_REBIN_WR <= "0";
		INT_Spectrum_0_CONFIG_MIN_WR <= "0";
		INT_Spectrum_0_CONFIG_MAX_WR <= "0";
	BUS_thrsh_W_INT <= "0";
		INT_thrsh_0_WR <= "0";
		INT_thrsh_1_WR <= "0";
		INT_thrsh_2_WR <= "0";
		INT_thrsh_3_WR <= "0";
		INT_thrsh_4_WR <= "0";
		INT_thrsh_5_WR <= "0";
		INT_thrsh_6_WR <= "0";
		INT_thrsh_7_WR <= "0";
		INT_thrsh_8_WR <= "0";
		INT_thrsh_9_WR <= "0";
		INT_thrsh_10_WR <= "0";
		INT_thrsh_11_WR <= "0";
		INT_thrsh_12_WR <= "0";
		INT_thrsh_13_WR <= "0";
		INT_thrsh_14_WR <= "0";
		INT_thrsh_15_WR <= "0";
		INT_thrsh_16_WR <= "0";
		INT_thrsh_17_WR <= "0";
		INT_thrsh_18_WR <= "0";
		INT_thrsh_19_WR <= "0";
		INT_thrsh_20_WR <= "0";
		INT_thrsh_21_WR <= "0";
		INT_thrsh_22_WR <= "0";
		INT_thrsh_23_WR <= "0";
		INT_thrsh_24_WR <= "0";
		INT_thrsh_25_WR <= "0";
		INT_thrsh_26_WR <= "0";
		INT_thrsh_27_WR <= "0";
		INT_thrsh_28_WR <= "0";
		INT_thrsh_29_WR <= "0";
		INT_thrsh_30_WR <= "0";
		INT_thrsh_31_WR <= "0";
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
	BUS_top_W_INT <= "0";
		INT_top_0_WR <= "0";
		INT_top_1_WR <= "0";
		INT_top_2_WR <= "0";
		INT_top_3_WR <= "0";
		INT_top_4_WR <= "0";
		INT_top_5_WR <= "0";
		INT_top_6_WR <= "0";
		INT_top_7_WR <= "0";
		INT_top_8_WR <= "0";
		INT_top_9_WR <= "0";
		INT_top_10_WR <= "0";
		INT_top_11_WR <= "0";
		INT_top_12_WR <= "0";
		INT_top_13_WR <= "0";
		INT_top_14_WR <= "0";
		INT_top_15_WR <= "0";
		INT_top_16_WR <= "0";
		INT_top_17_WR <= "0";
		INT_top_18_WR <= "0";
		INT_top_19_WR <= "0";
		INT_top_20_WR <= "0";
		INT_top_21_WR <= "0";
		INT_top_22_WR <= "0";
		INT_top_23_WR <= "0";
		INT_top_24_WR <= "0";
		INT_top_25_WR <= "0";
		INT_top_26_WR <= "0";
		INT_top_27_WR <= "0";
		INT_top_28_WR <= "0";
		INT_top_29_WR <= "0";
		INT_top_30_WR <= "0";
		INT_top_31_WR <= "0";
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
	BUS_disable_det_W_INT <= "0";
		INT_disable_det_0_WR <= "0";
		INT_disable_det_1_WR <= "0";
		INT_disable_det_2_WR <= "0";
		INT_disable_det_3_WR <= "0";
		INT_disable_det_4_WR <= "0";
		INT_disable_det_5_WR <= "0";
		INT_disable_det_6_WR <= "0";
		INT_disable_det_7_WR <= "0";
		INT_disable_det_8_WR <= "0";
		INT_disable_det_9_WR <= "0";
		INT_disable_det_10_WR <= "0";
		INT_disable_det_11_WR <= "0";
		INT_disable_det_12_WR <= "0";
		INT_disable_det_13_WR <= "0";
		INT_disable_det_14_WR <= "0";
		INT_disable_det_15_WR <= "0";
		INT_disable_det_16_WR <= "0";
		INT_disable_det_17_WR <= "0";
		INT_disable_det_18_WR <= "0";
		INT_disable_det_19_WR <= "0";
		INT_disable_det_20_WR <= "0";
		INT_disable_det_21_WR <= "0";
		INT_disable_det_22_WR <= "0";
		INT_disable_det_23_WR <= "0";
		INT_disable_det_24_WR <= "0";
		INT_disable_det_25_WR <= "0";
		INT_disable_det_26_WR <= "0";
		INT_disable_det_27_WR <= "0";
		INT_disable_det_28_WR <= "0";
		INT_disable_det_29_WR <= "0";
		INT_disable_det_30_WR <= "0";
		INT_disable_det_31_WR <= "0";
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
	BUS_base_W_INT <= "0";
		INT_base_0_WR <= "0";
		INT_base_1_WR <= "0";
		INT_base_2_WR <= "0";
		INT_base_3_WR <= "0";
		INT_base_4_WR <= "0";
		INT_base_5_WR <= "0";
		INT_base_6_WR <= "0";
		INT_base_7_WR <= "0";
		INT_base_8_WR <= "0";
		INT_base_9_WR <= "0";
		INT_base_10_WR <= "0";
		INT_base_11_WR <= "0";
		INT_base_12_WR <= "0";
		INT_base_13_WR <= "0";
		INT_base_14_WR <= "0";
		INT_base_15_WR <= "0";
		INT_base_16_WR <= "0";
		INT_base_17_WR <= "0";
		INT_base_18_WR <= "0";
		INT_base_19_WR <= "0";
		INT_base_20_WR <= "0";
		INT_base_21_WR <= "0";
		INT_base_22_WR <= "0";
		INT_base_23_WR <= "0";
		INT_base_24_WR <= "0";
		INT_base_25_WR <= "0";
		INT_base_26_WR <= "0";
		INT_base_27_WR <= "0";
		INT_base_28_WR <= "0";
		INT_base_29_WR <= "0";
		INT_base_30_WR <= "0";
		INT_base_31_WR <= "0";
		INT_int_time_WR <= "0";
		INT_int_time_RD <= "0";
		INT_pre_int_WR <= "0";
		INT_pre_int_RD <= "0";
		INT_baseline_WR <= "0";
		INT_baseline_RD <= "0";
		INT_write_WR <= "0";
		INT_write_RD <= "0";
		INT_read_WR <= "0";
		INT_read_RD <= "0";
		INT_stopwrite_WR <= "0";
		INT_stopwrite_RD <= "0";
		INT_gate_l_WR <= "0";
		INT_gate_l_RD <= "0";
		INT_gate_u_WR <= "0";
		INT_gate_u_RD <= "0";
		INT_inhib_WR <= "0";
		INT_inhib_RD <= "0";
		INT_delay_WR <= "0";
		INT_delay_RD <= "0";
		INT_polarity_WR <= "0";
		INT_polarity_RD <= "0";
		INT_skip_WR <= "0";
		INT_skip_RD <= "0";
		INT_full_WR <= "0";
		INT_full_RD <= "0";
		INT_timestamp_WR <= "0";
		INT_timestamp_RD <= "0";
		INT_trigger_code_WR <= "0";
		INT_trigger_code_RD <= "0";
		INT_reset_WR <= "0";
		INT_reset_RD <= "0";
	BUS_All_Energies_W_INT <= "0";
		INT_All_Energies_READ_STATUS_RD <= "0";
		INT_All_Energies_READ_VALID_WORDS_RD <= "0";
		INT_All_Energies_CONFIG_WR <= "0";
	BUS_RateMeter_0_W_INT <= "0";
	BUS_RateMeter_NoSkip_W_INT <= "0";
	BUS_Syncs_W_INT <= "0";
		INT_Syncs_READ_STATUS_RD <= "0";
		INT_Syncs_READ_POSITION_RD <= "0";
		INT_Syncs_CONFIG_TRIGGER_MODE_WR <= "0";
		INT_Syncs_CONFIG_PRETRIGGER_WR <= "0";
		INT_Syncs_CONFIG_TRIGGER_LEVEL_WR <= "0";
		INT_Syncs_CONFIG_ARM_WR <= "0";
		INT_Syncs_CONFIG_DECIMATOR_WR <= "0";
	BUS_SyncIn1Meter_W_INT <= "0";
	BUS_SyncIn2Meter_W_INT <= "0";
	BUS_SyncIn0Meter_W_INT <= "0";
		INT_sync0_between_sync2_WR <= "0";
		INT_sync0_between_sync2_RD <= "0";
	BUS_Oscilloscope_0_W_INT <= "0";
		INT_Oscilloscope_0_READ_STATUS_RD <= "0";
		INT_Oscilloscope_0_READ_POSITION_RD <= "0";
		INT_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR <= "0";
		INT_Oscilloscope_0_CONFIG_PRETRIGGER_WR <= "0";
		INT_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR <= "0";
		INT_Oscilloscope_0_CONFIG_ARM_WR <= "0";
		INT_Oscilloscope_0_CONFIG_DECIMATOR_WR <= "0";
  
                f_BUS_DATASTROBE_REG <= '0';
                
               if f_BUS_INT_WR = '1' then
        
        
    		If addr >= x"00000000" And addr < x"00010000" Then
			BUS_Spectrum_0_WRITE_DATA <= wreg; 
			BUS_Spectrum_0_W_INT <= "1"; 
		End If;
		if addr = x"00010001" then
			REG_Spectrum_0_CONFIG_WR <= wreg; 
			INT_Spectrum_0_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00010002" then
			REG_Spectrum_0_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_0_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00010003" then
			REG_Spectrum_0_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_0_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00010004" then
			REG_Spectrum_0_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_0_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00010005" then
			REG_Spectrum_0_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_0_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00010007" And addr < x"00010008" Then
			BUS_thrsh_WRITE_DATA <= wreg; 
			BUS_thrsh_W_INT <= "1"; 
		End If;
		if addr = x"00010008" then
			REG_thrsh_0_WR <= wreg; 
			INT_thrsh_0_WR <= "1"; 
		end if;
		if addr = x"00010009" then
			REG_thrsh_1_WR <= wreg; 
			INT_thrsh_1_WR <= "1"; 
		end if;
		if addr = x"0001000A" then
			REG_thrsh_2_WR <= wreg; 
			INT_thrsh_2_WR <= "1"; 
		end if;
		if addr = x"0001000B" then
			REG_thrsh_3_WR <= wreg; 
			INT_thrsh_3_WR <= "1"; 
		end if;
		if addr = x"0001000C" then
			REG_thrsh_4_WR <= wreg; 
			INT_thrsh_4_WR <= "1"; 
		end if;
		if addr = x"0001000D" then
			REG_thrsh_5_WR <= wreg; 
			INT_thrsh_5_WR <= "1"; 
		end if;
		if addr = x"0001000E" then
			REG_thrsh_6_WR <= wreg; 
			INT_thrsh_6_WR <= "1"; 
		end if;
		if addr = x"0001000F" then
			REG_thrsh_7_WR <= wreg; 
			INT_thrsh_7_WR <= "1"; 
		end if;
		if addr = x"00010010" then
			REG_thrsh_8_WR <= wreg; 
			INT_thrsh_8_WR <= "1"; 
		end if;
		if addr = x"00010011" then
			REG_thrsh_9_WR <= wreg; 
			INT_thrsh_9_WR <= "1"; 
		end if;
		if addr = x"00010012" then
			REG_thrsh_10_WR <= wreg; 
			INT_thrsh_10_WR <= "1"; 
		end if;
		if addr = x"00010013" then
			REG_thrsh_11_WR <= wreg; 
			INT_thrsh_11_WR <= "1"; 
		end if;
		if addr = x"00010014" then
			REG_thrsh_12_WR <= wreg; 
			INT_thrsh_12_WR <= "1"; 
		end if;
		if addr = x"00010015" then
			REG_thrsh_13_WR <= wreg; 
			INT_thrsh_13_WR <= "1"; 
		end if;
		if addr = x"00010016" then
			REG_thrsh_14_WR <= wreg; 
			INT_thrsh_14_WR <= "1"; 
		end if;
		if addr = x"00010017" then
			REG_thrsh_15_WR <= wreg; 
			INT_thrsh_15_WR <= "1"; 
		end if;
		if addr = x"00010018" then
			REG_thrsh_16_WR <= wreg; 
			INT_thrsh_16_WR <= "1"; 
		end if;
		if addr = x"00010019" then
			REG_thrsh_17_WR <= wreg; 
			INT_thrsh_17_WR <= "1"; 
		end if;
		if addr = x"0001001A" then
			REG_thrsh_18_WR <= wreg; 
			INT_thrsh_18_WR <= "1"; 
		end if;
		if addr = x"0001001B" then
			REG_thrsh_19_WR <= wreg; 
			INT_thrsh_19_WR <= "1"; 
		end if;
		if addr = x"0001001C" then
			REG_thrsh_20_WR <= wreg; 
			INT_thrsh_20_WR <= "1"; 
		end if;
		if addr = x"0001001D" then
			REG_thrsh_21_WR <= wreg; 
			INT_thrsh_21_WR <= "1"; 
		end if;
		if addr = x"0001001E" then
			REG_thrsh_22_WR <= wreg; 
			INT_thrsh_22_WR <= "1"; 
		end if;
		if addr = x"0001001F" then
			REG_thrsh_23_WR <= wreg; 
			INT_thrsh_23_WR <= "1"; 
		end if;
		if addr = x"00010020" then
			REG_thrsh_24_WR <= wreg; 
			INT_thrsh_24_WR <= "1"; 
		end if;
		if addr = x"00010021" then
			REG_thrsh_25_WR <= wreg; 
			INT_thrsh_25_WR <= "1"; 
		end if;
		if addr = x"00010022" then
			REG_thrsh_26_WR <= wreg; 
			INT_thrsh_26_WR <= "1"; 
		end if;
		if addr = x"00010023" then
			REG_thrsh_27_WR <= wreg; 
			INT_thrsh_27_WR <= "1"; 
		end if;
		if addr = x"00010024" then
			REG_thrsh_28_WR <= wreg; 
			INT_thrsh_28_WR <= "1"; 
		end if;
		if addr = x"00010025" then
			REG_thrsh_29_WR <= wreg; 
			INT_thrsh_29_WR <= "1"; 
		end if;
		if addr = x"00010026" then
			REG_thrsh_30_WR <= wreg; 
			INT_thrsh_30_WR <= "1"; 
		end if;
		if addr = x"00010027" then
			REG_thrsh_31_WR <= wreg; 
			INT_thrsh_31_WR <= "1"; 
		end if;
		If addr >= x"00020000" And addr < x"00030000" Then
			BUS_Spectrum_12_WRITE_DATA <= wreg; 
			BUS_Spectrum_12_W_INT <= "1"; 
		End If;
		if addr = x"00030001" then
			REG_Spectrum_12_CONFIG_WR <= wreg; 
			INT_Spectrum_12_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00030002" then
			REG_Spectrum_12_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_12_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00030003" then
			REG_Spectrum_12_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_12_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00030004" then
			REG_Spectrum_12_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_12_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00030005" then
			REG_Spectrum_12_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_12_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00040000" And addr < x"00050000" Then
			BUS_Spectrum_1_WRITE_DATA <= wreg; 
			BUS_Spectrum_1_W_INT <= "1"; 
		End If;
		if addr = x"00050001" then
			REG_Spectrum_1_CONFIG_WR <= wreg; 
			INT_Spectrum_1_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00050002" then
			REG_Spectrum_1_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_1_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00050003" then
			REG_Spectrum_1_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_1_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00050004" then
			REG_Spectrum_1_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_1_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00050005" then
			REG_Spectrum_1_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_1_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00060000" And addr < x"00070000" Then
			BUS_Spectrum_13_WRITE_DATA <= wreg; 
			BUS_Spectrum_13_W_INT <= "1"; 
		End If;
		if addr = x"00070001" then
			REG_Spectrum_13_CONFIG_WR <= wreg; 
			INT_Spectrum_13_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00070002" then
			REG_Spectrum_13_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_13_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00070003" then
			REG_Spectrum_13_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_13_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00070004" then
			REG_Spectrum_13_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_13_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00070005" then
			REG_Spectrum_13_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_13_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00080000" And addr < x"00090000" Then
			BUS_Spectrum_2_WRITE_DATA <= wreg; 
			BUS_Spectrum_2_W_INT <= "1"; 
		End If;
		if addr = x"00090001" then
			REG_Spectrum_2_CONFIG_WR <= wreg; 
			INT_Spectrum_2_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00090002" then
			REG_Spectrum_2_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_2_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00090003" then
			REG_Spectrum_2_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_2_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00090004" then
			REG_Spectrum_2_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_2_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00090005" then
			REG_Spectrum_2_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_2_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"000A0000" And addr < x"000B0000" Then
			BUS_Spectrum_14_WRITE_DATA <= wreg; 
			BUS_Spectrum_14_W_INT <= "1"; 
		End If;
		if addr = x"000B0001" then
			REG_Spectrum_14_CONFIG_WR <= wreg; 
			INT_Spectrum_14_CONFIG_WR <= "1"; 
		end if;
		if addr = x"000B0002" then
			REG_Spectrum_14_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_14_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"000B0003" then
			REG_Spectrum_14_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_14_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"000B0004" then
			REG_Spectrum_14_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_14_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"000B0005" then
			REG_Spectrum_14_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_14_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"000C0000" And addr < x"000D0000" Then
			BUS_Spectrum_3_WRITE_DATA <= wreg; 
			BUS_Spectrum_3_W_INT <= "1"; 
		End If;
		if addr = x"000D0001" then
			REG_Spectrum_3_CONFIG_WR <= wreg; 
			INT_Spectrum_3_CONFIG_WR <= "1"; 
		end if;
		if addr = x"000D0002" then
			REG_Spectrum_3_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_3_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"000D0003" then
			REG_Spectrum_3_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_3_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"000D0004" then
			REG_Spectrum_3_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_3_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"000D0005" then
			REG_Spectrum_3_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_3_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"000E0000" And addr < x"000F0000" Then
			BUS_Spectrum_15_WRITE_DATA <= wreg; 
			BUS_Spectrum_15_W_INT <= "1"; 
		End If;
		if addr = x"000F0001" then
			REG_Spectrum_15_CONFIG_WR <= wreg; 
			INT_Spectrum_15_CONFIG_WR <= "1"; 
		end if;
		if addr = x"000F0002" then
			REG_Spectrum_15_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_15_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"000F0003" then
			REG_Spectrum_15_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_15_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"000F0004" then
			REG_Spectrum_15_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_15_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"000F0005" then
			REG_Spectrum_15_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_15_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00100000" And addr < x"00110000" Then
			BUS_Spectrum_4_WRITE_DATA <= wreg; 
			BUS_Spectrum_4_W_INT <= "1"; 
		End If;
		if addr = x"00110001" then
			REG_Spectrum_4_CONFIG_WR <= wreg; 
			INT_Spectrum_4_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00110002" then
			REG_Spectrum_4_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_4_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00110003" then
			REG_Spectrum_4_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_4_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00110004" then
			REG_Spectrum_4_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_4_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00110005" then
			REG_Spectrum_4_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_4_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00120000" And addr < x"00130000" Then
			BUS_Spectrum_16_WRITE_DATA <= wreg; 
			BUS_Spectrum_16_W_INT <= "1"; 
		End If;
		if addr = x"00130001" then
			REG_Spectrum_16_CONFIG_WR <= wreg; 
			INT_Spectrum_16_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00130002" then
			REG_Spectrum_16_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_16_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00130003" then
			REG_Spectrum_16_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_16_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00130004" then
			REG_Spectrum_16_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_16_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00130005" then
			REG_Spectrum_16_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_16_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00140000" And addr < x"00150000" Then
			BUS_Spectrum_5_WRITE_DATA <= wreg; 
			BUS_Spectrum_5_W_INT <= "1"; 
		End If;
		if addr = x"00150001" then
			REG_Spectrum_5_CONFIG_WR <= wreg; 
			INT_Spectrum_5_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00150002" then
			REG_Spectrum_5_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_5_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00150003" then
			REG_Spectrum_5_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_5_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00150004" then
			REG_Spectrum_5_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_5_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00150005" then
			REG_Spectrum_5_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_5_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00160000" And addr < x"00170000" Then
			BUS_Spectrum_17_WRITE_DATA <= wreg; 
			BUS_Spectrum_17_W_INT <= "1"; 
		End If;
		if addr = x"00170001" then
			REG_Spectrum_17_CONFIG_WR <= wreg; 
			INT_Spectrum_17_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00170002" then
			REG_Spectrum_17_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_17_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00170003" then
			REG_Spectrum_17_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_17_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00170004" then
			REG_Spectrum_17_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_17_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00170005" then
			REG_Spectrum_17_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_17_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00170007" And addr < x"00170008" Then
			BUS_top_WRITE_DATA <= wreg; 
			BUS_top_W_INT <= "1"; 
		End If;
		if addr = x"00170008" then
			REG_top_0_WR <= wreg; 
			INT_top_0_WR <= "1"; 
		end if;
		if addr = x"00170009" then
			REG_top_1_WR <= wreg; 
			INT_top_1_WR <= "1"; 
		end if;
		if addr = x"0017000A" then
			REG_top_2_WR <= wreg; 
			INT_top_2_WR <= "1"; 
		end if;
		if addr = x"0017000B" then
			REG_top_3_WR <= wreg; 
			INT_top_3_WR <= "1"; 
		end if;
		if addr = x"0017000C" then
			REG_top_4_WR <= wreg; 
			INT_top_4_WR <= "1"; 
		end if;
		if addr = x"0017000D" then
			REG_top_5_WR <= wreg; 
			INT_top_5_WR <= "1"; 
		end if;
		if addr = x"0017000E" then
			REG_top_6_WR <= wreg; 
			INT_top_6_WR <= "1"; 
		end if;
		if addr = x"0017000F" then
			REG_top_7_WR <= wreg; 
			INT_top_7_WR <= "1"; 
		end if;
		if addr = x"00170010" then
			REG_top_8_WR <= wreg; 
			INT_top_8_WR <= "1"; 
		end if;
		if addr = x"00170011" then
			REG_top_9_WR <= wreg; 
			INT_top_9_WR <= "1"; 
		end if;
		if addr = x"00170012" then
			REG_top_10_WR <= wreg; 
			INT_top_10_WR <= "1"; 
		end if;
		if addr = x"00170013" then
			REG_top_11_WR <= wreg; 
			INT_top_11_WR <= "1"; 
		end if;
		if addr = x"00170014" then
			REG_top_12_WR <= wreg; 
			INT_top_12_WR <= "1"; 
		end if;
		if addr = x"00170015" then
			REG_top_13_WR <= wreg; 
			INT_top_13_WR <= "1"; 
		end if;
		if addr = x"00170016" then
			REG_top_14_WR <= wreg; 
			INT_top_14_WR <= "1"; 
		end if;
		if addr = x"00170017" then
			REG_top_15_WR <= wreg; 
			INT_top_15_WR <= "1"; 
		end if;
		if addr = x"00170018" then
			REG_top_16_WR <= wreg; 
			INT_top_16_WR <= "1"; 
		end if;
		if addr = x"00170019" then
			REG_top_17_WR <= wreg; 
			INT_top_17_WR <= "1"; 
		end if;
		if addr = x"0017001A" then
			REG_top_18_WR <= wreg; 
			INT_top_18_WR <= "1"; 
		end if;
		if addr = x"0017001B" then
			REG_top_19_WR <= wreg; 
			INT_top_19_WR <= "1"; 
		end if;
		if addr = x"0017001C" then
			REG_top_20_WR <= wreg; 
			INT_top_20_WR <= "1"; 
		end if;
		if addr = x"0017001D" then
			REG_top_21_WR <= wreg; 
			INT_top_21_WR <= "1"; 
		end if;
		if addr = x"0017001E" then
			REG_top_22_WR <= wreg; 
			INT_top_22_WR <= "1"; 
		end if;
		if addr = x"0017001F" then
			REG_top_23_WR <= wreg; 
			INT_top_23_WR <= "1"; 
		end if;
		if addr = x"00170020" then
			REG_top_24_WR <= wreg; 
			INT_top_24_WR <= "1"; 
		end if;
		if addr = x"00170021" then
			REG_top_25_WR <= wreg; 
			INT_top_25_WR <= "1"; 
		end if;
		if addr = x"00170022" then
			REG_top_26_WR <= wreg; 
			INT_top_26_WR <= "1"; 
		end if;
		if addr = x"00170023" then
			REG_top_27_WR <= wreg; 
			INT_top_27_WR <= "1"; 
		end if;
		if addr = x"00170024" then
			REG_top_28_WR <= wreg; 
			INT_top_28_WR <= "1"; 
		end if;
		if addr = x"00170025" then
			REG_top_29_WR <= wreg; 
			INT_top_29_WR <= "1"; 
		end if;
		if addr = x"00170026" then
			REG_top_30_WR <= wreg; 
			INT_top_30_WR <= "1"; 
		end if;
		if addr = x"00170027" then
			REG_top_31_WR <= wreg; 
			INT_top_31_WR <= "1"; 
		end if;
		If addr >= x"00180000" And addr < x"00190000" Then
			BUS_Spectrum_6_WRITE_DATA <= wreg; 
			BUS_Spectrum_6_W_INT <= "1"; 
		End If;
		if addr = x"00190001" then
			REG_Spectrum_6_CONFIG_WR <= wreg; 
			INT_Spectrum_6_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00190002" then
			REG_Spectrum_6_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_6_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00190003" then
			REG_Spectrum_6_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_6_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00190004" then
			REG_Spectrum_6_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_6_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00190005" then
			REG_Spectrum_6_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_6_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"001A0000" And addr < x"001B0000" Then
			BUS_Spectrum_18_WRITE_DATA <= wreg; 
			BUS_Spectrum_18_W_INT <= "1"; 
		End If;
		if addr = x"001B0001" then
			REG_Spectrum_18_CONFIG_WR <= wreg; 
			INT_Spectrum_18_CONFIG_WR <= "1"; 
		end if;
		if addr = x"001B0002" then
			REG_Spectrum_18_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_18_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"001B0003" then
			REG_Spectrum_18_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_18_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"001B0004" then
			REG_Spectrum_18_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_18_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"001B0005" then
			REG_Spectrum_18_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_18_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"001B0007" And addr < x"001B0008" Then
			BUS_disable_det_WRITE_DATA <= wreg; 
			BUS_disable_det_W_INT <= "1"; 
		End If;
		if addr = x"001B0008" then
			REG_disable_det_0_WR <= wreg; 
			INT_disable_det_0_WR <= "1"; 
		end if;
		if addr = x"001B0009" then
			REG_disable_det_1_WR <= wreg; 
			INT_disable_det_1_WR <= "1"; 
		end if;
		if addr = x"001B000A" then
			REG_disable_det_2_WR <= wreg; 
			INT_disable_det_2_WR <= "1"; 
		end if;
		if addr = x"001B000B" then
			REG_disable_det_3_WR <= wreg; 
			INT_disable_det_3_WR <= "1"; 
		end if;
		if addr = x"001B000C" then
			REG_disable_det_4_WR <= wreg; 
			INT_disable_det_4_WR <= "1"; 
		end if;
		if addr = x"001B000D" then
			REG_disable_det_5_WR <= wreg; 
			INT_disable_det_5_WR <= "1"; 
		end if;
		if addr = x"001B000E" then
			REG_disable_det_6_WR <= wreg; 
			INT_disable_det_6_WR <= "1"; 
		end if;
		if addr = x"001B000F" then
			REG_disable_det_7_WR <= wreg; 
			INT_disable_det_7_WR <= "1"; 
		end if;
		if addr = x"001B0010" then
			REG_disable_det_8_WR <= wreg; 
			INT_disable_det_8_WR <= "1"; 
		end if;
		if addr = x"001B0011" then
			REG_disable_det_9_WR <= wreg; 
			INT_disable_det_9_WR <= "1"; 
		end if;
		if addr = x"001B0012" then
			REG_disable_det_10_WR <= wreg; 
			INT_disable_det_10_WR <= "1"; 
		end if;
		if addr = x"001B0013" then
			REG_disable_det_11_WR <= wreg; 
			INT_disable_det_11_WR <= "1"; 
		end if;
		if addr = x"001B0014" then
			REG_disable_det_12_WR <= wreg; 
			INT_disable_det_12_WR <= "1"; 
		end if;
		if addr = x"001B0015" then
			REG_disable_det_13_WR <= wreg; 
			INT_disable_det_13_WR <= "1"; 
		end if;
		if addr = x"001B0016" then
			REG_disable_det_14_WR <= wreg; 
			INT_disable_det_14_WR <= "1"; 
		end if;
		if addr = x"001B0017" then
			REG_disable_det_15_WR <= wreg; 
			INT_disable_det_15_WR <= "1"; 
		end if;
		if addr = x"001B0018" then
			REG_disable_det_16_WR <= wreg; 
			INT_disable_det_16_WR <= "1"; 
		end if;
		if addr = x"001B0019" then
			REG_disable_det_17_WR <= wreg; 
			INT_disable_det_17_WR <= "1"; 
		end if;
		if addr = x"001B001A" then
			REG_disable_det_18_WR <= wreg; 
			INT_disable_det_18_WR <= "1"; 
		end if;
		if addr = x"001B001B" then
			REG_disable_det_19_WR <= wreg; 
			INT_disable_det_19_WR <= "1"; 
		end if;
		if addr = x"001B001C" then
			REG_disable_det_20_WR <= wreg; 
			INT_disable_det_20_WR <= "1"; 
		end if;
		if addr = x"001B001D" then
			REG_disable_det_21_WR <= wreg; 
			INT_disable_det_21_WR <= "1"; 
		end if;
		if addr = x"001B001E" then
			REG_disable_det_22_WR <= wreg; 
			INT_disable_det_22_WR <= "1"; 
		end if;
		if addr = x"001B001F" then
			REG_disable_det_23_WR <= wreg; 
			INT_disable_det_23_WR <= "1"; 
		end if;
		if addr = x"001B0020" then
			REG_disable_det_24_WR <= wreg; 
			INT_disable_det_24_WR <= "1"; 
		end if;
		if addr = x"001B0021" then
			REG_disable_det_25_WR <= wreg; 
			INT_disable_det_25_WR <= "1"; 
		end if;
		if addr = x"001B0022" then
			REG_disable_det_26_WR <= wreg; 
			INT_disable_det_26_WR <= "1"; 
		end if;
		if addr = x"001B0023" then
			REG_disable_det_27_WR <= wreg; 
			INT_disable_det_27_WR <= "1"; 
		end if;
		if addr = x"001B0024" then
			REG_disable_det_28_WR <= wreg; 
			INT_disable_det_28_WR <= "1"; 
		end if;
		if addr = x"001B0025" then
			REG_disable_det_29_WR <= wreg; 
			INT_disable_det_29_WR <= "1"; 
		end if;
		if addr = x"001B0026" then
			REG_disable_det_30_WR <= wreg; 
			INT_disable_det_30_WR <= "1"; 
		end if;
		if addr = x"001B0027" then
			REG_disable_det_31_WR <= wreg; 
			INT_disable_det_31_WR <= "1"; 
		end if;
		If addr >= x"001C0000" And addr < x"001D0000" Then
			BUS_Spectrum_7_WRITE_DATA <= wreg; 
			BUS_Spectrum_7_W_INT <= "1"; 
		End If;
		if addr = x"001D0001" then
			REG_Spectrum_7_CONFIG_WR <= wreg; 
			INT_Spectrum_7_CONFIG_WR <= "1"; 
		end if;
		if addr = x"001D0002" then
			REG_Spectrum_7_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_7_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"001D0003" then
			REG_Spectrum_7_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_7_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"001D0004" then
			REG_Spectrum_7_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_7_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"001D0005" then
			REG_Spectrum_7_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_7_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"001E0000" And addr < x"001F0000" Then
			BUS_Spectrum_19_WRITE_DATA <= wreg; 
			BUS_Spectrum_19_W_INT <= "1"; 
		End If;
		if addr = x"001F0001" then
			REG_Spectrum_19_CONFIG_WR <= wreg; 
			INT_Spectrum_19_CONFIG_WR <= "1"; 
		end if;
		if addr = x"001F0002" then
			REG_Spectrum_19_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_19_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"001F0003" then
			REG_Spectrum_19_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_19_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"001F0004" then
			REG_Spectrum_19_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_19_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"001F0005" then
			REG_Spectrum_19_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_19_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00200000" And addr < x"00210000" Then
			BUS_Spectrum_8_WRITE_DATA <= wreg; 
			BUS_Spectrum_8_W_INT <= "1"; 
		End If;
		if addr = x"00210001" then
			REG_Spectrum_8_CONFIG_WR <= wreg; 
			INT_Spectrum_8_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00210002" then
			REG_Spectrum_8_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_8_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00210003" then
			REG_Spectrum_8_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_8_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00210004" then
			REG_Spectrum_8_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_8_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00210005" then
			REG_Spectrum_8_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_8_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00220000" And addr < x"00230000" Then
			BUS_Spectrum_20_WRITE_DATA <= wreg; 
			BUS_Spectrum_20_W_INT <= "1"; 
		End If;
		if addr = x"00230001" then
			REG_Spectrum_20_CONFIG_WR <= wreg; 
			INT_Spectrum_20_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00230002" then
			REG_Spectrum_20_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_20_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00230003" then
			REG_Spectrum_20_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_20_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00230004" then
			REG_Spectrum_20_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_20_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00230005" then
			REG_Spectrum_20_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_20_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00240000" And addr < x"00250000" Then
			BUS_Spectrum_9_WRITE_DATA <= wreg; 
			BUS_Spectrum_9_W_INT <= "1"; 
		End If;
		if addr = x"00250001" then
			REG_Spectrum_9_CONFIG_WR <= wreg; 
			INT_Spectrum_9_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00250002" then
			REG_Spectrum_9_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_9_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00250003" then
			REG_Spectrum_9_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_9_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00250004" then
			REG_Spectrum_9_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_9_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00250005" then
			REG_Spectrum_9_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_9_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00260000" And addr < x"00270000" Then
			BUS_Spectrum_21_WRITE_DATA <= wreg; 
			BUS_Spectrum_21_W_INT <= "1"; 
		End If;
		if addr = x"00270001" then
			REG_Spectrum_21_CONFIG_WR <= wreg; 
			INT_Spectrum_21_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00270002" then
			REG_Spectrum_21_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_21_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00270003" then
			REG_Spectrum_21_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_21_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00270004" then
			REG_Spectrum_21_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_21_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00270005" then
			REG_Spectrum_21_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_21_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00280000" And addr < x"00290000" Then
			BUS_Spectrum_10_WRITE_DATA <= wreg; 
			BUS_Spectrum_10_W_INT <= "1"; 
		End If;
		if addr = x"00290001" then
			REG_Spectrum_10_CONFIG_WR <= wreg; 
			INT_Spectrum_10_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00290002" then
			REG_Spectrum_10_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_10_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00290003" then
			REG_Spectrum_10_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_10_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00290004" then
			REG_Spectrum_10_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_10_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00290005" then
			REG_Spectrum_10_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_10_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"002A0000" And addr < x"002B0000" Then
			BUS_Spectrum_22_WRITE_DATA <= wreg; 
			BUS_Spectrum_22_W_INT <= "1"; 
		End If;
		if addr = x"002B0001" then
			REG_Spectrum_22_CONFIG_WR <= wreg; 
			INT_Spectrum_22_CONFIG_WR <= "1"; 
		end if;
		if addr = x"002B0002" then
			REG_Spectrum_22_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_22_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"002B0003" then
			REG_Spectrum_22_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_22_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"002B0004" then
			REG_Spectrum_22_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_22_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"002B0005" then
			REG_Spectrum_22_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_22_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"002C0000" And addr < x"002D0000" Then
			BUS_Spectrum_11_WRITE_DATA <= wreg; 
			BUS_Spectrum_11_W_INT <= "1"; 
		End If;
		if addr = x"002D0001" then
			REG_Spectrum_11_CONFIG_WR <= wreg; 
			INT_Spectrum_11_CONFIG_WR <= "1"; 
		end if;
		if addr = x"002D0002" then
			REG_Spectrum_11_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_11_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"002D0003" then
			REG_Spectrum_11_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_11_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"002D0004" then
			REG_Spectrum_11_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_11_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"002D0005" then
			REG_Spectrum_11_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_11_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"002E0000" And addr < x"002F0000" Then
			BUS_Spectrum_23_WRITE_DATA <= wreg; 
			BUS_Spectrum_23_W_INT <= "1"; 
		End If;
		if addr = x"002F0001" then
			REG_Spectrum_23_CONFIG_WR <= wreg; 
			INT_Spectrum_23_CONFIG_WR <= "1"; 
		end if;
		if addr = x"002F0002" then
			REG_Spectrum_23_CONFIG_LIMIT_WR <= wreg; 
			INT_Spectrum_23_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"002F0003" then
			REG_Spectrum_23_CONFIG_REBIN_WR <= wreg; 
			INT_Spectrum_23_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"002F0004" then
			REG_Spectrum_23_CONFIG_MIN_WR <= wreg; 
			INT_Spectrum_23_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"002F0005" then
			REG_Spectrum_23_CONFIG_MAX_WR <= wreg; 
			INT_Spectrum_23_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"002F0007" And addr < x"002F0008" Then
			BUS_base_WRITE_DATA <= wreg; 
			BUS_base_W_INT <= "1"; 
		End If;
		if addr = x"002F0008" then
			REG_base_0_WR <= wreg; 
			INT_base_0_WR <= "1"; 
		end if;
		if addr = x"002F0009" then
			REG_base_1_WR <= wreg; 
			INT_base_1_WR <= "1"; 
		end if;
		if addr = x"002F000A" then
			REG_base_2_WR <= wreg; 
			INT_base_2_WR <= "1"; 
		end if;
		if addr = x"002F000B" then
			REG_base_3_WR <= wreg; 
			INT_base_3_WR <= "1"; 
		end if;
		if addr = x"002F000C" then
			REG_base_4_WR <= wreg; 
			INT_base_4_WR <= "1"; 
		end if;
		if addr = x"002F000D" then
			REG_base_5_WR <= wreg; 
			INT_base_5_WR <= "1"; 
		end if;
		if addr = x"002F000E" then
			REG_base_6_WR <= wreg; 
			INT_base_6_WR <= "1"; 
		end if;
		if addr = x"002F000F" then
			REG_base_7_WR <= wreg; 
			INT_base_7_WR <= "1"; 
		end if;
		if addr = x"002F0010" then
			REG_base_8_WR <= wreg; 
			INT_base_8_WR <= "1"; 
		end if;
		if addr = x"002F0011" then
			REG_base_9_WR <= wreg; 
			INT_base_9_WR <= "1"; 
		end if;
		if addr = x"002F0012" then
			REG_base_10_WR <= wreg; 
			INT_base_10_WR <= "1"; 
		end if;
		if addr = x"002F0013" then
			REG_base_11_WR <= wreg; 
			INT_base_11_WR <= "1"; 
		end if;
		if addr = x"002F0014" then
			REG_base_12_WR <= wreg; 
			INT_base_12_WR <= "1"; 
		end if;
		if addr = x"002F0015" then
			REG_base_13_WR <= wreg; 
			INT_base_13_WR <= "1"; 
		end if;
		if addr = x"002F0016" then
			REG_base_14_WR <= wreg; 
			INT_base_14_WR <= "1"; 
		end if;
		if addr = x"002F0017" then
			REG_base_15_WR <= wreg; 
			INT_base_15_WR <= "1"; 
		end if;
		if addr = x"002F0018" then
			REG_base_16_WR <= wreg; 
			INT_base_16_WR <= "1"; 
		end if;
		if addr = x"002F0019" then
			REG_base_17_WR <= wreg; 
			INT_base_17_WR <= "1"; 
		end if;
		if addr = x"002F001A" then
			REG_base_18_WR <= wreg; 
			INT_base_18_WR <= "1"; 
		end if;
		if addr = x"002F001B" then
			REG_base_19_WR <= wreg; 
			INT_base_19_WR <= "1"; 
		end if;
		if addr = x"002F001C" then
			REG_base_20_WR <= wreg; 
			INT_base_20_WR <= "1"; 
		end if;
		if addr = x"002F001D" then
			REG_base_21_WR <= wreg; 
			INT_base_21_WR <= "1"; 
		end if;
		if addr = x"002F001E" then
			REG_base_22_WR <= wreg; 
			INT_base_22_WR <= "1"; 
		end if;
		if addr = x"002F001F" then
			REG_base_23_WR <= wreg; 
			INT_base_23_WR <= "1"; 
		end if;
		if addr = x"002F0020" then
			REG_base_24_WR <= wreg; 
			INT_base_24_WR <= "1"; 
		end if;
		if addr = x"002F0021" then
			REG_base_25_WR <= wreg; 
			INT_base_25_WR <= "1"; 
		end if;
		if addr = x"002F0022" then
			REG_base_26_WR <= wreg; 
			INT_base_26_WR <= "1"; 
		end if;
		if addr = x"002F0023" then
			REG_base_27_WR <= wreg; 
			INT_base_27_WR <= "1"; 
		end if;
		if addr = x"002F0024" then
			REG_base_28_WR <= wreg; 
			INT_base_28_WR <= "1"; 
		end if;
		if addr = x"002F0025" then
			REG_base_29_WR <= wreg; 
			INT_base_29_WR <= "1"; 
		end if;
		if addr = x"002F0026" then
			REG_base_30_WR <= wreg; 
			INT_base_30_WR <= "1"; 
		end if;
		if addr = x"002F0027" then
			REG_base_31_WR <= wreg; 
			INT_base_31_WR <= "1"; 
		end if;
		if addr = x"002F0028" then
			REG_int_time_WR <= wreg; 
			INT_int_time_WR <= "1"; 
		end if;
		if addr = x"002F0029" then
			REG_pre_int_WR <= wreg; 
			INT_pre_int_WR <= "1"; 
		end if;
		if addr = x"002F002A" then
			REG_baseline_WR <= wreg; 
			INT_baseline_WR <= "1"; 
		end if;
		if addr = x"002F002B" then
			REG_write_WR <= wreg; 
			INT_write_WR <= "1"; 
		end if;
		if addr = x"002F002C" then
			REG_read_WR <= wreg; 
			INT_read_WR <= "1"; 
		end if;
		if addr = x"002F002D" then
			REG_stopwrite_WR <= wreg; 
			INT_stopwrite_WR <= "1"; 
		end if;
		if addr = x"002F002E" then
			REG_gate_l_WR <= wreg; 
			INT_gate_l_WR <= "1"; 
		end if;
		if addr = x"002F002F" then
			REG_gate_u_WR <= wreg; 
			INT_gate_u_WR <= "1"; 
		end if;
		if addr = x"002F0030" then
			REG_inhib_WR <= wreg; 
			INT_inhib_WR <= "1"; 
		end if;
		if addr = x"002F0031" then
			REG_delay_WR <= wreg; 
			INT_delay_WR <= "1"; 
		end if;
		if addr = x"002F0032" then
			REG_polarity_WR <= wreg; 
			INT_polarity_WR <= "1"; 
		end if;
		if addr = x"002F0033" then
			REG_skip_WR <= wreg; 
			INT_skip_WR <= "1"; 
		end if;
		if addr = x"002F0034" then
			REG_full_WR <= wreg; 
			INT_full_WR <= "1"; 
		end if;
		if addr = x"002F0035" then
			REG_timestamp_WR <= wreg; 
			INT_timestamp_WR <= "1"; 
		end if;
		if addr = x"002F0036" then
			REG_trigger_code_WR <= wreg; 
			INT_trigger_code_WR <= "1"; 
		end if;
		if addr = x"002F0037" then
			REG_reset_WR <= wreg; 
			INT_reset_WR <= "1"; 
		end if;
		If addr >= x"002F0039" And addr < x"002F003A" Then
			BUS_All_Energies_WRITE_DATA <= wreg; 
			BUS_All_Energies_W_INT <= "1"; 
		End If;
		if addr = x"002F003C" then
			REG_All_Energies_CONFIG_WR <= wreg; 
			INT_All_Energies_CONFIG_WR <= "1"; 
		end if;
		If addr >= x"00300000" And addr < x"00310000" Then
			BUS_RateMeter_0_WRITE_DATA <= wreg; 
			BUS_RateMeter_0_W_INT <= "1"; 
		End If;
		If addr >= x"00340000" And addr < x"00350000" Then
			BUS_RateMeter_NoSkip_WRITE_DATA <= wreg; 
			BUS_RateMeter_NoSkip_W_INT <= "1"; 
		End If;
		If addr >= x"00311000" And addr < x"00312000" Then
			BUS_Syncs_WRITE_DATA <= wreg; 
			BUS_Syncs_W_INT <= "1"; 
		End If;
		if addr = x"00312002" then
			REG_Syncs_CONFIG_TRIGGER_MODE_WR <= wreg; 
			INT_Syncs_CONFIG_TRIGGER_MODE_WR <= "1"; 
		end if;
		if addr = x"00312003" then
			REG_Syncs_CONFIG_PRETRIGGER_WR <= wreg; 
			INT_Syncs_CONFIG_PRETRIGGER_WR <= "1"; 
		end if;
		if addr = x"00312004" then
			REG_Syncs_CONFIG_TRIGGER_LEVEL_WR <= wreg; 
			INT_Syncs_CONFIG_TRIGGER_LEVEL_WR <= "1"; 
		end if;
		if addr = x"00312005" then
			REG_Syncs_CONFIG_ARM_WR <= wreg; 
			INT_Syncs_CONFIG_ARM_WR <= "1"; 
		end if;
		if addr = x"00312006" then
			REG_Syncs_CONFIG_DECIMATOR_WR <= wreg; 
			INT_Syncs_CONFIG_DECIMATOR_WR <= "1"; 
		end if;
		If addr >= x"00320000" And addr < x"00330000" Then
			BUS_SyncIn1Meter_WRITE_DATA <= wreg; 
			BUS_SyncIn1Meter_W_INT <= "1"; 
		End If;
		If addr >= x"00690000" And addr < x"006A0000" Then
			BUS_SyncIn2Meter_WRITE_DATA <= wreg; 
			BUS_SyncIn2Meter_W_INT <= "1"; 
		End If;
		If addr >= x"006B0000" And addr < x"006C0000" Then
			BUS_SyncIn0Meter_WRITE_DATA <= wreg; 
			BUS_SyncIn0Meter_W_INT <= "1"; 
		End If;
		if addr = x"006C0000" then
			REG_sync0_between_sync2_WR <= wreg; 
			INT_sync0_between_sync2_WR <= "1"; 
		end if;
		If addr >= x"006C8000" And addr < x"006D0000" Then
			BUS_Oscilloscope_0_WRITE_DATA <= wreg; 
			BUS_Oscilloscope_0_W_INT <= "1"; 
		End If;
		if addr = x"006D0002" then
			REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR <= wreg; 
			INT_Oscilloscope_0_CONFIG_TRIGGER_MODE_WR <= "1"; 
		end if;
		if addr = x"006D0003" then
			REG_Oscilloscope_0_CONFIG_PRETRIGGER_WR <= wreg; 
			INT_Oscilloscope_0_CONFIG_PRETRIGGER_WR <= "1"; 
		end if;
		if addr = x"006D0004" then
			REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR <= wreg; 
			INT_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_WR <= "1"; 
		end if;
		if addr = x"006D0005" then
			REG_Oscilloscope_0_CONFIG_ARM_WR <= wreg; 
			INT_Oscilloscope_0_CONFIG_ARM_WR <= "1"; 
		end if;
		if addr = x"006D0006" then
			REG_Oscilloscope_0_CONFIG_DECIMATOR_WR <= wreg; 
			INT_Oscilloscope_0_CONFIG_DECIMATOR_WR <= "1"; 
		end if;

                end if;
        
        
                if f_BUS_INT_RD = '1' then
                    f_BUS_DATASTROBE_REG <= '1';
                    rreg := x"DEADBEEF";
    
    		if addr = x"00010000" then
			rreg := REG_Spectrum_0_STATUS_RD; 
		End If;
		if addr = x"00010001" then
			rreg := REG_Spectrum_0_CONFIG_RD; 
		End If;
		if addr = x"00010002" then
			rreg := REG_Spectrum_0_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00010003" then
			rreg := REG_Spectrum_0_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00010004" then
			rreg := REG_Spectrum_0_CONFIG_MIN_RD; 
		End If;
		if addr = x"00010005" then
			rreg := REG_Spectrum_0_CONFIG_MAX_RD; 
		End If;
		if addr = x"00010008" then
			rreg := REG_thrsh_0_RD; 
		End If;
		if addr = x"00010009" then
			rreg := REG_thrsh_1_RD; 
		End If;
		if addr = x"0001000A" then
			rreg := REG_thrsh_2_RD; 
		End If;
		if addr = x"0001000B" then
			rreg := REG_thrsh_3_RD; 
		End If;
		if addr = x"0001000C" then
			rreg := REG_thrsh_4_RD; 
		End If;
		if addr = x"0001000D" then
			rreg := REG_thrsh_5_RD; 
		End If;
		if addr = x"0001000E" then
			rreg := REG_thrsh_6_RD; 
		End If;
		if addr = x"0001000F" then
			rreg := REG_thrsh_7_RD; 
		End If;
		if addr = x"00010010" then
			rreg := REG_thrsh_8_RD; 
		End If;
		if addr = x"00010011" then
			rreg := REG_thrsh_9_RD; 
		End If;
		if addr = x"00010012" then
			rreg := REG_thrsh_10_RD; 
		End If;
		if addr = x"00010013" then
			rreg := REG_thrsh_11_RD; 
		End If;
		if addr = x"00010014" then
			rreg := REG_thrsh_12_RD; 
		End If;
		if addr = x"00010015" then
			rreg := REG_thrsh_13_RD; 
		End If;
		if addr = x"00010016" then
			rreg := REG_thrsh_14_RD; 
		End If;
		if addr = x"00010017" then
			rreg := REG_thrsh_15_RD; 
		End If;
		if addr = x"00010018" then
			rreg := REG_thrsh_16_RD; 
		End If;
		if addr = x"00010019" then
			rreg := REG_thrsh_17_RD; 
		End If;
		if addr = x"0001001A" then
			rreg := REG_thrsh_18_RD; 
		End If;
		if addr = x"0001001B" then
			rreg := REG_thrsh_19_RD; 
		End If;
		if addr = x"0001001C" then
			rreg := REG_thrsh_20_RD; 
		End If;
		if addr = x"0001001D" then
			rreg := REG_thrsh_21_RD; 
		End If;
		if addr = x"0001001E" then
			rreg := REG_thrsh_22_RD; 
		End If;
		if addr = x"0001001F" then
			rreg := REG_thrsh_23_RD; 
		End If;
		if addr = x"00010020" then
			rreg := REG_thrsh_24_RD; 
		End If;
		if addr = x"00010021" then
			rreg := REG_thrsh_25_RD; 
		End If;
		if addr = x"00010022" then
			rreg := REG_thrsh_26_RD; 
		End If;
		if addr = x"00010023" then
			rreg := REG_thrsh_27_RD; 
		End If;
		if addr = x"00010024" then
			rreg := REG_thrsh_28_RD; 
		End If;
		if addr = x"00010025" then
			rreg := REG_thrsh_29_RD; 
		End If;
		if addr = x"00010026" then
			rreg := REG_thrsh_30_RD; 
		End If;
		if addr = x"00010027" then
			rreg := REG_thrsh_31_RD; 
		End If;
		if addr = x"00030000" then
			rreg := REG_Spectrum_12_STATUS_RD; 
		End If;
		if addr = x"00030001" then
			rreg := REG_Spectrum_12_CONFIG_RD; 
		End If;
		if addr = x"00030002" then
			rreg := REG_Spectrum_12_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00030003" then
			rreg := REG_Spectrum_12_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00030004" then
			rreg := REG_Spectrum_12_CONFIG_MIN_RD; 
		End If;
		if addr = x"00030005" then
			rreg := REG_Spectrum_12_CONFIG_MAX_RD; 
		End If;
		if addr = x"00050000" then
			rreg := REG_Spectrum_1_STATUS_RD; 
		End If;
		if addr = x"00050001" then
			rreg := REG_Spectrum_1_CONFIG_RD; 
		End If;
		if addr = x"00050002" then
			rreg := REG_Spectrum_1_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00050003" then
			rreg := REG_Spectrum_1_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00050004" then
			rreg := REG_Spectrum_1_CONFIG_MIN_RD; 
		End If;
		if addr = x"00050005" then
			rreg := REG_Spectrum_1_CONFIG_MAX_RD; 
		End If;
		if addr = x"00070000" then
			rreg := REG_Spectrum_13_STATUS_RD; 
		End If;
		if addr = x"00070001" then
			rreg := REG_Spectrum_13_CONFIG_RD; 
		End If;
		if addr = x"00070002" then
			rreg := REG_Spectrum_13_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00070003" then
			rreg := REG_Spectrum_13_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00070004" then
			rreg := REG_Spectrum_13_CONFIG_MIN_RD; 
		End If;
		if addr = x"00070005" then
			rreg := REG_Spectrum_13_CONFIG_MAX_RD; 
		End If;
		if addr = x"00090000" then
			rreg := REG_Spectrum_2_STATUS_RD; 
		End If;
		if addr = x"00090001" then
			rreg := REG_Spectrum_2_CONFIG_RD; 
		End If;
		if addr = x"00090002" then
			rreg := REG_Spectrum_2_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00090003" then
			rreg := REG_Spectrum_2_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00090004" then
			rreg := REG_Spectrum_2_CONFIG_MIN_RD; 
		End If;
		if addr = x"00090005" then
			rreg := REG_Spectrum_2_CONFIG_MAX_RD; 
		End If;
		if addr = x"000B0000" then
			rreg := REG_Spectrum_14_STATUS_RD; 
		End If;
		if addr = x"000B0001" then
			rreg := REG_Spectrum_14_CONFIG_RD; 
		End If;
		if addr = x"000B0002" then
			rreg := REG_Spectrum_14_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"000B0003" then
			rreg := REG_Spectrum_14_CONFIG_REBIN_RD; 
		End If;
		if addr = x"000B0004" then
			rreg := REG_Spectrum_14_CONFIG_MIN_RD; 
		End If;
		if addr = x"000B0005" then
			rreg := REG_Spectrum_14_CONFIG_MAX_RD; 
		End If;
		if addr = x"000D0000" then
			rreg := REG_Spectrum_3_STATUS_RD; 
		End If;
		if addr = x"000D0001" then
			rreg := REG_Spectrum_3_CONFIG_RD; 
		End If;
		if addr = x"000D0002" then
			rreg := REG_Spectrum_3_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"000D0003" then
			rreg := REG_Spectrum_3_CONFIG_REBIN_RD; 
		End If;
		if addr = x"000D0004" then
			rreg := REG_Spectrum_3_CONFIG_MIN_RD; 
		End If;
		if addr = x"000D0005" then
			rreg := REG_Spectrum_3_CONFIG_MAX_RD; 
		End If;
		if addr = x"000F0000" then
			rreg := REG_Spectrum_15_STATUS_RD; 
		End If;
		if addr = x"000F0001" then
			rreg := REG_Spectrum_15_CONFIG_RD; 
		End If;
		if addr = x"000F0002" then
			rreg := REG_Spectrum_15_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"000F0003" then
			rreg := REG_Spectrum_15_CONFIG_REBIN_RD; 
		End If;
		if addr = x"000F0004" then
			rreg := REG_Spectrum_15_CONFIG_MIN_RD; 
		End If;
		if addr = x"000F0005" then
			rreg := REG_Spectrum_15_CONFIG_MAX_RD; 
		End If;
		if addr = x"00110000" then
			rreg := REG_Spectrum_4_STATUS_RD; 
		End If;
		if addr = x"00110001" then
			rreg := REG_Spectrum_4_CONFIG_RD; 
		End If;
		if addr = x"00110002" then
			rreg := REG_Spectrum_4_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00110003" then
			rreg := REG_Spectrum_4_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00110004" then
			rreg := REG_Spectrum_4_CONFIG_MIN_RD; 
		End If;
		if addr = x"00110005" then
			rreg := REG_Spectrum_4_CONFIG_MAX_RD; 
		End If;
		if addr = x"00130000" then
			rreg := REG_Spectrum_16_STATUS_RD; 
		End If;
		if addr = x"00130001" then
			rreg := REG_Spectrum_16_CONFIG_RD; 
		End If;
		if addr = x"00130002" then
			rreg := REG_Spectrum_16_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00130003" then
			rreg := REG_Spectrum_16_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00130004" then
			rreg := REG_Spectrum_16_CONFIG_MIN_RD; 
		End If;
		if addr = x"00130005" then
			rreg := REG_Spectrum_16_CONFIG_MAX_RD; 
		End If;
		if addr = x"00150000" then
			rreg := REG_Spectrum_5_STATUS_RD; 
		End If;
		if addr = x"00150001" then
			rreg := REG_Spectrum_5_CONFIG_RD; 
		End If;
		if addr = x"00150002" then
			rreg := REG_Spectrum_5_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00150003" then
			rreg := REG_Spectrum_5_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00150004" then
			rreg := REG_Spectrum_5_CONFIG_MIN_RD; 
		End If;
		if addr = x"00150005" then
			rreg := REG_Spectrum_5_CONFIG_MAX_RD; 
		End If;
		if addr = x"00170000" then
			rreg := REG_Spectrum_17_STATUS_RD; 
		End If;
		if addr = x"00170001" then
			rreg := REG_Spectrum_17_CONFIG_RD; 
		End If;
		if addr = x"00170002" then
			rreg := REG_Spectrum_17_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00170003" then
			rreg := REG_Spectrum_17_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00170004" then
			rreg := REG_Spectrum_17_CONFIG_MIN_RD; 
		End If;
		if addr = x"00170005" then
			rreg := REG_Spectrum_17_CONFIG_MAX_RD; 
		End If;
		if addr = x"00170008" then
			rreg := REG_top_0_RD; 
		End If;
		if addr = x"00170009" then
			rreg := REG_top_1_RD; 
		End If;
		if addr = x"0017000A" then
			rreg := REG_top_2_RD; 
		End If;
		if addr = x"0017000B" then
			rreg := REG_top_3_RD; 
		End If;
		if addr = x"0017000C" then
			rreg := REG_top_4_RD; 
		End If;
		if addr = x"0017000D" then
			rreg := REG_top_5_RD; 
		End If;
		if addr = x"0017000E" then
			rreg := REG_top_6_RD; 
		End If;
		if addr = x"0017000F" then
			rreg := REG_top_7_RD; 
		End If;
		if addr = x"00170010" then
			rreg := REG_top_8_RD; 
		End If;
		if addr = x"00170011" then
			rreg := REG_top_9_RD; 
		End If;
		if addr = x"00170012" then
			rreg := REG_top_10_RD; 
		End If;
		if addr = x"00170013" then
			rreg := REG_top_11_RD; 
		End If;
		if addr = x"00170014" then
			rreg := REG_top_12_RD; 
		End If;
		if addr = x"00170015" then
			rreg := REG_top_13_RD; 
		End If;
		if addr = x"00170016" then
			rreg := REG_top_14_RD; 
		End If;
		if addr = x"00170017" then
			rreg := REG_top_15_RD; 
		End If;
		if addr = x"00170018" then
			rreg := REG_top_16_RD; 
		End If;
		if addr = x"00170019" then
			rreg := REG_top_17_RD; 
		End If;
		if addr = x"0017001A" then
			rreg := REG_top_18_RD; 
		End If;
		if addr = x"0017001B" then
			rreg := REG_top_19_RD; 
		End If;
		if addr = x"0017001C" then
			rreg := REG_top_20_RD; 
		End If;
		if addr = x"0017001D" then
			rreg := REG_top_21_RD; 
		End If;
		if addr = x"0017001E" then
			rreg := REG_top_22_RD; 
		End If;
		if addr = x"0017001F" then
			rreg := REG_top_23_RD; 
		End If;
		if addr = x"00170020" then
			rreg := REG_top_24_RD; 
		End If;
		if addr = x"00170021" then
			rreg := REG_top_25_RD; 
		End If;
		if addr = x"00170022" then
			rreg := REG_top_26_RD; 
		End If;
		if addr = x"00170023" then
			rreg := REG_top_27_RD; 
		End If;
		if addr = x"00170024" then
			rreg := REG_top_28_RD; 
		End If;
		if addr = x"00170025" then
			rreg := REG_top_29_RD; 
		End If;
		if addr = x"00170026" then
			rreg := REG_top_30_RD; 
		End If;
		if addr = x"00170027" then
			rreg := REG_top_31_RD; 
		End If;
		if addr = x"00190000" then
			rreg := REG_Spectrum_6_STATUS_RD; 
		End If;
		if addr = x"00190001" then
			rreg := REG_Spectrum_6_CONFIG_RD; 
		End If;
		if addr = x"00190002" then
			rreg := REG_Spectrum_6_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00190003" then
			rreg := REG_Spectrum_6_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00190004" then
			rreg := REG_Spectrum_6_CONFIG_MIN_RD; 
		End If;
		if addr = x"00190005" then
			rreg := REG_Spectrum_6_CONFIG_MAX_RD; 
		End If;
		if addr = x"001B0000" then
			rreg := REG_Spectrum_18_STATUS_RD; 
		End If;
		if addr = x"001B0001" then
			rreg := REG_Spectrum_18_CONFIG_RD; 
		End If;
		if addr = x"001B0002" then
			rreg := REG_Spectrum_18_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"001B0003" then
			rreg := REG_Spectrum_18_CONFIG_REBIN_RD; 
		End If;
		if addr = x"001B0004" then
			rreg := REG_Spectrum_18_CONFIG_MIN_RD; 
		End If;
		if addr = x"001B0005" then
			rreg := REG_Spectrum_18_CONFIG_MAX_RD; 
		End If;
		if addr = x"001B0008" then
			rreg := REG_disable_det_0_RD; 
		End If;
		if addr = x"001B0009" then
			rreg := REG_disable_det_1_RD; 
		End If;
		if addr = x"001B000A" then
			rreg := REG_disable_det_2_RD; 
		End If;
		if addr = x"001B000B" then
			rreg := REG_disable_det_3_RD; 
		End If;
		if addr = x"001B000C" then
			rreg := REG_disable_det_4_RD; 
		End If;
		if addr = x"001B000D" then
			rreg := REG_disable_det_5_RD; 
		End If;
		if addr = x"001B000E" then
			rreg := REG_disable_det_6_RD; 
		End If;
		if addr = x"001B000F" then
			rreg := REG_disable_det_7_RD; 
		End If;
		if addr = x"001B0010" then
			rreg := REG_disable_det_8_RD; 
		End If;
		if addr = x"001B0011" then
			rreg := REG_disable_det_9_RD; 
		End If;
		if addr = x"001B0012" then
			rreg := REG_disable_det_10_RD; 
		End If;
		if addr = x"001B0013" then
			rreg := REG_disable_det_11_RD; 
		End If;
		if addr = x"001B0014" then
			rreg := REG_disable_det_12_RD; 
		End If;
		if addr = x"001B0015" then
			rreg := REG_disable_det_13_RD; 
		End If;
		if addr = x"001B0016" then
			rreg := REG_disable_det_14_RD; 
		End If;
		if addr = x"001B0017" then
			rreg := REG_disable_det_15_RD; 
		End If;
		if addr = x"001B0018" then
			rreg := REG_disable_det_16_RD; 
		End If;
		if addr = x"001B0019" then
			rreg := REG_disable_det_17_RD; 
		End If;
		if addr = x"001B001A" then
			rreg := REG_disable_det_18_RD; 
		End If;
		if addr = x"001B001B" then
			rreg := REG_disable_det_19_RD; 
		End If;
		if addr = x"001B001C" then
			rreg := REG_disable_det_20_RD; 
		End If;
		if addr = x"001B001D" then
			rreg := REG_disable_det_21_RD; 
		End If;
		if addr = x"001B001E" then
			rreg := REG_disable_det_22_RD; 
		End If;
		if addr = x"001B001F" then
			rreg := REG_disable_det_23_RD; 
		End If;
		if addr = x"001B0020" then
			rreg := REG_disable_det_24_RD; 
		End If;
		if addr = x"001B0021" then
			rreg := REG_disable_det_25_RD; 
		End If;
		if addr = x"001B0022" then
			rreg := REG_disable_det_26_RD; 
		End If;
		if addr = x"001B0023" then
			rreg := REG_disable_det_27_RD; 
		End If;
		if addr = x"001B0024" then
			rreg := REG_disable_det_28_RD; 
		End If;
		if addr = x"001B0025" then
			rreg := REG_disable_det_29_RD; 
		End If;
		if addr = x"001B0026" then
			rreg := REG_disable_det_30_RD; 
		End If;
		if addr = x"001B0027" then
			rreg := REG_disable_det_31_RD; 
		End If;
		if addr = x"001D0000" then
			rreg := REG_Spectrum_7_STATUS_RD; 
		End If;
		if addr = x"001D0001" then
			rreg := REG_Spectrum_7_CONFIG_RD; 
		End If;
		if addr = x"001D0002" then
			rreg := REG_Spectrum_7_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"001D0003" then
			rreg := REG_Spectrum_7_CONFIG_REBIN_RD; 
		End If;
		if addr = x"001D0004" then
			rreg := REG_Spectrum_7_CONFIG_MIN_RD; 
		End If;
		if addr = x"001D0005" then
			rreg := REG_Spectrum_7_CONFIG_MAX_RD; 
		End If;
		if addr = x"001F0000" then
			rreg := REG_Spectrum_19_STATUS_RD; 
		End If;
		if addr = x"001F0001" then
			rreg := REG_Spectrum_19_CONFIG_RD; 
		End If;
		if addr = x"001F0002" then
			rreg := REG_Spectrum_19_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"001F0003" then
			rreg := REG_Spectrum_19_CONFIG_REBIN_RD; 
		End If;
		if addr = x"001F0004" then
			rreg := REG_Spectrum_19_CONFIG_MIN_RD; 
		End If;
		if addr = x"001F0005" then
			rreg := REG_Spectrum_19_CONFIG_MAX_RD; 
		End If;
		if addr = x"00210000" then
			rreg := REG_Spectrum_8_STATUS_RD; 
		End If;
		if addr = x"00210001" then
			rreg := REG_Spectrum_8_CONFIG_RD; 
		End If;
		if addr = x"00210002" then
			rreg := REG_Spectrum_8_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00210003" then
			rreg := REG_Spectrum_8_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00210004" then
			rreg := REG_Spectrum_8_CONFIG_MIN_RD; 
		End If;
		if addr = x"00210005" then
			rreg := REG_Spectrum_8_CONFIG_MAX_RD; 
		End If;
		if addr = x"00230000" then
			rreg := REG_Spectrum_20_STATUS_RD; 
		End If;
		if addr = x"00230001" then
			rreg := REG_Spectrum_20_CONFIG_RD; 
		End If;
		if addr = x"00230002" then
			rreg := REG_Spectrum_20_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00230003" then
			rreg := REG_Spectrum_20_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00230004" then
			rreg := REG_Spectrum_20_CONFIG_MIN_RD; 
		End If;
		if addr = x"00230005" then
			rreg := REG_Spectrum_20_CONFIG_MAX_RD; 
		End If;
		if addr = x"00250000" then
			rreg := REG_Spectrum_9_STATUS_RD; 
		End If;
		if addr = x"00250001" then
			rreg := REG_Spectrum_9_CONFIG_RD; 
		End If;
		if addr = x"00250002" then
			rreg := REG_Spectrum_9_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00250003" then
			rreg := REG_Spectrum_9_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00250004" then
			rreg := REG_Spectrum_9_CONFIG_MIN_RD; 
		End If;
		if addr = x"00250005" then
			rreg := REG_Spectrum_9_CONFIG_MAX_RD; 
		End If;
		if addr = x"00270000" then
			rreg := REG_Spectrum_21_STATUS_RD; 
		End If;
		if addr = x"00270001" then
			rreg := REG_Spectrum_21_CONFIG_RD; 
		End If;
		if addr = x"00270002" then
			rreg := REG_Spectrum_21_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00270003" then
			rreg := REG_Spectrum_21_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00270004" then
			rreg := REG_Spectrum_21_CONFIG_MIN_RD; 
		End If;
		if addr = x"00270005" then
			rreg := REG_Spectrum_21_CONFIG_MAX_RD; 
		End If;
		if addr = x"00290000" then
			rreg := REG_Spectrum_10_STATUS_RD; 
		End If;
		if addr = x"00290001" then
			rreg := REG_Spectrum_10_CONFIG_RD; 
		End If;
		if addr = x"00290002" then
			rreg := REG_Spectrum_10_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00290003" then
			rreg := REG_Spectrum_10_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00290004" then
			rreg := REG_Spectrum_10_CONFIG_MIN_RD; 
		End If;
		if addr = x"00290005" then
			rreg := REG_Spectrum_10_CONFIG_MAX_RD; 
		End If;
		if addr = x"002B0000" then
			rreg := REG_Spectrum_22_STATUS_RD; 
		End If;
		if addr = x"002B0001" then
			rreg := REG_Spectrum_22_CONFIG_RD; 
		End If;
		if addr = x"002B0002" then
			rreg := REG_Spectrum_22_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"002B0003" then
			rreg := REG_Spectrum_22_CONFIG_REBIN_RD; 
		End If;
		if addr = x"002B0004" then
			rreg := REG_Spectrum_22_CONFIG_MIN_RD; 
		End If;
		if addr = x"002B0005" then
			rreg := REG_Spectrum_22_CONFIG_MAX_RD; 
		End If;
		if addr = x"002D0000" then
			rreg := REG_Spectrum_11_STATUS_RD; 
		End If;
		if addr = x"002D0001" then
			rreg := REG_Spectrum_11_CONFIG_RD; 
		End If;
		if addr = x"002D0002" then
			rreg := REG_Spectrum_11_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"002D0003" then
			rreg := REG_Spectrum_11_CONFIG_REBIN_RD; 
		End If;
		if addr = x"002D0004" then
			rreg := REG_Spectrum_11_CONFIG_MIN_RD; 
		End If;
		if addr = x"002D0005" then
			rreg := REG_Spectrum_11_CONFIG_MAX_RD; 
		End If;
		if addr = x"002F0000" then
			rreg := REG_Spectrum_23_STATUS_RD; 
		End If;
		if addr = x"002F0001" then
			rreg := REG_Spectrum_23_CONFIG_RD; 
		End If;
		if addr = x"002F0002" then
			rreg := REG_Spectrum_23_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"002F0003" then
			rreg := REG_Spectrum_23_CONFIG_REBIN_RD; 
		End If;
		if addr = x"002F0004" then
			rreg := REG_Spectrum_23_CONFIG_MIN_RD; 
		End If;
		if addr = x"002F0005" then
			rreg := REG_Spectrum_23_CONFIG_MAX_RD; 
		End If;
		if addr = x"002F0008" then
			rreg := REG_base_0_RD; 
		End If;
		if addr = x"002F0009" then
			rreg := REG_base_1_RD; 
		End If;
		if addr = x"002F000A" then
			rreg := REG_base_2_RD; 
		End If;
		if addr = x"002F000B" then
			rreg := REG_base_3_RD; 
		End If;
		if addr = x"002F000C" then
			rreg := REG_base_4_RD; 
		End If;
		if addr = x"002F000D" then
			rreg := REG_base_5_RD; 
		End If;
		if addr = x"002F000E" then
			rreg := REG_base_6_RD; 
		End If;
		if addr = x"002F000F" then
			rreg := REG_base_7_RD; 
		End If;
		if addr = x"002F0010" then
			rreg := REG_base_8_RD; 
		End If;
		if addr = x"002F0011" then
			rreg := REG_base_9_RD; 
		End If;
		if addr = x"002F0012" then
			rreg := REG_base_10_RD; 
		End If;
		if addr = x"002F0013" then
			rreg := REG_base_11_RD; 
		End If;
		if addr = x"002F0014" then
			rreg := REG_base_12_RD; 
		End If;
		if addr = x"002F0015" then
			rreg := REG_base_13_RD; 
		End If;
		if addr = x"002F0016" then
			rreg := REG_base_14_RD; 
		End If;
		if addr = x"002F0017" then
			rreg := REG_base_15_RD; 
		End If;
		if addr = x"002F0018" then
			rreg := REG_base_16_RD; 
		End If;
		if addr = x"002F0019" then
			rreg := REG_base_17_RD; 
		End If;
		if addr = x"002F001A" then
			rreg := REG_base_18_RD; 
		End If;
		if addr = x"002F001B" then
			rreg := REG_base_19_RD; 
		End If;
		if addr = x"002F001C" then
			rreg := REG_base_20_RD; 
		End If;
		if addr = x"002F001D" then
			rreg := REG_base_21_RD; 
		End If;
		if addr = x"002F001E" then
			rreg := REG_base_22_RD; 
		End If;
		if addr = x"002F001F" then
			rreg := REG_base_23_RD; 
		End If;
		if addr = x"002F0020" then
			rreg := REG_base_24_RD; 
		End If;
		if addr = x"002F0021" then
			rreg := REG_base_25_RD; 
		End If;
		if addr = x"002F0022" then
			rreg := REG_base_26_RD; 
		End If;
		if addr = x"002F0023" then
			rreg := REG_base_27_RD; 
		End If;
		if addr = x"002F0024" then
			rreg := REG_base_28_RD; 
		End If;
		if addr = x"002F0025" then
			rreg := REG_base_29_RD; 
		End If;
		if addr = x"002F0026" then
			rreg := REG_base_30_RD; 
		End If;
		if addr = x"002F0027" then
			rreg := REG_base_31_RD; 
		End If;
		if addr = x"002F0028" then
			rreg := REG_int_time_RD; 
		End If;
		if addr = x"002F0029" then
			rreg := REG_pre_int_RD; 
		End If;
		if addr = x"002F002A" then
			rreg := REG_baseline_RD; 
		End If;
		if addr = x"002F002B" then
			rreg := REG_write_RD; 
		End If;
		if addr = x"002F002C" then
			rreg := REG_read_RD; 
		End If;
		if addr = x"002F002D" then
			rreg := REG_stopwrite_RD; 
		End If;
		if addr = x"002F002E" then
			rreg := REG_gate_l_RD; 
		End If;
		if addr = x"002F002F" then
			rreg := REG_gate_u_RD; 
		End If;
		if addr = x"002F0030" then
			rreg := REG_inhib_RD; 
		End If;
		if addr = x"002F0031" then
			rreg := REG_delay_RD; 
		End If;
		if addr = x"002F0032" then
			rreg := REG_polarity_RD; 
		End If;
		if addr = x"002F0033" then
			rreg := REG_skip_RD; 
		End If;
		if addr = x"002F0034" then
			rreg := REG_full_RD; 
		End If;
		if addr = x"002F0035" then
			rreg := REG_timestamp_RD; 
		End If;
		if addr = x"002F0036" then
			rreg := REG_trigger_code_RD; 
		End If;
		if addr = x"002F0037" then
			rreg := REG_reset_RD; 
		End If;
		if addr = x"002F003A" then
			rreg := REG_All_Energies_READ_STATUS_RD; 
		End If;
		if addr = x"002F003B" then
			rreg := REG_All_Energies_READ_VALID_WORDS_RD; 
		End If;
		if addr = x"002F003C" then
			rreg := REG_All_Energies_CONFIG_RD; 
		End If;
		if addr = x"00312000" then
			rreg := REG_Syncs_READ_STATUS_RD; 
		End If;
		if addr = x"00312001" then
			rreg := REG_Syncs_READ_POSITION_RD; 
		End If;
		if addr = x"00312002" then
			rreg := REG_Syncs_CONFIG_TRIGGER_MODE_RD; 
		End If;
		if addr = x"00312003" then
			rreg := REG_Syncs_CONFIG_PRETRIGGER_RD; 
		End If;
		if addr = x"00312004" then
			rreg := REG_Syncs_CONFIG_TRIGGER_LEVEL_RD; 
		End If;
		if addr = x"00312005" then
			rreg := REG_Syncs_CONFIG_ARM_RD; 
		End If;
		if addr = x"00312006" then
			rreg := REG_Syncs_CONFIG_DECIMATOR_RD; 
		End If;
		if addr = x"006C0000" then
			rreg := REG_sync0_between_sync2_RD; 
		End If;
		if addr = x"006D0000" then
			rreg := REG_Oscilloscope_0_READ_STATUS_RD; 
		End If;
		if addr = x"006D0001" then
			rreg := REG_Oscilloscope_0_READ_POSITION_RD; 
		End If;
		if addr = x"006D0002" then
			rreg := REG_Oscilloscope_0_CONFIG_TRIGGER_MODE_RD; 
		End If;
		if addr = x"006D0003" then
			rreg := REG_Oscilloscope_0_CONFIG_PRETRIGGER_RD; 
		End If;
		if addr = x"006D0004" then
			rreg := REG_Oscilloscope_0_CONFIG_TRIGGER_LEVEL_RD; 
		End If;
		if addr = x"006D0005" then
			rreg := REG_Oscilloscope_0_CONFIG_ARM_RD; 
		End If;
		if addr = x"006D0006" then
			rreg := REG_Oscilloscope_0_CONFIG_DECIMATOR_RD; 
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
