library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_trig is
    Port (	
		AIN : in std_logic_vector(15 downto 0);
hithrs : in std_logic_vector(15 downto 0);
lothrs : in std_logic_vector(15 downto 0);
xdelay : in std_logic_vector(15 downto 0);
delay : in std_logic_vector(15 downto 0);
inhib : in std_logic_vector(15 downto 0);
gate_u : in std_logic_vector(15 downto 0);
gate_l : in std_logic_vector(15 downto 0);
delayed_data : out std_logic_vector(15 downto 0);
OG_data : out std_logic_vector(15 downto 0);
pol : in std_logic_vector(0 downto 0);
trig : out std_logic_vector(0 downto 0);

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
end SUBPAGE_trig;

architecture Behavioral of SUBPAGE_trig is
signal U0_AIN : std_logic_vector(15 downto 0);
signal U1_hithrs : std_logic_vector(15 downto 0);
signal U2_lothrs : std_logic_vector(15 downto 0);
signal U3_xdelay : std_logic_vector(15 downto 0);
signal U4_delay : std_logic_vector(15 downto 0);
signal U5_inhib : std_logic_vector(15 downto 0);
	signal U6_b : STD_LOGIC_VECTOR(15 DOWNTO 0);

	COMPONENT polinvert
		GENERIC( 
			A_SIZE : INTEGER := 16;
			SIGN : STRING := "UNSIGNED";
			AN_SIZE : INTEGER := 16
		);
		PORT( 
			a : in STD_LOGIC_VECTOR(A_SIZE-1 downto 0);
			pol : in STD_LOGIC_VECTOR(0 downto 0);
			b : out STD_LOGIC_VECTOR(A_SIZE-1 downto 0)
		);
	END COMPONENT;

	signal U7_int : integer  := 0;
	signal U8_int : integer  := 0;
	signal U9_int : integer  := 0;
	signal U10_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal U11_gate_u : std_logic_vector(15 downto 0);
signal U12_gate_l : std_logic_vector(15 downto 0);
	signal U13_int : integer  := 0;
	signal U14_int : integer  := 0;

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
signal U15_delayed_data : std_logic_vector(15 downto 0) := (others => '0');
signal U15_trigger_out : std_logic_vector(0 downto 0) := (others => '0');
signal U16_delayed_data : std_logic_vector(15 downto 0) := (others => '0');
signal U16_trigger_out : std_logic_vector(0 downto 0) := (others => '0');

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
signal U17_out : std_logic_vector(15 downto 0) := (others => '0');
signal U18_out : std_logic_vector(15 downto 0) := (others => '0');
signal U21_pol : std_logic_vector(0 downto 0);
	signal U23_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U24_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
	signal U25_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);

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

	signal U26_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);

begin
U0_AIN <= AIN;
U1_hithrs <= hithrs;
U2_lothrs <= lothrs;
U3_xdelay <= xdelay;
U4_delay <= delay;
U5_inhib <= inhib;

	U6 : polinvert
	Generic map(
		A_SIZE => 	16,
		SIGN => 	"UNSIGNED",
		AN_SIZE => 	16
	)
	PORT MAP(
		a => U0_AIN,
		pol => U21_pol,
		b => U6_b
	);

	U7_int <= conv_integer(U4_delay);
	U8_int <= conv_integer(U3_xdelay);
	U9_int <= conv_integer(U5_inhib);
U10_OUT <= NOT U21_pol;
U11_gate_u <= gate_u;
U12_gate_l <= gate_l;
	U13_int <= conv_integer(U11_gate_u);
	U14_int <= conv_integer(U12_gate_l);

U15:TRIGGER_LEADING
Generic Map(	wordWidth =>16,
			noise_filter =>0,
			data_delay =>1)
port Map(
	RESET =>GlobalReset,
	CLK =>async_clk,
	CE =>"1",
	POLARITY =>U10_OUT,
	PORT_IN =>U16_delayed_data,
	THRESHOLD =>U1_hithrs,
	TRIGGER_INIB =>U9_int,
	DELAYED_DATA =>U15_delayed_data,
	TOT =>open,
	TRIGGER_OUT =>U15_trigger_out
);

U16:TRIGGER_LEADING
Generic Map(	wordWidth =>16,
			noise_filter =>0,
			data_delay =>1)
port Map(
	RESET =>GlobalReset,
	CLK =>async_clk,
	CE =>"1",
	POLARITY =>U10_OUT,
	PORT_IN =>U6_b,
	THRESHOLD =>U2_lothrs,
	TRIGGER_INIB =>U9_int,
	DELAYED_DATA =>U16_delayed_data,
	TOT =>open,
	TRIGGER_OUT =>U16_trigger_out
);

U17:SYNC_DELAY
GENERIC MAP(
    maxDelay => 16384,
    busWidth => 16)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U15_delayed_data,
    DELAY => U7_int,
    PORT_OUT => U17_out
);

U18:SYNC_DELAY
GENERIC MAP(
    maxDelay => 16384,
    busWidth => 16)
PORT MAP(
    RESET => GlobalReset,
    CLK => async_clk,
    PORT_IN => U17_out,
    DELAY => U8_int,
    PORT_OUT => U18_out
);
delayed_data <= U18_out;
OG_data <= U6_b;
U21_pol <= pol;
trig <= U24_OUT;
U23_OUT <= NOT U26_OUT;
U24_OUT <= U23_OUT AND U25_OUT;

	U25 : SW_GATE_AND_DELAY
	Generic map(
		maxDelay => 	64
	)
	PORT MAP(
		PORT_IN => U16_trigger_out,
		GATE => U14_int,
		DELAY => U7_int,
		PORT_OUT => U25_OUT,
		CLK => CLK_ACQ,
		RESET => "0"
	);


	U26 : SW_GATE_AND_DELAY
	Generic map(
		maxDelay => 	64
	)
	PORT MAP(
		PORT_IN => U15_trigger_out,
		GATE => U13_int,
		DELAY => U7_int,
		PORT_OUT => U26_OUT,
		CLK => CLK_ACQ,
		RESET => "0"
	);


end Behavioral;
