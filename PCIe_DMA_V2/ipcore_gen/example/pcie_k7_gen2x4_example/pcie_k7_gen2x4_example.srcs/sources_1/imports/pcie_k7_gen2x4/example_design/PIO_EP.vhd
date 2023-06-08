-------------------------------------------------------------------------------
--
-- (c) Copyright 2010-2011 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------
-- Project    : Series-7 Integrated Block for PCI Express
-- File       : PIO_EP.vhd
-- Version    : 3.0
----
---- Description: Endpoint Programmed I/O module.
----
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity PIO_EP is
generic (
  C_DATA_WIDTH : integer range 64 to 128 := 64;
  TCQ          : time                    := 1 ps
);
port (
  -- Common
  clk                    : in  std_logic;
  rst_n                  : in  std_logic;

  -- AXIS TX
  s_axis_tx_tdata        : out std_logic_vector((C_DATA_WIDTH - 1) downto 0);
  s_axis_tx_tkeep        : out std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  s_axis_tx_tready       : in  std_logic;
  s_axis_tx_tlast        : out std_logic;
  s_axis_tx_tvalid       : out std_logic;
  tx_src_dsc             : out std_logic;

  -- AXIS RX
  m_axis_rx_tdata        : in std_logic_vector((C_DATA_WIDTH - 1) downto 0);
  m_axis_rx_tkeep        : in std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  m_axis_rx_tlast        : in  std_logic;
  m_axis_rx_tvalid       : in  std_logic;
  m_axis_rx_tready       : out std_logic;
  m_axis_rx_tuser        : in std_logic_vector(21 downto 0);

  -- Turn-off signaling
  req_compl              : out std_logic;
  compl_done             : out std_logic;

  -- Configuration
  cfg_completer_id       : in std_logic_vector(15 downto 0)
);
end PIO_EP;

architecture rtl of PIO_EP is
   attribute DowngradeIPIdentifiedWarnings: string;
   attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

-- Local signals

  signal rd_addr       : std_logic_vector(10 downto 0);
  signal rd_be         : std_logic_vector(3 downto 0);
  signal rd_data       : std_logic_vector(31 downto 0);

  signal wr_addr       : std_logic_vector(10 downto 0);
  signal wr_be         : std_logic_vector(7 downto 0);
  signal wr_data       : std_logic_vector(31 downto 0);
  signal wr_en         : std_logic;
  signal wr_busy       : std_logic;

  signal req_compl_int : std_logic;
  signal req_compl_wd  : std_logic;
  signal compl_done_int: std_logic;

  signal req_tc        : std_logic_vector(2 downto 0);
  signal req_td        : std_logic;
  signal req_ep        : std_logic;
  signal req_attr      : std_logic_vector(1 downto 0);
  signal req_len       : std_logic_vector(9 downto 0);
  signal req_rid       : std_logic_vector(15 downto 0);
  signal req_tag       : std_logic_vector(7 downto 0);
  signal req_be        : std_logic_vector(7 downto 0);
  signal req_addr      : std_logic_vector(12 downto 0);

  component PIO_RX_ENGINE is
  generic (
    C_DATA_WIDTH : integer range 64 to 128 := 64;
    TCQ          : time                    := 1 ps
  );
  port (
  clk                   : in  std_logic;
  rst_n                 : in  std_logic;

  m_axis_rx_tdata       : in std_logic_vector((C_DATA_WIDTH - 1) downto 0);
  m_axis_rx_tkeep       : in std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  m_axis_rx_tlast       : in  std_logic;
  m_axis_rx_tvalid      : in  std_logic;
  m_axis_rx_tready      : out std_logic;
  m_axis_rx_tuser       : in  std_logic_vector(21 downto 0);

  req_compl             : out std_logic;
  req_compl_wd          : out std_logic;
  compl_done            : in  std_logic;

  req_tc                : out std_logic_vector(2 downto 0);  -- Memory Read TC
  req_td                : out std_logic;                     -- Memory Read TD
  req_ep                : out std_logic;                     -- Memory Read EP
  req_attr              : out std_logic_vector(1 downto 0);  -- Memory Read Attribute
  req_len               : out std_logic_vector(9 downto 0);  -- Memory Read Length (1DW)
  req_rid               : out std_logic_vector(15 downto 0); -- Memory Read Requestor ID
  req_tag               : out std_logic_vector(7 downto 0);  -- Memory Read Tag
  req_be                : out std_logic_vector(7 downto 0);  -- Memory Read Byte Enables
  req_addr              : out std_logic_vector(12 downto 0); -- Memory Read Address
                        
  wr_addr               : out std_logic_vector(10 downto 0); -- Memory Write Address
  wr_be                 : out std_logic_vector(7 downto 0);  -- Memory Write Byte Enable
  wr_data               : out std_logic_vector(31 downto 0); -- Memory Write Data
  wr_en                 : out std_logic;                     -- Memory Write Enable
  wr_busy               : in std_logic                       -- Memory Write Busy
  );
  end component;

  component PIO_TX_ENGINE is
  generic (
    C_DATA_WIDTH : integer range 64 to 128 := 64;
    TCQ          : time                    := 1 ps
  );
  port (
  clk                   : in  std_logic;
  rst_n                 : in  std_logic;

  -- AXIS
  s_axis_tx_tready      : in  std_logic;
  s_axis_tx_tdata       : out std_logic_vector((C_DATA_WIDTH - 1) downto 0);
  s_axis_tx_tkeep       : out std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  s_axis_tx_tlast       : out std_logic;
  s_axis_tx_tvalid      : out std_logic;
  tx_src_dsc            : out std_logic;

  req_compl             : in  std_logic;
  req_compl_wd          : in  std_logic;
  compl_done            : out  std_logic;

  req_tc                : in std_logic_vector(2 downto 0);
  req_td                : in  std_logic;
  req_ep                : in  std_logic;
  req_attr              : in std_logic_vector(1 downto 0);
  req_len               : in std_logic_vector(9 downto 0);
  req_rid               : in std_logic_vector(15 downto 0);
  req_tag               : in std_logic_vector(7 downto 0);
  req_be                : in std_logic_vector(7 downto 0);
  req_addr              : in std_logic_vector(12 downto 0);
                          
  rd_addr               : out std_logic_vector(10 downto 0);
  rd_be                 : out std_logic_vector(3 downto 0);
  rd_data               : in std_logic_vector(31 downto 0);
                          
  completer_id          : in std_logic_vector(15 downto 0)

  );
  end component;

