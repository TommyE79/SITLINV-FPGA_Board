// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Wed Nov 16 12:58:06 2022
// Host        : WIN-10J6P4VGMFJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ram_sim_netlist.v
// Design      : ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20240)
`pragma protect data_block
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
pLIIqmk=
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
