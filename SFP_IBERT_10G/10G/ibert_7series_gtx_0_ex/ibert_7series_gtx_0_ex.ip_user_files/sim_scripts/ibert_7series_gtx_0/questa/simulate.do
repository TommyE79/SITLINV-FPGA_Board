onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ibert_7series_gtx_0_opt

do {wave.do}

view wave
view structure
view signals

do {ibert_7series_gtx_0.udo}

run -all

quit -force
