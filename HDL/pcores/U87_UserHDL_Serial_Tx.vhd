-- Sten Hansen 	Fermilab 08/31/2010

-- Attempting to use structured VHDL 

LIBRARY ieee;
use ieee.std_logic_1164.all;

package Global_Defs is

----------------------- Address list -----------------------------

Subtype AddrPtr is std_logic_vector(6 downto 0);
-- Quantities > 16 bits
-- SDRAM related pointers are 22 bits for phonons and charge
-- 24 bits for a non channel specific read
-- Circular buffer write pointer (read only)
constant SDRamWrtPtrHiAd : AddrPtr := "0000000";
constant SDRamWrtPtrLoAd : AddrPtr := "0000001";
-- Circular buffer read pointer
constant SDRamRdPtrHiAd	: AddrPtr := "0000010";
constant SDRamRdPtrLoAd	: AddrPtr := "0000011";

-- Addresses used to retrieve channel specific ADC data from SDRAM
constant PhAADCDatHiAddr : AddrPtr := "0000100";
constant PhAADCDatLoAddr : AddrPtr := "0000101";
constant PhBADCDatHiAddr : AddrPtr := "0000110";
constant PhBADCDatLoAddr : AddrPtr := "0000111";
constant PhCADCDatHiAddr : AddrPtr := "0001000";
constant PhCADCDatLoAddr : AddrPtr := "0001001";
constant PhDADCDatHiAddr : AddrPtr := "0001010";
constant PhDADCDatLoAddr : AddrPtr := "0001011";
constant QIADCDatHiAddr	 : AddrPtr := "0001100";
constant QIADCDatLoAddr	 : AddrPtr := "0001101";
constant QOADCDatHiAddr	 : AddrPtr := "0001110";
constant QOADCDatLoAddr	 : AddrPtr := "0001111";
-- Address of trigger FIFO data
constant TrigFifoHiAddr	 : AddrPtr := "0010000";
constant TrigFifoLoAddr	 : AddrPtr := "0010001";

-- Counter used to transmit sequential data to Ethernet as a diagnostic
constant TestCounterHiAd : AddrPtr := "0010010";
constant TestCounterLoAd : AddrPtr := "0010011";

-- Quantities <= 16 bits
-- Port for microcontroller reads of SDRAM
constant SDRamPort : AddrPtr := "0010100";
-- Control and status register
constant CSRAddr : AddrPtr := "0010101";
-- Interval over which data can be averaged for doing low frequency spectra
constant AverageIntAddr	: AddrPtr := "0010110";
-- Specify which channels contribute to a trigger
constant TrigParmAddr	: AddrPtr := "0010111";
-- Trigger baseline average length 
constant BaseLengthAddr	: AddrPtr := "0011000";
-- Trigger sample average length 
constant TrgSmplLngthAddr : AddrPtr := "0011001";

-- Phonon trig thresholds
constant PhAThreshAddr	: AddrPtr := "0011010";
constant PhBThreshAddr	: AddrPtr := "0011011";
constant PhCThreshAddr	: AddrPtr := "0011100";
constant PhDThreshAddr	: AddrPtr := "0011101";
-- Charge trig thresholds
constant QIThreshAddr : AddrPtr := "0011110";
constant QOThreshAddr : AddrPtr := "0011111";

constant PhTrigCnt0Addr : AddrPtr := "0100000";
constant PhTrigCnt1Addr : AddrPtr := "0100001";
constant PhTrigCnt2Addr : AddrPtr := "0100010";
constant PhTrigCnt3Addr : AddrPtr := "0100011";
constant QTrigCnt0Addr : AddrPtr := "0100100";
constant QTrigCnt1Addr : AddrPtr := "0100101";

-- LED pusler control registers
constant LEDPlsADCAddr	: AddrPtr := "0100110";
constant LEDPlsWidthAddr: AddrPtr := "0100111";
constant LEDPlsRateAddr	: AddrPtr := "0101000";

constant TrigFIFOCountAddr	: AddrPtr := "0101001";

-- Serial link transmitter and receiver addresses
constant DSChnTx0Addr : AddrPtr := "0101010";
constant DsChnRx0Addr : AddrPtr := "0101010";

