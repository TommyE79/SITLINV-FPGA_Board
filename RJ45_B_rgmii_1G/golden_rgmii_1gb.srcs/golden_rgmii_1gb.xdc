
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property PACKAGE_PIN C24 [get_ports sys_nrst]
set_property IOSTANDARD LVCMOS33 [get_ports sys_nrst]

set_property IOSTANDARD LVCMOS33 [get_ports e_rxc]
set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {e_rxd[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {e_txd[0]}]

set_property PACKAGE_PIN B11 [get_ports e_txc]
set_property IOSTANDARD LVCMOS33 [get_ports e_txc]
set_property PACKAGE_PIN A14 [get_ports e_txctl]
set_property IOSTANDARD LVCMOS33 [get_ports e_txctl]

set_property PACKAGE_PIN A8 [get_ports e_rxctl]
set_property IOSTANDARD LVCMOS33 [get_ports e_rxctl]
set_property PACKAGE_PIN E10 [get_ports e_rxc]

set_property PACKAGE_PIN A10 [get_ports {e_rxd[3]}]
set_property PACKAGE_PIN B10 [get_ports {e_rxd[2]}]
set_property PACKAGE_PIN A9 [get_ports {e_rxd[1]}]
set_property PACKAGE_PIN B9 [get_ports {e_rxd[0]}]

set_property PACKAGE_PIN B12 [get_ports {e_txd[0]}]
set_property PACKAGE_PIN A12 [get_ports {e_txd[1]}]
set_property PACKAGE_PIN A13 [get_ports {e_txd[2]}]
set_property PACKAGE_PIN C11 [get_ports {e_txd[3]}]

set_property PACKAGE_PIN B14 [get_ports e_reset]
set_property IOSTANDARD LVCMOS33 [get_ports e_reset]
set_property PACKAGE_PIN A15 [get_ports e_mdc]
set_property IOSTANDARD LVCMOS33 [get_ports e_mdc]
set_property PACKAGE_PIN B15 [get_ports e_mdio]
set_property IOSTANDARD LVCMOS33 [get_ports e_mdio]

create_clock -period 8.000 -name e_rxc -waveform {0.000 4.000} [get_ports e_rxc]
create_generated_clock -name e_txc -source [get_pins gmii_to_rgmii_inst0/U_ODDR2/C] -divide_by 1 [get_ports e_txc]
