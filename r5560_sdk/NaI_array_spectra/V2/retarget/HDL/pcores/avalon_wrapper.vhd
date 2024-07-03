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
	BUS_REGFILE_0_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_REGFILE_0_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_REGFILE_0_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_REGFILE_0_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_REGFILE_0_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_REGFILE_0_pol_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_REGFILE_0_pol_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_REGFILE_0_pol_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_REGFILE_0_lo_thrs_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_REGFILE_0_lo_thrs_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_REGFILE_0_lo_thrs_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_REGFILE_0_hi_thrs_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_REGFILE_0_hi_thrs_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_REGFILE_0_hi_thrs_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_REGFILE_0_gate_l_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_REGFILE_0_gate_l_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_REGFILE_0_gate_l_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_REGFILE_0_gate_u_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_REGFILE_0_gate_u_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_REGFILE_0_gate_u_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_REGFILE_0_delay_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_REGFILE_0_delay_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_REGFILE_0_delay_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_REGFILE_0_xdelay_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_REGFILE_0_xdelay_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_REGFILE_0_xdelay_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_REGFILE_0_inhib_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_REGFILE_0_inhib_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_REGFILE_0_inhib_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_INTEGRATION_REGS_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_INTEGRATION_REGS_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_INTEGRATION_REGS_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_INTEGRATION_REGS_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_INTEGRATION_REGS_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_INTEGRATION_REGS_inttime_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_INTEGRATION_REGS_inttime_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_INTEGRATION_REGS_inttime_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_INTEGRATION_REGS_preint_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_INTEGRATION_REGS_preint_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_INTEGRATION_REGS_preint_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_INTEGRATION_REGS_gain_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_INTEGRATION_REGS_gain_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_INTEGRATION_REGS_gain_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_INTEGRATION_REGS_ofs_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_INTEGRATION_REGS_ofs_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_INTEGRATION_REGS_ofs_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_INTEGRATION_REGS_bl_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_INTEGRATION_REGS_bl_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_INTEGRATION_REGS_bl_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_INTEGRATION_REGS_pileup_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_INTEGRATION_REGS_pileup_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_INTEGRATION_REGS_pileup_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH18_spectrum_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_CH18_spectrum_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH18_spectrum_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH18_spectrum_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH18_spectrum_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH18_spectrum_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH18_spectrum_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH18_spectrum_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH18_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH18_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH18_spectrum_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH18_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH18_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH18_spectrum_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH18_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH18_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH18_spectrum_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH18_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH18_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH18_spectrum_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH18_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH18_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH18_spectrum_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH7_spectrum_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_CH7_spectrum_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH7_spectrum_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH7_spectrum_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH7_spectrum_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH7_spectrum_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH7_spectrum_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH7_spectrum_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH7_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH7_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH7_spectrum_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH7_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH7_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH7_spectrum_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH7_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH7_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH7_spectrum_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH7_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH7_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH7_spectrum_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH7_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH7_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH7_spectrum_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH9_spectrum_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_CH9_spectrum_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH9_spectrum_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH9_spectrum_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH9_spectrum_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH9_spectrum_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH9_spectrum_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH9_spectrum_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH9_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH9_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH9_spectrum_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH9_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH9_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH9_spectrum_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH9_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH9_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH9_spectrum_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH9_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH9_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH9_spectrum_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH9_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH9_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH9_spectrum_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH10_spectrum_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_CH10_spectrum_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH10_spectrum_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH10_spectrum_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH10_spectrum_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH10_spectrum_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH10_spectrum_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH10_spectrum_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH10_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH10_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH10_spectrum_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH10_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH10_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH10_spectrum_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH10_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH10_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH10_spectrum_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH10_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH10_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH10_spectrum_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH10_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH10_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH10_spectrum_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH11_spectrum_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_CH11_spectrum_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH11_spectrum_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH11_spectrum_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH11_spectrum_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH11_spectrum_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH11_spectrum_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH11_spectrum_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH11_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH11_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH11_spectrum_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH11_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH11_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH11_spectrum_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH11_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH11_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH11_spectrum_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH11_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH11_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH11_spectrum_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH11_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH11_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH11_spectrum_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH12_spectrum_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_CH12_spectrum_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH12_spectrum_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH12_spectrum_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH12_spectrum_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH12_spectrum_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH12_spectrum_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH12_spectrum_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH12_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH12_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH12_spectrum_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH12_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH12_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH12_spectrum_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH12_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH12_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH12_spectrum_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH12_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH12_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH12_spectrum_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH12_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH12_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH12_spectrum_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH1_spectrum_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_CH1_spectrum_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH1_spectrum_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH1_spectrum_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH1_spectrum_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH1_spectrum_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH1_spectrum_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH1_spectrum_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH1_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH1_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH1_spectrum_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH1_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH1_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH1_spectrum_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH1_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH1_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH1_spectrum_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH1_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH1_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH1_spectrum_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH1_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH1_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH1_spectrum_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH2_spectrum_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_CH2_spectrum_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH2_spectrum_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH2_spectrum_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH2_spectrum_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH2_spectrum_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH2_spectrum_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH2_spectrum_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH2_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH2_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH2_spectrum_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH2_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH2_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH2_spectrum_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH2_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH2_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH2_spectrum_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH2_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH2_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH2_spectrum_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH2_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH2_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH2_spectrum_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH3_spectrum_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_CH3_spectrum_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH3_spectrum_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH3_spectrum_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH3_spectrum_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH3_spectrum_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH3_spectrum_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH3_spectrum_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH3_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH3_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH3_spectrum_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH3_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH3_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH3_spectrum_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH3_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH3_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH3_spectrum_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH3_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH3_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH3_spectrum_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH3_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH3_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH3_spectrum_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH4_spectrum_READ_ADDRESS : OUT STD_LOGIC_VECTOR(15 downto 0); 
	BUS_CH4_spectrum_READ_DATA : IN STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH4_spectrum_WRITE_DATA : OUT STD_LOGIC_VECTOR(31 downto 0); 
	BUS_CH4_spectrum_W_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH4_spectrum_R_INT : OUT STD_LOGIC_VECTOR(0 downto 0); 
	BUS_CH4_spectrum_VLD : IN STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH4_spectrum_STATUS_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH4_spectrum_STATUS_RD : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH4_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH4_spectrum_CONFIG_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH4_spectrum_CONFIG_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH4_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH4_spectrum_CONFIG_LIMIT_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH4_spectrum_CONFIG_LIMIT_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH4_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH4_spectrum_CONFIG_REBIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH4_spectrum_CONFIG_REBIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH4_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH4_spectrum_CONFIG_MIN_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH4_spectrum_CONFIG_MIN_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
		REG_CH4_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(31 downto 0); 
		INT_CH4_spectrum_CONFIG_MAX_WR : OUT STD_LOGIC_VECTOR(0 downto 0); 
		REG_CH4_spectrum_CONFIG_MAX_RD : IN STD_LOGIC_VECTOR(31 downto 0); 
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
    
