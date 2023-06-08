`timescale 1ns / 1ps


module golden_rgmii_1gb(
	
	input				sys_nrst,
	
	output				e_reset,
	output				e_mdc,
	inout				e_mdio,
	
	input				e_rxc,
	input				e_rxctl,
	input	[3 : 0]		e_rxd,
	
	output				e_txc,
	output				e_txctl,
	output	[3 : 0]		e_txd	 
);
	
	localparam speed_selection = 2'b10;
	localparam duplex_mode = 1'b1;
	
	wire	[7:0]	gmii_txd;
	wire			gmii_tx_en;
	wire			gmii_tx_er;
	wire			gmii_tx_clk;
	
	wire	[7:0]	gmii_rxd;
	wire			gmii_rx_dv;
	wire			gmii_rx_er;
	wire			gmii_rx_clk;
	
	gmii_to_rgmii gmii_to_rgmii_inst0(
		
		.reset			(1'b0),
		
		.rgmii_td		(e_txd),
		.rgmii_tx_ctl	(e_txctl),
		.rgmii_txc		(e_txc),
		
		.rgmii_rd		(e_rxd),
		.rgmii_rx_ctl	(e_rxctl),
		.rgmii_rxc		(e_rxc),
		
		.gmii_txd		(gmii_txd),
		.gmii_tx_en		(gmii_tx_en),
		.gmii_tx_er		(gmii_tx_er),
		.gmii_tx_clk	(gmii_tx_clk),
		.gmii_crs		(),
		.gmii_col		(),
		.gmii_rxd		(gmii_rxd),
		.gmii_rx_dv		(gmii_rx_dv),
		.gmii_rx_er		(gmii_rx_er),
		.gmii_rx_clk	(gmii_rx_clk),
		
		.speed_selection	(speed_selection),
		.duplex_mode		(duplex_mode)
	);
	
	wire [31:0] ram_wr_data;
	wire [31:0] ram_rd_data;
	wire [8:0] ram_wr_addr;
	wire [8:0] ram_rd_addr;
	
	assign e_reset	= 1'b1;
	assign e_mdc	= 1'b1;
	assign e_mdio	= 1'b1;

	wire [31:0] datain_reg;

	wire [3:0] tx_state;
	wire [3:0] rx_state;
	wire [15:0] rx_total_length;
	wire [15:0] tx_total_length;
	wire [15:0] rx_data_length;
	wire [15:0] tx_data_length;

	wire data_receive;
	reg ram_wr_finish;

	reg [31:0] udp_data [4:0];
	reg ram_wren_i;
	reg [8:0] ram_addr_i;
	reg [31:0] ram_data_i;
	reg [4:0] i;

	wire data_o_valid;
	wire wea;
	wire [8:0] addra;
	wire [31:0] dina;

	assign wea=ram_wr_finish?data_o_valid:ram_wren_i;
	assign addra=ram_wr_finish?ram_wr_addr:ram_addr_i;
	assign dina=ram_wr_finish?ram_wr_data:ram_data_i;
	
	assign tx_data_length=data_receive?rx_data_length:16'd28;
	assign tx_total_length=data_receive?rx_total_length:16'd48;
	
	udp udp_inst0(
		
		.reset_n	(sys_nrst),
		.g_clk		(gmii_tx_clk),
		
		.e_rxc		(gmii_rx_clk),
		.e_rxdv		(gmii_rx_dv),
		.e_rxd		(gmii_rxd),
		
		.e_txen		(gmii_tx_en),
		.e_txd		(gmii_txd),
		.e_txer		(gmii_rx_er),
		
		.data_o_valid		(data_o_valid),
		.ram_wr_data		(ram_wr_data),
		.rx_total_length	(rx_total_length),
		.rx_state			(rx_state),
		.rx_data_length		(rx_data_length),
		.ram_wr_addr		(ram_wr_addr),
		.data_receive		(data_receive),
		.ram_rd_data		(ram_rd_data),
		.tx_state			(tx_state),
		.tx_data_length		(tx_data_length),
		.tx_total_length	(tx_total_length),
		.ram_rd_addr		(ram_rd_addr)
	);
	
	ram ram_inst(
		.clka(gmii_rx_clk),
		.wea(wea),
		.addra(addra),
		.dina(dina),
		.clkb(gmii_tx_clk),
		.addrb(ram_rd_addr),
		.doutb(ram_rd_data)
	);
	
	always @(*)begin
		udp_data[0]<={8'd72,8'd69,8'd76,8'd76};
		udp_data[1]<={8'd79,8'd32,8'd65,8'd76};
		udp_data[2]<={8'd73,8'd78,8'd88,8'd32};
		udp_data[3]<={8'd65,8'd88,8'd51,8'd48};
		udp_data[4]<={8'd57,8'd32,8'd10,8'd13};
	end
	
	always@(posedge gmii_rx_clk)begin
		if(!sys_nrst) begin
			ram_wr_finish<=1'b0;
			ram_addr_i<=0;
			ram_data_i<=0;
			i<=0;
		end else begin
			if(i==5) begin
				ram_wr_finish<=1'b1;
				ram_wren_i<=1'b0;
			end else begin
				ram_wren_i<=1'b1;
				ram_addr_i<=ram_addr_i+1'b1;
				ram_data_i<=udp_data[i];
				i<=i+1'b1;
			end
		end
	end
	
endmodule
