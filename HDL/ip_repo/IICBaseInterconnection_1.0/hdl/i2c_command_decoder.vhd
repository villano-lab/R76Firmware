----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:31:01 29/06/2018 
-- Design Name: 
-- Module Name:    i2c_command_decoder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity iic_command_decoder is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           iic_sda : inout  STD_LOGIC;
           iic_scl : inout  STD_LOGIC;
		  interrupt_write_reg : out STD_LOGIC;
		  reg_addr : out std_logic_vector(31 downto 0);	
		  reg_data_wr : out std_logic_vector(31 downto 0);	
		  reg_data_rd : in std_logic_vector(31 downto 0);	
		  REG_RD_INT : out std_logic;
		  IIC_ADDR            : IN std_logic_vector(1 downto 0)
			
			  );
end iic_command_decoder;

architecture Behavioral of iic_command_decoder is

component I2C_slave is
  
  port (
  SLAVE_ADDR : in std_logic_vector(6 downto 0);
    scl              : inout std_logic;
    sda              : inout std_logic;
    clk              : in    std_logic;
    rst              : in    std_logic;
    -- User interface
    read_req         : out   std_logic;
    data_to_master   : in    std_logic_vector(7 downto 0);
    data_valid       : out   std_logic;
    data_from_master : out   std_logic_vector(7 downto 0);
	start_transfer   : out   std_logic;
	abort_stop       : out   std_logic;
	write_read		 : out   std_logic);
end component;




signal byte_tx : std_logic_vector(7 downto 0);
signal byte_rx : std_logic_vector(7 downto 0);
signal phy_interrupt_rd : std_logic;
signal phy_interrupt_wr : std_logic;
signal phy_start : std_logic;
signal phy_abort : std_logic;
signal phy_wr : std_logic;

type spi_stato is (	idle, 		
					w_addr1,
					w_addr2,
					w_addr3,
					w_addr4,
					w_data1,
					w_data2,
					w_data3,
					w_data4,
					w_dataend,
					r_data1,
					r_data2,
					r_data3,
					r_data4
				  );


		
		
	signal stato : spi_stato:=idle;


	signal int_reg_addr : std_logic_vector(31 downto 0);	
	signal int_reg_data : std_logic_vector(31 downto 0);	
	signal old_CS : std_logic;
	

	
	attribute keep : string; 
	attribute keep of int_reg_data : signal is "true"; 
	
	signal tx_bytesel : std_logic_vector (1 downto 0) := "00";
	
	signal SLAVE_ADDR : std_logic_vector(6 downto 0);
begin

    SLAVE_ADDR <=   "1010100" when IIC_ADDR = "00" else
                    "1010101" when IIC_ADDR = "01" else
                    "1010110" when IIC_ADDR = "10" else
                    "1010111" when IIC_ADDR = "11" else "1010100";
byte_tx <= reg_data_rd(7 downto 0) when tx_bytesel = "00" else
				reg_data_rd(15 downto 8) when tx_bytesel = "01" else
				reg_data_rd(23 downto 16) when tx_bytesel = "10" else
				reg_data_rd(31 downto 24) when tx_bytesel = "11" else x"00";

	iic_slave_core : I2C_slave 

  port map(
    SLAVE_ADDR => SLAVE_ADDR,
    scl=> iic_scl,
    sda => iic_sda,
    clk => clk,
    rst => '0',
    -- User interface
    read_req         => phy_interrupt_rd,
    data_to_master   => byte_tx,
    data_valid       => phy_interrupt_wr,
    data_from_master => byte_rx,
	start_transfer   => phy_start,
	abort_stop       => phy_abort,
	write_read		 => phy_wr);


	command_decoder : process (clk, reset)
	begin
		if rising_edge(clk) then
			if reset = '1' then
				int_reg_addr <= (others => '0');
				int_reg_data <= (others => '0');
				stato <= idle;
			else
				interrupt_write_reg <= '0';
				REG_RD_INT <= '0';
				reg_addr <= int_reg_addr;
				case stato is
					when idle =>
						tx_bytesel <= "00";
					when w_addr1 =>
						if phy_interrupt_wr='1' then
							int_reg_addr(7 downto 0) <= byte_rx;
							stato <= w_addr2;
						end if;
						
					when w_addr2 =>
						if phy_interrupt_wr='1' then
							int_reg_addr(15 downto 8) <= byte_rx;
							stato <= w_addr3;
						end if;
					
					when w_addr3 =>
						if phy_interrupt_wr='1' then
							int_reg_addr(23 downto 16) <= byte_rx;
							stato <= w_addr4;
						end if;

					when w_addr4 =>
						if phy_interrupt_wr='1' then
							int_reg_addr(31 downto 24) <= byte_rx;
							stato <= w_data1;
						end if;
																	
					when w_data1 =>
						
						if phy_interrupt_wr='1' then
							int_reg_data(7 downto 0) <= byte_rx;
							stato <= w_data2;
						end if;
					
					when w_data2 =>
						if phy_interrupt_wr='1' then
							int_reg_data(15 downto 8) <= byte_rx;
							stato <= w_data3;
						end if;					
					
					when w_data3 =>
						if phy_interrupt_wr='1' then
							int_reg_data(23 downto 16) <= byte_rx;
							stato <= w_data4;
						end if;					
					
					when w_data4 =>
						if phy_interrupt_wr='1' then
							int_reg_data(31 downto 24) <= byte_rx;
							stato <= w_dataend;
						end if;					
					
					when w_dataend =>
						reg_data_wr <= int_reg_data;
						interrupt_write_reg <= '1';
						stato <= idle;
						
						
					when r_data1 =>
						
						if phy_interrupt_rd = '1' then
							tx_bytesel <= "01";
							stato <= r_data2;
						end if;

					when r_data2 =>
						
						if phy_interrupt_rd = '1' then
							tx_bytesel <= "10";
							stato <= r_data3;
						end if;
					
					when r_data3 =>
						
						if phy_interrupt_rd = '1' then
							tx_bytesel <= "11";
							stato <= r_data4;
						end if;
					
					when r_data4 =>
						
						if phy_interrupt_rd = '1' then
							stato <= idle;
						end if;
					
					
				when others =>
					stato <= idle;
				end case;
			
				if phy_abort = '1' then
				
					stato <= idle;
				end if;
				
						if phy_start ='1' then
							if phy_wr = '0' then
								stato <= w_addr1;
							else
								REG_RD_INT <= '1';
								stato <= r_data1;
							end if;
						end if;				
			end if;
		end if;
	end process;

end Behavioral;

