set outputDir C:/OpenHardware/NuclearOption/asdf/output/asdf
file mkdir $outputDir
create_project asdf C:/OpenHardware/NuclearOption/asdf/output/asdf -part xc7z030fbg676-2 -force
set_property source_mgmt_mode None [current_project]
set_property target_language VHDL [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
set_property "ip_repo_paths" "[file normalize "C:/OpenHardware/NuclearOption/asdf/HDL/ip_repo"]"  [current_project]
update_ip_catalog -rebuild
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/clk_wiz_0.xcix
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/fifo_generator_0.xcix
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/main_clock.xci
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/subpage_subdesign_1.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/subpage_subdesign_2.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/top_asdf.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/ADC1.v
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/ADC2.v
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/adcs_top.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/adc_interface.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/avalon_wrapper.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/charge_integratiobkb.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/charge_integration.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/polinvert.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/trigger_leading.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/xlx_delay.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/xlx_soft_gd.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/xlx_spectrum.vhd
add_files -force C:/OpenHardware/NuclearOption/asdf/HDL/pcores/ZynqDesign_wrapper.vhd
add_files -force -fileset constrs_1 C:/OpenHardware/NuclearOption/asdf/HDL/DT5560_pins.xdc
import_files -force -norecurse
import_files -fileset constrs_1 -force -norecurse C:/OpenHardware/NuclearOption/asdf/HDL/DT5560_pins.xdc

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
source "C:/OpenHardware/NuclearOption/asdf/HDL/pcores/ZynqDesign.tcl"
set_property top TOP_asdf [current_fileset]
set obj [get_runs impl_1]
set obj_s [get_runs synth_1]
set_property -name "steps.write_bitstream.args.bin_file" -value "1" -objects $obj
if {[catch {
launch_runs synth_1 -jobs 32
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 32
wait_on_run impl_1
} errorstring]} {
Error "ABBA: $errorstring "
exit
}
exit
