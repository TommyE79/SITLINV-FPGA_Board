
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property DCI_CASCADE {32 34} [get_iobanks 33]

set_property PACKAGE_PIN AA2 [get_ports {leds[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[0]}]
set_property PACKAGE_PIN AD5 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[1]}]
set_property PACKAGE_PIN W10 [get_ports {leds[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[2]}]
set_property PACKAGE_PIN Y10 [get_ports {leds[3]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[3]}]
set_property PACKAGE_PIN AE10 [get_ports {leds[4]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[4]}]
set_property PACKAGE_PIN W11 [get_ports {leds[5]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[5]}]
set_property PACKAGE_PIN V11 [get_ports {leds[6]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[6]}]
set_property PACKAGE_PIN Y12 [get_ports {leds[7]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[7]}]

set_property PACKAGE_PIN C24 [get_ports sys_rst]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst]


#set_property PACKAGE_PIN F17 [get_ports sys_clk]
#set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]


