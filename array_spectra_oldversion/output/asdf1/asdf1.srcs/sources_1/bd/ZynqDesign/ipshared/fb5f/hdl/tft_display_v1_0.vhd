
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_MISC.ALL;

entity tft_display_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 8
	);
	port (
		-- Users to add ports here
        
        SPI_MOSI_0 : out std_logic;
        SPI_MOSI_1 : out std_logic;
        SPI_CLK : out std_logic;
        SPI_CS : out std_logic;
                

		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic
	);
end tft_display_v1_0;

architecture arch_imp of tft_display_v1_0 is

	-- component declaration
	component tft_display_v1_0_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 8
		);
		port (
	    reg_pins : out std_logic_vector(15 downto 0);
        reg_pins_we : out std_logic;
        reg_data_0 : out std_logic_vector(15 downto 0);
        reg_data_0_we : out std_logic;
        reg_data_1 : out std_logic_vector(15 downto 0);
        reg_data_1_we : out std_logic;
        reg_data_2 : out std_logic_vector(15 downto 0);
        reg_data_2_we : out std_logic;
        busy : in std_logic;                    		
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic		
		);
	end component tft_display_v1_0_S00_AXI;

signal	reg_pins : std_logic_vector(15 downto 0);
signal	reg_pins_we : std_logic;
signal	reg_data_0 : std_logic_vector(15 downto 0);
signal  reg_data_0_we : std_logic;
signal	reg_data_1 : std_logic_vector(15 downto 0);
signal  reg_data_1_we : std_logic;	
signal	reg_data_2 : std_logic_vector(15 downto 0);
signal  reg_data_2_we : std_logic;	
signal WD_DALEY : std_logic := '1';

    signal DISP_RD :  std_logic;
    signal DISP_BLE :  std_logic;
    signal DISP_ON :  std_logic;
    signal DISP_CS :  std_logic;
    signal DISP_RS :  std_logic;
    signal DISP_WD :  std_logic;
    signal DISP_RST :  std_logic;
    signal DISP_D :   std_logic_vector(15 downto 0);

signal pulseWD_counter : integer range 0 to 32:=0;
signal doSPISend : std_logic;
signal SPIWORD : std_logic_vector (31 downto 0);
signal CLKGEN : std_logic_vector (1 downto 0);

signal iSPI_CLK : std_logic;
signal oSPI_CLK : std_logic;

signal spiSM : std_logic_vector (3 downto 0) := x"0"; 
signal busy : std_logic := '0';
begin

-- Instantiation of Axi Bus Interface S00_AXI
tft_display_v1_0_S00_AXI_inst : tft_display_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready,
		reg_pins => reg_pins,
		reg_pins_we => reg_pins_we,
		reg_data_0 => reg_data_0,
        reg_data_0_we => reg_data_0_we,
		reg_data_1 => reg_data_1,
        reg_data_1_we => reg_data_1_we,
        reg_data_2 => reg_data_2,
        reg_data_2_we => reg_data_2_we,
        busy => busy		
	);
	
	SPI_CLK <= iSPI_CLK;
        disp_PROC : process(s00_axi_aclk)
        variable bitcount : integer range 0 to 32 := 0;
        begin
            if rising_edge(s00_axi_aclk) then
                --WD_DALEY <= '1';
                
                --DISP_RD <= '1';
                --DISP_RS <= '1';
                
                if reg_pins_we ='1' then
                    DISP_BLE <= reg_pins(0);
                    DISP_ON <= reg_pins(1);
                    DISP_CS <= reg_pins(2);
                    DISP_RST <= reg_pins(3);
                    doSPISend <= '1';
                end if;
                
                if reg_data_0_we ='1' then
                    DISP_D <= reg_data_0(15 downto 0);
                    DISP_RS <= '0';
                    DISP_WD <= '1';
                    doSPISend <= '1';
--                    pulseWD_counter <= 8;
                end if;                
                
                if reg_data_1_we ='1' then
                    DISP_D <= reg_data_1(15 downto 0);
                    DISP_RS <= '1';
                    DISP_WD <= '1';
                    doSPISend <= '1';
--                    pulseWD_counter <= 8;               
                end if;

                if reg_data_2_we ='1' then
                    DISP_D(15 downto 11) <=reg_data_2(15 downto 11);
                    DISP_D(10 downto 5) <= reg_data_2(10 downto 5);
                    DISP_D(4 downto 0) <=  reg_data_2(4 downto 0);
                    
                    DISP_RS <= '1';
                    DISP_WD <= '1';    
                    doSPISend <= '1';                
--                    pulseWD_counter <= 8;               
                end if;
                 
--               if pulseWD_counter = 4 then
--                DISP_WD <= '0';
--               end if;
               
--               if pulseWD_counter > 0 then
--                 pulseWD_counter<= pulseWD_counter-1;
--               else
--                 DISP_WD <= '1';
--               end if;                
               
               CLKGEN <= CLKGEN +1;
               iSPI_CLK <= CLKGEN(1);
               oSPI_CLK <= iSPI_CLK;
               case spiSM is
                when x"0"=>
                    SPI_CS <= '1';
                    busy <= '0';
                    if doSPISend = '1' then
                        busy <= '1';
                        SPIWORD(15 downto 0) <= DISP_D;
                        SPIWORD(16) <= DISP_CS;
                        SPIWORD(17) <= DISP_RS;
                        SPIWORD(18) <= DISP_WD;
                        SPIWORD(19) <= DISP_RST;
                        bitcount:=0;
                        spiSM <= x"1";
                        doSPISend <= '0';
                    end if;
                when x"1" =>
                     if iSPI_CLK = '1' and oSPI_CLK='0' then
                        SPI_MOSI_0 <= SPIWORD(0);
                        SPI_MOSI_1 <= SPIWORD(1);
                     
                        SPI_CS <= '0';
                        spiSM <= x"2";
                     end if; 
                when x"2"=>
                    if iSPI_CLK = '1' and oSPI_CLK='0' then
                        SPI_MOSI_0 <= SPIWORD(bitcount);
                        SPI_MOSI_1 <= SPIWORD(bitcount+1);
                        spiSM <= x"3";
                    end if;
                when x"3"=>
                    if iSPI_CLK = '0' and oSPI_CLK='1' then
                        bitcount := bitcount +2;                    
                        if bitcount = 20 then
                            spiSM <= x"4";
                        else
                            spiSM <= x"2";
                        end if;
                    end if;
                when x"4"=>
                    if iSPI_CLK = '1' and oSPI_CLK='0' then
                        SPI_CS <= '1';
                        spiSM <= x"0";
                    end if;                 

                when others =>
                
                end case;


               
            end if;
        end process;

	-- Add user logic here

	-- User logic ends

end arch_imp;
