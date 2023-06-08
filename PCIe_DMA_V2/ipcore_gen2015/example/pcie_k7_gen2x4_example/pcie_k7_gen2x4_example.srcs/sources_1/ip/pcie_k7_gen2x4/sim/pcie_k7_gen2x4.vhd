-- (c) Copyright 1995-2015 Xilinx, Inc. All rights reserved.
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
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:ip:pcie_7x:3.1
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY pcie_k7_gen2x4 IS
  PORT (
    pci_exp_txp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    pci_exp_txn : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    pci_exp_rxp : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    pci_exp_rxn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    pipe_pclk_in : IN STD_LOGIC;
    pipe_rxusrclk_in : IN STD_LOGIC;
    pipe_rxoutclk_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    pipe_dclk_in : IN STD_LOGIC;
    pipe_userclk1_in : IN STD_LOGIC;
    pipe_userclk2_in : IN STD_LOGIC;
    pipe_oobclk_in : IN STD_LOGIC;
    pipe_mmcm_lock_in : IN STD_LOGIC;
    pipe_txoutclk_out : OUT STD_LOGIC;
    pipe_rxoutclk_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    pipe_pclk_sel_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    pipe_gen3_out : OUT STD_LOGIC;
    user_clk_out : OUT STD_LOGIC;
    user_reset_out : OUT STD_LOGIC;
    user_lnk_up : OUT STD_LOGIC;
    user_app_rdy : OUT STD_LOGIC;
    tx_buf_av : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    tx_cfg_req : OUT STD_LOGIC;
    tx_err_drop : OUT STD_LOGIC;
    s_axis_tx_tready : OUT STD_LOGIC;
    s_axis_tx_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_axis_tx_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    s_axis_tx_tlast : IN STD_LOGIC;
    s_axis_tx_tvalid : IN STD_LOGIC;
    s_axis_tx_tuser : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    tx_cfg_gnt : IN STD_LOGIC;
    m_axis_rx_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axis_rx_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axis_rx_tlast : OUT STD_LOGIC;
    m_axis_rx_tvalid : OUT STD_LOGIC;
    m_axis_rx_tready : IN STD_LOGIC;
    m_axis_rx_tuser : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
    rx_np_ok : IN STD_LOGIC;
    rx_np_req : IN STD_LOGIC;
    fc_cpld : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    fc_cplh : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fc_npd : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    fc_nph : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fc_pd : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    fc_ph : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    fc_sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    cfg_mgmt_do : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    cfg_mgmt_rd_wr_done : OUT STD_LOGIC;
    cfg_status : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    cfg_command : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    cfg_dstatus : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    cfg_dcommand : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    cfg_lstatus : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    cfg_lcommand : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    cfg_dcommand2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    cfg_pcie_link_state : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    cfg_pmcsr_pme_en : OUT STD_LOGIC;
    cfg_pmcsr_powerstate : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    cfg_pmcsr_pme_status : OUT STD_LOGIC;
    cfg_received_func_lvl_rst : OUT STD_LOGIC;
    cfg_mgmt_di : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    cfg_mgmt_byte_en : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    cfg_mgmt_dwaddr : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    cfg_mgmt_wr_en : IN STD_LOGIC;
    cfg_mgmt_rd_en : IN STD_LOGIC;
    cfg_mgmt_wr_readonly : IN STD_LOGIC;
    cfg_err_ecrc : IN STD_LOGIC;
    cfg_err_ur : IN STD_LOGIC;
    cfg_err_cpl_timeout : IN STD_LOGIC;
    cfg_err_cpl_unexpect : IN STD_LOGIC;
    cfg_err_cpl_abort : IN STD_LOGIC;
    cfg_err_posted : IN STD_LOGIC;
    cfg_err_cor : IN STD_LOGIC;
    cfg_err_atomic_egress_blocked : IN STD_LOGIC;
    cfg_err_internal_cor : IN STD_LOGIC;
    cfg_err_malformed : IN STD_LOGIC;
    cfg_err_mc_blocked : IN STD_LOGIC;
    cfg_err_poisoned : IN STD_LOGIC;
    cfg_err_norecovery : IN STD_LOGIC;
    cfg_err_tlp_cpl_header : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    cfg_err_cpl_rdy : OUT STD_LOGIC;
    cfg_err_locked : IN STD_LOGIC;
    cfg_err_acs : IN STD_LOGIC;
    cfg_err_internal_uncor : IN STD_LOGIC;
    cfg_trn_pending : IN STD_LOGIC;
    cfg_pm_halt_aspm_l0s : IN STD_LOGIC;
    cfg_pm_halt_aspm_l1 : IN STD_LOGIC;
    cfg_pm_force_state_en : IN STD_LOGIC;
    cfg_pm_force_state : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    cfg_dsn : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    cfg_interrupt : IN STD_LOGIC;
    cfg_interrupt_rdy : OUT STD_LOGIC;
    cfg_interrupt_assert : IN STD_LOGIC;
    cfg_interrupt_di : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    cfg_interrupt_do : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    cfg_interrupt_mmenable : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    cfg_interrupt_msienable : OUT STD_LOGIC;
    cfg_interrupt_msixenable : OUT STD_LOGIC;
    cfg_interrupt_msixfm : OUT STD_LOGIC;
    cfg_interrupt_stat : IN STD_LOGIC;
    cfg_pciecap_interrupt_msgnum : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    cfg_to_turnoff : OUT STD_LOGIC;
    cfg_turnoff_ok : IN STD_LOGIC;
    cfg_bus_number : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    cfg_device_number : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    cfg_function_number : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    cfg_pm_wake : IN STD_LOGIC;
    cfg_pm_send_pme_to : IN STD_LOGIC;
    cfg_ds_bus_number : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    cfg_ds_device_number : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    cfg_ds_function_number : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    cfg_mgmt_wr_rw1c_as_rw : IN STD_LOGIC;
    cfg_msg_received : OUT STD_LOGIC;
    cfg_msg_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    cfg_bridge_serr_en : OUT STD_LOGIC;
    cfg_slot_control_electromech_il_ctl_pulse : OUT STD_LOGIC;
    cfg_root_control_syserr_corr_err_en : OUT STD_LOGIC;
    cfg_root_control_syserr_non_fatal_err_en : OUT STD_LOGIC;
    cfg_root_control_syserr_fatal_err_en : OUT STD_LOGIC;
    cfg_root_control_pme_int_en : OUT STD_LOGIC;
    cfg_aer_rooterr_corr_err_reporting_en : OUT STD_LOGIC;
    cfg_aer_rooterr_non_fatal_err_reporting_en : OUT STD_LOGIC;
    cfg_aer_rooterr_fatal_err_reporting_en : OUT STD_LOGIC;
    cfg_aer_rooterr_corr_err_received : OUT STD_LOGIC;
    cfg_aer_rooterr_non_fatal_err_received : OUT STD_LOGIC;
    cfg_aer_rooterr_fatal_err_received : OUT STD_LOGIC;
    cfg_msg_received_err_cor : OUT STD_LOGIC;
    cfg_msg_received_err_non_fatal : OUT STD_LOGIC;
    cfg_msg_received_err_fatal : OUT STD_LOGIC;
    cfg_msg_received_pm_as_nak : OUT STD_LOGIC;
    cfg_msg_received_pm_pme : OUT STD_LOGIC;
    cfg_msg_received_pme_to_ack : OUT STD_LOGIC;
    cfg_msg_received_assert_int_a : OUT STD_LOGIC;
    cfg_msg_received_assert_int_b : OUT STD_LOGIC;
    cfg_msg_received_assert_int_c : OUT STD_LOGIC;
    cfg_msg_received_assert_int_d : OUT STD_LOGIC;
    cfg_msg_received_deassert_int_a : OUT STD_LOGIC;
    cfg_msg_received_deassert_int_b : OUT STD_LOGIC;
    cfg_msg_received_deassert_int_c : OUT STD_LOGIC;
    cfg_msg_received_deassert_int_d : OUT STD_LOGIC;
    cfg_msg_received_setslotpowerlimit : OUT STD_LOGIC;
    pl_directed_link_change : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    pl_directed_link_width : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    pl_directed_link_speed : IN STD_LOGIC;
    pl_directed_link_auton : IN STD_LOGIC;
    pl_upstream_prefer_deemph : IN STD_LOGIC;
    pl_sel_lnk_rate : OUT STD_LOGIC;
    pl_sel_lnk_width : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    pl_ltssm_state : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    pl_lane_reversal_mode : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    pl_phy_lnk_up : OUT STD_LOGIC;
    pl_tx_pm_state : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    pl_rx_pm_state : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    pl_link_upcfg_cap : OUT STD_LOGIC;
    pl_link_gen2_cap : OUT STD_LOGIC;
    pl_link_partner_gen2_supported : OUT STD_LOGIC;
    pl_initial_link_width : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    pl_directed_change_done : OUT STD_LOGIC;
    pl_received_hot_rst : OUT STD_LOGIC;
    pl_transmit_hot_rst : IN STD_LOGIC;
    pl_downstream_deemph_source : IN STD_LOGIC;
    cfg_err_aer_headerlog : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    cfg_aer_interrupt_msgnum : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    cfg_err_aer_headerlog_set : OUT STD_LOGIC;
    cfg_aer_ecrc_check_en : OUT STD_LOGIC;
    cfg_aer_ecrc_gen_en : OUT STD_LOGIC;
    cfg_vc_tcvc_map : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    sys_clk : IN STD_LOGIC;
    sys_rst_n : IN STD_LOGIC;
    pipe_mmcm_rst_n : IN STD_LOGIC;
    pcie_drp_clk : IN STD_LOGIC;
    pcie_drp_en : IN STD_LOGIC;
    pcie_drp_we : IN STD_LOGIC;
    pcie_drp_addr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    pcie_drp_di : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    pcie_drp_do : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    pcie_drp_rdy : OUT STD_LOGIC
  );
