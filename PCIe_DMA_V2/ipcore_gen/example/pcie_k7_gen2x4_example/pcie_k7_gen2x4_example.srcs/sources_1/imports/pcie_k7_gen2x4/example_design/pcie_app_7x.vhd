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
-- File       : pcie_app_7x.vhd
-- Version    : 3.0
--
-- Description:  PCI Express Endpoint Core sample application design.
--
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;

entity pcie_app_7x is
generic (
  C_DATA_WIDTH : integer range 64 to 128 := 64;
  TCQ          : time                    := 1 ps
);
port  (
  user_clk                       : in  std_logic;
  user_reset                     : in  std_logic;
  user_lnk_up                    : in  std_logic;

  s_axis_tx_tready               : in  std_logic;
  s_axis_tx_tdata                : out std_logic_vector((C_DATA_WIDTH - 1) downto 0);
  s_axis_tx_tkeep                : out std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  s_axis_tx_tuser                : out std_logic_vector(3 downto 0);
  s_axis_tx_tlast                : out std_logic;
  s_axis_tx_tvalid               : out std_logic;

  -- RX
  m_axis_rx_tdata                : in std_logic_vector((C_DATA_WIDTH - 1) downto 0);
  m_axis_rx_tkeep                : in std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  m_axis_rx_tlast                : in  std_logic;
  m_axis_rx_tvalid               : in  std_logic;
  m_axis_rx_tready               : out std_logic;
  m_axis_rx_tuser                : in std_logic_vector(21 downto 0);

  cfg_to_turnoff                 : in  std_logic;
  cfg_bus_number                 : in  std_logic_vector( 7 downto 0);
  cfg_device_number              : in  std_logic_vector( 4 downto 0);
  cfg_function_number            : in  std_logic_vector( 2 downto 0);

  tx_cfg_gnt                     : out std_logic;
  cfg_pm_halt_aspm_l0s           : out std_logic;
  cfg_pm_halt_aspm_l1            : out std_logic;
  cfg_pm_force_state_en          : out std_logic;
  cfg_pm_force_state             : out std_logic_vector( 1 downto 0);
  rx_np_ok                       : out std_logic;
  rx_np_req                      : out std_logic;
  cfg_turnoff_ok                 : out std_logic;
  cfg_trn_pending                : out std_logic;
  cfg_pm_wake                    : out std_logic;
  cfg_dsn                        : out std_logic_vector(63 downto 0);

  fc_sel                         : out std_logic_vector(2 downto 0);

 -- CFG
  cfg_err_cor                    : out std_logic;
  cfg_err_ur                     : out std_logic;
  cfg_err_ecrc                   : out std_logic;
  cfg_err_cpl_timeout            : out std_logic;
  cfg_err_cpl_unexpect           : out std_logic;
  cfg_err_cpl_abort              : out std_logic;
  cfg_err_atomic_egress_blocked  : out std_logic;
  cfg_err_internal_cor           : out std_logic;
  cfg_err_malformed              : out std_logic;
  cfg_err_mc_blocked             : out std_logic;
  cfg_err_poisoned               : out std_logic;
  cfg_err_norecovery             : out std_logic;
  cfg_err_acs                    : out std_logic;
  cfg_err_internal_uncor         : out std_logic;
  cfg_err_posted                 : out std_logic;
  cfg_err_locked                 : out std_logic;
  cfg_err_tlp_cpl_header         : out std_logic_vector(47 downto 0);
  cfg_err_aer_headerlog          : out std_logic_vector(127 downto 0);
  cfg_aer_interrupt_msgnum       : out std_logic_vector(4 downto 0);

  pl_directed_link_change        : out std_logic_vector( 1 downto 0);
  pl_directed_link_width         : out std_logic_vector( 1 downto 0);
  pl_directed_link_speed         : out std_logic;
  pl_directed_link_auton         : out std_logic;
  pl_upstream_prefer_deemph      : out std_logic;

  cfg_mgmt_di                    : out std_logic_vector(31 downto 0);
  cfg_mgmt_byte_en               : out std_logic_vector( 3 downto 0);
  cfg_mgmt_dwaddr                : out std_logic_vector( 9 downto 0);
  cfg_mgmt_wr_en                 : out std_logic;
  cfg_mgmt_rd_en                 : out std_logic;
  cfg_mgmt_wr_readonly           : out std_logic;
  cfg_interrupt                  : out std_logic;
  cfg_interrupt_assert           : out std_logic;
  cfg_interrupt_di               : out std_logic_vector( 7 downto 0);
  cfg_interrupt_stat             : out std_logic;
  cfg_pciecap_interrupt_msgnum   : out std_logic_vector( 4 downto 0)

);
end pcie_app_7x;

