----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.03.2019 09:26:13
-- Design Name: 
-- Module Name: peak_finder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity peak_finder is
    Generic (IN_SIZE : integer := 16;
           OPERATION : STRING := "find_max";
           IN_SIGN : STRING := "signed"
           );
    Port ( in_s : in STD_LOGIC_VECTOR (IN_SIZE-1 downto 0);
           serachLength : in integer;
           CE : in STD_LOGIC;
           start : in STD_LOGIC;
           clk : in STD_LOGIC;
           peak_out : out STD_LOGIC_VECTOR (IN_SIZE-1 downto 0);
           position_out : out STD_LOGIC_VECTOR (15 downto 0);
           peak_dv : out STD_LOGIC_VECTOR(0 downto 0);
           track_hold : out STD_LOGIC_VECTOR(0 downto 0)
           );
end peak_finder;

architecture Behavioral of peak_finder is
    signal PEAK : STD_LOGIC_VECTOR (IN_SIZE-1 DOWNTO 0) := (others => '0');
    signal POSITION : integer;
    signal POSITION_C : integer;  
    signal COUNTER : integer := 0;
    signal SM_ST : std_logic_vector(3 downto 0) := x"0";
    
    signal o_start : std_logic;
begin

IF_find_max:
   if OPERATION = "find_max" generate
      begin
        sm_finder: process(clk)
        begin
            if rising_edge(clk) then
                peak_dv <= "0";
                o_start <= start;
                if CE='1' then
                    case SM_ST is 
                        when x"0" =>
                            track_hold <= "1";
                            if start='1' and o_start='0' then
                                COUNTER <= serachLength;
                                if IN_SIGN = "signed" then
                                    PEAK <= ('1', others => '0');
                                else
                                    PEAK <= (others => '0');
                                end if;
                                SM_ST<= x"1";
                                POSITION_C<=0;
                            end if;
                        when x"1" =>
                            if COUNTER = 0 then
                                peak_out <= PEAK;
                                position_out <=  std_logic_vector(to_unsigned(POSITION_C,16));  
                                peak_dv <= "1";
                                SM_ST<= x"0";     
                            else
                                POSITION_C <= POSITION_C+1;
                                COUNTER <= COUNTER -1;
                                if IN_SIGN = "signed" then
                                    if signed(in_s) > signed(PEAK) then
                                        PEAK <= in_s;
                                        POSITION <= POSITION_C;
                                        track_hold <= "0";
                                    else
                                        track_hold <= "1";
                                    end if;
                                else
                                    if unsigned(in_s) > unsigned(PEAK) then
                                        PEAK <= in_s;
                                        POSITION <= POSITION_C;
                                        track_hold <= "0";
                                    else
                                        track_hold <= "1";
                                    end if;                        
                                end if;                            
                            end if;
                        when others =>
                            SM_ST <= x"0";
                    end case;
                end if;
            end if;    
        end process;
end generate;
    
    

IF_find_min:
   if OPERATION = "find_min" generate
      begin
        sm_finder: process(clk)
        begin
            if rising_edge(clk) then
                peak_dv <= "0";
                if CE='1' then
                    case SM_ST is 
                        when x"0" =>
                            track_hold <= "1";
                            if start='1' then
                                COUNTER <= serachLength;
                                if IN_SIGN = "signed" then
                                    PEAK <= ('0', others => '1');
                                else
                                    PEAK <= (others => '1');
                                end if;
                                SM_ST<= x"1";
                                POSITION_C<=0;
                            end if;
                        when x"1" =>
                            if COUNTER = 0 then
                                peak_out <= PEAK; 
                                position_out <=  std_logic_vector(to_unsigned(POSITION,16));      
                                peak_dv <= "1";
                                SM_ST<= x"0";        
                            else
                                COUNTER <= COUNTER -1;
                                POSITION_C <= POSITION_C+1;
                                if IN_SIGN = "signed" then
                                    if signed(in_s) < signed(PEAK) then
                                        PEAK <= in_s;
                                        POSITION <= POSITION_C;
                                        track_hold <= "0";
                                    else
                                        track_hold <= "1";
                                    end if;
                                else
                                    if unsigned(in_s) < unsigned(PEAK) then
                                        PEAK <= in_s;
                                        POSITION <= POSITION_C;
                                        track_hold <= "0";
                                    else
                                        track_hold <= "1";
                                    end if;                        
                                end if;                            
                            end if;
                        when others =>
                            SM_ST <= x"0";
                    end case;
                end if;
            end if;    
        end process;
end generate;
    
            
end Behavioral;
