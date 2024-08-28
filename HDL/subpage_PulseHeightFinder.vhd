library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_PulseHeightFinder is
    Port (	
		analog_in : in std_logic_vector(15 downto 0);
window : in std_logic_vector(15 downto 0);
trig : in std_logic_vector(0 downto 0);
max_out : out std_logic_vector(15 downto 0);
pre_int : in std_logic_vector(15 downto 0);
trig_delay : in std_logic_vector(15 downto 0);
ready : out std_logic_vector(0 downto 0);

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
end SUBPAGE_PulseHeightFinder;

architecture Behavioral of SUBPAGE_PulseHeightFinder is
	signal U0_VALUE : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal U0_DV : STD_LOGIC_VECTOR(0 DOWNTO 0);

	COMPONENT peak_finder
		GENERIC( 
			IN_SIZE : INTEGER := 16;
			IN_SIGN : STRING := "unsigned";
			OPERATION : STRING := "find_max"
		);
		PORT( 
			in_s : in STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
			serachLength : in INTEGER;
			START : in STD_LOGIC;
			CE : in STD_LOGIC;
			clk : in STD_LOGIC;
			peak_out : out STD_LOGIC_VECTOR(IN_SIZE-1 downto 0);
			position_out : out STD_LOGIC_VECTOR(15 downto 0);
			peak_dv : out STD_LOGIC_VECTOR(0 downto 0);
			track_hold : out STD_LOGIC_VECTOR(0 downto 0)
		);
	END COMPONENT;

signal U1_analog_in : std_logic_vector(15 downto 0);
signal U2_window : std_logic_vector(15 downto 0);
signal U3_trig : std_logic_vector(0 downto 0);
	signal U4_int : integer  := 0;

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
signal U6_out : std_logic_vector(0 downto 0) := (others => '0');
signal U7_pre_int : std_logic_vector(15 downto 0);
signal U8_out_0 : std_logic_vector(15 downto 0) := (others => '0');
signal U9_trig_delay : std_logic_vector(15 downto 0);
	signal U10_int : integer  := 0;

begin

	U0 : peak_finder
	Generic map(
		IN_SIZE => 	16,
		IN_SIGN => 	"unsigned",
		OPERATION => 	"find_max"
	)
	PORT MAP(
		in_s => U1_analog_in,
		serachLength => U4_int,
		START => U3_trig(0),
		CE => '1',
		clk => CLK_125(0),
		peak_out => U0_VALUE,
		position_out => open,
		peak_dv => U0_DV,
		track_hold => open
	);

U1_analog_in <= analog_in;
U2_window <= window;
U3_trig <= trig;
	U4_int <= conv_integer(U2_window);
max_out <= U0_VALUE;

U6:SYNC_DELAY
GENERIC MAP(
    maxDelay => 1024,
    busWidth => 1)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U0_DV,
    DELAY => U10_int,
    PORT_OUT => U6_out
);
U7_pre_int <= pre_int;
U8_out_0 <= U7_pre_int - U9_trig_delay;
U9_trig_delay <= trig_delay;
	U10_int <= conv_integer(U8_out_0);
ready <= U6_out;

end Behavioral;
