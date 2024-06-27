library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.numeric_std.all;
use ieee.math_real.all;



entity SUBPAGE_clean_interrupt is
    Port (	
		digital_in : in std_logic_vector(0 downto 0);
digital_out : out std_logic_vector(0 downto 0);

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
end SUBPAGE_clean_interrupt;

architecture Behavioral of SUBPAGE_clean_interrupt is
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

signal U2_CONST : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal U3_OUT : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal U4_digital_in : std_logic_vector(0 downto 0);

begin
U0 : COUNTER_RISING
    Generic map(bitSize => 32 )
    port map( 
        RESET => U3_OUT, 
        CE => "1",
        CLK => async_clk,
        SIGIN => U4_digital_in,
        ENABLE => "1",
        COUNTER => U0_counts,
        OVERFLOW => open
    );

	U1 : comparator
	Generic map(
		IN_SIZE => 	32,
		IN_SIGN => 	"unsigned",
		REGISTER_OUT => 	"false",
		OPERATION => 	"equal"
	)
	PORT MAP(
		in1 => U0_counts,
		in2 => U2_CONST,
		clk => CLK_125(0),
		comp_out => U1_OUT
	);

U2_CONST <= conv_std_logic_vector(1,32);

	U3 : comparator
	Generic map(
		IN_SIZE => 	32,
		IN_SIGN => 	"unsigned",
		REGISTER_OUT => 	"false",
		OPERATION => 	"greater"
	)
	PORT MAP(
		in1 => U0_counts,
		in2 => U2_CONST,
		clk => CLK_125(0),
		comp_out => U3_OUT
	);

U4_digital_in <= digital_in;
digital_out <= U1_OUT;

end Behavioral;
