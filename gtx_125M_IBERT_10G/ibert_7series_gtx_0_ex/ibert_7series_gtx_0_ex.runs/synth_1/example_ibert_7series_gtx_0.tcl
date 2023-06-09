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
set_property webtalk.parent_dir d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/gtx_125M_IBERT/ibert_7series_gtx_0_ex/ibert_7series_gtx_0_ex.cache/wt [current_project]
set_property parent.project_path d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/gtx_125M_IBERT/ibert_7series_gtx_0_ex/ibert_7series_gtx_0_ex.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/gtx_125M_IBERT/ibert_7series_gtx_0_ex/ibert_7series_gtx_0_ex.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/gtx_125M_IBERT/ibert_7series_gtx_0_ex/imports/example_ibert_7series_gtx_0.v
read_ip -quiet d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/gtx_125M_IBERT/ibert_7series_gtx_0_ex/ibert_7series_gtx_0_ex.srcs/sources_1/ip/ibert_7series_gtx_0/ibert_7series_gtx_0.xci

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/gtx_125M_IBERT/ibert_7series_gtx_0_ex/imports/example_ibert_7series_gtx_0.xdc
set_property used_in_implementation false [get_files d:/BaiduNetdiskDownload/K7325_676_hdmi_inout/gtx_125M_IBERT/ibert_7series_gtx_0_ex/imports/example_ibert_7series_gtx_0.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top example_ibert_7series_gtx_0 -part xc7k325tffg676-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef example_ibert_7series_gtx_0.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file example_ibert_7series_gtx_0_utilization_synth.rpt -pb example_ibert_7series_gtx_0_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
