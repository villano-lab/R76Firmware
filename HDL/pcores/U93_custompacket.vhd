
    library IEEE;
    use IEEE.STD_LOGIC_1164.ALL;
    use IEEE.STD_LOGIC_ARITH.ALL;
    use IEEE.STD_LOGIC_UNSIGNED.ALL;
    use IEEE.STD_LOGIC_MISC.ALL;

    use ieee.math_real.all;
    Library xpm;
    use xpm.vcomponents.all;

entity U93_custompacket is
  Generic (	wordWidth : integer := 32;
			memLength : integer := 4096);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    
	CLK_WRITE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK_READ : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    	IN_2 : STD_LOGIC_VECTOR(15 downto 0);
	IN_3 : STD_LOGIC_VECTOR(15 downto 0);
	IN_4 : STD_LOGIC_VECTOR(15 downto 0);
	IN_5 : STD_LOGIC_VECTOR(15 downto 0);
	IN_6 : STD_LOGIC_VECTOR(15 downto 0);
	IN_7 : STD_LOGIC_VECTOR(15 downto 0);
	IN_8 : STD_LOGIC_VECTOR(15 downto 0);
	IN_9 : STD_LOGIC_VECTOR(15 downto 0);
	IN_10 : STD_LOGIC_VECTOR(15 downto 0);
	IN_11 : STD_LOGIC_VECTOR(15 downto 0);
	IN_12 : STD_LOGIC_VECTOR(15 downto 0);
	IN_13 : STD_LOGIC_VECTOR(15 downto 0);
	IN_14 : STD_LOGIC_VECTOR(15 downto 0);
	IN_15 : STD_LOGIC_VECTOR(15 downto 0);
	IN_16 : STD_LOGIC_VECTOR(15 downto 0);
	IN_17 : STD_LOGIC_VECTOR(15 downto 0);
	IN_18 : STD_LOGIC_VECTOR(15 downto 0);
	IN_19 : STD_LOGIC_VECTOR(15 downto 0);
	IN_20 : STD_LOGIC_VECTOR(15 downto 0);
	IN_21 : STD_LOGIC_VECTOR(15 downto 0);
	IN_22 : STD_LOGIC_VECTOR(15 downto 0);
	IN_23 : STD_LOGIC_VECTOR(15 downto 0);
	IN_24 : STD_LOGIC_VECTOR(15 downto 0);
	IN_25 : STD_LOGIC_VECTOR(15 downto 0);
	IN_26 : STD_LOGIC_VECTOR(15 downto 0);
	IN_27 : STD_LOGIC_VECTOR(15 downto 0);
	IN_28 : STD_LOGIC_VECTOR(15 downto 0);
	IN_29 : STD_LOGIC_VECTOR(15 downto 0);
	IN_30 : STD_LOGIC_VECTOR(15 downto 0);
	IN_31 : STD_LOGIC_VECTOR(15 downto 0);
	IN_32 : STD_LOGIC_VECTOR(15 downto 0);
	IN_33 : STD_LOGIC_VECTOR(15 downto 0);
	IN_1 : STD_LOGIC_VECTOR(31 downto 0);
	IN_34 : STD_LOGIC_VECTOR(31 downto 0);

	
	TRIG : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	
	SYNC_TRIG : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	SYNC_RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	SYNC_CLK : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	
	READ_DATA: OUT STD_LOGIC_VECTOR (31 downto 0);
	READ_DATAVALID: OUT STD_LOGIC_VECTOR (0 downto 0);
	READ_RD_INT: IN STD_LOGIC_VECTOR (0 downto 0);
	READ_STATUS : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	READ_VALID_WORDS : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
	
	CONFIG : IN STD_LOGIC_VECTOR (31 DOWNTO 0);                                              
    RUN: OUT STD_LOGIC_VECTOR (0 downto 0);
	BUSY: OUT STD_LOGIC_VECTOR (0 downto 0);
	FIFO_FULL: OUT STD_LOGIC_VECTOR (0 downto 0)
	);
