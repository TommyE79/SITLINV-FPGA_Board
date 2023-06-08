vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../ibert_7series_gtx_0_ex.srcs/sources_1/ip/ibert_7series_gtx_0/hdl" \
"D:/vivado2019/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/vivado2019/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \


vlog -work xil_defaultlib \
"glbl.v"

