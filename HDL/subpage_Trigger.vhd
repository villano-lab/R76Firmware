library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_Trigger is
    Port (	
		AIN : in std_logic_vector(15 downto 0);
delay : in std_logic_vector(15 downto 0);
inhib : in std_logic_vector(15 downto 0);
disable_det : in std_logic_vector(0 downto 0);
TRIGOUT : out std_logic_vector(0 downto 0);
gate : in std_logic_vector(15 downto 0);
ANALOGOUT : out std_logic_vector(15 downto 0);
thrsh : in std_logic_vector(15 downto 0);
baseline : in std_logic_vector(7 downto 0);
auto_baseline : in std_logic_vector(15 downto 0);
trig_nodelay : out std_logic_vector(0 downto 0);

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
end SUBPAGE_Trigger;

architecture Behavioral of SUBPAGE_Trigger is

COMPONENT TRIGGER_LEADING
Generic (	wordWidth : integer := 16;
			noise_filter : integer := 0;
			data_delay : integer := 1);
port (
	RESET: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	POLARITY: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	PORT_IN: IN STD_LOGIC_VECTOR(wordWidth-1 DOWNTO 0);
	THRESHOLD: IN STD_LOGIC_VECTOR(wordWidth-1 DOWNTO 0);
	TRIGGER_INIB: IN INTEGER;
	DELAYED_DATA: OUT STD_LOGIC_VECTOR(wordWidth-1 DOWNTO 0);
	TOT: OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
	TRIGGER_OUT: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END COMPONENT;
signal U0_trigger_out : std_logic_vector(0 downto 0) := (others => '0');
signal U1_AIN : std_logic_vector(15 downto 0);
signal U2_delay : std_logic_vector(15 downto 0);
	signal U3_int : integer  := 0;
signal U4_inhib : std_logic_vector(15 downto 0);
	signal U5_int : integer  := 0;
signal U6_disable_det : std_logic_vector(0 downto 0);
	signal U7_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);

COMPONENT SW_GATE_AND_DELAY
Generic (	maxDelay : integer := 16);
PORT(
    RESET: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    CLK: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    PORT_IN: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    DELAY: IN INTEGER; 
    GATE: IN INTEGER; 
    PORT_OUT: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)); 
END COMPONENT;
signal U9_out : std_logic_vector(0 downto 0) := (others => '0');
signal U10_gate : std_logic_vector(15 downto 0);
	signal U11_int : integer  := 0;
	signal U12_b : STD_LOGIC_VECTOR(15 DOWNTO 0);

	COMPONENT polinvert
		GENERIC( 
			A_SIZE : INTEGER := 16;
			SIGN : STRING := "UNSIGNED";
			AN_SIZE : INTEGER := 14
		);
		PORT( 
			a : in STD_LOGIC_VECTOR(A_SIZE-1 downto 0);
			pol : in STD_LOGIC_VECTOR(0 downto 0);
			b : out STD_LOGIC_VECTOR(A_SIZE-1 downto 0)
		);
	END COMPONENT;

signal U14_thrsh : std_logic_vector(15 downto 0);
signal U15_out : std_logic_vector(15 downto 0);
signal U16_baseline : std_logic_vector(7 downto 0);
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
signal U19_auto_baseline : std_logic_vector(15 downto 0);
signal U20_out_0 : std_logic_vector(15 downto 0) := (others => '0');
signal U21_CONST : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');

begin

U0:TRIGGER_LEADING
Generic Map(	wordWidth =>16,
			noise_filter =>0,
			data_delay =>1)
port Map(
	RESET =>GlobalReset,
	CLK =>async_clk,
	CE =>"1",
	POLARITY =>U21_CONST,
	PORT_IN =>U12_b,
	THRESHOLD =>U15_out,
	TRIGGER_INIB =>U5_int,
	DELAYED_DATA =>open,
	TOT =>open,
	TRIGGER_OUT =>U0_trigger_out
);
U1_AIN <= AIN;
U2_delay <= delay;
	U3_int <= conv_integer(U2_delay);
U4_inhib <= inhib;
	U5_int <= conv_integer(U4_inhib);
U6_disable_det <= disable_det;
U7_OUT <= U0_trigger_out AND ( NOT sxt(U6_disable_det,1));
TRIGOUT <= U9_out;

U9:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U7_OUT,
    DELAY => U3_int,
    GATE => U11_int,
    PORT_OUT => U9_out
);
U10_gate <= gate;
	U11_int <= conv_integer(U10_gate);

	U12 : polinvert
	Generic map(
		A_SIZE => 	16,
		SIGN => 	"UNSIGNED",
		AN_SIZE => 	14
	)
	PORT MAP(
		a => U1_AIN,
		pol => U21_CONST,
		b => U12_b
	);

ANALOGOUT <= U12_b;
U14_thrsh <= thrsh;

U15 : block
begin
U15_out <= U20_out_0 when U17_OUT = "0" else U14_thrsh when U17_OUT = "1"  else (others=>'0');

end block;
U16_baseline <= baseline;

	U17 : comparator
	Generic map(
		IN_SIZE => 	8,
		IN_SIGN => 	"unsigned",
		REGISTER_OUT => 	"false",
		OPERATION => 	"equal"
	)
	PORT MAP(
		in1 => U16_baseline,
		in2 => U18_CONST,
		clk => CLK_125(0),
		comp_out => U17_OUT
	);

U18_CONST <= std_logic_vector(ieee.numeric_std.resize(ieee.numeric_std.unsigned'(x"0"),8));
U19_auto_baseline <= auto_baseline;
U20_out_0 <= ext(U19_auto_baseline, 16) + ext(U14_thrsh, 16) ;
U21_CONST <= conv_std_logic_vector(1,1);
trig_nodelay <= U7_OUT;

end Behavioral;
