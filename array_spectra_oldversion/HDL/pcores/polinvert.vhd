
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity polinvert is
    Generic (A_SIZE : integer := 16;
			 AN_SIZE : integer := 16;
             SIGN : STRING := "UNSIGNED"
            );
    Port ( a : in STD_LOGIC_VECTOR (A_SIZE-1 downto 0);
		   pol : in STD_LOGIC_VECTOR (0 downto 0);
           b : out STD_LOGIC_VECTOR (A_SIZE-1 downto 0));
end polinvert;

architecture Behavioral of polinvert is

    signal A_MAX : std_logic_vector (AN_SIZE-1 downto 0);
    signal A_MIN : std_logic_vector (AN_SIZE-1 downto 0);
    signal A_ZERO : std_logic_vector (AN_SIZE-1 downto 0) := (others => '0');
    
	signal aa :  std_logic_vector (AN_SIZE-1 downto 0);
	signal bb :  std_logic_vector (AN_SIZE-1 downto 0);
    
begin

aa <= a(AN_SIZE-1 downto 0);
b <= std_logic_vector(RESIZE(unsigned(bb), A_SIZE));

IF_unsign:
   if SIGN = "UNSIGNED" generate
      begin
         A_MAX <= (others => '1');
		 A_MIN <= (others => '0');
         bb <= aa when pol="0" else std_logic_vector(unsigned(A_MAX) - unsigned(aa));
   end generate;
   
   
IF_sign:
  if SIGN = "SIGNED" generate
     begin
        A_MAX <=  ('0', others => '1');
        A_MIN <=  ('1', others => '0');
		bb <= aa when pol="0" else std_logic_vector(signed(A_ZERO) - signed(aa));

    
  end generate;
  
end Behavioral;  
  