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
-- File       : pcie_k7_gen2x4_pcie2_top.vhd
-- Version    : 3.1

--
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pcie_k7_gen2x4_pcie2_top is
  generic (
    c_component_name : STRING  := "pcie_7x_v3_1";
    dev_port_type : STRING  := "0000";
    c_dev_port_type : STRING  := "0";
    c_header_type : STRING  :=  "00";
    c_upstream_facing : STRING :="TRUE";
    max_lnk_wdt : STRING  := "000100";
    max_lnk_spd : STRING  := "1";
    c_gen1 : BOOLEAN  := FALSE;
    c_int_width : INTEGER  := 64;
    pci_exp_int_freq : INTEGER  := 2;
    c_pcie_fast_config : INTEGER  := 0;
    bar_0 : STRING := "FFFFFF80";
    bar_1 : STRING := "00000000";
    bar_2 : STRING := "00000000";
    bar_3 : STRING := "00000000";
    bar_4 : STRING := "00000000";
    bar_5 : STRING := "00000000";
    xrom_bar : STRING :="00000000";
    cost_table : INTEGER := 1;
    ven_id : STRING := "10EE";
    dev_id : STRING := "7014";
    rev_id : STRING := "00";
    subsys_ven_id : STRING := "10EE";
    subsys_id : STRING := "0007";
    class_code : STRING := "058000";
    cardbus_cis_ptr : STRING := "00000000";
    cap_ver : STRING := "2";
    c_pcie_cap_slot_implemented : STRING := "FALSE";
    mps : STRING := "010";
    cmps : STRING := "2";
    ext_tag_fld_sup : STRING := "FALSE";
    c_dev_control_ext_tag_default : STRING := "FALSE";
    phantm_func_sup : STRING := "00";
    c_phantom_functions : STRING := "0";
    ep_l0s_accpt_lat : STRING := "000";
    c_ep_l0s_accpt_lat : STRING := "0";
    ep_l1_accpt_lat : STRING := "111";
    c_ep_l1_accpt_lat : STRING := "7";
    c_cpl_timeout_disable_sup : STRING := "FALSE";
    c_cpl_timeout_range : STRING := "0010";
    c_cpl_timeout_ranges_sup : STRING := "2";
    c_buf_opt_bma : STRING := "TRUE";
    c_perf_level_high : STRING := "TRUE";
    c_tx_last_tlp : STRING := "29";
    c_rx_ram_limit : STRING := "7FF";
    c_fc_ph : STRING := "32";
    c_fc_pd : STRING := "437";
    c_fc_nph : STRING := "12";
    c_fc_npd : STRING := "24";
    c_fc_cplh : STRING := "36";
    c_fc_cpld : STRING := "461";
    c_cpl_inf : STRING := "TRUE";
    c_cpl_infinite : STRING := "TRUE";
    c_surprise_dn_err_cap : STRING := "FALSE";
    c_dll_lnk_actv_cap : STRING := "FALSE";
    c_lnk_bndwdt_notif : STRING := "FALSE";
    c_external_clocking : STRING := "TRUE";
    c_trgt_lnk_spd : STRING := "0";
    c_hw_auton_spd_disable : STRING := "FALSE";
    c_de_emph : STRING := "FALSE";
    slot_clk : STRING := "TRUE";
    c_rcb : STRING := "0";
    c_root_cap_crs : STRING := "FALSE";
    c_slot_cap_attn_butn : STRING := "FALSE";
    c_slot_cap_attn_ind : STRING := "FALSE";
    c_slot_cap_pwr_ctrl : STRING := "FALSE";
    c_slot_cap_pwr_ind : STRING := "FALSE";
    c_slot_cap_hotplug_surprise : STRING := "FALSE";
    c_slot_cap_hotplug_cap : STRING := "FALSE";
    c_slot_cap_mrl : STRING := "FALSE";
    c_slot_cap_elec_interlock : STRING := "FALSE";
    c_slot_cap_no_cmd_comp_sup : STRING := "FLASE";
    c_slot_cap_pwr_limit_value : STRING := "0";
    c_slot_cap_pwr_limit_scale : STRING := "0";
    c_slot_cap_physical_slot_num : STRING := "0";
    intx : STRING := "TRUE";
    int_pin : STRING := "1";
    c_msi_cap_on : STRING := "TRUE";
    c_pm_cap_next_ptr : STRING := "48";
    c_msi_64b_addr : STRING := "TRUE";
    c_msi : STRING := "0";
    c_msi_mult_msg_extn : STRING := "0";
    c_msi_per_vctr_mask_cap : STRING := "FALSE";
    c_msix_cap_on : STRING := "FALSE";
    c_msix_next_ptr : STRING := "00";
    c_pcie_cap_next_ptr : STRING := "00";
    c_msix_table_size : STRING := "000";
    c_msix_table_offset : STRING := "0";
    c_msix_table_bir : STRING := "0";
    c_msix_pba_offset : STRING := "0";
    c_msix_pba_bir : STRING := "0";
    dsi : STRING := "0";
    c_dsi_bool : STRING := "FALSE";
    d1_sup : STRING := "0";
    c_d1_support : STRING := "FALSE";
    d2_sup : STRING := "0";
    c_d2_support : STRING := "FALSE";
    pme_sup : STRING := "0F";
    c_pme_support : STRING := "0F";
    no_soft_rst : STRING := "TRUE";
    pwr_con_d0_state : STRING := "00";
    con_scl_fctr_d0_state : STRING := "0";
    pwr_con_d1_state : STRING := "00";
    con_scl_fctr_d1_state : STRING := "0";
    pwr_con_d2_state : STRING := "00";
    con_scl_fctr_d2_state : STRING := "0";
    pwr_con_d3_state : STRING := "00";
    con_scl_fctr_d3_state : STRING := "0";
    pwr_dis_d0_state : STRING := "00";
    dis_scl_fctr_d0_state : STRING := "0";
    pwr_dis_d1_state : STRING := "00";
    dis_scl_fctr_d1_state : STRING := "0";
    pwr_dis_d2_state : STRING := "00";
    dis_scl_fctr_d2_state : STRING := "0";
    pwr_dis_d3_state : STRING := "00";
    dis_scl_fctr_d3_state : STRING := "0";
    c_dsn_cap_enabled : STRING := "TRUE";
    c_dsn_base_ptr : STRING := "100";
    c_vc_cap_enabled : STRING := "FALSE";
    c_vc_base_ptr : STRING := "000";
    c_vc_cap_reject_snoop : STRING := "FALSE";
    c_vsec_cap_enabled : STRING := "FALSE";
    c_vsec_base_ptr : STRING := "000";
    c_vsec_next_ptr : STRING := "000";
    c_dsn_next_ptr : STRING := "000";
    c_vc_next_ptr : STRING := "000";
    c_pci_cfg_space_addr : STRING := "3F";
    c_ext_pci_cfg_space_addr : STRING := "3FF";
    c_last_cfg_dw : STRING := "10C";
    c_enable_msg_route : STRING := "00000000000";
    bram_lat : STRING := "0";
    c_rx_raddr_lat : STRING := "0";
    c_rx_rdata_lat : STRING := "2";
    c_rx_write_lat : STRING := "0";
    c_tx_raddr_lat : STRING := "0";
    c_tx_rdata_lat : STRING := "2";
    c_tx_write_lat : STRING := "0";
    c_ll_ack_timeout_enable : STRING := "FALSE";
    c_ll_ack_timeout_function : STRING := "0";
    c_ll_ack_timeout : STRING := "0000";
    c_ll_replay_timeout_enable : STRING := "FALSE";
    c_ll_replay_timeout_func : STRING := "1";
    c_ll_replay_timeout : STRING := "0000";
    c_dis_lane_reverse : STRING := "TRUE";
    c_upconfig_capable : STRING := "TRUE";
    c_disable_scrambling : STRING := "FALSE";
    c_disable_tx_aspm_l0s : STRING := "0";
    c_rev_gt_order : STRING := "FALSE";
    c_pcie_dbg_ports : STRING := "FALSE";
    pci_exp_ref_freq : STRING := "0";
    c_xlnx_ref_board : STRING := "NONE";
    c_pcie_blk_locn : STRING := "0";
    c_ur_atomic : STRING := "FALSE";
    c_dev_cap2_atomicop32_completer_supported : STRING := "FALSE";
    c_dev_cap2_atomicop64_completer_supported : STRING := "FALSE";
    c_dev_cap2_cas128_completer_supported : STRING := "FALSE";
    c_dev_cap2_tph_completer_supported : STRING := "00";
    c_dev_cap2_ari_forwarding_supported : STRING := "FALSE";
    c_dev_cap2_atomicop_routing_supported : STRING := "FALSE";
    c_link_cap_aspm_optionality : STRING := "FALSE";
    c_aer_cap_on : STRING := "FALSE";
    c_aer_base_ptr : STRING := "000";
    c_aer_cap_nextptr : STRING := "000";
    c_aer_cap_ecrc_check_capable : STRING := "FALSE";
    c_aer_cap_multiheader : STRING := "FALSE";
    c_aer_cap_permit_rooterr_update : STRING := "FALSE";
    c_rbar_cap_on : STRING := "FALSE";
    c_rbar_base_ptr : STRING := "000";
    c_rbar_cap_nextptr : STRING := "000";
    c_rbar_num : STRING := "0";
    c_rbar_cap_sup0 : STRING := "00001";
    c_rbar_cap_index0 : STRING := "0";
    c_rbar_cap_control_encodedbar0 : STRING := "00";
    c_rbar_cap_sup1 : STRING := "00001";
    c_rbar_cap_index1 : STRING := "0";
    c_rbar_cap_control_encodedbar1 : STRING := "00";
    c_rbar_cap_sup2 : STRING := "00001";
    c_rbar_cap_index2 : STRING := "0";
    c_rbar_cap_control_encodedbar2 : STRING := "00";
    c_rbar_cap_sup3 : STRING := "00001";
    c_rbar_cap_index3 : STRING := "0";
    c_rbar_cap_control_encodedbar3 : STRING := "00";
    c_rbar_cap_sup4 : STRING := "00001";
    c_rbar_cap_index4 : STRING := "0";
    c_rbar_cap_control_encodedbar4 : STRING := "00";
    c_rbar_cap_sup5 : STRING := "00001";
    c_rbar_cap_index5 : STRING := "0";
    c_rbar_cap_control_encodedbar5 : STRING := "00";
    c_recrc_check : STRING := "0";
    c_recrc_check_trim : STRING := "FALSE";
    c_disable_rx_poisoned_resp : STRING := "FALSE";
    c_trn_np_fc : STRING := "TRUE";
    c_ur_inv_req : STRING := "TRUE";
    c_ur_prs_response : STRING := "TRUE";
    c_silicon_rev : STRING := "1";
    c_aer_cap_optional_err_support : STRING := "000000";
    PIPE_SIM : STRING := "FALSE";
    PCIE_EXT_CLK : STRING := "TRUE";
    PCIE_EXT_GT_COMMON : STRING := "FALSE";
    EXT_CH_GT_DRP : STRING := "FALSE";
    TRANSCEIVER_CTRL_STATUS_PORTS : STRING := "FALSE";
    PL_INTERFACE : STRING := "TRUE";
    CFG_MGMT_IF : STRING := "TRUE";
    CFG_CTL_IF : STRING := "TRUE";
    CFG_STATUS_IF : STRING := "TRUE";
    RCV_MSG_IF : STRING := "TRUE";
    CFG_FC_IF : STRING := "TRUE";
    ERR_REPORTING_IF : STRING := "TRUE";
    SHARED_LOGIC_IN_CORE : STRING := "FALSE";
    EXT_PIPE_INTERFACE : STRING := "FALSE";
    EXT_STARTUP_PRIMITIVE : STRING := "FALSE";
    c_aer_cap_ecrc_gen_capable : STRING := "FALSE";
    LINK_CAP_MAX_LINK_WIDTH : INTEGER := 8;
    C_DATA_WIDTH : INTEGER := 64; 
    KEEP_WIDTH : INTEGER := 8; 
    PCIE_ASYNC_EN : STRING := "FALSE"


  );
  port (

     -- 1. PCI Express (pci_exp) Interface                                                                            --
      pci_exp_txp                                : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pci_exp_txn                                : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pci_exp_rxp                                : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pci_exp_rxn                                : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);

     -- 2. Clocking Interface       
      -- Shared Logic Internal
      int_pclk_out_slave                         : out std_logic;
      int_pipe_rxusrclk_out                      : out std_logic;
      int_rxoutclk_out                           : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      int_dclk_out                               : out std_logic;
      int_userclk1_out                           : out std_logic;
      int_userclk2_out                           : out std_logic;
      int_oobclk_out                             : out std_logic;
      int_mmcm_lock_out                          : out std_logic;       
      int_qplllock_out                           : out std_logic_vector(1 downto 0);
      int_qplloutclk_out                         : out std_logic_vector(1 downto 0); 
      int_qplloutrefclk_out                      : out std_logic_vector(1 downto 0);
      int_pclk_sel_slave                         : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);

      --Shared Logic External  - Clocks
                                                                                  --
      pipe_pclk_in                               : in std_logic;
      pipe_rxusrclk_in                           : in std_logic;
      pipe_rxoutclk_in                           : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_dclk_in                               : in std_logic;
      pipe_userclk1_in                           : in std_logic;
      pipe_userclk2_in                           : in std_logic;
      pipe_oobclk_in                             : in std_logic;
      pipe_mmcm_lock_in                          : in std_logic;

      pipe_txoutclk_out                          : out std_logic;
      pipe_rxoutclk_out                          : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_pclk_sel_out                          : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_gen3_out                              : out std_logic;

     -- 3. AXI-S Interface                                                                                            --
      -- Common
      user_clk_out                               : out std_logic;
      user_reset_out                             : out std_logic;
      user_lnk_up                                : out std_logic;
      user_app_rdy                               : out std_logic;

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

     -- 4. Configuration (CFG) Interface                                                                              --
      -- EP and RP                                                      --
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

      -- EP Only                                                        --
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

      -- RP Only                                                        --
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

     -- 5. Physical Layer Control and Status (PL) Interface  --
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

      -- EP Only                                                        --
      pl_received_hot_rst                        : out std_logic;
      -- RP Only                                                        --
      pl_transmit_hot_rst                        : in std_logic;
      pl_downstream_deemph_source                : in std_logic;
     -- 6. AER interface                                                                                              --
      cfg_err_aer_headerlog                      : in std_logic_vector(127 downto 0);
      cfg_aer_interrupt_msgnum                   : in std_logic_vector(4 downto 0);
      cfg_err_aer_headerlog_set                  : out std_logic;
      cfg_aer_ecrc_check_en                      : out std_logic;
      cfg_aer_ecrc_gen_en                        : out std_logic;
     -- 7. VC interface                                                                                               --
      cfg_vc_tcvc_map                            : out std_logic_vector(6 downto 0);

     -- 8. System(SYS) Interface                                                                                      --
      sys_clk                                    : in std_logic;
      sys_rst_n                                  : in std_logic;
      pipe_mmcm_rst_n                            : in std_logic;   --     // Async      | Async
     -- PIPE PORTS to TOP Level For PIPE SIMULATION with 3rd Party IP/BFM/Xilinx BFM
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
  ----------------------------------------------------------------------------------------------------------------//
  -- PCIe Fast Config: STARTUP primitive Interface - only used in Tandem configurations                           //
  ----------------------------------------------------------------------------------------------------------------//
     -- This input should be used when the startup block is generated exteranl to the PCI Express Core
     startup_eos_in       : in std_logic;    -- 1-bit input: This signal should be driven by the EOS output of the STARTUP primitive.
     -- These inputs and outputs may be use when the startup block is generated internal to the PCI Express Core.
     startup_cfgclk       : out std_logic;   -- 1-bit output: Configuration main clock output
     startup_cfgmclk      : out std_logic;   -- 1-bit output: Configuration internal oscillator clock output
     startup_eos          : out std_logic;   -- 1-bit output: Active high output signal indicating the End Of Startup
     startup_preq         : out std_logic;   -- 1-bit output: PROGRAM request to fabric output
     startup_clk          :  in std_logic;   -- 1-bit input: User start-up clock input
     startup_gsr          :  in std_logic;   -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
     startup_gts          :  in std_logic;   -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
     startup_keyclearb    :  in std_logic;   -- 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
     startup_pack         :  in std_logic;   -- 1-bit input: PROGRAM acknowledge input
     startup_usrcclko     :  in std_logic;   -- 1-bit input: User CCLK input
     startup_usrcclkts    :  in std_logic;   -- 1-bit input: User CCLK 3-state enable input
     startup_usrdoneo     :  in std_logic;   -- 1-bit input: User DONE pin output control
     startup_usrdonets    :  in std_logic;   -- 1-bit input: User DONE 3-state enable output
  ----------------------------------------------------------------------------------------------------------------//
  -- PCIe Fast Config: ICAP primitive Interface - only used in Tandem PCIe configuration                          //
  ----------------------------------------------------------------------------------------------------------------//
      icap_clk            : in std_logic;
      icap_csib           : in std_logic;
      icap_rdwrb          : in std_logic;
      icap_i              : in std_logic_vector(31 downto 0);
      icap_o              : out std_logic_vector(31 downto 0);

      qpll_drp_crscode    : in std_logic_vector(11 downto 0);
      qpll_drp_fsm        : in std_logic_vector(17 downto 0);
      qpll_drp_done       : in std_logic_vector(1 downto 0);
      qpll_drp_reset      : in std_logic_vector(1 downto 0);
      qpll_qplllock       : in std_logic_vector(1 downto 0);
      qpll_qplloutclk     : in std_logic_vector(1 downto 0);
      qpll_qplloutrefclk  : in std_logic_vector(1 downto 0);
      qpll_qplld          : out std_logic;
      qpll_qpllreset      : out std_logic_vector(1 downto 0);
      qpll_drp_clk        : out std_logic;
      qpll_drp_rst_n      : out std_logic;
      qpll_drp_ovrd       : out std_logic;
      qpll_drp_gen3       : out std_logic;
      qpll_drp_start      : out std_logic;
      pipe_txprbssel      : in std_logic_vector(2 downto 0);
      pipe_rxprbssel      : in std_logic_vector(2 downto 0);
      pipe_txprbsforceerr : in std_logic;
      pipe_rxprbscntreset : in std_logic;
      pipe_loopback       : in std_logic_vector(2 downto 0);
      pipe_rxprbserr      : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_txinhibit      : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_rst_fsm        : out std_logic_vector(4 downto 0);
      pipe_qrst_fsm       : out std_logic_vector(11 downto 0);
      pipe_rate_fsm       : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*5)-1 downto 0);
      pipe_sync_fsm_tx    : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*6)-1 downto 0);
      pipe_sync_fsm_rx    : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*7)-1 downto 0);
      pipe_drp_fsm        : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*7)-1 downto 0);
      pipe_rst_idle       : out std_logic;
      pipe_qrst_idle      : out std_logic;
      pipe_rate_idle      : out std_logic;
      pipe_eyescandataerror : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_rxstatus       : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*3)-1 downto 0);
      pipe_dmonitorout    : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*15)-1 downto 0);
      pipe_cpll_lock      : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);           
      pipe_qpll_lock      : out std_logic_vector(((LINK_CAP_MAX_LINK_WIDTH/8)+1)-1 downto 0);  
      pipe_rxpmaresetdone : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);           
      pipe_rxbufstatus    : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*3)-1 downto 0);          
      pipe_txphaligndone  : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);           
      pipe_txphinitdone   : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);             
      pipe_txdlysresetdone: out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);           
      pipe_rxphaligndone  : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);            
      pipe_rxdlysresetdone: out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);             
      pipe_rxsyncdone     : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);             
      pipe_rxdisperr      : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*8)-1 downto 0);            
      pipe_rxnotintable   : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*8)-1 downto 0);            
      pipe_rxcommadet     : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);           
      gt_ch_drp_rdy       : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_debug_0        : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_debug_1        : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_debug_2        : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_debug_3        : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_debug_4        : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_debug_5        : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_debug_6        : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_debug_7        : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_debug_8        : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_debug_9        : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pipe_debug          : out std_logic_vector(31 downto 0);
      ext_ch_gt_drpclk    : out std_logic;
      ext_ch_gt_drpaddr   : in std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*9)-1 downto 0);
      ext_ch_gt_drpen     : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      ext_ch_gt_drpdi     : in std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*16)-1 downto 0);
      ext_ch_gt_drpwe     : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      ext_ch_gt_drpdo     : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*16)-1 downto 0);
      ext_ch_gt_drprdy    : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
      pcie_drp_clk        : in std_logic;
      pcie_drp_en         : in std_logic;
      pcie_drp_we         : in std_logic;
      pcie_drp_addr       : in std_logic_vector(8 downto 0);
      pcie_drp_di         : in std_logic_vector(15 downto 0);
      pcie_drp_do         : out std_logic_vector(15 downto 0);
      pcie_drp_rdy        : out std_logic
);
end pcie_k7_gen2x4_pcie2_top;

  architecture pcie_7x of pcie_k7_gen2x4_pcie2_top is

   attribute DowngradeIPIdentifiedWarnings: string;
   attribute DowngradeIPIdentifiedWarnings of pcie_7x : architecture is "yes";

   component pcie_k7_gen2x4_core_top is
     generic (
    LINK_CAP_MAX_LINK_WIDTH                        : integer    := 8;
    C_DATA_WIDTH                                   : integer    := 128
         );
     port (

         pci_exp_txp                                : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pci_exp_txn                                : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pci_exp_rxp                                : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pci_exp_rxn                                : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);

         int_pclk_out_slave                         : out std_logic;
         int_pipe_rxusrclk_out                      : out std_logic;
         int_rxoutclk_out                           : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         int_dclk_out                               : out std_logic;
         int_userclk1_out                           : out std_logic;
         int_userclk2_out                           : out std_logic;
         int_oobclk_out                             : out std_logic;
         int_mmcm_lock_out                          : out std_logic;       
         int_qplllock_out                           : out std_logic_vector(1 downto 0);
         int_qplloutclk_out                         : out std_logic_vector(1 downto 0); 
         int_qplloutrefclk_out                      : out std_logic_vector(1 downto 0);
         int_pclk_sel_slave                         : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);

         pipe_pclk_in                               : in std_logic;
         pipe_rxusrclk_in                           : in std_logic;
         pipe_rxoutclk_in                           : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_dclk_in                               : in std_logic;
         pipe_userclk1_in                           : in std_logic;
         pipe_userclk2_in                           : in std_logic;
         pipe_oobclk_in                             : in std_logic;
         pipe_mmcm_lock_in                          : in std_logic;

         pipe_txoutclk_out                          : out std_logic;
         pipe_rxoutclk_out                          : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_pclk_sel_out                          : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_gen3_out                              : out std_logic;

         user_clk_out                               : out std_logic;
         user_reset_out                             : out std_logic;
         user_lnk_up                                : out std_logic;
         user_app_rdy                               : out std_logic;

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

         m_axis_rx_tdata                            : out std_logic_vector((C_DATA_WIDTH - 1) downto 0);
         m_axis_rx_tkeep                            : out std_logic_vector((C_DATA_WIDTH / 8 - 1) downto 0);
         m_axis_rx_tlast                            : out std_logic;
         m_axis_rx_tvalid                           : out std_logic;
         m_axis_rx_tready                           : in std_logic;
         m_axis_rx_tuser                            : out std_logic_vector(21 downto 0);
         rx_np_ok                                   : in std_logic;
         rx_np_req                                  : in std_logic;

         fc_cpld                                    : out std_logic_vector(11 downto 0);
         fc_cplh                                    : out std_logic_vector(7 downto 0);
         fc_npd                                     : out std_logic_vector(11 downto 0);
         fc_nph                                     : out std_logic_vector(7 downto 0);
         fc_pd                                      : out std_logic_vector(11 downto 0);
         fc_ph                                      : out std_logic_vector(7 downto 0);
         fc_sel                                     : in std_logic_vector(2 downto 0);

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

         cfg_mgmt_di                                : in std_logic_vector (31 downto 0);
         cfg_mgmt_byte_en                           : in std_logic_vector (3 downto 0);
         cfg_mgmt_dwaddr                            : in std_logic_vector (9 downto 0);
         cfg_mgmt_wr_en                             : in std_logic;
         cfg_mgmt_rd_en                             : in std_logic;
         cfg_mgmt_wr_readonly                       : in std_logic;

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

         pl_received_hot_rst                        : out std_logic;
         pl_transmit_hot_rst                        : in std_logic;
         pl_downstream_deemph_source                : in std_logic;
         cfg_err_aer_headerlog                      : in std_logic_vector(127 downto 0);
         cfg_aer_interrupt_msgnum                   : in std_logic_vector(4 downto 0);
         cfg_err_aer_headerlog_set                  : out std_logic;
         cfg_aer_ecrc_check_en                      : out std_logic;
         cfg_aer_ecrc_gen_en                        : out std_logic;
         cfg_vc_tcvc_map                            : out std_logic_vector(6 downto 0);
         qpll_drp_crscode                           : in std_logic_vector(11 downto 0);
         qpll_drp_fsm                               : in std_logic_vector(17 downto 0);
         qpll_drp_done                              : in std_logic_vector(1 downto 0);
         qpll_drp_reset                             : in std_logic_vector(1 downto 0);
         qpll_qplllock                              : in std_logic_vector(1 downto 0);
         qpll_qplloutclk                            : in std_logic_vector(1 downto 0);
         qpll_qplloutrefclk                         : in std_logic_vector(1 downto 0);
         qpll_qplld                                 : out std_logic;
         qpll_qpllreset                             : out std_logic_vector(1 downto 0);
         qpll_drp_clk                               : out std_logic;
         qpll_drp_rst_n                             : out std_logic;
         qpll_drp_ovrd                              : out std_logic;
         qpll_drp_gen3                              : out std_logic;
         qpll_drp_start                             : out std_logic;
         pipe_txprbssel                             : in std_logic_vector(2 downto 0);
         pipe_rxprbssel                             : in std_logic_vector(2 downto 0);
         pipe_txprbsforceerr                        : in std_logic;
         pipe_rxprbscntreset                        : in std_logic;
         pipe_loopback                              : in std_logic_vector(2 downto 0);
         pipe_rxprbserr                             : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_txinhibit                             : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_rst_fsm                               : out std_logic_vector(4 downto 0);
         pipe_qrst_fsm                              : out std_logic_vector(11 downto 0);
         pipe_rate_fsm                              : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*5)-1 downto 0);
         pipe_sync_fsm_tx                           : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*6)-1 downto 0);
         pipe_sync_fsm_rx                           : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*7)-1 downto 0);
         pipe_drp_fsm                               : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*7)-1 downto 0);
         pipe_rst_idle                              : out std_logic;
         pipe_qrst_idle                             : out std_logic;
         pipe_rate_idle                             : out std_logic;
         pipe_eyescandataerror                      : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_rxstatus                              : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*3)-1 downto 0);
         pipe_dmonitorout                           : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*15)-1 downto 0);
         pipe_cpll_lock                             : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);           
         pipe_qpll_lock                             : out std_logic_vector(((LINK_CAP_MAX_LINK_WIDTH/8)+1)-1 downto 0);  
         pipe_rxpmaresetdone                        : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);           
         pipe_rxbufstatus                           : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*3)-1 downto 0);          
         pipe_txphaligndone                         : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);           
         pipe_txphinitdone                          : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);             
         pipe_txdlysresetdone                       : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);           
         pipe_rxphaligndone                         : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);            
         pipe_rxdlysresetdone                       : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);             
         pipe_rxsyncdone                            : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);             
         pipe_rxdisperr                             : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*8)-1 downto 0);            
         pipe_rxnotintable                          : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*8)-1 downto 0);            
         pipe_rxcommadet                            : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);           
         gt_ch_drp_rdy                              : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_debug_0                               : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_debug_1                               : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_debug_2                               : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_debug_3                               : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_debug_4                               : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_debug_5                               : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_debug_6                               : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_debug_7                               : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_debug_8                               : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_debug_9                               : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         pipe_debug                                 : out std_logic_vector(31 downto 0);
         ext_ch_gt_drpclk                           : out std_logic;
         ext_ch_gt_drpaddr                          : in std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*9)-1 downto 0);
         ext_ch_gt_drpen                            : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         ext_ch_gt_drpdi                            : in std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*16)-1 downto 0);
         ext_ch_gt_drpwe                            : in std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);
         ext_ch_gt_drpdo                            : out std_logic_vector((LINK_CAP_MAX_LINK_WIDTH*16)-1 downto 0);
         ext_ch_gt_drprdy                           : out std_logic_vector(LINK_CAP_MAX_LINK_WIDTH-1 downto 0);

         sys_clk                                    : in std_logic;
         sys_rst_n                                  : in std_logic;
         pipe_mmcm_rst_n                            : in std_logic;   --     // Async      | Async

        -- PIPE PORTS to TOP Level For PIPE SIMULATION with 3rd Party IP/BFM/Xilinx BFM
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
         ----------------------------------------------------------------------------------------------------------------//
         -- PCIe Fast Config: STARTUP primitive Interface - only used in Tandem configurations                           //
         ----------------------------------------------------------------------------------------------------------------//
         startup_eos_in                             : in std_logic;    -- 1-bit input: This signal should be driven by the EOS output of the STARTUP primitive.
         startup_cfgclk                             : out std_logic;   -- 1-bit output: Configuration main clock output
         startup_cfgmclk                            : out std_logic;   -- 1-bit output: Configuration internal oscillator clock output
         startup_eos                                : out std_logic;   -- 1-bit output: Active high output signal indicating the End Of Startup
         startup_preq                               : out std_logic;   -- 1-bit output: PROGRAM request to fabric output

         startup_clk                                :  in std_logic;   -- 1-bit input: User start-up clock input
         startup_gsr                                :  in std_logic;   -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
         startup_gts                                :  in std_logic;   -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
         startup_keyclearb                          :  in std_logic;   -- 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
         startup_pack                               :  in std_logic;   -- 1-bit input: PROGRAM acknowledge input
         startup_usrcclko                           :  in std_logic;   -- 1-bit input: User CCLK input
         startup_usrcclkts                          :  in std_logic;   -- 1-bit input: User CCLK 3-state enable input
         startup_usrdoneo                           :  in std_logic;   -- 1-bit input: User DONE pin output control
         startup_usrdonets                          :  in std_logic;   -- 1-bit input: User DONE 3-state enable output
      ----------------------------------------------------------------------------------------------------------------//
      -- PCIe Fast Config: ICAP primitive Interface - only used in Tandem PCIe configuration                          //
      ----------------------------------------------------------------------------------------------------------------//
         icap_clk                                   :  in std_logic;
         icap_csib                                  :  in std_logic;
         icap_rdwrb                                 :  in std_logic;
         icap_i                                     :  in std_logic_vector(31 downto 0);
         icap_o                                     :  out std_logic_vector(31 downto 0);

         pcie_drp_clk                               : in std_logic;
         pcie_drp_en                                : in std_logic;
         pcie_drp_we                                : in std_logic;
         pcie_drp_addr                              : in std_logic_vector(8 downto 0);
         pcie_drp_di                                : in std_logic_vector(15 downto 0);
         pcie_drp_do                                : out std_logic_vector(15 downto 0);
         pcie_drp_rdy                               : out std_logic

   ); end component;

  begin

    inst : pcie_k7_gen2x4_core_top
    generic map (

    LINK_CAP_MAX_LINK_WIDTH                  => LINK_CAP_MAX_LINK_WIDTH ,
    C_DATA_WIDTH                             => C_DATA_WIDTH
    )
    port map (
      pci_exp_txp => pci_exp_txp ,
      pci_exp_txn => pci_exp_txn ,
      pci_exp_rxp => pci_exp_rxp ,
      pci_exp_rxn => pci_exp_rxn ,

      int_pclk_out_slave      => int_pclk_out_slave   ,                   
      int_pipe_rxusrclk_out   => int_pipe_rxusrclk_out,                  
      int_rxoutclk_out        => int_rxoutclk_out     ,                   
      int_dclk_out            => int_dclk_out         ,                   
      int_userclk1_out        => int_userclk1_out     ,                   
      int_userclk2_out        => int_userclk2_out     ,                   
      int_oobclk_out          => int_oobclk_out       ,                   
      int_mmcm_lock_out       => int_mmcm_lock_out    ,                   
      int_qplllock_out        => int_qplllock_out     ,                   
      int_qplloutclk_out      => int_qplloutclk_out   ,                   
      int_qplloutrefclk_out   => int_qplloutrefclk_out,                   
      int_pclk_sel_slave      => int_pclk_sel_slave   ,                   

      pipe_pclk_in => pipe_pclk_in ,
      pipe_rxusrclk_in => pipe_rxusrclk_in ,
      pipe_rxoutclk_in => pipe_rxoutclk_in ,
      pipe_dclk_in => pipe_dclk_in ,
      pipe_userclk1_in => pipe_userclk1_in ,
      pipe_userclk2_in => pipe_userclk2_in ,
      pipe_oobclk_in => pipe_oobclk_in ,
      pipe_mmcm_lock_in => pipe_mmcm_lock_in ,

      pipe_txoutclk_out => pipe_txoutclk_out ,
      pipe_rxoutclk_out => pipe_rxoutclk_out ,
      pipe_pclk_sel_out => pipe_pclk_sel_out ,
      pipe_gen3_out => pipe_gen3_out ,

      user_clk_out => user_clk_out ,
      user_reset_out => user_reset_out ,
      user_lnk_up => user_lnk_up ,
      user_app_rdy => user_app_rdy,

      tx_buf_av => tx_buf_av ,
      tx_cfg_req => tx_cfg_req ,
      tx_err_drop => tx_err_drop ,
      s_axis_tx_tready => s_axis_tx_tready ,
      s_axis_tx_tdata => s_axis_tx_tdata ,
      s_axis_tx_tkeep => s_axis_tx_tkeep ,
      s_axis_tx_tlast => s_axis_tx_tlast ,
      s_axis_tx_tvalid => s_axis_tx_tvalid ,
      s_axis_tx_tuser => s_axis_tx_tuser ,
      tx_cfg_gnt => tx_cfg_gnt ,

      m_axis_rx_tdata => m_axis_rx_tdata ,
      m_axis_rx_tkeep => m_axis_rx_tkeep ,
      m_axis_rx_tlast => m_axis_rx_tlast ,
      m_axis_rx_tvalid => m_axis_rx_tvalid ,
      m_axis_rx_tready => m_axis_rx_tready ,
      m_axis_rx_tuser => m_axis_rx_tuser ,
      rx_np_ok => rx_np_ok ,
      rx_np_req => rx_np_req ,

      fc_cpld => fc_cpld ,
      fc_cplh => fc_cplh ,
      fc_npd => fc_npd ,
      fc_nph => fc_nph ,
      fc_pd => fc_pd ,
      fc_ph => fc_ph ,
      fc_sel => fc_sel ,

      cfg_mgmt_do => cfg_mgmt_do ,
      cfg_mgmt_rd_wr_done => cfg_mgmt_rd_wr_done ,

      cfg_status => cfg_status ,
      cfg_command => cfg_command ,
      cfg_dstatus => cfg_dstatus ,
      cfg_dcommand => cfg_dcommand ,
      cfg_lstatus => cfg_lstatus ,
      cfg_lcommand => cfg_lcommand ,
      cfg_dcommand2 => cfg_dcommand2 ,
      cfg_pcie_link_state => cfg_pcie_link_state ,

      cfg_pmcsr_pme_en => cfg_pmcsr_pme_en ,
      cfg_pmcsr_powerstate => cfg_pmcsr_powerstate ,
      cfg_pmcsr_pme_status => cfg_pmcsr_pme_status ,
      cfg_received_func_lvl_rst => cfg_received_func_lvl_rst ,

      cfg_mgmt_di => cfg_mgmt_di ,
      cfg_mgmt_byte_en => cfg_mgmt_byte_en ,
      cfg_mgmt_dwaddr => cfg_mgmt_dwaddr ,
      cfg_mgmt_wr_en => cfg_mgmt_wr_en ,
      cfg_mgmt_rd_en => cfg_mgmt_rd_en ,
      cfg_mgmt_wr_readonly => cfg_mgmt_wr_readonly ,

      cfg_err_ecrc => cfg_err_ecrc ,
      cfg_err_ur => cfg_err_ur ,
      cfg_err_cpl_timeout => cfg_err_cpl_timeout ,
      cfg_err_cpl_unexpect => cfg_err_cpl_unexpect ,
      cfg_err_cpl_abort => cfg_err_cpl_abort ,
      cfg_err_posted => cfg_err_posted ,
      cfg_err_cor => cfg_err_cor ,
      cfg_err_atomic_egress_blocked => cfg_err_atomic_egress_blocked ,
      cfg_err_internal_cor => cfg_err_internal_cor ,
      cfg_err_malformed => cfg_err_malformed ,
      cfg_err_mc_blocked => cfg_err_mc_blocked ,
      cfg_err_poisoned => cfg_err_poisoned ,
      cfg_err_norecovery => cfg_err_norecovery ,
      cfg_err_tlp_cpl_header => cfg_err_tlp_cpl_header ,
      cfg_err_cpl_rdy => cfg_err_cpl_rdy ,
      cfg_err_locked => cfg_err_locked ,
      cfg_err_acs => cfg_err_acs ,
      cfg_err_internal_uncor => cfg_err_internal_uncor ,
      cfg_trn_pending => cfg_trn_pending ,
      cfg_pm_halt_aspm_l0s => cfg_pm_halt_aspm_l0s ,
      cfg_pm_halt_aspm_l1 => cfg_pm_halt_aspm_l1 ,
      cfg_pm_force_state_en => cfg_pm_force_state_en ,
      cfg_pm_force_state => cfg_pm_force_state ,
      cfg_dsn => cfg_dsn ,

      cfg_interrupt => cfg_interrupt ,
      cfg_interrupt_rdy => cfg_interrupt_rdy ,
      cfg_interrupt_assert => cfg_interrupt_assert ,
      cfg_interrupt_di => cfg_interrupt_di ,
      cfg_interrupt_do => cfg_interrupt_do ,
      cfg_interrupt_mmenable => cfg_interrupt_mmenable ,
      cfg_interrupt_msienable => cfg_interrupt_msienable ,
      cfg_interrupt_msixenable => cfg_interrupt_msixenable ,
      cfg_interrupt_msixfm => cfg_interrupt_msixfm ,
      cfg_interrupt_stat => cfg_interrupt_stat ,
      cfg_pciecap_interrupt_msgnum => cfg_pciecap_interrupt_msgnum ,
      cfg_to_turnoff => cfg_to_turnoff ,
      cfg_turnoff_ok => cfg_turnoff_ok ,
      cfg_bus_number => cfg_bus_number ,
      cfg_device_number => cfg_device_number ,
      cfg_function_number => cfg_function_number ,
      cfg_pm_wake => cfg_pm_wake ,

      cfg_pm_send_pme_to => cfg_pm_send_pme_to ,
      cfg_ds_bus_number => cfg_ds_bus_number ,
      cfg_ds_device_number => cfg_ds_device_number ,
      cfg_ds_function_number => cfg_ds_function_number ,

      cfg_mgmt_wr_rw1c_as_rw => cfg_mgmt_wr_rw1c_as_rw ,
      cfg_msg_received => cfg_msg_received ,
      cfg_msg_data => cfg_msg_data ,

      cfg_bridge_serr_en => cfg_bridge_serr_en ,
      cfg_slot_control_electromech_il_ctl_pulse => cfg_slot_control_electromech_il_ctl_pulse ,
      cfg_root_control_syserr_corr_err_en => cfg_root_control_syserr_corr_err_en ,
      cfg_root_control_syserr_non_fatal_err_en => cfg_root_control_syserr_non_fatal_err_en ,
      cfg_root_control_syserr_fatal_err_en => cfg_root_control_syserr_fatal_err_en ,
      cfg_root_control_pme_int_en => cfg_root_control_pme_int_en ,
      cfg_aer_rooterr_corr_err_reporting_en => cfg_aer_rooterr_corr_err_reporting_en ,
      cfg_aer_rooterr_non_fatal_err_reporting_en => cfg_aer_rooterr_non_fatal_err_reporting_en ,
      cfg_aer_rooterr_fatal_err_reporting_en => cfg_aer_rooterr_fatal_err_reporting_en ,
      cfg_aer_rooterr_corr_err_received => cfg_aer_rooterr_corr_err_received ,
      cfg_aer_rooterr_non_fatal_err_received => cfg_aer_rooterr_non_fatal_err_received ,
      cfg_aer_rooterr_fatal_err_received => cfg_aer_rooterr_fatal_err_received ,

      cfg_msg_received_err_cor => cfg_msg_received_err_cor ,
      cfg_msg_received_err_non_fatal => cfg_msg_received_err_non_fatal ,
      cfg_msg_received_err_fatal => cfg_msg_received_err_fatal ,
      cfg_msg_received_pm_as_nak => cfg_msg_received_pm_as_nak ,
      cfg_msg_received_pm_pme => cfg_msg_received_pm_pme ,
      cfg_msg_received_pme_to_ack => cfg_msg_received_pme_to_ack ,
      cfg_msg_received_assert_int_a => cfg_msg_received_assert_int_a ,
      cfg_msg_received_assert_int_b => cfg_msg_received_assert_int_b ,
      cfg_msg_received_assert_int_c => cfg_msg_received_assert_int_c ,
      cfg_msg_received_assert_int_d => cfg_msg_received_assert_int_d ,
      cfg_msg_received_deassert_int_a => cfg_msg_received_deassert_int_a ,
      cfg_msg_received_deassert_int_b => cfg_msg_received_deassert_int_b ,
      cfg_msg_received_deassert_int_c => cfg_msg_received_deassert_int_c ,
      cfg_msg_received_deassert_int_d => cfg_msg_received_deassert_int_d ,
      cfg_msg_received_setslotpowerlimit => cfg_msg_received_setslotpowerlimit ,

      pl_directed_link_change => pl_directed_link_change ,
      pl_directed_link_width => pl_directed_link_width ,
      pl_directed_link_speed => pl_directed_link_speed ,
      pl_directed_link_auton => pl_directed_link_auton ,
      pl_upstream_prefer_deemph => pl_upstream_prefer_deemph ,

      pl_sel_lnk_rate => pl_sel_lnk_rate ,
      pl_sel_lnk_width => pl_sel_lnk_width ,
      pl_ltssm_state => pl_ltssm_state ,
      pl_lane_reversal_mode => pl_lane_reversal_mode ,

      pl_phy_lnk_up => pl_phy_lnk_up ,
      pl_tx_pm_state => pl_tx_pm_state ,
      pl_rx_pm_state => pl_rx_pm_state ,

      pl_link_upcfg_cap => pl_link_upcfg_cap ,
      pl_link_gen2_cap => pl_link_gen2_cap ,
      pl_link_partner_gen2_supported => pl_link_partner_gen2_supported ,
      pl_initial_link_width => pl_initial_link_width ,

      pl_directed_change_done => pl_directed_change_done ,

      pl_received_hot_rst => pl_received_hot_rst ,
      pl_transmit_hot_rst => pl_transmit_hot_rst ,
      pl_downstream_deemph_source => pl_downstream_deemph_source ,
      cfg_err_aer_headerlog => cfg_err_aer_headerlog ,
      cfg_aer_interrupt_msgnum => cfg_aer_interrupt_msgnum ,
      cfg_err_aer_headerlog_set => cfg_err_aer_headerlog_set ,
      cfg_aer_ecrc_check_en => cfg_aer_ecrc_check_en ,
      cfg_aer_ecrc_gen_en => cfg_aer_ecrc_gen_en ,
      cfg_vc_tcvc_map => cfg_vc_tcvc_map ,

      sys_clk => sys_clk ,
      sys_rst_n => sys_rst_n ,
      pipe_mmcm_rst_n => pipe_mmcm_rst_n ,        -- Async      | Async

      common_commands_in  => common_commands_in  , 
      pipe_rx_0_sigs      => pipe_rx_0_sigs      , 
      pipe_rx_1_sigs      => pipe_rx_1_sigs      , 
      pipe_rx_2_sigs      => pipe_rx_2_sigs      , 
      pipe_rx_3_sigs      => pipe_rx_3_sigs      , 
      pipe_rx_4_sigs      => pipe_rx_4_sigs      , 
      pipe_rx_5_sigs      => pipe_rx_5_sigs      , 
      pipe_rx_6_sigs      => pipe_rx_6_sigs      , 
      pipe_rx_7_sigs      => pipe_rx_7_sigs      , 

      common_commands_out => common_commands_out , 
      pipe_tx_0_sigs      => pipe_tx_0_sigs      , 
      pipe_tx_1_sigs      => pipe_tx_1_sigs      , 
      pipe_tx_2_sigs      => pipe_tx_2_sigs      , 
      pipe_tx_3_sigs      => pipe_tx_3_sigs      , 
      pipe_tx_4_sigs      => pipe_tx_4_sigs      , 
      pipe_tx_5_sigs      => pipe_tx_5_sigs      , 
      pipe_tx_6_sigs      => pipe_tx_6_sigs      , 
      pipe_tx_7_sigs      => pipe_tx_7_sigs      , 
    -- STARTUP primitive interface - Can only be used with Tandem Configurations
      startup_eos_in      => startup_eos_in,          -- 1-bit input: This signal should be driven by the EOS output of the STARTUP primitive.
      startup_cfgclk      => startup_cfgclk,          --  1-bit output: Configuration main clock output
      startup_cfgmclk     => startup_cfgmclk,         --  1-bit output: Configuration internal oscillator clock output
      startup_eos         => startup_eos,             --  1-bit output: Active high output signal indicating the End Of Startup.
      startup_preq        => startup_preq,            --  1-bit output: PROGRAM request to fabric output
      startup_clk         => startup_clk,             --  1-bit input: User start-up clock input
      startup_gsr         => startup_gsr,             --  1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
      startup_gts         => startup_gts,             --  1-bit input: Global 3-state input (GTS cannot be used for the port name)
      startup_keyclearb   => startup_keyclearb,       --  1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
      startup_pack        => startup_pack,            --  1-bit input: PROGRAM acknowledge input
      startup_usrcclko    => startup_usrcclko,        --  1-bit input: User CCLK input
      startup_usrcclkts   => startup_usrcclkts,       --  1-bit input: User CCLK 3-state enable input
      startup_usrdoneo    => startup_usrdoneo,        --  1-bit input: User DONE pin output control
      startup_usrdonets   => startup_usrdonets,       --  1-bit input: User DONE 3-state enable output
    -- ICAP primitive interface  - Can only be used with Tandem Configurations
      icap_clk => icap_clk,
      icap_csib => icap_csib,
      icap_rdwrb => icap_rdwrb,
      icap_i => icap_i,
      icap_o => icap_o,
      qpll_drp_crscode => qpll_drp_crscode,
      qpll_drp_fsm => qpll_drp_fsm,
      qpll_drp_done => qpll_drp_done,
      qpll_drp_reset => qpll_drp_reset,
      qpll_qplllock => qpll_qplllock,
      qpll_qplloutclk => qpll_qplloutclk,
      qpll_qplloutrefclk => qpll_qplloutrefclk,
      qpll_qplld => qpll_qplld,
      qpll_qpllreset => qpll_qpllreset,
      qpll_drp_clk => qpll_drp_clk,
      qpll_drp_rst_n => qpll_drp_rst_n,
      qpll_drp_ovrd => qpll_drp_ovrd,
      qpll_drp_gen3 => qpll_drp_gen3,
      qpll_drp_start => qpll_drp_start,
      pipe_txprbssel => pipe_txprbssel,
      pipe_rxprbssel => pipe_rxprbssel,
      pipe_txprbsforceerr => pipe_txprbsforceerr,
      pipe_rxprbscntreset => pipe_rxprbscntreset,
      pipe_loopback => pipe_loopback,
      pipe_rxprbserr => pipe_rxprbserr,
      pipe_txinhibit => pipe_txinhibit,
      pipe_rst_fsm => pipe_rst_fsm,
      pipe_qrst_fsm => pipe_qrst_fsm,
      pipe_rate_fsm => pipe_rate_fsm,
      pipe_sync_fsm_tx => pipe_sync_fsm_tx,
      pipe_sync_fsm_rx => pipe_sync_fsm_rx,
      pipe_drp_fsm => pipe_drp_fsm,
      pipe_rst_idle => pipe_rst_idle,
      pipe_qrst_idle => pipe_qrst_idle,
      pipe_rate_idle => pipe_rate_idle,
      pipe_eyescandataerror => pipe_eyescandataerror,
      pipe_rxstatus => pipe_rxstatus,
      pipe_dmonitorout => pipe_dmonitorout,
      pipe_cpll_lock       => pipe_cpll_lock,
      pipe_qpll_lock       => pipe_qpll_lock,
      pipe_rxpmaresetdone  => pipe_rxpmaresetdone,       
      pipe_rxbufstatus     => pipe_rxbufstatus,         
      pipe_txphaligndone   => pipe_txphaligndone,       
      pipe_txphinitdone    => pipe_txphinitdone,        
      pipe_txdlysresetdone => pipe_txdlysresetdone,    
      pipe_rxphaligndone   => pipe_rxphaligndone,      
      pipe_rxdlysresetdone => pipe_rxdlysresetdone,     
      pipe_rxsyncdone      => pipe_rxsyncdone,       
      pipe_rxdisperr       => pipe_rxdisperr,       
      pipe_rxnotintable    => pipe_rxnotintable,      
      pipe_rxcommadet      => pipe_rxcommadet,        
      gt_ch_drp_rdy => gt_ch_drp_rdy,
      pipe_debug_0 => pipe_debug_0,
      pipe_debug_1 => pipe_debug_1,
      pipe_debug_2 => pipe_debug_2,
      pipe_debug_3 => pipe_debug_3,
      pipe_debug_4 => pipe_debug_4,
      pipe_debug_5 => pipe_debug_5,
      pipe_debug_6 => pipe_debug_6,
      pipe_debug_7 => pipe_debug_7,
      pipe_debug_8 => pipe_debug_8,
      pipe_debug_9 => pipe_debug_9,
      pipe_debug => pipe_debug,
      ext_ch_gt_drpclk => ext_ch_gt_drpclk,
      ext_ch_gt_drpaddr => ext_ch_gt_drpaddr,
      ext_ch_gt_drpen => ext_ch_gt_drpen,
      ext_ch_gt_drpdi => ext_ch_gt_drpdi,
      ext_ch_gt_drpwe => ext_ch_gt_drpwe,
      ext_ch_gt_drpdo => ext_ch_gt_drpdo,
      ext_ch_gt_drprdy => ext_ch_gt_drprdy,

      pcie_drp_clk =>  pcie_drp_clk,
      pcie_drp_en  => pcie_drp_en,
      pcie_drp_we  => pcie_drp_we,
      pcie_drp_addr => pcie_drp_addr,
      pcie_drp_di => pcie_drp_di,
      pcie_drp_do => pcie_drp_do,
      pcie_drp_rdy  => pcie_drp_rdy
    );


end pcie_7x;