constant DSChnTx1Addr 	: AddrPtr := "0101011";
constant DsChnRx1Addr : AddrPtr := "0101011";

constant BusRx0Addr : AddrPtr := "0101100";
-- Serial Link status registers
constant LinkISR : AddrPtr := "0101101";
constant LinkCSR : AddrPtr := "0101110";

-- Register to store power supply phase at the time of a trigger
--constant PS_PhaseRegAd	: AddrPtr := "0101110";

-- Addresses for seting up analog section
constant LEDPlsCtrlBits	: AddrPtr := "0110000";
-- Phonon VGA, VZap, LED current, QOffset DAC
constant PhGainsDACCtrl : AddrPtr := "0110011";
constant PhGainsDACAddr0 : AddrPtr := "0110100";
constant PhGainsDACAddr1 : AddrPtr := "0110101";
constant PhGainsDACAddr2 : AddrPtr := "0110110";
constant PhGainsDACAddr3 : AddrPtr := "0110111";
constant PhGainsDACAddr4 : AddrPtr := "0111000";
constant PhGainsDACAddr5 : AddrPtr := "0111001";
constant PhGainsDACAddr6 : AddrPtr := "0111010";
constant PhGainsDACAddr7 : AddrPtr := "0111011";
-- Control bits for the test pulse generator
constant TstPlsCtrlAd	 : AddrPtr := "0111100";
-- DDS used as a test signal generator
constant DDSAddr0 : AddrPtr := "0111101";
constant DDSAddr1 : AddrPtr := "0111110";
constant DDSAddr2 : AddrPtr := "0111111";
constant DDSAddr3 : AddrPtr := "1000000";
constant DDSAddr4 : AddrPtr := "1000001";
constant DDSAddr5 : AddrPtr := "1000010";
constant DDSAddr6 : AddrPtr := "1000011";
-- Scaling DAC attached to the DDS output
constant TstPlsMagAddr : AddrPtr := "1000100";
-- Switches selecting signal paths, polartiy, prgrammable gain values
constant PhA_BCtlrAddr : AddrPtr := "1000101";
-- Phonon A/B DAC
constant PhA_BDacCtrl : AddrPtr := "1000110";
constant PhA_BDacAddr0 : AddrPtr := "1000111";
constant PhA_BDacAddr1 : AddrPtr := "1001000";
constant PhA_BDacAddr2 : AddrPtr := "1001001";
constant PhA_BDacAddr3 : AddrPtr := "1001010";
constant PhA_BDacAddr4 : AddrPtr := "1001011";
constant PhA_BDacAddr5 : AddrPtr := "1001100";
constant PhA_BDacAddr6 : AddrPtr := "1001101";
constant PhA_BDacAddr7 : AddrPtr := "1001110";
-- Switches selecting signal paths, polartiy, programmable gain values
constant PhC_DCtlrAddr : AddrPtr := "1001111";
-- Phonon C/D DAC
constant PhC_DDacCtrl : AddrPtr := "1010000";
constant PhC_DDacAddr0 : AddrPtr := "1010001";
constant PhC_DDacAddr1 : AddrPtr := "1010010";
constant PhC_DDacAddr2 : AddrPtr := "1010011";
constant PhC_DDacAddr3 : AddrPtr := "1010100";
constant PhC_DDacAddr4 : AddrPtr := "1010101";
constant PhC_DDacAddr5 : AddrPtr := "1010110";
constant PhC_DDacAddr6 : AddrPtr := "1010111";
constant PhC_DDacAddr7 : AddrPtr := "1011000";
-- Charge bias DAC
constant QBiasDACAddr0 : AddrPtr := "1011001";
constant QBiasDACAddr1 : AddrPtr := "1011010";

constant ADCTstRdAddr0 : AddrPtr := "1011011";
constant ADCTstRdAddr1 : AddrPtr := "1011100";
constant ADCCmdAddr : AddrPtr := "1011101";

-- Demarcation between phonon and charge data
constant ChargeBaseAd : std_logic_vector (24 downto 0) := "1" & X"000000";

----------------------------------------------------------------------

-- Command code definitions
constant WriteDis : std_logic_vector(15 downto 0) := X"8000";
constant WriteEn : std_logic_vector(15 downto 0) := X"8001";

