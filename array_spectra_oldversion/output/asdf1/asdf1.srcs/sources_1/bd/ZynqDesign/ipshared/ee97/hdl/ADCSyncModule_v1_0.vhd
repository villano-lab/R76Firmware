
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


Library UNISIM;
use UNISIM.vcomponents.all;

entity ADCSyncModule_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 7
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line

          cfg_serdes1_delay : out std_logic_vector(5-1 downto 0);
          cfg_serdes1_delay_exc : out std_logic;
          cfg_pulse_bitsleep : out std_logic;
          cfg_abselector : out std_logic;                  
          cfg_channel_selector : out std_logic_vector(7 downto 0);
          cfg_selected_prw : in std_logic_vector(15 downto 0);
          serdes_reset : out std_logic_vector(7 downto 0);
          
            SMADC_1_CSA : out std_logic;
            SMADC_1_CSB : out std_logic;
            SMADC_2_CSA : out std_logic;
            SMADC_2_CSB : out std_logic;
            SMADC_3_CSA : out std_logic;
            SMADC_3_CSB : out std_logic;
            SMADC_4_CSA : out std_logic;
            SMADC_4_CSB : out std_logic;

            
            SMADC_CLK : out std_logic;
            SMADC_MOSI : out std_logic;
                      
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
end ADCSyncModule_v1_0;

