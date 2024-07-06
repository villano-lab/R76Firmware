library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_subdesign_2 is
    Port (	
		data_in : in std_logic_vector(15 downto 0);
trig : in std_logic_vector(0 downto 0);
inttime : in std_logic_vector(15 downto 0);
preint : in std_logic_vector(15 downto 0);
gain : in std_logic_vector(15 downto 0);
pileup : in std_logic_vector(15 downto 0);
ofs : in std_logic_vector(15 downto 0);
bl : in std_logic_vector(15 downto 0);
E : out std_logic_vector(15 downto 0);

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
end SUBPAGE_subdesign_2;

architecture Behavioral of SUBPAGE_subdesign_2 is
signal U0_data_in : std_logic_vector(15 downto 0);

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
signal U1_energy : std_logic_vector(15 downto 0) := (others => '0');
signal U2_trig : std_logic_vector(0 downto 0);
signal U3_inttime : std_logic_vector(15 downto 0);
signal U4_preint : std_logic_vector(15 downto 0);
signal U5_gain : std_logic_vector(15 downto 0);
signal U6_pileup : std_logic_vector(15 downto 0);
signal U7_ofs : std_logic_vector(15 downto 0);
signal U8_bl : std_logic_vector(15 downto 0);

begin
U0_data_in <= data_in;

U1: charge_integration
PORT MAP(
    ap_clk  => async_clk(0),
    ap_rst  => GlobalReset(0),
    in1_V  => U0_data_in,
    in1_V_ap_vld  => '1',
    base_line_V  => U8_bl,
    trigger_signal  => U2_trig(0),
    p_int_length_V  => U3_inttime,
    p_pre_length_V  => U4_preint,
    p_gain_V  => U5_gain,
    p_offset_V  => U7_ofs,
    p_pileup_inib_V  => U6_pileup,
    enable  => '1',
    energy_out_V => U1_energy,
    energy_trigger => open,
    energy_trigger_ap_vld => open,
    p_integrate => open,
    p_pileup => open,
    p_busy => open
);
U2_trig <= trig;
U3_inttime <= inttime;
U4_preint <= preint;
U5_gain <= gain;
U6_pileup <= pileup;
U7_ofs <= ofs;
U8_bl <= bl;
E <= U1_energy;

end Behavioral;
