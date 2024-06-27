library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_ChargeIntegrator is
    Port (	
		energy : out std_logic_vector(15 downto 0);
valid : out std_logic_vector(0 downto 0);
trig : in std_logic_vector(0 downto 0);
int_time : in std_logic_vector(15 downto 0);
pre_int : in std_logic_vector(15 downto 0);
analog_in : in std_logic_vector(15 downto 0);
int_gate : out std_logic_vector(0 downto 0);
base : in std_logic_vector(15 downto 0);
manual_base : in std_logic_vector(0 downto 0);
dummy : out std_logic_vector(0 downto 0);

		async_clk : in std_logic_vector (0 downto 0);
		CLK_ACQ : in std_logic_vector (0 downto 0);
		BUS_CLK : in std_logic_vector (0 downto 0);
		CLK_40 : in std_logic_vector (0 downto 0);
		CLK_50 : in std_logic_vector (0 downto 0);
		CLK_80 : in std_logic_vector (0 downto 0);
		clk_160 : in std_logic_vector (0 downto 0);
		clk_320 : in std_logic_vector (0 downto 0);
		CLK_125 : in std_logic_vector(0 downto 0);
		FAST_CLK_100 : in std_logic_vector (0 downto 0);
		FAST_CLK_200 : in std_logic_vector (0 downto 0);
		FAST_CLK_250 : in std_logic_vector (0 downto 0);
		FAST_CLK_250_90 : in std_logic_vector (0 downto 0);
		FAST_CLK_500 : in std_logic_vector (0 downto 0);
		FAST_CLK_500_90 : in std_logic_vector (0 downto 0);
		GlobalClock : in std_logic_vector (0 downto 0);
		GlobalReset : in std_logic_vector (0 downto 0)
		
 );
end SUBPAGE_ChargeIntegrator;

architecture Behavioral of SUBPAGE_ChargeIntegrator is

COMPONENT charge_integration
PORT(
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    in1_V : IN STD_LOGIC_VECTOR (15 downto 0);
    in1_V_ap_vld : IN STD_LOGIC;
    base_line_V : IN STD_LOGIC_VECTOR (15 downto 0);
    trigger_signal : IN STD_LOGIC;
    p_int_length_V : IN STD_LOGIC_VECTOR (15 downto 0);
    p_pre_length_V : IN STD_LOGIC_VECTOR (15 downto 0);
    p_gain_V : IN STD_LOGIC_VECTOR (15 downto 0);
    p_offset_V : IN STD_LOGIC_VECTOR (15 downto 0);
    p_pileup_inib_V : IN STD_LOGIC_VECTOR (15 downto 0);
    enable : IN STD_LOGIC;
    energy_out_V : OUT STD_LOGIC_VECTOR (15 downto 0);
    energy_trigger : OUT STD_LOGIC;
    energy_trigger_ap_vld : OUT STD_LOGIC;
    p_integrate : OUT STD_LOGIC;
    p_pileup : OUT STD_LOGIC;
    p_busy : OUT STD_LOGIC);
END COMPONENT;
signal U0_ind_integrate : std_logic_vector(0 downto 0) := (others => '0');
signal U0_energy : std_logic_vector(15 downto 0) := (others => '0');
signal U0_energy_valid : std_logic_vector(0 downto 0) := (others => '0');
signal U3_trig : std_logic_vector(0 downto 0);
signal U4_int_time : std_logic_vector(15 downto 0);
signal U5_pre_int : std_logic_vector(15 downto 0);
signal U6_analog_in : std_logic_vector(15 downto 0);
signal U8_base : std_logic_vector(15 downto 0);
signal U9_manual_base : std_logic_vector(0 downto 0);

begin

U0: charge_integration
PORT MAP(
    ap_clk  => async_clk(0),
    ap_rst  => GlobalReset(0),
    in1_V  => U6_analog_in,
    in1_V_ap_vld  => '1',
    base_line_V  => U8_base,
    trigger_signal  => U3_trig(0),
    p_int_length_V  => U4_int_time,
    p_pre_length_V  => U5_pre_int,
    p_gain_V  => x"FFFF",
    p_offset_V  => x"0000",
    p_pileup_inib_V  => x"0000",
    enable  => '1',
    energy_out_V => U0_energy,
    energy_trigger => U0_energy_valid(0),
    energy_trigger_ap_vld => open,
    p_integrate => U0_ind_integrate(0),
    p_pileup => open,
    p_busy => open
);
energy <= U0_energy;
valid <= U0_energy_valid;
U3_trig <= trig;
U4_int_time <= int_time;
U5_pre_int <= pre_int;
U6_analog_in <= analog_in;
int_gate <= U0_ind_integrate;
U8_base <= base;
U9_manual_base <= manual_base;
dummy <= U9_manual_base;

end Behavioral;
