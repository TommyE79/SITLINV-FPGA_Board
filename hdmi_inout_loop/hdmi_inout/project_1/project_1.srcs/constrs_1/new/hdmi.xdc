


############## clock define##########################
create_clock -period 20 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PACKAGE_PIN F17 [get_ports sys_clk]

#####################HDMI_IN #######################################	
set_property PACKAGE_PIN U21 [get_ports hdmi_ddc_scl_io]
set_property PACKAGE_PIN Y20 [get_ports hdmi_ddc_sda_io]
set_property PACKAGE_PIN G11 [get_ports TMDS_clk_hdmi_in_p]
set_property PACKAGE_PIN J13 [get_ports {TMDS_data_hdmi_in_p[0]}]
set_property PACKAGE_PIN J11 [get_ports {TMDS_data_hdmi_in_p[1]}]
set_property PACKAGE_PIN H14 [get_ports {TMDS_data_hdmi_in_p[2]}]

set_property IOSTANDARD LVCMOS33 [get_ports hdmi_ddc_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_ddc_sda_io]

set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_hdmi_in_n]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_hdmi_in_p]

set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_n[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_p[0]}]

set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_n[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_p[1]}]

set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_n[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_in_p[2]}]

############## HDMIOUT define#########################
set_property PACKAGE_PIN F14 [get_ports  TMDS_clk_hdmi_out_p]
set_property PACKAGE_PIN G12 [get_ports {TMDS_data_hdmi_out_p[0]}]
set_property PACKAGE_PIN G10 [get_ports {TMDS_data_hdmi_out_p[1]}]
set_property PACKAGE_PIN H9 [get_ports {TMDS_data_hdmi_out_p[2]}]

set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_hdmi_out_n]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_clk_hdmi_out_p]

set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_n[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_p[0]}]

set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_n[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_p[1]}]

set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_n[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_data_hdmi_out_p[2]}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets dvi2rgb_m0/TMDS_ClockingX/CLK_IN_hdmi_clk]