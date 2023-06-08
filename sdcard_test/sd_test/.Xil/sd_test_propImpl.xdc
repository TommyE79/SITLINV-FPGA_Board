set_property SRC_FILE_INFO {cfile:d:/demo_AX7103/16_sd_test/sd_test/sd_test.srcs/sources_1/ip/pll/pll.xdc rfile:../sd_test.srcs/sources_1/ip/pll/pll.xdc id:1 order:EARLY scoped_inst:pll_inst/inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.05
