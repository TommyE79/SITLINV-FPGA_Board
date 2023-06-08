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
-- File       : xilinx_pcie_2_1_rport_7x.vhd
-- Version    : 3.1
----
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity xilinx_pcie_2_1_rport_7x is
generic (


  REF_CLK_FREQ                  : integer range 0 to 2 := 0;          --0 - 100 MHz, 1 - 125 MHz,  2 - 250 MHz
  PL_FAST_TRAIN                 : string               := "FALSE";
  ALLOW_X8_GEN2                 : string               := "FALSE";
  C_DATA_WIDTH                  : integer range 32 to 128 := 128;
  PCIE_EXT_CLK                  : string     := "TRUE";
  LINK_CAP_MAX_LINK_WIDTH       : integer              := 8;
  PIPE_PIPELINE_STAGES          : integer              := 0;
  DEVICE_ID                     : std_logic_vector(15 downto 0) := X"506F";
  LINK_CAP_MAX_LINK_SPEED       : integer              := 1;
  LINK_CTRL2_TARGET_LINK_SPEED  : bit_vector           := X"1";
  LTSSM_MAX_LINK_WIDTH          : integer              := 1;
  DEV_CAP_MAX_PAYLOAD_SUPPORTED : integer              := 1;
  USER_CLK_FREQ                 : integer              := 3;
  USER_CLK2_DIV2                : string               := "FALSE";
  TRN_DW                        : string               := "FALSE";
  VC0_TX_LASTPACKET             : integer              := 28;
  VC0_RX_RAM_LIMIT              : bit_vector           := X"03ff";
  VC0_CPL_INFINITE              : string               := "TRUE";
  VC0_TOTAL_CREDITS_PD          : integer              := 154;
  VC0_TOTAL_CREDITS_CD          : integer              := 154

);
port
(
  sys_clk                 : in  std_logic;
  sys_rst_n               : in  std_logic;

  pci_exp_rxn             : in  std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
  pci_exp_rxp             : in  std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
  pci_exp_txn             : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
  pci_exp_txp             : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0)
);

end xilinx_pcie_2_1_rport_7x;

architecture rtl of xilinx_pcie_2_1_rport_7x is

  ----------------------------------------------------------------------------
  -- Function: setUserClk2Freq
  --
  -- Set clock freq based on inputs.
  ----------------------------------------------------------------------------
  function get_userClk2 (
    DIV2   : string;
    UC_FREQ  : integer)
    return integer is
  begin  -- wr_mode
    if (DIV2 = "TRUE") then
      if (UC_FREQ = 4) then
        return 3;
      elsif (UC_FREQ = 3) then
        return 2;
      else
        return UC_FREQ;
      end if;
    else
      return UC_FREQ;
    end if;
  end get_userClk2;

  -- purpose: Determine Link Speed Configuration for GT
  function get_gt_lnk_spd_cfg (
    constant simulation : string)
    return integer is
  begin  -- get_gt_lnk_spd_cfg
    if (simulation = "TRUE") then
      return 2;
    else
      return 3;
    end if;
  end get_gt_lnk_spd_cfg;

  constant USERCLK2_FREQ : integer := get_userClk2(USER_CLK2_DIV2, USER_CLK_FREQ);
  constant LNK_SPD              : integer := get_gt_lnk_spd_cfg(PL_FAST_TRAIN);

  function SetRemWidth (inputDataWidth : integer) return integer is
  Variable RemWidth : Integer := 1;

    begin
      if (inputDataWidth = 128 ) then
        RemWidth := 2;
      else
        RemWidth := 1;
      end if;
    return(RemWidth);
  end function SetRemWidth;

  constant REM_WIDTH : integer range 1 to 2 := SetRemWidth(C_DATA_WIDTH);

  function SetRemWidthRx (inputDataWidth : integer) return integer is
  Variable RemWidthRx : Integer := 8;

    begin
      if (inputDataWidth = 128 ) then
        RemWidthRx := 2;
      else
        RemWidthRx := 8;
      end if;
    return(RemWidthRx);
  end function SetRemWidthRx;

  constant REM_WIDTH_RX_APP : integer range 1 to 8 := SetRemWidthRx(C_DATA_WIDTH);

  constant RBAR_WIDTH                    : integer := 8;

  FUNCTION to_integer (
      val_in    : bit_vector) RETURN integer IS

      CONSTANT vctr   : bit_vector(val_in'high-val_in'low DOWNTO 0) := val_in;
      VARIABLE ret    : integer := 0;
   BEGIN
      FOR index IN vctr'RANGE LOOP
         IF (vctr(index) = '1') THEN
            ret := ret + (2**index);
         END IF;
      END LOOP;
      RETURN(ret);
   END to_integer;

