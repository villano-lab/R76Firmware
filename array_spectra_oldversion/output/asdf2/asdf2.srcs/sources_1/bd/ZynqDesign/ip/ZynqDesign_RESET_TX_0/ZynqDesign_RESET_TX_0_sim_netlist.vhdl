-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Mon Jul  8 12:32:55 2024
-- Host        : PHYS-NC3124-D02 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top ZynqDesign_RESET_TX_0 -prefix
--               ZynqDesign_RESET_TX_0_ ZynqDesign_util_vector_logic_1_0_sim_netlist.vhdl
-- Design      : ZynqDesign_util_vector_logic_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z030fbg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity ZynqDesign_RESET_TX_0 is
  port (
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    Res : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of ZynqDesign_RESET_TX_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of ZynqDesign_RESET_TX_0 : entity is "ZynqDesign_util_vector_logic_1_0,util_vector_logic_v2_0_1_util_vector_logic,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of ZynqDesign_RESET_TX_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of ZynqDesign_RESET_TX_0 : entity is "util_vector_logic_v2_0_1_util_vector_logic,Vivado 2017.4";
end ZynqDesign_RESET_TX_0;

architecture STRUCTURE of ZynqDesign_RESET_TX_0 is
begin
\Res[0]_INST_0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Op1(0),
      O => Res(0)
    );
end STRUCTURE;
