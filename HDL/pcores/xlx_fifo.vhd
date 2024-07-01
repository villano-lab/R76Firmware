------------------------------------------------------------------
--						Nuclear Instruments						--
--																--
--							SciCompiler							--
--																--
--	Module:				FIFO (XILINX)							--
--	Version:			1.0										--
--	Creation Data:		14-08-2017								--
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


entity S_FIFO is
  Generic (	
			memLength : integer := 16;
			busWidthWrite : integer := 16;
			busWidthRead : integer := 16);
  port (
	RESET : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK_READ : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	CLK_WRITE : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    PORT_IN : IN STD_LOGIC_VECTOR (busWidthWrite-1 DOWNTO 0);
	PORT_OUT: OUT STD_LOGIC_VECTOR (busWidthRead-1 downto 0);
	EMPTY : OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
	FULL : OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
	OVERFLOW : OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
	UNDERFLOW : OUT STD_LOGIC_VECTOR (0 DOWNTO 0);
	RD : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
	WE : IN STD_LOGIC_VECTOR (0 DOWNTO 0)
	);
end;


architecture Behavioral of S_FIFO is

	constant wBits : integer := integer(ceil(log2(real(memLength))));
	constant rBits : integer := integer(ceil(log2(real(memLength * busWidthWrite/busWidthRead))));
	
begin


xpm_fifo_async_inst : xpm_fifo_async
generic map (
	FIFO_MEMORY_TYPE => "auto", --string; "auto", "block", or "distributed";
	ECC_MODE => "no_ecc", --string; "no_ecc" or "en_ecc";
	RELATED_CLOCKS => 0, --positive integer; 0 or 1
	FIFO_WRITE_DEPTH => memLength, --positive integer
	WRITE_DATA_WIDTH => busWidthWrite, --positive integer
	WR_DATA_COUNT_WIDTH => wBits, --positive integer
	PROG_FULL_THRESH => 5, --positive integer
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
	rst => RESET(0),
	wr_clk => CLK_WRITE(0),
	wr_en => WE(0),
	din => PORT_IN,
	full => FULL(0),
	overflow => OVERFLOW(0),
	wr_rst_busy => open,
	rd_clk => CLK_READ(0),
	rd_en => RD(0),
	dout => PORT_OUT,
	empty => EMPTY(0),
	underflow => UNDERFLOW(0),
	rd_rst_busy => open,
	prog_full => open,
	wr_data_count => open,
	prog_empty => open,
	rd_data_count => open,
	injectsbiterr => '0',
	injectdbiterr => '0',
	sbiterr => open,
	dbiterr => open
);


			

end Behavioral; 