end;
    architecture Behavioral of  U93_custompacket  is
    constant MaxPacketSize : integer := 19;
	constant TotalWords : integer := memLength;
	
	constant busWidthWrite : integer := 32;
	constant busWidthRead : integer := 32;
	constant wBits : integer := integer(ceil(log2(real(TotalWords))));
	constant rBits : integer := integer(ceil(log2(real(TotalWords * busWidthWrite/busWidthRead))));

	constant MemLogLen : integer := integer(ceil(log2(real(memLength))));
	
    	signal lIN_2 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_3 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_4 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_5 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_6 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_7 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_8 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_9 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_10 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_11 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_12 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_13 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_14 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_15 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_16 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_17 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_18 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_19 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_20 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_21 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_22 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_23 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_24 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_25 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_26 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_27 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_28 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_29 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_30 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_31 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_32 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_33 : STD_LOGIC_VECTOR(15 downto 0);
	signal lIN_1 : STD_LOGIC_VECTOR(31 downto 0);
	signal lIN_34 : STD_LOGIC_VECTOR(31 downto 0);


	signal FIFO_PORT_IN : STD_LOGIC_VECTOR (31 DOWNTO 0); 
	signal FIFO_FULL_IN : STD_LOGIC := '0';
	signal FIFO_EMPTY  : STD_LOGIC := '0';
	signal FIFO_RD  : STD_LOGIC := '0';
	signal FIFO_WE  : STD_LOGIC := '0';
	signal FIFO_PORT_OUT : STD_LOGIC_VECTOR (31 DOWNTO 0); 
	signal FIFO_FLUSH : STD_LOGIC := '0';
	
	signal SMSI : integer range 0 to 19 + 10 := 0;
	signal COUNTER_IN : std_logic_vector (31 downto 0);
	signal COUNTER_IN_GLOBAL : std_logic_vector (31 downto 0);
	signal TIMESTAMP : std_logic_vector (31 downto 0);
	signal COUNTER_IN_GLOBALs : std_logic_vector (31 downto 0);
	signal TIMESTAMPs : std_logic_vector (31 downto 0);

	signal oExtSignal : std_logic;
	signal iExtSignal : std_logic;

	signal iTrig : std_logic;
	signal oTrig : std_logic;

    signal AVAL_WORD : std_logic_vector (rBits-1 downto 0) := (others => '0');
    begin

    
    xpm_fifo_async_inst : xpm_fifo_async
    generic map (
	    FIFO_MEMORY_TYPE => "auto", --string; "auto", "block", or "distributed";
	    ECC_MODE => "no_ecc", --string; "no_ecc" or "en_ecc";
	    RELATED_CLOCKS => 0, --positive integer; 0 or 1
	    FIFO_WRITE_DEPTH => TotalWords , --positive integer
	    WRITE_DATA_WIDTH => busWidthWrite, --positive integer
	    WR_DATA_COUNT_WIDTH => wBits, --positive integer
	    PROG_FULL_THRESH => TotalWords-MaxPacketSize, --positive integer
	    FULL_RESET_VALUE => 0, --positive integer; 0 or 1;
	    READ_MODE => "std", --string; "std" or "fwft";
	    FIFO_READ_LATENCY => 1, --positive integer;
	    READ_DATA_WIDTH => busWidthRead, --positive integer
	    RD_DATA_COUNT_WIDTH => rBits, --positive integer
	    PROG_EMPTY_THRESH => 3, --positive integer
	    DOUT_RESET_VALUE => "0", --string
	    CDC_SYNC_STAGES => 2, --positive integer
	    WAKEUP_TIME => 0 --positive integer; 0 or 2;
    )
    port map (
	    sleep => '0',
	    rst => FIFO_FLUSH,
	    wr_clk => CLK_WRITE(0),
	    wr_en => FIFO_WE,
	    din => FIFO_PORT_IN,
	    full => open,
	    overflow => open,
	    wr_rst_busy => open,
	    rd_clk => CLK_READ(0),
	    rd_en => FIFO_RD,
	    dout => FIFO_PORT_OUT,
	    empty => open,
	    underflow => open,
	    rd_rst_busy => open,
	    prog_full => FIFO_FULL_IN,
	    wr_data_count => open,
	    prog_empty => FIFO_EMPTY,
	    rd_data_count => AVAL_WORD,
	    injectsbiterr => '0',
	    injectdbiterr => '0',
	    sbiterr => open,
	    dbiterr => open
    );

    READ_VALID_WORDS <= ext(AVAL_WORD,32);

	READ_STATUS(1) <= CONFIG (0);
	READ_STATUS(0) <= FIFO_EMPTY;
	READ_STATUS(2) <= FIFO_FULL_IN;
    READ_STATUS(31 downto 8) <= ext(AVAL_WORD,24);

	READ_DATAVALID(0) <= not FIFO_EMPTY;
	READ_DATA <= FIFO_PORT_OUT;
	FIFO_RD <= READ_RD_INT(0);
	FIFO_FULL(0) <= FIFO_FULL_IN;
	
	timeStampProc : process(SYNC_CLK(0))
	begin
		if RESET="1" or CONFIG (1) = '1' or SYNC_RESET(0) ='1' then	
			COUNTER_IN_GLOBAL <= (others => '0');
			TIMESTAMP <= (others => '0');
		elsif rising_edge(SYNC_CLK(0)) then
			TIMESTAMP <= TIMESTAMP+1;
			iExtSignal <= SYNC_TRIG(0);
			oExtSignal <= iExtSignal;
			if iExtSignal = '1' and oExtSignal = '0' then
				COUNTER_IN_GLOBAL <= COUNTER_IN_GLOBAL +1;
			end if;
			
		end if;
	end process;
	
		
	xpm_RunTimer: xpm_cdc_array_single
	  generic map (

		-- Common module generics
		DEST_SYNC_FF   => 4, -- integer; range: 2-10
		INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
		SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
		SRC_INPUT_REG  => 1, -- integer; 0=do not register input, 1=register input
		WIDTH          => 32  -- integer; range: 1-1024

	  )
	  port map (

		src_clk  => SYNC_CLK(0),  -- optional; required when SRC_INPUT_REG = 1
		src_in   => TIMESTAMP,
		dest_clk => CLK_WRITE(0),
		dest_out => TIMESTAMPs
	  );

	xpm_GlobalCounter: xpm_cdc_array_single
	  generic map (

		-- Common module generics
		DEST_SYNC_FF   => 4, -- integer; range: 2-10
		INIT_SYNC_FF   => 0, -- integer; 0=disable simulation init values, 1=enable simulation init values
		SIM_ASSERT_CHK => 0, -- integer; 0=disable simulation messages, 1=enable simulation messages
		SRC_INPUT_REG  => 1, -- integer; 0=do not register input, 1=register input
		WIDTH          => 32  -- integer; range: 1-1024

	  )
	  port map (

		src_clk  => SYNC_CLK(0),  -- optional; required when SRC_INPUT_REG = 1
		src_in   => COUNTER_IN_GLOBAL,
		dest_clk => CLK_WRITE(0),
		dest_out => COUNTER_IN_GLOBALs
	  );

	  
	
	TransferProcess : process(CLK_WRITE(0))
	begin
		if RESET="1" or CONFIG (1) = '1' or SYNC_RESET(0) ='1' then	
			COUNTER_IN <= (others => '0');
			FIFO_FLUSH <= '1';
			FIFO_WE <= '0';
            BUSY(0) <= '1';
            RUN(0) <= '0';
		elsif rising_edge(CLK_WRITE(0)) then
			FIFO_FLUSH <= CONFIG (2);
			FIFO_WE <= '0';
			iTrig <= TRIG(0);
			oTrig <= iTrig;
            
            RUN(0) <= CONFIG (0);

			case SMSI is
				when 0 =>
					BUSY(0) <= (not CONFIG (0)) or  FIFO_FULL_IN ;
					if iTrig = '1' and oTrig = '0' and CONFIG (0) = '1' and FIFO_FULL_IN = '0' then
						SMSI <= 1;
						COUNTER_IN <= COUNTER_IN +1;
						BUSY <= "1";
