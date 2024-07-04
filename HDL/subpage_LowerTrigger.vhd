library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_LowerTrigger is
    Port (	
		AIN : in std_logic_vector(15 downto 0);
delay : in std_logic_vector(15 downto 0);
polarity : in std_logic_vector(0 downto 0);
inhib : in std_logic_vector(15 downto 0);
disable_det : in std_logic_vector(0 downto 0);
TRIGOUT : out std_logic_vector(0 downto 0);
gate : in std_logic_vector(15 downto 0);
ANALOGOUT : out std_logic_vector(15 downto 0);
thrsh : in std_logic_vector(15 downto 0);

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
end SUBPAGE_LowerTrigger;

architecture Behavioral of SUBPAGE_LowerTrigger is

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
signal U4_polarity : std_logic_vector(0 downto 0);
signal U5_inhib : std_logic_vector(15 downto 0);
	signal U6_int : integer  := 0;
signal U7_disable_det : std_logic_vector(0 downto 0);
	signal U8_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);

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
signal U10_out : std_logic_vector(0 downto 0) := (others => '0');
signal U11_gate : std_logic_vector(15 downto 0);
	signal U12_int : integer  := 0;
	signal U13_b : STD_LOGIC_VECTOR(15 DOWNTO 0);

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

	signal U14_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal U16_thrsh : std_logic_vector(15 downto 0);

begin

U0:TRIGGER_LEADING
Generic Map(	wordWidth =>16,
			noise_filter =>0,
			data_delay =>1)
port Map(
	RESET =>GlobalReset,
	CLK =>async_clk,
	CE =>"1",
	POLARITY =>U14_OUT,
	PORT_IN =>U13_b,
	THRESHOLD =>U16_thrsh,
	TRIGGER_INIB =>U6_int,
	DELAYED_DATA =>open,
	TOT =>open,
	TRIGGER_OUT =>U0_trigger_out
);
U1_AIN <= AIN;
U2_delay <= delay;
	U3_int <= conv_integer(U2_delay);
U4_polarity <= polarity;
U5_inhib <= inhib;
	U6_int <= conv_integer(U5_inhib);
U7_disable_det <= disable_det;
U8_OUT <= U10_out AND ( NOT sxt(U7_disable_det,1));
TRIGOUT <= U8_OUT;

U10:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U0_trigger_out,
    DELAY => U3_int,
    GATE => U12_int,
    PORT_OUT => U10_out
);
U11_gate <= gate;
	U12_int <= conv_integer(U11_gate);

	U13 : polinvert
	Generic map(
		A_SIZE => 	16,
		SIGN => 	"UNSIGNED",
		AN_SIZE => 	14
	)
	PORT MAP(
		a => U1_AIN,
		pol => U4_polarity,
		b => U13_b
	);

U14_OUT <= NOT U4_polarity;
ANALOGOUT <= U13_b;
U16_thrsh <= thrsh;

end Behavioral;
