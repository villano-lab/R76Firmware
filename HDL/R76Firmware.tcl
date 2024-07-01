set outputDir C:/Users/CDMS/Documents/GitHub/R76Firmware/output/R76Firmware
file mkdir $outputDir
create_project R76Firmware C:/Users/CDMS/Documents/GitHub/R76Firmware/output/R76Firmware -part xc7z030fbg676-2 -force
set_property source_mgmt_mode None [current_project]
set_property target_language VHDL [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
set_property "ip_repo_paths" "[file normalize "C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/ip_repo"]"  [current_project]
update_ip_catalog -rebuild
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/clk_wiz_0.xcix
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/fifo_generator_0.xcix
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/main_clock.xci
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/subpage_ChargeIntegrator.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/subpage_clean_interrupt.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/subpage_CombinedTrigger.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/subpage_ReduceRate.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/subpage_Trigger.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/subpage_UpperTrigger.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/top_R76Firmware.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/ADC1.v
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/ADC2.v
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/adcs_top.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/adc_interface.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/avalon_wrapper.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/charge_integratiobkb.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/charge_integration.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/comparator.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/counter_rising.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/d_latch.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/MCRateMeter.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/polinvert.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/scaler.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/SW_GATE_AND_DELAY.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/TimestampGenerator.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/trigger_leading.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/U108_custompacket.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/U75_UserHDL_Serial_Rx.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/U85_UserHDL_Serial_Tx.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/xlx_delay.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/xlx_oscilloscope_sync.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/xlx_soft_gd.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/xlx_spectrum.vhd
add_files -force C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/ZynqDesign_wrapper.vhd
add_files -force -fileset constrs_1 C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/DT5560_pins.xdc
import_files -force -norecurse
import_files -fileset constrs_1 -force -norecurse C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/DT5560_pins.xdc
update_compile_order

foreach ip [get_ips] {
	if {[catch {
	upgrade_ip [get_ips $ip]
	set ip_filename [get_property IP_FILE $ip]
	set ip_dcp [file rootname $ip_filename]
	append ip_dcp ".dcp"
	set ip_xml [file rootname $ip_filename]
	append ip_xml ".xml"

		if {([file exists $ip_dcp] == 0) || [expr {[file mtime $ip_filename ] > [file mtime $ip_dcp ]}]} {
			reset_target all $ip
			file delete $ip_xml
			generate_target all $ip
            synth_ip $ip
		}

	} result]} {
   		 puts "SCI-WARNING: $result"
	} else {
    		# Use the result
	}
}

update_ip_catalog -rebuild
source "C:/Users/CDMS/Documents/GitHub/R76Firmware/HDL/pcores/ZynqDesign.tcl"
set_property top TOP_R76Firmware [current_fileset]
set obj [get_runs impl_1]
set obj_s [get_runs synth_1]
set_property -name "steps.write_bitstream.args.bin_file" -value "1" -objects $obj
if {[catch {
launch_runs synth_1 -jobs 14
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 14
wait_on_run impl_1
} errorstring]} {
Error "ABBA: $errorstring "
exit
}
set_property source_mgmt_mode All [current_project]
set utilisation_file ../output/report.csv
if {[catch {
tclapp::install designutils -quiet
namespace import ::tclapp::xilinx::designutils::report_failfast
open_run [current_run -implementation -quiet]
report_failfast -csv -transpose -file ${utilisation_file}
} errorstring]} {
}
exit
