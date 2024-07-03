library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

entity NIDNAPort_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 6
	);
	port (
		-- Users to add ports here

		-- User ports ends
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
end NIDNAPort_v1_0;

architecture arch_imp of NIDNAPort_v1_0 is

	-- component declaration
	component NIDNAPort_v1_0_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 6
		);
		port (
		DNA_0 : in std_logic_vector(31 downto 0);
        DNA_1 : in std_logic_vector(31 downto 0);
		DNA_STATUS : in std_logic_vector(31 downto 0);
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
	end component NIDNAPort_v1_0_S00_AXI;

    signal iCAPCLOCK : STD_LOGIC;
    signal iCAPCLOCKcounter : integer range 0 to 63 :=0;


    signal DNA : std_logic_vector (63 downto 0):= x"0000000000000000";
    signal SN  : std_logic_vector (31 downto 0):= x"00000001";
    signal PRIVETEKEY : std_logic_vector (159 downto 0):= x"0123456789ABCDEF0123456789ABCDEF00000001";

    
    
    
    signal SM_SEC : std_logic_vector (3 downto 0) := x"0";
    

    signal internal_reset : std_logic;
    
    signal DNA_DOUT : std_logic;
    signal DNA_DIN : std_logic := '0';
    signal DNA_READ : std_logic := '0';
    signal DNA_SHIFT : std_logic := '0';
    signal DNA_COUNTER : integer range 0 to 64;
    
    signal DNA_STATUS : std_logic_vector (31 downto 0) := (others => '0');


begin


DNA_PORT_inst : DNA_PORT
generic map (
                       
    SIM_DNA_VALUE => X"1ABCDEF98765432" -- Specifies a sample 57-bit DNA value for simulation
)
port map (
    DOUT => DNA_DOUT, -- 1-bit output: DNA output data.
    CLK => iCAPCLOCK, -- 1-bit input: Clock input.
    DIN => DNA_DIN, -- 1-bit input: User data input pin.
    READ => DNA_READ, -- 1-bit input: Active high load DNA, active low read input.
    SHIFT => DNA_SHIFT -- 1-bit input: Active high shift enable input.
);


-- Instantiation of Axi Bus Interface S00_AXI
NIDNAPort_v1_0_S00_AXI_inst : NIDNAPort_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
	    DNA_0 => DNA(31 downto 0),
	    DNA_1 => DNA(63 downto 32),
	    DNA_STATUS => DNA_STATUS,

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
		S_AXI_RREADY	=> s00_axi_rready
	);


 ssss : process (iCAPCLOCK)
       begin
           
           if rising_edge(iCAPCLOCK) then
               DNA_READ <= '0';
               case SM_SEC is 
                   when x"0" => 
                       DNA_STATUS <= x"00000000";
                       --READ FLASH
                       SM_SEC <= x"1";
                       DNA_READ <= '1';
                       DNA_COUNTER <= 0;
                   when x"1" =>
                       --GET FLASH KEY
                       
                       SM_SEC <= x"2";
                       DNA_SHIFT <= '1';
                   when x"2" =>
                       --READ_DNA
                       DNA(56-DNA_COUNTER) <= DNA_DOUT;    
                       if DNA_COUNTER = 56 then
                           SM_SEC <= x"A";
                           DNA_SHIFT <= '0';
                       else
                           DNA_COUNTER <= DNA_COUNTER +1;
                           DNA_SHIFT <= '1';
                       end if;
                   when x"A" =>
                        DNA_STATUS <= x"00000001";
                   
                   when others =>  SM_SEC <= x"0";
               end case;
           end if;
       
       end process;

	
     DNA_manage: process (s00_axi_aclk)
      begin
          if rising_edge(s00_axi_aclk) then
              if iCAPCLOCKcounter = 50 then
                  iCAPCLOCK <= not iCAPCLOCK;
                  iCAPCLOCKcounter <= 0;
              else
                  iCAPCLOCKcounter <= iCAPCLOCKcounter + 1;
              end if;
              
          end if;
       end process;
	-- Add user logic here

	-- User logic ends

end arch_imp;