BUS_CH18_spectrum_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00010000" And addr < x"00020000") else '0';
BUS_CH18_spectrum_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00010000" And addr < x"00020000") else (others => '0');BUS_CH7_spectrum_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00030000" And addr < x"00040000") else '0';
BUS_CH7_spectrum_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00030000" And addr < x"00040000") else (others => '0');BUS_CH9_spectrum_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00050000" And addr < x"00060000") else '0';
BUS_CH9_spectrum_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00050000" And addr < x"00060000") else (others => '0');BUS_CH10_spectrum_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00070000" And addr < x"00080000") else '0';
BUS_CH10_spectrum_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00070000" And addr < x"00080000") else (others => '0');BUS_CH11_spectrum_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00090000" And addr < x"000A0000") else '0';
BUS_CH11_spectrum_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00090000" And addr < x"000A0000") else (others => '0');BUS_CH12_spectrum_R_INT(0) <= f_BUS_INT_RD when (addr >= x"000B0000" And addr < x"000C0000") else '0';
BUS_CH12_spectrum_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"000B0000" And addr < x"000C0000") else (others => '0');BUS_CH1_spectrum_R_INT(0) <= f_BUS_INT_RD when (addr >= x"000D0000" And addr < x"000E0000") else '0';
BUS_CH1_spectrum_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"000D0000" And addr < x"000E0000") else (others => '0');BUS_CH2_spectrum_R_INT(0) <= f_BUS_INT_RD when (addr >= x"000F0000" And addr < x"00100000") else '0';
BUS_CH2_spectrum_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"000F0000" And addr < x"00100000") else (others => '0');BUS_CH3_spectrum_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00110000" And addr < x"00120000") else '0';
BUS_CH3_spectrum_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00110000" And addr < x"00120000") else (others => '0');BUS_CH4_spectrum_R_INT(0) <= f_BUS_INT_RD when (addr >= x"00130000" And addr < x"00140000") else '0';
BUS_CH4_spectrum_READ_ADDRESS <= BUS_ADDR(15 downto 0) when (addr >= x"00130000" And addr < x"00140000") else (others => '0');
f_BUS_DATA_RD <= BUS_Test_0_READ_DATA when  (addr >= x"03FE0000" And addr < x"03FEFFFF") else 
BUS_CH18_spectrum_READ_DATA  when  addr >= x"00010000" and addr < x"00020000" else 
BUS_CH7_spectrum_READ_DATA  when  addr >= x"00030000" and addr < x"00040000" else 
BUS_CH9_spectrum_READ_DATA  when  addr >= x"00050000" and addr < x"00060000" else 
BUS_CH10_spectrum_READ_DATA  when  addr >= x"00070000" and addr < x"00080000" else 
BUS_CH11_spectrum_READ_DATA  when  addr >= x"00090000" and addr < x"000A0000" else 
BUS_CH12_spectrum_READ_DATA  when  addr >= x"000B0000" and addr < x"000C0000" else 
BUS_CH1_spectrum_READ_DATA  when  addr >= x"000D0000" and addr < x"000E0000" else 
BUS_CH2_spectrum_READ_DATA  when  addr >= x"000F0000" and addr < x"00100000" else 
BUS_CH3_spectrum_READ_DATA  when  addr >= x"00110000" and addr < x"00120000" else 
BUS_CH4_spectrum_READ_DATA  when  addr >= x"00130000" and addr < x"00140000" else 
 f_BUS_DATA_RD_REG;
 f_BUS_DATASTROBE <=BUS_Test_0_VLD(0) when  (addr >= x"03FE0000" And addr < x"03FEFFFF") else 
 BUS_CH18_spectrum_VLD(0) when  addr >= x"00010000" and addr < x"00020000" else 
 BUS_CH7_spectrum_VLD(0) when  addr >= x"00030000" and addr < x"00040000" else 
 BUS_CH9_spectrum_VLD(0) when  addr >= x"00050000" and addr < x"00060000" else 
 BUS_CH10_spectrum_VLD(0) when  addr >= x"00070000" and addr < x"00080000" else 
 BUS_CH11_spectrum_VLD(0) when  addr >= x"00090000" and addr < x"000A0000" else 
 BUS_CH12_spectrum_VLD(0) when  addr >= x"000B0000" and addr < x"000C0000" else 
 BUS_CH1_spectrum_VLD(0) when  addr >= x"000D0000" and addr < x"000E0000" else 
 BUS_CH2_spectrum_VLD(0) when  addr >= x"000F0000" and addr < x"00100000" else 
 BUS_CH3_spectrum_VLD(0) when  addr >= x"00110000" and addr < x"00120000" else 
 BUS_CH4_spectrum_VLD(0) when  addr >= x"00130000" and addr < x"00140000" else 
 f_BUS_DATASTROBE_REG;    

        
    addr <= BUS_ADDR;
    wreg <= f_BUS_DATA_WR;
        
        register_manager : process(clk)
            variable rreg    :  STD_LOGIC_VECTOR(31 downto 0);
        begin
            if reset='1' then
