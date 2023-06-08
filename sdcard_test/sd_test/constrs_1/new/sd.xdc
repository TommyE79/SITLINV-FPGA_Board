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
set_property PACKAGE_PIN C24 [get_ports rst_n]
set_property IOSTANDARD LVCMOS25 [get_ports rst_n]
##############uart define###########################
set_property IOSTANDARD LVCMOS25 [get_ports uart_rx]
set_property PACKAGE_PIN L25 [get_ports uart_rx]

set_property IOSTANDARD LVCMOS25 [get_ports uart_tx]
set_property PACKAGE_PIN M25 [get_ports uart_tx]
############## SD define##################
set_property IOSTANDARD LVCMOS25 [get_ports sd_dclk]
set_property PACKAGE_PIN V22 [get_ports sd_dclk]

set_property IOSTANDARD LVCMOS25 [get_ports sd_ncs]
set_property PACKAGE_PIN W23 [get_ports sd_ncs]

set_property IOSTANDARD LVCMOS25 [get_ports sd_mosi]
set_property PACKAGE_PIN W24 [get_ports sd_mosi]

set_property IOSTANDARD LVCMOS25 [get_ports sd_miso]
set_property PACKAGE_PIN U22 [get_ports sd_miso]
#############LED Setting##################
set_property PACKAGE_PIN AA2 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[0]}]

set_property PACKAGE_PIN AD5 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[1]}]

set_property PACKAGE_PIN W10 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[2]}]

set_property PACKAGE_PIN Y10 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[3]}]
############## key define KEY2##################
set_property PACKAGE_PIN AC16 [get_ports key]
set_property IOSTANDARD LVCMOS15 [get_ports key]
