library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_UpperTrigger is
    Port (	
		gate : in std_logic_vector(15 downto 0);
AIN : in std_logic_vector(15 downto 0);
TRIGOUT : out std_logic_vector(0 downto 0);
top : in std_logic_vector(15 downto 0);

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
end SUBPAGE_UpperTrigger;

architecture Behavioral of SUBPAGE_UpperTrigger is

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
signal U1_out : std_logic_vector(0 downto 0) := (others => '0');
	signal U2_int : integer  := 0;
signal U3_gate : std_logic_vector(15 downto 0);
signal U4_CONST : INTEGER := 0;
signal U5_AIN : std_logic_vector(15 downto 0);
	signal U7_b : STD_LOGIC_VECTOR(15 DOWNTO 0);

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

signal U8_top : std_logic_vector(15 downto 0);
signal U9_CONST : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	signal U10_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);

	COMPONENT comparator
		GENERIC( 
			IN_SIZE : INTEGER := 16;
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

signal U11_CONST : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal U12_out : std_logic_vector(0 downto 0);
signal U13_CONST : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');

begin

U0:TRIGGER_LEADING
Generic Map(	wordWidth =>16,
			noise_filter =>0,
			data_delay =>1)
port Map(
	RESET =>GlobalReset,
	CLK =>async_clk,
	CE =>"1",
	POLARITY =>U9_CONST,
	PORT_IN =>U7_b,
	THRESHOLD =>U8_top,
	TRIGGER_INIB =>0,
	DELAYED_DATA =>open,
	TOT =>open,
	TRIGGER_OUT =>U0_trigger_out
);

U1:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U0_trigger_out,
    DELAY => U4_CONST,
    GATE => U2_int,
    PORT_OUT => U1_out
);
	U2_int <= conv_integer(U3_gate);
U3_gate <= gate;
U4_CONST <= 0;
U5_AIN <= AIN;
TRIGOUT <= U12_out;

	U7 : polinvert
	Generic map(
		A_SIZE => 	16,
		SIGN => 	"UNSIGNED",
		AN_SIZE => 	14
	)
	PORT MAP(
		a => U5_AIN,
		pol => U9_CONST,
		b => U7_b
	);

U8_top <= top;
U9_CONST <= std_logic_vector(ieee.numeric_std.resize(ieee.numeric_std.unsigned'(x"1"),1));

	U10 : comparator
	Generic map(
		IN_SIZE => 	16,
		IN_SIGN => 	"unsigned",
		REGISTER_OUT => 	"false",
		OPERATION => 	"equal"
	)
	PORT MAP(
		in1 => U8_top,
		in2 => U11_CONST,
		clk => CLK_125(0),
		comp_out => U10_OUT
	);

U11_CONST <= conv_std_logic_vector(0,16);

U12 : block
begin
U12_out <= U13_CONST when U10_OUT = "0" else U1_out when U10_OUT = "1"  else U1_out;

end block;
U13_CONST <= conv_std_logic_vector(0,1);

end Behavioral;
