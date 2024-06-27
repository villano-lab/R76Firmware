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

entity SCALER is
  port (
	RESET: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	CE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	PORT_IN: IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	PORT_SCALE: IN INTEGER;
	PORT_OUT: OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
	);
end;

architecture Behavioral of SCALER is
	signal OSCALE : INTEGER := 0;
	signal ICOUNTER : INTEGER := 0;
	signal iPORT_OUT : STD_LOGIC;
begin

	-- bypass
	PORT_OUT(0) <= PORT_IN(0) when PORT_SCALE = 0 else iPORT_OUT;

	-- scale
	-- comment:
		-- freq_out = freq_in / i / 2
		-- The " / 2 " is given by the fact that assignments are performed at the rising_edge of the input clock
	scaler_process: process(PORT_IN)
	begin
		if RESET = "1" then
			OSCALE <= 0;
			ICOUNTER <= 0;
			iPORT_OUT <= '0';
		elsif rising_edge(PORT_IN(0)) and CE = "1" then
			OSCALE <= PORT_SCALE;
			--
			if OSCALE /= PORT_SCALE or PORT_SCALE = 0 then	-- do not increase the ICOUNTER when PORT_SCALE = 0
				ICOUNTER <= 0;
				iPORT_OUT <= '0';
			else
				if ICOUNTER = PORT_SCALE - 1 then
					ICOUNTER <= 0;
					iPORT_OUT <= not iPORT_OUT;
				else
					ICOUNTER <= ICOUNTER + 1;
				end if;
			end if;
		end if;
	end process;
end Behavioral; 