--  Component Declarations

  component pcie_k7_gen2x4_pipe_clock
    generic (
          PCIE_ASYNC_EN                : string  :=  "FALSE";                      -- PCIe async enable
          PCIE_TXBUF_EN                : string  :=  "FALSE";                      -- PCIe TX buffer enable for Gen1/Gen2 only
          PCIE_CLK_SHARING_EN          : string  :=   "FALSE";     -- Enable Clock Sharing
          PCIE_LANE                    : integer :=  LINK_CAP_MAX_LINK_WIDTH;  -- PCIe number of lanes
          PCIE_LINK_SPEED              : integer :=  2;                            -- PCIe link speed
          PCIE_REFCLK_FREQ             : integer :=  REF_CLK_FREQ;                 -- PCIe reference clock frequency
          PCIE_USERCLK1_FREQ           : integer :=  3;                            -- PCIe user clock 1 frequency
          PCIE_USERCLK2_FREQ           : integer :=  3;                            -- PCIe user clock 2 frequency
          PCIE_OOBCLK_MODE             : integer :=   1;           -- PCIe oob clock mode
          PCIE_DEBUG_MODE              : integer :=  0                             -- PCIe Debug Mode
    );
    port  (

          ------------ Input -------------------------------------
          CLK_CLK                        : in std_logic;
          CLK_TXOUTCLK                   : in std_logic;
          CLK_RXOUTCLK_IN                : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
          CLK_RST_N                      : in std_logic;
          CLK_PCLK_SEL                   : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
          CLK_PCLK_SEL_SLAVE             : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
          CLK_GEN3                       : in std_logic;

          ------------ Output ------------------------------------
          CLK_PCLK                       : out std_logic;
          CLK_PCLK_SLAVE                 : out std_logic;
          CLK_RXUSRCLK                   : out std_logic;
          CLK_RXOUTCLK_OUT               : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
          CLK_DCLK                       : out std_logic;
          CLK_USERCLK1                   : out std_logic;
          CLK_USERCLK2                   : out std_logic;
          CLK_OOBCLK                     : out std_logic;
          CLK_MMCM_LOCK                  : out std_logic);
  end component;



  component pci_exp_usrapp_rx
  generic (
    C_DATA_WIDTH  : integer := 64;        -- Data Bus width
    TRN_REM_WIDTH : integer := 8          -- Remainder Width
  );
  port (
   trn_clk                  : in std_logic;
   trn_reset_n              : in std_logic;
   trn_lnk_up_n             : in std_logic;

   trn_rd                   : in std_logic_vector ((C_DATA_WIDTH - 1) downto 0 );
   trn_rrem_n               : in std_logic_vector ((TRN_REM_WIDTH - 1) downto 0 );
   trn_rsof_n               : in std_logic;
   trn_reof_n               : in std_logic;
   trn_rsrc_rdy_n           : in std_logic;
   trn_rsrc_dsc_n           : in std_logic;
   trn_rdst_rdy_n           : out std_logic;
   trn_rerrfwd_n            : in std_logic;
   trn_rnp_ok_n             : out std_logic;
   trn_rbar_hit_n           : in std_logic_vector ((7 - 1) downto 0 );

   rx_tx_read_data          : out std_logic_vector(31 downto 0);
   rx_tx_read_data_valid    : out std_logic;
   tx_rx_read_data_valid    : in std_logic
    );
  end component;


  component pci_exp_usrapp_tx
  generic (
    C_DATA_WIDTH  : integer := 64;        -- Data Bus width
    TRN_REM_WIDTH : integer := 8          -- Remainder Width
  );
  port (

    trn_clk                  : in std_logic;
    trn_reset_n              : in std_logic;
    trn_lnk_up_n             : in std_logic;

    trn_td                   : out std_logic_vector (C_DATA_WIDTH -1 downto 0 );
    trn_trem_n               : out std_logic_vector (TRN_REM_WIDTH-1 downto 0 );
    trn_tsof_n               : out std_logic;
    trn_teof_n               : out std_logic;
    trn_terrfwd_n            : out std_logic;
    trn_tsrc_rdy_n           : out std_logic;
    trn_tdst_rdy_n           : in std_logic;
    trn_tsrc_dsc_n           : out std_logic;
    trn_tdst_dsc_n           : in std_logic;
    trn_tbuf_av              : in std_logic_vector (5 downto 0);
    speed_change_done_n      : in std_logic;

    rx_tx_read_data          : in std_logic_vector(31 downto 0);
    rx_tx_read_data_valid    : in std_logic;
    tx_rx_read_data_valid    : out std_logic
  );

  end component;

  component pci_exp_usrapp_cfg
  port (
    trn_clk                : in std_logic;
    trn_reset_n            : in std_logic;

    cfg_do                 : in std_logic_vector((32 - 1) downto 0);
    cfg_di                 : out std_logic_vector((32 - 1) downto 0);
    cfg_byte_en_n          : out std_logic_vector(((32/8) - 1) downto 0);
    cfg_dwaddr             : out std_logic_vector((10 - 1) downto 0);
    cfg_wr_en_n            : out std_logic;
    cfg_rd_en_n            : out std_logic;
    cfg_rd_wr_done_n       : in std_logic;

    cfg_err_cor_n          : out std_logic;
    cfg_err_ur_n           : out std_logic;
    cfg_err_ecrc_n         : out std_logic;
    cfg_err_cpl_timeout_n  : out std_logic;
    cfg_err_cpl_abort_n    : out std_logic;
    cfg_err_cpl_unexpect_n : out std_logic;
    cfg_err_posted_n       : out std_logic;
    cfg_err_tlp_cpl_header : out std_logic_vector(( 48 - 1) downto 0);
    cfg_interrupt_n        : out std_logic;
    cfg_interrupt_rdy_n    : in std_logic;
    cfg_turnoff_ok_n       : out std_logic;
    cfg_pm_wake_n          : out std_logic;
    cfg_to_turnoff_n       : in  std_logic;
    cfg_bus_number         : in std_logic_vector((8 -1) downto 0);
    cfg_device_number      : in std_logic_vector((5 - 1) downto 0);
    cfg_function_number    : in std_logic_vector((3 - 1) downto 0);
    cfg_status             : in std_logic_vector((16 - 1) downto 0);
    cfg_command            : in std_logic_vector((16 - 1) downto 0);
    cfg_dstatus            : in std_logic_vector((16 - 1) downto 0);
    cfg_dcommand           : in std_logic_vector((16 - 1) downto 0);
    cfg_lstatus            : in std_logic_vector((16 - 1) downto 0);
    cfg_lcommand           : in std_logic_vector((16 - 1) downto 0);
    cfg_pcie_link_state_n  : in std_logic_vector((3 - 1) downto 0);
    cfg_trn_pending_n      : out std_logic

   );
  end component;


  -- PL UsrApp

  component pci_exp_usrapp_pl
  generic (
    LINK_CAP_MAX_LINK_SPEED        : integer
  );
  port (

    pl_initial_link_width          : in std_logic_vector(2 downto 0);
    pl_lane_reversal_mode          : in std_logic_vector(1 downto 0);
    pl_link_gen2_capable           : in std_logic;
    pl_link_partner_gen2_supported : in std_logic;
    pl_link_upcfg_capable          : in std_logic;
    pl_ltssm_state                 : in std_logic_vector(5 downto 0);
    pl_received_hot_rst            : in std_logic;
    pl_sel_link_rate               : in std_logic;
    pl_sel_link_width              : in std_logic_vector(1 downto 0);
    pl_directed_link_auton         : out std_logic;
    pl_directed_link_change        : out std_logic_vector(1 downto 0);
    pl_directed_link_speed         : out std_logic;
    pl_directed_link_width         : out std_logic_vector(1 downto 0);
    pl_upstream_prefer_deemph      : out std_logic;
    speed_change_done_n            : out std_logic;

    trn_lnk_up_n                   : in std_logic;
    trn_clk                        : in std_logic;
    trn_reset_n                    : in std_logic

    );
  end component;

  component pcie_axi_trn_bridge
  generic (
    C_DATA_WIDTH                  : integer range 32 to 128 := 64;
    RBAR_WIDTH                    : integer := 8;
    REM_WIDTH                     : integer range 1 to 2 :=1
  );
  port (                                                   -- Common
    user_clk               : in  std_logic;
    user_reset             : in  std_logic;
    user_lnk_up            : in  std_logic;

    s_axis_tx_tdata        : out std_logic_vector(C_DATA_WIDTH-1 downto 0);
    s_axis_tx_tvalid       : out std_logic;
    s_axis_tx_tready       : in  std_logic;
    s_axis_tx_tkeep        : out std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
    s_axis_tx_tlast        : out std_logic;
    s_axis_tx_tuser        : out std_logic_vector( 3 downto 0);

    m_axis_rx_tdata        : in  std_logic_vector(C_DATA_WIDTH-1 downto 0);
    m_axis_rx_tvalid       : in  std_logic;
    m_axis_rx_tready       : out std_logic;
    m_axis_rx_tkeep        : in  std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
    m_axis_rx_tlast        : in  std_logic;
    m_axis_rx_tuser        : in  std_logic_vector(21 downto 0);

    trn_td                 : in  std_logic_vector(C_DATA_WIDTH-1 downto 0);
    trn_tsof               : in  std_logic;
    trn_teof               : in  std_logic;
    trn_tsrc_rdy           : in  std_logic;
    trn_tdst_rdy           : out std_logic;
    trn_tsrc_dsc           : in  std_logic;
    trn_trem               : in  std_logic_vector(REM_WIDTH-1 downto 0);
    trn_terrfwd            : in  std_logic;
    trn_tstr               : in  std_logic;
    trn_tecrc_gen          : in  std_logic;

    trn_rd                 : out std_logic_vector(C_DATA_WIDTH-1 downto 0);
    trn_rsof               : out std_logic;
    trn_reof               : out std_logic;
    trn_rsrc_rdy           : out std_logic;
    trn_rdst_rdy           : in  std_logic;
    trn_rsrc_dsc           : out std_logic;
    trn_rrem               : out std_logic_vector(REM_WIDTH-1 downto 0);
    trn_rerrfwd            : out std_logic;
    trn_rbar_hit           : out std_logic_vector(7 downto 0)

  );
  end component;


  component pcie_2_1_rport_7x
  generic (

      -- PCIE_2_1 params
      DS_PORT_HOT_RST                                : string                  := "TRUE"; -- false for upstream, true for downstream
      REF_CLK_FREQ                                   : integer range 0 to 2    := 0;
      C_DATA_WIDTH                                   : integer range 32 to 128 := 64;
      REM_WIDTH                                      : integer range  1 to   2 := 1;
      LINK_CAP_MAX_LINK_WIDTH                        : integer                 := 8;
      LINK_CAP_MAX_LINK_SPEED                        : integer                 := 0;
      PIPE_PIPELINE_STAGES                           : integer                 := 0;
      PCIE_EXT_CLK                                   : string                  := "FALSE";      --fix me

  --    parameter        KEEP_WIDTH = C_DATA_WIDTH / 8,


      AER_BASE_PTR                                   : bit_vector := X"128";
      AER_CAP_ECRC_CHECK_CAPABLE                     : string     := "FALSE";
      AER_CAP_ECRC_GEN_CAPABLE                       : string     := "FALSE";
      AER_CAP_ID                                     : bit_vector := X"0001";
      AER_CAP_MULTIHEADER                            : string     := "FALSE";
      AER_CAP_NEXTPTR                                : bit_vector := X"160";
      AER_CAP_ON                                     : string     := "FALSE";
      AER_CAP_OPTIONAL_ERR_SUPPORT                   : bit_vector := X"000000";
      AER_CAP_PERMIT_ROOTERR_UPDATE                  : string     := "TRUE";
      AER_CAP_VERSION                                : bit_vector := X"1";
      ALLOW_X8_GEN2                                  : string     := "FALSE";
      BAR0                                           : bit_vector := X"FFFFFF00";
      BAR1                                           : bit_vector := X"FFFF0000";
      BAR2                                           : bit_vector := X"FFFF000C";
      BAR3                                           : bit_vector := X"FFFFFFFF";
      BAR4                                           : bit_vector := X"00000000";
      BAR5                                           : bit_vector := X"00000000";
      CAPABILITIES_PTR                               : bit_vector := X"40";
      CARDBUS_CIS_POINTER                            : bit_vector := X"00000000";
      CFG_ECRC_ERR_CPLSTAT                           : integer    := 0;
      CLASS_CODE                                     : bit_vector := X"000000";
      CMD_INTX_IMPLEMENTED                           : string     := "TRUE";
      CPL_TIMEOUT_DISABLE_SUPPORTED                  : string     := "FALSE";
      CPL_TIMEOUT_RANGES_SUPPORTED                   : bit_vector := X"0";
      CRM_MODULE_RSTS                                : bit_vector := X"00";
      DEV_CAP2_ARI_FORWARDING_SUPPORTED              : string     := "FALSE";
      DEV_CAP2_ATOMICOP32_COMPLETER_SUPPORTED        : string     := "FALSE";
      DEV_CAP2_ATOMICOP64_COMPLETER_SUPPORTED        : string     := "FALSE";
      DEV_CAP2_ATOMICOP_ROUTING_SUPPORTED            : string     := "FALSE";
      DEV_CAP2_CAS128_COMPLETER_SUPPORTED            : string     := "FALSE";
      DEV_CAP2_ENDEND_TLP_PREFIX_SUPPORTED           : string     := "FALSE";
      DEV_CAP2_EXTENDED_FMT_FIELD_SUPPORTED          : string     := "FALSE";
      DEV_CAP2_LTR_MECHANISM_SUPPORTED               : string     := "FALSE";
      DEV_CAP2_MAX_ENDEND_TLP_PREFIXES               : bit_vector := X"0";
      DEV_CAP2_NO_RO_ENABLED_PRPR_PASSING            : string     := "FALSE";
      DEV_CAP2_TPH_COMPLETER_SUPPORTED               : bit_vector := X"0";
      DEV_CAP_ENABLE_SLOT_PWR_LIMIT_SCALE            : string     := "TRUE";
      DEV_CAP_ENABLE_SLOT_PWR_LIMIT_VALUE            : string     := "TRUE";
      DEV_CAP_ENDPOINT_L0S_LATENCY                   : integer    := 0;
      DEV_CAP_ENDPOINT_L1_LATENCY                    : integer    := 0;
      DEV_CAP_EXT_TAG_SUPPORTED                      : string     := "TRUE";
      DEV_CAP_FUNCTION_LEVEL_RESET_CAPABLE           : string     := "FALSE";
      DEV_CAP_MAX_PAYLOAD_SUPPORTED                  : integer    := 2;
      DEV_CAP_PHANTOM_FUNCTIONS_SUPPORT              : integer    := 0;
      DEV_CAP_ROLE_BASED_ERROR                       : string     := "TRUE";
      DEV_CAP_RSVD_14_12                             : integer    := 0;
      DEV_CAP_RSVD_17_16                             : integer    := 0;
      DEV_CAP_RSVD_31_29                             : integer    := 0;
      DEV_CONTROL_AUX_POWER_SUPPORTED                : string     := "FALSE";
      DEV_CONTROL_EXT_TAG_DEFAULT                    : string     := "FALSE";
      DISABLE_ASPM_L1_TIMER                          : string     := "FALSE";
      DISABLE_BAR_FILTERING                          : string     := "FALSE";
      DISABLE_ERR_MSG                                : string     := "FALSE";
      DISABLE_ID_CHECK                               : string     := "FALSE";
      DISABLE_LANE_REVERSAL                          : string     := "FALSE";
      DISABLE_LOCKED_FILTER                          : string     := "FALSE";
      DISABLE_PPM_FILTER                             : string     := "FALSE";
      DISABLE_RX_POISONED_RESP                       : string     := "FALSE";
      DISABLE_RX_TC_FILTER                           : string     := "FALSE";
      DISABLE_SCRAMBLING                             : string     := "FALSE";
      DNSTREAM_LINK_NUM                              : bit_vector := X"00";
      DSN_BASE_PTR                                   : bit_vector := X"100";
      DSN_CAP_ID                                     : bit_vector := X"0003";
      DSN_CAP_NEXTPTR                                : bit_vector := X"10C";
      DSN_CAP_ON                                     : string     := "TRUE";
      DSN_CAP_VERSION                                : bit_vector := X"1";
      ENABLE_MSG_ROUTE                               : bit_vector := X"000";
      ENABLE_RX_TD_ECRC_TRIM                         : string     := "FALSE";
      ENDEND_TLP_PREFIX_FORWARDING_SUPPORTED         : string     := "FALSE";
      ENTER_RVRY_EI_L0                               : string     := "TRUE";
      EXIT_LOOPBACK_ON_EI                            : string     := "TRUE";
      EXPANSION_ROM                                  : bit_vector := X"FFFFF001";
      EXT_CFG_CAP_PTR                                : bit_vector := X"3F";
      EXT_CFG_XP_CAP_PTR                             : bit_vector := X"3FF";
      HEADER_TYPE                                    : bit_vector := X"00";
      INFER_EI                                       : bit_vector := X"00";
      INTERRUPT_PIN                                  : bit_vector := X"01";
      INTERRUPT_STAT_AUTO                            : string     := "TRUE";
      IS_SWITCH                                      : string     := "FALSE";
      LAST_CONFIG_DWORD                              : bit_vector := X"3FF";
      LINK_CAP_ASPM_OPTIONALITY                      : string     := "TRUE";
      LINK_CAP_ASPM_SUPPORT                          : integer    := 1;
      LINK_CAP_CLOCK_POWER_MANAGEMENT                : string     := "FALSE";
      LINK_CAP_DLL_LINK_ACTIVE_REPORTING_CAP         : string     := "FALSE";
      LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN1          : integer    := 7;
      LINK_CAP_L0S_EXIT_LATENCY_COMCLK_GEN2          : integer    := 7;
      LINK_CAP_L0S_EXIT_LATENCY_GEN1                 : integer    := 7;
      LINK_CAP_L0S_EXIT_LATENCY_GEN2                 : integer    := 7;
      LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN1           : integer    := 7;
      LINK_CAP_L1_EXIT_LATENCY_COMCLK_GEN2           : integer    := 7;
      LINK_CAP_L1_EXIT_LATENCY_GEN1                  : integer    := 7;
      LINK_CAP_L1_EXIT_LATENCY_GEN2                  : integer    := 7;
      LINK_CAP_LINK_BANDWIDTH_NOTIFICATION_CAP       : string     := "FALSE";
      LINK_CAP_RSVD_23                               : integer    := 0;
      LINK_CAP_SURPRISE_DOWN_ERROR_CAPABLE           : string     := "FALSE";
      LINK_CONTROL_RCB                               : integer    := 0;
      LINK_CTRL2_DEEMPHASIS                          : string     := "FALSE";
      LINK_CTRL2_HW_AUTONOMOUS_SPEED_DISABLE         : string     := "FALSE";
      LINK_CTRL2_TARGET_LINK_SPEED                   : bit_vector := X"2";
      LINK_STATUS_SLOT_CLOCK_CONFIG                  : string     := "TRUE";
      LL_ACK_TIMEOUT                                 : bit_vector := X"0000";
      LL_ACK_TIMEOUT_EN                              : string     := "FALSE";
      LL_ACK_TIMEOUT_FUNC                            : integer    := 0;
      LL_REPLAY_TIMEOUT                              : bit_vector := X"0000";
      LL_REPLAY_TIMEOUT_EN                           : string     := "FALSE";
      LL_REPLAY_TIMEOUT_FUNC                         : integer    := 0;
      LTSSM_MAX_LINK_WIDTH                           : integer    := 1;
      MPS_FORCE                                      : string     := "FALSE";
      MSIX_BASE_PTR                                  : bit_vector := X"9C";
      MSIX_CAP_ID                                    : bit_vector := X"11";
      MSIX_CAP_NEXTPTR                               : bit_vector := X"00";
      MSIX_CAP_ON                                    : string     := "FALSE";
      MSIX_CAP_PBA_BIR                               : integer    := 0;
      MSIX_CAP_PBA_OFFSET                            : bit_vector := X"00000050";
      MSIX_CAP_TABLE_BIR                             : integer    := 0;
      MSIX_CAP_TABLE_OFFSET                          : bit_vector := X"00000040";
      MSIX_CAP_TABLE_SIZE                            : bit_vector := X"000";
      MSI_BASE_PTR                                   : bit_vector := X"48";
      MSI_CAP_64_BIT_ADDR_CAPABLE                    : string     := "TRUE";
      MSI_CAP_ID                                     : bit_vector := X"05";
      MSI_CAP_MULTIMSGCAP                            : integer    := 0;
      MSI_CAP_MULTIMSG_EXTENSION                     : integer    := 0;
      MSI_CAP_NEXTPTR                                : bit_vector := X"60";
      MSI_CAP_ON                                     : string     := "FALSE";
      MSI_CAP_PER_VECTOR_MASKING_CAPABLE             : string     := "TRUE";
      N_FTS_COMCLK_GEN1                              : integer    := 255;
      N_FTS_COMCLK_GEN2                              : integer    := 255;
      N_FTS_GEN1                                     : integer    := 255;
      N_FTS_GEN2                                     : integer    := 255;
      PCIE_BASE_PTR                                  : bit_vector := X"60";
      PCIE_CAP_CAPABILITY_ID                         : bit_vector := X"10";
      PCIE_CAP_CAPABILITY_VERSION                    : bit_vector := X"2";
      PCIE_CAP_DEVICE_PORT_TYPE                      : bit_vector := X"0";
      PCIE_CAP_NEXTPTR                               : bit_vector := X"9C";
      PCIE_CAP_ON                                    : string     := "TRUE";
      PCIE_CAP_RSVD_15_14                            : integer    := 0;
      PCIE_CAP_SLOT_IMPLEMENTED                      : string     := "FALSE";
      PCIE_REVISION                                  : integer    := 2;
      PL_AUTO_CONFIG                                 : integer    := 0;
      PL_FAST_TRAIN                                  : string     := "FALSE";
      PM_ASPML0S_TIMEOUT                             : bit_vector := X"0000";
      PM_ASPML0S_TIMEOUT_EN                          : string     := "FALSE";
      PM_ASPML0S_TIMEOUT_FUNC                        : integer    := 0;
      PM_ASPM_FASTEXIT                               : string     := "FALSE";
      PM_BASE_PTR                                    : bit_vector := X"40";
      PM_CAP_AUXCURRENT                              : integer    := 0;
      PM_CAP_D1SUPPORT                               : string     := "TRUE";
      PM_CAP_D2SUPPORT                               : string     := "TRUE";
      PM_CAP_DSI                                     : string     := "FALSE";
      PM_CAP_ID                                      : bit_vector := X"01";
      PM_CAP_NEXTPTR                                 : bit_vector := X"48";
      PM_CAP_ON                                      : string     := "TRUE";
      PM_CAP_PMESUPPORT                              : bit_vector := X"0F";
      PM_CAP_PME_CLOCK                               : string     := "FALSE";
      PM_CAP_RSVD_04                                 : integer    := 0;
      PM_CAP_VERSION                                 : integer    := 3;
      PM_CSR_B2B3                                    : string     := "FALSE";
      PM_CSR_BPCCEN                                  : string     := "FALSE";
      PM_CSR_NOSOFTRST                               : string     := "TRUE";
      PM_DATA0                                       : bit_vector := X"01";
      PM_DATA1                                       : bit_vector := X"01";
      PM_DATA2                                       : bit_vector := X"01";
      PM_DATA3                                       : bit_vector := X"01";
      PM_DATA4                                       : bit_vector := X"01";
      PM_DATA5                                       : bit_vector := X"01";
      PM_DATA6                                       : bit_vector := X"01";
      PM_DATA7                                       : bit_vector := X"01";
      PM_DATA_SCALE0                                 : bit_vector := X"1";
      PM_DATA_SCALE1                                 : bit_vector := X"1";
      PM_DATA_SCALE2                                 : bit_vector := X"1";
      PM_DATA_SCALE3                                 : bit_vector := X"1";
      PM_DATA_SCALE4                                 : bit_vector := X"1";
      PM_DATA_SCALE5                                 : bit_vector := X"1";
      PM_DATA_SCALE6                                 : bit_vector := X"1";
      PM_DATA_SCALE7                                 : bit_vector := X"1";
      PM_MF                                          : string     := "FALSE";
      RBAR_BASE_PTR                                  : bit_vector := X"178";
      RBAR_CAP_CONTROL_ENCODEDBAR0                   : bit_vector := X"00";
      RBAR_CAP_CONTROL_ENCODEDBAR1                   : bit_vector := X"00";
      RBAR_CAP_CONTROL_ENCODEDBAR2                   : bit_vector := X"00";
      RBAR_CAP_CONTROL_ENCODEDBAR3                   : bit_vector := X"00";
      RBAR_CAP_CONTROL_ENCODEDBAR4                   : bit_vector := X"00";
      RBAR_CAP_CONTROL_ENCODEDBAR5                   : bit_vector := X"00";
      RBAR_CAP_ID                                    : bit_vector := X"0015";
      RBAR_CAP_INDEX0                                : bit_vector := X"0";
      RBAR_CAP_INDEX1                                : bit_vector := X"0";
      RBAR_CAP_INDEX2                                : bit_vector := X"0";
      RBAR_CAP_INDEX3                                : bit_vector := X"0";
      RBAR_CAP_INDEX4                                : bit_vector := X"0";
      RBAR_CAP_INDEX5                                : bit_vector := X"0";
      RBAR_CAP_NEXTPTR                               : bit_vector := X"000";
      RBAR_CAP_ON                                    : string     := "FALSE";
      RBAR_CAP_SUP0                                  : bit_vector := X"00000000";
      RBAR_CAP_SUP1                                  : bit_vector := X"00000000";
      RBAR_CAP_SUP2                                  : bit_vector := X"00000000";
      RBAR_CAP_SUP3                                  : bit_vector := X"00000000";
      RBAR_CAP_SUP4                                  : bit_vector := X"00000000";
      RBAR_CAP_SUP5                                  : bit_vector := X"00000000";
      RBAR_CAP_VERSION                               : bit_vector := X"1";
      RBAR_NUM                                       : bit_vector := X"1";
      RECRC_CHK                                      : integer    := 0;
      RECRC_CHK_TRIM                                 : string     := "FALSE";
      ROOT_CAP_CRS_SW_VISIBILITY                     : string     := "FALSE";
      RP_AUTO_SPD                                    : bit_vector := X"1";
      RP_AUTO_SPD_LOOPCNT                            : bit_vector := X"1F";
      SELECT_DLL_IF                                  : string     := "FALSE";
      SIM_VERSION                                    : string     := "1.0";
      SLOT_CAP_ATT_BUTTON_PRESENT                    : string     := "FALSE";
      SLOT_CAP_ATT_INDICATOR_PRESENT                 : string     := "FALSE";
      SLOT_CAP_ELEC_INTERLOCK_PRESENT                : string     := "FALSE";
      SLOT_CAP_HOTPLUG_CAPABLE                       : string     := "FALSE";
      SLOT_CAP_HOTPLUG_SURPRISE                      : string     := "FALSE";
      SLOT_CAP_MRL_SENSOR_PRESENT                    : string     := "FALSE";
      SLOT_CAP_NO_CMD_COMPLETED_SUPPORT              : string     := "FALSE";
      SLOT_CAP_PHYSICAL_SLOT_NUM                     : bit_vector := X"0000";
      SLOT_CAP_POWER_CONTROLLER_PRESENT              : string     := "FALSE";
      SLOT_CAP_POWER_INDICATOR_PRESENT               : string     := "FALSE";
      SLOT_CAP_SLOT_POWER_LIMIT_SCALE                : integer    := 0;
      SLOT_CAP_SLOT_POWER_LIMIT_VALUE                : bit_vector := X"00";
      SPARE_BIT0                                     : integer    := 0;
      SPARE_BIT1                                     : integer    := 0;
      SPARE_BIT2                                     : integer    := 0;
      SPARE_BIT3                                     : integer    := 0;
      SPARE_BIT4                                     : integer    := 0;
      SPARE_BIT5                                     : integer    := 0;
      SPARE_BIT6                                     : integer    := 0;
      SPARE_BIT7                                     : integer    := 0;
      SPARE_BIT8                                     : integer    := 0;
      SPARE_BYTE0                                    : bit_vector := X"00";
      SPARE_BYTE1                                    : bit_vector := X"00";
      SPARE_BYTE2                                    : bit_vector := X"00";
      SPARE_BYTE3                                    : bit_vector := X"00";
      SPARE_WORD0                                    : bit_vector := X"00000000";
      SPARE_WORD1                                    : bit_vector := X"00000000";
      SPARE_WORD2                                    : bit_vector := X"00000000";
      SPARE_WORD3                                    : bit_vector := X"00000000";
      SSL_MESSAGE_AUTO                               : string     := "FALSE";
      TECRC_EP_INV                                   : string     := "FALSE";
      TL_RBYPASS                                     : string     := "FALSE";
      TL_RX_RAM_RADDR_LATENCY                        : integer    := 0;
      TL_RX_RAM_RDATA_LATENCY                        : integer    := 2;
      TL_RX_RAM_WRITE_LATENCY                        : integer    := 0;
      TL_TFC_DISABLE                                 : string     := "FALSE";
      TL_TX_CHECKS_DISABLE                           : string     := "FALSE";
      TL_TX_RAM_RADDR_LATENCY                        : integer    := 0;
      TL_TX_RAM_RDATA_LATENCY                        : integer    := 2;
      TL_TX_RAM_WRITE_LATENCY                        : integer    := 0;
      TRN_DW                                         : string     := "FALSE";
      TRN_NP_FC                                      : string     := "FALSE";
      UPCONFIG_CAPABLE                               : string     := "TRUE";
      UPSTREAM_FACING                                : string     := "FALSE";
      UR_ATOMIC                                      : string     := "TRUE";
      UR_CFG1                                        : string     := "TRUE";
      UR_INV_REQ                                     : string     := "TRUE";
      UR_PRS_RESPONSE                                : string     := "TRUE";
      USER_CLK2_DIV2                                 : string     := "FALSE";
      USER_CLK_FREQ                                  : integer    := 3;
      USE_RID_PINS                                   : string     := "FALSE";
      VC0_CPL_INFINITE                               : string     := "TRUE";
      VC0_RX_RAM_LIMIT                               : bit_vector := X"03FF";
      VC0_TOTAL_CREDITS_CD                           : integer    := 127;
      VC0_TOTAL_CREDITS_CH                           : integer    := 31;
      VC0_TOTAL_CREDITS_NPD                          : integer    := 24;
      VC0_TOTAL_CREDITS_NPH                          : integer    := 12;
      VC0_TOTAL_CREDITS_PD                           : integer    := 288;
      VC0_TOTAL_CREDITS_PH                           : integer    := 32;
      VC0_TX_LASTPACKET                              : integer    := 31;
      VC_BASE_PTR                                    : bit_vector := X"10C";
      VC_CAP_ID                                      : bit_vector := X"0002";
      VC_CAP_NEXTPTR                                 : bit_vector := X"128";
      VC_CAP_ON                                      : string     := "FALSE";
      VC_CAP_REJECT_SNOOP_TRANSACTIONS               : string     := "FALSE";
      VC_CAP_VERSION                                 : bit_vector := X"1";
      VSEC_BASE_PTR                                  : bit_vector := X"160";
      VSEC_CAP_HDR_ID                                : bit_vector := X"1234";
      VSEC_CAP_HDR_LENGTH                            : bit_vector := X"018";
      VSEC_CAP_HDR_REVISION                          : bit_vector := X"1";
      VSEC_CAP_ID                                    : bit_vector := X"000B";
      VSEC_CAP_IS_LINK_VISIBLE                       : string     := "TRUE";
      VSEC_CAP_NEXTPTR                               : bit_vector := X"000";
      VSEC_CAP_ON                                    : string     := "FALSE";
      VSEC_CAP_VERSION                               : bit_vector := X"1"
  );
  port(


       ---------------------------------------------------------------------------------------------------------
       -- 1. PCI Express (pci_exp) Interface                                                                  --
       ---------------------------------------------------------------------------------------------------------
        pci_exp_txp                                : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH - 1 downto 0);
        pci_exp_txn                                : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH - 1 downto 0);
        pci_exp_rxp                                : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH - 1 downto 0);
        pci_exp_rxn                                : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH - 1 downto 0);

       ---------------------------------------------------------------------------------------------------------
       -- 2. Clocking Interface - For Partial Reconfig Support                                                --
       ---------------------------------------------------------------------------------------------------------
        pipe_pclk_in                               : in std_logic;
        pipe_rxusrclk_in                           : in std_logic;
        pipe_rxoutclk_in                           : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH - 1 downto 0);
        pipe_dclk_in                               : in std_logic;
        pipe_userclk1_in                           : in std_logic;
        pipe_userclk2_in                           : in std_logic;
        pipe_oobclk_in                             : in std_logic;
        pipe_mmcm_lock_in                          : in std_logic;

        pipe_txoutclk_out                          : out std_logic;
        pipe_rxoutclk_out                          : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH - 1 downto 0);
        pipe_pclk_sel_out                          : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH - 1 downto 0);
        pipe_gen3_out                              : out std_logic;

       ---------------------------------------------------------------------------------------------------------
       -- 3. AXI-S Interface                                                                                  --
       ---------------------------------------------------------------------------------------------------------
        -- Common
        user_clk_out                               : out std_logic;
        user_reset_out                             : out std_logic;
        user_lnk_up                                : out std_logic;

        -- TX
        tx_buf_av                                  : out std_logic_vector(5 downto 0);
        tx_cfg_req                                 : out std_logic;
        tx_err_drop                                : out std_logic;
        s_axis_tx_tready                           : out std_logic;
        s_axis_tx_tdata                            : in std_logic_vector((C_DATA_WIDTH - 1) downto 0);
        s_axis_tx_tkeep                            : in std_logic_vector((C_DATA_WIDTH / 8 - 1) downto 0);
        s_axis_tx_tlast                            : in std_logic;
        s_axis_tx_tvalid                           : in std_logic;
        s_axis_tx_tuser                            : in std_logic_vector(3 downto 0);
        tx_cfg_gnt                                 : in std_logic;

        -- RX
        m_axis_rx_tdata                            : out std_logic_vector((C_DATA_WIDTH - 1) downto 0);
        m_axis_rx_tkeep                            : out std_logic_vector((C_DATA_WIDTH / 8 - 1) downto 0);
        m_axis_rx_tlast                            : out std_logic;
        m_axis_rx_tvalid                           : out std_logic;
        m_axis_rx_tready                           : in std_logic;
        m_axis_rx_tuser                            : out std_logic_vector(21 downto 0);
        rx_np_ok                                   : in std_logic;
        rx_np_req                                  : in std_logic;

        -- Flow Control
        fc_cpld                                    : out std_logic_vector(11 downto 0);
        fc_cplh                                    : out std_logic_vector(7 downto 0);
        fc_npd                                     : out std_logic_vector(11 downto 0);
        fc_nph                                     : out std_logic_vector(7 downto 0);
        fc_pd                                      : out std_logic_vector(11 downto 0);
        fc_ph                                      : out std_logic_vector(7 downto 0);
        fc_sel                                     : in std_logic_vector(2 downto 0);

       ---------------------------------------------------------------------------------------------------------
       -- 4. Configuration (CFG) Interface                                                                    --
       ---------------------------------------------------------------------------------------------------------
       ---------------------------------------------------------------------
        -- EP and RP                                                      --
       ---------------------------------------------------------------------
        cfg_mgmt_do                                : out std_logic_vector (31 downto 0);
        cfg_mgmt_rd_wr_done                        : out std_logic;

        cfg_status                                 : out std_logic_vector(15 downto 0);
        cfg_command                                : out std_logic_vector(15 downto 0);
        cfg_dstatus                                : out std_logic_vector(15 downto 0);
        cfg_dcommand                               : out std_logic_vector(15 downto 0);
        cfg_lstatus                                : out std_logic_vector(15 downto 0);
        cfg_lcommand                               : out std_logic_vector(15 downto 0);
        cfg_dcommand2                              : out std_logic_vector(15 downto 0);
        cfg_pcie_link_state                        : out std_logic_vector(2 downto 0);

        cfg_pmcsr_pme_en                           : out std_logic;
        cfg_pmcsr_powerstate                       : out std_logic_vector(1 downto 0);
        cfg_pmcsr_pme_status                       : out std_logic;
        cfg_received_func_lvl_rst                  : out std_logic;

        -- Management Interface
        cfg_mgmt_di                                : in std_logic_vector (31 downto 0);
        cfg_mgmt_byte_en                           : in std_logic_vector (3 downto 0);
        cfg_mgmt_dwaddr                            : in std_logic_vector (9 downto 0);
        cfg_mgmt_wr_en                             : in std_logic;
        cfg_mgmt_rd_en                             : in std_logic;
        cfg_mgmt_wr_readonly                       : in std_logic;

        -- Error Reporting Interface
        cfg_err_ecrc                               : in std_logic;
        cfg_err_ur                                 : in std_logic;
        cfg_err_cpl_timeout                        : in std_logic;
        cfg_err_cpl_unexpect                       : in std_logic;
        cfg_err_cpl_abort                          : in std_logic;
        cfg_err_posted                             : in std_logic;
        cfg_err_cor                                : in std_logic;
        cfg_err_atomic_egress_blocked              : in std_logic;
        cfg_err_internal_cor                       : in std_logic;
        cfg_err_malformed                          : in std_logic;
        cfg_err_mc_blocked                         : in std_logic;
        cfg_err_poisoned                           : in std_logic;
        cfg_err_norecovery                         : in std_logic;
        cfg_err_tlp_cpl_header                     : in std_logic_vector(47 downto 0);
        cfg_err_cpl_rdy                            : out std_logic;
        cfg_err_locked                             : in std_logic;
        cfg_err_acs                                : in std_logic;
        cfg_err_internal_uncor                     : in std_logic;
        cfg_trn_pending                            : in std_logic;
        cfg_pm_halt_aspm_l0s                       : in std_logic;
        cfg_pm_halt_aspm_l1                        : in std_logic;
        cfg_pm_force_state_en                      : in std_logic;
        cfg_pm_force_state                         : in std_logic_vector(1 downto 0);
        cfg_dsn                                    : in std_logic_vector(63 downto 0);

       ---------------------------------------------------------------------
        -- EP Only                                                        --
       ---------------------------------------------------------------------
        cfg_interrupt                              : in std_logic;
        cfg_interrupt_rdy                          : out std_logic;
        cfg_interrupt_assert                       : in std_logic;
        cfg_interrupt_di                           : in std_logic_vector(7 downto 0);
        cfg_interrupt_do                           : out std_logic_vector(7 downto 0);
        cfg_interrupt_mmenable                     : out std_logic_vector(2 downto 0);
        cfg_interrupt_msienable                    : out std_logic;
        cfg_interrupt_msixenable                   : out std_logic;
        cfg_interrupt_msixfm                       : out std_logic;
        cfg_interrupt_stat                         : in std_logic;
        cfg_pciecap_interrupt_msgnum               : in std_logic_vector(4 downto 0);
        cfg_to_turnoff                             : out std_logic;
        cfg_turnoff_ok                             : in std_logic;
        cfg_bus_number                             : out std_logic_vector(7 downto 0);
        cfg_device_number                          : out std_logic_vector(4 downto 0);
        cfg_function_number                        : out std_logic_vector(2 downto 0);
        cfg_pm_wake                                : in std_logic;

       ---------------------------------------------------------------------
        -- RP Only                                                        --
       ---------------------------------------------------------------------
        cfg_pm_send_pme_to                         : in std_logic;
        cfg_ds_bus_number                          : in std_logic_vector(7 downto 0);
        cfg_ds_device_number                       : in std_logic_vector(4 downto 0);
        cfg_ds_function_number                     : in std_logic_vector(2 downto 0);

        cfg_mgmt_wr_rw1c_as_rw                     : in std_logic;
        cfg_msg_received                           : out std_logic;
        cfg_msg_data                               : out std_logic_vector(15 downto 0);

        cfg_bridge_serr_en                         : out std_logic;
        cfg_slot_control_electromech_il_ctl_pulse  : out std_logic;
        cfg_root_control_syserr_corr_err_en        : out std_logic;
        cfg_root_control_syserr_non_fatal_err_en   : out std_logic;
        cfg_root_control_syserr_fatal_err_en       : out std_logic;
        cfg_root_control_pme_int_en                : out std_logic;
        cfg_aer_rooterr_corr_err_reporting_en      : out std_logic;
        cfg_aer_rooterr_non_fatal_err_reporting_en : out std_logic;
        cfg_aer_rooterr_fatal_err_reporting_en     : out std_logic;
        cfg_aer_rooterr_corr_err_received          : out std_logic;
        cfg_aer_rooterr_non_fatal_err_received     : out std_logic;
        cfg_aer_rooterr_fatal_err_received         : out std_logic;

        cfg_msg_received_err_cor                   : out std_logic;
        cfg_msg_received_err_non_fatal             : out std_logic;
        cfg_msg_received_err_fatal                 : out std_logic;
        cfg_msg_received_pm_as_nak                 : out std_logic;
        cfg_msg_received_pm_pme                    : out std_logic;
        cfg_msg_received_pme_to_ack                : out std_logic;
        cfg_msg_received_assert_int_a              : out std_logic;
        cfg_msg_received_assert_int_b              : out std_logic;
        cfg_msg_received_assert_int_c              : out std_logic;
        cfg_msg_received_assert_int_d              : out std_logic;
        cfg_msg_received_deassert_int_a            : out std_logic;
        cfg_msg_received_deassert_int_b            : out std_logic;
        cfg_msg_received_deassert_int_c            : out std_logic;
        cfg_msg_received_deassert_int_d            : out std_logic;
        cfg_msg_received_setslotpowerlimit         : out std_logic;

       ---------------------------------------------------------------------------------------------------------
       -- 5. Physical Layer Control and Status (PL) Interface                                                 --
       ---------------------------------------------------------------------------------------------------------
        pl_directed_link_change                    : in std_logic_vector(1 downto 0);
        pl_directed_link_width                     : in std_logic_vector(1 downto 0);
        pl_directed_link_speed                     : in std_logic;
        pl_directed_link_auton                     : in std_logic;
        pl_upstream_prefer_deemph                  : in std_logic;

        pl_sel_lnk_rate                            : out std_logic;
        pl_sel_lnk_width                           : out std_logic_vector(1 downto 0);
        pl_ltssm_state                             : out std_logic_vector(5 downto 0);
        pl_lane_reversal_mode                      : out std_logic_vector(1 downto 0);

        pl_phy_lnk_up                              : out std_logic;
        pl_tx_pm_state                             : out std_logic_vector(2 downto 0);
        pl_rx_pm_state                             : out std_logic_vector(1 downto 0);

        pl_link_upcfg_cap                          : out std_logic;
        pl_link_gen2_cap                           : out std_logic;
        pl_link_partner_gen2_supported             : out std_logic;
        pl_initial_link_width                      : out std_logic_vector(2 downto 0);

        pl_directed_change_done                    : out std_logic;

       ---------------------------------------------------------------------
        -- EP Only                                                        --
       ---------------------------------------------------------------------
        pl_received_hot_rst                        : out std_logic;
       ---------------------------------------------------------------------
        -- RP Only                                                        --
       ---------------------------------------------------------------------
        pl_transmit_hot_rst                        : in std_logic;
        pl_downstream_deemph_source                : in std_logic;
       ---------------------------------------------------------------------------------------------------------
       -- 6. AER interface                                                                                    --
       ---------------------------------------------------------------------------------------------------------
        cfg_err_aer_headerlog                      : in std_logic_vector(127 downto 0);
        cfg_aer_interrupt_msgnum                   : in std_logic_vector(4 downto 0);
        cfg_err_aer_headerlog_set                  : out std_logic;
        cfg_aer_ecrc_check_en                      : out std_logic;
        cfg_aer_ecrc_gen_en                        : out std_logic;
       ---------------------------------------------------------------------------------------------------------
       -- 7. VC interface                                                                                     --
       ---------------------------------------------------------------------------------------------------------
        cfg_vc_tcvc_map                            : out std_logic_vector(6 downto 0);

       -------------------------------------------------------------------------------------------------------------------
       -- PIPE PORTS to TOP Level For PIPE SIMULATION with 3rd Party IP/BFM/Xilinx BFM
       -------------------------------------------------------------------------------------------------------------------
        common_commands_in                         : in std_logic_vector( 3 downto 0); 
        pipe_rx_0_sigs                             : in std_logic_vector(24 downto 0); 
        pipe_rx_1_sigs                             : in std_logic_vector(24 downto 0); 
        pipe_rx_2_sigs                             : in std_logic_vector(24 downto 0); 
        pipe_rx_3_sigs                             : in std_logic_vector(24 downto 0); 
        pipe_rx_4_sigs                             : in std_logic_vector(24 downto 0); 
        pipe_rx_5_sigs                             : in std_logic_vector(24 downto 0); 
        pipe_rx_6_sigs                             : in std_logic_vector(24 downto 0); 
        pipe_rx_7_sigs                             : in std_logic_vector(24 downto 0); 
                                                                        
        common_commands_out                        : out std_logic_vector(11 downto 0); 
        pipe_tx_0_sigs                             : out std_logic_vector(22 downto 0); 
        pipe_tx_1_sigs                             : out std_logic_vector(22 downto 0); 
        pipe_tx_2_sigs                             : out std_logic_vector(22 downto 0); 
        pipe_tx_3_sigs                             : out std_logic_vector(22 downto 0); 
        pipe_tx_4_sigs                             : out std_logic_vector(22 downto 0); 
        pipe_tx_5_sigs                             : out std_logic_vector(22 downto 0); 
        pipe_tx_6_sigs                             : out std_logic_vector(22 downto 0); 
        pipe_tx_7_sigs                             : out std_logic_vector(22 downto 0); 
       -------------------------------------------------------------------------------------------------------------------

        pipe_mmcm_rst_n                            : in std_logic;   --     // Async      | Async
        sys_clk                                    : in std_logic;
        sys_rst_n                                  : in std_logic
  );
  end component;



