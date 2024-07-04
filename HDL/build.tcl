


set script_path [ file dirname [ file normalize [ info script ] ] ]
set outputDir $script_path/vivado
set artDir $script_path/output
file mkdir $outputDir
file mkdir $artDir

set outfile1 [open "${artDir}/content.xml" w+]   

puts $outfile1 "<OPENHARDWARE>"
puts $outfile1 "   <SUPPORTED_PLATFORM>"
puts $outfile1 "       <GUID0>C7F960A5-8051-45F0-B793-8899650BAB9D</GUID0>"
puts $outfile1 "       <MODEL>A</MODEL>"
puts $outfile1 "   </SUPPORTED_PLATFORM>"
puts $outfile1 "   <FPGA>"
puts $outfile1 "       <version>2023.08.16.2</version>"
puts $outfile1 "       <filename>R76Firmware.fpga</filename>"
puts $outfile1 "   </FPGA>"
puts $outfile1 "   <HWJSON>"
puts $outfile1 "       <filename>RegisterFile.json</filename>"
puts $outfile1 "   </HWJSON>"
puts $outfile1 "</OPENHARDWARE>"

close $outfile1


create_project R76Firmware $outputDir -part xc7z030fbg676-2 -force
set_property source_mgmt_mode None [current_project]
set_property target_language VHDL [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]

set_property "ip_repo_paths" "[file normalize "./ip_repo"]"  [current_project]
update_ip_catalog -rebuild


add_files -force ./pcores/clk_wiz_0.xcix
add_files -force ./pcores/fifo_generator_0.xcix
add_files -force ./pcores/main_clock.xci
add_files -force ./subpage_ChargeIntegrator.vhd
add_files -force ./subpage_CombinedTrigger.vhd
add_files -force ./subpage_LowerTrigger.vhd
add_files -force ./subpage_ReduceRate.vhd
add_files -force ./subpage_UpperTrigger.vhd
add_files -force ./top_R76Firmware.vhd
add_files -force ./pcores/ADC1.v
add_files -force ./pcores/ADC2.v
add_files -force ./pcores/adcs_top.vhd
add_files -force ./pcores/adc_interface.vhd
add_files -force ./pcores/avalon_wrapper.vhd
add_files -force ./pcores/charge_integratiobkb.vhd
add_files -force ./pcores/charge_integration.vhd
add_files -force ./pcores/comparator.vhd
add_files -force ./pcores/counter_rising.vhd
add_files -force ./pcores/MCRateMeter.vhd
add_files -force ./pcores/polinvert.vhd
add_files -force ./pcores/TimestampGenerator.vhd
add_files -force ./pcores/trigger_leading.vhd
add_files -force ./pcores/U166_custompacket.vhd
add_files -force ./pcores/xlx_delay.vhd
add_files -force ./pcores/xlx_fifo.vhd
add_files -force ./pcores/xlx_oscilloscope_sync.vhd
add_files -force ./pcores/xlx_soft_gd.vhd
add_files -force ./pcores/xlx_spectrum.vhd
add_files -force ./pcores/ZynqDesign_wrapper.vhd
add_files -force -fileset constrs_1 ./DT5560_pins.xdc
import_files -force -norecurse
import_files -fileset constrs_1 -force -norecurse ./DT5560_pins.xdc


foreach ip [get_ips] {
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
}

update_ip_catalog -rebuild

source "./pcores/ZynqDesign.tcl"


set_property Top top_R76Firmware [current_fileset]

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

file copy -force $outputDir/R76Firmware.runs/impl_1/top_R76Firmware.bin $artDir/top_R76Firmware.bin
file copy -force $script_path/RegisterFile.json $artDir/RegisterFile.json
exec python $script_path/bintofpga.py $artDir/top_R76Firmware.bin $artDir/R76Firmware.fpga
if { [catch { exec rm $artDir/R76Firmware.niu  } msg] } {
puts "No niu file present to be deleted"
}
exec zip -j $artDir/R76Firmware.niu $artDir/RegisterFile.json $artDir/R76Firmware.fpga $artDir/content.xml


exit





