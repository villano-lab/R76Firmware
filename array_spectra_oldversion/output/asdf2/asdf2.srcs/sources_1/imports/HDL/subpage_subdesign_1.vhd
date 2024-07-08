library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_subdesign_1 is
    Port (	
		ain : in std_logic_vector(15 downto 0);
pol : in std_logic_vector(0 downto 0);
hithrs : in std_logic_vector(15 downto 0);
lothrs : in std_logic_vector(15 downto 0);
inhib : in std_logic_vector(15 downto 0);
gatel : in std_logic_vector(15 downto 0);
gateu : in std_logic_vector(15 downto 0);
delay : in std_logic_vector(15 downto 0);
xdelay : in std_logic_vector(15 downto 0);
delayed_data : out std_logic_vector(15 downto 0);
trigout : out std_logic_vector(0 downto 0);

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
end SUBPAGE_subdesign_1;

architecture Behavioral of SUBPAGE_subdesign_1 is
signal U0_ain : std_logic_vector(15 downto 0);
signal U1_pol : std_logic_vector(0 downto 0);
signal U2_hithrs : std_logic_vector(15 downto 0);
signal U3_lothrs : std_logic_vector(15 downto 0);
signal U4_inhib : std_logic_vector(15 downto 0);
signal U5_gatel : std_logic_vector(15 downto 0);
signal U6_gateu : std_logic_vector(15 downto 0);
signal U7_delay : std_logic_vector(15 downto 0);
signal U8_xdelay : std_logic_vector(15 downto 0);
	signal U9_int : integer  := 0;
	signal U10_int : integer  := 0;
	signal U11_int : integer  := 0;
	signal U12_int : integer  := 0;
	signal U13_int : integer  := 0;
	signal U14_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U15_b : STD_LOGIC_VECTOR(15 DOWNTO 0);

	COMPONENT polinvert
		GENERIC( 
			A_SIZE : INTEGER := 16;
			SIGN : STRING := "SIGNED";
			AN_SIZE : INTEGER := 16
		);
		PORT( 
			a : in STD_LOGIC_VECTOR(A_SIZE-1 downto 0);
			pol : in STD_LOGIC_VECTOR(0 downto 0);
			b : out STD_LOGIC_VECTOR(A_SIZE-1 downto 0)
		);
	END COMPONENT;


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
signal U16_delayed_data : std_logic_vector(15 downto 0) := (others => '0');
signal U16_trigger_out : std_logic_vector(0 downto 0) := (others => '0');
signal U17_delayed_data : std_logic_vector(15 downto 0) := (others => '0');
signal U17_trigger_out : std_logic_vector(0 downto 0) := (others => '0');

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
signal U18_out : std_logic_vector(0 downto 0) := (others => '0');
signal U19_out : std_logic_vector(0 downto 0) := (others => '0');

COMPONENT SYNC_DELAY
Generic (	maxDelay : integer := 16;
        	busWidth : integer := 16);
PORT(
    RESET: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    CLK: IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
    PORT_IN: IN STD_LOGIC_VECTOR(busWidth-1 DOWNTO 0); 
    DELAY: IN INTEGER; 
    PORT_OUT: OUT STD_LOGIC_VECTOR(busWidth-1 DOWNTO 0)); 
END COMPONENT;
signal U20_out : std_logic_vector(15 downto 0) := (others => '0');
signal U21_out : std_logic_vector(15 downto 0) := (others => '0');
	signal U23_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);

begin
U0_ain <= ain;
U1_pol <= pol;
U2_hithrs <= hithrs;
U3_lothrs <= lothrs;
U4_inhib <= inhib;
U5_gatel <= gatel;
U6_gateu <= gateu;
U7_delay <= delay;
U8_xdelay <= xdelay;
	U9_int <= conv_integer(U4_inhib);
	U10_int <= conv_integer(U5_gatel);
	U11_int <= conv_integer(U6_gateu);
	U12_int <= conv_integer(U7_delay);
	U13_int <= conv_integer(U8_xdelay);
U14_OUT <= NOT U1_pol;

	U15 : polinvert
	Generic map(
		A_SIZE => 	16,
		SIGN => 	"SIGNED",
		AN_SIZE => 	16
	)
	PORT MAP(
		a => U0_ain,
		pol => U1_pol,
		b => U15_b
	);


U16:TRIGGER_LEADING
Generic Map(	wordWidth =>16,
			noise_filter =>0,
			data_delay =>1)
port Map(
	RESET =>GlobalReset,
	CLK =>async_clk,
	CE =>"1",
	POLARITY =>U14_OUT,
	PORT_IN =>U17_delayed_data,
	THRESHOLD =>U2_hithrs,
	TRIGGER_INIB =>0,
	DELAYED_DATA =>U16_delayed_data,
	TOT =>open,
	TRIGGER_OUT =>U16_trigger_out
);

U17:TRIGGER_LEADING
Generic Map(	wordWidth =>16,
			noise_filter =>0,
			data_delay =>1)
port Map(
	RESET =>GlobalReset,
	CLK =>async_clk,
	CE =>"1",
	POLARITY =>U14_OUT,
	PORT_IN =>U15_b,
	THRESHOLD =>U3_lothrs,
	TRIGGER_INIB =>U9_int,
	DELAYED_DATA =>U17_delayed_data,
	TOT =>open,
	TRIGGER_OUT =>U17_trigger_out
);

U18:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U16_trigger_out,
    DELAY => 1,
    GATE => U11_int,
    PORT_OUT => U18_out
);

U19:SW_GATE_AND_DELAY
GENERIC MAP(
    maxDelay => 1024)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U17_trigger_out,
    DELAY => U12_int,
    GATE => U10_int,
    PORT_OUT => U19_out
);

U20:SYNC_DELAY
GENERIC MAP(
    maxDelay => 16384,
    busWidth => 16)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U16_delayed_data,
    DELAY => U12_int,
    PORT_OUT => U20_out
);

U21:SYNC_DELAY
GENERIC MAP(
    maxDelay => 16384,
    busWidth => 16)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U20_out,
    DELAY => U13_int,
    PORT_OUT => U21_out
);
delayed_data <= U21_out;
U23_OUT <= U19_out AND ( NOT sxt(U18_out,1));
trigout <= U23_OUT;

end Behavioral;