-- Local Wires
-- Common
  signal  trn_reset_n                        : std_logic;
  signal  trn_lnk_up_n                       : std_logic;

  -- Tx
  signal  trn_td                             : std_logic_vector(C_DATA_WIDTH-1 downto 0);
  signal  trn_trem_n                         : std_logic_vector(REM_WIDTH-1 downto 0);
  signal  trn_tsof_n                         : std_logic;
  signal  trn_teof_n                         : std_logic;
  signal  trn_tsrc_rdy_n                     : std_logic;
  signal  trn_tdst_rdy                       : std_logic;
  signal  trn_tsrc_dsc_n                     : std_logic;
  signal  trn_terrfwd_n                      : std_logic;
  signal  trn_tdst_dsc                       : std_logic;
  signal  trn_tbuf_av                        : std_logic_vector(5 downto 0);

  -- Rx
  signal  trn_rd                             : std_logic_vector(C_DATA_WIDTH-1 downto 0);
  signal  trn_rrem                           : std_logic_vector(REM_WIDTH-1 downto 0);
  signal  trn_rsof                           : std_logic;
  signal  trn_reof                           : std_logic;
  signal  trn_rsrc_rdy                       : std_logic;
  signal  trn_rsrc_dsc                       : std_logic;
  signal  trn_rdst_rdy_n                     : std_logic;
  signal  trn_rerrfwd                        : std_logic;
  signal  trn_rnp_ok_n                       : std_logic;
  signal  trn_rbar_hit                       : std_logic_vector(7 downto 0);
  signal  trn_rfc_nph_av                     : std_logic_vector(7 downto 0);
  signal  trn_rfc_npd_av                     : std_logic_vector(11 downto 0);
  signal  trn_rfc_ph_av                      : std_logic_vector(7 downto 0);
  signal  trn_rfc_pd_av                      : std_logic_vector(11 downto 0);
  signal  trn_rfc_cplh_av                    : std_logic_vector(7 downto 0);
  signal  trn_rfc_cpld_av                    : std_logic_vector(11 downto 0);

  signal  cfg_do                             : std_logic_vector(31 downto 0);
  signal  cfg_di                             : std_logic_vector(31 downto 0);
  signal  cfg_byte_en_n                      : std_logic_vector(3 downto 0);
  signal  cfg_dwaddr                         : std_logic_vector(9 downto 0);
  signal  cfg_err_tlp_cpl_header             : std_logic_vector(47 downto 0);
  signal  cfg_wr_en_n                        : std_logic;
  signal  cfg_rd_wr_done                     : std_logic;
  signal  cfg_rd_en_n                        : std_logic;
  signal  cfg_err_cor_n                      : std_logic;
  signal  cfg_err_ur_n                       : std_logic;
  signal  cfg_err_ecrc_n                     : std_logic;
  signal  cfg_err_cpl_timeout_n              : std_logic;
  signal  cfg_err_cpl_abort_n                : std_logic;
  signal  cfg_err_cpl_unexpect_n             : std_logic;
  signal  cfg_err_posted_n                   : std_logic;
  signal  cfg_interrupt_n                    : std_logic;
  signal  cfg_interrupt_rdy                  : std_logic;
  signal  cfg_status                         : std_logic_vector(15 downto 0);
  signal  cfg_command                        : std_logic_vector(15 downto 0);
  signal  cfg_dstatus                        : std_logic_vector(15 downto 0);
  signal  cfg_dcommand                       : std_logic_vector(15 downto 0);
  signal  cfg_lstatus                        : std_logic_vector(15 downto 0);
  signal  cfg_lcommand                       : std_logic_vector(15 downto 0);
  signal  cfg_rdy_n                          : std_logic;
  signal  cfg_pcie_link_state                : std_logic_vector(2 downto 0);
  signal  cfg_trn_pending_n                  : std_logic;
  signal  cfg_turnoff_ok_n                   : std_logic;
  signal  cfg_to_turnoff                     : std_logic;

  signal  pl_initial_link_width              : std_logic_vector(2 downto 0);
  signal  pl_lane_reversal_mode              : std_logic_vector(1 downto 0);
  signal  pl_link_gen2_cap                   : std_logic;
  signal  pl_link_partner_gen2_supported     : std_logic;
  signal  pl_link_upcfg_cap                  : std_logic;
  signal  pl_ltssm_state                     : std_logic_vector(5 downto 0);
  signal  pl_sel_lnk_rate                    : std_logic;
  signal  pl_sel_lnk_width                   : std_logic_vector(1 downto 0);
  signal  pl_directed_link_auton             : std_logic;
  signal  pl_directed_link_change            : std_logic_vector(1 downto 0);
  signal  pl_directed_link_speed             : std_logic;
  signal  pl_directed_link_width             : std_logic_vector(1 downto 0);
  signal  pl_received_hot_rst                : std_logic;
  signal  pl_upstream_prefer_deemph          : std_logic;

  signal  speed_change_done_n                : std_logic;

  signal  trn_tstr                           : std_logic;
  signal  trn_tecrc_gen                      : std_logic;

  signal  s_axis_tx_tdata                    : std_logic_vector(C_DATA_WIDTH-1 downto 0);
  signal  s_axis_tx_tvalid                   : std_logic;
  signal  s_axis_tx_tready                   : std_logic;
  signal  s_axis_tx_tkeep                    : std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  signal  s_axis_tx_tlast                    : std_logic;
  signal  s_axis_tx_tuser                    : std_logic_vector(3 downto 0);

  signal  m_axis_rx_tdata                    : std_logic_vector(C_DATA_WIDTH-1 downto 0);
  signal  m_axis_rx_tvalid                   : std_logic;
  signal  m_axis_rx_tready                   : std_logic;
  signal  m_axis_rx_tkeep                    : std_logic_vector((C_DATA_WIDTH/8)-1 downto 0);
  signal  m_axis_rx_tlast                    : std_logic;
  signal  m_axis_rx_tuser                    : std_logic_vector(21 downto 0);

  signal  trn_trem                           : std_logic_vector(REM_WIDTH-1 downto 0);
  signal  trn_tsof                           : std_logic;
  signal  trn_teof                           : std_logic;
  signal  trn_tsrc_rdy                       : std_logic;
  signal  trn_tsrc_dsc                       : std_logic;
  signal  trn_terrfwd                        : std_logic;

  signal  trn_rnp_ok                         : std_logic;
  signal  trn_rdst_rdy                       : std_logic;

  signal  trn_rrem_n                         : std_logic_vector(REM_WIDTH-1 downto 0);
  signal  trn_rsof_n                         : std_logic;
  signal  trn_reof_n                         : std_logic;
  signal  trn_rsrc_rdy_n                     : std_logic;
  signal  trn_rsrc_dsc_n                     : std_logic;
  signal  trn_rerrfwd_n                      : std_logic;
  signal  trn_rbar_hit_n                     : std_logic_vector(7 downto 0);

  signal  cfg_pcie_link_state_n              : std_logic_vector(2 downto 0);

  signal  rx_tx_read_data                    : std_logic_vector(31 downto 0);
  signal  rx_tx_read_data_valid              : std_logic;
  signal  tx_rx_read_data_valid              : std_logic;

  signal  trn_trem_n_out                     : std_logic_vector( 7 downto 0);
  signal  trn_rrem_n_in                      : std_logic_vector(REM_WIDTH_RX_APP - 1  downto 0);

  signal  user_clk                           : std_logic;
  signal  user_reset                         : std_logic;
  signal  user_lnk_up                        : std_logic;

  signal  tx_buf_av                          : std_logic_vector(5 downto 0);


  signal  cfg_mgmt_byte_en                   : std_logic_vector(3 downto 0);
  signal  cfg_mgmt_wr_en                     : std_logic;
  signal  cfg_mgmt_rd_en                     : std_logic;

  signal  cfg_err_ecrc                       : std_logic;
  signal  cfg_err_ur                         : std_logic;
  signal  cfg_err_cpl_timeout                : std_logic;
  signal  cfg_err_cpl_unexpect               : std_logic;
  signal  cfg_err_cpl_abort                  : std_logic;
  signal  cfg_err_posted                     : std_logic;
  signal  cfg_err_cor                        : std_logic;
  signal  cfg_trn_pending                    : std_logic;
  signal  cfg_interrupt                      : std_logic;
  signal  cfg_turnoff_ok                     : std_logic;
  signal  cfg_pm_wake                        : std_logic;
  signal  cfg_pm_wake_n                      : std_logic;
  signal  cfg_bus_number                     : std_logic_vector((8 -1) downto 0);
  signal  cfg_device_number                  : std_logic_vector((5 - 1) downto 0);
  signal  cfg_function_number                : std_logic_vector((3 - 1) downto 0);

  signal  trn_tdst_rdy_n                     : std_logic;
  signal  trn_tdst_dsc_n                     : std_logic;

  signal  cfg_interrupt_rdy_n                : std_logic;
  signal  cfg_to_turnoff_n                   : std_logic;
  signal  cfg_rd_wr_done_n                   : std_logic;

  -- Wires used for external clocking connectivity
  signal  pipe_pclk_in                       : std_logic;
  signal  pipe_rxusrclk_in                   : std_logic;
  signal  pipe_rxoutclk_in                   : std_logic_vector(LINK_CAP_MAX_LINK_WIDTH - 1 downto 0);
  signal  pipe_dclk_in                       : std_logic;
  signal  pipe_userclk1_in                   : std_logic;
  signal  pipe_userclk2_in                   : std_logic;
  signal  pipe_oobclk_in                     : std_logic;
  signal  pipe_mmcm_lock_in                  : std_logic;

  signal  pipe_txoutclk_out                  : std_logic;
  signal  pipe_rxoutclk_out                  : std_logic_vector(LINK_CAP_MAX_LINK_WIDTH - 1 downto 0);
  signal  pipe_pclk_sel_out                  : std_logic_vector(LINK_CAP_MAX_LINK_WIDTH - 1 downto 0);
  signal  pipe_gen3_out                      : std_logic;

  signal sys_reset_c                         : std_logic;