-- Timing constants
-- Refresh interval is 7.8 us %
constant RefreshTime : std_logic_vector (9 downto 0) := "01" & X"86"; -- 390 (8us)
-- Minimum time granularity for the LED pulser
constant LEDCount : std_logic_vector (9 downto 0) := "11" & X"1F"; -- 799 (10us)

constant QDeadTime : std_logic_vector (7 downto 0) := "10111011";
constant PhDeadTime : std_logic_vector (7 downto 0) := "01111111";
-- Set this for either TMS470 or Stellaris 0 for Stellaris, 1 for 470
constant SwapVal : std_logic := '0';

------------- Altera specific macro component definitions ------------

-- Clock synthesizer macro
-- Generated by "plug in wizard". (vxopll.vhd in project list)
	component vxopll
	port
	(	areset,inclk0 : in std_logic := '0';
		c0, -- 80 MHz Clock
		c1, -- 100 MHz Clock
		c2 : out std_logic); -- 160 MHz Clock
		
	end component;

	component PhADCPll
	port
	(	areset,inclk0 : in std_logic := '0';
		c0 : out std_logic); -- 90 MHz Clock
	end component;

-- DDR input registers for ADC data
-- Generated by "plug in wizard". (ADC_DDR.vhd in project list)
component ADC_DDR
port (aclr		: IN STD_LOGIC ;
		datain	: IN STD_LOGIC_VECTOR (1 DOWNTO 0);
		inclock	: IN STD_LOGIC ;
		dataout_h : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
		dataout_l : OUT STD_LOGIC_VECTOR (1 DOWNTO 0));
end component;

-- Fifo macro
component lpm_fifo_dc
 generic 
 (LPM_WIDTH : POSITIVE;
 LPM_WIDTHU : POSITIVE := 1;
 LPM_NUMWORDS : POSITIVE;
 LPM_SHOWAHEAD : STRING := "OFF";
 LPM_TYPE : STRING := "LPM_FIFO_DC";
 LPM_HINT : STRING := "UNUSED");
 port (data : in STD_LOGIC_VECTOR(LPM_WIDTH-1 downto 0);
 wrclock, rdclock, wrreq, rdreq : in STD_LOGIC;
 aclr : in STD_LOGIC := '0';
 wrfull, rdfull, wrempty, rdempty : out STD_LOGIC;
 wrusedw, rdusedw : out STD_LOGIC_VECTOR(LPM_WIDTHU-1 downto 0);
 q : out STD_LOGIC_VECTOR(LPM_WIDTH-1 downto 0));
end component;

-- Accumulator macro
component altaccumulate
 generic (lpm_representation : string := "UNSIGNED";
 width_in : natural;
 width_out : natural);
 port( aclr : in std_logic := '0';
 add_sub : in std_logic := '1';
 cin : in std_logic := '0';
 clken : in std_logic := '1';
 clock : in std_logic;
 cout : out std_logic;
 data : in std_logic_vector(width_in-1 downto 0);
 overflow : out std_logic;
 result : out std_logic_vector(width_out-1 downto 0);
 sign_data : in std_logic := '0';
 sload : in std_logic := '0');
end component;

-- Multiplier macro used to renormalize cordic gain
component LPM_MULT
 generic
	( LPM_WIDTHA : natural;
	 LPM_WIDTHB : natural;
	 LPM_WIDTHS : natural := 1;
	 LPM_WIDTHP : natural;
	 LPM_REPRESENTATION : string := "UNSIGNED";
	 LPM_PIPELINE : natural := 0);
 port
	( dataa : in std_logic_vector(LPM_WIDTHA-1 downto 0);
	 datab : in std_logic_vector(LPM_WIDTHB-1 downto 0);
	 aclr, clock : in std_logic := '0';
	 clken : in std_logic := '1';
 sum : in std_logic_vector(LPM_WIDTHS-1 downto 0) := (OTHERS => '0');
 result : out std_logic_vector(LPM_WIDTHP-1 downto 0));
end component;

