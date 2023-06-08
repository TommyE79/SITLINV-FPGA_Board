# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7k325tffg676-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/sd_test.cache/wt [current_project]
set_property parent.project_path D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/sd_test.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
read_verilog -library xil_defaultlib {
  D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/src/ax_debounce.v
  D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/src/sd_card/sd_card_cmd.v
  D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/src/sd_card/sd_card_sec_read_write.v
  D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/src/sd_card/sd_card_top.v
  D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/src/sd_card/spi_master.v
  D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/src/sd_card_test.v
}
read_ip -quiet D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/sd_test.srcs/sources_1/ip/clk_ref/clk_ref.xci
set_property used_in_implementation false [get_files -all d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/sd_test.srcs/sources_1/ip/clk_ref/clk_ref_board.xdc]
set_property used_in_implementation false [get_files -all d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/sd_test.srcs/sources_1/ip/clk_ref/clk_ref.xdc]
set_property used_in_implementation false [get_files -all d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/sd_test.srcs/sources_1/ip/clk_ref/clk_ref_ooc.xdc]

read_ip -quiet D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/sd_test.srcs/sources_1/ip/ila_0/ila_0.xci
set_property used_in_synthesis false [get_files -all d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/sd_test.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/sd_test.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/sd_test.srcs/sources_1/ip/ila_0/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/sd_test.srcs/sources_1/ip/ila_0/ila_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/constrs_1/new/sd.xdc
set_property used_in_implementation false [get_files D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/sdcard_test/sd_test/constrs_1/new/sd.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top sd_card_test -part xc7k325tffg676-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef sd_card_test.dcp
create_report "synth_676_synth_report_utilization_0" "report_utilization -file sd_card_test_utilization_synth.rpt -pb sd_card_test_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
