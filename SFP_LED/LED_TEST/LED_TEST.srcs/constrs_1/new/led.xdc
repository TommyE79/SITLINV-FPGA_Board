## System clock pin locs and timing constraints
##
set_property PACKAGE_PIN F17 [get_ports clk_100M]
set_property IOSTANDARD LVCMOS33 [get_ports clk_100M]

set_property PACKAGE_PIN AA2 [get_ports {dataout[7]}]
set_property PACKAGE_PIN AD5 [get_ports {dataout[6]}]
set_property PACKAGE_PIN W10 [get_ports {dataout[5]}]
set_property PACKAGE_PIN Y10 [get_ports {dataout[4]}]
set_property PACKAGE_PIN AE10 [get_ports {dataout[3]}]
set_property PACKAGE_PIN W11 [get_ports {dataout[2]}]
set_property PACKAGE_PIN V11 [get_ports {dataout[1]}]
set_property PACKAGE_PIN Y12 [get_ports {dataout[0]}]

set_property IOSTANDARD LVCMOS15 [get_ports {dataout[*]}]


set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CCLK_TRISTATE TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 66 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_32BIT_ADDR YES [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLUP [current_design]
