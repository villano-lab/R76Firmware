------------------------------------------------------------------
--						Nuclear Instruments						--
--																--
--							SciCompiler							--
--																--
--	Module:				DELAY (XILINX)							--
--	Version:			1.2										--
--	Creation Data:		27-5-2021								--
--																--
--																--
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;
use ieee.math_real.all;
Library xpm;
use xpm.vcomponents.all;


entity SYNC_DELAY is
  Generic (	maxDelay : integer := 16;
			busWidth : integer := 16);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    PORT_IN : IN STD_LOGIC_VECTOR (busWidth-1 DOWNTO 0);
	PORT_OUT: OUT STD_LOGIC_VECTOR (busWidth-1 downto 0);
	DELAY: IN INTEGER
	);
end;


architecture Behavioral of SYNC_DELAY is
constant maxDelayBits : integer := integer(ceil(log2(real(maxDelay))));
	signal RP : std_logic_vector(maxDelayBits-1 downto 0) := (others => '0');
	signal WP : std_logic_vector(maxDelayBits-1 downto 0) := (others => '0');
	signal iDELAY : integer range 0 to 65535;
	signal iIN : std_logic_vector(busWidth-1 downto 0);
	signal iIN1 : std_logic_vector(busWidth-1 downto 0);
	signal iIN2 : std_logic_vector(busWidth-1 downto 0);
	signal iIN3 : std_logic_vector(busWidth-1 downto 0);
	signal iIN4 : std_logic_vector(busWidth-1downto 0);
	signal iIN5 : std_logic_vector(busWidth-1 downto 0);
	signal iIN6 : std_logic_vector(busWidth-1 downto 0);
	signal iIN7 : std_logic_vector(busWidth-1 downto 0);
	
	signal memOut : std_logic_vector(busWidth-1 downto 0);
	
	signal intReset : std_logic := '0';
	signal cGATE : integer range 0 to 65535;
begin

	--NO_MUX: if maxDelay > 7 generate
    --begin
    --    PORT_OUT <=  memOut;
	--end generate;
	
	--YES_MUX: if maxDelay < 8 generate
    --begin
  		PORT_OUT <= PORT_IN when iDELAY = 0 else
					iIN  	when iDELAY = 1 else
					iIN1 	when iDELAY = 2 else
					iIN2 	when iDELAY = 3 else
					iIN3 	when iDELAY = 4 else
					iIN4 	when iDELAY = 5 else
					iIN5 	when iDELAY = 6 else
					iIN6 	when iDELAY = 7 else
					iIN7 	when iDELAY = 8 else
					memOut;       
	--end generate;

				

	timer_process: process(CLK,RESET)
	begin
		if rising_edge(CLK(0)) then
			if RESET(0) = '1' or intReset = '1' then
				intReset <= '0';
				WP <= (others => '0');
			else
				RP <= WP - conv_std_logic_vector(iDELAY-4, maxDelayBits);	-- da  valutare con la pratica un coefficiente di correzione che non Ã¨ -2
				WP <= WP +1;

				
				if iDELAY /= DELAY then
					iDELAY <= DELAY;
					intReset <= '1';
				end if;
				
				iIN <= PORT_IN;
				iIN1 <= iIN;
				iIN2 <= iIN1;
				iIN3 <= iIN2;
				iIN4 <= iIN3;
				iIN5 <= iIN4;
				iIN6 <= iIN5;
				iIN7 <= iIN6;
				
            end if;
        end if;
    end process;
    
	
	
USE_RAM:
   if maxDelay > 7 generate
      begin
		xpm_memory_sdpram_inst : xpm_memory_sdpram
		generic map (
			-- Common module generics
			MEMORY_SIZE => maxDelay * busWidth, --positive integer
			MEMORY_PRIMITIVE => "auto", --string; "auto", "distributed", "block" or "ultra" ;
			CLOCKING_MODE => "common_clock",--string; "common_clock", "independent_clock"
			MEMORY_INIT_FILE => "none", --string; "none" or "<filename>.mem"
			MEMORY_INIT_PARAM => "", --string;
			USE_MEM_INIT => 1, --integer; 0,1
			WAKEUP_TIME => "disable_sleep",--string; "disable_sleep" or "use_sleep_pin"
			MESSAGE_CONTROL => 0, --integer; 0,1
			-- Port A module generics
			WRITE_DATA_WIDTH_A => busWidth, --positive integer
			BYTE_WRITE_WIDTH_A => busWidth, --integer; 8, 9, or WRITE_DATA_WIDTH_A value
			ADDR_WIDTH_A => maxDelayBits, --positive integer
			-- Port B module generics
			READ_DATA_WIDTH_B => busWidth, --positive integer
			ADDR_WIDTH_B => maxDelayBits, --positive integer
			READ_RESET_VALUE_B => "0", --string
			READ_LATENCY_B => 2, --non-negative integer
			WRITE_MODE_B => "no_change" --string; "write_first", "read_first", "no_change"
			)
			port map (
			-- Common module ports
			sleep => '0',
			-- Port A module ports
			clka => CLK(0),
			ena => '1',
			wea => "1",
			addra => WP,
			dina => iIN,
			injectsbiterra => '0', --do not change
			injectdbiterra => '0', --do not change
			-- Port B module ports
			clkb => CLK(0),
			rstb => RESET(0),
			enb => '1',
			regceb => '1',
			addrb => RP,
			doutb => memOut,
			sbiterrb => open, --do not change
			dbiterrb => open --do not change
			);
   end generate;
			

end Behavioral; 