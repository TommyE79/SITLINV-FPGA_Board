

module mem_test #(

	parameter MEM_DATA_BITS = 64,
	parameter ADDR_BITS = 24,
	parameter BURST_LENGTH = 128
)
(
	input										rst,
	input										mem_clk,
	
	output reg									rd_burst_req,
	output reg									wr_burst_req,
	output reg		[9 : 0]						rd_burst_len,
	output reg		[9 : 0]						wr_burst_len,
	output reg		[ADDR_BITS - 1:0]			rd_burst_addr,
	output reg		[ADDR_BITS - 1:0]			wr_burst_addr,
	input										rd_burst_data_valid,
	input										wr_burst_data_req,
	input			[MEM_DATA_BITS-1 : 0]		rd_burst_data,
	output			[MEM_DATA_BITS-1 : 0]		wr_burst_data,
	input										rd_burst_finish,
	input										wr_burst_finish,
	
	output reg error
);
	
	localparam IDLE			= 3'd0;
	localparam MEM_READ		= 3'd1;
	localparam MEM_WRITE	= 3'd2;
	
	reg		[2 : 0]						state;
	reg		[7 : 0]						wr_cnt;
	reg		[MEM_DATA_BITS - 1 : 0]		wr_burst_data_reg;
	reg		[7 : 0]						rd_cnt;
	
	assign wr_burst_data = wr_burst_data_reg;
	
	always@(posedge mem_clk or posedge rst)begin
		
		if(rst)begin
			error <= 1'b0;
		end else begin
			error <= (state == MEM_READ) && rd_burst_data_valid && (rd_burst_data != {(MEM_DATA_BITS/8){rd_cnt}});
		end
	end
	
	always@(posedge mem_clk or posedge rst)begin
		
		if(rst)begin
			wr_burst_data_reg <= {MEM_DATA_BITS{1'b0}};
			wr_cnt <= 8'd0;
		end else if(state == MEM_WRITE)begin
			if(wr_burst_data_req)begin
				wr_burst_data_reg <= {(MEM_DATA_BITS/8){wr_cnt}};
				wr_cnt <= wr_cnt + 8'd1;
			end else if(wr_burst_finish)begin
				wr_cnt <= 8'd0;
			end
		end
	end
	
	always@(posedge mem_clk or posedge rst)begin
		
		if(rst)begin
			rd_cnt <= 8'd0;
		end else begin
			if(state == MEM_READ)begin
				if(rd_burst_data_valid)begin
					rd_cnt <= rd_cnt + 8'd1;
				end else if(rd_burst_finish)begin
					rd_cnt <= 8'd0;
				end
			end else begin
				rd_cnt <= 8'd0;
			end
		end
	end
	
	always@(posedge mem_clk or posedge rst)begin
		
		if(rst)begin
			state <= IDLE;
			wr_burst_req <= 1'b0;
			rd_burst_req <= 1'b0;
			rd_burst_len <= BURST_LENGTH;
			wr_burst_len <= BURST_LENGTH;
			rd_burst_addr <= 0;
			wr_burst_addr <= 0;
		end else begin
			
			case(state)
				IDLE: begin
					state <= MEM_WRITE;
					wr_burst_req <= 1'b1;
					wr_burst_len <= BURST_LENGTH;
				end
				
				MEM_WRITE: begin
					if(wr_burst_finish)begin
						state <= MEM_READ;
						wr_burst_req <= 1'b0;
						rd_burst_req <= 1'b1;
						rd_burst_len <= BURST_LENGTH;
						rd_burst_addr <= wr_burst_addr;
					end
				end
				
				MEM_READ: begin
					if(rd_burst_finish)begin
						state <= MEM_WRITE;
						wr_burst_req <= 1'b1;
						wr_burst_len <= BURST_LENGTH;
						rd_burst_req <= 1'b0;
						wr_burst_addr <= wr_burst_addr + BURST_LENGTH;
					end
				end
			
				default: state <= IDLE;
			endcase
		end
	end

endmodule