architecture pcie_app of pcie_app_7x is

  constant PCI_EXP_EP_OUI      : std_logic_vector(23 downto 0) := x"000A35";
  constant PCI_EXP_EP_DSN_1    : std_logic_vector(31 downto 0) := x"01" & PCI_EXP_EP_OUI;
  constant PCI_EXP_EP_DSN_2    : std_logic_vector(31 downto 0) := x"00000001";


  signal cfg_completer_id       : std_logic_vector(15 downto 0);
  signal s_axis_tx_tready_i     : std_logic;

component PIO
generic (
  C_DATA_WIDTH           : integer range 64 to 128 := 64;
  TCQ                    : time                    := 1 ps
);
port (
  user_clk               : in  std_logic;
  user_reset             : in  std_logic;
  user_lnk_up            : in  std_logic;

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
  m_axis_rx_tlast        : in std_logic;
  m_axis_rx_tvalid       : in std_logic;
  m_axis_rx_tready       : out std_logic;
  m_axis_rx_tuser        : in std_logic_vector(21 downto 0);

  cfg_to_turnoff         : in std_logic;
  cfg_turnoff_ok         : out std_logic;

  cfg_completer_id       : in std_logic_vector(15 downto 0)
  );

end component;

begin

  ------------------------------------------------------------------------------------------------------------------//
  -- PCIe Block EP Tieoffs - Example PIO doesn't support the following inputs                                       //
  ------------------------------------------------------------------------------------------------------------------//

  fc_sel                       <= "000";

  tx_cfg_gnt                   <= '1';      -- Always allow transmission of Config traffic within block
  cfg_pm_halt_aspm_l0s         <= '0';      -- Allow entry into L0s
  cfg_pm_halt_aspm_l1          <= '0';      -- Allow entry into L1
  cfg_pm_force_state_en        <= '0';      -- Do not qualify cfg_pm_force_state
  cfg_pm_force_state           <= "00";     -- Do not move force core into specific PM state
  rx_np_ok                     <= '1';      -- Allow Reception of Non-posted Traffic
  rx_np_req                    <= '1';      -- Always request Non-posted Traffic if available
  cfg_trn_pending              <= '0';      -- Never set the transaction pending bit in the Device Status Register
  cfg_pm_wake                  <= '0';      -- Never direct the core to send a PM_PME Message
  cfg_dsn                      <= PCI_EXP_EP_DSN_2 & PCI_EXP_EP_DSN_1;  -- Assign the input DSN
  s_axis_tx_tuser(0)           <= '0';      -- Unused for V6
  s_axis_tx_tuser(1)           <= '0';      -- Error forward packet
  s_axis_tx_tuser(2)           <= '0';      -- Stream packet

  cfg_err_cor                  <= '0';      -- Never report Correctable Error
  cfg_err_ur                   <= '0';      -- Never report UR
  cfg_err_ecrc                 <= '0';      -- Never report ECRC Error
  cfg_err_cpl_timeout          <= '0';      -- Never report Completion Timeout
  cfg_err_cpl_abort            <= '0';      -- Never report Completion Abort
  cfg_err_cpl_unexpect         <= '0';      -- Never report unexpected completion
  cfg_err_posted               <= '0';      -- Never qualify cfg_err_* inputs
  cfg_err_locked               <= '0';      -- Never qualify cfg_err_ur or cfg_err_cpl_abort
  cfg_err_atomic_egress_blocked<= '0';      -- Never report Atomic TLP blocked
  cfg_err_internal_cor         <= '0';      -- Never report internal error occurred
  cfg_err_malformed            <= '0';      -- Never report malformed error
  cfg_err_mc_blocked           <= '0';      -- Never report multi-cast TLP blocked
  cfg_err_poisoned             <= '0';      -- Never report poisoned TLP received
  cfg_err_norecovery           <= '0';      -- Never qualify cfg_err_poisoned or cfg_err_cpl_timeout
  cfg_err_acs                  <= '0';      -- Never report an ACS violation
  cfg_err_internal_uncor       <= '0';      -- Never report internal uncorrectable error
  cfg_err_aer_headerlog        <= (others => '0');      -- Zero out the AER Header Log
  cfg_aer_interrupt_msgnum     <= "00000";  -- Zero out the AER Root Error Status Register
  cfg_err_tlp_cpl_header       <= x"000000000000";-- Zero out the header information

  cfg_interrupt_stat           <= '0';      -- Never set the Interrupt Status bit
  cfg_pciecap_interrupt_msgnum <= "00000";  -- Zero out Interrupt Message Number
  cfg_interrupt_assert         <= '0';      -- Always drive interrupt de-assert
  cfg_interrupt                <= '0';      -- Never drive interrupt by qualifying cfg_interrupt_assert
  cfg_interrupt_di             <= x"00";    -- Do not set interrupt fields

  pl_directed_link_change      <= "00";     -- Never initiate link change
  pl_directed_link_width       <= "00";     -- Zero out directed link width
  pl_directed_link_speed       <= '0';      -- Zero out directed link speed
  pl_directed_link_auton       <= '0';      -- Zero out link autonomous input
  pl_upstream_prefer_deemph    <= '1';      -- Zero out preferred de-emphasis of upstream port

  cfg_mgmt_di            <= x"00000000";    -- Zero out CFG MGMT input data bus
  cfg_mgmt_byte_en       <= x"0";           -- Zero out CFG MGMT byte enables
  cfg_mgmt_dwaddr        <= "0000000000";   -- Zero out CFG MGMT 10-bit address port
  cfg_mgmt_wr_en         <= '0';            -- Do not write CFG space
  cfg_mgmt_rd_en         <= '0';            -- Do not read CFG space
  cfg_mgmt_wr_readonly   <= '0';            -- Never treat RO bit as RW
  ------------------------------------------------------------------------------------------------------------------//
  -- Programmable I/O Module                                                                                        //
  ------------------------------------------------------------------------------------------------------------------//

  cfg_completer_id     <= (cfg_bus_number & cfg_device_number & cfg_function_number);

