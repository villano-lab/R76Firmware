library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_ReduceRate is
    Port (	
		Original : in std_logic_vector(0 downto 0);
skip : in std_logic_vector(31 downto 0);
Reduced : out std_logic_vector(0 downto 0);
gate : in std_logic_vector(15 downto 0);
delay : in std_logic_vector(15 downto 0);
reset : in std_logic_vector(0 downto 0);

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
end SUBPAGE_ReduceRate;

architecture Behavioral of SUBPAGE_ReduceRate is
Component COUNTER_RISING Is
   Generic(bitSize : Integer := 1);
   port(        RESET :  IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CE: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        CLK: IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        SIGIN : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        ENABLE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
        COUNTER: OUT STD_LOGIC_VECTOR (31 downto 0);
        OVERFLOW: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
End component;
signal U0_counts : std_logic_vector(31 downto 0) := (others => '0');
	signal U1_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U2_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);

	COMPONENT comparator
		GENERIC( 
			IN_SIZE : INTEGER := 32;
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

signal U3_Original : std_logic_vector(0 downto 0);
signal U4_skip : std_logic_vector(31 downto 0);

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
signal U6_out : std_logic_vector(0 downto 0) := (others => '0');
signal U7_gate : std_logic_vector(15 downto 0);
	signal U8_int : integer  := 0;
signal U9_CONST : INTEGER := 0;
signal U10_delay : std_logic_vector(15 downto 0);
	signal U11_int : integer  := 0;

COMPONENT SYNC_DELAY
Generic (	maxDelay : integer := 16;
        	busWidth : integer := 1);
PORT(
    RESET: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    CLK: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    PORT_IN: IN STD_LOGIC_VECTOR(busWidth-1 DOWNTO 0); 
    DELAY: IN INTEGER; 
    PORT_OUT: OUT STD_LOGIC_VECTOR(busWidth-1 DOWNTO 0)); 
END COMPONENT;
signal U12_out : std_logic_vector(0 downto 0) := (others => '0');
	signal U13_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal U14_reset : std_logic_vector(0 downto 0);

begin
U0 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U13_OUT, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U3_Original,
        ENABLE => "1",
        COUNTER => U0_counts,
        OVERFLOW => open
    );
U1_OUT <= U12_out AND ( NOT sxt(U6_out,1));

	U2 : comparator
	Generic map(
		IN_SIZE => 	32,
		IN_SIGN => 	"unsigned",
		REGISTER_OUT => 	"false",
		OPERATION => 	"equal"
	)
	PORT MAP(
		in1 => U0_counts,
		in2 => U4_skip,
		clk => CLK_ACQ(0),
		comp_out => U2_OUT
	);

U3_Original <= Original;
U4_skip <= skip;
Reduced <= U1_OUT;

U6:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U2_OUT,
    DELAY => U9_CONST,
    GATE => U8_int,
    PORT_OUT => U6_out
);
U7_gate <= gate;
	U8_int <= conv_integer(U7_gate);
U9_CONST <= 0;
U10_delay <= delay;
	U11_int <= conv_integer(U10_delay);

U12:SYNC_DELAY
GENERIC MAP(
    maxDelay => 1024,
    busWidth => 1)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U3_Original,
    DELAY => U11_int,
    PORT_OUT => U12_out
);
U13_OUT <= U2_OUT OR U14_reset;
U14_reset <= reset;

end Behavioral;