--                	BUS_REGFILE_0_W_INT <= "0";
		REG_REGFILE_0_pol_WR <= (others => '0');
		INT_REGFILE_0_pol_WR <= "0";
		REG_REGFILE_0_lo_thrs_WR <= (others => '0');
		INT_REGFILE_0_lo_thrs_WR <= "0";
		REG_REGFILE_0_hi_thrs_WR <= (others => '0');
		INT_REGFILE_0_hi_thrs_WR <= "0";
		REG_REGFILE_0_gate_l_WR <= (others => '0');
		INT_REGFILE_0_gate_l_WR <= "0";
		REG_REGFILE_0_gate_u_WR <= (others => '0');
		INT_REGFILE_0_gate_u_WR <= "0";
		REG_REGFILE_0_delay_WR <= (others => '0');
		INT_REGFILE_0_delay_WR <= "0";
		REG_REGFILE_0_xdelay_WR <= (others => '0');
		INT_REGFILE_0_xdelay_WR <= "0";
		REG_REGFILE_0_inhib_WR <= (others => '0');
		INT_REGFILE_0_inhib_WR <= "0";
	BUS_INTEGRATION_REGS_W_INT <= "0";
		REG_INTEGRATION_REGS_inttime_WR <= (others => '0');
		INT_INTEGRATION_REGS_inttime_WR <= "0";
		REG_INTEGRATION_REGS_preint_WR <= (others => '0');
		INT_INTEGRATION_REGS_preint_WR <= "0";
		REG_INTEGRATION_REGS_gain_WR <= (others => '0');
		INT_INTEGRATION_REGS_gain_WR <= "0";
		REG_INTEGRATION_REGS_ofs_WR <= (others => '0');
		INT_INTEGRATION_REGS_ofs_WR <= "0";
		REG_INTEGRATION_REGS_bl_WR <= (others => '0');
		INT_INTEGRATION_REGS_bl_WR <= "0";
		REG_INTEGRATION_REGS_pileup_WR <= (others => '0');
		INT_INTEGRATION_REGS_pileup_WR <= "0";
	BUS_CH18_spectrum_W_INT <= "0";
		INT_CH18_spectrum_STATUS_RD <= "0";
		REG_CH18_spectrum_CONFIG_WR <= (others => '0');
		INT_CH18_spectrum_CONFIG_WR <= "0";
		REG_CH18_spectrum_CONFIG_LIMIT_WR <= (others => '0');
		INT_CH18_spectrum_CONFIG_LIMIT_WR <= "0";
		REG_CH18_spectrum_CONFIG_REBIN_WR <= (others => '0');
		INT_CH18_spectrum_CONFIG_REBIN_WR <= "0";
		REG_CH18_spectrum_CONFIG_MIN_WR <= (others => '0');
		INT_CH18_spectrum_CONFIG_MIN_WR <= "0";
		REG_CH18_spectrum_CONFIG_MAX_WR <= (others => '0');
		INT_CH18_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH7_spectrum_W_INT <= "0";
		INT_CH7_spectrum_STATUS_RD <= "0";
		REG_CH7_spectrum_CONFIG_WR <= (others => '0');
		INT_CH7_spectrum_CONFIG_WR <= "0";
		REG_CH7_spectrum_CONFIG_LIMIT_WR <= (others => '0');
		INT_CH7_spectrum_CONFIG_LIMIT_WR <= "0";
		REG_CH7_spectrum_CONFIG_REBIN_WR <= (others => '0');
		INT_CH7_spectrum_CONFIG_REBIN_WR <= "0";
		REG_CH7_spectrum_CONFIG_MIN_WR <= (others => '0');
		INT_CH7_spectrum_CONFIG_MIN_WR <= "0";
		REG_CH7_spectrum_CONFIG_MAX_WR <= (others => '0');
		INT_CH7_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH9_spectrum_W_INT <= "0";
		INT_CH9_spectrum_STATUS_RD <= "0";
		REG_CH9_spectrum_CONFIG_WR <= (others => '0');
		INT_CH9_spectrum_CONFIG_WR <= "0";
		REG_CH9_spectrum_CONFIG_LIMIT_WR <= (others => '0');
		INT_CH9_spectrum_CONFIG_LIMIT_WR <= "0";
		REG_CH9_spectrum_CONFIG_REBIN_WR <= (others => '0');
		INT_CH9_spectrum_CONFIG_REBIN_WR <= "0";
		REG_CH9_spectrum_CONFIG_MIN_WR <= (others => '0');
		INT_CH9_spectrum_CONFIG_MIN_WR <= "0";
		REG_CH9_spectrum_CONFIG_MAX_WR <= (others => '0');
		INT_CH9_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH10_spectrum_W_INT <= "0";
		INT_CH10_spectrum_STATUS_RD <= "0";
		REG_CH10_spectrum_CONFIG_WR <= (others => '0');
		INT_CH10_spectrum_CONFIG_WR <= "0";
		REG_CH10_spectrum_CONFIG_LIMIT_WR <= (others => '0');
		INT_CH10_spectrum_CONFIG_LIMIT_WR <= "0";
		REG_CH10_spectrum_CONFIG_REBIN_WR <= (others => '0');
		INT_CH10_spectrum_CONFIG_REBIN_WR <= "0";
		REG_CH10_spectrum_CONFIG_MIN_WR <= (others => '0');
		INT_CH10_spectrum_CONFIG_MIN_WR <= "0";
		REG_CH10_spectrum_CONFIG_MAX_WR <= (others => '0');
		INT_CH10_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH11_spectrum_W_INT <= "0";
		INT_CH11_spectrum_STATUS_RD <= "0";
		REG_CH11_spectrum_CONFIG_WR <= (others => '0');
		INT_CH11_spectrum_CONFIG_WR <= "0";
		REG_CH11_spectrum_CONFIG_LIMIT_WR <= (others => '0');
		INT_CH11_spectrum_CONFIG_LIMIT_WR <= "0";
		REG_CH11_spectrum_CONFIG_REBIN_WR <= (others => '0');
		INT_CH11_spectrum_CONFIG_REBIN_WR <= "0";
		REG_CH11_spectrum_CONFIG_MIN_WR <= (others => '0');
		INT_CH11_spectrum_CONFIG_MIN_WR <= "0";
		REG_CH11_spectrum_CONFIG_MAX_WR <= (others => '0');
		INT_CH11_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH12_spectrum_W_INT <= "0";
		INT_CH12_spectrum_STATUS_RD <= "0";
		REG_CH12_spectrum_CONFIG_WR <= (others => '0');
		INT_CH12_spectrum_CONFIG_WR <= "0";
		REG_CH12_spectrum_CONFIG_LIMIT_WR <= (others => '0');
		INT_CH12_spectrum_CONFIG_LIMIT_WR <= "0";
		REG_CH12_spectrum_CONFIG_REBIN_WR <= (others => '0');
		INT_CH12_spectrum_CONFIG_REBIN_WR <= "0";
		REG_CH12_spectrum_CONFIG_MIN_WR <= (others => '0');
		INT_CH12_spectrum_CONFIG_MIN_WR <= "0";
		REG_CH12_spectrum_CONFIG_MAX_WR <= (others => '0');
		INT_CH12_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH1_spectrum_W_INT <= "0";
		INT_CH1_spectrum_STATUS_RD <= "0";
		REG_CH1_spectrum_CONFIG_WR <= (others => '0');
		INT_CH1_spectrum_CONFIG_WR <= "0";
		REG_CH1_spectrum_CONFIG_LIMIT_WR <= (others => '0');
		INT_CH1_spectrum_CONFIG_LIMIT_WR <= "0";
		REG_CH1_spectrum_CONFIG_REBIN_WR <= (others => '0');
		INT_CH1_spectrum_CONFIG_REBIN_WR <= "0";
		REG_CH1_spectrum_CONFIG_MIN_WR <= (others => '0');
		INT_CH1_spectrum_CONFIG_MIN_WR <= "0";
		REG_CH1_spectrum_CONFIG_MAX_WR <= (others => '0');
		INT_CH1_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH2_spectrum_W_INT <= "0";
		INT_CH2_spectrum_STATUS_RD <= "0";
		REG_CH2_spectrum_CONFIG_WR <= (others => '0');
		INT_CH2_spectrum_CONFIG_WR <= "0";
		REG_CH2_spectrum_CONFIG_LIMIT_WR <= (others => '0');
		INT_CH2_spectrum_CONFIG_LIMIT_WR <= "0";
		REG_CH2_spectrum_CONFIG_REBIN_WR <= (others => '0');
		INT_CH2_spectrum_CONFIG_REBIN_WR <= "0";
		REG_CH2_spectrum_CONFIG_MIN_WR <= (others => '0');
		INT_CH2_spectrum_CONFIG_MIN_WR <= "0";
		REG_CH2_spectrum_CONFIG_MAX_WR <= (others => '0');
		INT_CH2_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH3_spectrum_W_INT <= "0";
		INT_CH3_spectrum_STATUS_RD <= "0";
		REG_CH3_spectrum_CONFIG_WR <= (others => '0');
		INT_CH3_spectrum_CONFIG_WR <= "0";
		REG_CH3_spectrum_CONFIG_LIMIT_WR <= (others => '0');
		INT_CH3_spectrum_CONFIG_LIMIT_WR <= "0";
		REG_CH3_spectrum_CONFIG_REBIN_WR <= (others => '0');
		INT_CH3_spectrum_CONFIG_REBIN_WR <= "0";
		REG_CH3_spectrum_CONFIG_MIN_WR <= (others => '0');
		INT_CH3_spectrum_CONFIG_MIN_WR <= "0";
		REG_CH3_spectrum_CONFIG_MAX_WR <= (others => '0');
		INT_CH3_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH4_spectrum_W_INT <= "0";
		INT_CH4_spectrum_STATUS_RD <= "0";
		REG_CH4_spectrum_CONFIG_WR <= (others => '0');
		INT_CH4_spectrum_CONFIG_WR <= "0";
		REG_CH4_spectrum_CONFIG_LIMIT_WR <= (others => '0');
		INT_CH4_spectrum_CONFIG_LIMIT_WR <= "0";
		REG_CH4_spectrum_CONFIG_REBIN_WR <= (others => '0');
		INT_CH4_spectrum_CONFIG_REBIN_WR <= "0";
		REG_CH4_spectrum_CONFIG_MIN_WR <= (others => '0');
		INT_CH4_spectrum_CONFIG_MIN_WR <= "0";
		REG_CH4_spectrum_CONFIG_MAX_WR <= (others => '0');
		INT_CH4_spectrum_CONFIG_MAX_WR <= "0";
            
                f_BUS_DATASTROBE_REG <= '0';
                M_AVALON_0_readdatavalid <= '0';
            elsif rising_edge(clk) then
            
            M_AVALON_0_readdatavalid <= '0';
    	BUS_REGFILE_0_W_INT <= "0";
		INT_REGFILE_0_pol_WR <= "0";
		INT_REGFILE_0_lo_thrs_WR <= "0";
		INT_REGFILE_0_hi_thrs_WR <= "0";
		INT_REGFILE_0_gate_l_WR <= "0";
		INT_REGFILE_0_gate_u_WR <= "0";
		INT_REGFILE_0_delay_WR <= "0";
		INT_REGFILE_0_xdelay_WR <= "0";
		INT_REGFILE_0_inhib_WR <= "0";
	BUS_INTEGRATION_REGS_W_INT <= "0";
		INT_INTEGRATION_REGS_inttime_WR <= "0";
		INT_INTEGRATION_REGS_preint_WR <= "0";
		INT_INTEGRATION_REGS_gain_WR <= "0";
		INT_INTEGRATION_REGS_ofs_WR <= "0";
		INT_INTEGRATION_REGS_bl_WR <= "0";
		INT_INTEGRATION_REGS_pileup_WR <= "0";
	BUS_CH18_spectrum_W_INT <= "0";
		INT_CH18_spectrum_STATUS_RD <= "0";
		INT_CH18_spectrum_CONFIG_WR <= "0";
		INT_CH18_spectrum_CONFIG_LIMIT_WR <= "0";
		INT_CH18_spectrum_CONFIG_REBIN_WR <= "0";
		INT_CH18_spectrum_CONFIG_MIN_WR <= "0";
		INT_CH18_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH7_spectrum_W_INT <= "0";
		INT_CH7_spectrum_STATUS_RD <= "0";
		INT_CH7_spectrum_CONFIG_WR <= "0";
		INT_CH7_spectrum_CONFIG_LIMIT_WR <= "0";
		INT_CH7_spectrum_CONFIG_REBIN_WR <= "0";
		INT_CH7_spectrum_CONFIG_MIN_WR <= "0";
		INT_CH7_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH9_spectrum_W_INT <= "0";
		INT_CH9_spectrum_STATUS_RD <= "0";
		INT_CH9_spectrum_CONFIG_WR <= "0";
		INT_CH9_spectrum_CONFIG_LIMIT_WR <= "0";
		INT_CH9_spectrum_CONFIG_REBIN_WR <= "0";
		INT_CH9_spectrum_CONFIG_MIN_WR <= "0";
		INT_CH9_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH10_spectrum_W_INT <= "0";
		INT_CH10_spectrum_STATUS_RD <= "0";
		INT_CH10_spectrum_CONFIG_WR <= "0";
		INT_CH10_spectrum_CONFIG_LIMIT_WR <= "0";
		INT_CH10_spectrum_CONFIG_REBIN_WR <= "0";
		INT_CH10_spectrum_CONFIG_MIN_WR <= "0";
		INT_CH10_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH11_spectrum_W_INT <= "0";
		INT_CH11_spectrum_STATUS_RD <= "0";
		INT_CH11_spectrum_CONFIG_WR <= "0";
		INT_CH11_spectrum_CONFIG_LIMIT_WR <= "0";
		INT_CH11_spectrum_CONFIG_REBIN_WR <= "0";
		INT_CH11_spectrum_CONFIG_MIN_WR <= "0";
		INT_CH11_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH12_spectrum_W_INT <= "0";
		INT_CH12_spectrum_STATUS_RD <= "0";
		INT_CH12_spectrum_CONFIG_WR <= "0";
		INT_CH12_spectrum_CONFIG_LIMIT_WR <= "0";
		INT_CH12_spectrum_CONFIG_REBIN_WR <= "0";
		INT_CH12_spectrum_CONFIG_MIN_WR <= "0";
		INT_CH12_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH1_spectrum_W_INT <= "0";
		INT_CH1_spectrum_STATUS_RD <= "0";
		INT_CH1_spectrum_CONFIG_WR <= "0";
		INT_CH1_spectrum_CONFIG_LIMIT_WR <= "0";
		INT_CH1_spectrum_CONFIG_REBIN_WR <= "0";
		INT_CH1_spectrum_CONFIG_MIN_WR <= "0";
		INT_CH1_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH2_spectrum_W_INT <= "0";
		INT_CH2_spectrum_STATUS_RD <= "0";
		INT_CH2_spectrum_CONFIG_WR <= "0";
		INT_CH2_spectrum_CONFIG_LIMIT_WR <= "0";
		INT_CH2_spectrum_CONFIG_REBIN_WR <= "0";
		INT_CH2_spectrum_CONFIG_MIN_WR <= "0";
		INT_CH2_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH3_spectrum_W_INT <= "0";
		INT_CH3_spectrum_STATUS_RD <= "0";
		INT_CH3_spectrum_CONFIG_WR <= "0";
		INT_CH3_spectrum_CONFIG_LIMIT_WR <= "0";
		INT_CH3_spectrum_CONFIG_REBIN_WR <= "0";
		INT_CH3_spectrum_CONFIG_MIN_WR <= "0";
		INT_CH3_spectrum_CONFIG_MAX_WR <= "0";
	BUS_CH4_spectrum_W_INT <= "0";
		INT_CH4_spectrum_STATUS_RD <= "0";
		INT_CH4_spectrum_CONFIG_WR <= "0";
		INT_CH4_spectrum_CONFIG_LIMIT_WR <= "0";
		INT_CH4_spectrum_CONFIG_REBIN_WR <= "0";
		INT_CH4_spectrum_CONFIG_MIN_WR <= "0";
		INT_CH4_spectrum_CONFIG_MAX_WR <= "0";
  
                f_BUS_DATASTROBE_REG <= '0';
                
               if f_BUS_INT_WR = '1' then
        
        
    		If addr >= x"00000000" And addr < x"00000001" Then
			BUS_REGFILE_0_WRITE_DATA <= wreg; 
			BUS_REGFILE_0_W_INT <= "1"; 
		End If;
		if addr = x"00000001" then
			REG_REGFILE_0_pol_WR <= wreg; 
			INT_REGFILE_0_pol_WR <= "1"; 
		end if;
		if addr = x"00000002" then
			REG_REGFILE_0_lo_thrs_WR <= wreg; 
			INT_REGFILE_0_lo_thrs_WR <= "1"; 
		end if;
		if addr = x"00000003" then
			REG_REGFILE_0_hi_thrs_WR <= wreg; 
			INT_REGFILE_0_hi_thrs_WR <= "1"; 
		end if;
		if addr = x"00000004" then
			REG_REGFILE_0_gate_l_WR <= wreg; 
			INT_REGFILE_0_gate_l_WR <= "1"; 
		end if;
		if addr = x"00000005" then
			REG_REGFILE_0_gate_u_WR <= wreg; 
			INT_REGFILE_0_gate_u_WR <= "1"; 
		end if;
		if addr = x"00000006" then
			REG_REGFILE_0_delay_WR <= wreg; 
			INT_REGFILE_0_delay_WR <= "1"; 
		end if;
		if addr = x"00000007" then
			REG_REGFILE_0_xdelay_WR <= wreg; 
			INT_REGFILE_0_xdelay_WR <= "1"; 
		end if;
		if addr = x"00000008" then
			REG_REGFILE_0_inhib_WR <= wreg; 
			INT_REGFILE_0_inhib_WR <= "1"; 
		end if;
		If addr >= x"0000000A" And addr < x"0000000B" Then
			BUS_INTEGRATION_REGS_WRITE_DATA <= wreg; 
			BUS_INTEGRATION_REGS_W_INT <= "1"; 
		End If;
		if addr = x"0000000B" then
			REG_INTEGRATION_REGS_inttime_WR <= wreg; 
			INT_INTEGRATION_REGS_inttime_WR <= "1"; 
		end if;
		if addr = x"0000000C" then
			REG_INTEGRATION_REGS_preint_WR <= wreg; 
			INT_INTEGRATION_REGS_preint_WR <= "1"; 
		end if;
		if addr = x"0000000D" then
			REG_INTEGRATION_REGS_gain_WR <= wreg; 
			INT_INTEGRATION_REGS_gain_WR <= "1"; 
		end if;
		if addr = x"0000000E" then
			REG_INTEGRATION_REGS_ofs_WR <= wreg; 
			INT_INTEGRATION_REGS_ofs_WR <= "1"; 
		end if;
		if addr = x"0000000F" then
			REG_INTEGRATION_REGS_bl_WR <= wreg; 
			INT_INTEGRATION_REGS_bl_WR <= "1"; 
		end if;
		if addr = x"00000010" then
			REG_INTEGRATION_REGS_pileup_WR <= wreg; 
			INT_INTEGRATION_REGS_pileup_WR <= "1"; 
		end if;
		If addr >= x"00010000" And addr < x"00020000" Then
			BUS_CH18_spectrum_WRITE_DATA <= wreg; 
			BUS_CH18_spectrum_W_INT <= "1"; 
		End If;
		if addr = x"00020001" then
			REG_CH18_spectrum_CONFIG_WR <= wreg; 
			INT_CH18_spectrum_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00020002" then
			REG_CH18_spectrum_CONFIG_LIMIT_WR <= wreg; 
			INT_CH18_spectrum_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00020003" then
			REG_CH18_spectrum_CONFIG_REBIN_WR <= wreg; 
			INT_CH18_spectrum_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00020004" then
			REG_CH18_spectrum_CONFIG_MIN_WR <= wreg; 
			INT_CH18_spectrum_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00020005" then
			REG_CH18_spectrum_CONFIG_MAX_WR <= wreg; 
			INT_CH18_spectrum_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00030000" And addr < x"00040000" Then
			BUS_CH7_spectrum_WRITE_DATA <= wreg; 
			BUS_CH7_spectrum_W_INT <= "1"; 
		End If;
		if addr = x"00040001" then
			REG_CH7_spectrum_CONFIG_WR <= wreg; 
			INT_CH7_spectrum_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00040002" then
			REG_CH7_spectrum_CONFIG_LIMIT_WR <= wreg; 
			INT_CH7_spectrum_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00040003" then
			REG_CH7_spectrum_CONFIG_REBIN_WR <= wreg; 
			INT_CH7_spectrum_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00040004" then
			REG_CH7_spectrum_CONFIG_MIN_WR <= wreg; 
			INT_CH7_spectrum_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00040005" then
			REG_CH7_spectrum_CONFIG_MAX_WR <= wreg; 
			INT_CH7_spectrum_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00050000" And addr < x"00060000" Then
			BUS_CH9_spectrum_WRITE_DATA <= wreg; 
			BUS_CH9_spectrum_W_INT <= "1"; 
		End If;
		if addr = x"00060001" then
			REG_CH9_spectrum_CONFIG_WR <= wreg; 
			INT_CH9_spectrum_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00060002" then
			REG_CH9_spectrum_CONFIG_LIMIT_WR <= wreg; 
			INT_CH9_spectrum_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00060003" then
			REG_CH9_spectrum_CONFIG_REBIN_WR <= wreg; 
			INT_CH9_spectrum_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00060004" then
			REG_CH9_spectrum_CONFIG_MIN_WR <= wreg; 
			INT_CH9_spectrum_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00060005" then
			REG_CH9_spectrum_CONFIG_MAX_WR <= wreg; 
			INT_CH9_spectrum_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00070000" And addr < x"00080000" Then
			BUS_CH10_spectrum_WRITE_DATA <= wreg; 
			BUS_CH10_spectrum_W_INT <= "1"; 
		End If;
		if addr = x"00080001" then
			REG_CH10_spectrum_CONFIG_WR <= wreg; 
			INT_CH10_spectrum_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00080002" then
			REG_CH10_spectrum_CONFIG_LIMIT_WR <= wreg; 
			INT_CH10_spectrum_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00080003" then
			REG_CH10_spectrum_CONFIG_REBIN_WR <= wreg; 
			INT_CH10_spectrum_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00080004" then
			REG_CH10_spectrum_CONFIG_MIN_WR <= wreg; 
			INT_CH10_spectrum_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00080005" then
			REG_CH10_spectrum_CONFIG_MAX_WR <= wreg; 
			INT_CH10_spectrum_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00090000" And addr < x"000A0000" Then
			BUS_CH11_spectrum_WRITE_DATA <= wreg; 
			BUS_CH11_spectrum_W_INT <= "1"; 
		End If;
		if addr = x"000A0001" then
			REG_CH11_spectrum_CONFIG_WR <= wreg; 
			INT_CH11_spectrum_CONFIG_WR <= "1"; 
		end if;
		if addr = x"000A0002" then
			REG_CH11_spectrum_CONFIG_LIMIT_WR <= wreg; 
			INT_CH11_spectrum_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"000A0003" then
			REG_CH11_spectrum_CONFIG_REBIN_WR <= wreg; 
			INT_CH11_spectrum_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"000A0004" then
			REG_CH11_spectrum_CONFIG_MIN_WR <= wreg; 
			INT_CH11_spectrum_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"000A0005" then
			REG_CH11_spectrum_CONFIG_MAX_WR <= wreg; 
			INT_CH11_spectrum_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"000B0000" And addr < x"000C0000" Then
			BUS_CH12_spectrum_WRITE_DATA <= wreg; 
			BUS_CH12_spectrum_W_INT <= "1"; 
		End If;
		if addr = x"000C0001" then
			REG_CH12_spectrum_CONFIG_WR <= wreg; 
			INT_CH12_spectrum_CONFIG_WR <= "1"; 
		end if;
		if addr = x"000C0002" then
			REG_CH12_spectrum_CONFIG_LIMIT_WR <= wreg; 
			INT_CH12_spectrum_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"000C0003" then
			REG_CH12_spectrum_CONFIG_REBIN_WR <= wreg; 
			INT_CH12_spectrum_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"000C0004" then
			REG_CH12_spectrum_CONFIG_MIN_WR <= wreg; 
			INT_CH12_spectrum_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"000C0005" then
			REG_CH12_spectrum_CONFIG_MAX_WR <= wreg; 
			INT_CH12_spectrum_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"000D0000" And addr < x"000E0000" Then
			BUS_CH1_spectrum_WRITE_DATA <= wreg; 
			BUS_CH1_spectrum_W_INT <= "1"; 
		End If;
		if addr = x"000E0001" then
			REG_CH1_spectrum_CONFIG_WR <= wreg; 
			INT_CH1_spectrum_CONFIG_WR <= "1"; 
		end if;
		if addr = x"000E0002" then
			REG_CH1_spectrum_CONFIG_LIMIT_WR <= wreg; 
			INT_CH1_spectrum_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"000E0003" then
			REG_CH1_spectrum_CONFIG_REBIN_WR <= wreg; 
			INT_CH1_spectrum_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"000E0004" then
			REG_CH1_spectrum_CONFIG_MIN_WR <= wreg; 
			INT_CH1_spectrum_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"000E0005" then
			REG_CH1_spectrum_CONFIG_MAX_WR <= wreg; 
			INT_CH1_spectrum_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"000F0000" And addr < x"00100000" Then
			BUS_CH2_spectrum_WRITE_DATA <= wreg; 
			BUS_CH2_spectrum_W_INT <= "1"; 
		End If;
		if addr = x"00100001" then
			REG_CH2_spectrum_CONFIG_WR <= wreg; 
			INT_CH2_spectrum_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00100002" then
			REG_CH2_spectrum_CONFIG_LIMIT_WR <= wreg; 
			INT_CH2_spectrum_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00100003" then
			REG_CH2_spectrum_CONFIG_REBIN_WR <= wreg; 
			INT_CH2_spectrum_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00100004" then
			REG_CH2_spectrum_CONFIG_MIN_WR <= wreg; 
			INT_CH2_spectrum_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00100005" then
			REG_CH2_spectrum_CONFIG_MAX_WR <= wreg; 
			INT_CH2_spectrum_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00110000" And addr < x"00120000" Then
			BUS_CH3_spectrum_WRITE_DATA <= wreg; 
			BUS_CH3_spectrum_W_INT <= "1"; 
		End If;
		if addr = x"00120001" then
			REG_CH3_spectrum_CONFIG_WR <= wreg; 
			INT_CH3_spectrum_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00120002" then
			REG_CH3_spectrum_CONFIG_LIMIT_WR <= wreg; 
			INT_CH3_spectrum_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00120003" then
			REG_CH3_spectrum_CONFIG_REBIN_WR <= wreg; 
			INT_CH3_spectrum_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00120004" then
			REG_CH3_spectrum_CONFIG_MIN_WR <= wreg; 
			INT_CH3_spectrum_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00120005" then
			REG_CH3_spectrum_CONFIG_MAX_WR <= wreg; 
			INT_CH3_spectrum_CONFIG_MAX_WR <= "1"; 
		end if;
		If addr >= x"00130000" And addr < x"00140000" Then
			BUS_CH4_spectrum_WRITE_DATA <= wreg; 
			BUS_CH4_spectrum_W_INT <= "1"; 
		End If;
		if addr = x"00140001" then
			REG_CH4_spectrum_CONFIG_WR <= wreg; 
			INT_CH4_spectrum_CONFIG_WR <= "1"; 
		end if;
		if addr = x"00140002" then
			REG_CH4_spectrum_CONFIG_LIMIT_WR <= wreg; 
			INT_CH4_spectrum_CONFIG_LIMIT_WR <= "1"; 
		end if;
		if addr = x"00140003" then
			REG_CH4_spectrum_CONFIG_REBIN_WR <= wreg; 
			INT_CH4_spectrum_CONFIG_REBIN_WR <= "1"; 
		end if;
		if addr = x"00140004" then
			REG_CH4_spectrum_CONFIG_MIN_WR <= wreg; 
			INT_CH4_spectrum_CONFIG_MIN_WR <= "1"; 
		end if;
		if addr = x"00140005" then
			REG_CH4_spectrum_CONFIG_MAX_WR <= wreg; 
			INT_CH4_spectrum_CONFIG_MAX_WR <= "1"; 
		end if;

                end if;
        
        
                if f_BUS_INT_RD = '1' then
                    f_BUS_DATASTROBE_REG <= '1';
                    rreg := x"DEADBEEF";
    
    		if addr = x"00000001" then
			rreg := REG_REGFILE_0_pol_RD; 
		End If;
		if addr = x"00000002" then
			rreg := REG_REGFILE_0_lo_thrs_RD; 
		End If;
		if addr = x"00000003" then
			rreg := REG_REGFILE_0_hi_thrs_RD; 
		End If;
		if addr = x"00000004" then
			rreg := REG_REGFILE_0_gate_l_RD; 
		End If;
		if addr = x"00000005" then
			rreg := REG_REGFILE_0_gate_u_RD; 
		End If;
		if addr = x"00000006" then
			rreg := REG_REGFILE_0_delay_RD; 
		End If;
		if addr = x"00000007" then
			rreg := REG_REGFILE_0_xdelay_RD; 
		End If;
		if addr = x"00000008" then
			rreg := REG_REGFILE_0_inhib_RD; 
		End If;
		if addr = x"0000000B" then
			rreg := REG_INTEGRATION_REGS_inttime_RD; 
		End If;
		if addr = x"0000000C" then
			rreg := REG_INTEGRATION_REGS_preint_RD; 
		End If;
		if addr = x"0000000D" then
			rreg := REG_INTEGRATION_REGS_gain_RD; 
		End If;
		if addr = x"0000000E" then
			rreg := REG_INTEGRATION_REGS_ofs_RD; 
		End If;
		if addr = x"0000000F" then
			rreg := REG_INTEGRATION_REGS_bl_RD; 
		End If;
		if addr = x"00000010" then
			rreg := REG_INTEGRATION_REGS_pileup_RD; 
		End If;
		if addr = x"00020000" then
			rreg := REG_CH18_spectrum_STATUS_RD; 
		End If;
		if addr = x"00020001" then
			rreg := REG_CH18_spectrum_CONFIG_RD; 
		End If;
		if addr = x"00020002" then
			rreg := REG_CH18_spectrum_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00020003" then
			rreg := REG_CH18_spectrum_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00020004" then
			rreg := REG_CH18_spectrum_CONFIG_MIN_RD; 
		End If;
		if addr = x"00020005" then
			rreg := REG_CH18_spectrum_CONFIG_MAX_RD; 
		End If;
		if addr = x"00040000" then
			rreg := REG_CH7_spectrum_STATUS_RD; 
		End If;
		if addr = x"00040001" then
			rreg := REG_CH7_spectrum_CONFIG_RD; 
		End If;
		if addr = x"00040002" then
			rreg := REG_CH7_spectrum_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00040003" then
			rreg := REG_CH7_spectrum_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00040004" then
			rreg := REG_CH7_spectrum_CONFIG_MIN_RD; 
		End If;
		if addr = x"00040005" then
			rreg := REG_CH7_spectrum_CONFIG_MAX_RD; 
		End If;
		if addr = x"00060000" then
			rreg := REG_CH9_spectrum_STATUS_RD; 
		End If;
		if addr = x"00060001" then
			rreg := REG_CH9_spectrum_CONFIG_RD; 
		End If;
		if addr = x"00060002" then
			rreg := REG_CH9_spectrum_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00060003" then
			rreg := REG_CH9_spectrum_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00060004" then
			rreg := REG_CH9_spectrum_CONFIG_MIN_RD; 
		End If;
		if addr = x"00060005" then
			rreg := REG_CH9_spectrum_CONFIG_MAX_RD; 
		End If;
		if addr = x"00080000" then
			rreg := REG_CH10_spectrum_STATUS_RD; 
		End If;
		if addr = x"00080001" then
			rreg := REG_CH10_spectrum_CONFIG_RD; 
		End If;
		if addr = x"00080002" then
			rreg := REG_CH10_spectrum_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00080003" then
			rreg := REG_CH10_spectrum_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00080004" then
			rreg := REG_CH10_spectrum_CONFIG_MIN_RD; 
		End If;
		if addr = x"00080005" then
			rreg := REG_CH10_spectrum_CONFIG_MAX_RD; 
		End If;
		if addr = x"000A0000" then
			rreg := REG_CH11_spectrum_STATUS_RD; 
		End If;
		if addr = x"000A0001" then
			rreg := REG_CH11_spectrum_CONFIG_RD; 
		End If;
		if addr = x"000A0002" then
			rreg := REG_CH11_spectrum_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"000A0003" then
			rreg := REG_CH11_spectrum_CONFIG_REBIN_RD; 
		End If;
		if addr = x"000A0004" then
			rreg := REG_CH11_spectrum_CONFIG_MIN_RD; 
		End If;
		if addr = x"000A0005" then
			rreg := REG_CH11_spectrum_CONFIG_MAX_RD; 
		End If;
		if addr = x"000C0000" then
			rreg := REG_CH12_spectrum_STATUS_RD; 
		End If;
		if addr = x"000C0001" then
			rreg := REG_CH12_spectrum_CONFIG_RD; 
		End If;
		if addr = x"000C0002" then
			rreg := REG_CH12_spectrum_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"000C0003" then
			rreg := REG_CH12_spectrum_CONFIG_REBIN_RD; 
		End If;
		if addr = x"000C0004" then
			rreg := REG_CH12_spectrum_CONFIG_MIN_RD; 
		End If;
		if addr = x"000C0005" then
			rreg := REG_CH12_spectrum_CONFIG_MAX_RD; 
		End If;
		if addr = x"000E0000" then
			rreg := REG_CH1_spectrum_STATUS_RD; 
		End If;
		if addr = x"000E0001" then
			rreg := REG_CH1_spectrum_CONFIG_RD; 
		End If;
		if addr = x"000E0002" then
			rreg := REG_CH1_spectrum_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"000E0003" then
			rreg := REG_CH1_spectrum_CONFIG_REBIN_RD; 
		End If;
		if addr = x"000E0004" then
			rreg := REG_CH1_spectrum_CONFIG_MIN_RD; 
		End If;
		if addr = x"000E0005" then
			rreg := REG_CH1_spectrum_CONFIG_MAX_RD; 
		End If;
		if addr = x"00100000" then
			rreg := REG_CH2_spectrum_STATUS_RD; 
		End If;
		if addr = x"00100001" then
			rreg := REG_CH2_spectrum_CONFIG_RD; 
		End If;
		if addr = x"00100002" then
			rreg := REG_CH2_spectrum_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00100003" then
			rreg := REG_CH2_spectrum_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00100004" then
			rreg := REG_CH2_spectrum_CONFIG_MIN_RD; 
		End If;
		if addr = x"00100005" then
			rreg := REG_CH2_spectrum_CONFIG_MAX_RD; 
		End If;
		if addr = x"00120000" then
			rreg := REG_CH3_spectrum_STATUS_RD; 
		End If;
		if addr = x"00120001" then
			rreg := REG_CH3_spectrum_CONFIG_RD; 
		End If;
		if addr = x"00120002" then
			rreg := REG_CH3_spectrum_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00120003" then
			rreg := REG_CH3_spectrum_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00120004" then
			rreg := REG_CH3_spectrum_CONFIG_MIN_RD; 
		End If;
		if addr = x"00120005" then
			rreg := REG_CH3_spectrum_CONFIG_MAX_RD; 
		End If;
		if addr = x"00140000" then
			rreg := REG_CH4_spectrum_STATUS_RD; 
		End If;
		if addr = x"00140001" then
			rreg := REG_CH4_spectrum_CONFIG_RD; 
		End If;
		if addr = x"00140002" then
			rreg := REG_CH4_spectrum_CONFIG_LIMIT_RD; 
		End If;
		if addr = x"00140003" then
			rreg := REG_CH4_spectrum_CONFIG_REBIN_RD; 
		End If;
		if addr = x"00140004" then
			rreg := REG_CH4_spectrum_CONFIG_MIN_RD; 
		End If;
		if addr = x"00140005" then
			rreg := REG_CH4_spectrum_CONFIG_MAX_RD; 
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
