-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
-- Date        : Wed Jan 11 15:10:49 2023
-- Host        : LYC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/BaiduNetdiskDownload/K7325_676_hdmi_inout/50/hdmi_display_demon/hdmi_display_demon.runs/hdmi_display_0_synth_1/hdmi_display_0_sim_netlist.vhdl
-- Design      : hdmi_display_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k325tffg676-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_display_0_SerializerN_1 is
  port (
    HDMI_CLK_P : out STD_LOGIC;
    HDMI_CLK_N : out STD_LOGIC;
    RST : out STD_LOGIC;
    PXLCLK_5X_I : in STD_LOGIC;
    PXLCLK_I : in STD_LOGIC;
    RST_N : in STD_LOGIC;
    LOCKED_I : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hdmi_display_0_SerializerN_1 : entity is "SerializerN_1";
end hdmi_display_0_SerializerN_1;

architecture STRUCTURE of hdmi_display_0_SerializerN_1 is
  signal I : STD_LOGIC;
  signal \^rst\ : STD_LOGIC;
  signal RST_I : STD_LOGIC;
  signal SHIFTIN1 : STD_LOGIC;
  signal SHIFTIN2 : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_OFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_SHIFTOUT1_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_SHIFTOUT2_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TBYTEOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TQ_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_OFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_OQ_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TBYTEOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TQ_UNCONNECTED\ : STD_LOGIC;
  attribute box_type : string;
  attribute box_type of \family_7.oserdese2_master\ : label is "PRIMITIVE";
  attribute box_type of \family_7.oserdese2_slave\ : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of io_datax_out : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of io_datax_out : label is "OBUFDS";
  attribute box_type of io_datax_out : label is "PRIMITIVE";
begin
  RST <= \^rst\;
\family_7.int_rst_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => RST_N,
      I1 => LOCKED_I,
      O => RST_I
    );
\family_7.int_rst_reg\: unisim.vcomponents.FDPE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => '0',
      PRE => RST_I,
      Q => \^rst\
    );
\family_7.oserdese2_master\: unisim.vcomponents.OSERDESE2
    generic map(
      DATA_RATE_OQ => "DDR",
      DATA_RATE_TQ => "SDR",
      DATA_WIDTH => 10,
      INIT_OQ => '0',
      INIT_TQ => '0',
      IS_CLKDIV_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      IS_D3_INVERTED => '0',
      IS_D4_INVERTED => '0',
      IS_D5_INVERTED => '0',
      IS_D6_INVERTED => '0',
      IS_D7_INVERTED => '0',
      IS_D8_INVERTED => '0',
      IS_T1_INVERTED => '0',
      IS_T2_INVERTED => '0',
      IS_T3_INVERTED => '0',
      IS_T4_INVERTED => '0',
      SERDES_MODE => "MASTER",
      SRVAL_OQ => '0',
      SRVAL_TQ => '0',
      TBYTE_CTL => "FALSE",
      TBYTE_SRC => "FALSE",
      TRISTATE_WIDTH => 1
    )
        port map (
      CLK => PXLCLK_5X_I,
      CLKDIV => PXLCLK_I,
      D1 => '0',
      D2 => '0',
      D3 => '0',
      D4 => '0',
      D5 => '0',
      D6 => '1',
      D7 => '1',
      D8 => '1',
      OCE => '1',
      OFB => \NLW_family_7.oserdese2_master_OFB_UNCONNECTED\,
      OQ => I,
      RST => \^rst\,
      SHIFTIN1 => SHIFTIN1,
      SHIFTIN2 => SHIFTIN2,
      SHIFTOUT1 => \NLW_family_7.oserdese2_master_SHIFTOUT1_UNCONNECTED\,
      SHIFTOUT2 => \NLW_family_7.oserdese2_master_SHIFTOUT2_UNCONNECTED\,
      T1 => '0',
      T2 => '0',
      T3 => '0',
      T4 => '0',
      TBYTEIN => '0',
      TBYTEOUT => \NLW_family_7.oserdese2_master_TBYTEOUT_UNCONNECTED\,
      TCE => '0',
      TFB => \NLW_family_7.oserdese2_master_TFB_UNCONNECTED\,
      TQ => \NLW_family_7.oserdese2_master_TQ_UNCONNECTED\
    );
\family_7.oserdese2_slave\: unisim.vcomponents.OSERDESE2
    generic map(
      DATA_RATE_OQ => "DDR",
      DATA_RATE_TQ => "SDR",
      DATA_WIDTH => 10,
      INIT_OQ => '0',
      INIT_TQ => '0',
      IS_CLKDIV_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      IS_D3_INVERTED => '0',
      IS_D4_INVERTED => '0',
      IS_D5_INVERTED => '0',
      IS_D6_INVERTED => '0',
      IS_D7_INVERTED => '0',
      IS_D8_INVERTED => '0',
      IS_T1_INVERTED => '0',
      IS_T2_INVERTED => '0',
      IS_T3_INVERTED => '0',
      IS_T4_INVERTED => '0',
      SERDES_MODE => "SLAVE",
      SRVAL_OQ => '0',
      SRVAL_TQ => '0',
      TBYTE_CTL => "FALSE",
      TBYTE_SRC => "FALSE",
      TRISTATE_WIDTH => 1
    )
        port map (
      CLK => PXLCLK_5X_I,
      CLKDIV => PXLCLK_I,
      D1 => '0',
      D2 => '0',
      D3 => '1',
      D4 => '1',
      D5 => '0',
      D6 => '0',
      D7 => '0',
      D8 => '0',
      OCE => '1',
      OFB => \NLW_family_7.oserdese2_slave_OFB_UNCONNECTED\,
      OQ => \NLW_family_7.oserdese2_slave_OQ_UNCONNECTED\,
      RST => \^rst\,
      SHIFTIN1 => '0',
      SHIFTIN2 => '0',
      SHIFTOUT1 => SHIFTIN1,
      SHIFTOUT2 => SHIFTIN2,
      T1 => '0',
      T2 => '0',
      T3 => '0',
      T4 => '0',
      TBYTEIN => '0',
      TBYTEOUT => \NLW_family_7.oserdese2_slave_TBYTEOUT_UNCONNECTED\,
      TCE => '0',
      TFB => \NLW_family_7.oserdese2_slave_TFB_UNCONNECTED\,
      TQ => \NLW_family_7.oserdese2_slave_TQ_UNCONNECTED\
    );
