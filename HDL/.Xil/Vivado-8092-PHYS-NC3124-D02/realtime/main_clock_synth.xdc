set_property SRC_FILE_INFO {cfile:c:/OpenHardware/UserProject/R76Firmware/output/R76Firmware/R76Firmware.srcs/sources_1/ip/main_clock/main_clock.xdc rfile:../../../../output/R76Firmware/R76Firmware.srcs/sources_1/ip/main_clock/main_clock.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property SRC_FILE_INFO {cfile:c:/OpenHardware/UserProject/R76Firmware/output/R76Firmware/R76Firmware.srcs/sources_1/ip/main_clock/main_clock_ooc.xdc rfile:../../../../output/R76Firmware/R76Firmware.srcs/sources_1/ip/main_clock/main_clock_ooc.xdc id:2 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_property PHASESHIFT_MODE WAVEFORM [get_cells inst/mmcm_adv_inst]
set_property src_info {type:TCL file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
set_property DONT_TOUCH true [get_cells inst]
set_property src_info {type:SCOPED_XDC file:2 line:57 export:INPUT save:INPUT read:FILTER_OUT_OF_CONTEXT} [current_design]
create_clock -period 8.000 -name clk_board [get_ports clk_board]
set_property src_info {type:SCOPED_XDC file:2 line:58 export:INPUT save:INPUT read:FILTER_OUT_OF_CONTEXT} [current_design]
create_clock -period 8.000 -name clk_adc [get_ports clk_adc]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clkfbout_main_clock -source [get_pins inst/mmcm_adv_inst/CLKIN2] -multiply_by 1 -add -master_clock clk_adc [get_pins inst/mmcm_adv_inst/CLKFBOUT]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clkfbout_main_clock_1 -source [get_pins inst/mmcm_adv_inst/CLKIN1] -multiply_by 1 -add -master_clock clk_board [get_pins inst/mmcm_adv_inst/CLKFBOUT]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out1_main_clock -source [get_pins inst/mmcm_adv_inst/CLKIN2] -edges {1 2 3} -edge_shift {0.000 1.000 2.000} -add -master_clock clk_adc [get_pins inst/mmcm_adv_inst/CLKOUT0]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out1_main_clock_1 -source [get_pins inst/mmcm_adv_inst/CLKIN1] -edges {1 2 3} -edge_shift {0.000 1.000 2.000} -add -master_clock clk_board [get_pins inst/mmcm_adv_inst/CLKOUT0]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out2_main_clock -source [get_pins inst/mmcm_adv_inst/CLKIN2] -multiply_by 1 -add -master_clock clk_adc [get_pins inst/mmcm_adv_inst/CLKOUT1]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out2_main_clock_1 -source [get_pins inst/mmcm_adv_inst/CLKIN1] -multiply_by 1 -add -master_clock clk_board [get_pins inst/mmcm_adv_inst/CLKOUT1]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out3_main_clock -source [get_pins inst/mmcm_adv_inst/CLKIN2] -edges {1 2 3} -edge_shift {0.000 -1.500 -3.000} -add -master_clock clk_adc [get_pins inst/mmcm_adv_inst/CLKOUT2]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out3_main_clock_1 -source [get_pins inst/mmcm_adv_inst/CLKIN1] -edges {1 2 3} -edge_shift {0.000 -1.500 -3.000} -add -master_clock clk_board [get_pins inst/mmcm_adv_inst/CLKOUT2]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out4_main_clock -source [get_pins inst/mmcm_adv_inst/CLKIN2] -multiply_by 2 -add -master_clock clk_adc [get_pins inst/mmcm_adv_inst/CLKOUT3]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out4_main_clock_1 -source [get_pins inst/mmcm_adv_inst/CLKIN1] -multiply_by 2 -add -master_clock clk_board [get_pins inst/mmcm_adv_inst/CLKOUT3]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out5_main_clock -source [get_pins inst/mmcm_adv_inst/CLKIN2] -edges {1 2 3} -edge_shift {1.000 -1.000 -3.000} -add -master_clock clk_adc [get_pins inst/mmcm_adv_inst/CLKOUT4]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out5_main_clock_1 -source [get_pins inst/mmcm_adv_inst/CLKIN1] -edges {1 2 3} -edge_shift {1.000 -1.000 -3.000} -add -master_clock clk_board [get_pins inst/mmcm_adv_inst/CLKOUT4]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out6_main_clock -source [get_pins inst/mmcm_adv_inst/CLKIN2] -multiply_by 4 -add -master_clock clk_adc [get_pins inst/mmcm_adv_inst/CLKOUT5]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out6_main_clock_1 -source [get_pins inst/mmcm_adv_inst/CLKIN1] -multiply_by 4 -add -master_clock clk_board [get_pins inst/mmcm_adv_inst/CLKOUT5]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out7_main_clock -source [get_pins inst/mmcm_adv_inst/CLKIN2] -edges {1 2 3} -edge_shift {0.500 -2.500 -5.500} -add -master_clock clk_adc [get_pins inst/mmcm_adv_inst/CLKOUT6]
set_property src_info {type:PI file:{} line:-1 export:INPUT save:INPUT read:READ} [current_design]
create_generated_clock -name clk_out7_main_clock_1 -source [get_pins inst/mmcm_adv_inst/CLKIN1] -edges {1 2 3} -edge_shift {0.500 -2.500 -5.500} -add -master_clock clk_board [get_pins inst/mmcm_adv_inst/CLKOUT6]