lIN_2 <= IN_2;
lIN_3 <= IN_3;
lIN_4 <= IN_4;
lIN_5 <= IN_5;
lIN_6 <= IN_6;
lIN_7 <= IN_7;
lIN_8 <= IN_8;
lIN_9 <= IN_9;
lIN_10 <= IN_10;
lIN_11 <= IN_11;
lIN_12 <= IN_12;
lIN_13 <= IN_13;
lIN_14 <= IN_14;
lIN_15 <= IN_15;
lIN_16 <= IN_16;
lIN_17 <= IN_17;
lIN_18 <= IN_18;
lIN_19 <= IN_19;
lIN_20 <= IN_20;
lIN_21 <= IN_21;
lIN_22 <= IN_22;
lIN_23 <= IN_23;
lIN_24 <= IN_24;
lIN_25 <= IN_25;
lIN_26 <= IN_26;
lIN_27 <= IN_27;
lIN_28 <= IN_28;
lIN_29 <= IN_29;
lIN_30 <= IN_30;
lIN_31 <= IN_31;
lIN_32 <= IN_32;
lIN_33 <= IN_33;
lIN_1 <= IN_1;
lIN_34 <= IN_34;

					end if;
						 when 1 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= x"80000000";
FIFO_WE <= '1';
SMSI <= 2;
		 when 2 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_34(31 downto 0);
