-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Mon Jul  8 12:32:51 2024
-- Host        : PHYS-NC3124-D02 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/hellmala/Documents/GitHub/R76Firmware/array_spectra_oldversion/output/asdf2/asdf2.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_FIRMWAREBUILD_0/ZynqDesign_FIRMWAREBUILD_0_stub.vhdl
-- Design      : ZynqDesign_FIRMWAREBUILD_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z030fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ZynqDesign_FIRMWAREBUILD_0 is
  Port ( 
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end ZynqDesign_FIRMWAREBUILD_0;

architecture stub of ZynqDesign_FIRMWAREBUILD_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "dout[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "xlconstant_v1_1_3_xlconstant,Vivado 2017.4";
begin
end;
