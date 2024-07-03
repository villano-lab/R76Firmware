------------------------------------------------------------------
--						Nuclear Instruments						--
--																--
--							SciCompiler							--
--																--
--	Module:				SINGLE SPECTRUM (XILINX)				--
--	Version:			1.0										--
--	Creation Data:		08-10-2017								--
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

entity XLX_SPECTRUM is
  Generic (	wordWidth : integer := 16;
			memLength : integer := 256
			);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK_WRITE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK_READ : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	ENERGY : in  STD_LOGIC_VECTOR (15 downto 0);
    ENERGY_STROBE : in  STD_LOGIC_VECTOR (0 DOWNTO 0);
	P_running : out std_logic;
	P_acceptedPulse : out std_logic;	
	READ_ADDRESS: IN STD_LOGIC_VECTOR (15 downto 0);
	READ_DATA: OUT STD_LOGIC_VECTOR (31 downto 0);
	READ_INT: IN STD_LOGIC_VECTOR (0 downto 0);
	READ_DATAVALID: OUT STD_LOGIC_VECTOR (0 downto 0);
	STATUS : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	CONFIG : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	CONFIG_LIMIT : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	CONFIG_REBIN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	CONFIG_MIN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
	CONFIG_MAX : IN STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end;


architecture Behavioral of XLX_SPECTRUM is
	constant addressBits : integer := integer(ceil(log2(real(memLength))));

	signal sm_spectrum : std_logic_vector(2 downto 0) := "000";

   signal wea :   STD_LOGIC_VECTOR(0 DOWNTO 0):="0";
   signal addra : STD_LOGIC_VECTOR(addressBits-1 DOWNTO 0):= (others => '0');
   signal addrb : STD_LOGIC_VECTOR(addressBits-1 DOWNTO 0):= (others => '0');
   signal addr_ones : STD_LOGIC_VECTOR(addressBits-1 DOWNTO 0):= (others => '1');
   signal addr_zeros : STD_LOGIC_VECTOR(addressBits-1 DOWNTO 0):= (others => '0');
   signal dina :  STD_LOGIC_VECTOR(wordWidth-1 DOWNTO 0):= (others => '0');
   signal douta : STD_LOGIC_VECTOR(wordWidth-1 DOWNTO 0):= (others => '0');
   signal din_ones :  STD_LOGIC_VECTOR(wordWidth-1 DOWNTO 0):= (others => '1');
   signal din_zeros :  STD_LOGIC_VECTOR(wordWidth-1 DOWNTO 0):= (others => '0');
   signal web :   STD_LOGIC_VECTOR(0 DOWNTO 0):="0";
   signal dinb :  STD_LOGIC_VECTOR(wordWidth-1 DOWNTO 0):= (others => '0');
   signal doutb : STD_LOGIC_VECTOR(wordWidth-1 DOWNTO 0):= (others => '0');
	
	signal rd1 : std_logic;
	signal rd2 : std_logic;
	
	signal TimeREG : std_logic := '0';
	
	signal DATAIN : STD_LOGIC_VECTOR(13 DOWNTO 0);
	signal DATASTROBE : STD_LOGIC;
	
		
	signal enable : std_logic := '1';
	signal enableL : std_logic := '1';
	signal flush : std_logic := '0';
	signal limitmode : std_logic_vector(1 downto 0) := (others => '0');
	signal limit : std_logic_vector(27 downto 0) := (others => '0'); 
	signal limitcnt : std_logic_vector(27 downto 0) := (others => '0'); 
	signal limitcnt2 : std_logic_vector(27 downto 0) :=  (others => '0');
	signal timecnt : std_logic_vector(27 downto 0) :=  (others => '0');
	signal mspulse : std_logic := '0';
	signal resetcounter : std_logic := '0';
	
	signal enableGLOBAL : std_logic := '0';
	

	
	attribute keep : string;
	attribute keep of rd1 : signal is "true";
	attribute keep of rd2 : signal is "true";
	attribute keep of sm_spectrum : signal is "true";
	attribute keep of addra : signal is "true";
	
	signal enableb : std_logic;
	signal regENABLE : std_logic_vector (1 downto 0) := "00";

	signal spectrum_decimator : std_logic_vector (2 downto 0) := "000";
	
	signal ASCAWinLow : std_logic_vector (15 downto 0) := x"0000";
	signal ASCAWinHIGH : std_logic_vector (15 downto 0) := x"0000";
	
	signal BSCAWinLow : std_logic_vector (15 downto 0) := x"0000";
    signal BSCAWinHIGH : std_logic_vector (15 downto 0) := x"0000";	

	signal completed : std_logic := '0';