--  process (user_clk,user_reset)
--  begin
--   if (user_reset = '1') then
--       s_axis_tx_tready_i <= '0' after TCQ;
--   elsif (user_clk'event and user_clk = '1') then
--       s_axis_tx_tready_i <= s_axis_tx_tready after TCQ;
--   end if;
--  end process;
       s_axis_tx_tready_i <= s_axis_tx_tready;
  ------------------------------------------------------------------------------------------------------------------//
-- Programmable I/O Module

PIO_interface : PIO
  generic map (
    C_DATA_WIDTH        => C_DATA_WIDTH,
    TCQ                 => TCQ 
  )
  port map (
    user_clk            => user_clk,           -- I
    user_reset          => user_reset,         -- I
    user_lnk_up         => user_lnk_up,        -- I

    cfg_to_turnoff      => cfg_to_turnoff,     -- I
    cfg_completer_id    => cfg_completer_id,    -- I (15:0)
    cfg_turnoff_ok      => cfg_turnoff_ok,     -- O

    s_axis_tx_tready    => s_axis_tx_tready_i,   -- I
    s_axis_tx_tdata     => s_axis_tx_tdata,    -- O
    s_axis_tx_tkeep     => s_axis_tx_tkeep,    -- O
    s_axis_tx_tlast     => s_axis_tx_tlast,    -- O
    s_axis_tx_tvalid    => s_axis_tx_tvalid,   -- O
    tx_src_dsc          => s_axis_tx_tuser(3), -- O

    m_axis_rx_tdata     => m_axis_rx_tdata,    -- I
    m_axis_rx_tkeep     => m_axis_rx_tkeep,    -- I
    m_axis_rx_tlast     => m_axis_rx_tlast,    -- I
    m_axis_rx_tvalid    => m_axis_rx_tvalid,   -- I
    m_axis_rx_tready    => m_axis_rx_tready,   -- O
    m_axis_rx_tuser     => m_axis_rx_tuser     -- I
  );

end; -- pcie_app
