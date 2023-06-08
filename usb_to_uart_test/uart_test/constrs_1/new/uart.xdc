#############SPI Configurate Setting##################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
############## clock define##################
create_clock -period 5.000 [get_ports sys_clk_p]
set_property PACKAGE_PIN AB11 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]
############## key define##################
set_property PACKAGE_PIN AC16 [get_ports rst_n]
set_property IOSTANDARD LVCMOS15 [get_ports rst_n]
##############uart define###########################
set_property IOSTANDARD LVCMOS25 [get_ports uart_rx]
set_property PACKAGE_PIN K21 [get_ports uart_rx]

set_property IOSTANDARD LVCMOS25 [get_ports uart_tx]
set_property PACKAGE_PIN L23 [get_ports uart_tx]