begin

  -- Invert system reset to adhere to AXI active high requirement
  sys_reset_c              <= not sys_rst_n;

  -- Generate External Clock Module if External Clocking is selected
  ext_clk : if (PCIE_EXT_CLK = "TRUE") generate
  begin
      ------------ PIPE Clock Module -------------------------------------------------
      pipe_clock_i : pcie_k7_gen2x4_pipe_clock
      generic map
      (
        PCIE_ASYNC_EN                  => "FALSE",                     -- PCIe async enable
        PCIE_TXBUF_EN                  => "FALSE",                     -- PCIe TX buffer enable for Gen1/Gen2 only
        PCIE_CLK_SHARING_EN            =>  "FALSE",                 -- Enable Clock Sharing
        PCIE_LANE                      => LINK_CAP_MAX_LINK_WIDTH, -- PCIe number of lanes
        PCIE_LINK_SPEED                => LNK_SPD ,                    -- PCIe link speed
        PCIE_REFCLK_FREQ               => REF_CLK_FREQ,                -- PCIe reference clock frequency
        PCIE_USERCLK1_FREQ             => (USER_CLK_FREQ +1),          -- PCIe user clock 1 frequency
        PCIE_USERCLK2_FREQ             => (USERCLK2_FREQ +1),          -- PCIe user clock 2 frequency
        PCIE_OOBCLK_MODE               =>  1,                       -- PCIe oob clock mode
        PCIE_DEBUG_MODE                => 0                            -- PCIe Debug Mode
      )
      port map
      (
        ------------ Input -------------------------------------
        CLK_CLK                        => sys_clk,
        CLK_TXOUTCLK                   => pipe_txoutclk_out,       -- Reference clock from lane 0
        CLK_RXOUTCLK_IN                => pipe_rxoutclk_out,
        CLK_RST_N                      => '1',
        CLK_PCLK_SEL                   => pipe_pclk_sel_out,
        CLK_PCLK_SEL_SLAVE             =>  (others => '0'), --pipe_pclk_sel_slave,
        CLK_GEN3                       => pipe_gen3_out,

        ------------ Output ------------------------------------
        CLK_PCLK                       => pipe_pclk_in,
        CLK_PCLK_SLAVE                 => open, -- pipe_pclk_out_slave,
        CLK_RXUSRCLK                   => pipe_rxusrclk_in,
        CLK_RXOUTCLK_OUT               => pipe_rxoutclk_in,
        CLK_DCLK                       => pipe_dclk_in,
        CLK_OOBCLK                     => pipe_oobclk_in,
        CLK_USERCLK1                   => pipe_userclk1_in,
        CLK_USERCLK2                   => pipe_userclk2_in,
        CLK_MMCM_LOCK                  => pipe_mmcm_lock_in

      );
  end generate;


  int_clk: if (not(PCIE_EXT_CLK = "TRUE")) generate
    pipe_pclk_in        <= '0';
    pipe_rxusrclk_in    <= '0';
    pipe_rxoutclk_in    <= (others => '0');
    pipe_dclk_in        <= '0';
    pipe_userclk1_in    <= '0';
    pipe_userclk2_in    <= '0';
    pipe_oobclk_in      <= '0';
    pipe_mmcm_lock_in   <= '0';
  end generate;



  gen_128_bit_gen : if  C_DATA_WIDTH = 128 generate
  begin

    trn_rrem_n_in <= trn_rrem_n;
    trn_trem      <= (not trn_trem_n_out(1)) & (not trn_trem_n_out(0));
    trn_rrem_n    <= (not trn_rrem(1)) & (not trn_rrem(0));
  end generate;

  gen_64_bit_gen : if  C_DATA_WIDTH = 64 generate
  begin

    trn_rrem_n_in <= X"0F" when (trn_rrem_n(0) = '1') else
                     X"00";
    trn_trem(0)   <= '0' when trn_trem_n_out(0) = '1' else '1';
    trn_rrem_n    <= not trn_rrem;

  end generate;


    trn_tsof              <= not trn_tsof_n;
    trn_teof              <= not trn_teof_n;
    trn_tsrc_rdy          <= not trn_tsrc_rdy_n;
    trn_tsrc_dsc          <= not trn_tsrc_dsc_n;
    trn_terrfwd           <= not trn_terrfwd_n;

    trn_rnp_ok            <= not trn_rnp_ok_n;
    trn_rdst_rdy          <= not trn_rdst_rdy_n;

    trn_rsof_n            <= not trn_rsof;
    trn_reof_n            <= not trn_reof;
    trn_rsrc_rdy_n        <= not trn_rsrc_rdy;
    trn_rsrc_dsc_n        <= not trn_rsrc_dsc;
    trn_rerrfwd_n         <= not trn_rerrfwd;
    trn_rbar_hit_n        <= not trn_rbar_hit(7) & not trn_rbar_hit(6) &
                             not trn_rbar_hit(5) & not trn_rbar_hit(4) &
                             not trn_rbar_hit(3) & not trn_rbar_hit(2) &
                             not trn_rbar_hit(1) & not trn_rbar_hit(0);

    cfg_pcie_link_state_n <= not cfg_pcie_link_state(2) & not cfg_pcie_link_state(1) & not cfg_pcie_link_state(0);

    trn_reset_n           <= not user_reset;
    trn_lnk_up_n          <= not user_lnk_up;


    cfg_mgmt_byte_en      <= not cfg_byte_en_n(3) & not cfg_byte_en_n(2) & not cfg_byte_en_n(1) & not cfg_byte_en_n(0);
    cfg_mgmt_wr_en        <= not cfg_wr_en_n;
    cfg_mgmt_rd_en        <= not cfg_rd_en_n;

    cfg_err_ecrc          <= not cfg_err_ecrc_n;
    cfg_err_ur            <= not cfg_err_ur_n;
    cfg_err_cpl_timeout   <= not cfg_err_cpl_timeout_n;
    cfg_err_cpl_unexpect  <= not cfg_err_cpl_unexpect_n;
    cfg_err_cpl_abort     <= not cfg_err_cpl_abort_n;
    cfg_err_posted        <= not cfg_err_posted_n;
    cfg_err_cor           <= not cfg_err_cor_n;

    cfg_trn_pending       <= not cfg_trn_pending_n;
    cfg_interrupt         <= not cfg_interrupt_n;
    cfg_turnoff_ok        <= not cfg_turnoff_ok_n;
    cfg_pm_wake           <= not cfg_pm_wake_n;

    trn_tdst_rdy_n        <= not trn_tdst_rdy;
    trn_tdst_dsc_n        <= not trn_tdst_dsc;

    cfg_interrupt_rdy_n   <= not cfg_interrupt_rdy;
    cfg_to_turnoff_n      <= not cfg_to_turnoff;
    cfg_rd_wr_done_n      <= not cfg_rd_wr_done;

