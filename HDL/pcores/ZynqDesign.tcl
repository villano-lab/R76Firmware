
################################################################
# This is a generated script based on design: ZynqDesign
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.4
set current_vivado_version [version -short]

#if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
#   puts ""
#   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}
#
#   return 1
#}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source ZynqDesign_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z030fbg676-2
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name ZynqDesign

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
NuclearInstruments:user:ADCSyncModule:1.0\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:axis_data_fifo:1.1\
xilinx.com:user:FirmwareStatus:1.0\
NuclearInstruments:user:DTFirmwareInfo:1.0\
xilinx.com:user:NIDNAPort:1.0\
xilinx.com:ip:aurora_64b66b:11.2\
xilinx.com:ip:util_vector_logic:2.0\
xilinx.com:ip:axi_amm_bridge:1.0\
xilinx.com:ip:axi_iic:2.0\
NuclearInstruments:hls:data_mover:2.0\
xilinx.com:ip:processing_system7:5.5\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:user:tft_display:2.0\
"

   set list_ips_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_msg_id "BD_TCL-1003" "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR_0 ]
  set FIXED_IO_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO_0 ]
  set FS_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 FS_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {125000000} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {0} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {xilinx.com:interface:datatypes:1.0 {TDATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value {}} bitwidth {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 64} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}}}} \
   CONFIG.TDATA_NUM_BYTES {8} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {0} \
   ] $FS_0
  set GT_REFCLK_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 GT_REFCLK_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $GT_REFCLK_0
  set GT_RX_2 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX_rtl:1.0 GT_RX_2 ]
  set GT_RX_3 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_RX_rtl:1.0 GT_RX_3 ]
  set GT_TX_2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX_rtl:1.0 GT_TX_2 ]
  set GT_TX_3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_aurora:GT_Serial_Transceiver_Pins_TX_rtl:1.0 GT_TX_3 ]
  set IIC_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC_0 ]
  set LINK0_FIFO_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 LINK0_FIFO_IN ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {125000000} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {0} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {1} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {0} \
   ] $LINK0_FIFO_IN
  set LINK0_FIFO_OUT [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 LINK0_FIFO_OUT ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {125000000} \
   ] $LINK0_FIFO_OUT
  set LINK1_FIFO_IN [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 LINK1_FIFO_IN ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {125000000} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {0} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {1} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {0} \
   ] $LINK1_FIFO_IN
  set LINK1_FIFO_OUT [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 LINK1_FIFO_OUT ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {125000000} \
   ] $LINK1_FIFO_OUT
  set M_AVALON_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:avalon_rtl:1.0 M_AVALON_0 ]

  # Create ports
  set BOARDPOSITION [ create_bd_port -dir I -from 1 -to 0 BOARDPOSITION ]
  set CLOCK_PL [ create_bd_port -dir I -type clk CLOCK_PL ]
  set_property -dict [ list \
   CONFIG.ASSOCIATED_BUSIF {LINK0_FIFO_IN:LINK1_FIFO_IN:LINK1_FIFO_OUT:LINK0_FIFO_OUT} \
   CONFIG.FREQ_HZ {125000000} \
 ] $CLOCK_PL
  set CLOCK_RESET [ create_bd_port -dir O -type clk CLOCK_RESET ]
  set CLOCK_SOURCE [ create_bd_port -dir I -from 3 -to 0 CLOCK_SOURCE ]
  set FW_RELEASE_DATE_0 [ create_bd_port -dir I -from 31 -to 0 FW_RELEASE_DATE_0 ]
  set FW_STRING_0 [ create_bd_port -dir I -from 127 -to 0 FW_STRING_0 ]
  set FW_VER_0 [ create_bd_port -dir I -from 31 -to 0 FW_VER_0 ]
  set INVALID_EXT_CLK [ create_bd_port -dir I -type clk INVALID_EXT_CLK ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {125000000} \
 ] $INVALID_EXT_CLK
  set LINK0_RXCLK [ create_bd_port -dir O -type clk LINK0_RXCLK ]
  set MAIN_CLOCK [ create_bd_port -dir O -type clk MAIN_CLOCK ]
  set MAIN_RESET [ create_bd_port -dir O -from 0 -to 0 MAIN_RESET ]
  set SIRcClock [ create_bd_port -dir I -type clk SIRcClock ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
 ] $SIRcClock
  set SMADC_1_CSA_0 [ create_bd_port -dir O SMADC_1_CSA_0 ]
  set SMADC_1_CSB_0 [ create_bd_port -dir O SMADC_1_CSB_0 ]
  set SMADC_2_CSA_0 [ create_bd_port -dir O SMADC_2_CSA_0 ]
  set SMADC_2_CSB_0 [ create_bd_port -dir O SMADC_2_CSB_0 ]
  set SMADC_3_CSA_0 [ create_bd_port -dir O SMADC_3_CSA_0 ]
  set SMADC_3_CSB_0 [ create_bd_port -dir O SMADC_3_CSB_0 ]
  set SMADC_4_CSA_0 [ create_bd_port -dir O SMADC_4_CSA_0 ]
  set SMADC_4_CSB_0 [ create_bd_port -dir O SMADC_4_CSB_0 ]
  set SMADC_CLK_0 [ create_bd_port -dir O -type clk SMADC_CLK_0 ]
  set SMADC_MOSI_0 [ create_bd_port -dir O SMADC_MOSI_0 ]
  set SPI_CLK_0 [ create_bd_port -dir O SPI_CLK_0 ]
  set SPI_CS_0 [ create_bd_port -dir O SPI_CS_0 ]
  set SPI_MOSI_0_0 [ create_bd_port -dir O SPI_MOSI_0_0 ]
  set SPI_MOSI_1_0 [ create_bd_port -dir O SPI_MOSI_1_0 ]
  set cfg_abselector_0 [ create_bd_port -dir O cfg_abselector_0 ]
  set cfg_channel_selector_0 [ create_bd_port -dir O -from 7 -to 0 cfg_channel_selector_0 ]
  set cfg_pulse_bitsleep_0 [ create_bd_port -dir O cfg_pulse_bitsleep_0 ]
  set cfg_selected_prw_0 [ create_bd_port -dir I -from 15 -to 0 cfg_selected_prw_0 ]
  set cfg_serdes1_delay_0 [ create_bd_port -dir O -from 4 -to 0 cfg_serdes1_delay_0 ]
  set cfg_serdes1_delay_exc_0 [ create_bd_port -dir O cfg_serdes1_delay_exc_0 ]
  set clock_source_commutator [ create_bd_port -dir O -type clk clock_source_commutator ]
  set serdes_reset_0 [ create_bd_port -dir O -from 7 -to 0 -type rst serdes_reset_0 ]

  # Create instance: ADCSyncModule_0, and set properties
  set ADCSyncModule_0 [ create_bd_cell -type ip -vlnv NuclearInstruments:user:ADCSyncModule:1.0 ADCSyncModule_0 ]

  # Create instance: FIRMWAREBUILD, and set properties
  set FIRMWAREBUILD [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 FIRMWAREBUILD ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0x19031100} \
   CONFIG.CONST_WIDTH {32} \
 ] $FIRMWAREBUILD

  # Create instance: FIRMWAREOPTIONS, and set properties
  set FIRMWAREOPTIONS [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 FIRMWAREOPTIONS ]
  set_property -dict [ list \
   CONFIG.CONST_WIDTH {32} \
 ] $FIRMWAREOPTIONS

  # Create instance: FIRMWAREVERSION, and set properties
  set FIRMWAREVERSION [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 FIRMWAREVERSION ]
  set_property -dict [ list \
   CONFIG.CONST_WIDTH {32} \
 ] $FIRMWAREVERSION

  # Create instance: FS_0_AXIFIFO, and set properties
  set FS_0_AXIFIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 FS_0_AXIFIFO ]
  set_property -dict [ list \
   CONFIG.IS_ACLK_ASYNC {1} \
 ] $FS_0_AXIFIFO

  # Create instance: FirmwareStatus_0, and set properties
  set FirmwareStatus_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:FirmwareStatus:1.0 FirmwareStatus_0 ]

  # Create instance: IICBaseInterconnection_0, and set properties
  set IICBaseInterconnection_0 [ create_bd_cell -type ip -vlnv NuclearInstruments:user:DTFirmwareInfo:1.0 IICBaseInterconnection_0 ]

  # Create instance: NIDNAPort_0, and set properties
  set NIDNAPort_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:NIDNAPort:1.0 NIDNAPort_0 ]

  # Create instance: OPTOLINK_0, and set properties
  set OPTOLINK_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:11.2 OPTOLINK_0 ]
  set_property -dict [ list \
   CONFIG.C_GT_CLOCK_1 {GTXQ0} \
   CONFIG.C_GT_LOC_1 {1} \
   CONFIG.C_GT_LOC_2 {X} \
   CONFIG.C_GT_LOC_3 {X} \
   CONFIG.C_GT_LOC_9 {X} \
   CONFIG.C_LINE_RATE {6.25} \
   CONFIG.C_REFCLK_FREQUENCY {156.250} \
   CONFIG.C_USER_K {false} \
   CONFIG.C_USE_BYTESWAP {false} \
   CONFIG.SINGLEEND_INITCLK {true} \
   CONFIG.SupportLevel {1} \
   CONFIG.TransceiverControl {true} \
   CONFIG.dataflow_config {TX/RX_Simplex} \
   CONFIG.drp_mode {Disabled} \
   CONFIG.flow_mode {None} \
   CONFIG.interface_mode {Streaming} \
 ] $OPTOLINK_0

  # Create instance: OPTOLINK_1, and set properties
  set OPTOLINK_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:aurora_64b66b:11.2 OPTOLINK_1 ]
  set_property -dict [ list \
   CONFIG.C_GT_CLOCK_1 {GTXQ0} \
   CONFIG.C_GT_LOC_1 {1} \
   CONFIG.C_GT_LOC_2 {X} \
   CONFIG.C_GT_LOC_4 {X} \
   CONFIG.C_GT_LOC_9 {X} \
   CONFIG.C_LINE_RATE {6.25} \
   CONFIG.C_REFCLK_FREQUENCY {156.250} \
   CONFIG.C_USER_K {false} \
   CONFIG.SupportLevel {0} \
   CONFIG.TransceiverControl {true} \
   CONFIG.dataflow_config {TX/RX_Simplex} \
   CONFIG.drp_mode {Disabled} \
   CONFIG.flow_mode {None} \
   CONFIG.interface_mode {Streaming} \
 ] $OPTOLINK_1

  # Create instance: RESET_RX, and set properties
  set RESET_RX [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 RESET_RX ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $RESET_RX

  # Create instance: RESET_TX, and set properties
  set RESET_TX [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 RESET_TX ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $RESET_TX

  # Create instance: axi_amm_bridge_0, and set properties
  set axi_amm_bridge_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_amm_bridge:1.0 axi_amm_bridge_0 ]
  set_property -dict [ list \
   CONFIG.C_ADDRESS_MODE {1} \
   CONFIG.C_AVM_BURST_WIDTH {1} \
   CONFIG.C_BURST_SUPPORT {0} \
   CONFIG.C_HAS_RESPONSE {0} \
   CONFIG.C_HAS_WAIT_REQUEST {1} \
   CONFIG.C_PROTOCOL {0} \
   CONFIG.C_USE_BYTEENABLE {0} \
 ] $axi_amm_bridge_0

  # Create instance: axi_iic_0, and set properties
  set axi_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0 ]
  set_property -dict [ list \
   CONFIG.C_SCL_INERTIAL_DELAY {5} \
   CONFIG.C_SDA_INERTIAL_DELAY {5} \
   CONFIG.IIC_FREQ_KHZ {100} \
 ] $axi_iic_0

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $axi_interconnect_0

  # Create instance: axis_data_fifo_0, and set properties
  set axis_data_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_0 ]
  set_property -dict [ list \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.TDATA_NUM_BYTES {8} \
 ] $axis_data_fifo_0

  # Create instance: axis_data_fifo_1, and set properties
  set axis_data_fifo_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_1 ]
  set_property -dict [ list \
   CONFIG.IS_ACLK_ASYNC {1} \
 ] $axis_data_fifo_1

  # Create instance: axis_data_fifo_2, and set properties
  set axis_data_fifo_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_2 ]
  set_property -dict [ list \
   CONFIG.IS_ACLK_ASYNC {1} \
   CONFIG.TDATA_NUM_BYTES {8} \
 ] $axis_data_fifo_2

  # Create instance: axis_data_fifo_3, and set properties
  set axis_data_fifo_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_3 ]
  set_property -dict [ list \
   CONFIG.IS_ACLK_ASYNC {1} \
 ] $axis_data_fifo_3

  # Create instance: data_mover_0, and set properties
  set data_mover_0 [ create_bd_cell -type ip -vlnv NuclearInstruments:hls:data_mover:2.0 data_mover_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
   CONFIG.PCW_ACT_APU_PERIPHERAL_FREQMHZ {666.666687} \
   CONFIG.PCW_ACT_CAN0_PERIPHERAL_FREQMHZ {23.8095} \
   CONFIG.PCW_ACT_CAN1_PERIPHERAL_FREQMHZ {23.8095} \
   CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.158730} \
   CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
   CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {125.000000} \
   CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_I2C_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {50.000000} \
   CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
   CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
   CONFIG.PCW_ACT_TTC0_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC0_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK0_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK1_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC1_CLK2_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_ACT_TTC_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {50.000000} \
   CONFIG.PCW_ACT_USB0_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_ACT_USB1_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_ACT_WDT_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_APU_CLK_RATIO_ENABLE {6:2:1} \
   CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {666.666666} \
   CONFIG.PCW_ARMPLL_CTRL_FBDIV {40} \
   CONFIG.PCW_CAN0_BASEADDR {0xE0008000} \
   CONFIG.PCW_CAN0_GRP_CLK_ENABLE {0} \
   CONFIG.PCW_CAN0_HIGHADDR {0xE0008FFF} \
   CONFIG.PCW_CAN0_PERIPHERAL_CLKSRC {External} \
   CONFIG.PCW_CAN0_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_CAN0_PERIPHERAL_FREQMHZ {-1} \
   CONFIG.PCW_CAN1_BASEADDR {0xE0009000} \
   CONFIG.PCW_CAN1_GRP_CLK_ENABLE {0} \
   CONFIG.PCW_CAN1_HIGHADDR {0xE0009FFF} \
   CONFIG.PCW_CAN1_PERIPHERAL_CLKSRC {External} \
   CONFIG.PCW_CAN1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_CAN1_PERIPHERAL_FREQMHZ {-1} \
   CONFIG.PCW_CAN_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_CAN_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_CAN_PERIPHERAL_VALID {0} \
   CONFIG.PCW_CLK0_FREQ {125000000} \
   CONFIG.PCW_CLK1_FREQ {10000000} \
   CONFIG.PCW_CLK2_FREQ {10000000} \
   CONFIG.PCW_CLK3_FREQ {10000000} \
   CONFIG.PCW_CORE0_FIQ_INTR {0} \
   CONFIG.PCW_CORE0_IRQ_INTR {0} \
   CONFIG.PCW_CORE1_FIQ_INTR {0} \
   CONFIG.PCW_CORE1_IRQ_INTR {0} \
   CONFIG.PCW_CPU_CPU_6X4X_MAX_RANGE {800} \
   CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1333.333} \
   CONFIG.PCW_CPU_PERIPHERAL_CLKSRC {ARM PLL} \
   CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {33.333333} \
   CONFIG.PCW_DCI_PERIPHERAL_CLKSRC {DDR PLL} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {15} \
   CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {7} \
   CONFIG.PCW_DCI_PERIPHERAL_FREQMHZ {10.159} \
   CONFIG.PCW_DDRPLL_CTRL_FBDIV {32} \
   CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1066.667} \
   CONFIG.PCW_DDR_HPRLPR_QUEUE_PARTITION {HPR(0)/LPR(32)} \
   CONFIG.PCW_DDR_HPR_TO_CRITICAL_PRIORITY_LEVEL {15} \
   CONFIG.PCW_DDR_LPR_TO_CRITICAL_PRIORITY_LEVEL {2} \
   CONFIG.PCW_DDR_PERIPHERAL_CLKSRC {DDR PLL} \
   CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {2} \
   CONFIG.PCW_DDR_PORT0_HPR_ENABLE {0} \
   CONFIG.PCW_DDR_PORT1_HPR_ENABLE {0} \
   CONFIG.PCW_DDR_PORT2_HPR_ENABLE {0} \
   CONFIG.PCW_DDR_PORT3_HPR_ENABLE {0} \
   CONFIG.PCW_DDR_RAM_BASEADDR {0x00100000} \
   CONFIG.PCW_DDR_RAM_HIGHADDR {0x3FFFFFFF} \
   CONFIG.PCW_DDR_WRITE_TO_CRITICAL_PRIORITY_LEVEL {2} \
   CONFIG.PCW_DM_WIDTH {4} \
   CONFIG.PCW_DQS_WIDTH {4} \
   CONFIG.PCW_DQ_WIDTH {32} \
   CONFIG.PCW_ENET0_BASEADDR {0xE000B000} \
   CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
   CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
   CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
   CONFIG.PCW_ENET0_HIGHADDR {0xE000BFFF} \
   CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} \
   CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps} \
   CONFIG.PCW_ENET0_RESET_ENABLE {1} \
   CONFIG.PCW_ENET0_RESET_IO {MIO 0} \
   CONFIG.PCW_ENET1_BASEADDR {0xE000C000} \
   CONFIG.PCW_ENET1_GRP_MDIO_ENABLE {0} \
   CONFIG.PCW_ENET1_HIGHADDR {0xE000CFFF} \
   CONFIG.PCW_ENET1_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_ENET1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_ENET1_PERIPHERAL_FREQMHZ {1000 Mbps} \
   CONFIG.PCW_ENET1_RESET_ENABLE {0} \
   CONFIG.PCW_ENET_RESET_ENABLE {1} \
   CONFIG.PCW_ENET_RESET_POLARITY {Active Low} \
   CONFIG.PCW_ENET_RESET_SELECT {Share reset pin} \
   CONFIG.PCW_EN_4K_TIMER {0} \
   CONFIG.PCW_EN_CAN0 {0} \
   CONFIG.PCW_EN_CAN1 {0} \
   CONFIG.PCW_EN_CLK0_PORT {1} \
   CONFIG.PCW_EN_CLK1_PORT {0} \
   CONFIG.PCW_EN_CLK2_PORT {0} \
   CONFIG.PCW_EN_CLK3_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG0_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG1_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG2_PORT {0} \
   CONFIG.PCW_EN_CLKTRIG3_PORT {0} \
   CONFIG.PCW_EN_DDR {1} \
   CONFIG.PCW_EN_EMIO_CAN0 {0} \
   CONFIG.PCW_EN_EMIO_CAN1 {0} \
   CONFIG.PCW_EN_EMIO_CD_SDIO0 {0} \
   CONFIG.PCW_EN_EMIO_CD_SDIO1 {0} \
   CONFIG.PCW_EN_EMIO_ENET0 {0} \
   CONFIG.PCW_EN_EMIO_ENET1 {0} \
   CONFIG.PCW_EN_EMIO_GPIO {0} \
   CONFIG.PCW_EN_EMIO_I2C0 {0} \
   CONFIG.PCW_EN_EMIO_I2C1 {0} \
   CONFIG.PCW_EN_EMIO_MODEM_UART0 {0} \
   CONFIG.PCW_EN_EMIO_MODEM_UART1 {0} \
   CONFIG.PCW_EN_EMIO_PJTAG {0} \
   CONFIG.PCW_EN_EMIO_SDIO0 {0} \
   CONFIG.PCW_EN_EMIO_SDIO1 {0} \
   CONFIG.PCW_EN_EMIO_SPI0 {0} \
   CONFIG.PCW_EN_EMIO_SPI1 {0} \
   CONFIG.PCW_EN_EMIO_SRAM_INT {0} \
   CONFIG.PCW_EN_EMIO_TRACE {0} \
   CONFIG.PCW_EN_EMIO_TTC0 {1} \
   CONFIG.PCW_EN_EMIO_TTC1 {0} \
   CONFIG.PCW_EN_EMIO_UART0 {0} \
   CONFIG.PCW_EN_EMIO_UART1 {0} \
   CONFIG.PCW_EN_EMIO_WDT {0} \
   CONFIG.PCW_EN_EMIO_WP_SDIO0 {0} \
   CONFIG.PCW_EN_EMIO_WP_SDIO1 {0} \
   CONFIG.PCW_EN_ENET0 {1} \
   CONFIG.PCW_EN_ENET1 {0} \
   CONFIG.PCW_EN_GPIO {1} \
   CONFIG.PCW_EN_I2C0 {1} \
   CONFIG.PCW_EN_I2C1 {0} \
   CONFIG.PCW_EN_MODEM_UART0 {0} \
   CONFIG.PCW_EN_MODEM_UART1 {0} \
   CONFIG.PCW_EN_PJTAG {0} \
   CONFIG.PCW_EN_PTP_ENET0 {1} \
   CONFIG.PCW_EN_PTP_ENET1 {0} \
   CONFIG.PCW_EN_QSPI {1} \
   CONFIG.PCW_EN_RST0_PORT {1} \
   CONFIG.PCW_EN_RST1_PORT {0} \
   CONFIG.PCW_EN_RST2_PORT {0} \
   CONFIG.PCW_EN_RST3_PORT {0} \
   CONFIG.PCW_EN_SDIO0 {1} \
   CONFIG.PCW_EN_SDIO1 {0} \
   CONFIG.PCW_EN_SMC {0} \
   CONFIG.PCW_EN_SPI0 {0} \
   CONFIG.PCW_EN_SPI1 {0} \
   CONFIG.PCW_EN_TRACE {0} \
   CONFIG.PCW_EN_TTC0 {1} \
   CONFIG.PCW_EN_TTC1 {0} \
   CONFIG.PCW_EN_UART0 {1} \
   CONFIG.PCW_EN_UART1 {1} \
   CONFIG.PCW_EN_USB0 {1} \
   CONFIG.PCW_EN_USB1 {0} \
   CONFIG.PCW_EN_WDT {0} \
   CONFIG.PCW_FCLK0_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {4} \
   CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {2} \
   CONFIG.PCW_FCLK1_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
   CONFIG.PCW_FCLK_CLK0_BUF {TRUE} \
   CONFIG.PCW_FCLK_CLK1_BUF {FALSE} \
   CONFIG.PCW_FCLK_CLK2_BUF {FALSE} \
   CONFIG.PCW_FCLK_CLK3_BUF {FALSE} \
   CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {125} \
   CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {33.333333} \
   CONFIG.PCW_FPGA3_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
   CONFIG.PCW_FPGA_FCLK1_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK2_ENABLE {0} \
   CONFIG.PCW_FPGA_FCLK3_ENABLE {0} \
   CONFIG.PCW_FTM_CTI_IN0 {<Select>} \
   CONFIG.PCW_FTM_CTI_IN1 {<Select>} \
   CONFIG.PCW_FTM_CTI_IN2 {<Select>} \
   CONFIG.PCW_FTM_CTI_IN3 {<Select>} \
   CONFIG.PCW_FTM_CTI_OUT0 {<Select>} \
   CONFIG.PCW_FTM_CTI_OUT1 {<Select>} \
   CONFIG.PCW_FTM_CTI_OUT2 {<Select>} \
   CONFIG.PCW_FTM_CTI_OUT3 {<Select>} \
   CONFIG.PCW_GP0_EN_MODIFIABLE_TXN {0} \
   CONFIG.PCW_GP0_NUM_READ_THREADS {4} \
   CONFIG.PCW_GP0_NUM_WRITE_THREADS {4} \
   CONFIG.PCW_GP1_EN_MODIFIABLE_TXN {0} \
   CONFIG.PCW_GP1_NUM_READ_THREADS {4} \
   CONFIG.PCW_GP1_NUM_WRITE_THREADS {4} \
   CONFIG.PCW_GPIO_BASEADDR {0xE000A000} \
   CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {0} \
   CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {64} \
   CONFIG.PCW_GPIO_HIGHADDR {0xE000AFFF} \
   CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
   CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
   CONFIG.PCW_GPIO_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_I2C0_BASEADDR {0xE0004000} \
   CONFIG.PCW_I2C0_GRP_INT_ENABLE {0} \
   CONFIG.PCW_I2C0_HIGHADDR {0xE0004FFF} \
   CONFIG.PCW_I2C0_I2C0_IO {MIO 10 .. 11} \
   CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_I2C0_RESET_ENABLE {0} \
   CONFIG.PCW_I2C1_BASEADDR {0xE0005000} \
   CONFIG.PCW_I2C1_GRP_INT_ENABLE {0} \
   CONFIG.PCW_I2C1_HIGHADDR {0xE0005FFF} \
   CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_I2C1_RESET_ENABLE {0} \
   CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {111.111115} \
   CONFIG.PCW_I2C_RESET_ENABLE {1} \
   CONFIG.PCW_I2C_RESET_POLARITY {Active Low} \
   CONFIG.PCW_I2C_RESET_SELECT {Share reset pin} \
   CONFIG.PCW_IMPORT_BOARD_PRESET {None} \
   CONFIG.PCW_INCLUDE_ACP_TRANS_CHECK {0} \
   CONFIG.PCW_INCLUDE_TRACE_BUFFER {0} \
   CONFIG.PCW_IOPLL_CTRL_FBDIV {30} \
   CONFIG.PCW_IO_IO_PLL_FREQMHZ {1000.000} \
   CONFIG.PCW_IRQ_F2P_INTR {1} \
   CONFIG.PCW_IRQ_F2P_MODE {DIRECT} \
   CONFIG.PCW_MIO_0_DIRECTION {out} \
   CONFIG.PCW_MIO_0_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_0_PULLUP {disabled} \
   CONFIG.PCW_MIO_0_SLEW {slow} \
   CONFIG.PCW_MIO_10_DIRECTION {inout} \
   CONFIG.PCW_MIO_10_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_10_PULLUP {disabled} \
   CONFIG.PCW_MIO_10_SLEW {slow} \
   CONFIG.PCW_MIO_11_DIRECTION {inout} \
   CONFIG.PCW_MIO_11_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_11_PULLUP {disabled} \
   CONFIG.PCW_MIO_11_SLEW {slow} \
   CONFIG.PCW_MIO_12_DIRECTION {inout} \
   CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_12_PULLUP {disabled} \
   CONFIG.PCW_MIO_12_SLEW {slow} \
   CONFIG.PCW_MIO_13_DIRECTION {inout} \
   CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_13_PULLUP {disabled} \
   CONFIG.PCW_MIO_13_SLEW {slow} \
   CONFIG.PCW_MIO_14_DIRECTION {inout} \
   CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_14_PULLUP {disabled} \
   CONFIG.PCW_MIO_14_SLEW {slow} \
   CONFIG.PCW_MIO_15_DIRECTION {inout} \
   CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_15_PULLUP {disabled} \
   CONFIG.PCW_MIO_15_SLEW {slow} \
   CONFIG.PCW_MIO_16_DIRECTION {out} \
   CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_16_PULLUP {disabled} \
   CONFIG.PCW_MIO_16_SLEW {slow} \
   CONFIG.PCW_MIO_17_DIRECTION {out} \
   CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_17_PULLUP {disabled} \
   CONFIG.PCW_MIO_17_SLEW {slow} \
   CONFIG.PCW_MIO_18_DIRECTION {out} \
   CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_18_PULLUP {disabled} \
   CONFIG.PCW_MIO_18_SLEW {slow} \
   CONFIG.PCW_MIO_19_DIRECTION {out} \
   CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_19_PULLUP {disabled} \
   CONFIG.PCW_MIO_19_SLEW {slow} \
   CONFIG.PCW_MIO_1_DIRECTION {out} \
   CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_1_PULLUP {disabled} \
   CONFIG.PCW_MIO_1_SLEW {slow} \
   CONFIG.PCW_MIO_20_DIRECTION {out} \
   CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_20_PULLUP {disabled} \
   CONFIG.PCW_MIO_20_SLEW {slow} \
   CONFIG.PCW_MIO_21_DIRECTION {out} \
   CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_21_PULLUP {disabled} \
   CONFIG.PCW_MIO_21_SLEW {slow} \
   CONFIG.PCW_MIO_22_DIRECTION {in} \
   CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_22_PULLUP {disabled} \
   CONFIG.PCW_MIO_22_SLEW {slow} \
   CONFIG.PCW_MIO_23_DIRECTION {in} \
   CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_23_PULLUP {disabled} \
   CONFIG.PCW_MIO_23_SLEW {slow} \
   CONFIG.PCW_MIO_24_DIRECTION {in} \
   CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_24_PULLUP {disabled} \
   CONFIG.PCW_MIO_24_SLEW {slow} \
   CONFIG.PCW_MIO_25_DIRECTION {in} \
   CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_25_PULLUP {disabled} \
   CONFIG.PCW_MIO_25_SLEW {slow} \
   CONFIG.PCW_MIO_26_DIRECTION {in} \
   CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_26_PULLUP {disabled} \
   CONFIG.PCW_MIO_26_SLEW {slow} \
   CONFIG.PCW_MIO_27_DIRECTION {in} \
   CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_27_PULLUP {disabled} \
   CONFIG.PCW_MIO_27_SLEW {slow} \
   CONFIG.PCW_MIO_28_DIRECTION {inout} \
   CONFIG.PCW_MIO_28_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_28_PULLUP {disabled} \
   CONFIG.PCW_MIO_28_SLEW {slow} \
   CONFIG.PCW_MIO_29_DIRECTION {in} \
   CONFIG.PCW_MIO_29_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_29_PULLUP {disabled} \
   CONFIG.PCW_MIO_29_SLEW {slow} \
   CONFIG.PCW_MIO_2_DIRECTION {inout} \
   CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_2_PULLUP {disabled} \
   CONFIG.PCW_MIO_2_SLEW {slow} \
   CONFIG.PCW_MIO_30_DIRECTION {out} \
   CONFIG.PCW_MIO_30_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_30_PULLUP {disabled} \
   CONFIG.PCW_MIO_30_SLEW {slow} \
   CONFIG.PCW_MIO_31_DIRECTION {in} \
   CONFIG.PCW_MIO_31_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_31_PULLUP {disabled} \
   CONFIG.PCW_MIO_31_SLEW {slow} \
   CONFIG.PCW_MIO_32_DIRECTION {inout} \
   CONFIG.PCW_MIO_32_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_32_PULLUP {disabled} \
   CONFIG.PCW_MIO_32_SLEW {slow} \
   CONFIG.PCW_MIO_33_DIRECTION {inout} \
   CONFIG.PCW_MIO_33_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_33_PULLUP {disabled} \
   CONFIG.PCW_MIO_33_SLEW {slow} \
   CONFIG.PCW_MIO_34_DIRECTION {inout} \
   CONFIG.PCW_MIO_34_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_34_PULLUP {disabled} \
   CONFIG.PCW_MIO_34_SLEW {slow} \
   CONFIG.PCW_MIO_35_DIRECTION {inout} \
   CONFIG.PCW_MIO_35_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_35_PULLUP {disabled} \
   CONFIG.PCW_MIO_35_SLEW {slow} \
   CONFIG.PCW_MIO_36_DIRECTION {in} \
   CONFIG.PCW_MIO_36_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_36_PULLUP {disabled} \
   CONFIG.PCW_MIO_36_SLEW {slow} \
   CONFIG.PCW_MIO_37_DIRECTION {inout} \
   CONFIG.PCW_MIO_37_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_37_PULLUP {disabled} \
   CONFIG.PCW_MIO_37_SLEW {slow} \
   CONFIG.PCW_MIO_38_DIRECTION {inout} \
   CONFIG.PCW_MIO_38_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_38_PULLUP {disabled} \
   CONFIG.PCW_MIO_38_SLEW {slow} \
   CONFIG.PCW_MIO_39_DIRECTION {inout} \
   CONFIG.PCW_MIO_39_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_39_PULLUP {disabled} \
   CONFIG.PCW_MIO_39_SLEW {slow} \
   CONFIG.PCW_MIO_3_DIRECTION {inout} \
   CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_3_PULLUP {disabled} \
   CONFIG.PCW_MIO_3_SLEW {slow} \
   CONFIG.PCW_MIO_40_DIRECTION {inout} \
   CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_40_PULLUP {disabled} \
   CONFIG.PCW_MIO_40_SLEW {slow} \
   CONFIG.PCW_MIO_41_DIRECTION {inout} \
   CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_41_PULLUP {disabled} \
   CONFIG.PCW_MIO_41_SLEW {slow} \
   CONFIG.PCW_MIO_42_DIRECTION {inout} \
   CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_42_PULLUP {disabled} \
   CONFIG.PCW_MIO_42_SLEW {slow} \
   CONFIG.PCW_MIO_43_DIRECTION {inout} \
   CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_43_PULLUP {disabled} \
   CONFIG.PCW_MIO_43_SLEW {slow} \
   CONFIG.PCW_MIO_44_DIRECTION {inout} \
   CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_44_PULLUP {disabled} \
   CONFIG.PCW_MIO_44_SLEW {slow} \
   CONFIG.PCW_MIO_45_DIRECTION {inout} \
   CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_45_PULLUP {disabled} \
   CONFIG.PCW_MIO_45_SLEW {slow} \
   CONFIG.PCW_MIO_46_DIRECTION {in} \
   CONFIG.PCW_MIO_46_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_46_PULLUP {disabled} \
   CONFIG.PCW_MIO_46_SLEW {slow} \
   CONFIG.PCW_MIO_47_DIRECTION {out} \
   CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_47_PULLUP {disabled} \
   CONFIG.PCW_MIO_47_SLEW {slow} \
   CONFIG.PCW_MIO_48_DIRECTION {out} \
   CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_48_PULLUP {disabled} \
   CONFIG.PCW_MIO_48_SLEW {slow} \
   CONFIG.PCW_MIO_49_DIRECTION {in} \
   CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_49_PULLUP {disabled} \
   CONFIG.PCW_MIO_49_SLEW {slow} \
   CONFIG.PCW_MIO_4_DIRECTION {inout} \
   CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_4_PULLUP {disabled} \
   CONFIG.PCW_MIO_4_SLEW {slow} \
   CONFIG.PCW_MIO_50_DIRECTION {in} \
   CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_50_PULLUP {disabled} \
   CONFIG.PCW_MIO_50_SLEW {slow} \
   CONFIG.PCW_MIO_51_DIRECTION {inout} \
   CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_51_PULLUP {disabled} \
   CONFIG.PCW_MIO_51_SLEW {slow} \
   CONFIG.PCW_MIO_52_DIRECTION {out} \
   CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_52_PULLUP {disabled} \
   CONFIG.PCW_MIO_52_SLEW {slow} \
   CONFIG.PCW_MIO_53_DIRECTION {inout} \
   CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 1.8V} \
   CONFIG.PCW_MIO_53_PULLUP {disabled} \
   CONFIG.PCW_MIO_53_SLEW {slow} \
   CONFIG.PCW_MIO_5_DIRECTION {inout} \
   CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_5_PULLUP {disabled} \
   CONFIG.PCW_MIO_5_SLEW {slow} \
   CONFIG.PCW_MIO_6_DIRECTION {out} \
   CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_6_PULLUP {disabled} \
   CONFIG.PCW_MIO_6_SLEW {slow} \
   CONFIG.PCW_MIO_7_DIRECTION {out} \
   CONFIG.PCW_MIO_7_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_7_PULLUP {disabled} \
   CONFIG.PCW_MIO_7_SLEW {slow} \
   CONFIG.PCW_MIO_8_DIRECTION {out} \
   CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_8_PULLUP {disabled} \
   CONFIG.PCW_MIO_8_SLEW {slow} \
   CONFIG.PCW_MIO_9_DIRECTION {inout} \
   CONFIG.PCW_MIO_9_IOTYPE {LVCMOS 3.3V} \
   CONFIG.PCW_MIO_9_PULLUP {disabled} \
   CONFIG.PCW_MIO_9_SLEW {slow} \
   CONFIG.PCW_MIO_PRIMITIVE {54} \
   CONFIG.PCW_MIO_TREE_PERIPHERALS {ENET Reset#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#USB Reset#Quad SPI Flash#GPIO#I2C 0#I2C 0#GPIO#GPIO#GPIO#GPIO#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#UART 0#UART 0#UART 1#UART 1#SD 0#GPIO#Enet 0#Enet 0} \
   CONFIG.PCW_MIO_TREE_SIGNALS {reset#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]/HOLD_B#qspi0_sclk#reset#qspi_fbclk#gpio[9]#scl#sda#gpio[12]#gpio[13]#gpio[14]#gpio[15]#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#data[4]#dir#stp#nxt#data[0]#data[1]#data[2]#data[3]#clk#data[5]#data[6]#data[7]#clk#cmd#data[0]#data[1]#data[2]#data[3]#rx#tx#tx#rx#wp#gpio[51]#mdc#mdio} \
   CONFIG.PCW_M_AXI_GP0_ENABLE_STATIC_REMAP {0} \
   CONFIG.PCW_M_AXI_GP0_ID_WIDTH {12} \
   CONFIG.PCW_M_AXI_GP0_SUPPORT_NARROW_BURST {0} \
   CONFIG.PCW_M_AXI_GP0_THREAD_ID_WIDTH {12} \
   CONFIG.PCW_M_AXI_GP1_ENABLE_STATIC_REMAP {0} \
   CONFIG.PCW_M_AXI_GP1_ID_WIDTH {12} \
   CONFIG.PCW_M_AXI_GP1_SUPPORT_NARROW_BURST {0} \
   CONFIG.PCW_M_AXI_GP1_THREAD_ID_WIDTH {12} \
   CONFIG.PCW_NAND_CYCLES_T_AR {1} \
   CONFIG.PCW_NAND_CYCLES_T_CLR {1} \
   CONFIG.PCW_NAND_CYCLES_T_RC {2} \
   CONFIG.PCW_NAND_CYCLES_T_REA {1} \
   CONFIG.PCW_NAND_CYCLES_T_RR {1} \
   CONFIG.PCW_NAND_CYCLES_T_WC {2} \
   CONFIG.PCW_NAND_CYCLES_T_WP {1} \
   CONFIG.PCW_NAND_GRP_D8_ENABLE {0} \
   CONFIG.PCW_NAND_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_NOR_CS0_T_CEOE {1} \
   CONFIG.PCW_NOR_CS0_T_PC {1} \
   CONFIG.PCW_NOR_CS0_T_RC {2} \
   CONFIG.PCW_NOR_CS0_T_TR {1} \
   CONFIG.PCW_NOR_CS0_T_WC {2} \
   CONFIG.PCW_NOR_CS0_T_WP {1} \
   CONFIG.PCW_NOR_CS0_WE_TIME {0} \
   CONFIG.PCW_NOR_CS1_T_CEOE {1} \
   CONFIG.PCW_NOR_CS1_T_PC {1} \
   CONFIG.PCW_NOR_CS1_T_RC {2} \
   CONFIG.PCW_NOR_CS1_T_TR {1} \
   CONFIG.PCW_NOR_CS1_T_WC {2} \
   CONFIG.PCW_NOR_CS1_T_WP {1} \
   CONFIG.PCW_NOR_CS1_WE_TIME {0} \
   CONFIG.PCW_NOR_GRP_A25_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS0_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_CS1_ENABLE {0} \
   CONFIG.PCW_NOR_GRP_SRAM_INT_ENABLE {0} \
   CONFIG.PCW_NOR_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_NOR_SRAM_CS0_T_CEOE {1} \
   CONFIG.PCW_NOR_SRAM_CS0_T_PC {1} \
   CONFIG.PCW_NOR_SRAM_CS0_T_RC {2} \
   CONFIG.PCW_NOR_SRAM_CS0_T_TR {1} \
   CONFIG.PCW_NOR_SRAM_CS0_T_WC {2} \
   CONFIG.PCW_NOR_SRAM_CS0_T_WP {1} \
   CONFIG.PCW_NOR_SRAM_CS0_WE_TIME {0} \
   CONFIG.PCW_NOR_SRAM_CS1_T_CEOE {1} \
   CONFIG.PCW_NOR_SRAM_CS1_T_PC {1} \
   CONFIG.PCW_NOR_SRAM_CS1_T_RC {2} \
   CONFIG.PCW_NOR_SRAM_CS1_T_TR {1} \
   CONFIG.PCW_NOR_SRAM_CS1_T_WC {2} \
   CONFIG.PCW_NOR_SRAM_CS1_T_WP {1} \
   CONFIG.PCW_NOR_SRAM_CS1_WE_TIME {0} \
   CONFIG.PCW_OVERRIDE_BASIC_CLOCK {0} \
   CONFIG.PCW_P2F_CAN0_INTR {0} \
   CONFIG.PCW_P2F_CAN1_INTR {0} \
   CONFIG.PCW_P2F_CTI_INTR {0} \
   CONFIG.PCW_P2F_DMAC0_INTR {0} \
   CONFIG.PCW_P2F_DMAC1_INTR {0} \
   CONFIG.PCW_P2F_DMAC2_INTR {0} \
   CONFIG.PCW_P2F_DMAC3_INTR {0} \
   CONFIG.PCW_P2F_DMAC4_INTR {0} \
   CONFIG.PCW_P2F_DMAC5_INTR {0} \
   CONFIG.PCW_P2F_DMAC6_INTR {0} \
   CONFIG.PCW_P2F_DMAC7_INTR {0} \
   CONFIG.PCW_P2F_DMAC_ABORT_INTR {0} \
   CONFIG.PCW_P2F_ENET0_INTR {0} \
   CONFIG.PCW_P2F_ENET1_INTR {0} \
   CONFIG.PCW_P2F_GPIO_INTR {0} \
   CONFIG.PCW_P2F_I2C0_INTR {0} \
   CONFIG.PCW_P2F_I2C1_INTR {0} \
   CONFIG.PCW_P2F_QSPI_INTR {0} \
   CONFIG.PCW_P2F_SDIO0_INTR {0} \
   CONFIG.PCW_P2F_SDIO1_INTR {0} \
   CONFIG.PCW_P2F_SMC_INTR {0} \
   CONFIG.PCW_P2F_SPI0_INTR {0} \
   CONFIG.PCW_P2F_SPI1_INTR {0} \
   CONFIG.PCW_P2F_UART0_INTR {0} \
   CONFIG.PCW_P2F_UART1_INTR {0} \
   CONFIG.PCW_P2F_USB0_INTR {0} \
   CONFIG.PCW_P2F_USB1_INTR {0} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY0 {0.344} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY1 {0.350} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY2 {0.394} \
   CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY3 {0.407} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_0 {-0.073} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_1 {-0.078} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_2 {0.020} \
   CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_3 {-0.022} \
   CONFIG.PCW_PACKAGE_NAME {fbg676} \
   CONFIG.PCW_PCAP_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_PCAP_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_PERIPHERAL_BOARD_PRESET {None} \
   CONFIG.PCW_PJTAG_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_PLL_BYPASSMODE_ENABLE {0} \
   CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 3.3V} \
   CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
   CONFIG.PCW_PS7_SI_REV {PRODUCTION} \
   CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1} \
   CONFIG.PCW_QSPI_GRP_FBCLK_IO {MIO 8} \
   CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
   CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
   CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_QSPI_INTERNAL_HIGHADDRESS {0xFCFFFFFF} \
   CONFIG.PCW_QSPI_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {5} \
   CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
   CONFIG.PCW_SD0_GRP_CD_ENABLE {0} \
   CONFIG.PCW_SD0_GRP_POW_ENABLE {0} \
   CONFIG.PCW_SD0_GRP_WP_ENABLE {1} \
   CONFIG.PCW_SD0_GRP_WP_IO {MIO 50} \
   CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
   CONFIG.PCW_SD1_GRP_CD_ENABLE {0} \
   CONFIG.PCW_SD1_GRP_POW_ENABLE {0} \
   CONFIG.PCW_SD1_GRP_WP_ENABLE {0} \
   CONFIG.PCW_SD1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_SDIO0_BASEADDR {0xE0100000} \
   CONFIG.PCW_SDIO0_HIGHADDR {0xE0100FFF} \
   CONFIG.PCW_SDIO1_BASEADDR {0xE0101000} \
   CONFIG.PCW_SDIO1_HIGHADDR {0xE0101FFF} \
   CONFIG.PCW_SDIO_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {20} \
   CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
   CONFIG.PCW_SINGLE_QSPI_DATA_MODE {x4} \
   CONFIG.PCW_SMC_CYCLE_T0 {NA} \
   CONFIG.PCW_SMC_CYCLE_T1 {NA} \
   CONFIG.PCW_SMC_CYCLE_T2 {NA} \
   CONFIG.PCW_SMC_CYCLE_T3 {NA} \
   CONFIG.PCW_SMC_CYCLE_T4 {NA} \
   CONFIG.PCW_SMC_CYCLE_T5 {NA} \
   CONFIG.PCW_SMC_CYCLE_T6 {NA} \
   CONFIG.PCW_SMC_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SMC_PERIPHERAL_FREQMHZ {100} \
   CONFIG.PCW_SMC_PERIPHERAL_VALID {0} \
   CONFIG.PCW_SPI0_BASEADDR {0xE0006000} \
   CONFIG.PCW_SPI0_GRP_SS0_ENABLE {0} \
   CONFIG.PCW_SPI0_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_SPI0_GRP_SS2_ENABLE {0} \
   CONFIG.PCW_SPI0_HIGHADDR {0xE0006FFF} \
   CONFIG.PCW_SPI0_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_SPI1_BASEADDR {0xE0007000} \
   CONFIG.PCW_SPI1_GRP_SS0_ENABLE {0} \
   CONFIG.PCW_SPI1_GRP_SS1_ENABLE {0} \
   CONFIG.PCW_SPI1_GRP_SS2_ENABLE {0} \
   CONFIG.PCW_SPI1_HIGHADDR {0xE0007FFF} \
   CONFIG.PCW_SPI1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_SPI_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_SPI_PERIPHERAL_FREQMHZ {166.666666} \
   CONFIG.PCW_SPI_PERIPHERAL_VALID {0} \
   CONFIG.PCW_S_AXI_ACP_ARUSER_VAL {31} \
   CONFIG.PCW_S_AXI_ACP_AWUSER_VAL {31} \
   CONFIG.PCW_S_AXI_ACP_ID_WIDTH {3} \
   CONFIG.PCW_S_AXI_GP0_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_GP1_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP0_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP1_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP1_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP2_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP2_ID_WIDTH {6} \
   CONFIG.PCW_S_AXI_HP3_DATA_WIDTH {64} \
   CONFIG.PCW_S_AXI_HP3_ID_WIDTH {6} \
   CONFIG.PCW_TPIU_PERIPHERAL_CLKSRC {External} \
   CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TPIU_PERIPHERAL_FREQMHZ {200} \
   CONFIG.PCW_TRACE_BUFFER_CLOCK_DELAY {12} \
   CONFIG.PCW_TRACE_BUFFER_FIFO_SIZE {128} \
   CONFIG.PCW_TRACE_GRP_16BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_2BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_32BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_4BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_GRP_8BIT_ENABLE {0} \
   CONFIG.PCW_TRACE_INTERNAL_WIDTH {2} \
   CONFIG.PCW_TRACE_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_TRACE_PIPELINE_WIDTH {8} \
   CONFIG.PCW_TTC0_BASEADDR {0xE0104000} \
   CONFIG.PCW_TTC0_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC0_CLK0_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC0_CLK0_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC0_CLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC0_CLK1_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC0_CLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC0_CLK2_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC0_HIGHADDR {0xE0104fff} \
   CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_TTC0_TTC0_IO {EMIO} \
   CONFIG.PCW_TTC1_BASEADDR {0xE0105000} \
   CONFIG.PCW_TTC1_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC1_CLK0_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC1_CLK0_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC1_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC1_CLK1_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC1_CLK1_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC1_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_TTC1_CLK2_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_TTC1_CLK2_PERIPHERAL_FREQMHZ {133.333333} \
   CONFIG.PCW_TTC1_HIGHADDR {0xE0105fff} \
   CONFIG.PCW_TTC1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_TTC_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_UART0_BASEADDR {0xE0000000} \
   CONFIG.PCW_UART0_BAUD_RATE {115200} \
   CONFIG.PCW_UART0_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART0_HIGHADDR {0xE0000FFF} \
   CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_UART0_UART0_IO {MIO 46 .. 47} \
   CONFIG.PCW_UART1_BASEADDR {0xE0001000} \
   CONFIG.PCW_UART1_BAUD_RATE {115200} \
   CONFIG.PCW_UART1_GRP_FULL_ENABLE {0} \
   CONFIG.PCW_UART1_HIGHADDR {0xE0001FFF} \
   CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
   CONFIG.PCW_UART_PERIPHERAL_CLKSRC {IO PLL} \
   CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {20} \
   CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {50} \
   CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
   CONFIG.PCW_UIPARAM_ACT_DDR_FREQ_MHZ {533.333374} \
   CONFIG.PCW_UIPARAM_DDR_ADV_ENABLE {0} \
   CONFIG.PCW_UIPARAM_DDR_AL {0} \
   CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3} \
   CONFIG.PCW_UIPARAM_DDR_BL {8} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.294} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.298} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.338} \
   CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.334} \
   CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {32 Bit} \
   CONFIG.PCW_UIPARAM_DDR_CL {7} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_0_LENGTH_MM {39.7} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PACKAGE_LENGTH {61.0905} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_1_LENGTH_MM {39.7} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PACKAGE_LENGTH {61.0905} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_2_LENGTH_MM {54.14} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PACKAGE_LENGTH {61.0905} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_3_LENGTH_MM {54.14} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PACKAGE_LENGTH {61.0905} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_CLOCK_STOP_EN {0} \
   CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10} \
   CONFIG.PCW_UIPARAM_DDR_CWL {6} \
   CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {4096 MBits} \
   CONFIG.PCW_UIPARAM_DDR_DQS_0_LENGTH_MM {50.05} \
   CONFIG.PCW_UIPARAM_DDR_DQS_0_PACKAGE_LENGTH {68.4725} \
   CONFIG.PCW_UIPARAM_DDR_DQS_0_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_1_LENGTH_MM {50.43} \
   CONFIG.PCW_UIPARAM_DDR_DQS_1_PACKAGE_LENGTH {71.086} \
   CONFIG.PCW_UIPARAM_DDR_DQS_1_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_2_LENGTH_MM {50.10} \
   CONFIG.PCW_UIPARAM_DDR_DQS_2_PACKAGE_LENGTH {66.794} \
   CONFIG.PCW_UIPARAM_DDR_DQS_2_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_3_LENGTH_MM {50.01} \
   CONFIG.PCW_UIPARAM_DDR_DQS_3_PACKAGE_LENGTH {108.7385} \
   CONFIG.PCW_UIPARAM_DDR_DQS_3_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {-0.073} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {-0.072} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {0.024} \
   CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {0.023} \
   CONFIG.PCW_UIPARAM_DDR_DQ_0_LENGTH_MM {49.59} \
   CONFIG.PCW_UIPARAM_DDR_DQ_0_PACKAGE_LENGTH {64.1705} \
   CONFIG.PCW_UIPARAM_DDR_DQ_0_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQ_1_LENGTH_MM {51.74} \
   CONFIG.PCW_UIPARAM_DDR_DQ_1_PACKAGE_LENGTH {63.686} \
   CONFIG.PCW_UIPARAM_DDR_DQ_1_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQ_2_LENGTH_MM {50.32} \
   CONFIG.PCW_UIPARAM_DDR_DQ_2_PACKAGE_LENGTH {68.46} \
   CONFIG.PCW_UIPARAM_DDR_DQ_2_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DQ_3_LENGTH_MM {48.55} \
   CONFIG.PCW_UIPARAM_DDR_DQ_3_PACKAGE_LENGTH {105.4895} \
   CONFIG.PCW_UIPARAM_DDR_DQ_3_PROPOGATION_DELAY {160} \
   CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
   CONFIG.PCW_UIPARAM_DDR_ECC {Disabled} \
   CONFIG.PCW_UIPARAM_DDR_ENABLE {1} \
   CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {533.333333} \
   CONFIG.PCW_UIPARAM_DDR_HIGH_TEMP {Normal (0-85)} \
   CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3} \
   CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-125} \
   CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {15} \
   CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F} \
   CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1} \
   CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {1} \
   CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1} \
   CONFIG.PCW_UIPARAM_DDR_T_FAW {40.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {35.0} \
   CONFIG.PCW_UIPARAM_DDR_T_RC {48.75} \
   CONFIG.PCW_UIPARAM_DDR_T_RCD {7} \
   CONFIG.PCW_UIPARAM_DDR_T_RP {7} \
   CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {1} \
   CONFIG.PCW_UIPARAM_GENERATE_SUMMARY {NA} \
   CONFIG.PCW_USB0_BASEADDR {0xE0102000} \
   CONFIG.PCW_USB0_HIGHADDR {0xE0102fff} \
   CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
   CONFIG.PCW_USB0_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_USB0_RESET_ENABLE {1} \
   CONFIG.PCW_USB0_RESET_IO {MIO 7} \
   CONFIG.PCW_USB0_USB0_IO {MIO 28 .. 39} \
   CONFIG.PCW_USB1_BASEADDR {0xE0103000} \
   CONFIG.PCW_USB1_HIGHADDR {0xE0103fff} \
   CONFIG.PCW_USB1_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_USB1_PERIPHERAL_FREQMHZ {60} \
   CONFIG.PCW_USB1_RESET_ENABLE {0} \
   CONFIG.PCW_USB_RESET_ENABLE {1} \
   CONFIG.PCW_USB_RESET_POLARITY {Active Low} \
   CONFIG.PCW_USB_RESET_SELECT {Share reset pin} \
   CONFIG.PCW_USE_AXI_FABRIC_IDLE {0} \
   CONFIG.PCW_USE_AXI_NONSECURE {0} \
   CONFIG.PCW_USE_CORESIGHT {0} \
   CONFIG.PCW_USE_CROSS_TRIGGER {0} \
   CONFIG.PCW_USE_CR_FABRIC {1} \
   CONFIG.PCW_USE_DDR_BYPASS {0} \
   CONFIG.PCW_USE_DEBUG {0} \
   CONFIG.PCW_USE_DEFAULT_ACP_USER_VAL {0} \
   CONFIG.PCW_USE_DMA0 {0} \
   CONFIG.PCW_USE_DMA1 {0} \
   CONFIG.PCW_USE_DMA2 {0} \
   CONFIG.PCW_USE_DMA3 {0} \
   CONFIG.PCW_USE_EXPANDED_IOP {0} \
   CONFIG.PCW_USE_EXPANDED_PS_SLCR_REGISTERS {0} \
   CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
   CONFIG.PCW_USE_HIGH_OCM {0} \
   CONFIG.PCW_USE_M_AXI_GP0 {1} \
   CONFIG.PCW_USE_M_AXI_GP1 {0} \
   CONFIG.PCW_USE_PROC_EVENT_BUS {0} \
   CONFIG.PCW_USE_PS_SLCR_REGISTERS {0} \
   CONFIG.PCW_USE_S_AXI_ACP {0} \
   CONFIG.PCW_USE_S_AXI_GP0 {0} \
   CONFIG.PCW_USE_S_AXI_GP1 {0} \
   CONFIG.PCW_USE_S_AXI_HP0 {1} \
   CONFIG.PCW_USE_S_AXI_HP1 {0} \
   CONFIG.PCW_USE_S_AXI_HP2 {0} \
   CONFIG.PCW_USE_S_AXI_HP3 {0} \
   CONFIG.PCW_USE_TRACE {0} \
   CONFIG.PCW_USE_TRACE_DATA_EDGE_DETECTOR {0} \
   CONFIG.PCW_VALUE_SILVERSION {3} \
   CONFIG.PCW_WDT_PERIPHERAL_CLKSRC {CPU_1X} \
   CONFIG.PCW_WDT_PERIPHERAL_DIVISOR0 {1} \
   CONFIG.PCW_WDT_PERIPHERAL_ENABLE {0} \
   CONFIG.PCW_WDT_PERIPHERAL_FREQMHZ {133.333333} \
 ] $processing_system7_0

  # Create instance: ps7_0_axi_periph, and set properties
  set ps7_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 ps7_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {8} \
 ] $ps7_0_axi_periph

  # Create instance: rst_ps7_0_125M, and set properties
  set rst_ps7_0_125M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_125M ]

  # Create instance: rst_ps7_0_125M1, and set properties
  set rst_ps7_0_125M1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps7_0_125M1 ]

  # Create instance: tft_display_0, and set properties
  set tft_display_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:tft_display:2.0 tft_display_0 ]

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_1

  # Create interface connections
  connect_bd_intf_net -intf_net FS_0_1 [get_bd_intf_ports FS_0] [get_bd_intf_pins FS_0_AXIFIFO/S_AXIS]
  connect_bd_intf_net -intf_net GT_REFCLK_0_1 [get_bd_intf_ports GT_REFCLK_0] [get_bd_intf_pins OPTOLINK_0/GT_DIFF_REFCLK1]
  connect_bd_intf_net -intf_net GT_SERIAL_RX_0_2 [get_bd_intf_ports GT_RX_3] [get_bd_intf_pins OPTOLINK_1/GT_SERIAL_RX]
  connect_bd_intf_net -intf_net GT_SERIAL_RX_1_2 [get_bd_intf_ports GT_RX_2] [get_bd_intf_pins OPTOLINK_0/GT_SERIAL_RX]
  connect_bd_intf_net -intf_net HLINK_0_GT_SERIAL_TX [get_bd_intf_ports GT_TX_2] [get_bd_intf_pins OPTOLINK_0/GT_SERIAL_TX]
  connect_bd_intf_net -intf_net HLINK_0_USER_DATA_M_AXIS_RX [get_bd_intf_pins OPTOLINK_0/USER_DATA_M_AXIS_RX] [get_bd_intf_pins axis_data_fifo_1/S_AXIS]
  connect_bd_intf_net -intf_net HLINK_1_GT_SERIAL_TX [get_bd_intf_ports GT_TX_3] [get_bd_intf_pins OPTOLINK_1/GT_SERIAL_TX]
  connect_bd_intf_net -intf_net HLINK_1_USER_DATA_M_AXIS_RX [get_bd_intf_pins OPTOLINK_1/USER_DATA_M_AXIS_RX] [get_bd_intf_pins axis_data_fifo_3/S_AXIS]
  connect_bd_intf_net -intf_net S_AXIS_0_1 [get_bd_intf_ports LINK0_FIFO_IN] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]
  connect_bd_intf_net -intf_net S_AXIS_0_2 [get_bd_intf_ports LINK1_FIFO_IN] [get_bd_intf_pins axis_data_fifo_2/S_AXIS]
  connect_bd_intf_net -intf_net axi_amm_bridge_0_M_AVALON [get_bd_intf_ports M_AVALON_0] [get_bd_intf_pins axi_amm_bridge_0/M_AVALON]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_ports IIC_0] [get_bd_intf_pins axi_iic_0/IIC]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axis_data_fifo_0_M_AXIS [get_bd_intf_pins OPTOLINK_0/USER_DATA_S_AXIS_TX] [get_bd_intf_pins axis_data_fifo_0/M_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_1_M_AXIS [get_bd_intf_ports LINK0_FIFO_OUT] [get_bd_intf_pins axis_data_fifo_1/M_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_2_M_AXIS [get_bd_intf_pins OPTOLINK_1/USER_DATA_S_AXIS_TX] [get_bd_intf_pins axis_data_fifo_2/M_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_3_M_AXIS [get_bd_intf_ports LINK1_FIFO_OUT] [get_bd_intf_pins axis_data_fifo_3/M_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_4_M_AXIS [get_bd_intf_pins FS_0_AXIFIFO/M_AXIS] [get_bd_intf_pins data_mover_0/stream0_V_V]
  connect_bd_intf_net -intf_net data_mover_0_m_axi_a_V [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins data_mover_0/m_axi_a_V]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR_0] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO_0] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins processing_system7_0/M_AXI_GP0] [get_bd_intf_pins ps7_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M00_AXI [get_bd_intf_pins ADCSyncModule_0/S00_AXI] [get_bd_intf_pins ps7_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M01_AXI [get_bd_intf_pins axi_amm_bridge_0/S_AXI_LITE] [get_bd_intf_pins ps7_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M02_AXI [get_bd_intf_pins FirmwareStatus_0/S00_AXI] [get_bd_intf_pins ps7_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M03_AXI [get_bd_intf_pins data_mover_0/s_axi_axil] [get_bd_intf_pins ps7_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M04_AXI [get_bd_intf_pins IICBaseInterconnection_0/S00_AXI] [get_bd_intf_pins ps7_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M05_AXI [get_bd_intf_pins axi_iic_0/S_AXI] [get_bd_intf_pins ps7_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M06_AXI [get_bd_intf_pins NIDNAPort_0/S00_AXI] [get_bd_intf_pins ps7_0_axi_periph/M06_AXI]
  connect_bd_intf_net -intf_net ps7_0_axi_periph_M07_AXI [get_bd_intf_pins ps7_0_axi_periph/M07_AXI] [get_bd_intf_pins tft_display_0/S00_AXI]

  # Create port connections
  connect_bd_net -net ADCSyncModule_0_SMADC_1_CSA [get_bd_ports SMADC_1_CSA_0] [get_bd_pins ADCSyncModule_0/SMADC_1_CSA]
  connect_bd_net -net ADCSyncModule_0_SMADC_1_CSB [get_bd_ports SMADC_1_CSB_0] [get_bd_pins ADCSyncModule_0/SMADC_1_CSB]
  connect_bd_net -net ADCSyncModule_0_SMADC_2_CSA [get_bd_ports SMADC_2_CSA_0] [get_bd_pins ADCSyncModule_0/SMADC_2_CSA]
  connect_bd_net -net ADCSyncModule_0_SMADC_2_CSB [get_bd_ports SMADC_2_CSB_0] [get_bd_pins ADCSyncModule_0/SMADC_2_CSB]
  connect_bd_net -net ADCSyncModule_0_SMADC_3_CSA [get_bd_ports SMADC_3_CSA_0] [get_bd_pins ADCSyncModule_0/SMADC_3_CSA]
  connect_bd_net -net ADCSyncModule_0_SMADC_3_CSB [get_bd_ports SMADC_3_CSB_0] [get_bd_pins ADCSyncModule_0/SMADC_3_CSB]
  connect_bd_net -net ADCSyncModule_0_SMADC_4_CSA [get_bd_ports SMADC_4_CSA_0] [get_bd_pins ADCSyncModule_0/SMADC_4_CSA]
  connect_bd_net -net ADCSyncModule_0_SMADC_4_CSB [get_bd_ports SMADC_4_CSB_0] [get_bd_pins ADCSyncModule_0/SMADC_4_CSB]
  connect_bd_net -net ADCSyncModule_0_SMADC_CLK [get_bd_ports SMADC_CLK_0] [get_bd_pins ADCSyncModule_0/SMADC_CLK]
  connect_bd_net -net ADCSyncModule_0_SMADC_MOSI [get_bd_ports SMADC_MOSI_0] [get_bd_pins ADCSyncModule_0/SMADC_MOSI]
  connect_bd_net -net ADCSyncModule_0_cfg_abselector [get_bd_ports cfg_abselector_0] [get_bd_pins ADCSyncModule_0/cfg_abselector]
  connect_bd_net -net ADCSyncModule_0_cfg_channel_selector [get_bd_ports cfg_channel_selector_0] [get_bd_pins ADCSyncModule_0/cfg_channel_selector]
  connect_bd_net -net ADCSyncModule_0_cfg_pulse_bitsleep [get_bd_ports cfg_pulse_bitsleep_0] [get_bd_pins ADCSyncModule_0/cfg_pulse_bitsleep]
  connect_bd_net -net ADCSyncModule_0_cfg_serdes1_delay [get_bd_ports cfg_serdes1_delay_0] [get_bd_pins ADCSyncModule_0/cfg_serdes1_delay]
  connect_bd_net -net ADCSyncModule_0_cfg_serdes1_delay_exc [get_bd_ports cfg_serdes1_delay_exc_0] [get_bd_pins ADCSyncModule_0/cfg_serdes1_delay_exc]
  connect_bd_net -net ADCSyncModule_0_serdes_reset [get_bd_ports serdes_reset_0] [get_bd_pins ADCSyncModule_0/serdes_reset]
  connect_bd_net -net BOARDPOSITION_1 [get_bd_ports BOARDPOSITION] [get_bd_pins IICBaseInterconnection_0/IIC_ADDR]
  connect_bd_net -net CLOCK_PL_1 [get_bd_ports CLOCK_PL] [get_bd_pins ADCSyncModule_0/s00_axi_aclk] [get_bd_pins axi_amm_bridge_0/s_axi_aclk] [get_bd_pins axis_data_fifo_0/s_axis_aclk] [get_bd_pins axis_data_fifo_1/m_axis_aclk] [get_bd_pins axis_data_fifo_2/s_axis_aclk] [get_bd_pins axis_data_fifo_3/m_axis_aclk] [get_bd_pins ps7_0_axi_periph/M00_ACLK] [get_bd_pins ps7_0_axi_periph/M01_ACLK] [get_bd_pins rst_ps7_0_125M1/slowest_sync_clk]
  connect_bd_net -net CLOCK_SOURCE_1 [get_bd_ports CLOCK_SOURCE] [get_bd_pins IICBaseInterconnection_0/CLOCK_SOURCE]
  connect_bd_net -net FIRMWAREBUILD1_dout [get_bd_pins FIRMWAREOPTIONS/dout] [get_bd_pins FirmwareStatus_0/FRAMEWORK_OPTION]
  connect_bd_net -net FW_RELEASE_DATE_0_1 [get_bd_ports FW_RELEASE_DATE_0] [get_bd_pins FirmwareStatus_0/FRAMEWORK_BUILD] [get_bd_pins IICBaseInterconnection_0/FW_RELEASE_DATE]
  connect_bd_net -net FW_STRING_0_1 [get_bd_ports FW_STRING_0] [get_bd_pins IICBaseInterconnection_0/FW_STRING]
  connect_bd_net -net FW_VER_0_1 [get_bd_ports FW_VER_0] [get_bd_pins FirmwareStatus_0/FRAMEWORK_VERSION] [get_bd_pins IICBaseInterconnection_0/FW_VER]
  connect_bd_net -net HLINK_0_gt_qpllclk_quad1_out [get_bd_pins OPTOLINK_0/gt_qpllclk_quad1_out] [get_bd_pins OPTOLINK_1/gt_qpllclk_quad1_in]
  connect_bd_net -net HLINK_0_gt_qpllrefclk_quad1_out [get_bd_pins OPTOLINK_0/gt_qpllrefclk_quad1_out] [get_bd_pins OPTOLINK_1/gt_qpllrefclk_quad1_in]
  connect_bd_net -net HLINK_0_gt_refclk1_out [get_bd_ports LINK0_RXCLK] [get_bd_pins OPTOLINK_0/gt_refclk1_out] [get_bd_pins OPTOLINK_1/refclk1_in]
  connect_bd_net -net HLINK_0_mmcm_not_locked_out [get_bd_pins OPTOLINK_0/mmcm_not_locked_out] [get_bd_pins OPTOLINK_1/mmcm_not_locked]
  connect_bd_net -net HLINK_0_rx_sys_reset_out [get_bd_pins OPTOLINK_0/rx_sys_reset_out] [get_bd_pins RESET_RX/Op1]
  connect_bd_net -net HLINK_0_sync_clk_out [get_bd_pins OPTOLINK_0/sync_clk_out] [get_bd_pins OPTOLINK_1/sync_clk]
  connect_bd_net -net HLINK_0_tx_sys_reset_out [get_bd_pins OPTOLINK_0/tx_sys_reset_out] [get_bd_pins RESET_TX/Op1]
  connect_bd_net -net HLINK_0_user_clk_out [get_bd_pins OPTOLINK_0/user_clk_out] [get_bd_pins OPTOLINK_1/user_clk] [get_bd_pins axis_data_fifo_0/m_axis_aclk] [get_bd_pins axis_data_fifo_1/s_axis_aclk] [get_bd_pins axis_data_fifo_2/m_axis_aclk] [get_bd_pins axis_data_fifo_3/s_axis_aclk]
  connect_bd_net -net IICBaseInterconnection_0_CLOCK_COMMUTATOR [get_bd_ports clock_source_commutator] [get_bd_pins IICBaseInterconnection_0/CLOCK_COMMUTATOR]
  connect_bd_net -net IICBaseInterconnection_0_CLOCK_RESET [get_bd_ports CLOCK_RESET] [get_bd_pins IICBaseInterconnection_0/CLOCK_RESET]
  connect_bd_net -net INVALID_EXT_CLK_1 [get_bd_ports INVALID_EXT_CLK] [get_bd_pins IICBaseInterconnection_0/INVALID_EXT_CLK]
  connect_bd_net -net RESET_RX_Res [get_bd_pins RESET_RX/Res] [get_bd_pins axis_data_fifo_1/s_axis_aresetn] [get_bd_pins axis_data_fifo_3/s_axis_aresetn]
  connect_bd_net -net RESET_TX_Res [get_bd_pins RESET_TX/Res] [get_bd_pins axis_data_fifo_0/m_axis_aresetn] [get_bd_pins axis_data_fifo_2/m_axis_aresetn]
  connect_bd_net -net axi_iic_0_iic2intc_irpt [get_bd_pins axi_iic_0/iic2intc_irpt] [get_bd_pins processing_system7_0/IRQ_F2P]
  connect_bd_net -net cfg_selected_prw_0_1 [get_bd_ports cfg_selected_prw_0] [get_bd_pins ADCSyncModule_0/cfg_selected_prw]
  connect_bd_net -net data_mover_0_fifo_resetn [get_bd_pins FS_0_AXIFIFO/m_axis_aresetn] [get_bd_pins data_mover_0/fifo_resetn]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_ports MAIN_CLOCK] [get_bd_pins FS_0_AXIFIFO/m_axis_aclk] [get_bd_pins FS_0_AXIFIFO/s_axis_aclk] [get_bd_pins FirmwareStatus_0/s00_axi_aclk] [get_bd_pins IICBaseInterconnection_0/s00_axi_aclk] [get_bd_pins NIDNAPort_0/s00_axi_aclk] [get_bd_pins OPTOLINK_0/drp_clk_in] [get_bd_pins OPTOLINK_0/init_clk] [get_bd_pins OPTOLINK_1/drp_clk_in] [get_bd_pins OPTOLINK_1/init_clk] [get_bd_pins axi_iic_0/s_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins data_mover_0/ap_clk] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins ps7_0_axi_periph/ACLK] [get_bd_pins ps7_0_axi_periph/M02_ACLK] [get_bd_pins ps7_0_axi_periph/M03_ACLK] [get_bd_pins ps7_0_axi_periph/M04_ACLK] [get_bd_pins ps7_0_axi_periph/M05_ACLK] [get_bd_pins ps7_0_axi_periph/M06_ACLK] [get_bd_pins ps7_0_axi_periph/M07_ACLK] [get_bd_pins ps7_0_axi_periph/S00_ACLK] [get_bd_pins rst_ps7_0_125M/slowest_sync_clk] [get_bd_pins tft_display_0/s00_axi_aclk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_ps7_0_125M/ext_reset_in] [get_bd_pins rst_ps7_0_125M1/ext_reset_in]
  connect_bd_net -net rst_ps7_0_125M1_peripheral_aresetn [get_bd_pins ADCSyncModule_0/s00_axi_aresetn] [get_bd_pins axi_amm_bridge_0/s_axi_aresetn] [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins axis_data_fifo_1/m_axis_aresetn] [get_bd_pins axis_data_fifo_2/s_axis_aresetn] [get_bd_pins axis_data_fifo_3/m_axis_aresetn] [get_bd_pins ps7_0_axi_periph/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/M01_ARESETN] [get_bd_pins rst_ps7_0_125M1/peripheral_aresetn]
  connect_bd_net -net rst_ps7_0_125M_interconnect_aresetn [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins ps7_0_axi_periph/ARESETN] [get_bd_pins rst_ps7_0_125M/interconnect_aresetn]
  connect_bd_net -net rst_ps7_0_125M_peripheral_aresetn [get_bd_pins FS_0_AXIFIFO/s_axis_aresetn] [get_bd_pins FirmwareStatus_0/s00_axi_aresetn] [get_bd_pins IICBaseInterconnection_0/s00_axi_aresetn] [get_bd_pins NIDNAPort_0/s00_axi_aresetn] [get_bd_pins axi_iic_0/s_axi_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins data_mover_0/ap_rst_n] [get_bd_pins ps7_0_axi_periph/M02_ARESETN] [get_bd_pins ps7_0_axi_periph/M03_ARESETN] [get_bd_pins ps7_0_axi_periph/M04_ARESETN] [get_bd_pins ps7_0_axi_periph/M05_ARESETN] [get_bd_pins ps7_0_axi_periph/M06_ARESETN] [get_bd_pins ps7_0_axi_periph/M07_ARESETN] [get_bd_pins ps7_0_axi_periph/S00_ARESETN] [get_bd_pins rst_ps7_0_125M/peripheral_aresetn] [get_bd_pins tft_display_0/s00_axi_aresetn] [get_bd_pins util_vector_logic_0/Op1] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net tft_display_0_SPI_CLK [get_bd_ports SPI_CLK_0] [get_bd_pins tft_display_0/SPI_CLK]
  connect_bd_net -net tft_display_0_SPI_CS [get_bd_ports SPI_CS_0] [get_bd_pins tft_display_0/SPI_CS]
  connect_bd_net -net tft_display_0_SPI_MOSI_0 [get_bd_ports SPI_MOSI_0_0] [get_bd_pins tft_display_0/SPI_MOSI_0]
  connect_bd_net -net tft_display_0_SPI_MOSI_1 [get_bd_ports SPI_MOSI_1_0] [get_bd_pins tft_display_0/SPI_MOSI_1]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins OPTOLINK_0/rx_reset_pb] [get_bd_pins OPTOLINK_0/tx_reset_pb] [get_bd_pins OPTOLINK_1/rx_reset_pb] [get_bd_pins OPTOLINK_1/tx_reset_pb] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_ports MAIN_RESET] [get_bd_pins util_vector_logic_1/Res]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces data_mover_0/Data_m_axi_a_V] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x00010000 -offset 0x4FFF0000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs ADCSyncModule_0/S00_AXI/S00_AXI_reg] SEG_ADCSyncModule_0_S00_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs FirmwareStatus_0/S00_AXI/S00_AXI_reg] SEG_FirmwareStatus_0_S00_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C20000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs IICBaseInterconnection_0/S00_AXI/S00_AXI_reg] SEG_IICBaseInterconnection_0_S00_AXI_reg
  create_bd_addr_seg -range 0x10000000 -offset 0x50000000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs M_AVALON_0/Reg] SEG_M_AVALON_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C30000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs NIDNAPort_0/S00_AXI/S00_AXI_reg] SEG_NIDNAPort_0_S00_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41600000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_iic_0/S_AXI/Reg] SEG_axi_iic_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs data_mover_0/s_axi_axil/Reg] SEG_data_mover_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C40000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs tft_display_0/S00_AXI/S00_AXI_reg] SEG_tft_display_0_S00_AXI_reg

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   ExpandedHierarchyInLayout: "",
   guistr: "# # String gsaved with Nlview 6.6.11  2017-06-12 bk=1.3860 VDI=40 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port CLOCK_PL -pg 1 -y 2830 -defaultsOSRD