END pcie_k7_gen2x4;

ARCHITECTURE pcie_k7_gen2x4_arch OF pcie_k7_gen2x4 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF pcie_k7_gen2x4_arch: ARCHITECTURE IS "yes";

  COMPONENT pcie_k7_gen2x4_pcie2_top IS
    GENERIC (
      c_component_name : STRING;
      dev_port_type : STRING;
      c_dev_port_type : STRING;
      c_header_type : STRING;
      c_upstream_facing : STRING;
      max_lnk_wdt : STRING;
      max_lnk_spd : STRING;
      c_gen1 : BOOLEAN;
      pci_exp_int_freq : INTEGER;
      c_pcie_fast_config : INTEGER;
      bar_0 : STRING;
      bar_1 : STRING;
      bar_2 : STRING;
      bar_3 : STRING;
      bar_4 : STRING;
      bar_5 : STRING;
      xrom_bar : STRING;
      cost_table : INTEGER;
      ven_id : STRING;
      dev_id : STRING;
      rev_id : STRING;
      subsys_ven_id : STRING;
      subsys_id : STRING;
      class_code : STRING;
      cardbus_cis_ptr : STRING;
      cap_ver : STRING;
      c_pcie_cap_slot_implemented : STRING;
      mps : STRING;
      cmps : STRING;
      ext_tag_fld_sup : STRING;
      c_dev_control_ext_tag_default : STRING;
      phantm_func_sup : STRING;
      c_phantom_functions : STRING;
      ep_l0s_accpt_lat : STRING;
      c_ep_l0s_accpt_lat : STRING;
      ep_l1_accpt_lat : STRING;
      c_ep_l1_accpt_lat : STRING;
      c_cpl_timeout_disable_sup : STRING;
      c_cpl_timeout_range : STRING;
      c_cpl_timeout_ranges_sup : STRING;
      c_buf_opt_bma : STRING;
      c_perf_level_high : STRING;
      c_tx_last_tlp : STRING;
      c_rx_ram_limit : STRING;
      c_fc_ph : STRING;
      c_fc_pd : STRING;
      c_fc_nph : STRING;
      c_fc_npd : STRING;
      c_fc_cplh : STRING;
      c_fc_cpld : STRING;
      c_cpl_inf : STRING;
      c_cpl_infinite : STRING;
      c_dll_lnk_actv_cap : STRING;
      c_trgt_lnk_spd : STRING;
      c_hw_auton_spd_disable : STRING;
      c_de_emph : STRING;
      slot_clk : STRING;
      c_rcb : STRING;
      c_root_cap_crs : STRING;
      c_slot_cap_attn_butn : STRING;
      c_slot_cap_attn_ind : STRING;
      c_slot_cap_pwr_ctrl : STRING;
      c_slot_cap_pwr_ind : STRING;
      c_slot_cap_hotplug_surprise : STRING;
      c_slot_cap_hotplug_cap : STRING;
      c_slot_cap_mrl : STRING;
      c_slot_cap_elec_interlock : STRING;
      c_slot_cap_no_cmd_comp_sup : STRING;
      c_slot_cap_pwr_limit_value : STRING;
      c_slot_cap_pwr_limit_scale : STRING;
      c_slot_cap_physical_slot_num : STRING;
      intx : STRING;
      int_pin : STRING;
      c_msi_cap_on : STRING;
      c_pm_cap_next_ptr : STRING;
      c_msi_64b_addr : STRING;
      c_msi : STRING;
      c_msi_mult_msg_extn : STRING;
      c_msi_per_vctr_mask_cap : STRING;
      c_msix_cap_on : STRING;
      c_msix_next_ptr : STRING;
      c_pcie_cap_next_ptr : STRING;
      c_msix_table_size : STRING;
      c_msix_table_offset : STRING;
      c_msix_table_bir : STRING;
      c_msix_pba_offset : STRING;
      c_msix_pba_bir : STRING;
      dsi : STRING;
      c_dsi_bool : STRING;
      d1_sup : STRING;
      c_d1_support : STRING;
      d2_sup : STRING;
      c_d2_support : STRING;
      pme_sup : STRING;
      c_pme_support : STRING;
      no_soft_rst : STRING;
      pwr_con_d0_state : STRING;
      con_scl_fctr_d0_state : STRING;
      pwr_con_d1_state : STRING;
      con_scl_fctr_d1_state : STRING;
      pwr_con_d2_state : STRING;
      con_scl_fctr_d2_state : STRING;
      pwr_con_d3_state : STRING;
      con_scl_fctr_d3_state : STRING;
      pwr_dis_d0_state : STRING;
      dis_scl_fctr_d0_state : STRING;
      pwr_dis_d1_state : STRING;
      dis_scl_fctr_d1_state : STRING;
      pwr_dis_d2_state : STRING;
      dis_scl_fctr_d2_state : STRING;
      pwr_dis_d3_state : STRING;
      dis_scl_fctr_d3_state : STRING;
      c_dsn_cap_enabled : STRING;
      c_dsn_base_ptr : STRING;
      c_vc_cap_enabled : STRING;
      c_vc_base_ptr : STRING;
      c_vc_cap_reject_snoop : STRING;
      c_vsec_cap_enabled : STRING;
      c_vsec_base_ptr : STRING;
      c_vsec_next_ptr : STRING;
      c_dsn_next_ptr : STRING;
      c_vc_next_ptr : STRING;
      c_pci_cfg_space_addr : STRING;
      c_ext_pci_cfg_space_addr : STRING;
      c_last_cfg_dw : STRING;
      c_enable_msg_route : STRING;
      bram_lat : STRING;
      c_rx_raddr_lat : STRING;
      c_rx_rdata_lat : STRING;
      c_rx_write_lat : STRING;
      c_tx_raddr_lat : STRING;
      c_tx_rdata_lat : STRING;
      c_tx_write_lat : STRING;
      c_ll_ack_timeout_enable : STRING;
      c_ll_ack_timeout_function : STRING;
      c_ll_ack_timeout : STRING;
      c_ll_replay_timeout_enable : STRING;
      c_ll_replay_timeout_func : STRING;
      c_ll_replay_timeout : STRING;
      c_dis_lane_reverse : STRING;
      c_upconfig_capable : STRING;
      c_disable_scrambling : STRING;
      c_disable_tx_aspm_l0s : STRING;
      c_pcie_dbg_ports : STRING;
      pci_exp_ref_freq : STRING;
      c_xlnx_ref_board : STRING;
      c_pcie_blk_locn : STRING;
      c_ur_atomic : STRING;
      c_dev_cap2_atomicop32_completer_supported : STRING;
      c_dev_cap2_atomicop64_completer_supported : STRING;
      c_dev_cap2_cas128_completer_supported : STRING;
      c_dev_cap2_tph_completer_supported : STRING;
      c_dev_cap2_ari_forwarding_supported : STRING;
      c_dev_cap2_atomicop_routing_supported : STRING;
      c_link_cap_aspm_optionality : STRING;
      c_aer_cap_on : STRING;
      c_aer_base_ptr : STRING;
      c_aer_cap_nextptr : STRING;
      c_aer_cap_ecrc_check_capable : STRING;
      c_aer_cap_ecrc_gen_capable : STRING;
      c_aer_cap_multiheader : STRING;
      c_aer_cap_permit_rooterr_update : STRING;
      c_rbar_cap_on : STRING;
      c_rbar_base_ptr : STRING;
      c_rbar_cap_nextptr : STRING;
      c_rbar_num : STRING;
      c_rbar_cap_sup0 : STRING;
      c_rbar_cap_index0 : STRING;
      c_rbar_cap_control_encodedbar0 : STRING;
      c_rbar_cap_sup1 : STRING;
      c_rbar_cap_index1 : STRING;
      c_rbar_cap_control_encodedbar1 : STRING;
      c_rbar_cap_sup2 : STRING;
      c_rbar_cap_index2 : STRING;
      c_rbar_cap_control_encodedbar2 : STRING;
      c_rbar_cap_sup3 : STRING;
      c_rbar_cap_index3 : STRING;
      c_rbar_cap_control_encodedbar3 : STRING;
      c_rbar_cap_sup4 : STRING;
      c_rbar_cap_index4 : STRING;
      c_rbar_cap_control_encodedbar4 : STRING;
      c_rbar_cap_sup5 : STRING;
      c_rbar_cap_index5 : STRING;
      c_rbar_cap_control_encodedbar5 : STRING;
      c_recrc_check : STRING;
      c_recrc_check_trim : STRING;
      c_disable_rx_poisoned_resp : STRING;
      c_trn_np_fc : STRING;
      c_ur_inv_req : STRING;
      c_ur_prs_response : STRING;
      c_silicon_rev : STRING;
      c_aer_cap_optional_err_support : STRING;
      LINK_CAP_MAX_LINK_WIDTH : INTEGER;
      C_DATA_WIDTH : INTEGER;
      PIPE_SIM : STRING;
      PCIE_EXT_CLK : STRING;
      PCIE_EXT_GT_COMMON : STRING;
      EXT_CH_GT_DRP : STRING;
      TRANSCEIVER_CTRL_STATUS_PORTS : STRING;
      SHARED_LOGIC_IN_CORE : STRING;
      ERR_REPORTING_IF : STRING;
      PL_INTERFACE : STRING;
      CFG_MGMT_IF : STRING;
      CFG_CTL_IF : STRING;
      CFG_STATUS_IF : STRING;
      RCV_MSG_IF : STRING;
      CFG_FC_IF : STRING;
      EXT_PIPE_INTERFACE : STRING;
      EXT_STARTUP_PRIMITIVE : STRING;
      KEEP_WIDTH : INTEGER;
      PCIE_ASYNC_EN : STRING
    );
    PORT (
      pci_exp_txp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pci_exp_txn : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pci_exp_rxp : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pci_exp_rxn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      int_pclk_out_slave : OUT STD_LOGIC;
      int_pipe_rxusrclk_out : OUT STD_LOGIC;
      int_rxoutclk_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      int_dclk_out : OUT STD_LOGIC;
      int_mmcm_lock_out : OUT STD_LOGIC;
      int_userclk1_out : OUT STD_LOGIC;
      int_userclk2_out : OUT STD_LOGIC;
      int_oobclk_out : OUT STD_LOGIC;
      int_qplllock_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      int_qplloutclk_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      int_qplloutrefclk_out : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      int_pclk_sel_slave : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_pclk_in : IN STD_LOGIC;
      pipe_rxusrclk_in : IN STD_LOGIC;
      pipe_rxoutclk_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_dclk_in : IN STD_LOGIC;
      pipe_userclk1_in : IN STD_LOGIC;
      pipe_userclk2_in : IN STD_LOGIC;
      pipe_oobclk_in : IN STD_LOGIC;
      pipe_mmcm_lock_in : IN STD_LOGIC;
      pipe_txoutclk_out : OUT STD_LOGIC;
      pipe_rxoutclk_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_pclk_sel_out : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_gen3_out : OUT STD_LOGIC;
      user_clk_out : OUT STD_LOGIC;
      user_reset_out : OUT STD_LOGIC;
      user_lnk_up : OUT STD_LOGIC;
      user_app_rdy : OUT STD_LOGIC;
      tx_buf_av : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      tx_cfg_req : OUT STD_LOGIC;
      tx_err_drop : OUT STD_LOGIC;
      s_axis_tx_tready : OUT STD_LOGIC;
      s_axis_tx_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      s_axis_tx_tkeep : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      s_axis_tx_tlast : IN STD_LOGIC;
      s_axis_tx_tvalid : IN STD_LOGIC;
      s_axis_tx_tuser : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      tx_cfg_gnt : IN STD_LOGIC;
      m_axis_rx_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axis_rx_tkeep : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axis_rx_tlast : OUT STD_LOGIC;
      m_axis_rx_tvalid : OUT STD_LOGIC;
      m_axis_rx_tready : IN STD_LOGIC;
      m_axis_rx_tuser : OUT STD_LOGIC_VECTOR(21 DOWNTO 0);
      rx_np_ok : IN STD_LOGIC;
      rx_np_req : IN STD_LOGIC;
      fc_cpld : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      fc_cplh : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fc_npd : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      fc_nph : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fc_pd : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      fc_ph : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      fc_sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      cfg_mgmt_do : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      cfg_mgmt_rd_wr_done : OUT STD_LOGIC;
      cfg_status : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      cfg_command : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      cfg_dstatus : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      cfg_dcommand : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      cfg_lstatus : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      cfg_lcommand : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      cfg_dcommand2 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      cfg_pcie_link_state : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      cfg_pmcsr_pme_en : OUT STD_LOGIC;
      cfg_pmcsr_powerstate : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      cfg_pmcsr_pme_status : OUT STD_LOGIC;
      cfg_received_func_lvl_rst : OUT STD_LOGIC;
      cfg_mgmt_di : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      cfg_mgmt_byte_en : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      cfg_mgmt_dwaddr : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      cfg_mgmt_wr_en : IN STD_LOGIC;
      cfg_mgmt_rd_en : IN STD_LOGIC;
      cfg_mgmt_wr_readonly : IN STD_LOGIC;
      cfg_err_ecrc : IN STD_LOGIC;
      cfg_err_ur : IN STD_LOGIC;
      cfg_err_cpl_timeout : IN STD_LOGIC;
      cfg_err_cpl_unexpect : IN STD_LOGIC;
      cfg_err_cpl_abort : IN STD_LOGIC;
      cfg_err_posted : IN STD_LOGIC;
      cfg_err_cor : IN STD_LOGIC;
      cfg_err_atomic_egress_blocked : IN STD_LOGIC;
      cfg_err_internal_cor : IN STD_LOGIC;
      cfg_err_malformed : IN STD_LOGIC;
      cfg_err_mc_blocked : IN STD_LOGIC;
      cfg_err_poisoned : IN STD_LOGIC;
      cfg_err_norecovery : IN STD_LOGIC;
      cfg_err_tlp_cpl_header : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
      cfg_err_cpl_rdy : OUT STD_LOGIC;
      cfg_err_locked : IN STD_LOGIC;
      cfg_err_acs : IN STD_LOGIC;
      cfg_err_internal_uncor : IN STD_LOGIC;
      cfg_trn_pending : IN STD_LOGIC;
      cfg_pm_halt_aspm_l0s : IN STD_LOGIC;
      cfg_pm_halt_aspm_l1 : IN STD_LOGIC;
      cfg_pm_force_state_en : IN STD_LOGIC;
      cfg_pm_force_state : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      cfg_dsn : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      cfg_interrupt : IN STD_LOGIC;
      cfg_interrupt_rdy : OUT STD_LOGIC;
      cfg_interrupt_assert : IN STD_LOGIC;
      cfg_interrupt_di : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      cfg_interrupt_do : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      cfg_interrupt_mmenable : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      cfg_interrupt_msienable : OUT STD_LOGIC;
      cfg_interrupt_msixenable : OUT STD_LOGIC;
      cfg_interrupt_msixfm : OUT STD_LOGIC;
      cfg_interrupt_stat : IN STD_LOGIC;
      cfg_pciecap_interrupt_msgnum : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      cfg_to_turnoff : OUT STD_LOGIC;
      cfg_turnoff_ok : IN STD_LOGIC;
      cfg_bus_number : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      cfg_device_number : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      cfg_function_number : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      cfg_pm_wake : IN STD_LOGIC;
      cfg_pm_send_pme_to : IN STD_LOGIC;
      cfg_ds_bus_number : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      cfg_ds_device_number : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      cfg_ds_function_number : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      cfg_mgmt_wr_rw1c_as_rw : IN STD_LOGIC;
      cfg_msg_received : OUT STD_LOGIC;
      cfg_msg_data : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      cfg_bridge_serr_en : OUT STD_LOGIC;
      cfg_slot_control_electromech_il_ctl_pulse : OUT STD_LOGIC;
      cfg_root_control_syserr_corr_err_en : OUT STD_LOGIC;
      cfg_root_control_syserr_non_fatal_err_en : OUT STD_LOGIC;
      cfg_root_control_syserr_fatal_err_en : OUT STD_LOGIC;
      cfg_root_control_pme_int_en : OUT STD_LOGIC;
      cfg_aer_rooterr_corr_err_reporting_en : OUT STD_LOGIC;
      cfg_aer_rooterr_non_fatal_err_reporting_en : OUT STD_LOGIC;
      cfg_aer_rooterr_fatal_err_reporting_en : OUT STD_LOGIC;
      cfg_aer_rooterr_corr_err_received : OUT STD_LOGIC;
      cfg_aer_rooterr_non_fatal_err_received : OUT STD_LOGIC;
      cfg_aer_rooterr_fatal_err_received : OUT STD_LOGIC;
      cfg_msg_received_err_cor : OUT STD_LOGIC;
      cfg_msg_received_err_non_fatal : OUT STD_LOGIC;
      cfg_msg_received_err_fatal : OUT STD_LOGIC;
      cfg_msg_received_pm_as_nak : OUT STD_LOGIC;
      cfg_msg_received_pm_pme : OUT STD_LOGIC;
      cfg_msg_received_pme_to_ack : OUT STD_LOGIC;
      cfg_msg_received_assert_int_a : OUT STD_LOGIC;
      cfg_msg_received_assert_int_b : OUT STD_LOGIC;
      cfg_msg_received_assert_int_c : OUT STD_LOGIC;
      cfg_msg_received_assert_int_d : OUT STD_LOGIC;
      cfg_msg_received_deassert_int_a : OUT STD_LOGIC;
      cfg_msg_received_deassert_int_b : OUT STD_LOGIC;
      cfg_msg_received_deassert_int_c : OUT STD_LOGIC;
      cfg_msg_received_deassert_int_d : OUT STD_LOGIC;
      cfg_msg_received_setslotpowerlimit : OUT STD_LOGIC;
      pl_directed_link_change : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      pl_directed_link_width : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      pl_directed_link_speed : IN STD_LOGIC;
      pl_directed_link_auton : IN STD_LOGIC;
      pl_upstream_prefer_deemph : IN STD_LOGIC;
      pl_sel_lnk_rate : OUT STD_LOGIC;
      pl_sel_lnk_width : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      pl_ltssm_state : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
      pl_lane_reversal_mode : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      pl_phy_lnk_up : OUT STD_LOGIC;
      pl_tx_pm_state : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      pl_rx_pm_state : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      pl_link_upcfg_cap : OUT STD_LOGIC;
      pl_link_gen2_cap : OUT STD_LOGIC;
      pl_link_partner_gen2_supported : OUT STD_LOGIC;
      pl_initial_link_width : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      pl_directed_change_done : OUT STD_LOGIC;
      pl_received_hot_rst : OUT STD_LOGIC;
      pl_transmit_hot_rst : IN STD_LOGIC;
      pl_downstream_deemph_source : IN STD_LOGIC;
      cfg_err_aer_headerlog : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      cfg_aer_interrupt_msgnum : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      cfg_err_aer_headerlog_set : OUT STD_LOGIC;
      cfg_aer_ecrc_check_en : OUT STD_LOGIC;
      cfg_aer_ecrc_gen_en : OUT STD_LOGIC;
      cfg_vc_tcvc_map : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      sys_clk : IN STD_LOGIC;
      sys_rst_n : IN STD_LOGIC;
      pipe_mmcm_rst_n : IN STD_LOGIC;
      startup_eos_in : IN STD_LOGIC;
      startup_cfgclk : OUT STD_LOGIC;
      startup_cfgmclk : OUT STD_LOGIC;
      startup_eos : OUT STD_LOGIC;
      startup_preq : OUT STD_LOGIC;
      startup_clk : IN STD_LOGIC;
      startup_gsr : IN STD_LOGIC;
      startup_gts : IN STD_LOGIC;
      startup_keyclearb : IN STD_LOGIC;
      startup_pack : IN STD_LOGIC;
      startup_usrcclko : IN STD_LOGIC;
      startup_usrcclkts : IN STD_LOGIC;
      startup_usrdoneo : IN STD_LOGIC;
      startup_usrdonets : IN STD_LOGIC;
      icap_clk : IN STD_LOGIC;
      icap_csib : IN STD_LOGIC;
      icap_rdwrb : IN STD_LOGIC;
      icap_i : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      icap_o : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      qpll_drp_crscode : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      qpll_drp_fsm : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      qpll_drp_done : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      qpll_drp_reset : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      qpll_qplllock : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      qpll_qplloutclk : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      qpll_qplloutrefclk : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      qpll_qplld : OUT STD_LOGIC;
      qpll_qpllreset : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      qpll_drp_clk : OUT STD_LOGIC;
      qpll_drp_rst_n : OUT STD_LOGIC;
      qpll_drp_ovrd : OUT STD_LOGIC;
      qpll_drp_gen3 : OUT STD_LOGIC;
      qpll_drp_start : OUT STD_LOGIC;
      pipe_txprbssel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      pipe_rxprbssel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      pipe_txprbsforceerr : IN STD_LOGIC;
      pipe_rxprbscntreset : IN STD_LOGIC;
      pipe_loopback : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
      pipe_rxprbserr : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_txinhibit : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_rst_fsm : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
      pipe_qrst_fsm : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      pipe_rate_fsm : OUT STD_LOGIC_VECTOR(19 DOWNTO 0);
      pipe_sync_fsm_tx : OUT STD_LOGIC_VECTOR(23 DOWNTO 0);
      pipe_sync_fsm_rx : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
      pipe_drp_fsm : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
      pipe_rst_idle : OUT STD_LOGIC;
      pipe_qrst_idle : OUT STD_LOGIC;
      pipe_rate_idle : OUT STD_LOGIC;
      pipe_eyescandataerror : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_rxstatus : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      pipe_dmonitorout : OUT STD_LOGIC_VECTOR(59 DOWNTO 0);
      pipe_cpll_lock : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_qpll_lock : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      pipe_rxpmaresetdone : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_rxbufstatus : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      pipe_txphaligndone : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_txphinitdone : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_txdlysresetdone : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_rxphaligndone : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_rxdlysresetdone : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_rxsyncdone : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_rxdisperr : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      pipe_rxnotintable : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      pipe_rxcommadet : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      gt_ch_drp_rdy : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_debug_0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_debug_1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_debug_2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_debug_3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_debug_4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_debug_5 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_debug_6 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_debug_7 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_debug_8 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_debug_9 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_debug : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ext_ch_gt_drpclk : OUT STD_LOGIC;
      ext_ch_gt_drpaddr : IN STD_LOGIC_VECTOR(35 DOWNTO 0);
      ext_ch_gt_drpen : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      ext_ch_gt_drpdi : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      ext_ch_gt_drpwe : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      ext_ch_gt_drpdo : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      ext_ch_gt_drprdy : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      pcie_drp_clk : IN STD_LOGIC;
      pcie_drp_en : IN STD_LOGIC;
      pcie_drp_we : IN STD_LOGIC;
      pcie_drp_addr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      pcie_drp_di : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      pcie_drp_do : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      pcie_drp_rdy : OUT STD_LOGIC;
      common_commands_in : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      pipe_rx_0_sigs : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      pipe_rx_1_sigs : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      pipe_rx_2_sigs : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      pipe_rx_3_sigs : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      pipe_rx_4_sigs : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      pipe_rx_5_sigs : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      pipe_rx_6_sigs : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      pipe_rx_7_sigs : IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      common_commands_out : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
      pipe_tx_0_sigs : OUT STD_LOGIC_VECTOR(22 DOWNTO 0);
      pipe_tx_1_sigs : OUT STD_LOGIC_VECTOR(22 DOWNTO 0);
      pipe_tx_2_sigs : OUT STD_LOGIC_VECTOR(22 DOWNTO 0);
      pipe_tx_3_sigs : OUT STD_LOGIC_VECTOR(22 DOWNTO 0);
      pipe_tx_4_sigs : OUT STD_LOGIC_VECTOR(22 DOWNTO 0);
      pipe_tx_5_sigs : OUT STD_LOGIC_VECTOR(22 DOWNTO 0);
      pipe_tx_6_sigs : OUT STD_LOGIC_VECTOR(22 DOWNTO 0);
      pipe_tx_7_sigs : OUT STD_LOGIC_VECTOR(22 DOWNTO 0)
    );
  END COMPONENT pcie_k7_gen2x4_pcie2_top;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF pci_exp_txp: SIGNAL IS "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt txp";
  ATTRIBUTE X_INTERFACE_INFO OF pci_exp_txn: SIGNAL IS "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt txn";
  ATTRIBUTE X_INTERFACE_INFO OF pci_exp_rxp: SIGNAL IS "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt rxp";
  ATTRIBUTE X_INTERFACE_INFO OF pci_exp_rxn: SIGNAL IS "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_7x_mgt rxn";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_pclk_in: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock pclk_in";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_rxusrclk_in: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock rxusrclk_in";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_rxoutclk_in: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock rxoutclk_in";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_dclk_in: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock dclk_in";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_userclk1_in: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock userclk1_in";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_userclk2_in: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock userclk2_in";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_oobclk_in: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock oobclk_in";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_mmcm_lock_in: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock mmcm_lock_in";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_txoutclk_out: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock txoutclk_out";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_rxoutclk_out: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock rxoutclk_out";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_pclk_sel_out: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock pclk_sel_out";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_gen3_out: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock gen3_out";
  ATTRIBUTE X_INTERFACE_INFO OF user_clk_out: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.user_clk_out CLK";
  ATTRIBUTE X_INTERFACE_INFO OF user_reset_out: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.user_reset_out RST";
  ATTRIBUTE X_INTERFACE_INFO OF tx_buf_av: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status tx_buf_av";
  ATTRIBUTE X_INTERFACE_INFO OF tx_cfg_req: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status tx_cfg_req";
  ATTRIBUTE X_INTERFACE_INFO OF tx_err_drop: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status tx_err_drop";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_tx_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis_tx TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_tx_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis_tx TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_tx_tkeep: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis_tx TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_tx_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis_tx TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_tx_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis_tx TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axis_tx_tuser: SIGNAL IS "xilinx.com:interface:axis:1.0 s_axis_tx TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF tx_cfg_gnt: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control tx_cfg_gnt";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_rx_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_rx TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_rx_tkeep: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_rx TKEEP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_rx_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_rx TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_rx_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_rx TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_rx_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_rx TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axis_rx_tuser: SIGNAL IS "xilinx.com:interface:axis:1.0 m_axis_rx TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF rx_np_ok: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control rx_np_ok";
  ATTRIBUTE X_INTERFACE_INFO OF rx_np_req: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control rx_np_req";
  ATTRIBUTE X_INTERFACE_INFO OF fc_cpld: SIGNAL IS "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc CPLD";
  ATTRIBUTE X_INTERFACE_INFO OF fc_cplh: SIGNAL IS "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc CPLH";
  ATTRIBUTE X_INTERFACE_INFO OF fc_npd: SIGNAL IS "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc NPD";
  ATTRIBUTE X_INTERFACE_INFO OF fc_nph: SIGNAL IS "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc NPH";
  ATTRIBUTE X_INTERFACE_INFO OF fc_pd: SIGNAL IS "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc PD";
  ATTRIBUTE X_INTERFACE_INFO OF fc_ph: SIGNAL IS "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc PH";
  ATTRIBUTE X_INTERFACE_INFO OF fc_sel: SIGNAL IS "xilinx.com:interface:pcie_cfg_fc:1.0 pcie_cfg_fc SEL";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_mgmt_do: SIGNAL IS "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt READ_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_mgmt_rd_wr_done: SIGNAL IS "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt READ_WRITE_DONE";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_status: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status status";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_command: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status command";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_dstatus: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status dstatus";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_dcommand: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status dcommand";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_lstatus: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status lstatus";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_lcommand: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status lcommand";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_dcommand2: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status dcommand2";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_pcie_link_state: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status pcie_link_state";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_pmcsr_pme_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status pmcsr_pme_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_pmcsr_powerstate: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status pmcsr_powerstate";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_pmcsr_pme_status: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status pmcsr_pme_status";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_received_func_lvl_rst: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status received_func_lvl_rst";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_mgmt_di: SIGNAL IS "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt WRITE_DATA";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_mgmt_byte_en: SIGNAL IS "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt BYTE_EN";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_mgmt_dwaddr: SIGNAL IS "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt ADDR";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_mgmt_wr_en: SIGNAL IS "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt WRITE_EN";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_mgmt_rd_en: SIGNAL IS "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt READ_EN";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_mgmt_wr_readonly: SIGNAL IS "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt READONLY";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_ecrc: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err ecrc";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_ur: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err ur";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_cpl_timeout: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err cpl_timeout";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_cpl_unexpect: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err cpl_unexpect";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_cpl_abort: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err cpl_abort";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_posted: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err posted";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_cor: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err cor";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_atomic_egress_blocked: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err atomic_egress_blocked";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_internal_cor: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err internal_cor";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_malformed: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err malformed";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_mc_blocked: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err mc_blocked";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_poisoned: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err poisoned";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_norecovery: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err norecovery";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_tlp_cpl_header: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err tlp_cpl_header";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_cpl_rdy: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err cpl_rdy";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_locked: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err locked";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_acs: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err acs";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_internal_uncor: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err internal_uncor";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_trn_pending: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control trn_pending";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_pm_halt_aspm_l0s: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_halt_aspm_l0s";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_pm_halt_aspm_l1: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_halt_aspm_l1";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_pm_force_state_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_force_state_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_pm_force_state: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_force_state";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_dsn: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control dsn";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_interrupt: SIGNAL IS "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt interrupt";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_interrupt_rdy: SIGNAL IS "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt rdy";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_interrupt_assert: SIGNAL IS "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt assert";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_interrupt_di: SIGNAL IS "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt write_data";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_interrupt_do: SIGNAL IS "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt read_data";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_interrupt_mmenable: SIGNAL IS "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt mmenable";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_interrupt_msienable: SIGNAL IS "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt msienable";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_interrupt_msixenable: SIGNAL IS "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt msixenable";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_interrupt_msixfm: SIGNAL IS "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt msixfm";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_interrupt_stat: SIGNAL IS "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt stat";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_pciecap_interrupt_msgnum: SIGNAL IS "xilinx.com:interface:pcie2_cfg_interrupt:1.0 pcie2_cfg_interrupt pciecap_interrupt_msgnum";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_to_turnoff: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status turnoff";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_turnoff_ok: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control turnoff_ok";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_bus_number: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status bus_number";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_device_number: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status device_number";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_function_number: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status function_number";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_pm_wake: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_wake";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_pm_send_pme_to: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control pm_send_pme_to";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_ds_bus_number: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control ds_bus_number";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_ds_device_number: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control ds_device_number";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_ds_function_number: SIGNAL IS "xilinx.com:interface:pcie2_cfg_control:1.0 pcie2_cfg_control ds_function_number";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_mgmt_wr_rw1c_as_rw: SIGNAL IS "xilinx.com:interface:pcie_cfg_mgmt:1.0 pcie_cfg_mgmt TYPE1_CFG_REG_ACCESS";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd received";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_data: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd data";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_bridge_serr_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status bridge_serr_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_slot_control_electromech_il_ctl_pulse: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status slot_control_electromech_il_ctl_pulse";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_root_control_syserr_corr_err_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status root_control_syserr_corr_err_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_root_control_syserr_non_fatal_err_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status root_control_syserr_non_fatal_err_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_root_control_syserr_fatal_err_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status root_control_syserr_fatal_err_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_root_control_pme_int_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status root_control_pme_int_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_aer_rooterr_corr_err_reporting_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_corr_err_reporting_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_aer_rooterr_non_fatal_err_reporting_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_non_fatal_err_reporting_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_aer_rooterr_fatal_err_reporting_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_fatal_err_reporting_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_aer_rooterr_corr_err_received: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_corr_err_received";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_aer_rooterr_non_fatal_err_received: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_non_fatal_err_received";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_aer_rooterr_fatal_err_received: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status aer_rooterr_fatal_err_received";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_err_cor: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd err_cor";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_err_non_fatal: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd err_non_fatal";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_err_fatal: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd err_fatal";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_pm_as_nak: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd received_pm_as_nak";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_pm_pme: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd pm_pme";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_pme_to_ack: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd pme_to_ack";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_assert_int_a: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd assert_int_a";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_assert_int_b: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd assert_int_b";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_assert_int_c: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd assert_int_c";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_assert_int_d: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd assert_int_d";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_deassert_int_a: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd deassert_int_a";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_deassert_int_b: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd deassert_int_b";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_deassert_int_c: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd deassert_int_c";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_deassert_int_d: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd deassert_int_d";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_msg_received_setslotpowerlimit: SIGNAL IS "xilinx.com:interface:pcie2_cfg_msg_rcvd:1.0 pcie2_cfg_msg_rcvd received_setslotpowerlimit";
  ATTRIBUTE X_INTERFACE_INFO OF pl_directed_link_change: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl directed_link_change";
  ATTRIBUTE X_INTERFACE_INFO OF pl_directed_link_width: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl directed_link_width";
  ATTRIBUTE X_INTERFACE_INFO OF pl_directed_link_speed: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl directed_link_speed";
  ATTRIBUTE X_INTERFACE_INFO OF pl_directed_link_auton: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl directed_link_auton";
  ATTRIBUTE X_INTERFACE_INFO OF pl_upstream_prefer_deemph: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl upstream_prefer_deemph";
  ATTRIBUTE X_INTERFACE_INFO OF pl_sel_lnk_rate: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl sel_lnk_rate";
  ATTRIBUTE X_INTERFACE_INFO OF pl_sel_lnk_width: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl sel_lnk_width";
  ATTRIBUTE X_INTERFACE_INFO OF pl_ltssm_state: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl ltssm_state";
  ATTRIBUTE X_INTERFACE_INFO OF pl_lane_reversal_mode: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl lane_reversal_mode";
  ATTRIBUTE X_INTERFACE_INFO OF pl_phy_lnk_up: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl phy_lnk_up";
  ATTRIBUTE X_INTERFACE_INFO OF pl_tx_pm_state: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl tx_pm_state";
  ATTRIBUTE X_INTERFACE_INFO OF pl_rx_pm_state: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl rx_pm_state";
  ATTRIBUTE X_INTERFACE_INFO OF pl_link_upcfg_cap: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl link_upcfg_cap";
  ATTRIBUTE X_INTERFACE_INFO OF pl_link_gen2_cap: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl link_gen2_cap";
  ATTRIBUTE X_INTERFACE_INFO OF pl_link_partner_gen2_supported: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl link_partner_gen2_supported";
  ATTRIBUTE X_INTERFACE_INFO OF pl_initial_link_width: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl initial_link_width";
  ATTRIBUTE X_INTERFACE_INFO OF pl_directed_change_done: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl directed_change_done";
  ATTRIBUTE X_INTERFACE_INFO OF pl_received_hot_rst: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl received_hot_rst";
  ATTRIBUTE X_INTERFACE_INFO OF pl_transmit_hot_rst: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl transmit_hot_rst";
  ATTRIBUTE X_INTERFACE_INFO OF pl_downstream_deemph_source: SIGNAL IS "xilinx.com:interface:pcie2_pl:1.0 pcie2_pl downstream_deemph_source";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_aer_headerlog: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err err_aer_headerlog";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_aer_interrupt_msgnum: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err aer_interrupt_msgnum";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_err_aer_headerlog_set: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err err_aer_headerlog_set";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_aer_ecrc_check_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err aer_ecrc_check_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_aer_ecrc_gen_en: SIGNAL IS "xilinx.com:interface:pcie2_cfg_err:1.0 pcie2_cfg_err aer_ecrc_gen_en";
  ATTRIBUTE X_INTERFACE_INFO OF cfg_vc_tcvc_map: SIGNAL IS "xilinx.com:interface:pcie2_cfg_status:1.0 pcie2_cfg_status vc_tcvc_map";
  ATTRIBUTE X_INTERFACE_INFO OF sys_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.sys_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF sys_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.sys_rst_n RST";
  ATTRIBUTE X_INTERFACE_INFO OF pipe_mmcm_rst_n: SIGNAL IS "xilinx.com:interface:pipe_clock:1.0 pipe_clock mmcm_rst_n";
  ATTRIBUTE X_INTERFACE_INFO OF pcie_drp_en: SIGNAL IS "xilinx.com:interface:drp:1.0 drp DEN";
  ATTRIBUTE X_INTERFACE_INFO OF pcie_drp_we: SIGNAL IS "xilinx.com:interface:drp:1.0 drp DWE";
  ATTRIBUTE X_INTERFACE_INFO OF pcie_drp_addr: SIGNAL IS "xilinx.com:interface:drp:1.0 drp DADDR";
  ATTRIBUTE X_INTERFACE_INFO OF pcie_drp_di: SIGNAL IS "xilinx.com:interface:drp:1.0 drp DI";
  ATTRIBUTE X_INTERFACE_INFO OF pcie_drp_do: SIGNAL IS "xilinx.com:interface:drp:1.0 drp DO";
  ATTRIBUTE X_INTERFACE_INFO OF pcie_drp_rdy: SIGNAL IS "xilinx.com:interface:drp:1.0 drp DRDY";