io_datax_out: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => I,
      O => HDMI_CLK_P,
      OB => HDMI_CLK_N
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_display_0_SerializerN_1_2 is
  port (
    HDMI_D0_P : out STD_LOGIC;
    HDMI_D0_N : out STD_LOGIC;
    PXLCLK_5X_I : in STD_LOGIC;
    PXLCLK_I : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RST : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hdmi_display_0_SerializerN_1_2 : entity is "SerializerN_1";
end hdmi_display_0_SerializerN_1_2;

architecture STRUCTURE of hdmi_display_0_SerializerN_1_2 is
  signal I : STD_LOGIC;
  signal SHIFTIN1 : STD_LOGIC;
  signal SHIFTIN2 : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_OFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_SHIFTOUT1_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_SHIFTOUT2_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TBYTEOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TQ_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_OFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_OQ_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TBYTEOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TQ_UNCONNECTED\ : STD_LOGIC;
  attribute box_type : string;
  attribute box_type of \family_7.oserdese2_master\ : label is "PRIMITIVE";
  attribute box_type of \family_7.oserdese2_slave\ : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of io_datax_out : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of io_datax_out : label is "OBUFDS";
  attribute box_type of io_datax_out : label is "PRIMITIVE";
begin
\family_7.oserdese2_master\: unisim.vcomponents.OSERDESE2
    generic map(
      DATA_RATE_OQ => "DDR",
      DATA_RATE_TQ => "SDR",
      DATA_WIDTH => 10,
      INIT_OQ => '0',
      INIT_TQ => '0',
      IS_CLKDIV_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      IS_D3_INVERTED => '0',
      IS_D4_INVERTED => '0',
      IS_D5_INVERTED => '0',
      IS_D6_INVERTED => '0',
      IS_D7_INVERTED => '0',
      IS_D8_INVERTED => '0',
      IS_T1_INVERTED => '0',
      IS_T2_INVERTED => '0',
      IS_T3_INVERTED => '0',
      IS_T4_INVERTED => '0',
      SERDES_MODE => "MASTER",
      SRVAL_OQ => '0',
      SRVAL_TQ => '0',
      TBYTE_CTL => "FALSE",
      TBYTE_SRC => "FALSE",
      TRISTATE_WIDTH => 1
    )
        port map (
      CLK => PXLCLK_5X_I,
      CLKDIV => PXLCLK_I,
      D1 => Q(0),
      D2 => Q(1),
      D3 => Q(2),
      D4 => Q(3),
      D5 => Q(4),
      D6 => Q(5),
      D7 => Q(6),
      D8 => Q(7),
      OCE => '1',
      OFB => \NLW_family_7.oserdese2_master_OFB_UNCONNECTED\,
      OQ => I,
      RST => RST,
      SHIFTIN1 => SHIFTIN1,
      SHIFTIN2 => SHIFTIN2,
      SHIFTOUT1 => \NLW_family_7.oserdese2_master_SHIFTOUT1_UNCONNECTED\,
      SHIFTOUT2 => \NLW_family_7.oserdese2_master_SHIFTOUT2_UNCONNECTED\,
      T1 => '0',
      T2 => '0',
      T3 => '0',
      T4 => '0',
      TBYTEIN => '0',
      TBYTEOUT => \NLW_family_7.oserdese2_master_TBYTEOUT_UNCONNECTED\,
      TCE => '0',
      TFB => \NLW_family_7.oserdese2_master_TFB_UNCONNECTED\,
      TQ => \NLW_family_7.oserdese2_master_TQ_UNCONNECTED\
    );
\family_7.oserdese2_slave\: unisim.vcomponents.OSERDESE2
    generic map(
      DATA_RATE_OQ => "DDR",
      DATA_RATE_TQ => "SDR",
      DATA_WIDTH => 10,
      INIT_OQ => '0',
      INIT_TQ => '0',
      IS_CLKDIV_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      IS_D3_INVERTED => '0',
      IS_D4_INVERTED => '0',
      IS_D5_INVERTED => '0',
      IS_D6_INVERTED => '0',
      IS_D7_INVERTED => '0',
      IS_D8_INVERTED => '0',
      IS_T1_INVERTED => '0',
      IS_T2_INVERTED => '0',
      IS_T3_INVERTED => '0',
      IS_T4_INVERTED => '0',
      SERDES_MODE => "SLAVE",
      SRVAL_OQ => '0',
      SRVAL_TQ => '0',
      TBYTE_CTL => "FALSE",
      TBYTE_SRC => "FALSE",
      TRISTATE_WIDTH => 1
    )
        port map (
      CLK => PXLCLK_5X_I,
      CLKDIV => PXLCLK_I,
      D1 => '0',
      D2 => '0',
      D3 => Q(8),
      D4 => Q(9),
      D5 => '0',
      D6 => '0',
      D7 => '0',
      D8 => '0',
      OCE => '1',
      OFB => \NLW_family_7.oserdese2_slave_OFB_UNCONNECTED\,
      OQ => \NLW_family_7.oserdese2_slave_OQ_UNCONNECTED\,
      RST => RST,
      SHIFTIN1 => '0',
      SHIFTIN2 => '0',
      SHIFTOUT1 => SHIFTIN1,
      SHIFTOUT2 => SHIFTIN2,
      T1 => '0',
      T2 => '0',
      T3 => '0',
      T4 => '0',
      TBYTEIN => '0',
      TBYTEOUT => \NLW_family_7.oserdese2_slave_TBYTEOUT_UNCONNECTED\,
      TCE => '0',
      TFB => \NLW_family_7.oserdese2_slave_TFB_UNCONNECTED\,
      TQ => \NLW_family_7.oserdese2_slave_TQ_UNCONNECTED\
    );
io_datax_out: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => I,
      O => HDMI_D0_P,
      OB => HDMI_D0_N
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_display_0_SerializerN_1_3 is
  port (
    HDMI_D1_P : out STD_LOGIC;
    HDMI_D1_N : out STD_LOGIC;
    PXLCLK_5X_I : in STD_LOGIC;
    PXLCLK_I : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RST : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hdmi_display_0_SerializerN_1_3 : entity is "SerializerN_1";
end hdmi_display_0_SerializerN_1_3;

architecture STRUCTURE of hdmi_display_0_SerializerN_1_3 is
  signal I : STD_LOGIC;
  signal SHIFTIN1 : STD_LOGIC;
  signal SHIFTIN2 : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_OFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_SHIFTOUT1_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_SHIFTOUT2_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TBYTEOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TQ_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_OFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_OQ_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TBYTEOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TQ_UNCONNECTED\ : STD_LOGIC;
  attribute box_type : string;
  attribute box_type of \family_7.oserdese2_master\ : label is "PRIMITIVE";
  attribute box_type of \family_7.oserdese2_slave\ : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of io_datax_out : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of io_datax_out : label is "OBUFDS";
  attribute box_type of io_datax_out : label is "PRIMITIVE";
begin
\family_7.oserdese2_master\: unisim.vcomponents.OSERDESE2
    generic map(
      DATA_RATE_OQ => "DDR",
      DATA_RATE_TQ => "SDR",
      DATA_WIDTH => 10,
      INIT_OQ => '0',
      INIT_TQ => '0',
      IS_CLKDIV_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      IS_D3_INVERTED => '0',
      IS_D4_INVERTED => '0',
      IS_D5_INVERTED => '0',
      IS_D6_INVERTED => '0',
      IS_D7_INVERTED => '0',
      IS_D8_INVERTED => '0',
      IS_T1_INVERTED => '0',
      IS_T2_INVERTED => '0',
      IS_T3_INVERTED => '0',
      IS_T4_INVERTED => '0',
      SERDES_MODE => "MASTER",
      SRVAL_OQ => '0',
      SRVAL_TQ => '0',
      TBYTE_CTL => "FALSE",
      TBYTE_SRC => "FALSE",
      TRISTATE_WIDTH => 1
    )
        port map (
      CLK => PXLCLK_5X_I,
      CLKDIV => PXLCLK_I,
      D1 => Q(0),
      D2 => Q(1),
      D3 => Q(2),
      D4 => Q(3),
      D5 => Q(4),
      D6 => Q(5),
      D7 => Q(6),
      D8 => Q(7),
      OCE => '1',
      OFB => \NLW_family_7.oserdese2_master_OFB_UNCONNECTED\,
      OQ => I,
      RST => RST,
      SHIFTIN1 => SHIFTIN1,
      SHIFTIN2 => SHIFTIN2,
      SHIFTOUT1 => \NLW_family_7.oserdese2_master_SHIFTOUT1_UNCONNECTED\,
      SHIFTOUT2 => \NLW_family_7.oserdese2_master_SHIFTOUT2_UNCONNECTED\,
      T1 => '0',
      T2 => '0',
      T3 => '0',
      T4 => '0',
      TBYTEIN => '0',
      TBYTEOUT => \NLW_family_7.oserdese2_master_TBYTEOUT_UNCONNECTED\,
      TCE => '0',
      TFB => \NLW_family_7.oserdese2_master_TFB_UNCONNECTED\,
      TQ => \NLW_family_7.oserdese2_master_TQ_UNCONNECTED\
    );
\family_7.oserdese2_slave\: unisim.vcomponents.OSERDESE2
    generic map(
      DATA_RATE_OQ => "DDR",
      DATA_RATE_TQ => "SDR",
      DATA_WIDTH => 10,
      INIT_OQ => '0',
      INIT_TQ => '0',
      IS_CLKDIV_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      IS_D3_INVERTED => '0',
      IS_D4_INVERTED => '0',
      IS_D5_INVERTED => '0',
      IS_D6_INVERTED => '0',
      IS_D7_INVERTED => '0',
      IS_D8_INVERTED => '0',
      IS_T1_INVERTED => '0',
      IS_T2_INVERTED => '0',
      IS_T3_INVERTED => '0',
      IS_T4_INVERTED => '0',
      SERDES_MODE => "SLAVE",
      SRVAL_OQ => '0',
      SRVAL_TQ => '0',
      TBYTE_CTL => "FALSE",
      TBYTE_SRC => "FALSE",
      TRISTATE_WIDTH => 1
    )
        port map (
      CLK => PXLCLK_5X_I,
      CLKDIV => PXLCLK_I,
      D1 => '0',
      D2 => '0',
      D3 => Q(8),
      D4 => Q(9),
      D5 => '0',
      D6 => '0',
      D7 => '0',
      D8 => '0',
      OCE => '1',
      OFB => \NLW_family_7.oserdese2_slave_OFB_UNCONNECTED\,
      OQ => \NLW_family_7.oserdese2_slave_OQ_UNCONNECTED\,
      RST => RST,
      SHIFTIN1 => '0',
      SHIFTIN2 => '0',
      SHIFTOUT1 => SHIFTIN1,
      SHIFTOUT2 => SHIFTIN2,
      T1 => '0',
      T2 => '0',
      T3 => '0',
      T4 => '0',
      TBYTEIN => '0',
      TBYTEOUT => \NLW_family_7.oserdese2_slave_TBYTEOUT_UNCONNECTED\,
      TCE => '0',
      TFB => \NLW_family_7.oserdese2_slave_TFB_UNCONNECTED\,
      TQ => \NLW_family_7.oserdese2_slave_TQ_UNCONNECTED\
    );
io_datax_out: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => I,
      O => HDMI_D1_P,
      OB => HDMI_D1_N
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_display_0_SerializerN_1_4 is
  port (
    HDMI_D2_P : out STD_LOGIC;
    HDMI_D2_N : out STD_LOGIC;
    PXLCLK_5X_I : in STD_LOGIC;
    PXLCLK_I : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RST : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hdmi_display_0_SerializerN_1_4 : entity is "SerializerN_1";
end hdmi_display_0_SerializerN_1_4;

architecture STRUCTURE of hdmi_display_0_SerializerN_1_4 is
  signal I : STD_LOGIC;
  signal SHIFTIN1 : STD_LOGIC;
  signal SHIFTIN2 : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_OFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_SHIFTOUT1_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_SHIFTOUT2_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TBYTEOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_master_TQ_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_OFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_OQ_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TBYTEOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TFB_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_family_7.oserdese2_slave_TQ_UNCONNECTED\ : STD_LOGIC;
  attribute box_type : string;
  attribute box_type of \family_7.oserdese2_master\ : label is "PRIMITIVE";
  attribute box_type of \family_7.oserdese2_slave\ : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of io_datax_out : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of io_datax_out : label is "OBUFDS";
  attribute box_type of io_datax_out : label is "PRIMITIVE";
begin
\family_7.oserdese2_master\: unisim.vcomponents.OSERDESE2
    generic map(
      DATA_RATE_OQ => "DDR",
      DATA_RATE_TQ => "SDR",
      DATA_WIDTH => 10,
      INIT_OQ => '0',
      INIT_TQ => '0',
      IS_CLKDIV_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      IS_D3_INVERTED => '0',
      IS_D4_INVERTED => '0',
      IS_D5_INVERTED => '0',
      IS_D6_INVERTED => '0',
      IS_D7_INVERTED => '0',
      IS_D8_INVERTED => '0',
      IS_T1_INVERTED => '0',
      IS_T2_INVERTED => '0',
      IS_T3_INVERTED => '0',
      IS_T4_INVERTED => '0',
      SERDES_MODE => "MASTER",
      SRVAL_OQ => '0',
      SRVAL_TQ => '0',
      TBYTE_CTL => "FALSE",
      TBYTE_SRC => "FALSE",
      TRISTATE_WIDTH => 1
    )
        port map (
      CLK => PXLCLK_5X_I,
      CLKDIV => PXLCLK_I,
      D1 => Q(0),
      D2 => Q(1),
      D3 => Q(2),
      D4 => Q(3),
      D5 => Q(4),
      D6 => Q(5),
      D7 => Q(6),
      D8 => Q(7),
      OCE => '1',
      OFB => \NLW_family_7.oserdese2_master_OFB_UNCONNECTED\,
      OQ => I,
      RST => RST,
      SHIFTIN1 => SHIFTIN1,
      SHIFTIN2 => SHIFTIN2,
      SHIFTOUT1 => \NLW_family_7.oserdese2_master_SHIFTOUT1_UNCONNECTED\,
      SHIFTOUT2 => \NLW_family_7.oserdese2_master_SHIFTOUT2_UNCONNECTED\,
      T1 => '0',
      T2 => '0',
      T3 => '0',
      T4 => '0',
      TBYTEIN => '0',
      TBYTEOUT => \NLW_family_7.oserdese2_master_TBYTEOUT_UNCONNECTED\,
      TCE => '0',
      TFB => \NLW_family_7.oserdese2_master_TFB_UNCONNECTED\,
      TQ => \NLW_family_7.oserdese2_master_TQ_UNCONNECTED\
    );
\family_7.oserdese2_slave\: unisim.vcomponents.OSERDESE2
    generic map(
      DATA_RATE_OQ => "DDR",
      DATA_RATE_TQ => "SDR",
      DATA_WIDTH => 10,
      INIT_OQ => '0',
      INIT_TQ => '0',
      IS_CLKDIV_INVERTED => '0',
      IS_CLK_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      IS_D3_INVERTED => '0',
      IS_D4_INVERTED => '0',
      IS_D5_INVERTED => '0',
      IS_D6_INVERTED => '0',
      IS_D7_INVERTED => '0',
      IS_D8_INVERTED => '0',
      IS_T1_INVERTED => '0',
      IS_T2_INVERTED => '0',
      IS_T3_INVERTED => '0',
      IS_T4_INVERTED => '0',
      SERDES_MODE => "SLAVE",
      SRVAL_OQ => '0',
      SRVAL_TQ => '0',
      TBYTE_CTL => "FALSE",
      TBYTE_SRC => "FALSE",
      TRISTATE_WIDTH => 1
    )
        port map (
      CLK => PXLCLK_5X_I,
      CLKDIV => PXLCLK_I,
      D1 => '0',
      D2 => '0',
      D3 => Q(8),
      D4 => Q(9),
      D5 => '0',
      D6 => '0',
      D7 => '0',
      D8 => '0',
      OCE => '1',
      OFB => \NLW_family_7.oserdese2_slave_OFB_UNCONNECTED\,
      OQ => \NLW_family_7.oserdese2_slave_OQ_UNCONNECTED\,
      RST => RST,
      SHIFTIN1 => '0',
      SHIFTIN2 => '0',
      SHIFTOUT1 => SHIFTIN1,
      SHIFTOUT2 => SHIFTIN2,
      T1 => '0',
      T2 => '0',
      T3 => '0',
      T4 => '0',
      TBYTEIN => '0',
      TBYTEOUT => \NLW_family_7.oserdese2_slave_TBYTEOUT_UNCONNECTED\,
      TCE => '0',
      TFB => \NLW_family_7.oserdese2_slave_TFB_UNCONNECTED\,
      TQ => \NLW_family_7.oserdese2_slave_TQ_UNCONNECTED\
    );
io_datax_out: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => I,
      O => HDMI_D2_P,
      OB => HDMI_D2_N
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_display_0_TMDSEncoder is
  port (
    Q : out STD_LOGIC_VECTOR ( 9 downto 0 );
    VGA_HS : in STD_LOGIC;
    PXLCLK_I : in STD_LOGIC;
    VGA_VS : in STD_LOGIC;
    de_dd : in STD_LOGIC;
    VGA_RGB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hdmi_display_0_TMDSEncoder : entity is "TMDSEncoder";
end hdmi_display_0_TMDSEncoder;

architecture STRUCTURE of hdmi_display_0_TMDSEncoder is
  signal c0_d : STD_LOGIC;
  signal c0_dd : STD_LOGIC;
  signal c1_d_reg_n_0 : STD_LOGIC;
  signal c1_dd : STD_LOGIC;
  signal cnt_t : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal cnt_t_1 : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal \cnt_t_1[1]_i_2__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[1]_i_3__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[2]_i_2__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_4__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_10_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_11__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_12__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_2__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_3__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_4__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_5__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_6__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_7__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_8__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_9__1_n_0\ : STD_LOGIC;
  signal \d_d_reg_n_0_[0]\ : STD_LOGIC;
  signal \d_d_reg_n_0_[1]\ : STD_LOGIC;
  signal \n0_q_m[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \n0_q_m[1]_i_2__0_n_0\ : STD_LOGIC;
  signal \n0_q_m[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_4__1_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_5__0_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_6__1_n_0\ : STD_LOGIC;
  signal \n0_q_m_reg_n_0_[1]\ : STD_LOGIC;
  signal \n0_q_m_reg_n_0_[2]\ : STD_LOGIC;
  signal \n0_q_m_reg_n_0_[3]\ : STD_LOGIC;
  signal n1_d : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \n1_d[0]_i_1_n_0\ : STD_LOGIC;
  signal \n1_d[0]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[1]_i_1_n_0\ : STD_LOGIC;
  signal \n1_d[1]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[2]_i_1_n_0\ : STD_LOGIC;
  signal \n1_d[2]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[3]_i_1_n_0\ : STD_LOGIC;
  signal \n1_d[3]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[3]_i_3_n_0\ : STD_LOGIC;
  signal \n1_d[3]_i_4_n_0\ : STD_LOGIC;
  signal \n1_q_m[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \n1_q_m[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \n1_q_m[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \n1_q_m[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \n1_q_m[3]_i_3__1_n_0\ : STD_LOGIC;
  signal \n1_q_m[3]_i_4_n_0\ : STD_LOGIC;
  signal \n1_q_m_reg_n_0_[1]\ : STD_LOGIC;
  signal \n1_q_m_reg_n_0_[2]\ : STD_LOGIC;
  signal \n1_q_m_reg_n_0_[3]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in0_in : STD_LOGIC;
  signal p_0_in10_in : STD_LOGIC;
  signal p_0_in2_in : STD_LOGIC;
  signal p_0_in4_in : STD_LOGIC;
  signal p_0_in6_in : STD_LOGIC;
  signal p_0_in8_in : STD_LOGIC;
  signal \q_m_d[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_m_d[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_m_d[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_m_d[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_m_d[5]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_m_d[6]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_m_d[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_m_d[7]_i_2__0_n_0\ : STD_LOGIC;
  signal \q_m_d[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[0]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[1]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[2]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[3]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[4]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[5]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[6]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[7]\ : STD_LOGIC;
  signal \q_out_d[0]_i_1_n_0\ : STD_LOGIC;
  signal \q_out_d[1]_i_1_n_0\ : STD_LOGIC;
  signal \q_out_d[2]_i_1_n_0\ : STD_LOGIC;
  signal \q_out_d[3]_i_1_n_0\ : STD_LOGIC;
  signal \q_out_d[4]_i_1_n_0\ : STD_LOGIC;
  signal \q_out_d[5]_i_1_n_0\ : STD_LOGIC;
  signal \q_out_d[6]_i_1_n_0\ : STD_LOGIC;
  signal \q_out_d[7]_i_1_n_0\ : STD_LOGIC;
  signal \q_out_d[8]_i_1_n_0\ : STD_LOGIC;
  signal \q_out_d[9]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_out_d[9]_i_2_n_0\ : STD_LOGIC;
  signal \q_out_d[9]_i_3_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_t_1[4]_i_10\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \cnt_t_1[4]_i_11__1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_2__1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_3__1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_4__1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_5__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_6__1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \n1_d[0]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \n1_d[3]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \n1_q_m[1]_i_1__0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \n1_q_m[2]_i_1__1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \n1_q_m[3]_i_3__1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \q_m_d[3]_i_1__1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \q_m_d[4]_i_1__1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \q_m_d[5]_i_1__1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \q_m_d[6]_i_1__1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \q_m_d[7]_i_1__1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \q_m_d[7]_i_2__0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \q_out_d[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \q_out_d[9]_i_2\ : label is "soft_lutpair3";
begin
c0_d_reg: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_HS,
      Q => c0_d,
      R => '0'
    );
c0_dd_reg: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => c0_d,
      Q => c0_dd,
      R => '0'
    );
c1_d_reg: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_VS,
      Q => c1_d_reg_n_0,
      R => '0'
    );
c1_dd_reg: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => c1_d_reg_n_0,
      Q => c1_dd,
      R => '0'
    );
\cnt_t_1[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9669966969969696"
    )
        port map (
      I0 => \n1_q_m_reg_n_0_[1]\,
      I1 => \n0_q_m_reg_n_0_[1]\,
      I2 => cnt_t_1(1),
      I3 => \cnt_t_1[1]_i_2__1_n_0\,
      I4 => \cnt_t_1[4]_i_3__1_n_0\,
      I5 => \q_m_d[8]_i_1__1_n_0\,
      O => cnt_t(1)
    );
\cnt_t_1[1]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888888BBBBBBBBB"
    )
        port map (
      I0 => \cnt_t_1[1]_i_3__1_n_0\,
      I1 => cnt_t_1(4),
      I2 => cnt_t_1(2),
      I3 => cnt_t_1(1),
      I4 => cnt_t_1(3),
      I5 => \cnt_t_1[4]_i_12__1_n_0\,
      O => \cnt_t_1[1]_i_2__1_n_0\
    );
\cnt_t_1[1]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD4DDD4D4D44DD4D"
    )
        port map (
      I0 => \n0_q_m_reg_n_0_[3]\,
      I1 => \n1_q_m_reg_n_0_[3]\,
      I2 => \n0_q_m_reg_n_0_[2]\,
      I3 => \n1_q_m_reg_n_0_[2]\,
      I4 => \n0_q_m_reg_n_0_[1]\,
      I5 => \n1_q_m_reg_n_0_[1]\,
      O => \cnt_t_1[1]_i_3__1_n_0\
    );
\cnt_t_1[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4BB4B44BB44B4BB4"
    )
        port map (
      I0 => \n0_q_m_reg_n_0_[1]\,
      I1 => \n1_q_m_reg_n_0_[1]\,
      I2 => \n0_q_m_reg_n_0_[2]\,
      I3 => \n1_q_m_reg_n_0_[2]\,
      I4 => cnt_t_1(2),
      I5 => \cnt_t_1[2]_i_2__1_n_0\,
      O => cnt_t(2)
    );
\cnt_t_1[2]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"70EF204070E02040"
    )
        port map (
      I0 => \q_m_d[8]_i_1__1_n_0\,
      I1 => \cnt_t_1[1]_i_2__1_n_0\,
      I2 => \cnt_t_1[4]_i_3__1_n_0\,
      I3 => cnt_t_1(1),
      I4 => \cnt_t_1[4]_i_10_n_0\,
      I5 => p_0_in,
      O => \cnt_t_1[2]_i_2__1_n_0\
    );
\cnt_t_1[3]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \cnt_t_1[3]_i_2__1_n_0\,
      I1 => cnt_t_1(3),
      I2 => \cnt_t_1[3]_i_3__1_n_0\,
      O => cnt_t(3)
    );
\cnt_t_1[3]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9699666699999699"
    )
        port map (
      I0 => \n1_q_m_reg_n_0_[3]\,
      I1 => \n0_q_m_reg_n_0_[3]\,
      I2 => \n0_q_m_reg_n_0_[1]\,
      I3 => \n1_q_m_reg_n_0_[1]\,
      I4 => \n0_q_m_reg_n_0_[2]\,
      I5 => \n1_q_m_reg_n_0_[2]\,
      O => \cnt_t_1[3]_i_2__1_n_0\
    );
\cnt_t_1[3]_i_3__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A3AFA3AF0000F3FF"
    )
        port map (
      I0 => \cnt_t_1[4]_i_7__1_n_0\,
      I1 => \cnt_t_1[3]_i_4__1_n_0\,
      I2 => \cnt_t_1[4]_i_3__1_n_0\,
      I3 => p_0_in,
      I4 => \cnt_t_1[4]_i_8__1_n_0\,
      I5 => \cnt_t_1[1]_i_2__1_n_0\,
      O => \cnt_t_1[3]_i_3__1_n_0\
    );
\cnt_t_1[3]_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"044602BF02BF0446"
    )
        port map (
      I0 => \n0_q_m_reg_n_0_[1]\,
      I1 => \n1_q_m_reg_n_0_[1]\,
      I2 => cnt_t_1(1),
      I3 => cnt_t_1(2),
      I4 => \n1_q_m_reg_n_0_[2]\,
      I5 => \n0_q_m_reg_n_0_[2]\,
      O => \cnt_t_1[3]_i_4__1_n_0\
    );
\cnt_t_1[4]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \n1_q_m_reg_n_0_[1]\,
      I1 => \n0_q_m_reg_n_0_[1]\,
      O => \cnt_t_1[4]_i_10_n_0\
    );
\cnt_t_1[4]_i_11__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4BB4"
    )
        port map (
      I0 => \n0_q_m_reg_n_0_[1]\,
      I1 => \n1_q_m_reg_n_0_[1]\,
      I2 => \n0_q_m_reg_n_0_[2]\,
      I3 => \n1_q_m_reg_n_0_[2]\,
      O => \cnt_t_1[4]_i_11__1_n_0\
    );
\cnt_t_1[4]_i_12__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22B20000FFFF22B2"
    )
        port map (
      I0 => \n1_q_m_reg_n_0_[2]\,
      I1 => \n0_q_m_reg_n_0_[2]\,
      I2 => \n1_q_m_reg_n_0_[1]\,
      I3 => \n0_q_m_reg_n_0_[1]\,
      I4 => \n1_q_m_reg_n_0_[3]\,
      I5 => \n0_q_m_reg_n_0_[3]\,
      O => \cnt_t_1[4]_i_12__1_n_0\
    );
\cnt_t_1[4]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7747447474444777"
    )
        port map (
      I0 => \cnt_t_1[4]_i_2__1_n_0\,
      I1 => \cnt_t_1[4]_i_3__1_n_0\,
      I2 => p_0_in,
      I3 => \cnt_t_1[4]_i_4__1_n_0\,
      I4 => \cnt_t_1[4]_i_5__1_n_0\,
      I5 => \cnt_t_1[4]_i_6__0_n_0\,
      O => cnt_t(4)
    );
\cnt_t_1[4]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C3B4870FF0B4873C"
    )
        port map (
      I0 => \cnt_t_1[4]_i_7__1_n_0\,
      I1 => \cnt_t_1[1]_i_2__1_n_0\,
      I2 => \cnt_t_1[4]_i_5__1_n_0\,
      I3 => cnt_t_1(3),
      I4 => \cnt_t_1[3]_i_2__1_n_0\,
      I5 => \cnt_t_1[4]_i_8__1_n_0\,
      O => \cnt_t_1[4]_i_2__1_n_0\
    );
\cnt_t_1[4]_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => cnt_t_1(3),
      I1 => cnt_t_1(1),
      I2 => cnt_t_1(2),
      I3 => cnt_t_1(4),
      I4 => \cnt_t_1[4]_i_9__1_n_0\,
      O => \cnt_t_1[4]_i_3__1_n_0\
    );