preplace port cfg_abselector_0 -pg 1 -y 920 -defaultsOSRD
preplace port LINK0_FIFO_IN -pg 1 -y -650 -defaultsOSRD
preplace port GT_RX_3 -pg 1 -y -980 -defaultsOSRD
preplace port FS_0 -pg 1 -y 1830 -defaultsOSRD
preplace port SMADC_3_CSA_0 -pg 1 -y 1060 -defaultsOSRD
preplace port MAIN_CLOCK -pg 1 -y 1400 -defaultsOSRD
preplace port GT_REFCLK_0 -pg 1 -y -460 -defaultsOSRD
preplace port GT_TX_2 -pg 1 -y -500 -defaultsOSRD
preplace port LINK0_RXCLK -pg 1 -y -220 -defaultsOSRD
preplace port cfg_serdes1_delay_exc_0 -pg 1 -y 880 -defaultsOSRD
preplace port SMADC_4_CSB_0 -pg 1 -y 1120 -defaultsOSRD
preplace port SMADC_3_CSB_0 -pg 1 -y 1080 -defaultsOSRD
preplace port GT_TX_3 -pg 1 -y -990 -defaultsOSRD
preplace port clock_source_commutator -pg 1 -y 340 -defaultsOSRD
preplace port INVALID_EXT_CLK -pg 1 -y 390 -defaultsOSRD
preplace port LINK1_FIFO_OUT -pg 1 -y -1070 -defaultsOSRD
preplace port LINK0_FIFO_OUT -pg 1 -y -340 -defaultsOSRD
preplace port SPI_MOSI_1_0 -pg 1 -y 710 -defaultsOSRD
preplace port SMADC_2_CSA_0 -pg 1 -y 1020 -defaultsOSRD
preplace port SPI_MOSI_0_0 -pg 1 -y 690 -defaultsOSRD
preplace port SMADC_CLK_0 -pg 1 -y 1140 -defaultsOSRD
preplace port DDR_0 -pg 1 -y 1260 -defaultsOSRD
preplace port CLOCK_RESET -pg 1 -y 360 -defaultsOSRD
preplace port SPI_CS_0 -pg 1 -y 750 -defaultsOSRD
preplace port SPI_CLK_0 -pg 1 -y 730 -defaultsOSRD
preplace port SMADC_1_CSA_0 -pg 1 -y 980 -defaultsOSRD
preplace port SIRcClock -pg 1 -y 20 -defaultsOSRD
preplace port LINK1_FIFO_IN -pg 1 -y -1110 -defaultsOSRD
preplace port IIC_0 -pg 1 -y 1640 -defaultsOSRD
preplace port SMADC_MOSI_0 -pg 1 -y 1160 -defaultsOSRD
preplace port M_AVALON_0 -pg 1 -y 1780 -defaultsOSRD
preplace port FIXED_IO_0 -pg 1 -y 1280 -defaultsOSRD
preplace port cfg_pulse_bitsleep_0 -pg 1 -y 900 -defaultsOSRD
preplace port SMADC_4_CSA_0 -pg 1 -y 1100 -defaultsOSRD
preplace port SMADC_2_CSB_0 -pg 1 -y 1040 -defaultsOSRD
preplace port SMADC_1_CSB_0 -pg 1 -y 1000 -defaultsOSRD
preplace port GT_RX_2 -pg 1 -y -420 -defaultsOSRD
preplace portBus cfg_selected_prw_0 -pg 1 -y 960 -defaultsOSRD
preplace portBus FW_VER_0 -pg 1 -y 90 -defaultsOSRD
preplace portBus MAIN_RESET -pg 1 -y 1890 -defaultsOSRD
preplace portBus BOARDPOSITION -pg 1 -y 350 -defaultsOSRD
preplace portBus FW_STRING_0 -pg 1 -y 330 -defaultsOSRD
preplace portBus cfg_channel_selector_0 -pg 1 -y 940 -defaultsOSRD
preplace portBus CLOCK_SOURCE -pg 1 -y 370 -defaultsOSRD
preplace portBus FW_RELEASE_DATE_0 -pg 1 -y 110 -defaultsOSRD
preplace portBus cfg_serdes1_delay_0 -pg 1 -y 860 -defaultsOSRD
preplace portBus serdes_reset_0 -pg 1 -y 960 -defaultsOSRD
preplace inst axis_data_fifo_1 -pg 1 -lvl 5 -y -310 -defaultsOSRD
preplace inst rst_ps7_0_125M -pg 1 -lvl 1 -y 2270 -defaultsOSRD
preplace inst axis_data_fifo_2 -pg 1 -lvl 3 -y -1070 -defaultsOSRD
preplace inst axi_iic_0 -pg 1 -lvl 5 -y 1650 -defaultsOSRD
preplace inst RESET_TX -pg 1 -lvl 1 -y -810 -defaultsOSRD
preplace inst FIRMWAREBUILD -pg 1 -lvl 1 -y 40 -defaultsOSRD
preplace inst axis_data_fifo_3 -pg 1 -lvl 5 -y -1040 -defaultsOSRD
preplace inst FirmwareStatus_0 -pg 1 -lvl 3 -y 30 -defaultsOSRD
preplace inst IICBaseInterconnection_0 -pg 1 -lvl 3 -y 350 -defaultsOSRD
preplace inst util_vector_logic_0 -pg 1 -lvl 2 -y 1990 -defaultsOSRD
preplace inst RESET_RX -pg 1 -lvl 3 -y 1030 -defaultsOSRD
preplace inst util_vector_logic_1 -pg 1 -lvl 5 -y 1890 -defaultsOSRD
preplace inst tft_display_0 -pg 1 -lvl 5 -y 720 -defaultsOSRD
preplace inst axi_amm_bridge_0 -pg 1 -lvl 5 -y 1780 -defaultsOSRD
preplace inst OPTOLINK_0 -pg 1 -lvl 4 -y -400 -defaultsOSRD
preplace inst FIRMWAREVERSION -pg 1 -lvl 1 -y 160 -defaultsOSRD
preplace inst data_mover_0 -pg 1 -lvl 3 -y 1300 -defaultsOSRD
preplace inst OPTOLINK_1 -pg 1 -lvl 4 -y -940 -defaultsOSRD
preplace inst ps7_0_axi_periph -pg 1 -lvl 2 -y 2450 -defaultsOSRD
preplace inst axi_interconnect_0 -pg 1 -lvl 4 -y 1310 -defaultsOSRD
preplace inst rst_ps7_0_125M1 -pg 1 -lvl 1 -y 2900 -defaultsOSRD
preplace inst FS_0_AXIFIFO -pg 1 -lvl 2 -y 1850 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 5 -y 1330 -defaultsOSRD
preplace inst axis_data_fifo_0 -pg 1 -lvl 3 -y -610 -defaultsOSRD
preplace inst NIDNAPort_0 -pg 1 -lvl 3 -y 2390 -defaultsOSRD
preplace inst FIRMWAREOPTIONS -pg 1 -lvl 2 -y 160 -defaultsOSRD
preplace inst ADCSyncModule_0 -pg 1 -lvl 5 -y 1000 -defaultsOSRD
preplace netloc axi_amm_bridge_0_M_AVALON 1 5 1 NJ
preplace netloc tft_display_0_SPI_CS 1 5 1 NJ
preplace netloc ADCSyncModule_0_SMADC_3_CSB 1 5 1 2440J
preplace netloc tft_display_0_SPI_MOSI_0 1 5 1 NJ
preplace netloc ADCSyncModule_0_SMADC_4_CSA 1 5 1 2440J
preplace netloc axis_data_fifo_3_M_AXIS 1 5 1 NJ
preplace netloc util_vector_logic_0_Res 1 2 2 730J -380 1310
preplace netloc tft_display_0_SPI_MOSI_1 1 5 1 NJ
preplace netloc ADCSyncModule_0_SMADC_4_CSB 1 5 1 2440J
preplace netloc processing_system7_0_FIXED_IO 1 5 1 NJ
preplace netloc HLINK_0_gt_qpllclk_quad1_out 1 3 2 1350 -760 1830
preplace netloc FIRMWAREBUILD1_dout 1 2 1 740J
preplace netloc ADCSyncModule_0_SMADC_1_CSA 1 5 1 2440J
preplace netloc HLINK_0_gt_refclk1_out 1 3 3 1340 -170 1830 -220 NJ
preplace netloc ADCSyncModule_0_SMADC_1_CSB 1 5 1 2440J
preplace netloc HLINK_0_GT_SERIAL_TX 1 4 2 NJ -500 NJ
preplace netloc ps7_0_axi_periph_M02_AXI 1 2 1 750
preplace netloc axi_iic_0_IIC 1 5 1 2440J
preplace netloc ps7_0_axi_periph_M04_AXI 1 2 1 780
preplace netloc RESET_TX_Res 1 1 2 NJ -810 820
preplace netloc FW_STRING_0_1 1 0 3 NJ 330 NJ 330 NJ
preplace netloc ADCSyncModule_0_cfg_channel_selector 1 5 1 2440J
preplace netloc ps7_0_axi_periph_M03_AXI 1 2 1 790
preplace netloc GT_SERIAL_RX_1_2 1 0 4 NJ -420 NJ -420 NJ -420 NJ
preplace netloc processing_system7_0_DDR 1 5 1 NJ
preplace netloc BOARDPOSITION_1 1 0 3 NJ 350 NJ 350 NJ
preplace netloc HLINK_0_tx_sys_reset_out 1 0 5 -20 -160 NJ -160 NJ -160 NJ -160 1820
preplace netloc axis_data_fifo_1_M_AXIS 1 5 1 NJ
preplace netloc CLOCK_PL_1 1 0 5 -40 2390 360 920 770 920 N 920 1910
preplace netloc FS_0_1 1 0 2 NJ 1830 NJ
preplace netloc ps7_0_axi_periph_M00_AXI 1 2 3 760 970 NJ 970 NJ
preplace netloc HLINK_1_USER_DATA_M_AXIS_RX 1 4 1 1850
preplace netloc processing_system7_0_FCLK_RESET0_N 1 0 6 -30 2050 NJ 2050 NJ 2050 NJ 2050 NJ 2050 2430
preplace netloc axi_iic_0_iic2intc_irpt 1 4 2 1920 1490 2410
preplace netloc ADCSyncModule_0_SMADC_2_CSA 1 5 1 2440J
preplace netloc GT_SERIAL_RX_0_2 1 0 4 NJ -980 NJ -980 NJ -980 1310J
preplace netloc ps7_0_axi_periph_M01_AXI 1 2 3 800 1760 NJ 1760 NJ
preplace netloc ADCSyncModule_0_SMADC_2_CSB 1 5 1 2440J
preplace netloc ADCSyncModule_0_SMADC_CLK 1 5 1 2440J
preplace netloc HLINK_0_user_clk_out 1 2 3 830 -970 1330 -1140 1880
preplace netloc HLINK_1_GT_SERIAL_TX 1 4 2 1900J -950 2440J
preplace netloc HLINK_0_rx_sys_reset_out 1 2 3 840 -120 NJ -120 1810
preplace netloc CLOCK_SOURCE_1 1 0 3 NJ 370 NJ 370 N
preplace netloc ps7_0_axi_periph_M07_AXI 1 2 3 810 700 NJ 700 NJ
preplace netloc rst_ps7_0_125M1_peripheral_aresetn 1 1 4 350 960 760 960 N 960 1890
preplace netloc axis_data_fifo_2_M_AXIS 1 3 1 1340
preplace netloc cfg_selected_prw_0_1 1 0 5 -20J 950 NJ 950 NJ 950 NJ 950 1830J
preplace netloc axis_data_fifo_0_M_AXIS 1 3 1 1300
preplace netloc tft_display_0_SPI_CLK 1 5 1 NJ
preplace netloc FW_VER_0_1 1 0 3 NJ 90 NJ 90 800
preplace netloc processing_system7_0_FCLK_CLK0 1 0 6 -20 2360 390 1930 820 130 1330 720 1870 1470 2440
preplace netloc S_AXIS_0_1 1 0 3 NJ -650 NJ -650 NJ
preplace netloc RESET_RX_Res 1 3 2 1300J -150 1860
preplace netloc ADCSyncModule_0_SMADC_MOSI 1 5 1 2440J
preplace netloc S_AXIS_0_2 1 0 3 NJ -1110 NJ -1110 NJ
preplace netloc FW_RELEASE_DATE_0_1 1 0 3 NJ 110 NJ 110 810
preplace netloc IICBaseInterconnection_0_CLOCK_RESET 1 3 3 N 360 NJ 360 NJ
preplace netloc HLINK_0_sync_clk_out 1 3 2 1350 -1150 1840
preplace netloc axis_data_fifo_4_M_AXIS 1 2 1 770
preplace netloc HLINK_0_mmcm_not_locked_out 1 3 2 1360 -1120 1810
preplace netloc IICBaseInterconnection_0_CLOCK_COMMUTATOR 1 3 3 NJ 340 NJ 340 N
preplace netloc HLINK_0_USER_DATA_M_AXIS_RX 1 4 1 1870
preplace netloc GT_REFCLK_0_1 1 0 4 NJ -460 NJ -460 NJ -460 NJ
preplace netloc util_vector_logic_1_Res 1 5 1 NJ
preplace netloc ps7_0_axi_periph_M06_AXI 1 2 1 850
preplace netloc HLINK_0_gt_qpllrefclk_quad1_out 1 3 2 1360 -750 1820
preplace netloc ps7_0_axi_periph_M05_AXI 1 2 3 840 1630 NJ 1630 NJ
preplace netloc ADCSyncModule_0_cfg_serdes1_delay 1 5 1 2440J
preplace netloc processing_system7_0_M_AXI_GP0 1 1 5 400 1500 NJ 1500 NJ 1500 NJ 1500 2420
preplace netloc ADCSyncModule_0_cfg_abselector 1 5 1 2440J
preplace netloc data_mover_0_m_axi_a_V 1 3 1 1310
preplace netloc rst_ps7_0_125M_interconnect_aresetn 1 1 3 370 1110 NJ 1110 1300
preplace netloc ADCSyncModule_0_cfg_pulse_bitsleep 1 5 1 2440J
preplace netloc INVALID_EXT_CLK_1 1 0 3 NJ 390 NJ 390 N
preplace netloc ADCSyncModule_0_cfg_serdes1_delay_exc 1 5 1 2440J
preplace netloc ADCSyncModule_0_serdes_reset 1 5 1 2440J
preplace netloc rst_ps7_0_125M_peripheral_aresetn 1 1 4 380 1770 830 1130 1320 1130 1900
preplace netloc axi_interconnect_0_M00_AXI 1 4 1 N
preplace netloc ADCSyncModule_0_SMADC_3_CSA 1 5 1 2440J
levelinfo -pg 1 -60 180 570 1090 1600 2170 2580 -top -1160 -bot 2990
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""

