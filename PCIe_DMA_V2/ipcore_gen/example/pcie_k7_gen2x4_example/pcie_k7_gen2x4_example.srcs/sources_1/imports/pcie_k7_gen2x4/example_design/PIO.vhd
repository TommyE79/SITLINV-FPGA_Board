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
-- File       : PIO.vhd
-- Version    : 3.0
----
---- Description: Programmed I/O module. Design implements 8 KBytes of programmable
----              memory space. Host processor can access this memory space using
----              Memory Read 32 and Memory Write 32 TLPs. Design accepts
----              1 Double Word (DW) payload length on Memory Write 32 TLP and
----              responds to 1 DW length Memory Read 32 TLPs with a Completion
----              with Data TLP (1DW payload).
----
----              Module is designed to operate with 32 bit and 64 bit interfaces.
----
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity PIO is
generic (
  C_DATA_WIDTH : integer range 64 to 128 := 64;
  TCQ          : time                    := 1 ps
);
port (

  user_clk              : in  std_logic;
  user_reset            : in  std_logic;
  user_lnk_up           : in  std_logic;

  -- AXIS
  s_axis_tx_tready      : in  std_logic;
  s_axis_tx_tdata       : out std_logic_vector((C_DATA_WIDTH-1) downto 0);
  s_axis_tx_tkeep       : out std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  s_axis_tx_tlast       : out std_logic;
  s_axis_tx_tvalid      : out std_logic;
  tx_src_dsc            : out std_logic;


  m_axis_rx_tdata       : in std_logic_vector((C_DATA_WIDTH-1) downto 0);
  m_axis_rx_tkeep       : in std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  m_axis_rx_tlast       : in std_logic;
  m_axis_rx_tvalid      : in std_logic;
  m_axis_rx_tready      : out std_logic;
  m_axis_rx_tuser       : in std_logic_vector(21 downto 0);


  cfg_to_turnoff        : in std_logic;
  cfg_turnoff_ok        : out std_logic;

  cfg_completer_id      : in std_logic_vector(15 downto 0)

);

end PIO;

architecture rtl of PIO is
   attribute DowngradeIPIdentifiedWarnings: string;
   attribute DowngradeIPIdentifiedWarnings of rtl : architecture is "yes";

-- Local wires

signal req_compl      : std_logic;
signal compl_done     : std_logic;
signal pio_reset_n    : std_logic;

component PIO_EP
  generic (
    C_DATA_WIDTH : integer range 64 to 128 := 64;
    TCQ          : time                    := 1 ps
  );
  port (
    -- Common
    clk                    : in  std_logic;
    rst_n                  : in  std_logic;

  -- AXIS
    s_axis_tx_tready       : in  std_logic;
    s_axis_tx_tdata        : out std_logic_vector((C_DATA_WIDTH-1) downto 0);
    s_axis_tx_tkeep        : out std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
    s_axis_tx_tlast        : out std_logic;
    s_axis_tx_tvalid       : out std_logic;
    tx_src_dsc             : out std_logic;

    m_axis_rx_tdata        : in  std_logic_vector((C_DATA_WIDTH-1) downto 0);
    m_axis_rx_tkeep        : in  std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
    m_axis_rx_tlast        : in std_logic;
    m_axis_rx_tvalid       : in std_logic;
    m_axis_rx_tready       : out std_logic;
    m_axis_rx_tuser        : in std_logic_vector(21 downto 0);

    req_compl              : out std_logic;
    compl_done             : out std_logic;

    cfg_completer_id       : in std_logic_vector(15 downto 0)
    );
  end component;


component PIO_TO_CTRL 
generic (
  TCQ          : time                    := 1 ps
);  
port (

  clk            : in  std_logic;
  rst_n          : in  std_logic;

  req_compl      : in  std_logic;
  compl_done     : in  std_logic;

  cfg_to_turnoff : in  std_logic;
  cfg_turnoff_ok : out std_logic
);
end component;

begin

  process(user_clk)
  begin
    if (user_clk'event and user_clk='1') then
       if (user_reset = '1') then
           pio_reset_n <= '0' after TCQ;
       else
           pio_reset_n <= user_lnk_up after TCQ;
       end if;
    end if;
  end process;

  --
  -- PIO instance
  --
  PIO_EP_inst : PIO_EP
  generic map(
    C_DATA_WIDTH        => C_DATA_WIDTH,
    TCQ                 => TCQ
  )
  port map (
    clk                 => user_clk,           -- I
    rst_n               => pio_reset_n,        -- I

    s_axis_tx_tready    => s_axis_tx_tready,   -- I
    s_axis_tx_tdata     => s_axis_tx_tdata,    -- O
    s_axis_tx_tkeep     => s_axis_tx_tkeep,    -- O
    s_axis_tx_tlast     => s_axis_tx_tlast,    -- O
    s_axis_tx_tvalid    => s_axis_tx_tvalid,   -- O
    tx_src_dsc          => tx_src_dsc,         -- O

    m_axis_rx_tdata     => m_axis_rx_tdata,    -- I
    m_axis_rx_tkeep     => m_axis_rx_tkeep,    -- I
    m_axis_rx_tlast     => m_axis_rx_tlast,    -- I
    m_axis_rx_tvalid    => m_axis_rx_tvalid,   -- I
    m_axis_rx_tready    => m_axis_rx_tready,   -- O
    m_axis_rx_tuser     => m_axis_rx_tuser,    -- I

    req_compl           => req_compl,          -- O
    compl_done          => compl_done,         -- O

    cfg_completer_id    => cfg_completer_id    -- I (15 downto 0)
  );



  --
  -- Turn-Off controller
  --



  PIO_TO_inst : PIO_TO_CTRL
  generic map (
    TCQ            => TCQ
  )  
  port map (
    clk            => user_clk,       -- I
    rst_n          => pio_reset_n,    -- I

    req_compl      => req_compl,      -- I
    compl_done     => compl_done,     -- I

    cfg_to_turnoff => cfg_to_turnoff, -- I
    cfg_turnoff_ok => cfg_turnoff_ok  -- O
  );


end;  -- PIO
