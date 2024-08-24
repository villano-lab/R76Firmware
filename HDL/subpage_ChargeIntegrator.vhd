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
baseline : out std_logic_vector(15 downto 0);
baseline_valid : out std_logic_vector(0 downto 0);
baseline_calculating : out std_logic_vector(0 downto 0);
manual_base : in std_logic_vector(7 downto 0);
scale : in std_logic_vector(15 downto 0);

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
signal U9_out : std_logic_vector(15 downto 0);

COMPONENT BASELINE_RESTORER
Generic (	wordWidth : integer := 16);
PORT(
    	RESET: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    	CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    	CE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    	TRIGGER: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    	DATA_IN: IN STD_LOGIC_VECTOR(wordWidth-1 DOWNTO 0);
    	M_LENGTH: IN INTEGER;
    	BL_HOLD: IN INTEGER;
    	FLUSH: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    	BASELINE: OUT STD_LOGIC_VECTOR(wordWidth-1 DOWNTO 0);
    	BASELINE_VALID: OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    	HOLD_TIME: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    	RUNNING_NOT_HOLD: OUT STD_LOGIC_VECTOR(0 DOWNTO 0));
END COMPONENT;
signal U10_baseline_valid : std_logic_vector(0 downto 0) := (others => '0');
signal U10_base_line : std_logic_vector(15 downto 0) := (others => '0');
signal U10_track_hold : std_logic_vector(0 downto 0) := (others => '0');
	signal U11_int : integer  := 0;
	signal U15_int : integer  := 0;
signal U16_manual_base : std_logic_vector(7 downto 0);
	signal U17_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);

	COMPONENT comparator
		GENERIC( 
			IN_SIZE : INTEGER := 8;
			IN_SIGN : STRING := "unsigned";
			REGISTER_OUT : STRING := "false";
			OPERATION : STRING := "equal"
		);
		PORT( 
			in1 : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
			in2 : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
			clk : in STD_LOGIC;
			comp_out : out STD_LOGIC_VECTOR(0 downto 0)
		);
	END COMPONENT;

signal U18_CONST : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal U19_scale : std_logic_vector(15 downto 0);
	signal U20_OUT : STD_LOGIC_VECTOR(31 DOWNTO 0);

	COMPONENT U20_DividerPipelined
		PORT( 
			s_axis_dividend_tdata : in STD_LOGIC_VECTOR(15 downto 0);
			s_axis_dividend_tvalid : in STD_LOGIC;
			s_axis_divisor_tdata : in STD_LOGIC_VECTOR(15 downto 0);
			s_axis_divisor_tvalid : in STD_LOGIC;
			m_axis_dout_tdata : out STD_LOGIC_VECTOR(31 downto 0);
			m_axis_dout_tvalid : out STD_LOGIC;
			aclk : in STD_LOGIC;
			aclken : in STD_LOGIC
		);
	END COMPONENT;

signal U21_out : std_logic_vector(15 downto 0) := (others => '0');

begin

U0: charge_integration
PORT MAP(
    ap_clk  => async_clk(0),
    ap_rst  => GlobalReset(0),
    in1_V  => U21_out,
    in1_V_ap_vld  => '1',
    base_line_V  => U9_out,
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

U9 : block
begin
U9_out <= U10_base_line when U17_OUT = "0" else U8_base when U17_OUT = "1"  else U8_base;

end block;

U10: BASELINE_RESTORER
Generic map (	wordWidth=> 16)
PORT MAP(
    RESET  => GlobalReset,
    CLK  => async_clk,
    CE  => "1",
    TRIGGER  => U3_trig,
    DATA_IN  => U6_analog_in,
    M_LENGTH  => U15_int,
    BL_HOLD  => U11_int,
    FLUSH  => "0",
    BASELINE  => U10_base_line,
    BASELINE_VALID  => U10_baseline_valid,
    HOLD_TIME  => open,
    RUNNING_NOT_HOLD  => U10_track_hold
);
	U11_int <= conv_integer(U4_int_time);
baseline <= U10_base_line;
baseline_valid <= U10_baseline_valid;
baseline_calculating <= U10_track_hold;
	U15_int <= conv_integer(U16_manual_base);
U16_manual_base <= manual_base;

	U17 : comparator
	Generic map(
		IN_SIZE => 	8,
		IN_SIGN => 	"unsigned",
		REGISTER_OUT => 	"false",
		OPERATION => 	"equal"
	)
	PORT MAP(
		in1 => U16_manual_base,
		in2 => U18_CONST,
		clk => CLK_125(0),
		comp_out => U17_OUT
	);

U18_CONST <= std_logic_vector(ieee.numeric_std.resize(ieee.numeric_std.unsigned'(x"0"),8));
U19_scale <= scale;

	U20 : U20_DividerPipelined
	PORT MAP(
		s_axis_dividend_tdata => U6_analog_in,
		s_axis_dividend_tvalid => '0',
		s_axis_divisor_tdata => U19_scale,
		s_axis_divisor_tvalid => '0',
		m_axis_dout_tdata => U20_OUT,
		m_axis_dout_tvalid => open,
		aclk => CLK_ACQ(0),
		aclken => '1'
	);

U21_out <= U20_OUT(31 downto 16);

end Behavioral;