begin
	


	xpm_memory_tdpram_inst : xpm_memory_tdpram
	generic map (
	-- Common module generics
	MEMORY_SIZE => memLength*wordWidth, --positive integer
	MEMORY_PRIMITIVE => "auto", --string; "auto", "distributed", "block" or "ultra" ;
	CLOCKING_MODE => "independent_clock",--string; "common_clock", "independent_clock"
	MEMORY_INIT_FILE => "none", --string; "none" or "<filename>.mem"
	MEMORY_INIT_PARAM => "", --string;
	USE_MEM_INIT => 0, --integer; 0,1
	WAKEUP_TIME => "disable_sleep",--string; "disable_sleep" or "use_sleep_pin"
    MESSAGE_CONTROL         => 0,               --integer;
    ECC_MODE                => "no_ecc",        --string; "no_ecc", "encode_only", "decode_only" or "both_encode_and_decode" 
    AUTO_SLEEP_TIME         => 0,               --Do not Change
   -- USE_EMBEDDED_CONSTRAINT => 0,               --integer: 0,1
   -- MEMORY_OPTIMIZATION     => "true",          --string; "true", "false" 

	-- Port A module generics
	WRITE_DATA_WIDTH_A => wordWidth, --positive integer
	READ_DATA_WIDTH_A => wordWidth, --positive integer
	BYTE_WRITE_WIDTH_A => wordWidth, --integer; 8, 9, or WRITE_DATA_WIDTH_A value
	ADDR_WIDTH_A => addressBits, --positive integer
	READ_RESET_VALUE_A => "0", --string
	READ_LATENCY_A => 1, --non-negative integer
	WRITE_MODE_A => "no_change", --string; "write_first", "read_first", "no_change"
	-- Port B module generics
	WRITE_DATA_WIDTH_B => wordWidth, --positive integer
	READ_DATA_WIDTH_B => wordWidth, --positive integer
	BYTE_WRITE_WIDTH_B => wordWidth, --integer; 8, 9, or WRITE_DATA_WIDTH_B value
	ADDR_WIDTH_B => addressBits, --positive integer
	READ_RESET_VALUE_B => "0", --string
	READ_LATENCY_B => 1, --non-negative integer
	WRITE_MODE_B => "read_first" --string; "write_first", "read_first", "no_change"
	)
	port map (
	-- Common module ports
	sleep => '0',
	-- Port A module ports
	clka => CLK_WRITE(0),
	rsta => RESET(0),
	ena => '1',
	regcea => '1',
	wea => wea,
	addra => addra,
	dina => dina,
	injectsbiterra => '0', --do not change
	injectdbiterra => '0', --do not change
	douta => douta,
	sbiterra => open, --do not change
	dbiterra => open, --do not change
	-- Port B module ports
	clkb => CLK_READ(0),
	rstb => RESET(0),
	enb => '1',
	regceb => '1',
	web => web,
	addrb => READ_ADDRESS(addressBits-1 downto 0),
	dinb => dinb,
	injectsbiterrb => '0', --do not change
	injectdbiterrb => '0', --do not change
	doutb => doutb,
	sbiterrb => open, --do not change
	dbiterrb => open --do not change
	);
	
	DATASTROBE <= energy_strobe(0);
	DATAIN <= energy(13 downto 0);
	
	READ_DATA <= ext(doutb,32);
  
  enable <= CE(0);
  
  enableGLOBAL <= enable and enableL and enableb;
  
	mainprocspectrum: process (CLK_WRITE(0))
	begin
		if rising_edge(CLK_WRITE(0)) then
			if reset(0)= '1' then
				sm_spectrum <= "000";
			else
				web <= "0";
				rd1 <= READ_INT(0);
				rd2 <= rd1;