\cnt_t_1[4]_i_4__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00002F022F02FFFF"
    )
        port map (
      I0 => \cnt_t_1[4]_i_10_n_0\,
      I1 => cnt_t_1(1),
      I2 => cnt_t_1(2),
      I3 => \cnt_t_1[4]_i_11__1_n_0\,
      I4 => cnt_t_1(3),
      I5 => \cnt_t_1[3]_i_2__1_n_0\,
      O => \cnt_t_1[4]_i_4__1_n_0\
    );
\cnt_t_1[4]_i_5__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \cnt_t_1[4]_i_12__1_n_0\,
      I1 => cnt_t_1(4),
      O => \cnt_t_1[4]_i_5__1_n_0\
    );
\cnt_t_1[4]_i_6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E8880000FFFFE888"
    )
        port map (
      I0 => cnt_t_1(2),
      I1 => \cnt_t_1[4]_i_11__1_n_0\,
      I2 => \cnt_t_1[4]_i_10_n_0\,
      I3 => cnt_t_1(1),
      I4 => cnt_t_1(3),
      I5 => \cnt_t_1[3]_i_2__1_n_0\,
      O => \cnt_t_1[4]_i_6__0_n_0\
    );
\cnt_t_1[4]_i_7__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E88E0000FFFFE88E"
    )
        port map (
      I0 => \q_m_d[8]_i_1__1_n_0\,
      I1 => cnt_t_1(1),
      I2 => \n1_q_m_reg_n_0_[1]\,
      I3 => \n0_q_m_reg_n_0_[1]\,
      I4 => cnt_t_1(2),
      I5 => \cnt_t_1[4]_i_11__1_n_0\,
      O => \cnt_t_1[4]_i_7__1_n_0\
    );
\cnt_t_1[4]_i_8__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEE8EE88EE88888"
    )
        port map (
      I0 => cnt_t_1(2),
      I1 => \cnt_t_1[4]_i_11__1_n_0\,
      I2 => \n1_q_m_reg_n_0_[1]\,
      I3 => \n0_q_m_reg_n_0_[1]\,
      I4 => cnt_t_1(1),
      I5 => \q_m_d[8]_i_1__1_n_0\,
      O => \cnt_t_1[4]_i_8__1_n_0\
    );
\cnt_t_1[4]_i_9__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \n1_q_m_reg_n_0_[3]\,
      I1 => \n0_q_m_reg_n_0_[3]\,
      I2 => \n1_q_m_reg_n_0_[2]\,
      I3 => \n0_q_m_reg_n_0_[2]\,
      I4 => \n1_q_m_reg_n_0_[1]\,
      I5 => \n0_q_m_reg_n_0_[1]\,
      O => \cnt_t_1[4]_i_9__1_n_0\
    );
\cnt_t_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(1),
      Q => cnt_t_1(1),
      R => SR(0)
    );
\cnt_t_1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(2),
      Q => cnt_t_1(2),
      R => SR(0)
    );
\cnt_t_1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(3),
      Q => cnt_t_1(3),
      R => SR(0)
    );
\cnt_t_1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(4),
      Q => cnt_t_1(4),
      R => SR(0)
    );
\d_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(0),
      Q => \d_d_reg_n_0_[0]\,
      R => '0'
    );
\d_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(1),
      Q => \d_d_reg_n_0_[1]\,
      R => '0'
    );
\d_d_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(2),
      Q => p_0_in0_in,
      R => '0'
    );
\d_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(3),
      Q => p_0_in2_in,
      R => '0'
    );
\d_d_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(4),
      Q => p_0_in4_in,
      R => '0'
    );
\d_d_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(5),
      Q => p_0_in6_in,
      R => '0'
    );
\d_d_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(6),
      Q => p_0_in8_in,
      R => '0'
    );
\d_d_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(7),
      Q => p_0_in10_in,
      R => '0'
    );
\n0_q_m[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A69A65A6"
    )
        port map (
      I0 => \n0_q_m[1]_i_2__0_n_0\,
      I1 => \n0_q_m[3]_i_2__1_n_0\,
      I2 => \n0_q_m[3]_i_3__1_n_0\,
      I3 => \d_d_reg_n_0_[0]\,
      I4 => \n0_q_m[3]_i_4__1_n_0\,
      O => \n0_q_m[1]_i_1__1_n_0\
    );
\n0_q_m[1]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9666999669996669"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => \q_m_d[8]_i_1__1_n_0\,
      I3 => p_0_in2_in,
      I4 => p_0_in0_in,
      I5 => \n0_q_m[3]_i_6__1_n_0\,
      O => \n0_q_m[1]_i_2__0_n_0\
    );
\n0_q_m[2]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B2FBFFDF0020B2FB"
    )
        port map (
      I0 => \n0_q_m[3]_i_4__1_n_0\,
      I1 => \d_d_reg_n_0_[0]\,
      I2 => \n0_q_m[3]_i_3__1_n_0\,
      I3 => \n0_q_m[3]_i_2__1_n_0\,
      I4 => \n0_q_m[3]_i_5__0_n_0\,
      I5 => \n0_q_m[3]_i_6__1_n_0\,
      O => \n0_q_m[2]_i_1__1_n_0\
    );
\n0_q_m[3]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000040000000000"
    )
        port map (
      I0 => \n0_q_m[3]_i_2__1_n_0\,
      I1 => \n0_q_m[3]_i_3__1_n_0\,
      I2 => \d_d_reg_n_0_[0]\,
      I3 => \n0_q_m[3]_i_4__1_n_0\,
      I4 => \n0_q_m[3]_i_5__0_n_0\,
      I5 => \n0_q_m[3]_i_6__1_n_0\,
      O => \n0_q_m[3]_i_1__1_n_0\
    );
\n0_q_m[3]_i_2__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \q_m_d[7]_i_2__0_n_0\,
      I1 => p_0_in8_in,
      I2 => \q_m_d[8]_i_1__1_n_0\,
      O => \n0_q_m[3]_i_2__1_n_0\
    );
\n0_q_m[3]_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \q_m_d[8]_i_1__1_n_0\,
      I1 => \q_m_d[7]_i_2__0_n_0\,
      I2 => p_0_in6_in,
      I3 => p_0_in10_in,
      I4 => p_0_in8_in,
      O => \n0_q_m[3]_i_3__1_n_0\
    );
\n0_q_m[3]_i_4__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => \d_d_reg_n_0_[0]\,
      I2 => \d_d_reg_n_0_[1]\,
      O => \n0_q_m[3]_i_4__1_n_0\
    );
\n0_q_m[3]_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2BD4D42B"
    )
        port map (
      I0 => p_0_in0_in,
      I1 => p_0_in2_in,
      I2 => \q_m_d[8]_i_1__1_n_0\,
      I3 => \d_d_reg_n_0_[1]\,
      I4 => \d_d_reg_n_0_[0]\,
      O => \n0_q_m[3]_i_5__0_n_0\
    );
\n0_q_m[3]_i_6__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C96C"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \q_m_d[7]_i_2__0_n_0\,
      I2 => \q_m_d[8]_i_1__1_n_0\,
      I3 => p_0_in8_in,
      O => \n0_q_m[3]_i_6__1_n_0\
    );
\n0_q_m_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n0_q_m[1]_i_1__1_n_0\,
      Q => \n0_q_m_reg_n_0_[1]\,
      R => '0'
    );
\n0_q_m_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n0_q_m[2]_i_1__1_n_0\,
      Q => \n0_q_m_reg_n_0_[2]\,
      R => '0'
    );
\n0_q_m_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n0_q_m[3]_i_1__1_n_0\,
      Q => \n0_q_m_reg_n_0_[3]\,
      R => '0'
    );
\n1_d[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => VGA_RGB(0),
      I1 => VGA_RGB(7),
      I2 => \n1_d[0]_i_2_n_0\,
      I3 => VGA_RGB(2),
      I4 => VGA_RGB(1),
      I5 => VGA_RGB(3),
      O => \n1_d[0]_i_1_n_0\
    );
\n1_d[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => VGA_RGB(6),
      I1 => VGA_RGB(4),
      I2 => VGA_RGB(5),
      O => \n1_d[0]_i_2_n_0\
    );
\n1_d[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \n1_d[3]_i_2_n_0\,
      I1 => \n1_d[1]_i_2_n_0\,
      I2 => \n1_d[3]_i_3_n_0\,
      O => \n1_d[1]_i_1_n_0\
    );
\n1_d[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"171717E817E8E8E8"
    )
        port map (
      I0 => VGA_RGB(3),
      I1 => VGA_RGB(2),
      I2 => VGA_RGB(1),
      I3 => VGA_RGB(6),
      I4 => VGA_RGB(5),
      I5 => VGA_RGB(4),
      O => \n1_d[1]_i_2_n_0\
    );
\n1_d[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7E7E7EE87EE8E8E8"
    )
        port map (
      I0 => \n1_d[3]_i_2_n_0\,
      I1 => \n1_d[3]_i_3_n_0\,
      I2 => \n1_d[2]_i_2_n_0\,
      I3 => VGA_RGB(4),
      I4 => VGA_RGB(5),
      I5 => VGA_RGB(6),
      O => \n1_d[2]_i_1_n_0\
    );
\n1_d[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => VGA_RGB(1),
      I1 => VGA_RGB(2),
      I2 => VGA_RGB(3),
      O => \n1_d[2]_i_2_n_0\
    );
\n1_d[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8880800000000000"
    )
        port map (
      I0 => \n1_d[3]_i_2_n_0\,
      I1 => \n1_d[3]_i_3_n_0\,
      I2 => VGA_RGB(3),
      I3 => VGA_RGB(2),
      I4 => VGA_RGB(1),
      I5 => \n1_d[3]_i_4_n_0\,
      O => \n1_d[3]_i_1_n_0\
    );
\n1_d[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9600009600969600"
    )
        port map (
      I0 => VGA_RGB(2),
      I1 => VGA_RGB(1),
      I2 => VGA_RGB(3),
      I3 => VGA_RGB(0),
      I4 => VGA_RGB(7),
      I5 => \n1_d[0]_i_2_n_0\,
      O => \n1_d[3]_i_2_n_0\
    );
\n1_d[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E88E8EE8"
    )
        port map (
      I0 => VGA_RGB(7),
      I1 => VGA_RGB(0),
      I2 => VGA_RGB(5),
      I3 => VGA_RGB(4),
      I4 => VGA_RGB(6),
      O => \n1_d[3]_i_3_n_0\
    );
\n1_d[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => VGA_RGB(4),
      I1 => VGA_RGB(5),
      I2 => VGA_RGB(6),
      O => \n1_d[3]_i_4_n_0\
    );
\n1_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_d[0]_i_1_n_0\,
      Q => n1_d(0),
      R => '0'
    );
\n1_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_d[1]_i_1_n_0\,
      Q => n1_d(1),
      R => '0'
    );
\n1_d_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_d[2]_i_1_n_0\,
      Q => n1_d(2),
      R => '0'
    );
\n1_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_d[3]_i_1_n_0\,
      Q => n1_d(3),
      R => '0'
    );
\n1_q_m[1]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \n1_q_m[3]_i_3__1_n_0\,
      I1 => \n0_q_m[1]_i_2__0_n_0\,
      I2 => \n1_q_m[3]_i_4_n_0\,
      O => \n1_q_m[1]_i_1__0_n_0\
    );
\n1_q_m[2]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D4BD"
    )
        port map (
      I0 => \n1_q_m[3]_i_4_n_0\,
      I1 => \n1_q_m[3]_i_3__1_n_0\,
      I2 => \n0_q_m[3]_i_5__0_n_0\,
      I3 => \n0_q_m[3]_i_6__1_n_0\,
      O => \n1_q_m[2]_i_1__1_n_0\
    );
\n1_q_m[3]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \n1_q_m[3]_i_2__0_n_0\,
      I1 => \n1_q_m[3]_i_3__1_n_0\,
      I2 => \n1_q_m[3]_i_4_n_0\,
      O => \n1_q_m[3]_i_1__1_n_0\
    );
\n1_q_m[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000069996669"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => \q_m_d[8]_i_1__1_n_0\,
      I3 => p_0_in2_in,
      I4 => p_0_in0_in,
      I5 => \n0_q_m[3]_i_6__1_n_0\,
      O => \n1_q_m[3]_i_2__0_n_0\
    );
\n1_q_m[3]_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"90060690"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => p_0_in10_in,
      I2 => \d_d_reg_n_0_[0]\,
      I3 => \d_d_reg_n_0_[1]\,
      I4 => p_0_in2_in,
      O => \n1_q_m[3]_i_3__1_n_0\
    );
