library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_int is
    Port (	
		trig : in std_logic_vector(0 downto 0);
data_in : in std_logic_vector(15 downto 0);
inttime : in std_logic_vector(15 downto 0);
pre_int : in std_logic_vector(15 downto 0);
pileup_inhib : in std_logic_vector(15 downto 0);
gain : in std_logic_vector(15 downto 0);
offset : in std_logic_vector(15 downto 0);
baseline : in std_logic_vector(15 downto 0);
E : out std_logic_vector(15 downto 0);
Int_gate : out std_logic_vector(0 downto 0);

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
end SUBPAGE_int;

architecture Behavioral of SUBPAGE_int is
signal U0_trig : std_logic_vector(0 downto 0);
signal U1_data_in : std_logic_vector(15 downto 0);

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
signal U2_ind_integrate : std_logic_vector(0 downto 0) := (others => '0');
signal U2_energy : std_logic_vector(15 downto 0) := (others => '0');
signal U3_inttime : std_logic_vector(15 downto 0);
signal U4_pre_int : std_logic_vector(15 downto 0);
signal U5_pileup_inhib : std_logic_vector(15 downto 0);
signal U6_gain : std_logic_vector(15 downto 0);
signal U7_offset : std_logic_vector(15 downto 0);
signal U8_baseline : std_logic_vector(15 downto 0);

begin
U0_trig <= trig;
U1_data_in <= data_in;

U2: charge_integration
PORT MAP(
    ap_clk  => async_clk(0),
    ap_rst  => GlobalReset(0),
    in1_V  => U1_data_in,
    in1_V_ap_vld  => '1',
    base_line_V  => U8_baseline,
    trigger_signal  => U0_trig(0),
    p_int_length_V  => U3_inttime,
    p_pre_length_V  => U4_pre_int,
    p_gain_V  => U6_gain,
    p_offset_V  => U7_offset,
    p_pileup_inib_V  => U5_pileup_inhib,
    enable  => '1',
    energy_out_V => U2_energy,
    energy_trigger => open,
    energy_trigger_ap_vld => open,
    p_integrate => U2_ind_integrate(0),
    p_pileup => open,
    p_busy => open
);
U3_inttime <= inttime;
U4_pre_int <= pre_int;
U5_pileup_inhib <= pileup_inhib;
U6_gain <= gain;
U7_offset <= offset;
U8_baseline <= baseline;
E <= U2_energy;
Int_gate <= U2_ind_integrate;

end Behavioral;
