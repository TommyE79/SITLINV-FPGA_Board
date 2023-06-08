
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

set_property PACKAGE_PIN D11 [get_ports e_txc]
set_property IOSTANDARD LVCMOS33 [get_ports e_txc]
set_property PACKAGE_PIN C14 [get_ports e_txctl]
set_property IOSTANDARD LVCMOS33 [get_ports e_txctl]

set_property PACKAGE_PIN F8 [get_ports e_rxctl]
set_property IOSTANDARD LVCMOS33 [get_ports e_rxctl]
set_property PACKAGE_PIN C12 [get_ports e_rxc]

set_property PACKAGE_PIN D10 [get_ports {e_rxd[3]}]
set_property PACKAGE_PIN C9 [get_ports {e_rxd[2]}]
set_property PACKAGE_PIN D9 [get_ports {e_rxd[1]}]
set_property PACKAGE_PIN D8 [get_ports {e_rxd[0]}]

set_property PACKAGE_PIN E12 [get_ports {e_txd[0]}]
set_property PACKAGE_PIN D13 [get_ports {e_txd[1]}]
set_property PACKAGE_PIN C13 [get_ports {e_txd[2]}]
set_property PACKAGE_PIN D14 [get_ports {e_txd[3]}]

set_property PACKAGE_PIN J8 [get_ports e_reset]
set_property IOSTANDARD LVCMOS33 [get_ports e_reset]
set_property PACKAGE_PIN F9 [get_ports e_mdc]
set_property IOSTANDARD LVCMOS33 [get_ports e_mdc]
set_property PACKAGE_PIN H11 [get_ports e_mdio]
set_property IOSTANDARD LVCMOS33 [get_ports e_mdio]

create_clock -period 8.000 -name e_rxc -waveform {0.000 4.000} [get_ports e_rxc]
create_generated_clock -name e_txc -source [get_pins gmii_to_rgmii_inst0/U_ODDR2/C] -divide_by 1 [get_ports e_txc]