-- PCI-Express FPGA Endpoint Instance

rport : pcie_2_1_rport_7x
generic map (

  REF_CLK_FREQ                   => REF_CLK_FREQ,
  PL_FAST_TRAIN                  => PL_FAST_TRAIN,
  ALLOW_X8_GEN2                  => ALLOW_X8_GEN2,
  C_DATA_WIDTH                   => C_DATA_WIDTH,
  LINK_CAP_MAX_LINK_WIDTH        => LINK_CAP_MAX_LINK_WIDTH,
  LINK_CAP_MAX_LINK_SPEED        => LINK_CAP_MAX_LINK_SPEED,
  LINK_CTRL2_TARGET_LINK_SPEED   => LINK_CTRL2_TARGET_LINK_SPEED,
  LTSSM_MAX_LINK_WIDTH           => LTSSM_MAX_LINK_WIDTH,
  DEV_CAP_MAX_PAYLOAD_SUPPORTED  => DEV_CAP_MAX_PAYLOAD_SUPPORTED,
  USER_CLK_FREQ                  => USER_CLK_FREQ,
  USER_CLK2_DIV2                 => USER_CLK2_DIV2,
  TRN_DW                         => TRN_DW,
  VC0_TX_LASTPACKET              => VC0_TX_LASTPACKET,
  VC0_RX_RAM_LIMIT               => VC0_RX_RAM_LIMIT,
  VC0_CPL_INFINITE               => VC0_CPL_INFINITE,
  VC0_TOTAL_CREDITS_PD           => VC0_TOTAL_CREDITS_PD,
  VC0_TOTAL_CREDITS_CD           => VC0_TOTAL_CREDITS_CD,
  REM_WIDTH                      => REM_WIDTH

)
port map (

  ---------------------------------------------------------------------------------------------------------
  -- 1. PCI Express (pci_exp) Interface                                                                  --
  ---------------------------------------------------------------------------------------------------------
   pci_exp_txp                                => pci_exp_txp,
   pci_exp_txn                                => pci_exp_txn,
   pci_exp_rxp                                => pci_exp_rxp,
   pci_exp_rxn                                => pci_exp_rxn,

  ---------------------------------------------------------------------------------------------------------
  -- 2. Clocking Interface - For Partial Reconfig Support                                                --
  ---------------------------------------------------------------------------------------------------------
   pipe_pclk_in                               => pipe_pclk_in,
   pipe_rxusrclk_in                           => pipe_rxusrclk_in,
   pipe_rxoutclk_in                           => pipe_rxoutclk_in,
   pipe_dclk_in                               => pipe_dclk_in,
   pipe_userclk1_in                           => pipe_userclk1_in,
   pipe_userclk2_in                           => pipe_userclk2_in,
   pipe_oobclk_in                             => pipe_oobclk_in,
   pipe_mmcm_lock_in                          => pipe_mmcm_lock_in,

   pipe_txoutclk_out                          => pipe_txoutclk_out,
   pipe_rxoutclk_out                          => pipe_rxoutclk_out,
   pipe_pclk_sel_out                          => pipe_pclk_sel_out,
   pipe_gen3_out                              => pipe_gen3_out,

  ---------------------------------------------------------------------------------------------------------
  -- 3. AXI-S Interface                                                                                  --
  ---------------------------------------------------------------------------------------------------------
   -- Common
   user_clk_out                               => user_clk,
   user_reset_out                             => user_reset,
   user_lnk_up                                => user_lnk_up,

   -- TX
   tx_buf_av                                  => trn_tbuf_av,
   tx_cfg_req                                 => open,
   tx_err_drop                                => trn_tdst_dsc,
   s_axis_tx_tready                           => s_axis_tx_tready,
   s_axis_tx_tdata                            => s_axis_tx_tdata,
   s_axis_tx_tkeep                            => s_axis_tx_tkeep,
   s_axis_tx_tlast                            => s_axis_tx_tlast,
   s_axis_tx_tvalid                           => s_axis_tx_tvalid,
   s_axis_tx_tuser                            => s_axis_tx_tuser,
   tx_cfg_gnt                                 => '0',

   -- RX
   m_axis_rx_tdata                            => m_axis_rx_tdata,
   m_axis_rx_tkeep                            => m_axis_rx_tkeep,
   m_axis_rx_tlast                            => m_axis_rx_tlast,
   m_axis_rx_tvalid                           => m_axis_rx_tvalid,
   m_axis_rx_tready                           => m_axis_rx_tready,
   m_axis_rx_tuser                            => m_axis_rx_tuser,
   rx_np_ok                                   => trn_rnp_ok,
   rx_np_req                                  => '0',

   -- Flow Control
   fc_cpld                                    => open,
   fc_cplh                                    => open,
   fc_npd                                     => open,
   fc_nph                                     => open,
   fc_pd                                      => open,
   fc_ph                                      => open,
   fc_sel                                     => (others => '0'),

  ---------------------------------------------------------------------------------------------------------
  -- 4. Configuration (CFG) Interface                                                                    --
  ---------------------------------------------------------------------------------------------------------
  ---------------------------------------------------------------------
   -- EP and RP                                                      --
  ---------------------------------------------------------------------
   cfg_mgmt_do                                => cfg_do,
   cfg_mgmt_rd_wr_done                        => cfg_rd_wr_done,

   cfg_status                                 => cfg_status,
   cfg_command                                => cfg_command,
   cfg_dstatus                                => cfg_dstatus,
   cfg_dcommand                               => cfg_dcommand,
   cfg_lstatus                                => cfg_lstatus,
   cfg_lcommand                               => cfg_lcommand,
   cfg_dcommand2                              => open,
   cfg_pcie_link_state                        => cfg_pcie_link_state,

   cfg_pmcsr_pme_en                           => open,
   cfg_pmcsr_powerstate                       => open,
   cfg_pmcsr_pme_status                       => open,
   cfg_received_func_lvl_rst                  => open,

   -- Management Interface
   cfg_mgmt_di                                => cfg_di,
   cfg_mgmt_byte_en                           => cfg_mgmt_byte_en,
   cfg_mgmt_dwaddr                            => cfg_dwaddr,
   cfg_mgmt_wr_en                             => cfg_mgmt_wr_en,
   cfg_mgmt_rd_en                             => cfg_mgmt_rd_en,
   cfg_mgmt_wr_readonly                       => '0',

   -- Error Reporting Interface
   cfg_err_ecrc                               => cfg_err_ecrc,
   cfg_err_ur                                 => cfg_err_ur,
   cfg_err_cpl_timeout                        => cfg_err_cpl_timeout,
   cfg_err_cpl_unexpect                       => cfg_err_cpl_unexpect,
   cfg_err_cpl_abort                          => cfg_err_cpl_abort,
   cfg_err_posted                             => cfg_err_posted,
   cfg_err_cor                                => cfg_err_cor,
   cfg_err_atomic_egress_blocked              => '0',
   cfg_err_internal_cor                       => '0',
   cfg_err_malformed                          => '0',
   cfg_err_mc_blocked                         => '0',
   cfg_err_poisoned                           => '0',
   cfg_err_norecovery                         => '0',
   cfg_err_tlp_cpl_header                     => cfg_err_tlp_cpl_header,
   cfg_err_cpl_rdy                            => open,
   cfg_err_locked                             => '0',
   cfg_err_acs                                => '0',
   cfg_err_internal_uncor                     => '0',
   cfg_trn_pending                            => cfg_trn_pending,
   cfg_pm_halt_aspm_l0s                       => '0',
   cfg_pm_halt_aspm_l1                        => '0',
   cfg_pm_force_state_en                      => '0',
   cfg_pm_force_state                         => (others => '0'),
   cfg_dsn                                    => (others => '0'),

  ---------------------------------------------------------------------
   -- EP Only                                                        --
  ---------------------------------------------------------------------
   cfg_interrupt                              => cfg_interrupt,
   cfg_interrupt_rdy                          => cfg_interrupt_rdy,
   cfg_interrupt_assert                       => '0',
   cfg_interrupt_di                           => (others => '0'),
   cfg_interrupt_do                           => open,
   cfg_interrupt_mmenable                     => open,
   cfg_interrupt_msienable                    => open,
   cfg_interrupt_msixenable                   => open,
   cfg_interrupt_msixfm                       => open,
   cfg_interrupt_stat                         => '0',
   cfg_pciecap_interrupt_msgnum               => (others => '0'),
   cfg_to_turnoff                             => cfg_to_turnoff,
   cfg_turnoff_ok                             => cfg_turnoff_ok,
   cfg_bus_number                             => cfg_bus_number,
   cfg_device_number                          => cfg_device_number,
   cfg_function_number                        => cfg_function_number,
   cfg_pm_wake                                => cfg_pm_wake,

  ---------------------------------------------------------------------
   -- RP Only                                                        --
  ---------------------------------------------------------------------
   cfg_pm_send_pme_to                         => '0',
   cfg_ds_bus_number                          => (others => '0'),
   cfg_ds_device_number                       => (others => '0'),
   cfg_ds_function_number                     => (others => '0'),

   cfg_mgmt_wr_rw1c_as_rw                     => '0',
   cfg_msg_received                           => open,
   cfg_msg_data                               => open,

   cfg_bridge_serr_en                         => open,
   cfg_slot_control_electromech_il_ctl_pulse  => open,
   cfg_root_control_syserr_corr_err_en        => open,
   cfg_root_control_syserr_non_fatal_err_en   => open,
   cfg_root_control_syserr_fatal_err_en       => open,
   cfg_root_control_pme_int_en                => open,
   cfg_aer_rooterr_corr_err_reporting_en      => open,
   cfg_aer_rooterr_non_fatal_err_reporting_en => open,
   cfg_aer_rooterr_fatal_err_reporting_en     => open,
   cfg_aer_rooterr_corr_err_received          => open,
   cfg_aer_rooterr_non_fatal_err_received     => open,
   cfg_aer_rooterr_fatal_err_received         => open,

   cfg_msg_received_err_cor                   => open,
   cfg_msg_received_err_non_fatal             => open,
   cfg_msg_received_err_fatal                 => open,
   cfg_msg_received_pm_as_nak                 => open,
   cfg_msg_received_pm_pme                    => open,
   cfg_msg_received_pme_to_ack                => open,
   cfg_msg_received_assert_int_a              => open,
   cfg_msg_received_assert_int_b              => open,
   cfg_msg_received_assert_int_c              => open,
   cfg_msg_received_assert_int_d              => open,
   cfg_msg_received_deassert_int_a            => open,
   cfg_msg_received_deassert_int_b            => open,
   cfg_msg_received_deassert_int_c            => open,
   cfg_msg_received_deassert_int_d            => open,
   cfg_msg_received_setslotpowerlimit         => open,

  ---------------------------------------------------------------------------------------------------------
  -- 5. Physical Layer Control and Status (PL) Interface                                                 --
  ---------------------------------------------------------------------------------------------------------
   pl_directed_link_change                    => pl_directed_link_change,
   pl_directed_link_width                     => pl_directed_link_width,
   pl_directed_link_speed                     => pl_directed_link_speed,
   pl_directed_link_auton                     => pl_directed_link_auton,
   pl_upstream_prefer_deemph                  => pl_upstream_prefer_deemph,

   pl_sel_lnk_rate                            => pl_sel_lnk_rate,
   pl_sel_lnk_width                           => pl_sel_lnk_width,
   pl_ltssm_state                             => pl_ltssm_state,
   pl_lane_reversal_mode                      => pl_lane_reversal_mode,

   pl_phy_lnk_up                              => open,
   pl_tx_pm_state                             => open,
   pl_rx_pm_state                             => open,

   pl_link_upcfg_cap                          => pl_link_upcfg_cap,
   pl_link_gen2_cap                           => pl_link_gen2_cap,
   pl_link_partner_gen2_supported             => pl_link_partner_gen2_supported,
   pl_initial_link_width                      => pl_initial_link_width,

   pl_directed_change_done                    => open,

  ---------------------------------------------------------------------
   -- EP Only                                                        --
  ---------------------------------------------------------------------
   pl_received_hot_rst                        => pl_received_hot_rst,
  ---------------------------------------------------------------------
   -- RP Only                                                        --
  ---------------------------------------------------------------------
   pl_transmit_hot_rst                        => '0',
   pl_downstream_deemph_source                => '0', -- shd not apply to RP
  ---------------------------------------------------------------------------------------------------------
  -- 6. AER interface                                                                                    --
  ---------------------------------------------------------------------------------------------------------
   cfg_err_aer_headerlog                      => (others => '0'),
   cfg_aer_interrupt_msgnum                   => (others => '0'),
   cfg_err_aer_headerlog_set                  => open,
   cfg_aer_ecrc_check_en                      => open,
   cfg_aer_ecrc_gen_en                        => open,
  ---------------------------------------------------------------------------------------------------------
  -- 7. VC interface                                                                                     --
  ---------------------------------------------------------------------------------------------------------
   cfg_vc_tcvc_map                            => open,

   common_commands_in                         => (others => '0')  , 
   pipe_rx_0_sigs                             => (others => '0')  , 
   pipe_rx_1_sigs                             => (others => '0')  , 
   pipe_rx_2_sigs                             => (others => '0')  , 
   pipe_rx_3_sigs                             => (others => '0')  , 
   pipe_rx_4_sigs                             => (others => '0')  , 
   pipe_rx_5_sigs                             => (others => '0')  , 
   pipe_rx_6_sigs                             => (others => '0')  , 
   pipe_rx_7_sigs                             => (others => '0')  , 
 
   common_commands_out                        => open , 
   pipe_tx_0_sigs                             => open , 
   pipe_tx_1_sigs                             => open , 
   pipe_tx_2_sigs                             => open , 
   pipe_tx_3_sigs                             => open , 
   pipe_tx_4_sigs                             => open , 
   pipe_tx_5_sigs                             => open , 
   pipe_tx_6_sigs                             => open , 
   pipe_tx_7_sigs                             => open , 
  ---------------------------------------------------------------------------------------------------------
  -- 8. System(SYS) Interface                                                                            --
  ---------------------------------------------------------------------------------------------------------
   pipe_mmcm_rst_n                            => '1',        -- Async      | Async
   sys_clk                                    => sys_clk,
   sys_rst_n                                  => sys_rst_n
  );