\n1_q_m[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"288214417DD7BEEB"
    )
        port map (
      I0 => p_0_in10_in,
      I1 => \q_m_d[7]_i_2__0_n_0\,
      I2 => p_0_in8_in,
      I3 => \q_m_d[8]_i_1__1_n_0\,
      I4 => p_0_in6_in,
      I5 => \d_d_reg_n_0_[0]\,
      O => \n1_q_m[3]_i_4_n_0\
    );
\n1_q_m_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_q_m[1]_i_1__0_n_0\,
      Q => \n1_q_m_reg_n_0_[1]\,
      R => '0'
    );
\n1_q_m_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_q_m[2]_i_1__1_n_0\,
      Q => \n1_q_m_reg_n_0_[2]\,
      R => '0'
    );
\n1_q_m_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_q_m[3]_i_1__1_n_0\,
      Q => \n1_q_m_reg_n_0_[3]\,
      R => '0'
    );
\q_m_d[1]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA55AA5599669566"
    )
        port map (
      I0 => \d_d_reg_n_0_[1]\,
      I1 => n1_d(2),
      I2 => n1_d(1),
      I3 => \d_d_reg_n_0_[0]\,
      I4 => n1_d(0),
      I5 => n1_d(3),
      O => \q_m_d[1]_i_1__1_n_0\
    );
\q_m_d[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => p_0_in0_in,
      O => \q_m_d[2]_i_1__1_n_0\
    );
\q_m_d[3]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => p_0_in0_in,
      I3 => \q_m_d[8]_i_1__1_n_0\,
      I4 => p_0_in2_in,
      O => \q_m_d[3]_i_1__1_n_0\
    );
\q_m_d[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => p_0_in4_in,
      I2 => p_0_in0_in,
      I3 => \d_d_reg_n_0_[1]\,
      I4 => \d_d_reg_n_0_[0]\,
      O => \q_m_d[4]_i_1__1_n_0\
    );
\q_m_d[5]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \q_m_d[8]_i_1__1_n_0\,
      I1 => \q_m_d[7]_i_2__0_n_0\,
      I2 => p_0_in6_in,
      O => \q_m_d[5]_i_1__1_n_0\
    );
\q_m_d[6]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => p_0_in8_in,
      I1 => \q_m_d[7]_i_2__0_n_0\,
      I2 => p_0_in6_in,
      O => \q_m_d[6]_i_1__1_n_0\
    );
\q_m_d[7]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \q_m_d[8]_i_1__1_n_0\,
      I1 => \q_m_d[7]_i_2__0_n_0\,
      I2 => p_0_in6_in,
      I3 => p_0_in8_in,
      I4 => p_0_in10_in,
      O => \q_m_d[7]_i_1__1_n_0\
    );
\q_m_d[7]_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => p_0_in0_in,
      I3 => p_0_in4_in,
      I4 => p_0_in2_in,
      O => \q_m_d[7]_i_2__0_n_0\
    );
\q_m_d[8]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00105555"
    )
        port map (
      I0 => n1_d(3),
      I1 => n1_d(0),
      I2 => \d_d_reg_n_0_[0]\,
      I3 => n1_d(1),
      I4 => n1_d(2),
      O => \q_m_d[8]_i_1__1_n_0\
    );
\q_m_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \d_d_reg_n_0_[0]\,
      Q => \q_m_d_reg_n_0_[0]\,
      R => '0'
    );
\q_m_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[1]_i_1__1_n_0\,
      Q => \q_m_d_reg_n_0_[1]\,
      R => '0'
    );
\q_m_d_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[2]_i_1__1_n_0\,
      Q => \q_m_d_reg_n_0_[2]\,
      R => '0'
    );
\q_m_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[3]_i_1__1_n_0\,
      Q => \q_m_d_reg_n_0_[3]\,
      R => '0'
    );
\q_m_d_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[4]_i_1__1_n_0\,
      Q => \q_m_d_reg_n_0_[4]\,
      R => '0'
    );
\q_m_d_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[5]_i_1__1_n_0\,
      Q => \q_m_d_reg_n_0_[5]\,
      R => '0'
    );
\q_m_d_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[6]_i_1__1_n_0\,
      Q => \q_m_d_reg_n_0_[6]\,
      R => '0'
    );
\q_m_d_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[7]_i_1__1_n_0\,
      Q => \q_m_d_reg_n_0_[7]\,
      R => '0'
    );
\q_m_d_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[8]_i_1__1_n_0\,
      Q => p_0_in,
      R => '0'
    );
\q_out_d[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7D287D7D"
    )
        port map (
      I0 => de_dd,
      I1 => \q_out_d[9]_i_3_n_0\,
      I2 => \q_m_d_reg_n_0_[0]\,
      I3 => c0_dd,
      I4 => c1_dd,
      O => \q_out_d[0]_i_1_n_0\
    );
\q_out_d[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7D287D7D"
    )
        port map (
      I0 => de_dd,
      I1 => \q_out_d[9]_i_3_n_0\,
      I2 => \q_m_d_reg_n_0_[1]\,
      I3 => c0_dd,
      I4 => c1_dd,
      O => \q_out_d[1]_i_1_n_0\
    );
\q_out_d[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FF04444"
    )
        port map (
      I0 => c0_dd,
      I1 => c1_dd,
      I2 => \q_out_d[9]_i_3_n_0\,
      I3 => \q_m_d_reg_n_0_[2]\,
      I4 => de_dd,
      O => \q_out_d[2]_i_1_n_0\
    );
\q_out_d[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7D287D7D"
    )
        port map (
      I0 => de_dd,
      I1 => \q_out_d[9]_i_3_n_0\,
      I2 => \q_m_d_reg_n_0_[3]\,
      I3 => c0_dd,
      I4 => c1_dd,
      O => \q_out_d[3]_i_1_n_0\
    );
\q_out_d[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FF04444"
    )
        port map (
      I0 => c0_dd,
      I1 => c1_dd,
      I2 => \q_out_d[9]_i_3_n_0\,
      I3 => \q_m_d_reg_n_0_[4]\,
      I4 => de_dd,
      O => \q_out_d[4]_i_1_n_0\
    );
\q_out_d[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7D287D7D"
    )
        port map (
      I0 => de_dd,
      I1 => \q_out_d[9]_i_3_n_0\,
      I2 => \q_m_d_reg_n_0_[5]\,
      I3 => c0_dd,
      I4 => c1_dd,
      O => \q_out_d[5]_i_1_n_0\
    );
\q_out_d[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FF04444"
    )
        port map (
      I0 => c0_dd,
      I1 => c1_dd,
      I2 => \q_out_d[9]_i_3_n_0\,
      I3 => \q_m_d_reg_n_0_[6]\,
      I4 => de_dd,
      O => \q_out_d[6]_i_1_n_0\
    );
\q_out_d[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7D287D7D"
    )
        port map (
      I0 => de_dd,
      I1 => \q_out_d[9]_i_3_n_0\,
      I2 => \q_m_d_reg_n_0_[7]\,
      I3 => c0_dd,
      I4 => c1_dd,
      O => \q_out_d[7]_i_1_n_0\
    );
\q_out_d[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA30"
    )
        port map (
      I0 => p_0_in,
      I1 => c0_dd,
      I2 => c1_dd,
      I3 => de_dd,
      O => \q_out_d[8]_i_1_n_0\
    );
\q_out_d[9]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => c0_dd,
      I1 => de_dd,
      I2 => c1_dd,
      O => \q_out_d[9]_i_1__0_n_0\
    );
\q_out_d[9]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B88B"
    )
        port map (
      I0 => \q_out_d[9]_i_3_n_0\,
      I1 => de_dd,
      I2 => c1_dd,
      I3 => c0_dd,
      O => \q_out_d[9]_i_2_n_0\
    );
\q_out_d[9]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_3__1_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_2__1_n_0\,
      O => \q_out_d[9]_i_3_n_0\
    );
\q_out_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[0]_i_1_n_0\,
      Q => Q(0),
      R => \q_out_d[9]_i_1__0_n_0\
    );
\q_out_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[1]_i_1_n_0\,
      Q => Q(1),
      R => \q_out_d[9]_i_1__0_n_0\
    );
\q_out_d_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[2]_i_1_n_0\,
      Q => Q(2),
      S => \q_out_d[9]_i_1__0_n_0\
    );
\q_out_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[3]_i_1_n_0\,
      Q => Q(3),
      R => \q_out_d[9]_i_1__0_n_0\
    );
\q_out_d_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[4]_i_1_n_0\,
      Q => Q(4),
      S => \q_out_d[9]_i_1__0_n_0\
    );
\q_out_d_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[5]_i_1_n_0\,
      Q => Q(5),
      R => \q_out_d[9]_i_1__0_n_0\
    );
\q_out_d_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[6]_i_1_n_0\,
      Q => Q(6),
      S => \q_out_d[9]_i_1__0_n_0\
    );
\q_out_d_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[7]_i_1_n_0\,
      Q => Q(7),
      R => \q_out_d[9]_i_1__0_n_0\
    );
\q_out_d_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[8]_i_1_n_0\,
      Q => Q(8),
      S => \q_out_d[9]_i_1__0_n_0\
    );
