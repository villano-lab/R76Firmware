-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Sat Jul  6 12:59:30 2024
-- Host        : Hraesvelgr running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Owner/Documents/GitHub/R76Firmware/array_spectra_oldversion/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_FIRMWAREBUILD_0/ZynqDesign_FIRMWAREBUILD_0_sim_netlist.vhdl
-- Design      : ZynqDesign_FIRMWAREBUILD_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z030fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZynqDesign_FIRMWAREBUILD_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ZynqDesign_FIRMWAREBUILD_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ZynqDesign_FIRMWAREBUILD_0 : entity is "ZynqDesign_FIRMWAREBUILD_0,xlconstant_v1_1_3_xlconstant,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ZynqDesign_FIRMWAREBUILD_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ZynqDesign_FIRMWAREBUILD_0 : entity is "xlconstant_v1_1_3_xlconstant,Vivado 2017.4";
end ZynqDesign_FIRMWAREBUILD_0;

architecture STRUCTURE of ZynqDesign_FIRMWAREBUILD_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
begin
  dout(31) <= \<const0>\;
  dout(30) <= \<const0>\;
  dout(29) <= \<const0>\;
  dout(28) <= \<const1>\;
  dout(27) <= \<const1>\;
  dout(26) <= \<const0>\;
  dout(25) <= \<const0>\;
  dout(24) <= \<const1>\;
  dout(23) <= \<const0>\;
  dout(22) <= \<const0>\;
  dout(21) <= \<const0>\;
  dout(20) <= \<const0>\;
  dout(19) <= \<const0>\;
  dout(18) <= \<const0>\;
  dout(17) <= \<const1>\;
  dout(16) <= \<const1>\;
  dout(15) <= \<const0>\;
  dout(14) <= \<const0>\;
  dout(13) <= \<const0>\;
  dout(12) <= \<const1>\;
  dout(11) <= \<const0>\;
  dout(10) <= \<const0>\;
  dout(9) <= \<const0>\;
  dout(8) <= \<const1>\;
  dout(7) <= \<const0>\;
  dout(6) <= \<const0>\;
  dout(5) <= \<const0>\;
  dout(4) <= \<const0>\;
  dout(3) <= \<const0>\;
  dout(2) <= \<const0>\;
  dout(1) <= \<const0>\;
  dout(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;