BEGIN
  U0 : pcie_k7_gen2x4_pcie2_top
    GENERIC MAP (
      c_component_name => "pcie_k7_gen2x4",
      dev_port_type => "0000",
      c_dev_port_type => "0",
      c_header_type => "00",
      c_upstream_facing => "TRUE",
      max_lnk_wdt => "000100",
      max_lnk_spd => "2",
      c_gen1 => true,
      pci_exp_int_freq => 3,
      c_pcie_fast_config => 0,
      bar_0 => "FFFFFC00",
      bar_1 => "00000000",
      bar_2 => "00000000",
      bar_3 => "00000000",
      bar_4 => "00000000",
      bar_5 => "00000000",
      xrom_bar => "00000000",
      cost_table => 1,
      ven_id => "10EE",
      dev_id => "7024",
      rev_id => "00",
      subsys_ven_id => "10EE",
      subsys_id => "0007",
      class_code => "058000",
      cardbus_cis_ptr => "00000000",
      cap_ver => "2",
      c_pcie_cap_slot_implemented => "FALSE",
      mps => "011",
      cmps => "3",
      ext_tag_fld_sup => "FALSE",
      c_dev_control_ext_tag_default => "FALSE",
      phantm_func_sup => "00",
      c_phantom_functions => "0",
      ep_l0s_accpt_lat => "000",
      c_ep_l0s_accpt_lat => "0",
      ep_l1_accpt_lat => "111",
      c_ep_l1_accpt_lat => "7",
      c_cpl_timeout_disable_sup => "FALSE",
      c_cpl_timeout_range => "0010",
      c_cpl_timeout_ranges_sup => "2",
      c_buf_opt_bma => "TRUE",
      c_perf_level_high => "TRUE",
      c_tx_last_tlp => "30",
      c_rx_ram_limit => "FFF",
      c_fc_ph => "32",
      c_fc_pd => "949",
      c_fc_nph => "12",
      c_fc_npd => "24",
      c_fc_cplh => "36",
      c_fc_cpld => "973",
      c_cpl_inf => "TRUE",
      c_cpl_infinite => "TRUE",
      c_dll_lnk_actv_cap => "FALSE",
      c_trgt_lnk_spd => "2",
      c_hw_auton_spd_disable => "FALSE",
      c_de_emph => "FALSE",
      slot_clk => "TRUE",
      c_rcb => "0",
      c_root_cap_crs => "FALSE",
      c_slot_cap_attn_butn => "FALSE",
      c_slot_cap_attn_ind => "FALSE",
      c_slot_cap_pwr_ctrl => "FALSE",
      c_slot_cap_pwr_ind => "FALSE",
      c_slot_cap_hotplug_surprise => "FALSE",
      c_slot_cap_hotplug_cap => "FALSE",
      c_slot_cap_mrl => "FALSE",
      c_slot_cap_elec_interlock => "FALSE",
      c_slot_cap_no_cmd_comp_sup => "FALSE",
      c_slot_cap_pwr_limit_value => "0",
      c_slot_cap_pwr_limit_scale => "0",
      c_slot_cap_physical_slot_num => "0",
      intx => "TRUE",
      int_pin => "1",
      c_msi_cap_on => "TRUE",
      c_pm_cap_next_ptr => "48",
      c_msi_64b_addr => "TRUE",
      c_msi => "0",
      c_msi_mult_msg_extn => "0",
      c_msi_per_vctr_mask_cap => "FALSE",
      c_msix_cap_on => "FALSE",
      c_msix_next_ptr => "00",
      c_pcie_cap_next_ptr => "00",
      c_msix_table_size => "000",
      c_msix_table_offset => "0",
      c_msix_table_bir => "0",
      c_msix_pba_offset => "0",
      c_msix_pba_bir => "0",
      dsi => "0",
      c_dsi_bool => "FALSE",
      d1_sup => "0",
      c_d1_support => "FALSE",
      d2_sup => "0",
      c_d2_support => "FALSE",
      pme_sup => "0F",
      c_pme_support => "0F",
      no_soft_rst => "TRUE",
      pwr_con_d0_state => "00",
      con_scl_fctr_d0_state => "0",
      pwr_con_d1_state => "00",
      con_scl_fctr_d1_state => "0",
      pwr_con_d2_state => "00",
      con_scl_fctr_d2_state => "0",
      pwr_con_d3_state => "00",
      con_scl_fctr_d3_state => "0",
      pwr_dis_d0_state => "00",
      dis_scl_fctr_d0_state => "0",
      pwr_dis_d1_state => "00",
      dis_scl_fctr_d1_state => "0",
      pwr_dis_d2_state => "00",
      dis_scl_fctr_d2_state => "0",
      pwr_dis_d3_state => "00",
      dis_scl_fctr_d3_state => "0",
      c_dsn_cap_enabled => "TRUE",
      c_dsn_base_ptr => "100",
      c_vc_cap_enabled => "FALSE",
      c_vc_base_ptr => "000",
      c_vc_cap_reject_snoop => "FALSE",
      c_vsec_cap_enabled => "FALSE",
      c_vsec_base_ptr => "000",
      c_vsec_next_ptr => "000",
      c_dsn_next_ptr => "000",
      c_vc_next_ptr => "000",
      c_pci_cfg_space_addr => "3F",
      c_ext_pci_cfg_space_addr => "3FF",
      c_last_cfg_dw => "10C",
      c_enable_msg_route => "00000000000",
      bram_lat => "0",
      c_rx_raddr_lat => "0",
      c_rx_rdata_lat => "2",
      c_rx_write_lat => "0",
      c_tx_raddr_lat => "0",
      c_tx_rdata_lat => "2",
      c_tx_write_lat => "0",
      c_ll_ack_timeout_enable => "FALSE",
      c_ll_ack_timeout_function => "0",
      c_ll_ack_timeout => "0000",
      c_ll_replay_timeout_enable => "FALSE",
      c_ll_replay_timeout_func => "1",
      c_ll_replay_timeout => "0000",
      c_dis_lane_reverse => "TRUE",
      c_upconfig_capable => "TRUE",
      c_disable_scrambling => "FALSE",
      c_disable_tx_aspm_l0s => "FALSE",
      c_pcie_dbg_ports => "TRUE",
      pci_exp_ref_freq => "0",
      c_xlnx_ref_board => "NONE",
      c_pcie_blk_locn => "0",
      c_ur_atomic => "FALSE",
      c_dev_cap2_atomicop32_completer_supported => "FALSE",
      c_dev_cap2_atomicop64_completer_supported => "FALSE",
      c_dev_cap2_cas128_completer_supported => "FALSE",
      c_dev_cap2_tph_completer_supported => "00",
      c_dev_cap2_ari_forwarding_supported => "FALSE",
      c_dev_cap2_atomicop_routing_supported => "FALSE",
      c_link_cap_aspm_optionality => "FALSE",
      c_aer_cap_on => "FALSE",
      c_aer_base_ptr => "000",
      c_aer_cap_nextptr => "000",
      c_aer_cap_ecrc_check_capable => "FALSE",
      c_aer_cap_ecrc_gen_capable => "FALSE",
      c_aer_cap_multiheader => "FALSE",
      c_aer_cap_permit_rooterr_update => "FALSE",
      c_rbar_cap_on => "FALSE",
      c_rbar_base_ptr => "000",
      c_rbar_cap_nextptr => "000",
      c_rbar_num => "0",
      c_rbar_cap_sup0 => "00001",
      c_rbar_cap_index0 => "0",
      c_rbar_cap_control_encodedbar0 => "00",
      c_rbar_cap_sup1 => "00001",
      c_rbar_cap_index1 => "0",
      c_rbar_cap_control_encodedbar1 => "00",
      c_rbar_cap_sup2 => "00001",
      c_rbar_cap_index2 => "0",
      c_rbar_cap_control_encodedbar2 => "00",
      c_rbar_cap_sup3 => "00001",
      c_rbar_cap_index3 => "0",
      c_rbar_cap_control_encodedbar3 => "00",
      c_rbar_cap_sup4 => "00001",
      c_rbar_cap_index4 => "0",
      c_rbar_cap_control_encodedbar4 => "00",
      c_rbar_cap_sup5 => "00001",
      c_rbar_cap_index5 => "0",
      c_rbar_cap_control_encodedbar5 => "00",
      c_recrc_check => "0",
      c_recrc_check_trim => "FALSE",
      c_disable_rx_poisoned_resp => "FALSE",
      c_trn_np_fc => "TRUE",
      c_ur_inv_req => "TRUE",
      c_ur_prs_response => "TRUE",
      c_silicon_rev => "2",
      c_aer_cap_optional_err_support => "000000",
      LINK_CAP_MAX_LINK_WIDTH => 4,
      C_DATA_WIDTH => 64,
      PIPE_SIM => "FALSE",
      PCIE_EXT_CLK => "TRUE",
      PCIE_EXT_GT_COMMON => "FALSE",
      EXT_CH_GT_DRP => "FALSE",
      TRANSCEIVER_CTRL_STATUS_PORTS => "FALSE",
      SHARED_LOGIC_IN_CORE => "FALSE",
      ERR_REPORTING_IF => "TRUE",
      PL_INTERFACE => "TRUE",
      CFG_MGMT_IF => "TRUE",
      CFG_CTL_IF => "TRUE",
      CFG_STATUS_IF => "TRUE",
      RCV_MSG_IF => "TRUE",
      CFG_FC_IF => "TRUE",
      EXT_PIPE_INTERFACE => "FALSE",
      EXT_STARTUP_PRIMITIVE => "FALSE",
      KEEP_WIDTH => 8,
      PCIE_ASYNC_EN => "FALSE"
    )
    PORT MAP (
      pci_exp_txp => pci_exp_txp,
      pci_exp_txn => pci_exp_txn,
      pci_exp_rxp => pci_exp_rxp,
      pci_exp_rxn => pci_exp_rxn,
      int_pclk_sel_slave => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      pipe_pclk_in => pipe_pclk_in,
      pipe_rxusrclk_in => pipe_rxusrclk_in,
      pipe_rxoutclk_in => pipe_rxoutclk_in,
      pipe_dclk_in => pipe_dclk_in,
      pipe_userclk1_in => pipe_userclk1_in,
      pipe_userclk2_in => pipe_userclk2_in,
      pipe_oobclk_in => pipe_oobclk_in,
      pipe_mmcm_lock_in => pipe_mmcm_lock_in,
      pipe_txoutclk_out => pipe_txoutclk_out,
      pipe_rxoutclk_out => pipe_rxoutclk_out,
      pipe_pclk_sel_out => pipe_pclk_sel_out,
      pipe_gen3_out => pipe_gen3_out,
      user_clk_out => user_clk_out,
      user_reset_out => user_reset_out,
      user_lnk_up => user_lnk_up,
      user_app_rdy => user_app_rdy,
      tx_buf_av => tx_buf_av,
      tx_cfg_req => tx_cfg_req,
      tx_err_drop => tx_err_drop,
      s_axis_tx_tready => s_axis_tx_tready,
      s_axis_tx_tdata => s_axis_tx_tdata,
      s_axis_tx_tkeep => s_axis_tx_tkeep,
      s_axis_tx_tlast => s_axis_tx_tlast,
      s_axis_tx_tvalid => s_axis_tx_tvalid,
      s_axis_tx_tuser => s_axis_tx_tuser,
      tx_cfg_gnt => tx_cfg_gnt,
      m_axis_rx_tdata => m_axis_rx_tdata,
      m_axis_rx_tkeep => m_axis_rx_tkeep,
      m_axis_rx_tlast => m_axis_rx_tlast,
      m_axis_rx_tvalid => m_axis_rx_tvalid,
      m_axis_rx_tready => m_axis_rx_tready,
      m_axis_rx_tuser => m_axis_rx_tuser,
      rx_np_ok => rx_np_ok,
      rx_np_req => rx_np_req,
      fc_cpld => fc_cpld,
      fc_cplh => fc_cplh,
      fc_npd => fc_npd,
      fc_nph => fc_nph,
      fc_pd => fc_pd,
      fc_ph => fc_ph,
      fc_sel => fc_sel,
      cfg_mgmt_do => cfg_mgmt_do,
      cfg_mgmt_rd_wr_done => cfg_mgmt_rd_wr_done,
      cfg_status => cfg_status,
      cfg_command => cfg_command,
      cfg_dstatus => cfg_dstatus,
      cfg_dcommand => cfg_dcommand,
      cfg_lstatus => cfg_lstatus,
      cfg_lcommand => cfg_lcommand,
      cfg_dcommand2 => cfg_dcommand2,
      cfg_pcie_link_state => cfg_pcie_link_state,
      cfg_pmcsr_pme_en => cfg_pmcsr_pme_en,
      cfg_pmcsr_powerstate => cfg_pmcsr_powerstate,
      cfg_pmcsr_pme_status => cfg_pmcsr_pme_status,
      cfg_received_func_lvl_rst => cfg_received_func_lvl_rst,
      cfg_mgmt_di => cfg_mgmt_di,
      cfg_mgmt_byte_en => cfg_mgmt_byte_en,
      cfg_mgmt_dwaddr => cfg_mgmt_dwaddr,
      cfg_mgmt_wr_en => cfg_mgmt_wr_en,
      cfg_mgmt_rd_en => cfg_mgmt_rd_en,
      cfg_mgmt_wr_readonly => cfg_mgmt_wr_readonly,
      cfg_err_ecrc => cfg_err_ecrc,
      cfg_err_ur => cfg_err_ur,
      cfg_err_cpl_timeout => cfg_err_cpl_timeout,
      cfg_err_cpl_unexpect => cfg_err_cpl_unexpect,
      cfg_err_cpl_abort => cfg_err_cpl_abort,
      cfg_err_posted => cfg_err_posted,
      cfg_err_cor => cfg_err_cor,
      cfg_err_atomic_egress_blocked => cfg_err_atomic_egress_blocked,
      cfg_err_internal_cor => cfg_err_internal_cor,
      cfg_err_malformed => cfg_err_malformed,
      cfg_err_mc_blocked => cfg_err_mc_blocked,
      cfg_err_poisoned => cfg_err_poisoned,
      cfg_err_norecovery => cfg_err_norecovery,
      cfg_err_tlp_cpl_header => cfg_err_tlp_cpl_header,
      cfg_err_cpl_rdy => cfg_err_cpl_rdy,
      cfg_err_locked => cfg_err_locked,
      cfg_err_acs => cfg_err_acs,
      cfg_err_internal_uncor => cfg_err_internal_uncor,
      cfg_trn_pending => cfg_trn_pending,
      cfg_pm_halt_aspm_l0s => cfg_pm_halt_aspm_l0s,
      cfg_pm_halt_aspm_l1 => cfg_pm_halt_aspm_l1,
      cfg_pm_force_state_en => cfg_pm_force_state_en,
      cfg_pm_force_state => cfg_pm_force_state,
      cfg_dsn => cfg_dsn,
      cfg_interrupt => cfg_interrupt,
      cfg_interrupt_rdy => cfg_interrupt_rdy,
      cfg_interrupt_assert => cfg_interrupt_assert,
      cfg_interrupt_di => cfg_interrupt_di,
      cfg_interrupt_do => cfg_interrupt_do,
      cfg_interrupt_mmenable => cfg_interrupt_mmenable,
      cfg_interrupt_msienable => cfg_interrupt_msienable,
      cfg_interrupt_msixenable => cfg_interrupt_msixenable,
      cfg_interrupt_msixfm => cfg_interrupt_msixfm,
      cfg_interrupt_stat => cfg_interrupt_stat,
      cfg_pciecap_interrupt_msgnum => cfg_pciecap_interrupt_msgnum,
      cfg_to_turnoff => cfg_to_turnoff,
      cfg_turnoff_ok => cfg_turnoff_ok,
      cfg_bus_number => cfg_bus_number,
      cfg_device_number => cfg_device_number,
      cfg_function_number => cfg_function_number,
      cfg_pm_wake => cfg_pm_wake,
      cfg_pm_send_pme_to => cfg_pm_send_pme_to,
      cfg_ds_bus_number => cfg_ds_bus_number,
      cfg_ds_device_number => cfg_ds_device_number,
      cfg_ds_function_number => cfg_ds_function_number,
      cfg_mgmt_wr_rw1c_as_rw => cfg_mgmt_wr_rw1c_as_rw,
      cfg_msg_received => cfg_msg_received,
      cfg_msg_data => cfg_msg_data,
      cfg_bridge_serr_en => cfg_bridge_serr_en,
      cfg_slot_control_electromech_il_ctl_pulse => cfg_slot_control_electromech_il_ctl_pulse,
      cfg_root_control_syserr_corr_err_en => cfg_root_control_syserr_corr_err_en,
      cfg_root_control_syserr_non_fatal_err_en => cfg_root_control_syserr_non_fatal_err_en,
      cfg_root_control_syserr_fatal_err_en => cfg_root_control_syserr_fatal_err_en,
      cfg_root_control_pme_int_en => cfg_root_control_pme_int_en,
      cfg_aer_rooterr_corr_err_reporting_en => cfg_aer_rooterr_corr_err_reporting_en,
      cfg_aer_rooterr_non_fatal_err_reporting_en => cfg_aer_rooterr_non_fatal_err_reporting_en,
      cfg_aer_rooterr_fatal_err_reporting_en => cfg_aer_rooterr_fatal_err_reporting_en,
      cfg_aer_rooterr_corr_err_received => cfg_aer_rooterr_corr_err_received,
      cfg_aer_rooterr_non_fatal_err_received => cfg_aer_rooterr_non_fatal_err_received,
      cfg_aer_rooterr_fatal_err_received => cfg_aer_rooterr_fatal_err_received,
      cfg_msg_received_err_cor => cfg_msg_received_err_cor,
      cfg_msg_received_err_non_fatal => cfg_msg_received_err_non_fatal,
      cfg_msg_received_err_fatal => cfg_msg_received_err_fatal,
      cfg_msg_received_pm_as_nak => cfg_msg_received_pm_as_nak,
      cfg_msg_received_pm_pme => cfg_msg_received_pm_pme,
      cfg_msg_received_pme_to_ack => cfg_msg_received_pme_to_ack,
      cfg_msg_received_assert_int_a => cfg_msg_received_assert_int_a,
      cfg_msg_received_assert_int_b => cfg_msg_received_assert_int_b,
      cfg_msg_received_assert_int_c => cfg_msg_received_assert_int_c,
      cfg_msg_received_assert_int_d => cfg_msg_received_assert_int_d,
      cfg_msg_received_deassert_int_a => cfg_msg_received_deassert_int_a,
      cfg_msg_received_deassert_int_b => cfg_msg_received_deassert_int_b,
      cfg_msg_received_deassert_int_c => cfg_msg_received_deassert_int_c,
      cfg_msg_received_deassert_int_d => cfg_msg_received_deassert_int_d,
      cfg_msg_received_setslotpowerlimit => cfg_msg_received_setslotpowerlimit,
      pl_directed_link_change => pl_directed_link_change,
      pl_directed_link_width => pl_directed_link_width,
      pl_directed_link_speed => pl_directed_link_speed,
      pl_directed_link_auton => pl_directed_link_auton,
      pl_upstream_prefer_deemph => pl_upstream_prefer_deemph,
      pl_sel_lnk_rate => pl_sel_lnk_rate,
      pl_sel_lnk_width => pl_sel_lnk_width,
      pl_ltssm_state => pl_ltssm_state,
      pl_lane_reversal_mode => pl_lane_reversal_mode,
      pl_phy_lnk_up => pl_phy_lnk_up,
      pl_tx_pm_state => pl_tx_pm_state,
      pl_rx_pm_state => pl_rx_pm_state,
      pl_link_upcfg_cap => pl_link_upcfg_cap,
      pl_link_gen2_cap => pl_link_gen2_cap,
      pl_link_partner_gen2_supported => pl_link_partner_gen2_supported,
      pl_initial_link_width => pl_initial_link_width,
      pl_directed_change_done => pl_directed_change_done,
      pl_received_hot_rst => pl_received_hot_rst,
      pl_transmit_hot_rst => pl_transmit_hot_rst,
      pl_downstream_deemph_source => pl_downstream_deemph_source,
      cfg_err_aer_headerlog => cfg_err_aer_headerlog,
      cfg_aer_interrupt_msgnum => cfg_aer_interrupt_msgnum,
      cfg_err_aer_headerlog_set => cfg_err_aer_headerlog_set,
      cfg_aer_ecrc_check_en => cfg_aer_ecrc_check_en,
      cfg_aer_ecrc_gen_en => cfg_aer_ecrc_gen_en,
      cfg_vc_tcvc_map => cfg_vc_tcvc_map,
      sys_clk => sys_clk,
      sys_rst_n => sys_rst_n,
      pipe_mmcm_rst_n => pipe_mmcm_rst_n,
      startup_eos_in => '0',
      startup_clk => '0',
      startup_gsr => '0',
      startup_gts => '0',
      startup_keyclearb => '1',
      startup_pack => '0',
      startup_usrcclko => '1',
      startup_usrcclkts => '0',
      startup_usrdoneo => '0',
      startup_usrdonets => '1',
      icap_clk => '0',
      icap_csib => '0',
      icap_rdwrb => '0',
      icap_i => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      qpll_drp_crscode => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 12)),
      qpll_drp_fsm => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 18)),
      qpll_drp_done => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      qpll_drp_reset => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      qpll_qplllock => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      qpll_qplloutclk => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      qpll_qplloutrefclk => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 2)),
      pipe_txprbssel => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      pipe_rxprbssel => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      pipe_txprbsforceerr => '0',
      pipe_rxprbscntreset => '0',
      pipe_loopback => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 3)),
      pipe_txinhibit => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      ext_ch_gt_drpaddr => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 36)),
      ext_ch_gt_drpen => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      ext_ch_gt_drpdi => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 64)),
      ext_ch_gt_drpwe => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      pcie_drp_clk => pcie_drp_clk,
      pcie_drp_en => pcie_drp_en,
      pcie_drp_we => pcie_drp_we,
      pcie_drp_addr => pcie_drp_addr,
      pcie_drp_di => pcie_drp_di,
      pcie_drp_do => pcie_drp_do,
      pcie_drp_rdy => pcie_drp_rdy,
      common_commands_in => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 4)),
      pipe_rx_0_sigs => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 25)),
      pipe_rx_1_sigs => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 25)),
      pipe_rx_2_sigs => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 25)),
      pipe_rx_3_sigs => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 25)),
      pipe_rx_4_sigs => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 25)),
      pipe_rx_5_sigs => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 25)),
      pipe_rx_6_sigs => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 25)),
      pipe_rx_7_sigs => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 25))
    );
END pcie_k7_gen2x4_arch;
