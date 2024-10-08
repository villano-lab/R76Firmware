library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_SaturationDetector is
    Port (	
		analog_in : in std_logic_vector(15 downto 0);
gate : in std_logic_vector(15 downto 0);
saturated : out std_logic_vector(0 downto 0);

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
end SUBPAGE_SaturationDetector;

architecture Behavioral of SUBPAGE_SaturationDetector is
signal U0_analog_in : std_logic_vector(15 downto 0);

COMPONENT TRIGGER_LEADING
Generic (	wordWidth : integer := 16;
			noise_filter : integer := 15;
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
signal U1_trigger_out : std_logic_vector(0 downto 0) := (others => '0');
signal U2_CONST : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	signal U3_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);

	COMPONENT SW_GATE_AND_DELAY
		GENERIC( 
			maxDelay : INTEGER := 64
		);
		PORT( 
			PORT_IN : in STD_LOGIC_VECTOR(0 downto 0);
			GATE : in INTEGER;
			DELAY : in INTEGER;
			PORT_OUT : out STD_LOGIC_VECTOR(0 downto 0);
			CLK : in STD_LOGIC_VECTOR(0 downto 0);
			RESET : in STD_LOGIC_VECTOR(0 downto 0)
		);
	END COMPONENT;

signal U4_gate : std_logic_vector(15 downto 0);
	signal U5_int : integer  := 0;
signal U7_CONST : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');

begin
U0_analog_in <= analog_in;

U1:TRIGGER_LEADING
Generic Map(	wordWidth =>16,
			noise_filter =>15,
			data_delay =>1)
port Map(
	RESET =>GlobalReset,
	CLK =>async_clk,
	CE =>"1",
	POLARITY =>U7_CONST,
	PORT_IN =>U0_analog_in,
	THRESHOLD =>U2_CONST,
	TRIGGER_INIB =>0,
	DELAYED_DATA =>open,
	TOT =>open,
	TRIGGER_OUT =>U1_trigger_out
);
U2_CONST <= std_logic_vector(ieee.numeric_std.resize(ieee.numeric_std.unsigned'(x"FFFF"),16));

	U3 : SW_GATE_AND_DELAY
	Generic map(
		maxDelay => 	64
	)
	PORT MAP(
		PORT_IN => U1_trigger_out,
		GATE => U5_int,
		DELAY => 0,
		PORT_OUT => U3_OUT,
		CLK => CLK_ACQ,
		RESET => "0"
	);

U4_gate <= gate;
	U5_int <= conv_integer(U4_gate);
saturated <= U3_OUT;
U7_CONST <= conv_std_logic_vector(1,1);

end Behavioral;
