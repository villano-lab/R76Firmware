------------------------------------------------------------------
--						Nuclear Instruments						--
--																--
--							SciCompiler							--
--																--
--	Module:				SCALER									--
--	Version:			1.0										--
--	Creation Data:		13-07-2017								--
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


entity TRIGGER_LEADING is
  Generic (	wordWidth : integer := 16;
			noise_filter : integer := 2;
			data_delay : integer := 3);
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
end;


architecture Behavioral of TRIGGER_LEADING is
	
	signal iTOT : std_logic := '0';
	signal oTOT : std_logic := '0';
	
	type tMemData is array (0 to data_delay) of std_logic_vector(wordWidth-1 downto 0) ;
	signal MemOutput : tMemData := (others => (others => '0'));

	signal iTRIGGER : std_logic_vector(noise_filter downto 0) := (others => '0');
	signal trigger_kill_counter : integer := 0;
	signal trigger_kill : std_logic := '0';
begin


	l_edge_process: process(CLK)
	begin
	if RESET = "1" then
		iTOT <= '0';
		oTOT <= '0';
		trigger_kill_counter <=0;
		TRIGGER_OUT <= "0";
	elsif rising_edge(CLK(0)) and CE = "1"  then
		TRIGGER_OUT <= "0";
		if data_delay > 0 then
			for I in 0 to data_delay-1 loop
				MemOutput(I) <= MemOutput(I + 1);
			end loop;
			MemOutput(data_delay) <= PORT_IN;
			DELAYED_DATA <= MemOutput(0);
		else
			MemOutput(0) <= PORT_IN;
			DELAYED_DATA <= MemOutput(0);
		end if;
	
		if POLARITY= "0" then
			if PORT_IN >= THRESHOLD then
				iTOT <= '1';
			else
				iTOT <= '0';
			end if;
		else
			if PORT_IN <= THRESHOLD then
				iTOT <= '1';
			else
				iTOT <= '0';
			end if;		
		end if;
		
		TOT(0) <= iTOT;
		oTOT <= iTOT;
		
		if trigger_kill_counter = 0 then
            trigger_kill <= '0';
            if iTOT = '1' and oTOT ='0' and trigger_kill='0' then
                TRIGGER_OUT <= "1";
                trigger_kill_counter <= TRIGGER_INIB;
                trigger_kill <= '1';
            end if;
        else
            trigger_kill_counter <= trigger_kill_counter -1;
        end if;
	end if;
	end process;
end Behavioral; 