\q_out_d_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[9]_i_2_n_0\,
      Q => Q(9),
      S => \q_out_d[9]_i_1__0_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_display_0_TMDSEncoder_0 is
  port (
    Q : out STD_LOGIC_VECTOR ( 9 downto 0 );
    VGA_RGB : in STD_LOGIC_VECTOR ( 7 downto 0 );
    PXLCLK_I : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hdmi_display_0_TMDSEncoder_0 : entity is "TMDSEncoder";
end hdmi_display_0_TMDSEncoder_0;

architecture STRUCTURE of hdmi_display_0_TMDSEncoder_0 is
  signal cnt_t : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal cnt_t_1 : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal \cnt_t_1[1]_i_2__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[1]_i_3__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[1]_i_4__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[2]_i_2__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_4__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_5__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_6__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_7_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_10__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_11__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_12__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_2__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_4__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_5__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_6_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_7__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_8__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_9__0_n_0\ : STD_LOGIC;
  signal \d_d_reg_n_0_[0]\ : STD_LOGIC;
  signal \d_d_reg_n_0_[1]\ : STD_LOGIC;
  signal \n0_q_m[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \n0_q_m[1]_i_2_n_0\ : STD_LOGIC;
  signal \n0_q_m[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_4__0_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_5_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_6__0_n_0\ : STD_LOGIC;
  signal \n0_q_m_reg_n_0_[1]\ : STD_LOGIC;
  signal \n0_q_m_reg_n_0_[2]\ : STD_LOGIC;
  signal \n0_q_m_reg_n_0_[3]\ : STD_LOGIC;
  signal n1_d : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \n1_d[0]_i_1_n_0\ : STD_LOGIC;
  signal \n1_d[0]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[1]_i_1_n_0\ : STD_LOGIC;
  signal \n1_d[1]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[2]_i_1_n_0\ : STD_LOGIC;
  signal \n1_d[2]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[3]_i_1_n_0\ : STD_LOGIC;
  signal \n1_d[3]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[3]_i_3_n_0\ : STD_LOGIC;
  signal \n1_d[3]_i_4_n_0\ : STD_LOGIC;
  signal \n1_q_m[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \n1_q_m[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \n1_q_m[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \n1_q_m[3]_i_2_n_0\ : STD_LOGIC;
  signal \n1_q_m[3]_i_3__0_n_0\ : STD_LOGIC;
  signal \n1_q_m[3]_i_4__0_n_0\ : STD_LOGIC;
  signal \n1_q_m_reg_n_0_[1]\ : STD_LOGIC;
  signal \n1_q_m_reg_n_0_[2]\ : STD_LOGIC;
  signal \n1_q_m_reg_n_0_[3]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in0_in : STD_LOGIC;
  signal p_0_in10_in : STD_LOGIC;
  signal p_0_in2_in : STD_LOGIC;
  signal p_0_in4_in : STD_LOGIC;
  signal p_0_in6_in : STD_LOGIC;
  signal p_0_in8_in : STD_LOGIC;
  signal \q_m_d[1]_i_1_n_0\ : STD_LOGIC;
  signal \q_m_d[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_m_d[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_m_d[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_m_d[5]_i_1_n_0\ : STD_LOGIC;
  signal \q_m_d[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_m_d[7]_i_1_n_0\ : STD_LOGIC;
  signal \q_m_d[7]_i_2__1_n_0\ : STD_LOGIC;
  signal \q_m_d[7]_i_3_n_0\ : STD_LOGIC;
  signal \q_m_d[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[0]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[1]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[2]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[3]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[4]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[5]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[6]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[7]\ : STD_LOGIC;
  signal \q_out_d[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_out_d[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_out_d[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_out_d[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_out_d[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_out_d[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_out_d[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_out_d[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_out_d[9]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_t_1[3]_i_4__0\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \cnt_t_1[3]_i_6__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \cnt_t_1[4]_i_11__0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \cnt_t_1[4]_i_6\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_2__0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_3__0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_4__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_5\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_6__0\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \n1_d[0]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \n1_d[3]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \n1_q_m[1]_i_1__1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \n1_q_m[2]_i_1__0\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \n1_q_m[3]_i_4__0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \q_m_d[3]_i_1__0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \q_m_d[4]_i_1__0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \q_m_d[5]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \q_m_d[6]_i_1__0\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \q_m_d[7]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \q_m_d[7]_i_2__1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \q_m_d[7]_i_3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \q_m_d[8]_i_1__0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \q_out_d[0]_i_1__0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \q_out_d[1]_i_1__0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \q_out_d[2]_i_1__0\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \q_out_d[4]_i_1__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \q_out_d[5]_i_1__0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \q_out_d[6]_i_1__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \q_out_d[7]_i_1__0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \q_out_d[9]_i_1\ : label is "soft_lutpair22";
begin
\cnt_t_1[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96666696"
    )
        port map (
      I0 => \cnt_t_1[1]_i_2__0_n_0\,
      I1 => cnt_t_1(1),
      I2 => \cnt_t_1[4]_i_3__0_n_0\,
      I3 => \cnt_t_1[1]_i_3__0_n_0\,
      I4 => \q_m_d[7]_i_2__1_n_0\,
      O => cnt_t(1)
    );
\cnt_t_1[1]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \n1_q_m_reg_n_0_[1]\,
      I1 => \n0_q_m_reg_n_0_[1]\,
      O => \cnt_t_1[1]_i_2__0_n_0\
    );
\cnt_t_1[1]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBB8888888B"
    )
        port map (
      I0 => \cnt_t_1[1]_i_4__0_n_0\,
      I1 => cnt_t_1(4),
      I2 => cnt_t_1(2),
      I3 => cnt_t_1(1),
      I4 => cnt_t_1(3),
      I5 => \cnt_t_1[4]_i_12__0_n_0\,
      O => \cnt_t_1[1]_i_3__0_n_0\
    );
\cnt_t_1[1]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD4D4D44DD4DDD4D"
    )
        port map (
      I0 => \n0_q_m_reg_n_0_[3]\,
      I1 => \n1_q_m_reg_n_0_[3]\,
      I2 => \n0_q_m_reg_n_0_[2]\,
      I3 => \n1_q_m_reg_n_0_[2]\,
      I4 => \n1_q_m_reg_n_0_[1]\,
      I5 => \n0_q_m_reg_n_0_[1]\,
      O => \cnt_t_1[1]_i_4__0_n_0\
    );
\cnt_t_1[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4BB4B44BB44B4BB4"
    )
        port map (
      I0 => \n0_q_m_reg_n_0_[1]\,
      I1 => \n1_q_m_reg_n_0_[1]\,
      I2 => \n0_q_m_reg_n_0_[2]\,
      I3 => \n1_q_m_reg_n_0_[2]\,
      I4 => cnt_t_1(2),
      I5 => \cnt_t_1[2]_i_2__0_n_0\,
      O => cnt_t(2)
    );
\cnt_t_1[2]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BD180F00BD180000"
    )
        port map (
      I0 => \q_m_d[7]_i_2__1_n_0\,
      I1 => \cnt_t_1[1]_i_3__0_n_0\,
      I2 => cnt_t_1(1),
      I3 => \cnt_t_1[1]_i_2__0_n_0\,
      I4 => \cnt_t_1[4]_i_3__0_n_0\,
      I5 => p_0_in,
      O => \cnt_t_1[2]_i_2__0_n_0\
    );
\cnt_t_1[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4777744444747747"
    )
        port map (
      I0 => \cnt_t_1[3]_i_2__0_n_0\,
      I1 => \cnt_t_1[4]_i_3__0_n_0\,
      I2 => p_0_in,
      I3 => \cnt_t_1[3]_i_3__0_n_0\,
      I4 => \cnt_t_1[3]_i_4__0_n_0\,
      I5 => \cnt_t_1[3]_i_5__0_n_0\,
      O => cnt_t(3)
    );
\cnt_t_1[3]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"609F9F606F90906F"
    )
        port map (
      I0 => \cnt_t_1[3]_i_6__0_n_0\,
      I1 => \cnt_t_1[3]_i_7_n_0\,
      I2 => \cnt_t_1[1]_i_3__0_n_0\,
      I3 => \cnt_t_1[4]_i_8__0_n_0\,
      I4 => cnt_t_1(3),
      I5 => \cnt_t_1[4]_i_9__0_n_0\,
      O => \cnt_t_1[3]_i_2__0_n_0\
    );
\cnt_t_1[3]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0402020446BFBF46"
    )
        port map (
      I0 => \n0_q_m_reg_n_0_[1]\,
      I1 => \n1_q_m_reg_n_0_[1]\,
      I2 => cnt_t_1(1),
      I3 => \n1_q_m_reg_n_0_[2]\,
      I4 => \n0_q_m_reg_n_0_[2]\,
      I5 => cnt_t_1(2),
      O => \cnt_t_1[3]_i_3__0_n_0\
    );
\cnt_t_1[3]_i_4__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cnt_t_1(3),
      I1 => \cnt_t_1[4]_i_8__0_n_0\,
      O => \cnt_t_1[3]_i_4__0_n_0\
    );
\cnt_t_1[3]_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F17F37133713F17F"
    )
        port map (
      I0 => cnt_t_1(1),
      I1 => cnt_t_1(2),
      I2 => \n0_q_m_reg_n_0_[1]\,
      I3 => \n1_q_m_reg_n_0_[1]\,
      I4 => \n0_q_m_reg_n_0_[2]\,
      I5 => \n1_q_m_reg_n_0_[2]\,
      O => \cnt_t_1[3]_i_5__0_n_0\
    );
\cnt_t_1[3]_i_6__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00006696"
    )
        port map (
      I0 => \n1_q_m_reg_n_0_[2]\,
      I1 => \n0_q_m_reg_n_0_[2]\,
      I2 => \n1_q_m_reg_n_0_[1]\,
      I3 => \n0_q_m_reg_n_0_[1]\,
      I4 => cnt_t_1(2),
      O => \cnt_t_1[3]_i_6__0_n_0\
    );
\cnt_t_1[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D741FFFFFFFFD741"
    )
        port map (
      I0 => \q_m_d[7]_i_2__1_n_0\,
      I1 => \n1_q_m_reg_n_0_[1]\,
      I2 => \n0_q_m_reg_n_0_[1]\,
      I3 => cnt_t_1(1),
      I4 => \cnt_t_1[4]_i_11__0_n_0\,
      I5 => cnt_t_1(2),
      O => \cnt_t_1[3]_i_7_n_0\
    );
\cnt_t_1[4]_i_10__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \n0_q_m_reg_n_0_[2]\,
      I1 => \n1_q_m_reg_n_0_[2]\,
      I2 => \n0_q_m_reg_n_0_[3]\,
      I3 => \n1_q_m_reg_n_0_[3]\,
      I4 => \n1_q_m_reg_n_0_[1]\,
      I5 => \n0_q_m_reg_n_0_[1]\,
      O => \cnt_t_1[4]_i_10__1_n_0\
    );
\cnt_t_1[4]_i_11__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4BB4"
    )
        port map (
      I0 => \n0_q_m_reg_n_0_[1]\,
      I1 => \n1_q_m_reg_n_0_[1]\,
      I2 => \n0_q_m_reg_n_0_[2]\,
      I3 => \n1_q_m_reg_n_0_[2]\,
      O => \cnt_t_1[4]_i_11__0_n_0\
    );
\cnt_t_1[4]_i_12__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB2BFFFF0000BB2B"
    )
        port map (
      I0 => \n0_q_m_reg_n_0_[2]\,
      I1 => \n1_q_m_reg_n_0_[2]\,
      I2 => \n1_q_m_reg_n_0_[1]\,
      I3 => \n0_q_m_reg_n_0_[1]\,
      I4 => \n1_q_m_reg_n_0_[3]\,
      I5 => \n0_q_m_reg_n_0_[3]\,
      O => \cnt_t_1[4]_i_12__0_n_0\
    );
\cnt_t_1[4]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7747477774444777"
    )
        port map (
      I0 => \cnt_t_1[4]_i_2__0_n_0\,
      I1 => \cnt_t_1[4]_i_3__0_n_0\,
      I2 => p_0_in,
      I3 => \cnt_t_1[4]_i_4__0_n_0\,
      I4 => \cnt_t_1[4]_i_5__0_n_0\,
      I5 => \cnt_t_1[4]_i_6_n_0\,
      O => cnt_t(4)
    );
\cnt_t_1[4]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4BC30F784BF03C78"
    )
        port map (
      I0 => \cnt_t_1[4]_i_7__0_n_0\,
      I1 => \cnt_t_1[1]_i_3__0_n_0\,
      I2 => \cnt_t_1[4]_i_5__0_n_0\,
      I3 => \cnt_t_1[4]_i_8__0_n_0\,
      I4 => cnt_t_1(3),
      I5 => \cnt_t_1[4]_i_9__0_n_0\,
      O => \cnt_t_1[4]_i_2__0_n_0\
    );
\cnt_t_1[4]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => cnt_t_1(4),
      I1 => cnt_t_1(3),
      I2 => cnt_t_1(1),
      I3 => cnt_t_1(2),
      I4 => \cnt_t_1[4]_i_10__1_n_0\,
      O => \cnt_t_1[4]_i_3__0_n_0\
    );
\cnt_t_1[4]_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20F2FFFF000020F2"
    )
        port map (
      I0 => \cnt_t_1[1]_i_2__0_n_0\,
      I1 => cnt_t_1(1),
      I2 => \cnt_t_1[4]_i_11__0_n_0\,
      I3 => cnt_t_1(2),
      I4 => cnt_t_1(3),
      I5 => \cnt_t_1[4]_i_8__0_n_0\,
      O => \cnt_t_1[4]_i_4__0_n_0\
    );
\cnt_t_1[4]_i_5__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \cnt_t_1[4]_i_12__0_n_0\,
      I1 => cnt_t_1(4),
      O => \cnt_t_1[4]_i_5__0_n_0\
    );
\cnt_t_1[4]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8E"
    )
        port map (
      I0 => cnt_t_1(3),
      I1 => \cnt_t_1[4]_i_8__0_n_0\,
      I2 => \cnt_t_1[3]_i_5__0_n_0\,
      O => \cnt_t_1[4]_i_6_n_0\
    );
\cnt_t_1[4]_i_7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4DDDDD4D444D4D44"
    )
        port map (
      I0 => cnt_t_1(2),
      I1 => \cnt_t_1[4]_i_11__0_n_0\,
      I2 => cnt_t_1(1),
      I3 => \n0_q_m_reg_n_0_[1]\,
      I4 => \n1_q_m_reg_n_0_[1]\,
      I5 => \q_m_d[7]_i_2__1_n_0\,
      O => \cnt_t_1[4]_i_7__0_n_0\
    );
\cnt_t_1[4]_i_8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40F4BF0BBF0B40F4"
    )
        port map (
      I0 => \n0_q_m_reg_n_0_[1]\,
      I1 => \n1_q_m_reg_n_0_[1]\,
      I2 => \n1_q_m_reg_n_0_[2]\,
      I3 => \n0_q_m_reg_n_0_[2]\,
      I4 => \n1_q_m_reg_n_0_[3]\,
      I5 => \n0_q_m_reg_n_0_[3]\,
      O => \cnt_t_1[4]_i_8__0_n_0\
    );
\cnt_t_1[4]_i_9__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8EEEEE8E888E8E88"
    )
        port map (
      I0 => cnt_t_1(2),
      I1 => \cnt_t_1[4]_i_11__0_n_0\,
      I2 => \q_m_d[7]_i_2__1_n_0\,
      I3 => \n1_q_m_reg_n_0_[1]\,
      I4 => \n0_q_m_reg_n_0_[1]\,
      I5 => cnt_t_1(1),
      O => \cnt_t_1[4]_i_9__0_n_0\
    );
\cnt_t_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(1),
      Q => cnt_t_1(1),
      R => SR(0)
    );
\cnt_t_1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(2),
      Q => cnt_t_1(2),
      R => SR(0)
    );
\cnt_t_1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(3),
      Q => cnt_t_1(3),
      R => SR(0)
    );
\cnt_t_1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(4),
      Q => cnt_t_1(4),
      R => SR(0)
    );
\d_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(0),
      Q => \d_d_reg_n_0_[0]\,
      R => '0'
    );
\d_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(1),
      Q => \d_d_reg_n_0_[1]\,
      R => '0'
    );
\d_d_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(2),
      Q => p_0_in0_in,
      R => '0'
    );
\d_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(3),
      Q => p_0_in2_in,
      R => '0'
    );
\d_d_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(4),
      Q => p_0_in4_in,
      R => '0'
    );
\d_d_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(5),
      Q => p_0_in6_in,
      R => '0'
    );
\d_d_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(6),
      Q => p_0_in8_in,
      R => '0'
    );
\d_d_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(7),
      Q => p_0_in10_in,
      R => '0'
    );
\n0_q_m[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A69A65A6"
    )
        port map (
      I0 => \n0_q_m[1]_i_2_n_0\,
      I1 => \n0_q_m[3]_i_4__0_n_0\,
      I2 => \n0_q_m[3]_i_3__0_n_0\,
      I3 => \d_d_reg_n_0_[0]\,
      I4 => \n0_q_m[3]_i_2__0_n_0\,
      O => \n0_q_m[1]_i_1__0_n_0\
    );
\n0_q_m[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6966996996996696"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => \q_m_d[7]_i_2__1_n_0\,
      I3 => p_0_in2_in,
      I4 => p_0_in0_in,
      I5 => \n0_q_m[3]_i_6__0_n_0\,
      O => \n0_q_m[1]_i_2_n_0\
    );
\n0_q_m[2]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B2FBFFDF0020B2FB"
    )
        port map (
      I0 => \n0_q_m[3]_i_2__0_n_0\,
      I1 => \d_d_reg_n_0_[0]\,
      I2 => \n0_q_m[3]_i_3__0_n_0\,
      I3 => \n0_q_m[3]_i_4__0_n_0\,
      I4 => \n0_q_m[3]_i_5_n_0\,
      I5 => \n0_q_m[3]_i_6__0_n_0\,
      O => \n0_q_m[2]_i_1__0_n_0\
    );
\n0_q_m[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \n0_q_m[3]_i_2__0_n_0\,
      I1 => \n0_q_m[3]_i_3__0_n_0\,
      I2 => \n0_q_m[3]_i_4__0_n_0\,
      I3 => \d_d_reg_n_0_[0]\,
      I4 => \n0_q_m[3]_i_5_n_0\,
      I5 => \n0_q_m[3]_i_6__0_n_0\,
      O => \n0_q_m[3]_i_1__0_n_0\
    );
\n0_q_m[3]_i_2__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => \d_d_reg_n_0_[0]\,
      I2 => \d_d_reg_n_0_[1]\,
      O => \n0_q_m[3]_i_2__0_n_0\
    );
\n0_q_m[3]_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \q_m_d[7]_i_2__1_n_0\,
      I1 => \q_m_d[7]_i_3_n_0\,
      I2 => p_0_in6_in,
      I3 => p_0_in10_in,
      I4 => p_0_in8_in,
      O => \n0_q_m[3]_i_3__0_n_0\
    );
\n0_q_m[3]_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \q_m_d[7]_i_3_n_0\,
      I1 => p_0_in8_in,
      I2 => \q_m_d[7]_i_2__1_n_0\,
      O => \n0_q_m[3]_i_4__0_n_0\
    );
\n0_q_m[3]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B24D4DB2"
    )
        port map (
      I0 => p_0_in0_in,
      I1 => p_0_in2_in,
      I2 => \q_m_d[7]_i_2__1_n_0\,
      I3 => \d_d_reg_n_0_[1]\,
      I4 => \d_d_reg_n_0_[0]\,
      O => \n0_q_m[3]_i_5_n_0\
    );
\n0_q_m[3]_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9CC6"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \q_m_d[7]_i_3_n_0\,
      I2 => \q_m_d[7]_i_2__1_n_0\,
      I3 => p_0_in8_in,
      O => \n0_q_m[3]_i_6__0_n_0\
    );
\n0_q_m_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n0_q_m[1]_i_1__0_n_0\,
      Q => \n0_q_m_reg_n_0_[1]\,
      R => '0'
    );
\n0_q_m_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n0_q_m[2]_i_1__0_n_0\,
      Q => \n0_q_m_reg_n_0_[2]\,
      R => '0'
    );
\n0_q_m_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n0_q_m[3]_i_1__0_n_0\,
      Q => \n0_q_m_reg_n_0_[3]\,
      R => '0'
    );
\n1_d[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => VGA_RGB(0),
      I1 => VGA_RGB(7),
      I2 => \n1_d[0]_i_2_n_0\,
      I3 => VGA_RGB(2),
      I4 => VGA_RGB(1),
      I5 => VGA_RGB(3),
      O => \n1_d[0]_i_1_n_0\
    );
\n1_d[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => VGA_RGB(6),
      I1 => VGA_RGB(4),
      I2 => VGA_RGB(5),
      O => \n1_d[0]_i_2_n_0\
    );
\n1_d[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \n1_d[3]_i_2_n_0\,
      I1 => \n1_d[1]_i_2_n_0\,
      I2 => \n1_d[3]_i_3_n_0\,
      O => \n1_d[1]_i_1_n_0\
    );
\n1_d[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"171717E817E8E8E8"
    )
        port map (
      I0 => VGA_RGB(3),
      I1 => VGA_RGB(2),
      I2 => VGA_RGB(1),
      I3 => VGA_RGB(6),
      I4 => VGA_RGB(5),
      I5 => VGA_RGB(4),
      O => \n1_d[1]_i_2_n_0\
    );
\n1_d[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7E7E7EE87EE8E8E8"
    )
        port map (
      I0 => \n1_d[3]_i_2_n_0\,
      I1 => \n1_d[3]_i_3_n_0\,
      I2 => \n1_d[2]_i_2_n_0\,
      I3 => VGA_RGB(4),
      I4 => VGA_RGB(5),
      I5 => VGA_RGB(6),
      O => \n1_d[2]_i_1_n_0\
    );
\n1_d[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => VGA_RGB(1),
      I1 => VGA_RGB(2),
      I2 => VGA_RGB(3),
      O => \n1_d[2]_i_2_n_0\
    );
\n1_d[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8880800000000000"
    )
        port map (
      I0 => \n1_d[3]_i_2_n_0\,
      I1 => \n1_d[3]_i_3_n_0\,
      I2 => VGA_RGB(3),
      I3 => VGA_RGB(2),
      I4 => VGA_RGB(1),
      I5 => \n1_d[3]_i_4_n_0\,
      O => \n1_d[3]_i_1_n_0\
    );