-- Dual port RAM macro
component lpm_ram_dp
 generic 
 (LPM_WIDTH : POSITIVE;
 LPM_WIDTHAD : POSITIVE;
 LPM_NUMWORDS : NATURAL := 0;
 LPM_INDATA : STRING := "REGISTERED";
 LPM_OUTDATA : STRING := "REGISTERED";
 LPM_RDADDRESS_CONTROL : STRING := "REGISTERED";
 LPM_WRADDRESS_CONTROL : STRING := "REGISTERED";
 LPM_FILE : STRING := "UNUSED";
 LPM_TYPE : STRING := "LPM_RAM_DP";
 LPM_HINT : STRING := "UNUSED");
 port (data : in STD_LOGIC_VECTOR(LPM_WIDTH-1 downto 0); 
 rdaddress, wraddress : in STD_LOGIC_VECTOR(LPM_WIDTHAD-1 downto 0);
 rdclock, wrclock : in STD_LOGIC := '0';
 rden, rdclken, wrclken : in STD_LOGIC := '1';
 wren : in STD_LOGIC; 
 q : out STD_LOGIC_VECTOR(LPM_WIDTH-1 downto 0));
end component;

-- Subtractor macro
component lpm_add_sub 
 generic
 (LPM_WIDTH : POSITIVE; -- MUST BE GREATER THAN 0 
 LPM_DIRECTION : STRING := "UNUSED"; 
 LPM_REPRESENTATION : STRING := "SIGNED"; 
 LPM_PIPELINE : INTEGER := 0; 
 LPM_TYPE : STRING := "LPM_ADD_SUB"; 
 LPM_HINT : STRING := "UNUSED"); 
 port (dataa, datab : in STD_LOGIC_VECTOR(LPM_WIDTH-1 downto 0);
		aclr, clock : in STD_LOGIC := '0';
 clken, add_sub : in STD_LOGIC := '1'; 
 cin : in STD_LOGIC := 'Z'; 
 result : out STD_LOGIC_VECTOR(LPM_WIDTH-1 downto 0); 
 cout, overflow : out STD_LOGIC ); 
end component; 

-- Comparator macro
component lpm_compare 
 generic 
 (LPM_WIDTH : POSITIVE; 
 LPM_REPRESENTATION : STRING := "UNSIGNED"; 
 LPM_PIPELINE : INTEGER := 0; 
 LPM_TYPE : STRING := "LPM_COMPARE"; 
 LPM_HINT : STRING := "UNUSED"); 
 
 port (dataa, datab : in STD_LOGIC_VECTOR(LPM_WIDTH-1 downto 0); 
 aclr, clock : in STD_LOGIC := '0'; 
 clken : in STD_LOGIC := '1'; 
 agb, ageb, aeb, aneb, alb, aleb : out STD_LOGIC ); 

end component; 

-- Absolute value macro
component LPM_ABS
 generic (LPM_WIDTH : natural; -- MUST be greater than 0
 LPM_HINT : string := "UNUSED");
port (DATA : in std_logic_vector(LPM_WIDTH-1 downto 0);
 RESULT : out std_logic_vector(LPM_WIDTH-1 downto 0);
 OVERFLOW : out std_logic);
end component;

-------------------- user defined components ------------------

------------------- Serial Link compnonent definitions --------------------

-- Define FM encoder 
component Serial_Tx is
generic (size : positive);
port(clock, reset, Tx_En : in std_logic;
	pdata_in : in std_logic_vector(size-1 downto 0 );
	FMData_Out, Tx_Done : out std_logic
	);
end component;

end Global_Defs;

--===============================================================================================

Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;
USE work.Global_Defs.all;

entity U87_UserHDL_Serial_Tx is
generic (size : positive := 16);
port (
 clock, reset, Tx_En: in STD_LOGIC;
 pdata_in: in std_logic_vector(size-1 downto 0);
 Tx_Done, FMData_Out: buffer STD_LOGIC
);
end U87_UserHDL_Serial_Tx;

architecture behavioural of U87_UserHDL_Serial_Tx is

-- Serializer state machine
Type FMTx is (TxIdle,TxStrtA,TxStrtB,ShftTx,ParityTx);
signal Tx_State : FMTx;

-- Shift register, bit width counter
signal TxShft : std_logic_vector (size-1 downto 0); --req size
signal TxBitWdth : STD_LOGIC_VECTOR (2 downto 0);
-- Transmitted FM data, running parity bit
signal TxParity,In_Present,Align,Tx_Req : STD_LOGIC;

begin