-- User Application Instances

-- Rx User Application Interface


 rx_usrapp : pci_exp_usrapp_rx
 generic map (
   C_DATA_WIDTH    => C_DATA_WIDTH,         -- Data Bus width
   TRN_REM_WIDTH   => REM_WIDTH_RX_APP      -- Remainder Width
 )
 port map (

   trn_clk         => user_clk,
   trn_reset_n     => trn_reset_n,
   trn_lnk_up_n    => trn_lnk_up_n,

   trn_rd          => trn_rd,
   trn_rrem_n      => trn_rrem_n_in,
   trn_rsof_n      => trn_rsof_n,
   trn_reof_n      => trn_reof_n,
   trn_rsrc_rdy_n  => trn_rsrc_rdy_n,
   trn_rsrc_dsc_n  => trn_rsrc_dsc_n,
   trn_rdst_rdy_n  => trn_rdst_rdy_n,
   trn_rerrfwd_n   => trn_rerrfwd_n,
   trn_rnp_ok_n    => trn_rnp_ok_n,
   trn_rbar_hit_n  => trn_rbar_hit_n(6 downto 0),

   rx_tx_read_data       =>  rx_tx_read_data,
   rx_tx_read_data_valid =>  rx_tx_read_data_valid,
   tx_rx_read_data_valid =>  tx_rx_read_data_valid
   );



