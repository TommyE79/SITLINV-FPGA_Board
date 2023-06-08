`timescale 1ns/1ns
//----------------------------------------------------------------------------
// This software is Copyright © 2012 The Regents of the University of 
// California. All Rights Reserved.
//
// Permission to copy, modify, and distribute this software and its 
// documentation for educational, research and non-profit purposes, without 
// fee, and without a written agreement is hereby granted, provided that the 
// above copyright notice, this paragraph and the following three paragraphs 
// appear in all copies.
//
// Permission to make commercial use of this software may be obtained by 
// contacting:
// Technology Transfer Office
// 9500 Gilman Drive, Mail Code 0910
// University of California
// La Jolla, CA 92093-0910
// (858) 534-5815
// invent@ucsd.edu
//
// This software program and documentation are copyrighted by The Regents of 
// the University of California. The software program and documentation are 
// supplied "as is", without any accompanying services from The Regents. The 
// Regents does not warrant that the operation of the program will be 
// uninterrupted or error-free. The end-user understands that the program was 
// developed for research purposes and is advised not to rely exclusively on 
// the program for any reason.
//
// IN NO EVENT SHALL THE UNIVERSITY OF CALIFORNIA BE LIABLE TO
// ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR
// CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING
// OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
// EVEN IF THE UNIVERSITY OF CALIFORNIA HAS BEEN ADVISED OF
// THE POSSIBILITY OF SUCH DAMAGE. THE UNIVERSITY OF
// CALIFORNIA SPECIFICALLY DISCLAIMS ANY WARRANTIES,
// INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
// THE SOFTWARE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, 
// AND THE UNIVERSITY OF CALIFORNIA HAS NO OBLIGATIONS TO
// PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR
// MODIFICATIONS.
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
// Filename:			riffa_top_pcie_7x_v2_1.v
// Version:				1.00.a
// Verilog Standard:	Verilog-2001
// Description:			Top level module for RIFFA 2.0 reference design for the
//						the Xilinx 7 Series Integrated Block for PCI Express 
//						module (pcie_7x_v2_1).
// Author:				Matt Jacobsen
// History:				@mattj: Version 2.0
//-----------------------------------------------------------------------------
module riffa_top_pcie_7x_v2_1 # (
  parameter PL_FAST_TRAIN     = "FALSE", // Simulation Speedup
  parameter PCIE_EXT_CLK      = "TRUE",  // Use External Clocking Module
  parameter C_NUM_CHNL        = 4'd1,
  parameter C_DATA_WIDTH      = 64, // RX/TX interface data width
  parameter KEEP_WIDTH        = C_DATA_WIDTH / 8 // TSTRB width
) (
	output	[3:0]	pci_exp_txp,
	output	[3:0]	pci_exp_txn,
	input	[3:0]	pci_exp_rxp,
	input	[3:0]	pci_exp_rxn,

	output			link_up,

	input			sys_clk_p,
	input			sys_clk_n,
	input			sys_rst_n,

	output						chnl_reset,
	output						chnl_user_clk,
	input	[C_NUM_CHNL-1:0]	chnl_rx_clk, 
	output	[C_NUM_CHNL-1:0]	chnl_rx, 
	input	[C_NUM_CHNL-1:0]	chnl_rx_ack, 
	output	[C_NUM_CHNL-1:0]	chnl_rx_last, 
	output	[(C_NUM_CHNL*32)-1:0]	chnl_rx_len, 
	output	[(C_NUM_CHNL*31)-1:0]	chnl_rx_off, 
	output	[(C_NUM_CHNL*C_DATA_WIDTH)-1:0]	chnl_rx_data, 
	output	[C_NUM_CHNL-1:0]	chnl_rx_data_valid, 
	input	[C_NUM_CHNL-1:0]	chnl_rx_data_ren,
	
	input	[C_NUM_CHNL-1:0]	chnl_tx_clk, 
	input	[C_NUM_CHNL-1:0]	chnl_tx, 
	output	[C_NUM_CHNL-1:0]	chnl_tx_ack,
	input	[C_NUM_CHNL-1:0]	chnl_tx_last, 
	input	[(C_NUM_CHNL*32)-1:0]	chnl_tx_len, 
	input	[(C_NUM_CHNL*31)-1:0]	chnl_tx_off, 
	input	[(C_NUM_CHNL*C_DATA_WIDTH)-1:0]	chnl_tx_data, 
	input	[C_NUM_CHNL-1:0]	chnl_tx_data_valid, 
	output	[C_NUM_CHNL-1:0]	chnl_tx_data_ren
);

  localparam                                  TCQ = 1;

  reg    [25:0]                               user_clk_heartbeat = 'h0;
  wire                                        user_clk;
  wire                                        user_reset;
  wire                                        user_lnk_up;

  // Tx
  wire [5:0]                                  tx_buf_av;
  wire                                        tx_cfg_req;
  wire                                        tx_err_drop;
  wire                                        tx_cfg_gnt;
  wire                                        s_axis_tx_tready;
  wire [3:0]                                  s_axis_tx_tuser;
  wire [C_DATA_WIDTH-1:0]                     s_axis_tx_tdata;
  wire [KEEP_WIDTH-1:0]                       s_axis_tx_tkeep;
  wire                                        s_axis_tx_tlast;
  wire                                        s_axis_tx_tvalid;


  // Rx
  wire [C_DATA_WIDTH-1:0]                     m_axis_rx_tdata;
  wire [KEEP_WIDTH-1:0]                       m_axis_rx_tkeep;
  wire                                        m_axis_rx_tlast;
  wire                                        m_axis_rx_tvalid;
  wire                                        m_axis_rx_tready;
  wire  [21:0]                                m_axis_rx_tuser;
  wire                                        rx_np_ok;
  wire                                        rx_np_req;

  // Flow Control
  wire [11:0]                                 fc_cpld;
  wire [7:0]                                  fc_cplh;
  wire [11:0]                                 fc_npd;
  wire [7:0]                                  fc_nph;
  wire [11:0]                                 fc_pd;
  wire [7:0]                                  fc_ph;
  wire [2:0]                                  fc_sel;


  //-------------------------------------------------------
  // 3. Configuration (CFG) Interface
  //-------------------------------------------------------
  wire                                        cfg_err_cor;
  wire                                        cfg_err_ur;
  wire                                        cfg_err_ecrc;
  wire                                        cfg_err_cpl_timeout;
  wire                                        cfg_err_cpl_abort;
  wire                                        cfg_err_cpl_unexpect;
  wire                                        cfg_err_posted;
  wire                                        cfg_err_locked;
  wire  [47:0]                                cfg_err_tlp_cpl_header;
  wire                                        cfg_err_cpl_rdy;
  wire                                        cfg_interrupt;
  wire                                        cfg_interrupt_rdy;
  wire                                        cfg_interrupt_assert;
  wire   [7:0]                                cfg_interrupt_di;
  wire   [7:0]                                cfg_interrupt_do;
  wire   [2:0]                                cfg_interrupt_mmenable;
  wire                                        cfg_interrupt_msienable;
  wire                                        cfg_interrupt_msixenable;
  wire                                        cfg_interrupt_msixfm;
  wire                                        cfg_interrupt_stat;
  wire   [4:0]                                cfg_pciecap_interrupt_msgnum;
  wire                                        cfg_turnoff_ok;
  wire                                        cfg_to_turnoff;
  wire                                        cfg_trn_pending;
  wire                                        cfg_pm_halt_aspm_l0s;
  wire                                        cfg_pm_halt_aspm_l1;
  wire                                        cfg_pm_force_state_en;
  wire   [1:0]                                cfg_pm_force_state;
  wire                                        cfg_pm_wake;
  wire   [7:0]                                cfg_bus_number;
  wire   [4:0]                                cfg_device_number;
  wire   [2:0]                                cfg_function_number;
  wire  [15:0]                                cfg_status;
  wire  [15:0]                                cfg_command;
  wire  [15:0]                                cfg_dstatus;
  wire  [15:0]                                cfg_dcommand;
  wire  [15:0]                                cfg_lstatus;
  wire  [15:0]                                cfg_lcommand;
  wire  [15:0]                                cfg_dcommand2;
  wire   [2:0]                                cfg_pcie_link_state;
  wire  [63:0]                                cfg_dsn;
  wire [127:0]                                cfg_err_aer_headerlog;
  wire   [4:0]                                cfg_aer_interrupt_msgnum;
  wire                                        cfg_err_aer_headerlog_set;
  wire                                        cfg_aer_ecrc_check_en;
  wire                                        cfg_aer_ecrc_gen_en;

  wire  [31:0]                                cfg_mgmt_di;
  wire   [3:0]                                cfg_mgmt_byte_en;
  wire   [9:0]                                cfg_mgmt_dwaddr;
  wire                                        cfg_mgmt_wr_en;
  wire                                        cfg_mgmt_rd_en;
  wire                                        cfg_mgmt_wr_readonly;


  //-------------------------------------------------------
  // 4. Physical Layer Control and Status (PL) Interface
  //-------------------------------------------------------

  wire [2:0]                                  pl_initial_link_width;
  wire [1:0]                                  pl_lane_reversal_mode;
  wire                                        pl_link_gen2_cap;
  wire                                        pl_link_partner_gen2_supported;
  wire                                        pl_link_upcfg_cap;
  wire [5:0]                                  pl_ltssm_state;
  wire                                        pl_received_hot_rst;
  wire                                        pl_sel_lnk_rate;
  wire [1:0]                                  pl_sel_lnk_width;
  wire                                        pl_directed_link_auton;
  wire [1:0]                                  pl_directed_link_change;
  wire                                        pl_directed_link_speed;
  wire [1:0]                                  pl_directed_link_width;
  wire                                        pl_upstream_prefer_deemph;

  wire                                        sys_rst_n_c;

  // Wires used for external clocking connectivity
  wire                                        pipe_pclk_in;
  wire                                        pipe_rxusrclk_in;
  wire   [3:0]   pipe_rxoutclk_in;
  wire                                        pipe_dclk_in;
  wire                                        pipe_userclk1_in;
  wire                                        pipe_userclk2_in;
  wire                                        pipe_mmcm_lock_in;

  wire                                        pipe_txoutclk_out;
  wire [3:0]     pipe_rxoutclk_out;
  wire [3:0]     pipe_pclk_sel_out;
  wire                                        pipe_gen3_out;
  wire                                        pipe_oobclk_in;

  localparam USER_CLK_FREQ = 3; // 4;
  localparam USER_CLK2_DIV2 = "FALSE"; // "TRUE";
  localparam USERCLK2_FREQ = (USER_CLK2_DIV2 == "TRUE") ? (USER_CLK_FREQ == 4) ? 3 : (USER_CLK_FREQ == 3) ? 2 : USER_CLK_FREQ
                                                                                   : USER_CLK_FREQ;
  //-------------------------------------------------------
  IBUF   sys_reset_n_ibuf (.O(sys_rst_n_c), .I(sys_rst_n));

  IBUFDS_GTE2 refclk_ibuf (.O(sys_clk), .ODIV2(), .I(sys_clk_p), .CEB(1'b0), .IB(sys_clk_n));

  reg pipe_mmcm_rst_n = 1'b1;
  reg user_reset_q;
  reg user_lnk_up_q;
  
  assign link_up = user_lnk_up;
  assign chnl_user_clk = user_clk;

  always @(posedge user_clk) begin
    user_reset_q  <= user_reset;
    user_lnk_up_q <= user_lnk_up;
  end

  // Create a Clock Heartbeat on LED #3
  always @(posedge user_clk) begin
      user_clk_heartbeat <= #TCQ user_clk_heartbeat + 1'b1;
  end

  
  // Generate External Clock Module if External Clocking is selected
  generate
    if (PCIE_EXT_CLK == "TRUE") begin : ext_clk

      //---------- PIPE Clock Module -------------------------------------------------
pcie_k7_gen2x4_pipe_clock #
      (
          .PCIE_ASYNC_EN                  ( "FALSE" ),     // PCIe async enable
          .PCIE_TXBUF_EN                  ( "FALSE" ),     // PCIe TX buffer enable for Gen1/Gen2 only
          .PCIE_LANE                      ( 6'h4 ),     // PCIe number of lanes
          // synthesis translate_off
          .PCIE_LINK_SPEED                ( 2 ),
          // synthesis translate_on
          .PCIE_REFCLK_FREQ               ( 0 ),     // PCIe reference clock frequency
          .PCIE_USERCLK1_FREQ             ( USER_CLK_FREQ +1 ),     // PCIe user clock 1 frequency
          .PCIE_USERCLK2_FREQ             ( USERCLK2_FREQ +1 ),     // PCIe user clock 2 frequency
          .PCIE_DEBUG_MODE                ( 0 )
      )
      pipe_clock_i
      (

          //---------- Input -------------------------------------
          .CLK_CLK                        ( sys_clk ),
          .CLK_TXOUTCLK                   ( pipe_txoutclk_out ),     // Reference clock from lane 0
          .CLK_RXOUTCLK_IN                ( pipe_rxoutclk_out ),
          .CLK_RST_N                      ( pipe_mmcm_rst_n ),      // Allow system reset for error_recovery             
          .CLK_PCLK_SEL                   ( pipe_pclk_sel_out ),
          .CLK_GEN3                       ( pipe_gen3_out ),

          //---------- Output ------------------------------------
          .CLK_PCLK                       ( pipe_pclk_in ),
          .CLK_RXUSRCLK                   ( pipe_rxusrclk_in ),
          .CLK_RXOUTCLK_OUT               ( pipe_rxoutclk_in ),
          .CLK_DCLK                       ( pipe_dclk_in ),
          .CLK_OOBCLK                     ( pipe_oobclk_in ),
          .CLK_USERCLK1                   ( pipe_userclk1_in ),
          .CLK_USERCLK2                   ( pipe_userclk2_in ),
          .CLK_MMCM_LOCK                  ( pipe_mmcm_lock_in )

      );
    end else begin 
      assign pipe_pclk_in      = 1'b0;
      assign pipe_rxusrclk_in  = 1'b0;
      assign pipe_rxoutclk_in  = 8'b0;   
      assign pipe_dclk_in      = 1'b0;
      assign pipe_userclk1_in  = 1'b0;
      assign pipe_userclk2_in  = 1'b0;
      assign pipe_mmcm_lock_in = 1'b0;
      assign pipe_oobclk_in    = 1'b0;
    end
  endgenerate



pcie_k7_gen2x4 pcie_k7_gen2x4
 (

  //----------------------------------------------------------------------------------------------------------------//
  // 1. PCI Express (pci_exp) Interface                                                                             //
  //----------------------------------------------------------------------------------------------------------------//

  // Tx
  .pci_exp_txn                                ( pci_exp_txn ),
  .pci_exp_txp                                ( pci_exp_txp ),

  // Rx
  .pci_exp_rxn                                ( pci_exp_rxn ),
  .pci_exp_rxp                                ( pci_exp_rxp ),

  //----------------------------------------------------------------------------------------------------------------//
  // 2. Clocking Interface                                                                                          //
  //----------------------------------------------------------------------------------------------------------------//
  .pipe_pclk_in                              ( pipe_pclk_in ),
  .pipe_rxusrclk_in                          ( pipe_rxusrclk_in ),
  .pipe_rxoutclk_in                          ( pipe_rxoutclk_in ),
  .pipe_dclk_in                              ( pipe_dclk_in ),
  .pipe_userclk1_in                          ( pipe_userclk1_in ),
  .pipe_oobclk_in                            ( pipe_oobclk_in ),
  .pipe_userclk2_in                          ( pipe_userclk2_in ),
  .pipe_mmcm_lock_in                         ( pipe_mmcm_lock_in ),

  .pipe_txoutclk_out                         ( pipe_txoutclk_out ),
  .pipe_rxoutclk_out                         ( pipe_rxoutclk_out ),
  .pipe_pclk_sel_out                         ( pipe_pclk_sel_out ),
  .pipe_gen3_out                             ( pipe_gen3_out ),

  //----------------------------------------------------------------------------------------------------------------//
  // 3. AXI-S Interface                                                                                             //
  //----------------------------------------------------------------------------------------------------------------//

  // Common
  .user_clk_out                               ( user_clk ),
  .user_reset_out                             ( user_reset ),
  .user_lnk_up                                ( user_lnk_up ),
  // .user_app_rdy                               ( ),  

  // TX

  .tx_buf_av                                  ( tx_buf_av ),
  .tx_err_drop                                ( tx_err_drop ),
  .tx_cfg_req                                 ( tx_cfg_req ),
  .s_axis_tx_tready                           ( s_axis_tx_tready ),
  .s_axis_tx_tdata                            ( s_axis_tx_tdata ),
  .s_axis_tx_tkeep                            ( s_axis_tx_tkeep ),
  .s_axis_tx_tuser                            ( s_axis_tx_tuser ),
  .s_axis_tx_tlast                            ( s_axis_tx_tlast ),
  .s_axis_tx_tvalid                           ( s_axis_tx_tvalid ),

  .tx_cfg_gnt                                 ( tx_cfg_gnt ),

  // Rx
  .m_axis_rx_tdata                            ( m_axis_rx_tdata ),
  .m_axis_rx_tkeep                            ( m_axis_rx_tkeep ),
  .m_axis_rx_tlast                            ( m_axis_rx_tlast ),
  .m_axis_rx_tvalid                           ( m_axis_rx_tvalid ),
  .m_axis_rx_tready                           ( m_axis_rx_tready ),
  .m_axis_rx_tuser                            ( m_axis_rx_tuser ),
  .rx_np_ok                                   ( rx_np_ok ),
  .rx_np_req                                  ( rx_np_req ),

  // Flow Control
  .fc_cpld                                    ( fc_cpld ),
  .fc_cplh                                    ( fc_cplh ),
  .fc_npd                                     ( fc_npd ),
  .fc_nph                                     ( fc_nph ),
  .fc_pd                                      ( fc_pd ),
  .fc_ph                                      ( fc_ph ),
  .fc_sel                                     ( fc_sel ),


  //----------------------------------------------------------------------------------------------------------------//
  // 4. Configuration (CFG) Interface                                                                               //
  //----------------------------------------------------------------------------------------------------------------//

  //------------------------------------------------//
  // EP and RP                                      //
  //------------------------------------------------//
  .cfg_mgmt_do                                ( ),
  .cfg_mgmt_rd_wr_done                        ( ),

  .cfg_status                                 ( cfg_status ),
  .cfg_command                                ( cfg_command ),
  .cfg_dstatus                                ( cfg_dstatus ),
  .cfg_dcommand                               ( cfg_dcommand ),
  .cfg_lstatus                                ( cfg_lstatus ),
  .cfg_lcommand                               ( cfg_lcommand ),
  .cfg_dcommand2                              ( cfg_dcommand2 ),
  .cfg_pcie_link_state                        ( cfg_pcie_link_state ),

  .cfg_pmcsr_pme_en                           ( ),
  .cfg_pmcsr_powerstate                       ( ),
  .cfg_pmcsr_pme_status                       ( ),
  .cfg_received_func_lvl_rst                  ( ),

  // Management Interface
  .cfg_mgmt_di                                ( cfg_mgmt_di ),
  .cfg_mgmt_byte_en                           ( cfg_mgmt_byte_en ),
  .cfg_mgmt_dwaddr                            ( cfg_mgmt_dwaddr ),
  .cfg_mgmt_wr_en                             ( cfg_mgmt_wr_en ),
  .cfg_mgmt_rd_en                             ( cfg_mgmt_rd_en ),
  .cfg_mgmt_wr_readonly                       ( cfg_mgmt_wr_readonly ),
  

  // Error Reporting Interface
  .cfg_err_ecrc                               ( cfg_err_ecrc ),
  .cfg_err_ur                                 ( cfg_err_ur ),
  .cfg_err_cpl_timeout                        ( cfg_err_cpl_timeout ),
  .cfg_err_cpl_unexpect                       ( cfg_err_cpl_unexpect ),
  .cfg_err_cpl_abort                          ( cfg_err_cpl_abort ),
  .cfg_err_posted                             ( cfg_err_posted ),
  .cfg_err_cor                                ( cfg_err_cor ),
  .cfg_err_atomic_egress_blocked              ( cfg_err_atomic_egress_blocked ),
  .cfg_err_internal_cor                       ( cfg_err_internal_cor ),
  .cfg_err_malformed                          ( cfg_err_malformed ),
  .cfg_err_mc_blocked                         ( cfg_err_mc_blocked ),
  .cfg_err_poisoned                           ( cfg_err_poisoned ),
  .cfg_err_norecovery                         ( cfg_err_norecovery ),
  .cfg_err_tlp_cpl_header                     ( cfg_err_tlp_cpl_header ),
  .cfg_err_cpl_rdy                            ( cfg_err_cpl_rdy ),
  .cfg_err_locked                             ( cfg_err_locked ),
  .cfg_err_acs                                ( cfg_err_acs ),
  .cfg_err_internal_uncor                     ( cfg_err_internal_uncor ),

  .cfg_trn_pending                            ( cfg_trn_pending ),
  .cfg_pm_halt_aspm_l0s                       ( cfg_pm_halt_aspm_l0s ),
  .cfg_pm_halt_aspm_l1                        ( cfg_pm_halt_aspm_l1 ),
  .cfg_pm_force_state_en                      ( cfg_pm_force_state_en ),
  .cfg_pm_force_state                         ( cfg_pm_force_state ),

  .cfg_dsn                                    ( cfg_dsn ),

  //------------------------------------------------//
  // EP Only                                        //
  //------------------------------------------------//
  .cfg_interrupt                              ( cfg_interrupt ),
  .cfg_interrupt_rdy                          ( cfg_interrupt_rdy ),
  .cfg_interrupt_assert                       ( cfg_interrupt_assert ),
  .cfg_interrupt_di                           ( cfg_interrupt_di ),
  .cfg_interrupt_do                           ( cfg_interrupt_do ),
  .cfg_interrupt_mmenable                     ( cfg_interrupt_mmenable ),
  .cfg_interrupt_msienable                    ( cfg_interrupt_msienable ),
  .cfg_interrupt_msixenable                   ( cfg_interrupt_msixenable ),
  .cfg_interrupt_msixfm                       ( cfg_interrupt_msixfm ),
  .cfg_interrupt_stat                         ( cfg_interrupt_stat ),
  .cfg_pciecap_interrupt_msgnum               ( cfg_pciecap_interrupt_msgnum ),
  .cfg_to_turnoff                             ( cfg_to_turnoff ),
  .cfg_turnoff_ok                             ( cfg_turnoff_ok ),
  .cfg_bus_number                             ( cfg_bus_number ),
  .cfg_device_number                          ( cfg_device_number ),
  .cfg_function_number                        ( cfg_function_number ),
  .cfg_pm_wake                                ( cfg_pm_wake ),

  //------------------------------------------------//
  // RP Only                                        //
  //------------------------------------------------//
  .cfg_pm_send_pme_to                         ( 1'b0 ),
  .cfg_ds_bus_number                          ( 8'b0 ),
  .cfg_ds_device_number                       ( 5'b0 ),
  .cfg_ds_function_number                     ( 3'b0 ),
  .cfg_mgmt_wr_rw1c_as_rw                     ( 1'b0 ),
  .cfg_msg_received                           ( ),
  .cfg_msg_data                               ( ),

  .cfg_bridge_serr_en                         ( ),
  .cfg_slot_control_electromech_il_ctl_pulse  ( ),
  .cfg_root_control_syserr_corr_err_en        ( ),
  .cfg_root_control_syserr_non_fatal_err_en   ( ),
  .cfg_root_control_syserr_fatal_err_en       ( ),
  .cfg_root_control_pme_int_en                ( ),
  .cfg_aer_rooterr_corr_err_reporting_en      ( ),
  .cfg_aer_rooterr_non_fatal_err_reporting_en ( ),
  .cfg_aer_rooterr_fatal_err_reporting_en     ( ),
  .cfg_aer_rooterr_corr_err_received          ( ),
  .cfg_aer_rooterr_non_fatal_err_received     ( ),
  .cfg_aer_rooterr_fatal_err_received         ( ),

  .cfg_msg_received_err_cor                   ( ),
  .cfg_msg_received_err_non_fatal             ( ),
  .cfg_msg_received_err_fatal                 ( ),
  .cfg_msg_received_pm_as_nak                 ( ),
  .cfg_msg_received_pme_to_ack                ( ),
  .cfg_msg_received_assert_int_a              ( ),
  .cfg_msg_received_assert_int_b              ( ),
  .cfg_msg_received_assert_int_c              ( ),
  .cfg_msg_received_assert_int_d              ( ),
  .cfg_msg_received_deassert_int_a            ( ),
  .cfg_msg_received_deassert_int_b            ( ),
  .cfg_msg_received_deassert_int_c            ( ),
  .cfg_msg_received_deassert_int_d            ( ),

   .cfg_msg_received_pm_pme                   ( ),
   .cfg_msg_received_setslotpowerlimit        ( ),   
   
	
  //----------------------------------------------------------------------------------------------------------------//
  // 5. Physical Layer Control and Status (PL) Interface                                                            //
  //----------------------------------------------------------------------------------------------------------------//
  .pl_directed_link_change                    ( pl_directed_link_change ),
  .pl_directed_link_width                     ( pl_directed_link_width ),
  .pl_directed_link_speed                     ( pl_directed_link_speed ),
  .pl_directed_link_auton                     ( pl_directed_link_auton ),
  .pl_upstream_prefer_deemph                  ( pl_upstream_prefer_deemph ),



  .pl_sel_lnk_rate                            ( pl_sel_lnk_rate ),
  .pl_sel_lnk_width                           ( pl_sel_lnk_width ),
  .pl_ltssm_state                             ( pl_ltssm_state ),
  .pl_lane_reversal_mode                      ( pl_lane_reversal_mode ),

  .pl_phy_lnk_up                              ( ),
  .pl_tx_pm_state                             ( ),
  .pl_rx_pm_state                             ( ),

  .pl_link_upcfg_cap                          ( pl_link_upcfg_cap ),
  .pl_link_gen2_cap                           ( pl_link_gen2_cap ),
  .pl_link_partner_gen2_supported             ( pl_link_partner_gen2_supported ),
  .pl_initial_link_width                      ( pl_initial_link_width ),

  .pl_directed_change_done                    ( ),

  //------------------------------------------------//
  // EP Only                                        //
  //------------------------------------------------//
  .pl_received_hot_rst                        ( pl_received_hot_rst ),

  //------------------------------------------------//
  // RP Only                                        //
  //------------------------------------------------//
  .pl_transmit_hot_rst                        ( 1'b0 ),
  .pl_downstream_deemph_source                ( 1'b0 ),

  //----------------------------------------------------------------------------------------------------------------//
  // 6. AER Interface                                                                                               //
  //----------------------------------------------------------------------------------------------------------------//

  .cfg_err_aer_headerlog                      ( cfg_err_aer_headerlog ),
  .cfg_aer_interrupt_msgnum                   ( cfg_aer_interrupt_msgnum ),
  .cfg_err_aer_headerlog_set                  ( cfg_err_aer_headerlog_set ),
  .cfg_aer_ecrc_check_en                      ( cfg_aer_ecrc_check_en ),
  .cfg_aer_ecrc_gen_en                        ( cfg_aer_ecrc_gen_en ),

  //----------------------------------------------------------------------------------------------------------------//
  // 7. VC interface                                                                                                //
  //----------------------------------------------------------------------------------------------------------------//

  .cfg_vc_tcvc_map                            ( ),
/*
  //----------------------------------------------------------------------------------------------------------------//
  // PCIe Fast Config: Startup Interface - Can only be used in Tandem Mode                                          //
  //----------------------------------------------------------------------------------------------------------------//
    .startup_cfgclk( ),         // 1-bit output: Configuration main clock output
    .startup_cfgmclk( ),        // 1-bit output: Configuration internal oscillator clock output
    .startup_eos( ),            // 1-bit output: Active high output signal indicating the End Of Startup.
    .startup_preq( ),           // 1-bit output: PROGRAM request to fabric output
    .startup_clk(1'b0),         // 1-bit input: User start-up clock input
    .startup_gsr(1'b0),         // 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
    .startup_gts(1'b0),         // 1-bit input: Global 3-state input (GTS cannot be used for the port name)
    .startup_keyclearb(1'b1),   // 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
    .startup_pack(1'b0),        // 1-bit input: PROGRAM acknowledge input
    .startup_usrcclko(1'b0),    // 1-bit input: User CCLK input
    .startup_usrcclkts(1'b1),   // 1-bit input: User CCLK 3-state enable input
    .startup_usrdoneo(1'b0),    // 1-bit input: User DONE pin output control
    .startup_usrdonets(1'b1),   // 1-bit input: User DONE 3-state enable output
*/
  //----------------------------------------------------------------------------------------------------------------//
  // 8. PCIe DRP (PCIe DRP) Interface                                                                               //
  //----------------------------------------------------------------------------------------------------------------//
/*
  .pcie_drp_clk                               ( 1'b1 ),
  .pcie_drp_en                                ( 1'b0 ),
  .pcie_drp_we                                ( 1'b0 ),
  .pcie_drp_addr                              ( 9'h0 ),
  .pcie_drp_di                                ( 16'h0 ),
  .pcie_drp_rdy                               ( ),
  .pcie_drp_do                                ( ),
*/
  //----------------------------------------------------------------------------------------------------------------//
  // 8. System  (SYS) Interface                                                                                     //
  //----------------------------------------------------------------------------------------------------------------//

  .pipe_mmcm_rst_n                            ( pipe_mmcm_rst_n ),        // Async      | Async
  .sys_clk                                    ( sys_clk ),
  .sys_rst_n                                  ( sys_rst_n_c )

);


//----------------------------------------------------------------------------------------------------------------//
// User App                                                                                                       //
//----------------------------------------------------------------------------------------------------------------//
pcie_app_7x  #(
  .C_DATA_WIDTH( C_DATA_WIDTH ),
  .C_NUM_CHNL( C_NUM_CHNL ),
  .TCQ( TCQ )

) app (

  //----------------------------------------------------------------------------------------------------------------//
  // 1. AXI-S Interface                                                                                             //
  //----------------------------------------------------------------------------------------------------------------//

  // Common
  .user_clk                       ( user_clk ),
  .user_reset                     ( user_reset_q ),
  .user_lnk_up                    ( user_lnk_up_q ),

  // Tx
  .tx_buf_av                      ( tx_buf_av ),
  .tx_cfg_req                     ( tx_cfg_req ),
  .tx_err_drop                    ( tx_err_drop ),
  .s_axis_tx_tready               ( s_axis_tx_tready ),
  .s_axis_tx_tdata                ( s_axis_tx_tdata ),
  .s_axis_tx_tkeep                ( s_axis_tx_tkeep ),
  .s_axis_tx_tuser                ( s_axis_tx_tuser ),
  .s_axis_tx_tlast                ( s_axis_tx_tlast ),
  .s_axis_tx_tvalid               ( s_axis_tx_tvalid ),
  .tx_cfg_gnt                     ( tx_cfg_gnt ),

  // Rx
  .m_axis_rx_tdata                ( m_axis_rx_tdata ),
  .m_axis_rx_tkeep                ( m_axis_rx_tkeep ),
  .m_axis_rx_tlast                ( m_axis_rx_tlast ),
  .m_axis_rx_tvalid               ( m_axis_rx_tvalid ),
  .m_axis_rx_tready               ( m_axis_rx_tready ),
  .m_axis_rx_tuser                ( m_axis_rx_tuser ),
  .rx_np_ok                       ( rx_np_ok ),
  .rx_np_req                      ( rx_np_req ),

  // Flow Control
  .fc_cpld                        ( fc_cpld ),
  .fc_cplh                        ( fc_cplh ),
  .fc_npd                         ( fc_npd ),
  .fc_nph                         ( fc_nph ),
  .fc_pd                          ( fc_pd ),
  .fc_ph                          ( fc_ph ),
  .fc_sel                         ( fc_sel ),

  //----------------------------------------------------------------------------------------------------------------//
  // 2. Configuration (CFG) Interface                                                                               //
  //----------------------------------------------------------------------------------------------------------------//
  .cfg_err_cor                    ( cfg_err_cor ),
  .cfg_err_atomic_egress_blocked  ( cfg_err_atomic_egress_blocked ),
  .cfg_err_internal_cor           ( cfg_err_internal_cor ),
  .cfg_err_malformed              ( cfg_err_malformed ),
  .cfg_err_mc_blocked             ( cfg_err_mc_blocked ),
  .cfg_err_poisoned               ( cfg_err_poisoned ),
  .cfg_err_norecovery             ( cfg_err_norecovery ),
  .cfg_err_ur                     ( cfg_err_ur ),
  .cfg_err_ecrc                   ( cfg_err_ecrc ),
  .cfg_err_cpl_timeout            ( cfg_err_cpl_timeout ),
  .cfg_err_cpl_abort              ( cfg_err_cpl_abort ),
  .cfg_err_cpl_unexpect           ( cfg_err_cpl_unexpect ),
  .cfg_err_posted                 ( cfg_err_posted ),
  .cfg_err_locked                 ( cfg_err_locked ),
  .cfg_err_acs                    ( cfg_err_acs ), //1'b0 ),
  .cfg_err_internal_uncor         ( cfg_err_internal_uncor ), //1'b0 ),
  .cfg_err_tlp_cpl_header         ( cfg_err_tlp_cpl_header ),
  .cfg_err_cpl_rdy                ( cfg_err_cpl_rdy ),
  .cfg_interrupt                  ( cfg_interrupt ),
  .cfg_interrupt_rdy              ( cfg_interrupt_rdy ),
  .cfg_interrupt_assert           ( cfg_interrupt_assert ),
  .cfg_interrupt_di               ( cfg_interrupt_di ),
  .cfg_interrupt_do               ( cfg_interrupt_do ),
  .cfg_interrupt_mmenable         ( cfg_interrupt_mmenable ),
  .cfg_interrupt_msienable        ( cfg_interrupt_msienable ),
  .cfg_interrupt_msixenable       ( cfg_interrupt_msixenable ),
  .cfg_interrupt_msixfm           ( cfg_interrupt_msixfm ),
  .cfg_interrupt_stat             ( cfg_interrupt_stat ),
  .cfg_pciecap_interrupt_msgnum   ( cfg_pciecap_interrupt_msgnum ),
  .cfg_turnoff_ok                 ( cfg_turnoff_ok ),
  .cfg_to_turnoff                 ( cfg_to_turnoff ),

  .cfg_trn_pending                ( cfg_trn_pending ),
  .cfg_pm_halt_aspm_l0s           ( cfg_pm_halt_aspm_l0s ),
  .cfg_pm_halt_aspm_l1            ( cfg_pm_halt_aspm_l1 ),
  .cfg_pm_force_state_en          ( cfg_pm_force_state_en ),
  .cfg_pm_force_state             ( cfg_pm_force_state ),

  .cfg_pm_wake                    ( cfg_pm_wake ),
  .cfg_bus_number                 ( cfg_bus_number ),
  .cfg_device_number              ( cfg_device_number ),
  .cfg_function_number            ( cfg_function_number ),
  .cfg_status                     ( cfg_status ),
  .cfg_command                    ( cfg_command ),
  .cfg_dstatus                    ( cfg_dstatus ),
  .cfg_dcommand                   ( cfg_dcommand ),
  .cfg_lstatus                    ( cfg_lstatus ),
  .cfg_lcommand                   ( cfg_lcommand ),
  .cfg_dcommand2                  ( cfg_dcommand2 ),
  .cfg_pcie_link_state            ( cfg_pcie_link_state ),
  .cfg_dsn                        ( cfg_dsn ),

  //----------------------------------------------------------------------------------------------------------------//
  // 3. Management (MGMT) Interface                                                                                 //
  //----------------------------------------------------------------------------------------------------------------//
  .cfg_mgmt_di                    ( cfg_mgmt_di ),
  .cfg_mgmt_byte_en               ( cfg_mgmt_byte_en ),
  .cfg_mgmt_dwaddr                ( cfg_mgmt_dwaddr ),
  .cfg_mgmt_wr_en                 ( cfg_mgmt_wr_en ),
  .cfg_mgmt_rd_en                 ( cfg_mgmt_rd_en ),
  .cfg_mgmt_wr_readonly           ( cfg_mgmt_wr_readonly ),

  //----------------------------------------------------------------------------------------------------------------//
  // 3. Advanced Error Reporting (AER) Interface                                                                    //
  //----------------------------------------------------------------------------------------------------------------//
  .cfg_err_aer_headerlog          ( cfg_err_aer_headerlog ),
  .cfg_aer_interrupt_msgnum       ( cfg_aer_interrupt_msgnum ),
  .cfg_err_aer_headerlog_set      ( cfg_err_aer_headerlog_set ),
  .cfg_aer_ecrc_check_en          ( cfg_aer_ecrc_check_en ),
  .cfg_aer_ecrc_gen_en            ( cfg_aer_ecrc_gen_en ),

  //----------------------------------------------------------------------------------------------------------------//
  // 4. Physical Layer Control and Status (PL) Interface                                                            //
  //----------------------------------------------------------------------------------------------------------------//
  .pl_initial_link_width          ( pl_initial_link_width ),
  .pl_lane_reversal_mode          ( pl_lane_reversal_mode ),
  .pl_link_gen2_cap               ( pl_link_gen2_cap ),
  .pl_link_partner_gen2_supported ( pl_link_partner_gen2_supported ),
  .pl_link_upcfg_cap              ( pl_link_upcfg_cap ),
  .pl_ltssm_state                 ( pl_ltssm_state ),
  .pl_received_hot_rst            ( pl_received_hot_rst ),
  .pl_sel_lnk_rate                ( pl_sel_lnk_rate ),
  .pl_sel_lnk_width               ( pl_sel_lnk_width ),
  .pl_directed_link_auton         ( pl_directed_link_auton ),
  .pl_directed_link_change        ( pl_directed_link_change ),
  .pl_directed_link_speed         ( pl_directed_link_speed ),
  .pl_directed_link_width         ( pl_directed_link_width ),
  .pl_upstream_prefer_deemph      ( pl_upstream_prefer_deemph ),
  
	.riffa_chnl_reset(chnl_reset), 
	
	.chnl_rx_clk(chnl_rx_clk), 
	.chnl_rx(chnl_rx), 
	.chnl_rx_ack(chnl_rx_ack),
	.chnl_rx_last(chnl_rx_last), 
	.chnl_rx_len(chnl_rx_len), 
	.chnl_rx_off(chnl_rx_off), 
	.chnl_rx_data(chnl_rx_data), 
	.chnl_rx_data_valid(chnl_rx_data_valid), 
	.chnl_rx_data_ren(chnl_rx_data_ren),
	
	.chnl_tx_clk(chnl_tx_clk), 
	.chnl_tx(chnl_tx), 
	.chnl_tx_ack(chnl_tx_ack),
	.chnl_tx_last(chnl_tx_last), 
	.chnl_tx_len(chnl_tx_len), 
	.chnl_tx_off(chnl_tx_off), 
	.chnl_tx_data(chnl_tx_data), 
	.chnl_tx_data_valid(chnl_tx_data_valid), 
	.chnl_tx_data_ren(chnl_tx_data_ren)
);

endmodule
