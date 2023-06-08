`timescale 1ps/1ps

`define LED_NOT_LOGIC
//`define SINGLE_END_CLK
//`define GOLDEN_DDR_DEBUG

module k7325t_ddr3_1066_golden(

`ifdef SINGLE_END_CLK
	input					sys_clk,
`else
	input					sys_clk_p,
	input					sys_clk_n,
`endif

	input					sys_rst,
	
	inout		[63 : 0]	ddr3_dq,
	inout		[7 : 0]		ddr3_dqs_p,
	inout		[7 : 0]		ddr3_dqs_n,
	output		[13 : 0]	ddr3_addr,
	output		[2 : 0]		ddr3_ba,
	output					ddr3_ras_n,
	output					ddr3_reset_n,
	output					ddr3_cas_n,
	output					ddr3_we_n,
	output		[0 : 0]		ddr3_ck_p,
	output		[0 : 0]		ddr3_ck_n,
	output		[0 : 0]		ddr3_cke,
	output		[0 : 0]		ddr3_cs_n,
	output		[7 : 0]		ddr3_dm,
	output		[0 : 0]		ddr3_odt,
	
	output		[7 : 0]		leds
);
	
	localparam nCK_PER_CLK			= 4;
	localparam DQ_WIDTH				= 64;
	localparam ADDR_WIDTH			= 28;
	localparam DATA_WIDTH			= 64;
	localparam PAYLOAD_WIDTH		= 64;
	localparam APP_DATA_WIDTH		= 2 * nCK_PER_CLK * PAYLOAD_WIDTH;
	localparam BURST_LENGTH_2LOG	= 3;
	localparam APP_MASK_WIDTH		= APP_DATA_WIDTH / 8;
	
	
	wire	[ADDR_WIDTH-1 : 0]		app_addr;
	wire	[2 : 0]					app_cmd;
	wire							app_en;
	wire							app_rdy;
	wire	[APP_DATA_WIDTH-1:0]	app_rd_data;
	wire							app_rd_data_end;
	wire							app_rd_data_valid;
	wire	[APP_DATA_WIDTH-1:0]	app_wdf_data;
	wire							app_wdf_end;
	wire	[APP_MASK_WIDTH-1:0]	app_wdf_mask;
	wire							app_wdf_rdy;
	wire							app_sr_active;
	wire							app_ref_ack;
	wire							app_zq_ack;
	wire							app_wdf_wren;
	
	wire							clk;
	wire							rst;
	
	wire							ddr_cal_done;
	wire							ddr_rw_error;
	
	wire							ddr_ip_rst;
	
`ifdef LED_NOT_LOGIC
	assign leds[0] = ~ddr_cal_done;
	assign leds[1] = ~ddr_rw_error;
	assign leds[2] = ~ddr_ip_rst;
	assign leds[3] = ~rst;
	assign leds[4] = 1'b1;
	assign leds[5] = 1'b1;
	assign leds[6] = 1'b1;
	assign leds[7] = 1'b1;
`else
	assign leds[0] = ddr_cal_done;
	assign leds[1] = ddr_rw_error;
	assign leds[2] = ddr_ip_rst;
	assign leds[3] = rst;
	assign leds[4] = 1'b0;
	assign leds[5] = 1'b0;
	assign leds[6] = 1'b0;
	assign leds[7] = 1'b0;
`endif

`ifdef SINGLE_END_CLK
	
	wire ddr_ref_clk;
	wire ddr_ip_clk;
	wire ddr_pll_lock;
	
	ddr_pll ddr_pll_inst0(
		
		.clk_in1		(sys_clk),
		.resetn			(sys_rst),
		
		.ddr_ip_clk		(ddr_ip_clk),
		.ddr_ref_clk	(ddr_ref_clk),
		
		.locked			(ddr_pll_lock)
	);
	
	assign ddr_ip_rst = ~ddr_pll_lock;
`else
	assign ddr_ip_rst = sys_rst;
`endif
	
`ifdef SINGLE_END_CLK
	ddr_se ddr_se_inst0(
		
		.sys_clk_i					(ddr_ref_clk),
`else
	ddr ddr_inst0(
		
		.sys_clk_p					(sys_clk_p),
		.sys_clk_n					(sys_clk_n),
`endif
		
		.sys_rst					(ddr_ip_rst),
		
		.ddr3_addr					(ddr3_addr),
		.ddr3_ba					(ddr3_ba),
		.ddr3_cas_n					(ddr3_cas_n),
		.ddr3_ck_n					(ddr3_ck_n),
		.ddr3_ck_p					(ddr3_ck_p),
		.ddr3_cke					(ddr3_cke),
		.ddr3_ras_n					(ddr3_ras_n),
		.ddr3_reset_n				(ddr3_reset_n),
		.ddr3_we_n					(ddr3_we_n),
		.ddr3_dq					(ddr3_dq),
		.ddr3_dqs_n					(ddr3_dqs_n),
		.ddr3_dqs_p					(ddr3_dqs_p),
		.ddr3_cs_n					(ddr3_cs_n),
		.ddr3_dm					(ddr3_dm),
		.ddr3_odt					(ddr3_odt),
		
		.init_calib_complete		(ddr_cal_done),
		
		.ui_clk						(clk),
		.ui_clk_sync_rst			(rst),
		
		.app_addr					(app_addr),
		.app_cmd					(app_cmd),
		.app_en						(app_en),
		.app_wdf_data				(app_wdf_data),
		.app_wdf_end				(app_wdf_end),
		.app_wdf_wren				(app_wdf_wren),
		.app_rd_data				(app_rd_data),
		.app_rd_data_end			(app_rd_data_end),
		.app_rd_data_valid			(app_rd_data_valid),
		.app_rdy					(app_rdy),
		.app_wdf_rdy				(app_wdf_rdy),
		.app_sr_req					(1'b0),
		.app_ref_req				(1'b0),
		.app_zq_req					(1'b0),
		.app_sr_active				(app_sr_active),
		.app_ref_ack				(app_ref_ack),
		.app_zq_ack					(app_zq_ack),
		.app_wdf_mask				(app_wdf_mask)
	);
	
	wire								wr_burst_data_req;
	wire								wr_burst_finish;
	wire								rd_burst_finish;
	wire								rd_burst_req;
	wire								wr_burst_req;
	wire	[9 : 0]						rd_burst_len;
	wire	[9 : 0]						wr_burst_len;
	wire	[ADDR_WIDTH-1 : 0]			rd_burst_addr;
	wire	[ADDR_WIDTH-1 : 0]			wr_burst_addr;
	wire								rd_burst_data_valid;
	wire	[APP_DATA_WIDTH-1 : 0]		rd_burst_data;
	wire	[APP_DATA_WIDTH-1 : 0]		wr_burst_data;
	
	mem_burst #(
		
		.MEM_DATA_BITS		(APP_DATA_WIDTH),
		.ADDR_BITS			(ADDR_WIDTH),
		.BURST_LENGTH_2LOG	(BURST_LENGTH_2LOG)
		
	) mem_burst_inst0 (
		
		.rst					(rst),
		.mem_clk				(clk),
		
		.rd_burst_req			(rd_burst_req),
		.wr_burst_req			(wr_burst_req),
		.rd_burst_len			(rd_burst_len),
		.wr_burst_len			(wr_burst_len),
		.rd_burst_addr			(rd_burst_addr),
		.wr_burst_addr			(wr_burst_addr),
		.rd_burst_data_valid	(rd_burst_data_valid),
		.wr_burst_data_req		(wr_burst_data_req),
		.rd_burst_data			(rd_burst_data),
		.wr_burst_data			(wr_burst_data),
		.rd_burst_finish		(rd_burst_finish),
		.wr_burst_finish		(wr_burst_finish),
		.burst_finish			(),
		
		.ui_clk_sync_rst		(),
		.app_addr				(app_addr),
		.app_cmd				(app_cmd),
		.app_en					(app_en),
		.app_wdf_data			(app_wdf_data),
		.app_wdf_end			(app_wdf_end),
		.app_wdf_mask			(app_wdf_mask),
		.app_wdf_wren			(app_wdf_wren),
		.app_rd_data			(app_rd_data),
		.app_rd_data_end		(app_rd_data_end),
		.app_rd_data_valid		(app_rd_data_valid),
		.app_rdy				(app_rdy),
		.app_wdf_rdy			(app_wdf_rdy),
		
		.init_calib_complete	(ddr_cal_done)
	);
	
	mem_test #(
		
		.MEM_DATA_BITS		(APP_DATA_WIDTH),
		.ADDR_BITS			(ADDR_WIDTH)
		
	) mem_test_inst0 (
		
		.rst					(rst),
		.mem_clk				(clk),
		
		.rd_burst_req			(rd_burst_req),
		.wr_burst_req			(wr_burst_req),
		.rd_burst_len			(rd_burst_len),
		.wr_burst_len			(wr_burst_len),
		.rd_burst_addr			(rd_burst_addr),
		.wr_burst_addr			(wr_burst_addr),
		.rd_burst_data_valid	(rd_burst_data_valid),
		.wr_burst_data_req		(wr_burst_data_req),
		.rd_burst_data			(rd_burst_data),
		.wr_burst_data			(wr_burst_data),
		.rd_burst_finish		(rd_burst_finish),
		.wr_burst_finish		(wr_burst_finish),
		
		.error					(ddr_rw_error)
	);
	
`ifdef GOLDEN_DDR_DEBUG
	/////////////////////////////////////////////////////////////////////////////////
	//	Debug section
	/////////////////////////////////////////////////////////////////////////////////
	wire				probe0;
	wire				probe1;
	wire				probe2;
	wire				probe3;
	wire				probe4;
	wire				probe5;
	wire				probe6;
	wire				probe7;
	wire	[511 : 0]	probe8;
	wire	[511 : 0]	probe9;
	wire	[27 : 0]	probe10;
	
	ila_0 ila_0_inst0(
		
		.clk		(clk),
		.probe0		(probe0),
		.probe1		(probe1),
		.probe2		(probe2),
		.probe3		(probe3),
		.probe4		(probe4),
		.probe5		(probe5),
		.probe6		(probe6),
		.probe7		(probe7),
		.probe8		(probe8),
		.probe9		(probe9),
		.probe10	(probe10)
	);
	
	assign probe0 = rd_burst_req;
	assign probe1 = wr_burst_req;
	assign probe2 = rd_burst_data_valid;
	assign probe3 = wr_burst_data_req;
	assign probe4 = rd_burst_finish;
	assign probe5 = wr_burst_finish;
	assign probe6 = ddr_rw_error;
	assign probe7 = ddr_cal_done;
	assign probe8 = wr_burst_data[511:0];
	assign probe9 = rd_burst_data[511:0];
	assign probe10 = app_addr[27:0];
	
	/////////////////////////////////////////////////////////////////////////////////
`endif

endmodule