-- Tx User Application Interface

  tx_usrapp : pci_exp_usrapp_tx
  generic map (
    C_DATA_WIDTH    => C_DATA_WIDTH,         -- Data Bus width
    TRN_REM_WIDTH   => 8                     -- Remainder Width
  )
  port map (

    trn_clk               => user_clk,
    trn_reset_n           => trn_reset_n,
    trn_lnk_up_n          => trn_lnk_up_n,

    trn_td                => trn_td,
    trn_trem_n            => trn_trem_n_out,
    trn_tsof_n            => trn_tsof_n,
    trn_teof_n            => trn_teof_n,
    trn_terrfwd_n         => trn_terrfwd_n,
    trn_tsrc_rdy_n        => trn_tsrc_rdy_n,
    trn_tdst_rdy_n        => trn_tdst_rdy_n,
    trn_tsrc_dsc_n        => trn_tsrc_dsc_n,
    trn_tdst_dsc_n        => trn_tdst_dsc_n,
    trn_tbuf_av           => trn_tbuf_av,
    speed_change_done_n   => speed_change_done_n,

    rx_tx_read_data       => rx_tx_read_data,
    rx_tx_read_data_valid => rx_tx_read_data_valid,
    tx_rx_read_data_valid => tx_rx_read_data_valid
    );


