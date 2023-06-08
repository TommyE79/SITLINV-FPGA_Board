onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.ibert_7series_gtx_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {ibert_7series_gtx_0.udo}

run -all

quit -force
