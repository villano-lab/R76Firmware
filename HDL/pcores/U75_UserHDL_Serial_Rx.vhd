LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.Global_Defs.all;

entity U75_UserHDL_Serial_Rx is
	generic (size : positive := 16);
	port( 
 sysclk, rxclock, reset, FMData_In, Clr_Err : in std_logic;
	pdata_out : buffer std_logic_vector(size-1 downto 0 );
	Rx_Done, Parity_Err : buffer std_logic
	);
end U75_UserHDL_Serial_Rx;

architecture behavioural of U75_UserHDL_Serial_Rx is

Type FMRx is (RxIdle,RxStrt,RxShift,ParityRx);
Signal Rx_State : FMRx;
-- Registers for FM decoder
-- Shift register, bit width counter
signal RxBitWdth : std_logic_vector (3 downto 0);
-- Edge detector for incoming FM data
signal RxDl : std_logic_vector (1 downto 0);
-- Transmitted FM data, running parity bit
signal RxParity,Rx_NRZ,Rx_Done_Req : std_logic;

begin

FM_Decode : process(rxclock, reset)

-- Frame bit counter
variable RxBtCnt : integer range 0 to size-1;

begin
 if reset = '0' then 

	Rx_State <= RxIdle; RxDl <= "00"; 
	Rx_Done_Req <= '0'; RxParity <= '0'; Parity_Err <= '0';
	pdata_out <= (others => '0'); RxBtCnt := 0; 
	Rx_NRZ <= '0'; RxBitWdth <= "0000";

elsif rising_edge(rxclock) then

-- Synchronous edge detector for input
RxDl(0) <= FMData_In;
RxDl(1) <= RxDl(0);

-- Reset sampling counter with every Clock transition while decoder is in Idle,
-- otherwise reset only once per bit period
if (RxDl(1) = '1' xor RxDl(0) = '1') and (RxBitWdth > "0100" or Rx_State = RxIdle)
 then RxBitWdth <= "0000";
elsif RxBitWdth /= "1111" and 
	not((RxDl(1) = '1' xor RxDl(0) = '1') and (RxBitWdth > "0100" or Rx_State = RxIdle))
 then RxBitWdth <= RxBitWdth + 1;
else RxBitWdth <= RxBitWdth;
end if;

-- RxIdle,RxStrt,RxShift,ParityRx 
Case Rx_State is
 When RxIdle =>
 if RxBitWdth = "1000" then Rx_State <= RxStrt;
 else Rx_State <= RxIdle;
 end if;
 When RxStrt =>
 if RxBitWdth = "1000" then Rx_State <= RxShift;
	 elsif ((RxDl(1) = '1' xor RxDl(0) = '1') and RxBitWdth < "1000")
		 or RxBitWdth = "1111" then Rx_State <= RxIdle;
 else Rx_State <= RxStrt;
 end if;
 When RxShift =>
 if RxBtCnt = 0 and RxBitWdth = "0110" then Rx_State <= ParityRx;
	 elsif RxBitWdth = "1111" then Rx_State <= RxIdle;
 else Rx_State <= RxShift;
 end if;
 When ParityRx =>
 if RxBitWdth = "0110" or RxBitWdth = "1111"
		then Rx_State <= RxIdle;
 else Rx_State <= ParityRx;
 end if;
end case;

-- Serial data from FM is 1 if transition is in the middle of the bit period,
-- 0 if it is at the end 
if Rx_NRZ = '1' and (RxDl(1) = '1' xor RxDl(0) = '1') and RxBitWdth > "0100"
then Rx_NRZ <= '0';
elsif Rx_NRZ = '0' and (RxDl(1) = '1' xor RxDl(0) = '1') and RxBitWdth <= "0100"
then Rx_NRZ <= '1';
else Rx_NRZ <= Rx_NRZ;
end if;

-- Serial data frame is "size" bits long
 if Rx_State = RxStrt and RxBitWdth = "1000" then RxBtCnt := (size-1);
elsif Rx_State = RxIdle then RxBtCnt := 0;
elsif Rx_State = RxShift and RxBitWdth = "0110" and RxBtCnt /= 0 
then RxBtCnt := RxBtCnt - 1;
else RxBtCnt := RxBtCnt;
end if;

-- Shift register
if Rx_State = RxShift and RxBitWdth = "0110" 
then pdata_out <= (pdata_out(size-2 downto 0) & Rx_NRZ);
else pdata_out <= pdata_out;
end if;

-- Parity bit toggles for each zero bit 
if (Rx_State = RxShift and RxBitWdth = "0110" and Rx_NRZ = '0')
 or (RxParity = '1' and Rx_State = RxStrt)
then RxParity <= not RxParity;
else RxParity <= RxParity;
end if;

-- If transmitted parity doesn't match the running parity, parity error 
if (Parity_Err = '1' and Clr_Err = '1')
or (Parity_Err = '0' and (Rx_NRZ = '1' xor RxParity = '0') and Rx_State = ParityRx
 and (RxDl(1) = '1' xor RxDl(0) = '1') and RxBitWdth = "0110")
then Parity_Err <= not Parity_Err;
else Parity_Err <= Parity_Err;
end if;

-- Hold Rx done high for one sysclck period.
if Rx_State = ParityRx and RxBitWdth = "0110" then Rx_Done_Req <= '1';
elsif Rx_Done = '1' then Rx_Done_Req <= '0';
else Rx_Done_Req <= Rx_Done_Req;
end if;

end if; -- rising edge

end process FM_Decode;

-- SendRxDone for one sysclk period
Send_Rx_Done : process(sysclk, reset)
begin
 if reset = '0' then Rx_Done <= '0';
 elsif rising_edge(sysclk) then Rx_Done <= Rx_Done_Req;
 end if; -- reset
end process Send_Rx_Done;

end behavioural;