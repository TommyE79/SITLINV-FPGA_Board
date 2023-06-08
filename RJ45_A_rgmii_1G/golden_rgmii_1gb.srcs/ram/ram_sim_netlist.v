// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Nov 16 12:58:06 2022
// Host        : WIN-10J6P4VGMFJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top ram -prefix
//               ram_ ram_sim_netlist.v
// Design      : ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module ram
   (clka,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [8:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [8:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [8:0]addra;
  wire [8:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]doutb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_douta_UNCONNECTED;
  wire [8:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [8:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "9" *) 
  (* C_ADDRB_WIDTH = "9" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.68295 mW" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "512" *) 
  (* C_READ_DEPTH_B = "512" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "512" *) 
  (* C_WRITE_DEPTH_B = "512" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  ram_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[31:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[8:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[8:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19824)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
