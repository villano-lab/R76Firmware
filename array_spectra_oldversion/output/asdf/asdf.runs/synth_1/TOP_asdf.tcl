# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7z030fbg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.cache/wt [current_project]
set_property parent.project_path C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_repo_paths c:/OpenHardware/NuclearOption/asdf/HDL/ip_repo [current_project]
set_property ip_output_repo c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/ADC1.v
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/ADC2.v
}
read_vhdl -library xil_defaultlib {
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/subpage_subdesign_1.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/subpage_subdesign_2.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/top_asdf.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/adcs_top.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/adc_interface.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/avalon_wrapper.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/charge_integratiobkb.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/charge_integration.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/polinvert.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/trigger_leading.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/xlx_delay.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/xlx_soft_gd.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/xlx_spectrum.vhd
  C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/imports/HDL/pcores/ZynqDesign_wrapper.vhd
}
read_ip -quiet C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_late.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

read_ip -quiet C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0.xci
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_ooc.xdc]

read_ip -quiet C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/main_clock/main_clock.xci
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/main_clock/main_clock_board.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/main_clock/main_clock.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/ip/main_clock/main_clock_ooc.xdc]

add_files C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ZynqDesign.bd
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_FS_0_AXIFIFO_0/ZynqDesign_FS_0_AXIFIFO_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_FS_0_AXIFIFO_0/ZynqDesign_FS_0_AXIFIFO_0/ZynqDesign_FS_0_AXIFIFO_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_OPTOLINK_0_0/ZynqDesign_OPTOLINK_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_OPTOLINK_0_0/ZynqDesign_OPTOLINK_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_OPTOLINK_0_0/ZynqDesign_OPTOLINK_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_OPTOLINK_1_0/ZynqDesign_OPTOLINK_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_OPTOLINK_1_0/ZynqDesign_OPTOLINK_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_OPTOLINK_1_0/ZynqDesign_OPTOLINK_1_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axi_amm_bridge_0_0/ZynqDesign_axi_amm_bridge_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axi_amm_bridge_0_0/ZynqDesign_axi_amm_bridge_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axi_iic_0_0/ZynqDesign_axi_iic_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axi_iic_0_0/ZynqDesign_axi_iic_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_0_0/ZynqDesign_axis_data_fifo_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_0_0/ZynqDesign_axis_data_fifo_0_0/ZynqDesign_axis_data_fifo_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_0_0/ZynqDesign_axis_data_fifo_0_0/ZynqDesign_axis_data_fifo_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_1_0/ZynqDesign_axis_data_fifo_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_1_0/ZynqDesign_axis_data_fifo_1_0/ZynqDesign_axis_data_fifo_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_1_0/ZynqDesign_axis_data_fifo_1_0/ZynqDesign_axis_data_fifo_1_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_2_0/ZynqDesign_axis_data_fifo_2_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_2_0/ZynqDesign_axis_data_fifo_2_0/ZynqDesign_axis_data_fifo_2_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_2_0/ZynqDesign_axis_data_fifo_2_0/ZynqDesign_axis_data_fifo_2_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_3_0/ZynqDesign_axis_data_fifo_3_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_3_0/ZynqDesign_axis_data_fifo_3_0/ZynqDesign_axis_data_fifo_3_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_axis_data_fifo_3_0/ZynqDesign_axis_data_fifo_3_0/ZynqDesign_axis_data_fifo_3_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_data_mover_0_0/constraints/data_mover_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_processing_system7_0_0/ZynqDesign_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_rst_ps7_0_125M_0/ZynqDesign_rst_ps7_0_125M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_rst_ps7_0_125M_0/ZynqDesign_rst_ps7_0_125M_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_rst_ps7_0_125M_0/ZynqDesign_rst_ps7_0_125M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_rst_ps7_0_125M1_0/ZynqDesign_rst_ps7_0_125M1_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_rst_ps7_0_125M1_0/ZynqDesign_rst_ps7_0_125M1_0.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_rst_ps7_0_125M1_0/ZynqDesign_rst_ps7_0_125M1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_xbar_0/ZynqDesign_xbar_0_ooc.xdc]
set_property used_in_synthesis false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_auto_cc_1/ZynqDesign_auto_cc_1_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_auto_cc_1/ZynqDesign_auto_cc_1_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_auto_cc_1/ZynqDesign_auto_cc_1_ooc.xdc]
set_property used_in_synthesis false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_auto_cc_0/ZynqDesign_auto_cc_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_auto_cc_0/ZynqDesign_auto_cc_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_auto_cc_0/ZynqDesign_auto_cc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_auto_pc_1/ZynqDesign_auto_pc_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_auto_pc_0/ZynqDesign_auto_pc_0_ooc.xdc]
set_property used_in_synthesis false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_auto_us_0/ZynqDesign_auto_us_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_auto_us_0/ZynqDesign_auto_us_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ip/ZynqDesign_auto_us_0/ZynqDesign_auto_us_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/sources_1/bd/ZynqDesign/ZynqDesign_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/constrs_1/imports/HDL/DT5560_pins.xdc
set_property used_in_implementation false [get_files C:/OpenHardware/NuclearOption/asdf/output/asdf/asdf.srcs/constrs_1/imports/HDL/DT5560_pins.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top TOP_asdf -part xc7z030fbg676-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef TOP_asdf.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file TOP_asdf_utilization_synth.rpt -pb TOP_asdf_utilization_synth.pb"
