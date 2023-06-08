`timescale 1ns / 1ps


module iprecieve(
	
	input						clk,
	input			[7 : 0]		datain,
	input						e_rxdv,
	input						clr,
	output reg		[47 : 0]	board_mac,
	output reg		[47 : 0]	pc_mac,
	output reg		[15 : 0]	IP_Prtcl,
	output reg					valid_ip_P,
	output reg		[159 : 0]	IP_layer,
	output reg		[31 : 0]	pc_IP,
	output reg		[31 : 0]	board_IP,
	output reg		[63 : 0]	UDP_layer,

	output reg		[31 : 0]	data_o,

	output reg		[15 : 0]	rx_total_length,
	output reg					data_o_valid,
	output reg		[3 : 0]		rx_state,
	output reg		[15 : 0]	rx_data_length,
	output reg		[8 : 0]		ram_wr_addr,
	output reg					data_receive
);
	
	reg		[15 : 0]	myIP_Prtcl;
	reg		[159 : 0]	myIP_layer;
	reg		[63 : 0]	myUDP_layer;
	reg		[31 : 0]	mydata; 
	reg		[2 : 0]		byte_counter;
	reg		[4 : 0]		state_counter;
	reg		[95 : 0]	mymac;
	reg		[15 : 0]	data_counter;
	
	localparam idle				= 4'd0;
	localparam six_55			= 4'd1;
	localparam spd_d5			= 4'd2;
	localparam rx_mac			= 4'd3;
	localparam rx_IP_Protocol	= 4'd4;
	localparam rx_IP_layer		= 4'd5;
	localparam rx_UDP_layer		= 4'd6;
	localparam rx_data			= 4'd7;
	localparam rx_finish		= 4'd8;
	
	initial begin
		rx_state <= idle;
	end
	
	//UDPdata receive ³ÌÐò	 	
	always@(posedge clk)begin
		
		if(!clr)begin
			rx_state <= idle;
			data_receive <= 1'b0;
		end else begin
			
			case(rx_state)
				
				idle: begin
					valid_ip_P <= 1'b0;
					byte_counter <= 3'd0;
					data_counter <= 10'd0;
					mydata <= 32'd0;
					state_counter <= 5'd0;
					data_o_valid <= 1'b0;
					ram_wr_addr <= 0;
					
					// receive data active high£¬start receive data
					if(e_rxdv == 1'b1)begin
						// receive first 55
						if(datain[7:0] == 8'h55)begin
							rx_state <= six_55;
							mydata <= {mydata[23:0],datain[7:0]};
						end else
							rx_state <= idle;
					end
				end
				
				// receive 6 x 55
				six_55: begin
					if((datain[7:0] == 8'h55) && (e_rxdv == 1'b1))begin
						if(state_counter == 5)begin
							state_counter <= 0;
							rx_state <= spd_d5;
						end else
							state_counter <= state_counter + 1'b1;
					end else
						rx_state <= idle;
				end
				
				// receive 1 x d5
				spd_d5: begin
					if((datain[7:0] == 8'hd5) && (e_rxdv == 1'b1)) 
						rx_state <= rx_mac;
					else 
						rx_state <= idle;
				end
				
				// receive target mac address source mac address
				rx_mac: begin
					
					if(e_rxdv == 1'b1)begin
						if(state_counter<5'd11)begin
							mymac <= {mymac[87:0],datain};
							state_counter <= state_counter + 1'b1;
						end else begin
							board_mac <= mymac[87:40];
							pc_mac <= {mymac[39:0],datain};
							state_counter <= 5'd0;
							
							//source MAC address 01-60-6E-11-02-0F
							if((mymac[87:72] == 16'h0160) && (mymac[71:56] == 16'h6E11) && (mymac[55:40] == 16'h020F))
								rx_state <= rx_IP_Protocol;
							else
								rx_state <= idle;
						end
						
					end else
						rx_state <= idle;
				end
				
				// receive 2 bytes IP TYPE
				rx_IP_Protocol: begin
					
					if(e_rxdv == 1'b1)begin
						if(state_counter<5'd1)begin
							myIP_Prtcl <= {myIP_Prtcl[7:0],datain[7:0]};
							state_counter <= state_counter + 1'b1;
						end else begin
							IP_Prtcl <= {myIP_Prtcl[7:0],datain[7:0]};
							valid_ip_P <= 1'b1;
							state_counter <= 5'd0;
							rx_state <= rx_IP_layer;
						end
					end else
						rx_state <= idle;
				end
				
				// receive 20 bytes udp, ip address
				rx_IP_layer: begin
					
					valid_ip_P <= 1'b0;
					
					if(e_rxdv == 1'b1)begin
						if(state_counter<5'd19)begin
							myIP_layer <= {myIP_layer[151:0],datain[7:0]};
							state_counter <= state_counter + 1'b1;
						end else begin
							IP_layer <= {myIP_layer[151:0],datain[7:0]};
							state_counter <= 5'd0;
							rx_state <= rx_UDP_layer;
						end
						
					end else 
						rx_state <= idle;
				end
				
				// accept 8 bytes UDP port and length
				rx_UDP_layer: begin
					
					rx_total_length <= IP_layer[143:128];
					pc_IP <= IP_layer[63:32];
					board_IP <= IP_layer[31:0];
					
					if(e_rxdv == 1'b1)begin
						
						if(state_counter<5'd7)begin
							myUDP_layer <= {myUDP_layer[55:0],datain[7:0]};
							state_counter <= state_counter + 1'b1;
						end else begin
							UDP_layer <= {myUDP_layer[55:0],datain[7:0]};
							// UDP length
							rx_data_length <=  myUDP_layer[23:8];
							state_counter <= 5'd0;
							rx_state <= rx_data;
						end
					end else 
						rx_state <= idle;
				end
				
				// receive UDP data
				rx_data: begin
					
					if(e_rxdv == 1'b1)begin
						// save last data, UDP data total = -8 bytes UDP header
						if(data_counter == rx_data_length-9)begin
							
							data_counter <= 0;
							rx_state <= rx_finish;
							ram_wr_addr <= ram_wr_addr + 1'b1;
							// write RAM
							data_o_valid <= 1'b1;
							
							if(byte_counter == 3'd3)begin
								data_o <= {mydata[23:0],datain[7:0]};
								byte_counter <= 0;
							// zero padding when not 32 bits
							end else if(byte_counter == 3'd2)begin
								data_o <= {mydata[15:0],datain[7:0],8'h00};
								byte_counter <= 0;
							// zero padding when not 32 bits
							end else if(byte_counter == 3'd1)begin
								data_o <= {mydata[7:0],datain[7:0],16'h0000};
								byte_counter <= 0;
							// zero padding when not 32 bits
							end else if(byte_counter == 3'd0)begin
								data_o <= {datain[7:0],24'h000000};
								byte_counter <= 0;
							end
							
						end else begin
							
							data_counter <= data_counter + 1'b1;
							
							if(byte_counter<3'd3)begin
								mydata <= {mydata[23:0],datain[7:0]};
								byte_counter <= byte_counter + 1'b1;
								data_o_valid <= 1'b0;
							end else begin
								data_o <= {mydata[23:0],datain[7:0]};
								byte_counter <= 3'd0;
								data_o_valid <= 1'b1;
								ram_wr_addr <= ram_wr_addr + 1'b1;
							end	
						end
					end else
						rx_state <= idle;
				end
				
				rx_finish: begin
					data_o_valid <= 1'b0;
					data_receive <= 1'b1;
					rx_state <= idle;
				end
				
				default: rx_state <= idle;
				
			endcase
		end
	end
	
endmodule