component PIO_EP_MEM_ACCESS is
generic (
  TCQ          : time                    := 1 ps
);
port (

  clk          : in std_logic;
  rst_n        : in std_logic;

  --  Read Port

  rd_addr      : in std_logic_vector(10 downto 0);
  rd_be        : in std_logic_vector(3 downto 0);
  rd_data      : out std_logic_vector(31 downto 0);

  --  Write Port

  wr_addr      : in std_logic_vector(10 downto 0);
  wr_be        : in std_logic_vector(7 downto 0);
  wr_data      : in std_logic_vector(31 downto 0);
  wr_en        : in std_logic;
  wr_busy      : out std_logic

);

end component;

begin

-- ENDPOINT MEMORY : 8KB memory aperture implemented in FPGA BlockRAM(*)

EP_MEM_inst : PIO_EP_MEM_ACCESS 
generic map (
  TCQ  => TCQ
)
port map (

  clk   => clk,                       -- I
  rst_n => rst_n,                     -- I

  -- Read Port

  rd_addr => rd_addr,                 -- I [10:0]
  rd_be   => rd_be,                   -- I [3:0]
  rd_data => rd_data,                 -- O [31:0]

  -- Write Port

  wr_addr => wr_addr,                 -- I [10:0]
  wr_be   => wr_be,                   -- I [7:0]
  wr_data => wr_data,                 -- I [31:0]
  wr_en   => wr_en,                   -- I
  wr_busy => wr_busy                  -- O

);


EP_RX_inst : PIO_RX_ENGINE
  generic map(
    C_DATA_WIDTH         => C_DATA_WIDTH,
    TCQ                  => TCQ
  )
  port map (
    clk                  => clk,                -- I
    rst_n                => rst_n,              -- I

    --AXIS RX
    m_axis_rx_tdata      => m_axis_rx_tdata,    -- I
    m_axis_rx_tkeep      => m_axis_rx_tkeep,    -- I
    m_axis_rx_tlast      => m_axis_rx_tlast,    -- I
    m_axis_rx_tvalid     => m_axis_rx_tvalid,   -- I
    m_axis_rx_tready     => m_axis_rx_tready,   -- O
    m_axis_rx_tuser      => m_axis_rx_tuser,    -- I


    -- Handshake with Tx engine
    req_compl            => req_compl_int,       -- O
    req_compl_wd         => req_compl_wd,        -- O
    compl_done           => compl_done_int,      -- I
                         
    req_tc               => req_tc,              -- O [2:0]
    req_td               => req_td,              -- O
    req_ep               => req_ep,              -- O
    req_attr             => req_attr,            -- O [1:0]
    req_len              => req_len,             -- O [9:0]
    req_rid              => req_rid,             -- O [15:0]
    req_tag              => req_tag,             -- O [7:0]
    req_be               => req_be,              -- O [7:0]
    req_addr             => req_addr,            -- O [12:0]

    -- Memory Write Port
    wr_addr              => wr_addr,             -- O [10:0]
    wr_be                => wr_be,               -- O [7:0]
    wr_data              => wr_data,             -- O [31:0]
    wr_en                => wr_en,               -- O
    wr_busy              => wr_busy              -- I
  );
-- Local-Link Transmit Controller

  EP_TX_inst : PIO_TX_ENGINE
  generic map(
    C_DATA_WIDTH        => C_DATA_WIDTH,
    TCQ                 => TCQ
  )
  port map (
    clk                    => clk,                 -- I
    rst_n                  => rst_n,               -- I

    -- AXIS Tx
    s_axis_tx_tready       => s_axis_tx_tready,     -- I
    s_axis_tx_tdata        => s_axis_tx_tdata,      -- O
    s_axis_tx_tkeep        => s_axis_tx_tkeep,      -- O
    s_axis_tx_tlast        => s_axis_tx_tlast,      -- O
    s_axis_tx_tvalid       => s_axis_tx_tvalid,     -- O
    tx_src_dsc             => tx_src_dsc,           -- O


    -- Handshake with Rx engine
    req_compl              => req_compl_int,       -- I
    req_compl_wd           => req_compl_wd,        -- I
    compl_done             => compl_done_int,      -- 0

    req_tc                 => req_tc,              -- I [2:0]
    req_td                 => req_td,              -- I
    req_ep                 => req_ep,              -- I
    req_attr               => req_attr,            -- I [1:0]
    req_len                => req_len,             -- I [9:0]
    req_rid                => req_rid,             -- I [15:0]
    req_tag                => req_tag,             -- I [7:0]
    req_be                 => req_be,              -- I [7:0]
    req_addr               => req_addr,            -- I [12:0]

    -- Read Port
    rd_addr                => rd_addr,             -- O [10:0]
    rd_be                  => rd_be,               -- O [3:0]
    rd_data                => rd_data,             -- I [31:0]

    completer_id           => cfg_completer_id    -- I [15:0]
  );


  req_compl  <= req_compl_int;
  compl_done <= compl_done_int;

end rtl; -- PIO_EP

