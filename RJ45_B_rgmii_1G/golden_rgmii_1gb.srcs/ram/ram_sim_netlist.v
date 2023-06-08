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
CAWjNRSqgsxT50OM9/u4iwbZiKZ6Uaz/S93hw1VLD93CcW6Me380X64U6A8FkeCY61HQdnOAMAvZ
FykZ7ESluuXMKfz0CSZG5lz9a11feQCHbo6ZPM8no0NU6yq3PCRfS1sw2gXawKPQbCcaDv2p7ZxR
iiIUegeGAFQZwOh80RKWNcFZMkw+agrxnEr8szxARhnAUlzB/X1S7qkrtwPNIAReTKwBc+hdecLs
9YZFpfSbEVMnRw6sydZ/b8byLcKHCu/+g6bz8/XkYDwVpDCM9lz17i4sAgQSG/34ymbbm3ggd+o2
QQaLDTqlGwdeU3Jf3Gscc0GtTGjp5wQ19Q2CLl64KMGg6hCRJymPtwrqV4i+2zb3q7A+/LwrQGYn
cjB1ApzaOXxvQCnESiTdjAGomtf4oyh316hqGDTl/p/ZZ7ZEST4itut+JrstKV65MkZ+mgSUqS06
zCHtWjkSy3jUlrJKgUpRDVIQYLyDzckVzM5LIepRAzsPo5vGE87ZPEybNXu+qiUyjELr2qAU5MJC
KofVwWDqAF15fpwyp4YDNl7F9e3OVkEYjoaLQIYSoAcyZlVWjTiiIqn3P+v6ExveZof7r2kmwEiM
Zdqy4mrgd3GLSNa87CRTdq90O6B+ZDzt71RqiTDtGweF+dZESlRkdjg8SzoZyonoQt6Ge4622VRZ
U87yB2trxLAs+g39nJ9C8Q9FiyTQYmyywSTVpNHuKa+0ONpddwzwFDj858vr67NHUlt0ZeFNCcZ4
QmrgZOqAl4TyoFCz2Exx0SAwkaP5H99U3NY95shl3zBh/YfVLbTVkf+zc/aFlTYUieP06G0y6gbm
FJdVys5RvVjcUAsJv9oUp7DhvcozhuwIcFp1hWGYJC2iDzKLOXXKEo73qvd6RUYJ9/g0lNIdSjym
3Au8ChpcqFYMBhQq1gFTBKwd6NSwXC26CaDujKh8jCmjZSOZUY4wVoapwQjr18HDbZaUWC90dQx1
06eY2QDVyXfnZ79ygMeqgi1FXJ06YW1gwm1t99FhsS3Kv//8mlRmlTuTjQic+8Ye9QxBYxmw0b4+
hqPHsPzrwdaX/Hb1UDeFhtOuPTYl+yQTVpP2vnPyF8CviG+htPULKLYkqEnd4/Yg+5Zu4K4i6nHf
gVwTHC/A3l7CDA4jELoJf6+bMLGyfwXS3vIn7BzqGOomd5GNcydSRjyP+eBpDL0DQ/Qyszc6dR17
bHX6YNhLZaIbSNpbS+hxqevVycal5Wnl2qC3mt4tgdIbjNNRWAfVJvGoN+nREaxJp2KgMt7NbWP4
iHGf4RtvZA/t5o4n4eVsf2yiFsTA0na4vQQyjWP3RExI1GmxH7L7PAccqh2H75agEo1yNtTSVKR8
6BuV4Uj6/vozEgIJlookyDAjRHVqrikJyzHeb7o06vuOx2Jax7M26NY5pEIRqOfQdpk6YVhM1gMI
yN2aAXl6Te09AZuxWtNKwKtjvU06AKkdWgbEO8r3CZLwing1UhIhmMaGAVX1XpJIMMLPn041YtGK
9gUm+IDu1m0T+wBNNekJiZdV7KHewoAZUE9bLoE0WON5/6Jm9/BapGVv9PFslKEjyfHnIZMavX8t
MnbdUIMy40ojJoz0ZOD7M9EBvuPxTcfgRTj5g1OvIjmr4PwA7oWMNIBNCnN8yz9AbLPtTGzf2OMe
Y2Pk+kl933xHL6N9rOpaXMwMQuAUzT3jZIqQjru4z8YGfRgovku+MdMCYRIlCfY7a8xIYiHuG3JG
jjR98K5+zqByiP788j4ipnAcQpd7GfBstVhySlV9P5oHq2CP1mVaeWDwlWfj0c9Memph3J/t6PE+
a9BbKREg0O8GDrfpH6/y06ZzsovQdJiJ5mAbm7NVusEaCbZYhe82klD0sAAYEhNj+EWN766N6JfW
RiRu28cnIgTdfNGMSUans+iVk5NWZ3noRC1ksGhOxOEq6k8BzarEmo/jNicoskmjL8XDkkwZ50Mr
S4LwLn34rn4NjMSBJI6rZJvwpI93Z7H/dscKttGCIEzfeG7FjtcluR5V6Zi93oObtiqTWcABcYUm
a3eWq+OQ3tXwv9wDwW0wQTEY88ycJWxZ/ZEll1gIRFfXTBRS7zgXhSeUtDWg5HDRJD+OLxh1g/G6
pDMo/V35ntDrUiFxM7Zij2w7DQq6/SbF1LgQeN5Brehg6mYoM+LGTKsHzxkTk48yXGfhNZ2TWVGe
u7WzgX2nW4yUITyTRxOwNsIrCAH3fFMbi0qXltLc/dUnyRAP88rP/1Os8n/K9O0qCQbe6VBySKLi
Kl4shsCc2g4fXz0o5jgrwfPBjA5nySzlnoAxJ5AKeXt+JPP9B01HX+SBm857Puxw4VseVDToFqUD
7PYf7ulM2ibl+wN+rna0Z2S+vOKafgfG++w7TTuGfCffFmInCmb891gYAkFSWie45qeF44BrPwjZ
tNbiXnmznTYLSZe2mOLZfP8MDgjw26FVe6ImhzNArXGvrmqq7XMbW4Qs9MTg4nlopiXYhH0KDN4W
0exE+DYXN3QZskClMnwgUnnu4G514tpNY6ihvWCw6MWobJdJp90Hc1UUKjv8L+4k/dFTW7yKWKrB
LJiiODB3xW7lFfyWT6hbvDoQrrReOZuZOZgVz912kw1B2DdoZpviaJWTUSbxLOtkOcFcCuJagDg1
y+TGIjwBNhyaftg4jAdUd3Ogxm2yfBtzLb+D4GB3rlVcOWVH0QslHjNHPI0Z2gnzsRAkqEMFjENX
P56ezc7XnZ973jcyqSXTvHfM4dxZQ3v7fA9/P6BFT5PjzOI7XPJxB1yyZVzxdhFg/eJYuMmQAZHL
R4bygOkJmokig/PUCN9w0mRr0iCuWIZCyAWWBI34X0ZfDPIdcJeSvYK+ZeTbkDncpq14mYLmw/59
7/5hWKdNFtVgin0pZnunDS29YvRz9gvFcsi3WJXVv8r/UIP3g5pXphaluD57bWrBWwrh/b/5BHJa
4c2X/fBDdGGH6KNmwbiqJH55uk6mCFcVZ8c0fvA+Wxd0OfbSm6JSdsHFYIfP81aABf5ez0euEuc1
ZbikpGHKNrjOgYs3sZ4lEFV3srUti4qGxBEGKeLXOTbryQcTVp4H4XqLkT2LghYRqKSJES/V/udn
Yccb1SOHTwrvy9yxYuB8w5LWAj3pbJbMQTVanz12O6idTyej/M7TdxNuAzitX30Y+08RPIEn2P54
iZQzbpPIvnzLxpayzjT38P+jgBaT9cIsoqF8U7geeP/nVdOHoL/XhFSA/vPxMubN1nD6F4D1Vgc6
l+x/6fsy0zzX3RomoJr8Xv1LwbRGN79PQdtmOsPrlM7nYhtDsF7fr/sPXXaKsL1ydJX/0QUUnsqo
MQniO7Z8y9M4v5Y4vBfos/qmfJQYkJwqJy4c5w6p5tSbe7lWTKHWgI7P7UKJ2fkagIVEHlpYMnIE
70modWYNOzYio88keBj/d1N7mk4/NK/rGoQnxGF58IR9x1Uo5nRP6+t+N2ixHCrHX8AGJpfBVlsV
W1g4suQNl6gfMLHR7OE6Vk3jBqKsfTWIn/BeXQopLTAj9ZgSMl/4usO2e514Cet2VKftoqr2uzqg
8sNqhSMH+KEfBzaR/rFzhrL+2u4o5gedBhQKyM5zqmPqGxITabVH6osrPZLTQ7yVzLXHmkKXIFMx
ZkLhIV7AVnTnJ8nefz/9YeygCCrlOqCKdQhRrqMdVuYb5hcakaRflSdDrj5L+z8xtNbJmJUw4fpQ
G5jmMEyqRLD9JFNbb0/n0WuZhLqbIcgDn6JhJfsJski9nPPtAn0n1UgL5pKsvbN0PFHzLgsYS7n4
qmFGVQKShTyFCnOvkF5Uklgi3fh6u3+hi6mIENgpm50Tmy2/bE04OhfjAOEVmpgeCDFf+6lSnSqb
IAXRDJgNdJWzG1nUl9KB2QXWqb4ElsUObWblj9TgxEbv2q/rizPFfeuo2IBTjNleg9qgoI1VGDzL
46+r6VQmjO4rHKhlln10RJWCvXND1a4Zmksdeu5JwgCk78RDmXnax/FIG+vpFjzHapc/sTnIQbWZ
uZ9AbcRHz9l78gexbzn9CnHtqf2uJpK4QIlhKEWUvxBY1+f3kb6xHiW/tfnVyp4hxcC4cos8N/YX
Ecv+vPRQCnI83baGSzNsIMnZq7mcLcQp6k4hzhC4UnC+sjzK3uKKLc8KFyQUB/NxYH/OI35QylMr
fOy/BoqXUCGOd02VyXuFxywAOFmT9ewtwSo3Ic05dMPHndVaPvb+VUwSIgd4jbyqWhMT9tpPB8SL
dZskZJoFIJOwJm4ZvY1EN8rK4fMjvm4EvY+HuIWDGZnaavCQeJK48NKEKlBtO9LifwZJpJddjNDi
iEpTJp4lTnqB2xpImxGFfdEsGUx7Sk0ZPbL93SoE3CZtHFZ1URc44z9zkLAYiOfurcvR2pSteHKL
S73+Z9wVqtK2/Ay7S5VvSFaOa7eUZfr7zfNQz5Wwmpd82zL8/qaaWspFZHhwrdXK1Lyp6/sGvkN1
dqRTkcgpTb742yJK1mu2Dwj3cWSUBmcepv62Wdch3cY7e0ZEO+yhCm6ouVYLztmn/C9gA2zuHiOx
t0U2eGgZJCf0WRFItpInlsX2WViqe9p7yJvVk/PSIUtz52dedc1UkeY8qtWCYQbEbb5jy/bsOXDI
eMQUXE3QMXdyhY2Okf396LiSxBAgj6te3mVfLIOHc59J9a1HSsqT4Blg90elrvzyyQv/7urEamac
lAjtlxnpTP5eSgLIRliTRhKiHP0ivEMZY29+fF0W+Twac0+oIfrEmC2wtkGPbNf5lJiYD5jKPacV
xTU3vnvTWX8tRAyBeWn8ZZajRUzzLUwEQ3RDBXBDVdt3CXMTdrKo7iLzLXb+353Evlj4bmFcx+cf
/Hc4tEvhImLeOhUVtGDcQ6DivN3MDWCAoibUBPuFNr3aZQ2Tyy+8B5SO6TxlHc63+yH708MWcKZO
6tL4PdmpIyX9ubJ/HOykdn6z42bO28r6aX0n5HFNqpiTwnPUDBO/fIBA89yBUKx/+wx7mC13rOip
W9EmIlnc6vIe7wanl7cKIAzpzxslN5v8W3LJY0MQk3Q9o2HohptaFbIhlKWQQG98Jg+Sqgdqa9sQ
oWYyOs2ieaMYyYVyyX5uF69YWo2JpFSwlw80iexBgDbANwS7odV3vy33wJQpSvTUy2ECXt3luDzC
eQoJlg7iczAuxVBf9p14qSrTfCvfYAsKkoahvKIGC68/c2otgSEzYjS11GFAQ8bdkN3FVfZ6K+yA
zNTXroghpjKlTg7XOzMjjJ6Fob2X8D2w4Ao/GNpZGQGGhzrfZZpKcP3u3/McBaYdU4v8bMXmkyiH
3L7aKFlR1DkMnOj5AjBOgjBASdBFuEGVUZ/ZiyUiyXu394Kb2Yu0PR4FyAnK11f8qLpZzM8vPxp+
2NHY3i92tjK+Jlou+YRdWdJno87KlnSmep4EB1DAVqhUiihRe1rK9MIKG1XC+r4pqp9N634b7kN8
Ye/N+gSNB9rnQSPgpQ0Gk7dRuiD3RVuUur1C6NYeSMQmEpk1djL3pcezPjeWjzJg8giCAT1UHNnm
QIrKg8ErVUCct5q9dYa/QD9uTT2kJcIGR5/VH4HKDZQM4Crvu4PFQ1B7Gnaz45KZ4gUbWrEs4Vxt
in21myoCDXNIT7fND3jwfmiiDJzbxRaF4eZM1VfzCoiuJOJVj9Hi5HaCwjwzeqCkZbH8NLHXC3KY
JTbEPdiNYUUpDs4XWpKeDSAWmqG5nspbNlTVFeDUWrPLoH23kTC208+FlorLHjJGMA+aJ90ySR28
KJUwckBKCIGA53xjx7aarEsyDDzIDE0D77gqPNz5RWVYuBwaFq9p78+8VY9zpMBS3y4D77DNGwCH
oaQcNDMBbFyzpPdiSBv1EvcCI0sN2riso0XDn0UIYuyd8m3hXVvY7ZUeJQA0GtHtFdiwe3xAOFJW
O3IUuEbCeJEM+mnNN+YK6net0G2ymd7LIjpBq6pb3Q5unbo13xO2NCNtRj/agEVHzzUoobZokHOh
9LYVDpZ67vsAFm9F0a1Af3rXd+cEz2aKRi56hWCNHAYonLa6NgJBFWTB1xZxTiuRU0RsOR3iM5nh
sbdBhOFJ7weq+HZg5m4EJ0+p1BJvvcc7WFqVVDPOAgM3ihFZFkjaiDnYuXgfeWTfGmhDDNg/k4Yy
2arA7jwriOPZvkObnRF2d1EGHKvRqdVDOHPMVcRIdzQ+RrAp1IMzdemFOEIcit96EnWf3wmJcSha
AP5seNZ8iBlUFfLb3zdyCAZ/Q55FGJ4PeKM5VnfXShR0amGJ0nQjbfcyxoErOkyTcCck/WgOovQG
2wMARVqP028KwRvZKBNYC4aPf9xiGv4pH70OELD4xFsEE1T1JJEHY671WpDnNJs3bG5dLRsC+ytn
d8h/RZbfwtewJbLehPJawxgtdEE+Bl/jvrjN73c6lQWf8HCKoYE23DJbId2NsIszeWuWCN0UNUfR
O/3NAiHc2MljjywMsPim8s21Jy5ipZ37m3vs2HVkvNvNfruqULq3EvvghgyfJfqeeS/EzQ8HGmNr
Hgy2kXeMrbZYKD37HrtuUaxu2ANsjS628gGpPYkxqefbGuD8FxfSo45c3S6qUEQasbuT9scCnMYh
lVFKIzoB125ysGF1++Ec56oI9D6a2vvaaNMuTCCFAm4na/qfk66ac/1hqFxweoCiRuqTkuBjMDFB
CZcAqQJoCRQqEM5Ds3MWEGRavrUHV5a48RQoF5WtryoHyqcxaAoqrMhrn6u7Lb4Mvdxbvm3Kcpti
iWsVB9Ctj/itRGH1efB5R6pmvNLfyVUYd4YMV7QF/E8YWUVntS8Bsl3eerXqz0m1Dx4hvxqcNqpG
eg/q64GGeXS+z9mYODzc8Hjo58zKngwexz9/QoQ3oj3IPH9o1nm9LKwgKPgymgM1VXfp6uoQxS8S
PDiMgj7fWobKfPjlSZf0gwSagkqygAnwfIPMnt3p3qSbwfjBKkHxanfeZiozM67LB9DvTPl4kser
wa7XF3uhbOlR8KMzUWLGzCPF5Jk5+/VOGN26xoaShAXsgqx1E44DFyzHPa4UPex9rJkietJkfZQx
7hJNnNT8L4vc1em7KGV0w9TOGzu3woHDjesRRB3Bozpbll8o6dpwXCozLywWQ4lPLem3bIUif6mN
w5oxlzIryc6g0HAnMgz+YRItrT99lZDcekySJB5KYzYoeJ0XCWxm7uNPi2INfs7veobwDtRs4aP9
wpHRX5bkk4BnJuXUEJsCgEiKn40zijG841gZxPidH1OMKXQabnYbXfBrQe3rUPepOtWnEZhWsjdI
YLr7GB72LO11A+XtFzzveSq1bAmBTKapwoK2GEa7awUlTaGMcaJA+59ic+SVvu+W5WgIHfrnj+vP
hZXSEjCN5Mw+iBzhDAzwkOD0TDIivqZFZUMWGHEfbOAle6FdKzBzmwF6Be5Z64d/34z12FHiZ7zn
P1OIzixr3++KOg9zXB4kmyjNl8XLe+WOq5xCDnXJbEk9OjvMfF2GuuOF8kD6AzMrhjmVz4gV9f6c
/eZobZmnWAv7WjcZ1W+D7XFQbNxQ0erNpGu3TRvITTT6qnp72Wm426vbD9heFsDfpTI07gg7u3KV
FynGwhskvuIZqBxBzh5Ceb7ZWDd9gj5YOffdWgYO0NzZFuP7bTOIka2nqVjgDIwxmk0NqPaIKPZC
SmN/hIVroc8tgAkDuZxnykZJQntrWtCP3Q9AtJeGk2fPsR3bn/y/LyKnywbWoeqiVTRFiHFU2pI2
LmiWu2v490OfeUZ9fW2nsT9DP9t6DiQdZ5Xi+llKnXcCY/i89e+jg61oiDlb4mz/jV9DehL9RKfy
r4QdHY/RU2g3lMKld3GdADK+S8EcsNbJarOk7RYhTdcLUp47iUBzmUFXeOXLV1chndB1V5zkjes3
VOOz7q/YRo2MeL/gOmzdJpAuzJYmdqCJwaBGy1/zUXo+9tOmJKG3Dk2HbCLnP9ArbzlIiA5X4nX6
6gEARW+O4V30ohp3P9R2JfS/gB4Mweq34i4laIxmAsQEqf4++sVinG1VKltcHrECN3Wv+GyCPO/+
v47WJYtjykW3iry6iteOqE4eiTsy0LTKpyQi6Xlf70aHIIVyZP5NE3dpetLbI9lH/OjUcegQD7AR
K9ikkrqssPMR6LQcUfwSee8WUXqvqBduTiVW0SqCxa/tVtjmrNLgoWfj9dECRrNF83xhSTcUgUjS
Rso7E5sbpSmpws3WIlUcrjuGBhub/Ydow8814BN3MLIAjzdSmwQEXYtvbFmAtqSV+mLGBE0I9YYq
lHbY4N1YFPliNvDJRVEE24Onlr8AchiwVm6GZBXUAtGbQ68OCXKN3hLs8AoIbEOyDh0A7k2WruRv
tcpMIV9T7KJRv98+pYh77Cyd2A9fYebuMGdAuypL7YUEvMKqJy5BIXnbigXNoyqrAutMZ3NzmLn0
x+qYc7W3Ba8vXGqqFOaeFab3PqvRwfVhclTLlqEVgL58dpOQxat10N8PKFnFL+Re19kOyd5owUKX
T8/+oo78Sl1A3/uN9BaUM6rj/naEyVmNV4k8g7Pb43fNqSi0nRuZ4BxtuPIWPJEbt5W+ELUv2Llm
Q+l23BItda+RaFfbOf7OxJk58hhx5lHX+Z//QmFII0bjLa9Eo700GTYmTXbZkl3xCIUW9F2I15D+
zr5B2M7Yv7q2nt3Vyu0Ae8lBYE0duMEjiCqcI2Hyu1sf46MMh+ucmOuinotrNNREuzvcxeyW4dU7
urWKB9/V7c+7fNot9Q1KwNPktckoZMlks6NfS+56286K2gfUrD1RWdDl/n0o2HeMr2r/8CPltpR0
UDjB3WjDtiY5Rg8ZWZXTblYnNuVAuO+6a2h9HfnVm0NSOeiwQX4JcD2RA+o+tuVKgnACnFrFCv/r
wdVqJfa5M9w6s43HtCimnXJ4tQNASi+uJAl9cY62nN6tTrgwiYz+qoGBFCG6dNSypDURYhhI7b84
R3YeFn7xU2PJidvBPLSBdH8q1YeMTgP/8fYzwUdiZltLgy+N5tlTvDEn2e7kEaOyVxN8ebbOoO1s
xAFs27yI4ptQF7cngB1dMnmZWOi+XynxFihHKcSQYd5kjyAUArIqEM/ab75o7xSG6nKaceoDv/ne
7+qdC5R8UbOAvz7ePNQq33kjNpggkwoTBJslQo2xByZx8CB4WNVx3vo3wX7pGuhJdj0UElwaJpTQ
a6UwwNcXB9ipMdfkZ/VXXxlZ0zrTVSXSBe6IkqpYGT/1SDw4vfC2p0hr+mQZeAoFc0mPwJaTK9cm
8b5Jgdp9hv4ObKQyFtjq2wYVCKHK5yR8OgtKHQkCLi0sV9WcknI3dtFo8F93sC6KYQ+znDPvVJzl
7EeUbItm8qDokJ1+nLPKN4aOb0njzCMXMq2n1AJV3GjGIYtOBHseUNcAA78XNGhe0ckOYd8TMgg7
geoDRRh7lgFEPnNeFG1Lh/B5Y++nFQACBBJwttBleXQptfKLiprDEC6wUaJHCPPrR7YTMbflEmE/
EL27NaTG5CnuCdF7p41R2JxBqxkEnP6/62OSG5HhTQsu43P5YKNrhQz+UUPvDaoBkuzqqBpcE4OT
wQjCZaVjl/3WsgGKCucr8BlvZ9YwyxeBTlW8s0voORPha6kd7OTgTwaIwp5Y4ESit6JXAIEbzE8n
4rANAVqbFGoYJjD850BknQHiUF3SQGcY83edyzoskhAAwf+YtnFMGyLWVtPC62X2lGFbas7xjcZF
WQNMSeXj8UTPt/59Fvp87wBV5+YZSYQDsnVz8KyFQL8aFH+WG7kTfZq5GiRXFWB5OZgLh5Me7oGh
l+Uxk76FuCWoKA6avq6/a2pPp7AmxjFgqjLOmiA5ThU2c8+EomwJaUW8NGUUXG/i9wB2GAtIsg0a
Y1bk8mgP+HeqZC2mAfgrFBXR9Aj5DotQvXcDm9eG5zbuXVGYyk04BeRsOaH280uML1u61vM44V8r
wFPl5fXKOOXVCnewJjgzk4p/i6YzMFPOEJ5Cxf3P0AJrICjeOv+PiXs6uXRz8L+pfgZY8Y60sMD0
//k9Fra6QHfe9BYCMvM+9vD1Rf+vjfhFx+FGtcXT7ZtOhkztBxJlxkUGIcTtCMRaajapvsg1dqya
zs0USF3BIJnhh9EIw2ChvCAiJXyrkfcw63uJhC+DeM59Pq8vhOcmt2rPFRmeG6CJzw0JcsJRuAEX
BcBLCK40Rcf/DY+Xfc84HsAJMjyLpWZuEOalTVMl36Kg82/aU+fCexHbpEYa9jY8TV2IynzeM7q4
s9e6QQCfVlcQyww0Jgkpcq6+AgLB4eGegIs5+OmOa+vK3MdJr81lxcrw6KHwBdQpqiW5MSNWCvng
kAMET14gwU4ThCvYBML5JVzctHLh9zLPlSrEj17cfatFlDiGvrYA+gY3SYliKa8nJzHuONlpz5zN
WCwrq7yQQ1REsjh9pBFUxtkYhkAhs0G/cu/veeDHqr+/jPnQnevIXkDe0SKvz3BVudXNJX6zkWGz
jKyeN0AtL1tcafGOtd0E4bzsD29UpcrHUKlt0nXmosb2FXfxnk3cFWSQm3YRNGKnFdPmwzdo4XWp
fLzIx1XYfANPaM+VXzOMS/aqkyyPiuaIyz+cvcsA4JP9fNltwVdDYNQvIc4Go452g8pNvcp+wM85
AXNqInGJWI94LZ+m/H4XILNCfH/sf8peQ+Lcx63u+GXRzbIOHnSO6ambs7TntlvveqOpCLl8M9ha
eecrrNKI5LujMuCVAit3nxBSN4y63n2+1dqXXQJcjgTczA1HowHw8U/xOMLYNchAmdT4HxEu2aSh
CBZi+I67c7Y6G+wu9G3SdO34SNp0sUdb60BAtXDTh7kOso/hI5z+/ZxaLxPHtxD0sryUcdjwWbLc
o10ghj79xUt9dVO9Qn7SN0dAPvkMN+CQJRlfepqYIFXanPJxuB3fazBLbFsyUVePjwMbjOHzd9rd
3Pn5WJO5XLGPXKRRV5H77HXCyhuwf0gMnToFTv5d/uD3c6Vmio0eCjHAX+2de3ifduXjxEpSLsae
QtoB0VqgceeLFnBpeuZHCCRXf4Ko8OA5KILmd0hOuZVebEFMhxY5H4ZpCW7gf7rAGweZ37h7iMig
Mqxgi1soQc1hMQAV3nQ3H87Wzn+Xyym9wn5ClvuZTl/YRzzOpuRr9L0M4Sf0M/+A+bliOJZqzhor
8UJ+0Qn4SglgNNht6t+XIchEPjGH4xD7uFllVR9/EZXcAl9bWBM8Li9Yo8Lbf20wes3Ajdq/io7E
EzR3FUpRF52gmAG+uPP/8VGb+diUVZ2O/jbaRqScueUff7sWIjOhInHYIwWAV22wFN9FUAUJHWsg
IFkc3PgqV7uiEzC6zuRZfju4e2LhMEuavM+mxRXh4wpasxod5Svvz+WvHpDbDeTL/CwgKm/VrsKU
4xV2zlK+1c43B/V+UZoEl5F5x04l9WcY2sqrBFmAAxz+Mxp23UGK4ZJQV2R9lSo/Olrt4mfMhMp5
CwFt+5oXO9alizWMoYTUFlrGnFt6Mv8UhMHpdWNdI7e1Pd6MIVDyrCAnF3ifFmmN3xSMigokCjEk
imKX3RwCQ84+atIqhojrNsqL6uKYBNpS3Ac2Y+uJHyrEaHOoqNMNMjKYQf2cPmDf4Ocfo/JpZkQ0
B2OEJwHHMw0KJhn6rS1NfcwKJ30xv5Dcye5voJYZyVyfXd2eLhBGgpLqTJGnTYiA79DfseyLj7Ux
61+2I0Xmqlg3V1gv761TuYIQNSGZJRf76PhJ07szdsV1j5Ae/236glim6vOe9wbRoeq/bF9G7gvK
qnJPIzz72C5B977P/6cqKhTSQ21JNtM+ED3y3IUZx4NUUw1BCHfpp4lA6SynE3Ow3TzPM9y3R7U1
iYkOxlvpkrt930LX6FCZVpbkXDQALIxR+QpZEHqAsc1e1El7Grf6gPRO80Rc4gO4ytYXqF+ZBK8W
Wp7sCDIRRqticR+gifgbodeOdJL/+6qwyB154NSzND2BNkEmCzg3n7jmkUozbHAxZCCiWeQsDVmk
0P9rhlZFi3K8TP08D4lWIGgJvK9YelAlxGPGDJuQCYGFJGbMCjtcXRUJ4iOK4ZHrYZKW1yD72fQz
w5P1JHI2VGfR0KqmMF9nUIj0Gd2nkaQf17uuAUklkyjh4l2I4jSRMWMmzQUD6ZsYcQzKF7myyfQl
Oj07w4Vt4v0bh7/XlAvxqEe30+PV3w5w04wVzeeNGnwF5BVpmeiTgeiYgdYyc5GPdY+KRLZi/BB6
Nw8T7+KAaoDABTdsjnnHSAYlVXdHNLWhFfEOZKOoJnDdVcpWe176YPxM2GSz7vf+F2p8FBQe3Hay
R9qhDQATfgUFuCaU3H90N69GAu5s1ow41LOkUtlEnE1sa1GZXS257xfcuQPexlO5ntVEPtPUlpHY
T3fqvbARpRD/+9Bp/TqDx7pmDPUfkgV1P5Np2mP/Kikq0bpg6CBNPzZ3bgPCGk4r9BkgWnwXMbvR
4W4YabUidq277V6i4lqrrUwnlwyplsB9PLvEu32iXvksrM2/YtvfMisaZSqPYMHJRcNyix3TRD0h
t9fRRdUhmsgMxi306gPTmqRI98iXhYSd3Ve6+xR0UxeEiljSk0njzevxlXfyVFgi/SEHb8Asyz3K
1A/UCyPwxgr1UUw0ZSFOFEmHhOTEOZsgHfLyqCVxgWcgIDe/sojZktCZN/4J7BitCJuhXOsHY+mc
8zOwlU3fymzsOw0BpfzBvZ7BakLt7J1E8yM75NcNp3mglGRoL4nxeKE8TY8/w98BYNa4D7CpRhzQ
/bwlk3+gSUhJlNjITn7+hqkywOYhp/ZsYAtdCrjOd755a5/E8XScw+rsXXitvC+4pyA4oeLeUpj8
+TSowTPk/BWsAsfSXRt1sQNF2wSlrw9Dd/02OcUq+gAMmVtAu2StKbjJe//20RSx1h0gyurdmJ0+
uRwL/53j4xApJ6jZrIX3pNWv+mXm9D/F+6R3yJCNxFR9rfoV5xoj4Xsg6nd8g1A8WqSWWtHQmulT
Qb/y7/hm4fXikBj8N8fSlQMBN2o+n6CrGM0kVaL1tIOZhJKP/LTB4T28+mI2lLjFPBU/SQhobXwv
4U3oThGbGcRVvLW/WOJT5FHb97wcdvzVM8CnzU15GIICA+e4Hlt0jGxhbsF1f98kSAvwyjQOYTCH
7oB6o0QO94UmQ4g80nXcpSQ7nDF8eOUtl7NtIwsgpE7blNA0mlZN01FEEzzodkue7TdDRQ7V+ql6
CBj5jHKcIlXLv7qZcXqh+8Bv4yQkLSkFogLmQej3rlRT4FkmV2FKhX6CshrM1pvx1X+eP+Mf/EQm
CR1yxqkTMDbyaHSYYQ9vd/YM4UAsqS3TvBOPqe66a8KobCcUDqnFlT1NO7Cr7DcbPBNlTmOhxrL9
8/23pDjQvXKRhkf+86JE+R4gypxQPSdwNn6ULcxo6R6U4e+aOkRyIfe7gcxiSgd9Uu8HqHAARCJi
/U499nvIPwnf+QclzE7iATaWqy3uebKmuSFLVRdpBD/pauW65R8lG1EVg9uT6GWDQrMES9XiOdrV
pwDvGGLjJ057n9DIltala42LSFsRLM9mbUo8xuYjFA61c03QvzunGnSvyVhscKhij7LUtAEw9p5g
q1elcqyqLWT8kXHjitSDKrjnnR0cd9p1o0CWxAz4j8PlFcmXfyEtHPj1JCum/QTLRvePZsQDg8n9
N+TZoWL74vPwN+6b4A0GBVsB6N/7ACsnOlajYa1OMXfDquVmjNpz4cOES3u26AA47cV/BdZ0TBY0
/UVuySG0sPVS5+q+W7CITpa4YmFdakk/EjPVqKXUF0sJNHMPKc79qCTxzlxYaytVRUFryYrAfwAh
UEF6ZLRpct9nX7hB8cKvTIUsz75lAzgLCW7UmAYiHP3FgLC9/43JXeayD4kXfU7IembrirWNMVYb
iEDJYyMbBTSfx1EKfgdKWenxNp9dbC6msCmLN02IvV1pBOmImwvqmeGCxC/iqOe07quLQGctY98R
SuoaSAylMyHeZKxWWmuZfBMLJIUInZSwjXWgBA1zOtATvtqRP2YC1Cqw9bzIarR+oyvMS3/meaih
6+2iR8SNU+w77RP80esKFFYcyniELK03o4PTU5U3jgc1HXvML/MkcyP94VwViiBZEKjDBypQfNUK
nVoQdcYWdtBcQRxEvk7Z0/EMaoILK2nETOKwwYzkdJojx3AtR6ApANkElOmEUDrkqiR2H2BscBV2
gNDjEVdi7yZMCw4LUzsd2Qog3JBdZyQ3/D/mf+wOBYloyiOXYO3wRK3dCrWIzwqKQ2971IhMxbEO
JDjo0S7oMcO/m0nHt6ns1PvfIisFjs1hM0javyGBvuli6Q22VF6odDOKXXJDRx1lCLAKvnEdEDjD
Y3rg/tegp/pH84T26t8x5R9XOXlJtjszbiS0SkM7+RwEP5J88Vakdv6DvB3sH8BXfy5NmxmrsCHc
/oq/ceK+C7kFg4U+93Nt+TJxFhGbF9/BLuydm+ZDUBLhCCW8PEl0/RVEqxnNtCK9NUiHBTVleXBl
pilz8DEzst8PbUzNmQf+DC1Qet/lW0GMy1S7a+kvWpGrdBw887WoSWIddYPPAnB66jkpfV8MRT1N
uypf/29VmvOBMNfUpKb1pr2G2neZsjfrYE7lw7Pyj4TAlsUVQu7+QTYJaEx2NZgNgfw+U7uThjxY
4TcfVK8wA/ezbWzgXqiiX6ygsocMNzVXQwp7Ovg35Orci6CaX6Dms6CbyMO1wcOK5p7aMZB3hw6a
dq0zxTJjtZe2nC9ICqZU1ZUSbveVgKsh1naiPpRXcoab5dCLka9IhEpTfA3hFaMx+UU6aL9iQbi5
cnlPRwWVBAbVo8bsu+Zhc9pYZfp2WVPVloroX7eDru07yYdGeisXUadSccPTANurIjJEf69ySyEx
RvCLlPZ7DO+FVrWCRJCTV70ohtf51oP8ku8vJX/gQXVVwQwMJtg5ukmpIrCCJ1JMdaxvUz2jHBcF
ZN67L/mUaBLI8Rcc57L0ioT3GrO7o2CTi6LqhGkXZvZLk6hBR7beoe9FWLaT/xIIFaTtRHaNY31L
S9Ozw1/91GLKgEdp2igkL49Fd7rp81GC5CfD/kz6o07Sy7g1mGdPCHUCMn0nOTVaoXPB7gnpXQ7X
INv/1FNx4u5iknDCPI3E2gLXEVerngkcpVNFs+COeTMBjTTLuKSeU9WDg5u36bOJaHZcJUprmesQ
XU/eFgu0G+rRPSsphseiDZKTpYwx02iPJFasjDryHpV0xjmG6M/HBAv398jtZcVZIcz2WjbcaYqO
jQipLMSWXZqxyFc7Fp7rxVWgVyc0O0lpvSq5AiPfqwWKE09T6tb3qnsPneAQLtd5L2T/HPX5ZQJ1
tZMvE1ZVGA4wk1QXn30lwpm0wmpP57vNTJkNBf4AIJ8l8mififmpFAbr9477QvxGyCtvdu2tbsGd
sXTM2sIuufgXAXLtxL1wm/PLAZLIwhATB/0eEeCtOotyD/Xeqrehp629u42DhQK3GjOjMAxT+Xx+
fSPgF+1Ie7qPbsCAHLRjHmJyVE7T9sbI4JupoI+UTPLU+S9r2hvmlc7wLtZYN9ic6eyb3cNsgHp6
TsqVwBmE4DMSwmOymnP0uRm9I45Xr1i6dLxw6TyDxiP2yMLkvQW1hgES1G6f0QFcDzb3vCmj6IwX
yq5sYq32L0n0fQKt6yAanB6UOzVw0Z5cSLz395mavNeX0MoID/Wh7D2O6dbaRpQY1DuIQ1SSre6f
6Q7wJxsGZIimAqpZ2/563vtGYCQc/F7brdYFjujqDoHc6SLtxfktbcJEo2slVAEwMUTD+NRFsf5j
k/1UMBTSXVIxU7MpJQzg3MMpho7rUFdg8EVhdAOyp+2hoaTSdrTus1MVPWUgYXExppZnJP5lA20g
9PWVEkpNu6Gd066i9DiUMUOlKRGTplBglB1+flUgj+ToUzoTOOhs5DloRtpumNLBXU8R7So+ivw1
dQexnfhiizZDtikJ78C52NwzRCWWpnYs/8n4Jwy4WmFeB846cdxy8OEGd+VZhZEADAPdycx8P+4m
b9kb2vPaXjv8oXpqeD+O5yWNXnzaKLziduWPvDRt4mCFLoQY8UecbS+UKWylDYwsXUm2T1NnlW8I
pBloSlxnQ+47aF/nkyEccTAUDTmgZrfytKwUi9tVCylWZY/88dEuhABbY2stXAWrE87i68J2Gagy
XNVuBiim6Hr5lnJKSgXQlaiD9VcWubvPB2GoQaf/nxh9LLRbzXxxxBXoR71i3FuauwiwMK0IofOu
Z+kEIK4JG0trUpiPeRtdEzEkITXOfbKpJMZ4313M22nRgTCtO1vXe7dDhtcofzMwQFv6WulrvsMk
ZETnfK8jhdCBrbF+Z2DKaae5hPJfrD8ufChggxvqDF79U9YxoB5ms5RZOTuc+2Bu+paz6siVGYoN
5kgtQ6+DN7KG6lsOFWONdEEkN5a8vgXjq2/QNfdJ8Xb4psUpoYAAY+BCWxwQ33X144pUiVVwwlZy
6yIdy7lqsJKfBO4U1z450jRTqjcfjY6IJUHXRsJuLck+FPGqjMSTdRXBzNRxFpeseb7Nn6GlEl8n
gVEhMwbd3CdMPZiI3rhzSyuvExZe5vLhg2H5MVhJV6BSkUgq41mRZ8fLrv8hpr3gtWgPqMNw2knX
atpVKl4fP19QTn9yqljzwE/7N7Jgsp2I/vkv4AgGtRW5C+zXER/Qp1WGoh37sU6cZkTkyp0bmE6W
l5LzN19yz7Y25gkPCGM+t7A0YJmtmYGp7xq7hd43xDlQ6F3ccXKsR8GHgQPBAMRX7RBY9pzoLV41
3IY8lvUM/V7dsG00aN3PNvWR0wzy6084hVqDOxVmI+uOf1BxDivsj/Cz9LVOxZv6ecj4ibDd2pCK
PhLCXyUH76EmCwTaGFrA71BQnj8H+Bc8bWWZipXJ/oByoxOqIQJ6fPnMTwP6fM62htDRMWKIF3Ij
E9XtvZcfezWUL/8CnGeFtL0YtB6FFuL1NwDHZPZ2AYBDtv1SNY3h1GNhlaMFGMpqKRKxq29S0hah
lelAqtKWx2DXTxLgzEEZvQCq8JupveTbX5yFC3zxS4np8QpdbeUPz/XkxT1bvh97WdjKoNLaDfb6
vvA7ngFNA5yGr+KjcI137cv7AtdrdVqK/0af6+E6CV/6/92wBNBTaXbWxVawZMLK5s2v5/sJ2Bge
rmE8XusoPCbYE7zZ2e8ug/TrwXD/j4dCkgTFY4AxiRxf2vfpIbIkI8Lk1b8AbvHJ7er+oy4X4ybD
3iMHc+O2WXfRNk9JeJd+zPpkAVZ4eKK/yNbxgrbRrMnBLbmxP2CEPqctndqLymQxFekDg0FPzXsj
jRzdkwUnINaUsaMp3RHvGv1GFOJGK9cVU7nTwTEnT8OQO4smZQgzEbZ5helzmsQiOY1jrqpfphNS
CuQatVLjYUfRcz6DCwJYJdqp0zhRhngA4Ky/N2yDlD4gI5tn4pBeezdWOSSiBfLYkeqKtSm9sgZC
ihu6Cgd7kpgNFVG196/sJt3qNbKeR6RzaQyzbQTZwixfg8EdeYfCjLGg+SmjQEf/88XPau0lnhEJ
+dertNwbyQwkCLYP6UlZnHtiyQxwlludh/giyir8WUi76txG2Y1XyPSY8Pkui8qswf+j6J5HXFSf
407/gX2FSTdeJ2XoxwPk6NUyPQQklh818zVVRpuUDlF6WAIDdCpukof2/dUslyWkHnJJFimUYniv
s4P9I8UtLodAIoCjK0z5fCEmhhil10IV0HMJd220cZevzcKnLc29V1lEIrlg6HeyICChl0Ry+PeL
nhvj/l85vWSmgfeashGgIHnSF9pGlcVUKIOnHtDDH+WCwYdqMGmz80wXl73S1AvdcNz/H/CBDCxO
aY1r3Y7+2mj57ShudS3SFpVBRAdOszaz61uaFSUEZa/K/5WiR5KaqhzRMImJXCnRHBQoqcecBf1x
xKQp+u92TBW+vJyZiqWhx42MSAZUFNXnP0CZ/9dk/eH2JTWQmVNwvmvUpiTfW4ULB5gE7uhg/7SI
p72GFnNWII0b4oDhxB/oUJuqk0tmJzaOIx0quqyb+qJnDUc9dGMEn/Xou46YEjPPFRZvXF29Pgml
nC21lkgWde3+J86va2HHV4cENDer0py5lUexEOOLh5UTdKfafe+dsR8bbu5YoW1ANJngDRTkRoPU
QGNJKCnj7tBl4UOcOJfWvod2dY1sFdMqy0XofWXF5rDZCiOdl6lgDwF/0yLfPkfhSJZsBILRRoFO
6QxqmB1Y0lVkuvHNJxxfsZfzHWVIntuOE/EIrXvXab/3Oc1Gp2ORUsxbdl7EH7eQNqgRvFg68a44
An58od9fL8/uvk/Tz965r8dHPI+fR5C2V0t6auOC2wRnbOPpOCVAjOBO4zVrqdOEpMHXu3Dz4vlu
4JtnUPJ4VpohSQ6DaO+Ya7QHTZbv7VE2Fr/7VmJln1IM/W5kyA0sFiPiWNWNh2Optxcpt4/9QFkF
muc1T6eUPYQRYpoue3IpVa0Ut+hzCHjcsZGGc38L9l3sYs3TdEt+eYsQ6Rh3uOcAbshKFON4lokD
TwHvQsp0u1eibmprVado9K1dUoN8fGSWA7RdrqZrva4F0MhTNjxhToJ05pEDFRKd5RKsIj+HNAM/
Z/IbMpGJK4Rob2AtjeUFoUeSm/AmeEwk2DrFMyHNHIHGhLr0x86LLnD9qvs0NoAOgCvyXUSQdt6B
UWu1P67HATwPXGNQyOlsa8sZztR8w8zA21BSsyyULklxW075kHyw5bW9iDnZl8X8pakwwZgRtC2N
jnp2r5IK5QY4Dzq+0GG/c9Sx3tLEM5Ih01vmk5JZPEKBmn5peX9ZC7MKB9FhoX30ar0Mbq6+rcV5
TwuRDtNB8+JsNc7GV03zIZLXm7nKNkFxH4v2rHwtsdsb/1usx1KZgSENaL1pN5DgKLN7C5eKSB6A
G/xgcB8cdJ8I9xhWq+Xu+J01ZgTXp/5IsBG5xbQxcTzMpbpW0lY4hFlFlNWbsItwgxoBu/Z//AYG
3G3TWCqDrM0aSYiCa+PmSCjCsTNf0ZpRt2ynv1jcaGrIBjfOhMzhwPMOJFpvqOxslO89kA/Q3xca
bXObdfureTQPp5Y0F63edVhGUp+JXmJ+Qf+294OxvgWYz2jR82J6ZcuYA2xDFUuljctGxDkYtpgf
hCzXj5PMmAXNHADXY6BS3+p9dkhH27pZsca8KbP8YxiTOjrvye66bv9OmTLMWDnkEmKyyuKJvAFu
x55/IT1hkCIGYS0GVuBWsN4dORqBjP5eYjifRU7miKoCZyqDQ5lz76Ukg/+IpryxD5Ift1tv5tyw
fjr74dcFXx930Z1m1GnnVjMtjHN9Sc8c+/B7gK3x7fP+zf9UTO15x0weaM37XWftRfFs5Qj5+LeZ
EoOQ6weAiXtRYG191Z7amAzl99N/BKCuuB5IDqC0sIpcbDy+Et8Q/6CEwEH7mmFcJj9JTOJi3bOc
U/tmnr6XMUpYkIgkqKZgpas64KuXc3dRCD21V9HGuDSDylbeEipuNdvBnQy0xlE6Fdi4kHzAf7df
46DoC6JkFmVl8UraSp7vUzoEI/u6oxaWkqY+uMwbC8l2XiWhOc3Y+msxYlx/RVxPITtl/gys8JmV
KEE9szG4CaUfOaoR12bGcVfdIU/1yJfZNS0dnfoACZCGuvCykChLFq9D7WGIAdc1asAzwpLlLc5E
dkpccO/GwDxKZhT+t3WVZAbJKx1+DZIOKCSriGupp/vmUsXuvoAarJD5h7XqJI5G4RbmvRYGESHy
dxoNGKgPGLcN59Z9cdfVCTtAHoLu5lAxJTkS05A6hr8rsKZ16Ruammsk00ghi5yuahpa42CaWg/j
lE4wHf06YLFBiPqW9I2FRtNOQmjSjPCkpmDORYi6a8+lT6koT5CbvNJCWDhl1f+QL6YyU2KJU0t/
Cd2CuPCZcLU7wDAHzLFbwsaY15BdaHEvIWlkjrU57eFgDS2zvQVj0KSVhHIJLbFExLEQqE+66vtp
gpTNnxBPzx/PToeDfdUzfYWmPm+NdegN+Nbq51+5dJG1rkIqKEzHxlYY8U2bVwwkwitd6ncOavhS
kAknS+rG4bLj7QpbPWZSvP9S9rPDUgOrww/tfwEiW5y+7DaKBdblYqn759bzFkYHpueHW0gMDaVq
mAi2+FFiYZToc0kCNN08Zg1/jcv0+RTW6B2tAGByKOPxXZASiF146g26ffftH3TvYnsWvilxLkC7
mm/yeusmAOfOfPeGCCEiyOTRzfouF51LdC/eFrMWTrC1bx1IZ36pXdCft4SiQG8dcdouCcN4Mqj9
q3TPvR6OUDG6UP0slrY4ivJSke9fpOidYAnNohw/beTFXREWCKtjwPmQ9XGxjSuKp996zzTVMfyF
+VKAPdsXqFxT0oGrfdlqKZeZCizzLdnfG09WH8S2eZmeoYvq6o1Vw7dKLNDjg7/0+DJbA5z/Hbi3
7xOagnWW+iiPllz32pKm23C509+sh0FmEFB6qRnVqaZwUJOeUiGIR1vtlNPQcINICC4wbOBouJ6G
fq9ct7JZX2f3xLJNgBsViZb+WvdVDSfk7IQABD0xWW16H3NoNwq5y57CwZLC1517D9JBaw5ElKL5
vsBBZTJhqZY/JmN0bNSO0teJ2tjEfuekK1+Du1fzX2/F8fJphkrkMEfakcAogUnFY7JdKNGi++bO
iE4/zoMcBCBBEQjZ65aSk0be2KOyN5sHkw3GQ5HxByAtFpf3s9DNEq2GxOKcHoFequoV7TX2ZWiI
D6tLEyX3spEpEFsOiXayun0mhoDux0K9LfuRNYZNfoknudQ634Mh2SUw49uwJo6ZsX3j52KmJDO5
iYOG+HjidJEU944CIy9TCxmoVDiBClydGlLDUGY9sVBxMOvX+ns+L3xGIyCunvPAZeu9UoIqqIf1
Nadm5tUcC5rJcUgizIx/8q+B5ZjyhtEWtfTB6mzytfOH6D4YtkPvWaVsRHQJ6lXUWPDgibGYmEXz
lXKiUDl3/zyJihWlasH2K/W2mEVMv9cOnYNpa7Est+MT5AdYWElgo89d86H/er56BVqETkxnhnB2
ylj1bWmFVUAeBLwKNSogi6ZPhYr+hDPmczpPjz0/R7TL/iJ8hJMnf5ju9rIJJDmgXxFUM5NycwWu
5zkClx+kETcMDAnSvncsSEL9vmYqb/aRLHYxxZs7Ox2B7lOn9KufbpKFX9Hw3UmJEnaPTsxMiW3C
jZw8GgHvo2s0mzfffZME/Maqrc9C519zy+//ew39ksFrHdttN2VRliwjJ7T6ghNrxqQJ9DPehM0f
DV1DUsLfxb+mMps/ZPEE1G+3X4umGfSOvxIub+CIIcZ1ChWU6clURi8XWWyWfYTYUhR3mhCPAxvl
yCYluKBaYnlhFSD5941XFq0jGnpu0q2sewLU8loeeTuuJp+fGsrHR0RFTrrmi7jL6Z6YImfOrMJ/
CyWfp0EgyXhoKhESw2KZyZATIwE5UBLgM7RrjC8hupbKHAONc6QApWuotmzCTbpXRKreGtNL1kFl
w5iRtz5WFXUHY67n8Pyud4RO9MtimcedOXnEKVpFZmbxInv/+ZmVGhMFqkN0FX0QAwx+CKvMmT7+
pOA7BQSiQCP8+lyDbF9kFqQSuxd2dvCr22IVgfR2J+fnD/a0vIYAEiM7DAyrFsR5gJbncA036HRT
jwUJ3N8DzNnNYOEisW5a3Qu8NPGW8w3sbiUxm2Eh6cywlooFMDcbXE19Jr32AwDTo2efkS8dld9Z
Crzkgw43GsUvKTOrqdzTtVtnJjbOyWuc/IAHdZ6579q1VcwPLrnX2W+4jv9RS29QbF1Ei3farIMZ
HrYAiygq+T2DelMrARSzQ/+Aze544BeRbeiPCMaK+RJw3sva0fXZaY/OBbbqZAJDCAlTPMza/4pw
DG9RX0PVgQpPIfy/77IzXCz6bOD3p+LfD2t0alkL9XWkNm3DkaGhmbun/WVrpA7qvml0jhKS0N4K
I5W5XmfPG+PlJATUgZG87a2o36fZI9IE1iMujv0eY81sRNVStJdRCaAhYTnjwAgu8+m3YZUqzSjv
HfSNSL++ofL30szCz7/xCx96/ChHei4uP17mQ78lF8roB4orIIqcCPCJz4DWp4NEZO1F755vePcA
cnytbkOT+X4I/+Vh0iLTL6vCj23ZOByiTrIJEB13tXwsw3jhFR1XgaewS/sXPPcZTtTkbKH6aphR
Dhg3/WCyWuTURYemzfnIdjznz35dcXQykuOMB4G/bRSetxT0nH8SE3Qz9VW2R+p0qT/6utd0qPv8
ELbhksea55D592qU6Du6SG3H7w7YnE2LaLwzeXmSN1Si7aRSU1X+G744wIgNuNHLV/ZJ7pO3/z4u
aUBkgToQhqz2wi90ekokU8SdKKk19d1ZhgrGjiBHcKclt1xGAGR9xUmy82DZJPnesXVaJmJx+fQK
P0I0IBcHVKjP5Hx2bAOWDYE8qLNNYLalsaZb+cgslyx9A04u52s8NIdzHj1gdc3BBvAQ4uchh+qc
q8JNnVWLaEBYd8cFbyDHS35P0HNSccx+s6mzQH9kTAwta+GmCIW4jZDGcL5K62HprRSK+SUUwbM8
1V4XLXTnA3W5RlnFihoyxMJm3p1en2XUg2stLlw58JZiNxvGqp1u2PA+wipQ+L06E/pX3hPpDBRN
/aeruvX7sILmhIRWOgwtJuEMvU4mXzgl4ljP4somI1j7wHgK/U/bE2tEBd9fLdTAVH5i9alqBDiR
uLxdQFEziMdWWDIdnilYfGvN9NdmdXK+OF/m58dd8pQvlMS40nzyW7Gkohai0dNodcNtp80ZHJ07
5c3joeQN9Vm+S2NosFz8efDrARqDGSdj8OvLj3Hs5qfcmCeaPflabrdDNV5upeiaSn7Pu3507twI
WnFoVqutTiVEGo3GtIJrABqpcnzpbl0HqV9TOLfnJ9HJ2h0rI32lNx1PcHDSy4/CjDf/bTRf1Qwb
yhIaBW7eagrZ3+Ck6cxPObzvC8VCRqWJGI13HqHkyjk4V1VXpcDPVna01QcSj27Cysf5kVIp0kII
6J1TxH7fAMSfqJ/yyVoudEjtA8NYMHgJlBLXcIKWp50ELKyc2tXn2Jihzi1P7ZHCK6s7ebAkR3AQ
06ZdIzy9H9oMYdLiiM0pXh+uKEVj75RCNnRxNAlCfn4wrcm4wsPkUzVPgJaBIfQl6G8CFvNNol4T
pUPB88g9ra4/2B4NPJiGIDuF9e9u6FI0ooreYhjYI4R8nU/aDNHFe6SLY9y/ldgsYWaEnKgW97kA
nNcG3ZRjUy5ltdnLPEkqif4o6zmPeYZbe0H1exsmXBifDpaS4T9/ET4HTuhqnJLZCoh4pjbaerbC
MSo88miKFtzkncME//j2b8czFiKIeRe/t0MhFX7bg1wDHe5m/vnLejG9DYTDduzNgXkR9jNTMz7U
vm4+ETydv2yG+FBVmw16qNO7ElruePjffrOuzO4UMD/Hwc/HAyhSfpiXjFmFAnvYUxNXYVQxenEv
QJf6RF/yCpeezFyhMaY7j9o6IhCYDV2aPSIE2H/YUE7BQneMbRpCEyvG6z50afLDj6bcLmNmwkQa
bM1eKYQn6a1mLL0d2gmmAcGZ4aaAMj33fOozyNjpSrlAF7TXAx3dCGJt1lYPVmsl9LWotvYzyqJT
7stC/JzRsmp7On5a9I3vyuRmE/uKrm+Q05hmTZFEYmVws09M09JsyRoUBnxLcmZ08OqiNIn9a5jq
iwkhDXKUJSWY9ZwYS1arnT2WZJ9RC4ERQKaZzCbixtartj8nTfWx6eXi5CnYU7YEkobFiw3FtJwb
jX4xKtEa+TXkyMam2IVMq2X7dB/wQgKJWC1ZeyxsyePOKNgUmrFSFLiy3DrSPGqB9X2tsPJFtRTK
mi+KKBZQgTpotjrPYnP4KdQ/JCaA+iE7kXkQa8tiNLOf5p5uN1i3cljFPHdsXCYNy59rnRhSBTI4
OXEj6EiNjaIJd1gJIT4bEsDc8V/3lmOLNKV2IKCx7fMf/KsDzLvk6DpciXeReYJRwx7tFnAK2asb
Szi7KbGftUe97VJBaz20pcnVKbrWn/F/g89K2TE5D4bS8XT1qNXOQAhU64ZuRJT25TaJ6ep1wDCO
25I0JJ/tNKSRxWwVmn+sX86N6L7gsFAc0UVxkBf6+FurVVLJc8NpbeEBws4l0RCAw+bviRGE6x0F
BFD3EYsd+4rc8ZOVgbrW+jbVGeZxHqdnaMAnSLuAd+eXB7Er9U33O+No/o7EbF1SLguG/J0mVvx8
Vaddl73NEbf66gVW2dSlJ0Qz8/0UzWy9gB22vegI1f/+Wz2zcXWe4uw7eZcVTLJqjQUZuX3XbYWr
sNi4MfyWcqJuFOo6QX6/R3rcYC/Xck5sgCPrjOT/4vbY14n8pYlXBr4HYj0R0wfYPHMy1rysMhbg
j97MA4wC6OwSJEBlDZWhThMisOzKlV9s9tA1YgMqJfu+OLiyrZrEYk9lLgfL6qD9/NIoUXQSq/XO
1BtI31QVvpAKITo2zC4h7y7CXyVywbFVo7Z8vM9lQOpG4u9WlpfmJ5FNRnWafZDQt9lRDaC5CgKk
7hK0vBajtgu+mwsDGgHzNAOLe6xKL7EMTNgPHPUExVPnL7uPk6P+MzM1FTTER/T8qVjOnInw42Ki
LZTe98yy3CByL9PypcOB5phTSNZ1uKCpT8FIwaWw7ppfLwTis173G33MluJ48jw0kcIUGMRw3YvW
44qF4vA960Dgbv1kOCaVQwuknDF5NLOaMx0kODfbNPtLHTF4gETJQ7PBm6lKkJGVPpPSdd74wN6d
+Hg6YS3zy0F+hNbnDNtVorrpt4yuzsBKCy1ZOa5WF763DVd0okfSwu+AuIg7QL3vymJI4LCFfmqG
/661wM0XxwGNWNDx/ggoNc3O5bI0fdALXwOtlI1xnX081Nr6AjDCEcQqSNUIpcqqGAHSlK0MlGYp
GXAvfsVjH91juO0bCviUBxGL4drMAG73s17UtCioCD8gV1UdyWtcWqMDayYIJVGcXV6lkheEIOno
RgzRqBv+zwkxihw4HTj8xmIRSbaawCSS+/ijDIfjP6gkvq0jWP0RATiM05Gk7/4fM4UCgs87lA3Q
UhWakt97ZLPOcmAOqvakg9c0IfdgOqGU0dCLV1OFjvc9Q1kVbRAGlp5+3CUD+swVz2H5hbO05cgu
VDBU5t7ghTUaaLpFlk05PhytTtSY+TdFj6PYR3d7q8/ZQedfH6FyDnarDYK3jralEl7eOJddO0Cm
13ZkipnLDQ5Jj3vPlTWh1jdk3CXW/10rGTlf3wOOqcAoCugVSC63s1q15oRJU0JwNNSe7LtHSR6B
aaP9ETdAWz7QLETjWl/T/46LkK2TrChmrpvugidwdKMOT6RnB9KOQyAp28twdRmwAT7b6dqhGWiM
ysawBarm3xTPhmtoSl534dphfUAv1aC/p5k+2uq0Lud1CwS3UC9Ew+KUiviWi2rCtbyKKrc2DR09
mG/BAaj4MNhPRuJYzdh44h1GbUx8fi16vipEhnvWt13ga+Zq//lw9vJZNUjJ+UpTOI7i4o2rQjbB
pZPY5lU7odE7I5jfuib245WyNm6NhtDfc/dhOwBIQVzeSK0/b7CFkvIs7PxskB1NSYGTC9qcy1a0
1mfEK+Vv/GHRM4oXusA5MI6Odi9wykfOBRTL1otxy9Bu8t1Fv7DOhrNvNmAlbH1+2qHzz1Zc4qmc
YVlfY4IfpudtUAEzNEnTf3q//oqdHfCi+a074EYTuH/oCxYtrGArrIAZDWPi+hpNECAtJuv+ZMF+
vAfsFQtI1yo3vjYEihT9MaecP36JCmQ105u20yuzfhm4waO01xeAUHIYT2XbH166LPfOXWqUYDXg
cFXa3ZctdEARkFydi0q1zWort+YHx4tkqEgKMHxaDDU+srv7U83DYEw/LECQVQHBCJhos0ron69Q
zKzqC5j6/GhgYcM9AgRyhhhTdequGAPDk9m37nnHnP01oxCrw3SOIYGE1TP9xaydpSFDQDcW3b7b
WB7sRd/afoOeXygPalu5xsectUgFMiOWca61sDvo8+b27oiMkKirFSrrn2OJT2l/as8rMhLtOsuE
rfWZP1pV83zrNVyQDe5mecGggYIwYet58Td52Y8IEUryrY3unSrzzTrRO1TMDUeeOF/njyoHd0Mq
QVL51wEM4/u9f5/6WnWEQCx6B+6JnfEk7p9FfVjvWlM3XSjL6TMoCyaLooptDzgKKSUwjwkEFk03
zVnXEqJxPc77eYJQvaf4OCMdVw2mMiSBpDnqyFp1PXeRLCLTWYVxWmfG6HZ5yCEQ4goHoAQQeJmc
FclUBeLPdc9/iR9zvXxxX/Hbl0ly9wFfN3F9zrOtrz8lK7uaI5ZTQn6QhA4i8KhAEbP4Wqn6Ua6F
KQvjhdFABbnMZFpZ7EciD53Phg0Tv8/S/xamJNVQDnftN3Czkim8qSwEq6i0
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
