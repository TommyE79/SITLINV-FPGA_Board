vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/clocking/mig_7series_v4_2_clk_ibuf.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/clocking/mig_7series_v4_2_infrastructure.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/clocking/mig_7series_v4_2_iodelay_ctrl.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/clocking/mig_7series_v4_2_tempmon.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_arb_mux.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_arb_row_col.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_arb_select.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_bank_cntrl.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_bank_common.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_bank_compare.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_bank_mach.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_bank_queue.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_bank_state.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_col_mach.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_mc.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_rank_cntrl.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_rank_common.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_rank_mach.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/controller/mig_7series_v4_2_round_robin_arb.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ecc/mig_7series_v4_2_ecc_buf.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ecc/mig_7series_v4_2_ecc_dec_fix.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ecc/mig_7series_v4_2_ecc_gen.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ecc/mig_7series_v4_2_ecc_merge_enc.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ecc/mig_7series_v4_2_fi_xor.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ip_top/mig_7series_v4_2_memc_ui_top_std.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ip_top/mig_7series_v4_2_mem_intfc.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_group_io.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_lane.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_calib_top.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_if_post_fifo.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy_wrapper.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_of_pre_fifo.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_4lanes.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ck_addr_cmd_delay.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal_hr.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_init.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_cntlr.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_data.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_edge.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_lim.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_mux.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_po_cntlr.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_samp.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_oclkdelay_cal.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_prbs_rdlvl.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_rdlvl.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_tempmon.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_top.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrcal.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl_off_delay.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_prbs_gen.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_ddr_skip_calib_tap.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_poc_cc.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_poc_edge_store.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_poc_meta.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_poc_pd.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_poc_tap_base.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/phy/mig_7series_v4_2_poc_top.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ui/mig_7series_v4_2_ui_cmd.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ui/mig_7series_v4_2_ui_rd_data.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ui/mig_7series_v4_2_ui_top.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ui/mig_7series_v4_2_ui_wr_data.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ddr_mig_sim.v" \
"../../../../k7325t_ddr3_1066_golden.srcs/sources_1/ip/ddr/ddr/user_design/rtl/ddr.v" \


vlog -work xil_defaultlib \
"glbl.v"

