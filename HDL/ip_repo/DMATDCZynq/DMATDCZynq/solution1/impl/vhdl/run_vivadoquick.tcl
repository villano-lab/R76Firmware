## ==============================================================
## File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
## Version: 2017.4
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
## 
## ==============================================================

#
# define some helpful variables, dirs, etc.
#
source ./settings.tcl
source ./extraction.tcl

set targetPart ${device}${package}${speed}

# create project 
create_project project . -part $targetPart -force
set_property target_language $language [current_project]


# setup design sources and constraints
set hdlfs [glob -nocomplain ./*.vhd ./*.v ./*.coe]
if {$hdlfs != "" } {
    add_files -norecurse $hdlfs
}
set xdcfs [glob -nocomplain ./*.xdc]
if {$xdcfs != "" } {
    add_files -fileset constrs_1 -norecurse $xdcfs
}

# vivado scripts to generate IP
set tclfiles [glob -nocomplain *_ip.tcl]
if { $tclfiles != ""} {
    foreach file $tclfiles {
         source $file
    }
}