\n1_d[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9600009600969600"
    )
        port map (
      I0 => VGA_RGB(2),
      I1 => VGA_RGB(1),
      I2 => VGA_RGB(3),
      I3 => VGA_RGB(0),
      I4 => VGA_RGB(7),
      I5 => \n1_d[0]_i_2_n_0\,
      O => \n1_d[3]_i_2_n_0\
    );
\n1_d[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E88E8EE8"
    )
        port map (
      I0 => VGA_RGB(7),
      I1 => VGA_RGB(0),
      I2 => VGA_RGB(5),
      I3 => VGA_RGB(4),
      I4 => VGA_RGB(6),
      O => \n1_d[3]_i_3_n_0\
    );
\n1_d[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => VGA_RGB(4),
      I1 => VGA_RGB(5),
      I2 => VGA_RGB(6),
      O => \n1_d[3]_i_4_n_0\
    );
\n1_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_d[0]_i_1_n_0\,
      Q => n1_d(0),
      R => '0'
    );
\n1_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_d[1]_i_1_n_0\,
      Q => n1_d(1),
      R => '0'
    );
\n1_d_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_d[2]_i_1_n_0\,
      Q => n1_d(2),
      R => '0'
    );
\n1_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_d[3]_i_1_n_0\,
      Q => n1_d(3),
      R => '0'
    );
\n1_q_m[1]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \n1_q_m[3]_i_4__0_n_0\,
      I1 => \n0_q_m[1]_i_2_n_0\,
      I2 => \n1_q_m[3]_i_3__0_n_0\,
      O => \n1_q_m[1]_i_1__1_n_0\
    );
\n1_q_m[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E87E"
    )
        port map (
      I0 => \n1_q_m[3]_i_4__0_n_0\,
      I1 => \n1_q_m[3]_i_3__0_n_0\,
      I2 => \n0_q_m[3]_i_5_n_0\,
      I3 => \n0_q_m[3]_i_6__0_n_0\,
      O => \n1_q_m[2]_i_1__0_n_0\
    );
\n1_q_m[3]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \n1_q_m[3]_i_2_n_0\,
      I1 => \n1_q_m[3]_i_3__0_n_0\,
      I2 => \n1_q_m[3]_i_4__0_n_0\,
      O => \n1_q_m[3]_i_1__0_n_0\
    );
\n1_q_m[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000096996696"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => \q_m_d[7]_i_2__1_n_0\,
      I3 => p_0_in2_in,
      I4 => p_0_in0_in,
      I5 => \n0_q_m[3]_i_6__0_n_0\,
      O => \n1_q_m[3]_i_2_n_0\
    );
\n1_q_m[3]_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2EE2E22E8BB8B88B"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => p_0_in6_in,
      I2 => \q_m_d[7]_i_2__1_n_0\,
      I3 => p_0_in8_in,
      I4 => \q_m_d[7]_i_3_n_0\,
      I5 => p_0_in10_in,
      O => \n1_q_m[3]_i_3__0_n_0\
    );
\n1_q_m[3]_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"90060690"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => p_0_in10_in,
      I2 => \d_d_reg_n_0_[0]\,
      I3 => \d_d_reg_n_0_[1]\,
      I4 => p_0_in2_in,
      O => \n1_q_m[3]_i_4__0_n_0\
    );
\n1_q_m_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_q_m[1]_i_1__1_n_0\,
      Q => \n1_q_m_reg_n_0_[1]\,
      R => '0'
    );
\n1_q_m_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_q_m[2]_i_1__0_n_0\,
      Q => \n1_q_m_reg_n_0_[2]\,
      R => '0'
    );
\n1_q_m_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n1_q_m[3]_i_1__0_n_0\,
      Q => \n1_q_m_reg_n_0_[3]\,
      R => '0'
    );
\q_m_d[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA55AA5599669566"
    )
        port map (
      I0 => \d_d_reg_n_0_[1]\,
      I1 => n1_d(2),
      I2 => n1_d(1),
      I3 => \d_d_reg_n_0_[0]\,
      I4 => n1_d(0),
      I5 => n1_d(3),
      O => \q_m_d[1]_i_1_n_0\
    );
\q_m_d[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => p_0_in0_in,
      O => \q_m_d[2]_i_1__0_n_0\
    );
\q_m_d[3]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => p_0_in0_in,
      I3 => \q_m_d[7]_i_2__1_n_0\,
      I4 => p_0_in2_in,
      O => \q_m_d[3]_i_1__0_n_0\
    );
\q_m_d[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => p_0_in4_in,
      I2 => p_0_in0_in,
      I3 => \d_d_reg_n_0_[1]\,
      I4 => \d_d_reg_n_0_[0]\,
      O => \q_m_d[4]_i_1__0_n_0\
    );
\q_m_d[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => \q_m_d[7]_i_2__1_n_0\,
      I1 => \q_m_d[7]_i_3_n_0\,
      I2 => p_0_in6_in,
      O => \q_m_d[5]_i_1_n_0\
    );
\q_m_d[6]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => p_0_in8_in,
      I1 => \q_m_d[7]_i_3_n_0\,
      I2 => p_0_in6_in,
      O => \q_m_d[6]_i_1__0_n_0\
    );
\q_m_d[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \q_m_d[7]_i_2__1_n_0\,
      I1 => \q_m_d[7]_i_3_n_0\,
      I2 => p_0_in6_in,
      I3 => p_0_in8_in,
      I4 => p_0_in10_in,
      O => \q_m_d[7]_i_1_n_0\
    );
\q_m_d[7]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEFAAAA"
    )
        port map (
      I0 => n1_d(3),
      I1 => n1_d(0),
      I2 => \d_d_reg_n_0_[0]\,
      I3 => n1_d(1),
      I4 => n1_d(2),
      O => \q_m_d[7]_i_2__1_n_0\
    );
\q_m_d[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => p_0_in0_in,
      I3 => p_0_in4_in,
      I4 => p_0_in2_in,
      O => \q_m_d[7]_i_3_n_0\
    );
\q_m_d[8]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005575"
    )
        port map (
      I0 => n1_d(2),
      I1 => n1_d(1),
      I2 => \d_d_reg_n_0_[0]\,
      I3 => n1_d(0),
      I4 => n1_d(3),
      O => \q_m_d[8]_i_1__0_n_0\
    );
\q_m_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \d_d_reg_n_0_[0]\,
      Q => \q_m_d_reg_n_0_[0]\,
      R => '0'
    );
\q_m_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[1]_i_1_n_0\,
      Q => \q_m_d_reg_n_0_[1]\,
      R => '0'
    );
\q_m_d_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[2]_i_1__0_n_0\,
      Q => \q_m_d_reg_n_0_[2]\,
      R => '0'
    );
\q_m_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[3]_i_1__0_n_0\,
      Q => \q_m_d_reg_n_0_[3]\,
      R => '0'
    );
\q_m_d_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[4]_i_1__0_n_0\,
      Q => \q_m_d_reg_n_0_[4]\,
      R => '0'
    );
\q_m_d_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[5]_i_1_n_0\,
      Q => \q_m_d_reg_n_0_[5]\,
      R => '0'
    );
\q_m_d_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[6]_i_1__0_n_0\,
      Q => \q_m_d_reg_n_0_[6]\,
      R => '0'
    );
\q_m_d_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[7]_i_1_n_0\,
      Q => \q_m_d_reg_n_0_[7]\,
      R => '0'
    );
\q_m_d_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[8]_i_1__0_n_0\,
      Q => p_0_in,
      R => '0'
    );
\q_out_d[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_3__0_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3__0_n_0\,
      I3 => \q_m_d_reg_n_0_[0]\,
      O => \q_out_d[0]_i_1__0_n_0\
    );
\q_out_d[1]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_3__0_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3__0_n_0\,
      I3 => \q_m_d_reg_n_0_[1]\,
      O => \q_out_d[1]_i_1__0_n_0\
    );
\q_out_d[2]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_3__0_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3__0_n_0\,
      I3 => \q_m_d_reg_n_0_[2]\,
      O => \q_out_d[2]_i_1__0_n_0\
    );
\q_out_d[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_3__0_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3__0_n_0\,
      I3 => \q_m_d_reg_n_0_[3]\,
      O => \q_out_d[3]_i_1__0_n_0\
    );
\q_out_d[4]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_3__0_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3__0_n_0\,
      I3 => \q_m_d_reg_n_0_[4]\,
      O => \q_out_d[4]_i_1__0_n_0\
    );
\q_out_d[5]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_3__0_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3__0_n_0\,
      I3 => \q_m_d_reg_n_0_[5]\,
      O => \q_out_d[5]_i_1__0_n_0\
    );
\q_out_d[6]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_3__0_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3__0_n_0\,
      I3 => \q_m_d_reg_n_0_[6]\,
      O => \q_out_d[6]_i_1__0_n_0\
    );
\q_out_d[7]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_3__0_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3__0_n_0\,
      I3 => \q_m_d_reg_n_0_[7]\,
      O => \q_out_d[7]_i_1__0_n_0\
    );
\q_out_d[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_3__0_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3__0_n_0\,
      O => \q_out_d[9]_i_1_n_0\
    );
\q_out_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[0]_i_1__0_n_0\,
      Q => Q(0),
      R => SR(0)
    );
\q_out_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[1]_i_1__0_n_0\,
      Q => Q(1),
      R => SR(0)
    );
\q_out_d_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[2]_i_1__0_n_0\,
      Q => Q(2),
      S => SR(0)
    );
\q_out_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[3]_i_1__0_n_0\,
      Q => Q(3),
      R => SR(0)
    );
\q_out_d_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[4]_i_1__0_n_0\,
      Q => Q(4),
      S => SR(0)
    );
\q_out_d_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[5]_i_1__0_n_0\,
      Q => Q(5),
      R => SR(0)
    );
\q_out_d_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[6]_i_1__0_n_0\,
      Q => Q(6),
      S => SR(0)
    );
\q_out_d_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[7]_i_1__0_n_0\,
      Q => Q(7),
      R => SR(0)
    );
\q_out_d_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => p_0_in,
      Q => Q(8),
      S => SR(0)
    );
\q_out_d_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[9]_i_1_n_0\,
      Q => Q(9),
      S => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_display_0_TMDSEncoder_1 is
  port (
    de_dd : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 9 downto 0 );
    VGA_DE : in STD_LOGIC;
    PXLCLK_I : in STD_LOGIC;
    VGA_RGB : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hdmi_display_0_TMDSEncoder_1 : entity is "TMDSEncoder";
end hdmi_display_0_TMDSEncoder_1;

architecture STRUCTURE of hdmi_display_0_TMDSEncoder_1 is
  signal R0 : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal cnt_t : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal cnt_t_1 : STD_LOGIC_VECTOR ( 4 downto 1 );
  signal \cnt_t_1[1]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_t_1[1]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_t_1[1]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_t_1[2]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_t_1[3]_i_6_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_10__0_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_11_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_12_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_13_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_6__1_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_7_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_8_n_0\ : STD_LOGIC;
  signal \cnt_t_1[4]_i_9_n_0\ : STD_LOGIC;
  signal \d_d_reg_n_0_[0]\ : STD_LOGIC;
  signal \d_d_reg_n_0_[1]\ : STD_LOGIC;
  signal de_d : STD_LOGIC;
  signal \^de_dd\ : STD_LOGIC;
  signal int_n1_q_m : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal n0_q_m : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \n0_q_m[1]_i_1_n_0\ : STD_LOGIC;
  signal \n0_q_m[2]_i_1_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_1_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_2_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_3_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_4_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_5__1_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_6_n_0\ : STD_LOGIC;
  signal \n0_q_m[3]_i_7_n_0\ : STD_LOGIC;
  signal n1_d : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \n1_d[0]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[1]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[2]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[3]_i_2_n_0\ : STD_LOGIC;
  signal \n1_d[3]_i_3_n_0\ : STD_LOGIC;
  signal \n1_d[3]_i_4_n_0\ : STD_LOGIC;
  signal n1_q_m : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \n1_q_m[3]_i_2__1_n_0\ : STD_LOGIC;
  signal \n1_q_m[3]_i_3_n_0\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_0_in0_in : STD_LOGIC;
  signal p_0_in10_in : STD_LOGIC;
  signal p_0_in2_in : STD_LOGIC;
  signal p_0_in4_in : STD_LOGIC;
  signal p_0_in6_in : STD_LOGIC;
  signal p_0_in8_in : STD_LOGIC;
  signal plusOp6_out : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \q_m_d[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_m_d[2]_i_1_n_0\ : STD_LOGIC;
  signal \q_m_d[3]_i_1_n_0\ : STD_LOGIC;
  signal \q_m_d[4]_i_1_n_0\ : STD_LOGIC;
  signal \q_m_d[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_m_d[6]_i_1_n_0\ : STD_LOGIC;
  signal \q_m_d[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \q_m_d[7]_i_2_n_0\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[0]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[1]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[2]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[3]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[4]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[5]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[6]\ : STD_LOGIC;
  signal \q_m_d_reg_n_0_[7]\ : STD_LOGIC;
  signal q_out0_in : STD_LOGIC_VECTOR ( 6 downto 2 );
  signal \q_out_d[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_out_d[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_out_d[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_out_d[5]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_out_d[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \q_out_d[9]_i_1__1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt_t_1[1]_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \cnt_t_1[3]_i_3\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \cnt_t_1[3]_i_6\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \cnt_t_1[4]_i_3\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_3\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_4\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_5__1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \n0_q_m[3]_i_7\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \n1_d[0]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \n1_d[3]_i_3\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \n1_q_m[2]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \n1_q_m[3]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \n1_q_m[3]_i_2__1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \q_m_d[2]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \q_m_d[3]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \q_m_d[4]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \q_m_d[5]_i_1__0\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \q_m_d[6]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \q_m_d[7]_i_1__0\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \q_m_d[7]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \q_out_d[0]_i_1__1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \q_out_d[1]_i_1__1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \q_out_d[2]_i_1__1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \q_out_d[4]_i_1__1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \q_out_d[5]_i_1__1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \q_out_d[6]_i_1__1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \q_out_d[7]_i_1__1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \q_out_d[9]_i_1__1\ : label is "soft_lutpair34";
begin
  SR(0) <= \^sr\(0);
  de_dd <= \^de_dd\;
\cnt_t_1[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"66969666"
    )
        port map (
      I0 => \cnt_t_1[1]_i_2_n_0\,
      I1 => cnt_t_1(1),
      I2 => \cnt_t_1[4]_i_4_n_0\,
      I3 => \cnt_t_1[1]_i_3_n_0\,
      I4 => R0,
      O => cnt_t(1)
    );
\cnt_t_1[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => n1_q_m(1),
      I1 => n0_q_m(1),
      O => \cnt_t_1[1]_i_2_n_0\
    );
\cnt_t_1[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBBBBBBB8888888B"
    )
        port map (
      I0 => \cnt_t_1[1]_i_4_n_0\,
      I1 => cnt_t_1(4),
      I2 => cnt_t_1(2),
      I3 => cnt_t_1(1),
      I4 => cnt_t_1(3),
      I5 => \cnt_t_1[4]_i_12_n_0\,
      O => \cnt_t_1[1]_i_3_n_0\
    );
\cnt_t_1[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DD4D4D44DD4DDD4D"
    )
        port map (
      I0 => n0_q_m(3),
      I1 => n1_q_m(3),
      I2 => n0_q_m(2),
      I3 => n1_q_m(2),
      I4 => n1_q_m(1),
      I5 => n0_q_m(1),
      O => \cnt_t_1[1]_i_4_n_0\
    );
\cnt_t_1[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4BB4B44BB44B4BB4"
    )
        port map (
      I0 => n0_q_m(1),
      I1 => n1_q_m(1),
      I2 => n0_q_m(2),
      I3 => n1_q_m(2),
      I4 => cnt_t_1(2),
      I5 => \cnt_t_1[2]_i_2_n_0\,
      O => cnt_t(2)
    );
\cnt_t_1[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"72E400F072E40000"
    )
        port map (
      I0 => R0,
      I1 => \cnt_t_1[1]_i_3_n_0\,
      I2 => \cnt_t_1[1]_i_2_n_0\,
      I3 => cnt_t_1(1),
      I4 => \cnt_t_1[4]_i_4_n_0\,
      I5 => p_0_in,
      O => \cnt_t_1[2]_i_2_n_0\
    );
\cnt_t_1[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F1FEFDF2010E0D02"
    )
        port map (
      I0 => \cnt_t_1[3]_i_2_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[4]_i_4_n_0\,
      I3 => \cnt_t_1[3]_i_3_n_0\,
      I4 => \cnt_t_1[3]_i_4_n_0\,
      I5 => \cnt_t_1[3]_i_5_n_0\,
      O => cnt_t(3)
    );
\cnt_t_1[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3820EF08EF083820"
    )
        port map (
      I0 => cnt_t_1(1),
      I1 => n0_q_m(1),
      I2 => n1_q_m(1),
      I3 => cnt_t_1(2),
      I4 => n1_q_m(2),
      I5 => n0_q_m(2),
      O => \cnt_t_1[3]_i_2_n_0\
    );
\cnt_t_1[3]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cnt_t_1(3),
      I1 => \cnt_t_1[4]_i_8_n_0\,
      O => \cnt_t_1[3]_i_3_n_0\
    );
\cnt_t_1[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1004041034DFDF34"
    )
        port map (
      I0 => cnt_t_1(1),
      I1 => n0_q_m(1),
      I2 => n1_q_m(1),
      I3 => n1_q_m(2),
      I4 => n0_q_m(2),
      I5 => cnt_t_1(2),
      O => \cnt_t_1[3]_i_4_n_0\
    );
\cnt_t_1[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B200B2FF4DFF4D00"
    )
        port map (
      I0 => \cnt_t_1[3]_i_6_n_0\,
      I1 => \cnt_t_1[4]_i_13_n_0\,
      I2 => cnt_t_1(2),
      I3 => \cnt_t_1[1]_i_3_n_0\,
      I4 => \cnt_t_1[4]_i_11_n_0\,
      I5 => \cnt_t_1[3]_i_3_n_0\,
      O => \cnt_t_1[3]_i_5_n_0\
    );
\cnt_t_1[3]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EB82"
    )
        port map (
      I0 => cnt_t_1(1),
      I1 => n0_q_m(1),
      I2 => n1_q_m(1),
      I3 => R0,
      O => \cnt_t_1[3]_i_6_n_0\
    );
\cnt_t_1[4]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^de_dd\,
      O => \^sr\(0)
    );
\cnt_t_1[4]_i_10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"444D4D444DDDDD4D"
    )
        port map (
      I0 => cnt_t_1(2),
      I1 => \cnt_t_1[4]_i_13_n_0\,
      I2 => cnt_t_1(1),
      I3 => n0_q_m(1),
      I4 => n1_q_m(1),
      I5 => R0,
      O => \cnt_t_1[4]_i_10__0_n_0\
    );
\cnt_t_1[4]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEE8EE88EE88888"
    )
        port map (
      I0 => cnt_t_1(2),
      I1 => \cnt_t_1[4]_i_13_n_0\,
      I2 => n1_q_m(1),
      I3 => n0_q_m(1),
      I4 => cnt_t_1(1),
      I5 => R0,
      O => \cnt_t_1[4]_i_11_n_0\
    );
\cnt_t_1[4]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB2BFFFF0000BB2B"
    )
        port map (
      I0 => n0_q_m(2),
      I1 => n1_q_m(2),
      I2 => n1_q_m(1),
      I3 => n0_q_m(1),
      I4 => n1_q_m(3),
      I5 => n0_q_m(3),
      O => \cnt_t_1[4]_i_12_n_0\
    );
\cnt_t_1[4]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4BB4"
    )
        port map (
      I0 => n0_q_m(1),
      I1 => n1_q_m(1),
      I2 => n0_q_m(2),
      I3 => n1_q_m(2),
      O => \cnt_t_1[4]_i_13_n_0\
    );