architecture arch_imp of ADCSyncModule_v1_0 is

	-- component declaration
	component ADCSyncModule_v1_0_S00_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 7
		);
		port (
		REG_0 : out std_logic_vector (31 downto 0);
		REG_1 : out std_logic_vector (31 downto 0);
		REG_2 : out std_logic_vector (31 downto 0);
		REG_3 : out std_logic_vector (31 downto 0);
		REG_4 : out std_logic_vector (31 downto 0);

		REG_6 : in std_logic_vector (31 downto 0);
		REG_7 : in std_logic_vector (31 downto 0);
		REG_8 : in std_logic_vector (31 downto 0);
		REG_9 : in std_logic_vector (31 downto 0);
		REG_10 : in std_logic_vector (31 downto 0);
		REG_11 : in std_logic_vector (31 downto 0);
		REG_12 : out std_logic_vector (31 downto 0);
        REG_13 : out std_logic_vector (31 downto 0);		
        REG_14 : out std_logic_vector (31 downto 0);		
		REG_30 : out std_logic_vector (31 downto 0);
		REG_31 : out std_logic_vector (31 downto 0);
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
	end component ADCSyncModule_v1_0_S00_AXI;

    signal SIG_A :  std_logic_vector(7 downto 0);
    signal SIG_B :  std_logic_vector(7 downto 0);

    signal PTTRN_A_1 :  std_logic_vector(7 downto 0);
    signal PTTRN_B_1 :  std_logic_vector(7 downto 0);

    signal PTTRN_A_2 :  std_logic_vector(7 downto 0);
    signal PTTRN_B_2 :  std_logic_vector(7 downto 0);
    
    signal ERR_A_CNT :  std_logic_vector(31 downto 0);
    signal ERR_B_CNT :  std_logic_vector(31 downto 0);
    
    signal ERR_RST : std_logic := '0';
    
    signal REG_0 :  std_logic_vector (31 downto 0);
    signal REG_1 :  std_logic_vector (31 downto 0);
    signal REG_2 :  std_logic_vector (31 downto 0);
    signal REG_3 :  std_logic_vector (31 downto 0);
    signal REG_4 :  std_logic_vector (31 downto 0);
    signal REG_6 :  std_logic_vector (31 downto 0);
    signal REG_7 :  std_logic_vector (31 downto 0);
    signal REG_8 :  std_logic_vector (31 downto 0) := (others => '0');
    signal REG_9 :  std_logic_vector (31 downto 0) := (others => '0');
    signal REG_10 :  std_logic_vector (31 downto 0) := (others => '0');
    signal REG_11 :  std_logic_vector (31 downto 0) := (others => '0');
    signal REG_12 :  std_logic_vector (31 downto 0) := (others => '0');
    signal REG_13 :  std_logic_vector (31 downto 0) := (others => '0');
    signal REG_14 :  std_logic_vector (31 downto 0) := (others => '0');
    signal REG_30 :  std_logic_vector (31 downto 0);
    signal REG_31 :  std_logic_vector (31 downto 0);
begin
    
-- Instantiation of Axi Bus Interface S00_AXI
ADCSyncModule_v1_0_S00_AXI_inst : ADCSyncModule_v1_0_S00_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
	)
	port map (
	    REG_0 => REG_0,
	    REG_1 => REG_1,
	    REG_2 => REG_2,
	    REG_3 => REG_3,
	    REG_4 => REG_4,
	    REG_6 => REG_6,
	    REG_7 => REG_7,
	    REG_8 => REG_8,
	    REG_9 => REG_9,
	    REG_10 => REG_10,
	    REG_11 => REG_11,
	    REG_12 => REG_12,
	    REG_13 => REG_13,
	    REG_14 => REG_14,
	    REG_30 => REG_30,
	    REG_31 => REG_31,
	    
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

	-- Add user logic here
    SIG_A <= cfg_selected_prw(7 downto 0);
    SIG_B <= cfg_selected_prw(15 downto 8);
    
    REG_6 <= ERR_A_CNT;
    REG_7 <= ERR_B_CNT;
    
    REG_8 (7 downto 0) <= SIG_A;
    REG_9 (7 downto 0) <= SIG_B; 
    REG_10 (15 downto 0) <= cfg_selected_prw;
    ERR_RST <= REG_4(0);
    
    cfg_abselector <= REG_3(8);                  
    cfg_channel_selector  <= REG_3(7 downto 0);
    
    cfg_serdes1_delay <= REG_0(4 downto 0);   
    cfg_serdes1_delay_exc <= REG_1(0);
    cfg_pulse_bitsleep <= REG_1(1);
    
    
    PTTRN_A_1 <= REG_12(7 downto 0);
    PTTRN_B_1 <= REG_13(7 downto 0);

    PTTRN_A_2 <= REG_12(15 downto 8);
    PTTRN_B_2 <= REG_13(15 downto 8);
    
    serdes_reset <= REG_14(7 downto 0);
    
    aaprog: block
            signal SMADC : std_logic_vector(3 downto 0) := x"0";
            signal SMADCnew : std_logic_vector(3 downto 0) := x"0";
            signal SMADCwordwrite : std_logic_vector(23 downto 0) := x"000000";
            signal idx : integer := 0;
            signal SMdelay : std_logic_vector(15 downto 0);
            signal startBit : std_logic;
            signal ostartBit : std_logic;
            signal SMADC_CS : std_logic;
            signal progCounter : std_logic_vector (15 downto 0):= x"0000";
        begin
            REG_11(3 downto 0) <= SMADC;
            REG_11(31 downto 16) <= progCounter;
            SMADC_1_CSA <= SMADC_CS when REG_30(0) = '0' else '1';
            SMADC_1_CSB <= SMADC_CS when REG_30(1) = '0' else '1';
            SMADC_2_CSA <= SMADC_CS when REG_30(2) = '0' else '1';
            SMADC_2_CSB <= SMADC_CS when REG_30(3) = '0' else '1';
            SMADC_3_CSA <= SMADC_CS when REG_30(4) = '0' else '1';
            SMADC_3_CSB <= SMADC_CS when REG_30(5) = '0' else '1';
            SMADC_4_CSA <= SMADC_CS when REG_30(6) = '0' else '1';
            SMADC_4_CSB <= SMADC_CS when REG_30(7) = '0' else '1';
            
            programmachine : process (s00_axi_aclk) 
            begin
                if rising_edge(s00_axi_aclk) then
                ostartBit <= startBit;
                startBit <= REG_31(31);
                
                    case SMADC is
                        
                        when x"0" =>
                            SMADC_CS <= '1';
                            SMADC_MOSI <= '1';
                            idx <= 0;
                            
                            SMADCwordwrite <= REG_31(23 downto 0);
                            if ostartBit = '0' and startBit='1' then
                                SMADC <= x"1";
                                progCounter <= progCounter +1;
                            end if;
                        
                        when x"1" => 
                            SMADC_CLK <= '0';
                            SMADC_CS <= '0';
                            SMADC <= x"F";
                            SMADCnew <= x"2";
                            SMdelay <= x"000F";
                            
                        when x"2" =>
                            SMADC_CLK <= '0';
                            SMADC_CS <= '0';
                            SMADC_MOSI <= SMADCwordwrite(23-idx);   
                            idx <= idx +1;
                            SMdelay <= x"000F";
                            SMADC <= x"F";
                            SMADCnew <= x"3";
                            
                        when x"3" =>
                            SMADC_CLK <= '1';
                            SMdelay <= x"000F";
                            SMADC <= x"F";
                            SMADCnew <= x"2";
                            
                            if idx = 24 then
                                SMdelay <= x"000F";
                                SMADC <= x"F";
                                SMADCnew <= x"A";
                            end if;
                            
                        when x"A" =>
                             SMADC_CS <= '1';
                             SMdelay <= x"000F";
                             SMADC <= x"F";
                             SMADCnew <= x"0";                     
          
              
                        when x"F" => 
                            if SMdelay = x"0000" then
                                SMADC <= SMADCnew;
                            else
                                SMdelay <= SMdelay-1; 
                            end if;
                            
                            
                        when others =>
                     end case;
                                
                end if;
            end process;
            
          end block; 
            
    pp : process (s00_axi_aclk)
    begin
        if rising_edge(s00_axi_aclk) then
            if ERR_RST= '1' then
                ERR_A_CNT <= x"00000000";
                ERR_B_CNT <= x"00000000";
            else
                if PTTRN_A_1 = SIG_A or PTTRN_A_2 = SIG_A then
            
                else
                    ERR_A_CNT <= ERR_A_CNT +1;
                end if;
                
                if PTTRN_B_1 = SIG_B or PTTRN_B_2 = SIG_B then
            
                else
                    ERR_B_CNT <= ERR_B_CNT +1;
                end if;            
                            
            end if;
        end if;
    end process;
	-- User logic ends

end arch_imp;



