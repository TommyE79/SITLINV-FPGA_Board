// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Nov 16 12:58:06 2022
// Host        : WIN-10J6P4VGMFJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top ram -prefix
//               ram_ ram_stub.v
// Design      : ram
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *)
module ram(clka, wea, addra, dina, clkb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,wea[0:0],addra[8:0],dina[31:0],clkb,addrb[8:0],doutb[31:0]" */;
  input clka;
  input [0:0]wea;
  input [8:0]addra;
  input [31:0]dina;
  input clkb;
  input [8:0]addrb;
  output [31:0]doutb;
endmodule