--				if READ_INT(0) = '1' then
--					READ_DATA <= ext(doutb,32);
--					web <= "1";
--					dinb <= (others => '0');
--				end if;
				
				
					P_acceptedPulse <= '0';
				
				wea <= "0";
				case sm_spectrum is 
					when "000" =>
						
						addra <= (others => '0');
						wea <= "1";
						sm_spectrum <= "001";
					when "001" =>
						dina <= (others => '0');
						addra <= addra +1;
						wea <= "1";
						if addra = addr_ones then
							sm_spectrum <= "010";
							limitcnt <= (others => '0');
						end if;
					
					--ATTENZIONE!!!! E' possibile che io legga qualcosa mentre sto aggiornando duplicando i risultati. SISTEMARE!!!
					when "010" =>

						
						if DATASTROBE = '1'  and enableGLOBAL = '1' then
							case  spectrum_decimator is
								when "000" =>
									addra <= ext(DATAIN, addressBits);					--16386
								when "001" =>
									addra <= ext(DATAIN (13 downto 1), addressBits);	--8192
								when "010" =>
									addra <= ext(DATAIN (13 downto 2), addressBits);	--4096
								when "011" =>
									addra <= ext(DATAIN (13 downto 3), addressBits);	--2048
								when "100" =>
									addra <= ext(DATAIN (13 downto 4), addressBits);	--1024
								when "101" =>
									addra <= ext(DATAIN (13 downto 5), addressBits);	--512
								when "110" =>
									addra <= ext(DATAIN (13 downto 6), addressBits);	--256
								when "111" =>
									addra <= ext(DATAIN (13 downto 7), addressBits);	--128
								
								when others =>
									addra <= DATAIN;
							end case;
							
							sm_spectrum <= "011";
						end if;
					
					when "011" =>
					
					
						sm_spectrum <= "100";
						if limitmode = "01" then
							limitcnt <= limitcnt + 1;
						end if;

					when "100" =>
						dina <= douta + 1;
						
						wea <= "1";
						sm_spectrum <= "010";
						P_acceptedPulse <= '1';
					
					when others =>
				end case;
				
			end if;
			


			
			mspulse <= '0';
			
			if conv_integer(limitcnt2) = 80000 then
				mspulse <= '1';
				limitcnt2 <= (others => '0');
			else
				limitcnt2 <= limitcnt2 + 1;
			end if;
			
			if limitmode = "00" then
				enableL <= '1';
			end if;
			
			if limitmode = "01" then
				if limitcnt = limit then
					enableL <= '0';
					completed <= '1';
				else
					enableL <= '1';
				end if;
			end if;
			
			if limitmode = "10" then
				if limitcnt = limit then
					enableL <= '0';
					completed <= '1';
				else
					if mspulse = '1' and enable = '1' then
					limitcnt <= limitcnt +1;
					end if;	
					enableL <= '1';
				end if;			
			end if;
					
			if limitmode = "00" then
				P_running  <= enable;
			else
				P_running  <= enable and enableL;
			end if;
			
			if resetcounter = '1' then
				limitcnt <= (others => '0');
				completed <= '0';
			end if;
			
			if flush = '1' then
				sm_spectrum <= "000";
				completed <= '0';
			end if;
			
			
		end if;
	end process;

	flush <= CONFIG(0);
	resetcounter <= CONFIG(1);
	enableb <= CONFIG(2);
	spectrum_decimator<=CONFIG_REBIN(2 downto 0);
	limitmode <= CONFIG_LIMIT(31 downto 30);
	limit <= CONFIG_LIMIT(27 downto 0);
	STATUS(0)<= enableGLOBAL;
	STATUS(1)<= completed;
	STATUS(31 downto 4) <= limitcnt;
	READ_DATAVALID <= "1";

end Behavioral; 