\cnt_t_1[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01F10EFE0DFD02F2"
    )
        port map (
      I0 => \cnt_t_1[4]_i_3_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[4]_i_4_n_0\,
      I3 => \cnt_t_1[4]_i_5_n_0\,
      I4 => \cnt_t_1[4]_i_6__1_n_0\,
      I5 => \cnt_t_1[4]_i_7_n_0\,
      O => cnt_t(4)
    );
\cnt_t_1[4]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => \cnt_t_1[3]_i_2_n_0\,
      I1 => cnt_t_1(3),
      I2 => \cnt_t_1[4]_i_8_n_0\,
      O => \cnt_t_1[4]_i_3_n_0\
    );
\cnt_t_1[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => cnt_t_1(4),
      I1 => cnt_t_1(3),
      I2 => cnt_t_1(1),
      I3 => cnt_t_1(2),
      I4 => \cnt_t_1[4]_i_9_n_0\,
      O => \cnt_t_1[4]_i_4_n_0\
    );
\cnt_t_1[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B4F03C87B4C30F87"
    )
        port map (
      I0 => \cnt_t_1[4]_i_10__0_n_0\,
      I1 => \cnt_t_1[1]_i_3_n_0\,
      I2 => \cnt_t_1[4]_i_6__1_n_0\,
      I3 => cnt_t_1(3),
      I4 => \cnt_t_1[4]_i_8_n_0\,
      I5 => \cnt_t_1[4]_i_11_n_0\,
      O => \cnt_t_1[4]_i_5_n_0\
    );
\cnt_t_1[4]_i_6__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \cnt_t_1[4]_i_12_n_0\,
      I1 => cnt_t_1(4),
      O => \cnt_t_1[4]_i_6__1_n_0\
    );
\cnt_t_1[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40F4FFFF000040F4"
    )
        port map (
      I0 => cnt_t_1(1),
      I1 => \cnt_t_1[1]_i_2_n_0\,
      I2 => \cnt_t_1[4]_i_13_n_0\,
      I3 => cnt_t_1(2),
      I4 => cnt_t_1(3),
      I5 => \cnt_t_1[4]_i_8_n_0\,
      O => \cnt_t_1[4]_i_7_n_0\
    );
\cnt_t_1[4]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"40F4BF0BBF0B40F4"
    )
        port map (
      I0 => n0_q_m(1),
      I1 => n1_q_m(1),
      I2 => n1_q_m(2),
      I3 => n0_q_m(2),
      I4 => n1_q_m(3),
      I5 => n0_q_m(3),
      O => \cnt_t_1[4]_i_8_n_0\
    );
\cnt_t_1[4]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => n1_q_m(3),
      I1 => n0_q_m(3),
      I2 => n1_q_m(1),
      I3 => n0_q_m(1),
      I4 => n1_q_m(2),
      I5 => n0_q_m(2),
      O => \cnt_t_1[4]_i_9_n_0\
    );
\cnt_t_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(1),
      Q => cnt_t_1(1),
      R => \^sr\(0)
    );
\cnt_t_1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(2),
      Q => cnt_t_1(2),
      R => \^sr\(0)
    );
\cnt_t_1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(3),
      Q => cnt_t_1(3),
      R => \^sr\(0)
    );
\cnt_t_1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => PXLCLK_I,
      CE => '1',
      D => cnt_t(4),
      Q => cnt_t_1(4),
      R => \^sr\(0)
    );
\d_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(0),
      Q => \d_d_reg_n_0_[0]\,
      R => '0'
    );
\d_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(1),
      Q => \d_d_reg_n_0_[1]\,
      R => '0'
    );
\d_d_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(2),
      Q => p_0_in0_in,
      R => '0'
    );
\d_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(3),
      Q => p_0_in2_in,
      R => '0'
    );
\d_d_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(4),
      Q => p_0_in4_in,
      R => '0'
    );
\d_d_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(5),
      Q => p_0_in6_in,
      R => '0'
    );
\d_d_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(6),
      Q => p_0_in8_in,
      R => '0'
    );
\d_d_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_RGB(7),
      Q => p_0_in10_in,
      R => '0'
    );
de_d_reg: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => VGA_DE,
      Q => de_d,
      R => '0'
    );
de_dd_reg: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => de_d,
      Q => \^de_dd\,
      R => '0'
    );
\n0_q_m[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"9AA6599A"
    )
        port map (
      I0 => \n0_q_m[3]_i_2_n_0\,
      I1 => \n0_q_m[3]_i_5__1_n_0\,
      I2 => \n0_q_m[3]_i_4_n_0\,
      I3 => \d_d_reg_n_0_[0]\,
      I4 => \n0_q_m[3]_i_3_n_0\,
      O => \n0_q_m[1]_i_1_n_0\
    );
\n0_q_m[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555955556555A665"
    )
        port map (
      I0 => \n0_q_m[3]_i_6_n_0\,
      I1 => \n0_q_m[3]_i_3_n_0\,
      I2 => \d_d_reg_n_0_[0]\,
      I3 => \n0_q_m[3]_i_4_n_0\,
      I4 => \n0_q_m[3]_i_5__1_n_0\,
      I5 => \n0_q_m[3]_i_2_n_0\,
      O => \n0_q_m[2]_i_1_n_0\
    );
\n0_q_m[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000080000"
    )
        port map (
      I0 => \n0_q_m[3]_i_2_n_0\,
      I1 => \n0_q_m[3]_i_3_n_0\,
      I2 => \d_d_reg_n_0_[0]\,
      I3 => \n0_q_m[3]_i_4_n_0\,
      I4 => \n0_q_m[3]_i_5__1_n_0\,
      I5 => \n0_q_m[3]_i_6_n_0\,
      O => \n0_q_m[3]_i_1_n_0\
    );
\n0_q_m[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9666999669996669"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => R0,
      I3 => p_0_in2_in,
      I4 => p_0_in0_in,
      I5 => \n0_q_m[3]_i_7_n_0\,
      O => \n0_q_m[3]_i_2_n_0\
    );
\n0_q_m[3]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => \d_d_reg_n_0_[0]\,
      I2 => \d_d_reg_n_0_[1]\,
      O => \n0_q_m[3]_i_3_n_0\
    );
\n0_q_m[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \q_m_d[7]_i_2_n_0\,
      I1 => p_0_in8_in,
      I2 => R0,
      O => \n0_q_m[3]_i_4_n_0\
    );
\n0_q_m[3]_i_5__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => R0,
      I1 => \q_m_d[7]_i_2_n_0\,
      I2 => p_0_in6_in,
      I3 => p_0_in10_in,
      I4 => p_0_in8_in,
      O => \n0_q_m[3]_i_5__1_n_0\
    );
\n0_q_m[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000069996669"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => R0,
      I3 => p_0_in2_in,
      I4 => p_0_in0_in,
      I5 => \n0_q_m[3]_i_7_n_0\,
      O => \n0_q_m[3]_i_6_n_0\
    );
\n0_q_m[3]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C96C"
    )
        port map (
      I0 => p_0_in6_in,
      I1 => \q_m_d[7]_i_2_n_0\,
      I2 => R0,
      I3 => p_0_in8_in,
      O => \n0_q_m[3]_i_7_n_0\
    );
\n0_q_m_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n0_q_m[1]_i_1_n_0\,
      Q => n0_q_m(1),
      R => '0'
    );
\n0_q_m_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n0_q_m[2]_i_1_n_0\,
      Q => n0_q_m(2),
      R => '0'
    );
\n0_q_m_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \n0_q_m[3]_i_1_n_0\,
      Q => n0_q_m(3),
      R => '0'
    );
\n1_d[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6996966996696996"
    )
        port map (
      I0 => VGA_RGB(0),
      I1 => VGA_RGB(7),
      I2 => \n1_d[0]_i_2_n_0\,
      I3 => VGA_RGB(2),
      I4 => VGA_RGB(1),
      I5 => VGA_RGB(3),
      O => plusOp6_out(0)
    );
\n1_d[0]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => VGA_RGB(6),
      I1 => VGA_RGB(4),
      I2 => VGA_RGB(5),
      O => \n1_d[0]_i_2_n_0\
    );
\n1_d[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \n1_d[3]_i_2_n_0\,
      I1 => \n1_d[1]_i_2_n_0\,
      I2 => \n1_d[3]_i_3_n_0\,
      O => plusOp6_out(1)
    );
\n1_d[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"171717E817E8E8E8"
    )
        port map (
      I0 => VGA_RGB(3),
      I1 => VGA_RGB(2),
      I2 => VGA_RGB(1),
      I3 => VGA_RGB(6),
      I4 => VGA_RGB(5),
      I5 => VGA_RGB(4),
      O => \n1_d[1]_i_2_n_0\
    );
\n1_d[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7E7E7EE87EE8E8E8"
    )
        port map (
      I0 => \n1_d[3]_i_2_n_0\,
      I1 => \n1_d[3]_i_3_n_0\,
      I2 => \n1_d[2]_i_2_n_0\,
      I3 => VGA_RGB(4),
      I4 => VGA_RGB(5),
      I5 => VGA_RGB(6),
      O => plusOp6_out(2)
    );
\n1_d[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => VGA_RGB(1),
      I1 => VGA_RGB(2),
      I2 => VGA_RGB(3),
      O => \n1_d[2]_i_2_n_0\
    );
\n1_d[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8880800000000000"
    )
        port map (
      I0 => \n1_d[3]_i_2_n_0\,
      I1 => \n1_d[3]_i_3_n_0\,
      I2 => VGA_RGB(3),
      I3 => VGA_RGB(2),
      I4 => VGA_RGB(1),
      I5 => \n1_d[3]_i_4_n_0\,
      O => plusOp6_out(3)
    );
\n1_d[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9600009600969600"
    )
        port map (
      I0 => VGA_RGB(2),
      I1 => VGA_RGB(1),
      I2 => VGA_RGB(3),
      I3 => VGA_RGB(0),
      I4 => VGA_RGB(7),
      I5 => \n1_d[0]_i_2_n_0\,
      O => \n1_d[3]_i_2_n_0\
    );
\n1_d[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E88E8EE8"
    )
        port map (
      I0 => VGA_RGB(7),
      I1 => VGA_RGB(0),
      I2 => VGA_RGB(5),
      I3 => VGA_RGB(4),
      I4 => VGA_RGB(6),
      O => \n1_d[3]_i_3_n_0\
    );
\n1_d[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E8"
    )
        port map (
      I0 => VGA_RGB(4),
      I1 => VGA_RGB(5),
      I2 => VGA_RGB(6),
      O => \n1_d[3]_i_4_n_0\
    );
\n1_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => plusOp6_out(0),
      Q => n1_d(0),
      R => '0'
    );
\n1_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => plusOp6_out(1),
      Q => n1_d(1),
      R => '0'
    );
\n1_d_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => plusOp6_out(2),
      Q => n1_d(2),
      R => '0'
    );
\n1_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => plusOp6_out(3),
      Q => n1_d(3),
      R => '0'
    );
\n1_q_m[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \n1_q_m[3]_i_2__1_n_0\,
      I1 => \n0_q_m[3]_i_2_n_0\,
      I2 => \n1_q_m[3]_i_3_n_0\,
      O => int_n1_q_m(1)
    );
\n1_q_m[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9A59"
    )
        port map (
      I0 => \n0_q_m[3]_i_6_n_0\,
      I1 => \n1_q_m[3]_i_3_n_0\,
      I2 => \n1_q_m[3]_i_2__1_n_0\,
      I3 => \n0_q_m[3]_i_2_n_0\,
      O => int_n1_q_m(2)
    );
\n1_q_m[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \n0_q_m[3]_i_6_n_0\,
      I1 => \n1_q_m[3]_i_2__1_n_0\,
      I2 => \n1_q_m[3]_i_3_n_0\,
      O => int_n1_q_m(3)
    );