FIFO_WE <= '1';
SMSI <= 3;
		 when 3 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 0) <= lIN_1(31 downto 0);
FIFO_WE <= '1';
SMSI <= 4;
		 when 4 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_2(15 downto 0);
FIFO_WE <= '1';
SMSI <= 5;
		 FIFO_PORT_IN(15 downto 0) <= lIN_3(15 downto 0);
FIFO_WE <= '1';
SMSI <= 5;
		 when 5 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_4(15 downto 0);
FIFO_WE <= '1';
SMSI <= 6;
		 FIFO_PORT_IN(15 downto 0) <= lIN_5(15 downto 0);
FIFO_WE <= '1';
SMSI <= 6;
		 when 6 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_6(15 downto 0);
FIFO_WE <= '1';
SMSI <= 7;
		 FIFO_PORT_IN(15 downto 0) <= lIN_7(15 downto 0);
FIFO_WE <= '1';
SMSI <= 7;
		 when 7 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_8(15 downto 0);
FIFO_WE <= '1';
SMSI <= 8;
		 FIFO_PORT_IN(15 downto 0) <= lIN_9(15 downto 0);
FIFO_WE <= '1';
SMSI <= 8;
		 when 8 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_10(15 downto 0);
FIFO_WE <= '1';
SMSI <= 9;
		 FIFO_PORT_IN(15 downto 0) <= lIN_11(15 downto 0);
FIFO_WE <= '1';
SMSI <= 9;
		 when 9 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_12(15 downto 0);
FIFO_WE <= '1';
SMSI <= 10;
		 FIFO_PORT_IN(15 downto 0) <= lIN_13(15 downto 0);
FIFO_WE <= '1';
SMSI <= 10;
		 when 10 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_14(15 downto 0);
FIFO_WE <= '1';
SMSI <= 11;
		 FIFO_PORT_IN(15 downto 0) <= lIN_15(15 downto 0);
FIFO_WE <= '1';
SMSI <= 11;
		 when 11 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_16(15 downto 0);
FIFO_WE <= '1';
SMSI <= 12;
		 FIFO_PORT_IN(15 downto 0) <= lIN_17(15 downto 0);
FIFO_WE <= '1';
SMSI <= 12;
		 when 12 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_18(15 downto 0);
FIFO_WE <= '1';
SMSI <= 13;
		 FIFO_PORT_IN(15 downto 0) <= lIN_19(15 downto 0);
FIFO_WE <= '1';
SMSI <= 13;
		 when 13 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_20(15 downto 0);
FIFO_WE <= '1';
SMSI <= 14;
		 FIFO_PORT_IN(15 downto 0) <= lIN_21(15 downto 0);
FIFO_WE <= '1';
SMSI <= 14;
		 when 14 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_22(15 downto 0);
FIFO_WE <= '1';
SMSI <= 15;
		 FIFO_PORT_IN(15 downto 0) <= lIN_23(15 downto 0);
FIFO_WE <= '1';
SMSI <= 15;
		 when 15 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_24(15 downto 0);
FIFO_WE <= '1';
SMSI <= 16;
		 FIFO_PORT_IN(15 downto 0) <= lIN_25(15 downto 0);
FIFO_WE <= '1';
SMSI <= 16;
		 when 16 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_26(15 downto 0);
FIFO_WE <= '1';
SMSI <= 17;
		 FIFO_PORT_IN(15 downto 0) <= lIN_27(15 downto 0);
FIFO_WE <= '1';
SMSI <= 17;
		 when 17 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_28(15 downto 0);
FIFO_WE <= '1';
SMSI <= 18;
		 FIFO_PORT_IN(15 downto 0) <= lIN_29(15 downto 0);
FIFO_WE <= '1';
SMSI <= 18;
		 when 18 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_30(15 downto 0);
FIFO_WE <= '1';
SMSI <= 19;
		 FIFO_PORT_IN(15 downto 0) <= lIN_31(15 downto 0);
FIFO_WE <= '1';
SMSI <= 19;
		 when 19 =>
		 FIFO_PORT_IN <= (others => '0');
		 FIFO_PORT_IN(31 downto 16) <= lIN_32(15 downto 0);
FIFO_WE <= '1';
SMSI <= 0;
		 FIFO_PORT_IN(15 downto 0) <= lIN_33(15 downto 0);
FIFO_WE <= '1';
SMSI <= 0;

				
				when others =>
					SMSI <= 0;
			end case;
		end if;
	end process;
	
	

end Behavioral;

	
    