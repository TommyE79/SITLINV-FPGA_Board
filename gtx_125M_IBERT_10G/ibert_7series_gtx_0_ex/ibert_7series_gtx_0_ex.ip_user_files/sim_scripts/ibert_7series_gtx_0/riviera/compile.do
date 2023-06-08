vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../ibert_7series_gtx_0_ex.srcs/sources_1/ip/ibert_7series_gtx_0/hdl" \
"D:/vivado2019/Vivado/2019.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/vivado2019/Vivado/2019.1/data/ip/xpm/xpm_VCOMP.vhd" \


vlog -work xil_defaultlib \
"glbl.v"