FM_Encode : process(clock, reset)
-- Frame bit counter
variable TxBtCnt : integer range 0 to size-1;

begin
 if reset = '0' then 

	Tx_State <= TxIdle; FMData_Out <= '0';
	Tx_Done <= '0'; TxParity <= '0';
	TxShft <= (others => '0');
	TxBitWdth <= "000"; TxBtCnt := 0;

elsif rising_edge(clock) then

 Case TxBitWdth is
	When "000" => TxBitWdth <= "001";
	When "001" => TxBitWdth <= "010";
	When "010" => TxBitWdth <= "011";
	When "011" => if Tx_State = TxStrtA or Tx_State = TxStrtB
			 then TxBitWdth <= "100";
			 else TxBitWdth <= "000";
			 end if;
	When "100" => if Tx_State = TxStrtA or Tx_State = TxStrtB
			 then TxBitWdth <= "101";
			 else TxBitWdth <= "000";
			 end if;
	When others => TxBitWdth <= "000";
 end Case;

-- FMTx TxIdle,TxStrtA,TxStrtB,ShftTx,ParityTx
Case Tx_State is
-- Send data on uC write
 When TxIdle => 
	 	 if Tx_En = '1' and TxBitWdth = "011"
		 then Tx_State <= TxStrtA;
			else Tx_State <= TxIdle;
			end if;
		When TxStrtA =>
		 if TxBitWdth = "101" then Tx_State <= TxStrtB;
		 else Tx_State <= TxStrtA;
		 end if;
 		When TxStrtB =>
		 if TxBitWdth = "101" then Tx_State <= ShftTx;
		 else Tx_State <= TxStrtB;
		 end if;
 When ShftTx =>
 if TxBitWdth = "011" and TxBtCnt = 0 then Tx_State <= ParityTx;
 else Tx_State <= ShftTx;
 end if;
 When ParityTx =>
 if TxBitWdth = "011" then Tx_State <= TxIdle;
 else Tx_State <= ParityTx;
 end if;
end case;

-- Two transitions per bit period is a 1, one transition denotes a 0
 -- default state is a string of 1's
if ((TxBitWdth = "001" or TxBitWdth = "011") and Tx_State = TxIdle)
		 or TxBitWdth = "101" 	-- Start bit is defined 1 1/2 bit periods
					-- Number of data FM transitions is ShiftOut register data dependent
 or (Tx_State = ShftTx and ((TxShft(size-1) = '1' and TxBitWdth = "001") or TxBitWdth = "011"))
					-- Number of parity FM transitions is parity bit dependent
 or (Tx_State = ParityTx and ((TxParity = '0' and TxBitWdth = "001") or TxBitWdth = "011"))
then FMData_Out <= not FMData_Out;
else FMData_Out <= FMData_Out;
end if;

-- data frames are "size" bits long 
if Tx_State = TxStrtB and TxBitWdth = "101"
 then TxBtCnt := (size-1);
elsif Tx_State = TxIdle then TxBtCnt := 0;
elsif Tx_State = ShftTx and TxBitWdth = "011" and TxBtCnt /= 0
	then TxBtCnt := TxBtCnt-1;
else TxBtCnt := TxBtCnt;
end if;
-- Load shift register with data byte at the beginning of the transmit sequence
-- load condition
if Tx_State = TxIdle and Tx_En = '1' and TxBitWdth = "011"
 then TxShft <= pdata_in;
-- Shift one bit left (MSB first) during data portion of frame
-- shift condition
elsif Tx_State = ShftTx and TxBitWdth = "011" 
	then TxShft <= (TxShft(size-2 downto 0) & '0');
else TxShft <= TxShft;
end if;

 if (TxParity = '1' and Tx_State = TxIdle) -- reset parity at start
 or (Tx_State = ShftTx and TxBitWdth = "011" and TxShft(size-1) = '0')
-- Toggle parity bit with each shifted out "0"
then TxParity <= not TxParity;
else TxParity <= TxParity;
end if;

-- Indicate when a frame has been shifted out
if TxBitWdth = "011" and Tx_State = ParityTx then Tx_Done <= '1';
else Tx_Done <= '0';
end if;

end if; -- reset
end process FM_Encode;

end behavioural; -- of Serial_Tx