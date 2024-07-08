############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project DMATDCZynq
set_top data_mover
add_files DmaTDC.cpp
open_solution "solution1"
set_part {xc7z045ffg676-1}
create_clock -period 8 -name default
source "./DMATDCZynq/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -rtl vhdl -format ip_catalog -description "GEMINI_TDC_DMA" -vendor "NuclearInstruments" -display_name "GEMINI_TDC_DMA"
