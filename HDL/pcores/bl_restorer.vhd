------------------------------------------------------------------
--						Nuclear Instruments						--
--																--
--							SciCompiler							--
--																--
--	Module:				BASELINE RESTORER						--
--	Version:			1.0										--
--	Creation Data:		09-10-2017								--
--																--
--																--
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
--Library UNISIM;
--use UNISIM.vcomponents.all;


entity BASELINE_RESTORER is
  Generic (	wordWidth : integer := 16);
  port (
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
	RUNNING_NOT_HOLD: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
	);
end;


architecture Behavioral of BASELINE_RESTORER is
	component moving_average is
	port (
		ap_clk : IN STD_LOGIC;
		ap_rst : IN STD_LOGIC;
		adc_data_V : IN STD_LOGIC_VECTOR (15 downto 0);
		adc_data_V_ap_vld : IN STD_LOGIC;
		hold : IN STD_LOGIC;
		length_V : IN STD_LOGIC_VECTOR (15 downto 0);
		dataout_V : OUT STD_LOGIC_VECTOR (15 downto 0);
		dataout_V_ap_vld : OUT STD_LOGIC );
	end component;


	signal DELAY_COUNTER : integer := 0;
	signal HOLD : std_logic := '0';
	signal sm_plr : std_logic_Vector(3 downto 0) := x"F";
	signal int_HOLD_TIME : std_logic_Vector(31 downto 0) := (others => '0');
	signal M_LENGTH_STD: std_logic_Vector(15 downto 0) := (others => '0');
begin
	RUNNING_NOT_HOLD(0) <= not HOLD;
	HOLD_TIME <= int_HOLD_TIME;
	M_LENGTH_STD <= conv_std_logic_vector(M_LENGTH,16);
	
	m_a: moving_average 
	port map(
		ap_clk => CLK(0),
		ap_rst => RESET(0),
		adc_data_V => DATA_IN,
		adc_data_V_ap_vld => CE(0),
		hold => HOLD,
		length_V => M_LENGTH_STD,
		dataout_V => BASELINE,
		dataout_V_ap_vld => open

		);


	bl_controller_process: process(CLK)
	begin
	if RESET = "1" or FLUSH="1" then
		BASELINE_VALID<=(others => '0');
		
		
		int_HOLD_TIME <= (others => '0');
		sm_plr<=x"F";
		
	elsif rising_edge(CLK(0)) and CE = "1"  then
		HOLD <= '0';
		BASELINE_VALID <= "1";
		case sm_plr is	
			when x"F" =>
				BASELINE_VALID <= "0";
				DELAY_COUNTER <= M_LENGTH+10;
				sm_plr <= x"E";
			when x"E" =>
				if DELAY_COUNTER = 0 then
					BASELINE_VALID <= "0";
					sm_plr <= x"0";
				else
					DELAY_COUNTER <= DELAY_COUNTER -1;
				end if;
				
				if TRIGGER = "1" then
					DELAY_COUNTER <= M_LENGTH;
				end if;
				
			when x"0" =>
				int_HOLD_TIME<=(others => '0');
				if TRIGGER = "1" then
					DELAY_COUNTER <= BL_HOLD;
					HOLD <= '1';
					sm_plr <= x"1";
				end if;
			
			when x"1" =>
				HOLD <= '1';
				int_HOLD_TIME <= int_HOLD_TIME +1;
				if TRIGGER = "1" then
					DELAY_COUNTER <= BL_HOLD;
				else
					if DELAY_COUNTER = 0 then
						sm_plr <= x"0";
					else
						DELAY_COUNTER <= DELAY_COUNTER -1;
					end if;
				end if;
			
			when others =>
				sm_plr <= x"0";
		end case;
			
	end if;
	end process;
end Behavioral; 