-- Cfg UsrApp

cfg_usrapp : pci_exp_usrapp_cfg
port map (
  trn_clk                => user_clk,
  trn_reset_n            => trn_reset_n,

  cfg_do                 => cfg_do,
  cfg_di                 => cfg_di,
  cfg_byte_en_n          => cfg_byte_en_n,
  cfg_dwaddr             => cfg_dwaddr,
  cfg_wr_en_n            => cfg_wr_en_n,
  cfg_rd_en_n            => cfg_rd_en_n,
  cfg_rd_wr_done_n       => cfg_rd_wr_done_n,

  cfg_err_cor_n          => cfg_err_cor_n,
  cfg_err_ur_n           => cfg_err_ur_n,
  cfg_err_ecrc_n         => cfg_err_ecrc_n,
  cfg_err_cpl_timeout_n  => cfg_err_cpl_timeout_n,
  cfg_err_cpl_abort_n    => cfg_err_cpl_abort_n,
  cfg_err_cpl_unexpect_n => cfg_err_cpl_unexpect_n,
  cfg_err_posted_n       => cfg_err_posted_n,
  cfg_err_tlp_cpl_header => cfg_err_tlp_cpl_header,
  cfg_interrupt_n        => cfg_interrupt_n,
  cfg_interrupt_rdy_n    => cfg_interrupt_rdy_n,
  cfg_turnoff_ok_n       => cfg_turnoff_ok_n,
  cfg_pm_wake_n          => open,
  cfg_to_turnoff_n       => cfg_to_turnoff_n,
  cfg_bus_number         => (others => '0'),
  cfg_device_number      => (others => '0'),
  cfg_function_number    => (others => '0'),
  cfg_status             => cfg_status,
  cfg_command            => cfg_command,
  cfg_dstatus            => cfg_dstatus,
  cfg_dcommand           => cfg_dcommand,
  cfg_lstatus            => cfg_lstatus,
  cfg_lcommand           => cfg_lcommand,
  cfg_pcie_link_state_n  => cfg_pcie_link_state_n,
  cfg_trn_pending_n      => cfg_trn_pending_n

 );


-- PL UsrApp

pl_usrapp : pci_exp_usrapp_pl
generic map (
  LINK_CAP_MAX_LINK_SPEED => LINK_CAP_MAX_LINK_SPEED
)
port map (

  pl_initial_link_width          =>  pl_initial_link_width,
  pl_lane_reversal_mode          =>  pl_lane_reversal_mode,
  pl_link_gen2_capable           =>  pl_link_gen2_cap,
  pl_link_partner_gen2_supported =>  pl_link_partner_gen2_supported,
  pl_link_upcfg_capable          =>  pl_link_upcfg_cap,
  pl_ltssm_state                 =>  pl_ltssm_state,
  pl_received_hot_rst            =>  pl_received_hot_rst,
  pl_sel_link_rate               =>  pl_sel_lnk_rate,
  pl_sel_link_width              =>  pl_sel_lnk_width,
  pl_directed_link_auton         =>  pl_directed_link_auton,
  pl_directed_link_change        =>  pl_directed_link_change,
  pl_directed_link_speed         =>  pl_directed_link_speed,
  pl_directed_link_width         =>  pl_directed_link_width,
  pl_upstream_prefer_deemph      =>  pl_upstream_prefer_deemph,
  speed_change_done_n            =>  speed_change_done_n,

  trn_lnk_up_n                   =>  trn_lnk_up_n,
  trn_clk                        =>  user_clk,
  trn_reset_n                    =>  trn_reset_n

  );

  -----------------------------------------------------------------------------------------------------
  --     PCIe AXI TRN Bridge                                                                         --
  -----------------------------------------------------------------------------------------------------

  pcie_axi_trn_bridge_i : pcie_axi_trn_bridge
  generic map (
    C_DATA_WIDTH              => C_DATA_WIDTH,
    RBAR_WIDTH                => RBAR_WIDTH,
    REM_WIDTH                 => REM_WIDTH
  )
  port map (
    user_clk               => user_clk,
    user_reset             => user_reset,
    user_lnk_up            => user_lnk_up,

    s_axis_tx_tdata        => s_axis_tx_tdata,
    s_axis_tx_tvalid       => s_axis_tx_tvalid,
    s_axis_tx_tready       => s_axis_tx_tready,
    s_axis_tx_tkeep        => s_axis_tx_tkeep,
    s_axis_tx_tlast        => s_axis_tx_tlast,
    s_axis_tx_tuser        => s_axis_tx_tuser,

    m_axis_rx_tdata        => m_axis_rx_tdata,
    m_axis_rx_tvalid       => m_axis_rx_tvalid,
    m_axis_rx_tready       => m_axis_rx_tready,
    m_axis_rx_tkeep        => m_axis_rx_tkeep,
    m_axis_rx_tlast        => m_axis_rx_tlast,
    m_axis_rx_tuser        => m_axis_rx_tuser,

    trn_td                 => trn_td,
    trn_tsof               => trn_tsof,
    trn_teof               => trn_teof,
    trn_tsrc_rdy           => trn_tsrc_rdy,
    trn_tdst_rdy           => trn_tdst_rdy,
    trn_tsrc_dsc           => trn_tsrc_dsc,
    trn_trem               => trn_trem,
    trn_terrfwd            => trn_terrfwd,
    trn_tstr               => '0',
    trn_tecrc_gen          => '0',

    trn_rd                 => trn_rd,
    trn_rsof               => trn_rsof,
    trn_reof               => trn_reof,
    trn_rsrc_rdy           => trn_rsrc_rdy,
    trn_rdst_rdy           => trn_rdst_rdy,
    trn_rsrc_dsc           => trn_rsrc_dsc,
    trn_rrem               => trn_rrem,
    trn_rerrfwd            => trn_rerrfwd,
    trn_rbar_hit           => trn_rbar_hit

);


end rtl;