\n1_q_m[3]_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"90060690"
    )
        port map (
      I0 => p_0_in10_in,
      I1 => p_0_in6_in,
      I2 => \d_d_reg_n_0_[0]\,
      I3 => \d_d_reg_n_0_[1]\,
      I4 => p_0_in2_in,
      O => \n1_q_m[3]_i_2__1_n_0\
    );
\n1_q_m[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"288214417DD7BEEB"
    )
        port map (
      I0 => p_0_in10_in,
      I1 => \q_m_d[7]_i_2_n_0\,
      I2 => p_0_in8_in,
      I3 => R0,
      I4 => p_0_in6_in,
      I5 => \d_d_reg_n_0_[0]\,
      O => \n1_q_m[3]_i_3_n_0\
    );
\n1_q_m_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => int_n1_q_m(1),
      Q => n1_q_m(1),
      R => '0'
    );
\n1_q_m_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => int_n1_q_m(2),
      Q => n1_q_m(2),
      R => '0'
    );
\n1_q_m_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => int_n1_q_m(3),
      Q => n1_q_m(3),
      R => '0'
    );
\q_m_d[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA55AA5599669566"
    )
        port map (
      I0 => \d_d_reg_n_0_[1]\,
      I1 => n1_d(2),
      I2 => n1_d(1),
      I3 => \d_d_reg_n_0_[0]\,
      I4 => n1_d(0),
      I5 => n1_d(3),
      O => \q_m_d[1]_i_1__0_n_0\
    );
\q_m_d[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => p_0_in0_in,
      O => \q_m_d[2]_i_1_n_0\
    );
\q_m_d[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => p_0_in0_in,
      I3 => R0,
      I4 => p_0_in2_in,
      O => \q_m_d[3]_i_1_n_0\
    );
\q_m_d[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => p_0_in2_in,
      I1 => p_0_in4_in,
      I2 => p_0_in0_in,
      I3 => \d_d_reg_n_0_[1]\,
      I4 => \d_d_reg_n_0_[0]\,
      O => \q_m_d[4]_i_1_n_0\
    );
\q_m_d[5]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"96"
    )
        port map (
      I0 => R0,
      I1 => \q_m_d[7]_i_2_n_0\,
      I2 => p_0_in6_in,
      O => \q_m_d[5]_i_1__0_n_0\
    );
\q_m_d[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"69"
    )
        port map (
      I0 => p_0_in8_in,
      I1 => \q_m_d[7]_i_2_n_0\,
      I2 => p_0_in6_in,
      O => \q_m_d[6]_i_1_n_0\
    );
\q_m_d[7]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96696996"
    )
        port map (
      I0 => R0,
      I1 => \q_m_d[7]_i_2_n_0\,
      I2 => p_0_in6_in,
      I3 => p_0_in8_in,
      I4 => p_0_in10_in,
      O => \q_m_d[7]_i_1__0_n_0\
    );
\q_m_d[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"69969669"
    )
        port map (
      I0 => \d_d_reg_n_0_[0]\,
      I1 => \d_d_reg_n_0_[1]\,
      I2 => p_0_in0_in,
      I3 => p_0_in4_in,
      I4 => p_0_in2_in,
      O => \q_m_d[7]_i_2_n_0\
    );
\q_m_d[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00105555"
    )
        port map (
      I0 => n1_d(3),
      I1 => n1_d(0),
      I2 => \d_d_reg_n_0_[0]\,
      I3 => n1_d(1),
      I4 => n1_d(2),
      O => R0
    );
\q_m_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \d_d_reg_n_0_[0]\,
      Q => \q_m_d_reg_n_0_[0]\,
      R => '0'
    );
\q_m_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[1]_i_1__0_n_0\,
      Q => \q_m_d_reg_n_0_[1]\,
      R => '0'
    );
\q_m_d_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[2]_i_1_n_0\,
      Q => \q_m_d_reg_n_0_[2]\,
      R => '0'
    );
\q_m_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[3]_i_1_n_0\,
      Q => \q_m_d_reg_n_0_[3]\,
      R => '0'
    );
\q_m_d_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[4]_i_1_n_0\,
      Q => \q_m_d_reg_n_0_[4]\,
      R => '0'
    );
\q_m_d_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[5]_i_1__0_n_0\,
      Q => \q_m_d_reg_n_0_[5]\,
      R => '0'
    );
\q_m_d_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[6]_i_1_n_0\,
      Q => \q_m_d_reg_n_0_[6]\,
      R => '0'
    );
\q_m_d_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_m_d[7]_i_1__0_n_0\,
      Q => \q_m_d_reg_n_0_[7]\,
      R => '0'
    );
\q_m_d_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => R0,
      Q => p_0_in,
      R => '0'
    );
\q_out_d[0]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_4_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3_n_0\,
      I3 => \q_m_d_reg_n_0_[0]\,
      O => \q_out_d[0]_i_1__1_n_0\
    );
\q_out_d[1]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_4_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3_n_0\,
      I3 => \q_m_d_reg_n_0_[1]\,
      O => \q_out_d[1]_i_1__1_n_0\
    );
\q_out_d[2]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_4_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3_n_0\,
      I3 => \q_m_d_reg_n_0_[2]\,
      O => q_out0_in(2)
    );
\q_out_d[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_4_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3_n_0\,
      I3 => \q_m_d_reg_n_0_[3]\,
      O => \q_out_d[3]_i_1__1_n_0\
    );
\q_out_d[4]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_4_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3_n_0\,
      I3 => \q_m_d_reg_n_0_[4]\,
      O => q_out0_in(4)
    );
\q_out_d[5]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_4_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3_n_0\,
      I3 => \q_m_d_reg_n_0_[5]\,
      O => \q_out_d[5]_i_1__1_n_0\
    );
\q_out_d[6]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_4_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3_n_0\,
      I3 => \q_m_d_reg_n_0_[6]\,
      O => q_out0_in(6)
    );
\q_out_d[7]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E01F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_4_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3_n_0\,
      I3 => \q_m_d_reg_n_0_[7]\,
      O => \q_out_d[7]_i_1__1_n_0\
    );
\q_out_d[9]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1F"
    )
        port map (
      I0 => \cnt_t_1[4]_i_4_n_0\,
      I1 => p_0_in,
      I2 => \cnt_t_1[1]_i_3_n_0\,
      O => \q_out_d[9]_i_1__1_n_0\
    );
\q_out_d_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[0]_i_1__1_n_0\,
      Q => Q(0),
      R => \^sr\(0)
    );
\q_out_d_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[1]_i_1__1_n_0\,
      Q => Q(1),
      R => \^sr\(0)
    );
\q_out_d_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => q_out0_in(2),
      Q => Q(2),
      S => \^sr\(0)
    );
\q_out_d_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[3]_i_1__1_n_0\,
      Q => Q(3),
      R => \^sr\(0)
    );
\q_out_d_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => q_out0_in(4),
      Q => Q(4),
      S => \^sr\(0)
    );
\q_out_d_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[5]_i_1__1_n_0\,
      Q => Q(5),
      R => \^sr\(0)
    );
\q_out_d_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => q_out0_in(6),
      Q => Q(6),
      S => \^sr\(0)
    );
\q_out_d_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[7]_i_1__1_n_0\,
      Q => Q(7),
      R => \^sr\(0)
    );
\q_out_d_reg[8]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => p_0_in,
      Q => Q(8),
      S => \^sr\(0)
    );
\q_out_d_reg[9]\: unisim.vcomponents.FDSE
     port map (
      C => PXLCLK_I,
      CE => '1',
      D => \q_out_d[9]_i_1__1_n_0\,
      Q => Q(9),
      S => \^sr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_display_0_DVITransmitter is
  port (
    HDMI_CLK_P : out STD_LOGIC;
    HDMI_CLK_N : out STD_LOGIC;
    HDMI_D2_P : out STD_LOGIC;
    HDMI_D2_N : out STD_LOGIC;
    HDMI_D1_P : out STD_LOGIC;
    HDMI_D1_N : out STD_LOGIC;
    HDMI_D0_P : out STD_LOGIC;
    HDMI_D0_N : out STD_LOGIC;
    PXLCLK_5X_I : in STD_LOGIC;
    PXLCLK_I : in STD_LOGIC;
    VGA_DE : in STD_LOGIC;
    VGA_RGB : in STD_LOGIC_VECTOR ( 23 downto 0 );
    VGA_HS : in STD_LOGIC;
    VGA_VS : in STD_LOGIC;
    RST_N : in STD_LOGIC;
    LOCKED_I : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hdmi_display_0_DVITransmitter : entity is "DVITransmitter";
end hdmi_display_0_DVITransmitter;

architecture STRUCTURE of hdmi_display_0_DVITransmitter is
  signal RST : STD_LOGIC;
  signal de_dd : STD_LOGIC;
  signal intTmdsBlue : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal intTmdsGreen : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal intTmdsRed : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal p_1_in : STD_LOGIC;
begin
Inst_TMDSEncoder_blue: entity work.hdmi_display_0_TMDSEncoder
     port map (
      PXLCLK_I => PXLCLK_I,
      Q(9 downto 0) => intTmdsBlue(9 downto 0),
      SR(0) => p_1_in,
      VGA_HS => VGA_HS,
      VGA_RGB(7 downto 0) => VGA_RGB(7 downto 0),
      VGA_VS => VGA_VS,
      de_dd => de_dd
    );
Inst_TMDSEncoder_green: entity work.hdmi_display_0_TMDSEncoder_0
     port map (
      PXLCLK_I => PXLCLK_I,
      Q(9 downto 0) => intTmdsGreen(9 downto 0),
      SR(0) => p_1_in,
      VGA_RGB(7 downto 0) => VGA_RGB(15 downto 8)
    );
Inst_TMDSEncoder_red: entity work.hdmi_display_0_TMDSEncoder_1
     port map (
      PXLCLK_I => PXLCLK_I,
      Q(9 downto 0) => intTmdsRed(9 downto 0),
      SR(0) => p_1_in,
      VGA_DE => VGA_DE,
      VGA_RGB(7 downto 0) => VGA_RGB(23 downto 16),
      de_dd => de_dd
    );
Inst_clk_serializer_10_1: entity work.hdmi_display_0_SerializerN_1
     port map (
      HDMI_CLK_N => HDMI_CLK_N,
      HDMI_CLK_P => HDMI_CLK_P,
      LOCKED_I => LOCKED_I,
      PXLCLK_5X_I => PXLCLK_5X_I,
      PXLCLK_I => PXLCLK_I,
      RST => RST,
      RST_N => RST_N
    );
Inst_d0_serializer_10_1: entity work.hdmi_display_0_SerializerN_1_2
     port map (
      HDMI_D0_N => HDMI_D0_N,
      HDMI_D0_P => HDMI_D0_P,
      PXLCLK_5X_I => PXLCLK_5X_I,
      PXLCLK_I => PXLCLK_I,
      Q(9 downto 0) => intTmdsBlue(9 downto 0),
      RST => RST
    );
Inst_d1_serializer_10_1: entity work.hdmi_display_0_SerializerN_1_3
     port map (
      HDMI_D1_N => HDMI_D1_N,
      HDMI_D1_P => HDMI_D1_P,
      PXLCLK_5X_I => PXLCLK_5X_I,
      PXLCLK_I => PXLCLK_I,
      Q(9 downto 0) => intTmdsGreen(9 downto 0),
      RST => RST
    );
Inst_d2_serializer_10_1: entity work.hdmi_display_0_SerializerN_1_4
     port map (
      HDMI_D2_N => HDMI_D2_N,
      HDMI_D2_P => HDMI_D2_P,
      PXLCLK_5X_I => PXLCLK_5X_I,
      PXLCLK_I => PXLCLK_I,
      Q(9 downto 0) => intTmdsRed(9 downto 0),
      RST => RST
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_display_0_HDMI_FPGA_ML is
  port (
    HDMI_CLK_P : out STD_LOGIC;
    HDMI_CLK_N : out STD_LOGIC;
    HDMI_D2_P : out STD_LOGIC;
    HDMI_D2_N : out STD_LOGIC;
    HDMI_D1_P : out STD_LOGIC;
    HDMI_D1_N : out STD_LOGIC;
    HDMI_D0_P : out STD_LOGIC;
    HDMI_D0_N : out STD_LOGIC;
    PXLCLK_5X_I : in STD_LOGIC;
    PXLCLK_I : in STD_LOGIC;
    VGA_DE : in STD_LOGIC;
    VGA_RGB : in STD_LOGIC_VECTOR ( 23 downto 0 );
    VGA_HS : in STD_LOGIC;
    VGA_VS : in STD_LOGIC;
    RST_N : in STD_LOGIC;
    LOCKED_I : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of hdmi_display_0_HDMI_FPGA_ML : entity is "HDMI_FPGA_ML";
end hdmi_display_0_HDMI_FPGA_ML;

architecture STRUCTURE of hdmi_display_0_HDMI_FPGA_ML is
begin
Inst_DVITransmitter: entity work.hdmi_display_0_DVITransmitter
     port map (
      HDMI_CLK_N => HDMI_CLK_N,
      HDMI_CLK_P => HDMI_CLK_P,
      HDMI_D0_N => HDMI_D0_N,
      HDMI_D0_P => HDMI_D0_P,
      HDMI_D1_N => HDMI_D1_N,
      HDMI_D1_P => HDMI_D1_P,
      HDMI_D2_N => HDMI_D2_N,
      HDMI_D2_P => HDMI_D2_P,
      LOCKED_I => LOCKED_I,
      PXLCLK_5X_I => PXLCLK_5X_I,
      PXLCLK_I => PXLCLK_I,
      RST_N => RST_N,
      VGA_DE => VGA_DE,
      VGA_HS => VGA_HS,
      VGA_RGB(23 downto 0) => VGA_RGB(23 downto 0),
      VGA_VS => VGA_VS
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hdmi_display_0 is
  port (
    PXLCLK_I : in STD_LOGIC;
    PXLCLK_5X_I : in STD_LOGIC;
    LOCKED_I : in STD_LOGIC;
    RST_N : in STD_LOGIC;
    VGA_HS : in STD_LOGIC;
    VGA_VS : in STD_LOGIC;
    VGA_DE : in STD_LOGIC;
    VGA_RGB : in STD_LOGIC_VECTOR ( 23 downto 0 );
    HDMI_CLK_P : out STD_LOGIC;
    HDMI_CLK_N : out STD_LOGIC;
    HDMI_D2_P : out STD_LOGIC;
    HDMI_D2_N : out STD_LOGIC;
    HDMI_D1_P : out STD_LOGIC;
    HDMI_D1_N : out STD_LOGIC;
    HDMI_D0_P : out STD_LOGIC;
    HDMI_D0_N : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of hdmi_display_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of hdmi_display_0 : entity is "hdmi_display_0,HDMI_FPGA_ML,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of hdmi_display_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of hdmi_display_0 : entity is "HDMI_FPGA_ML,Vivado 2016.4";
end hdmi_display_0;

architecture STRUCTURE of hdmi_display_0 is
begin
U0: entity work.hdmi_display_0_HDMI_FPGA_ML
     port map (
      HDMI_CLK_N => HDMI_CLK_N,
      HDMI_CLK_P => HDMI_CLK_P,
      HDMI_D0_N => HDMI_D0_N,
      HDMI_D0_P => HDMI_D0_P,
      HDMI_D1_N => HDMI_D1_N,
      HDMI_D1_P => HDMI_D1_P,
      HDMI_D2_N => HDMI_D2_N,
      HDMI_D2_P => HDMI_D2_P,
      LOCKED_I => LOCKED_I,
      PXLCLK_5X_I => PXLCLK_5X_I,
      PXLCLK_I => PXLCLK_I,
      RST_N => RST_N,
      VGA_DE => VGA_DE,
      VGA_HS => VGA_HS,
      VGA_RGB(23 downto 0) => VGA_RGB(23 downto 0),
      VGA_VS => VGA_VS
    );
end STRUCTURE;
