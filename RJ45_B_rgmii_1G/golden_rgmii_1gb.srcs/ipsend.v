`timescale 1ns / 1ps

module ipsend(
	
	input						clk,
	output reg					txen,
	output reg					txer,
	output reg		[7 : 0]		dataout,
	input			[31 : 0]	crc,
	input			[31 : 0]	datain,
	output reg					crcen,
	output reg					crcre,

	output reg		[3 : 0]		tx_state,
	input			[15 : 0]	tx_data_length,
	input			[15 : 0]	tx_total_length,
	output reg		[8 : 0]		ram_rd_addr
);
	
	reg		[31 : 0]	datain_reg;
	reg		[31 : 0]	ip_header		[6 : 0];
	reg		[7 : 0]		preamble		[7 : 0];
	reg		[7 : 0]		mac_addr		[13 : 0];
	reg		[4 : 0]		i, j;
	
	reg		[31 : 0]	check_buffer;
	reg		[31 : 0]	time_counter;
	reg		[15 : 0]	tx_data_counter;
	
	localparam idle			= 4'b0000;
	localparam start		= 4'b0001;
	localparam make			= 4'b0010;
	localparam send55		= 4'b0011;
	localparam sendmac		= 4'b0100;
	localparam sendheader	= 4'b0101;
	localparam senddata		= 4'b0110;
	localparam sendcrc		= 4'b0111;
	
	initial begin
		
		tx_state <= idle;
		
		// 7 x 55, 1 x d5
		preamble[0] <= 8'h55;
		preamble[1] <= 8'h55;
		preamble[2] <= 8'h55;
		preamble[3] <= 8'h55;
		preamble[4] <= 8'h55;
		preamble[5] <= 8'h55;
		preamble[6] <= 8'h55;
		preamble[7] <= 8'hD5;
		
		//Ä¿ MACµØÖ· ff-ff-ff-ff-ff-ff
		mac_addr[0] <= 8'hFF;
		mac_addr[1] <= 8'hFF;
		mac_addr[2] <= 8'hFF;
		mac_addr[3] <= 8'hFF;
		mac_addr[4] <= 8'hFF;
		mac_addr[5] <= 8'hFF;
		
		// source MAC address 01-60-6E-11-02-0F
		mac_addr[6] <= 8'h01;
		mac_addr[7] <= 8'h60;
		mac_addr[8] <= 8'h6E;
		mac_addr[9] <= 8'h11;
		mac_addr[10] <= 8'h02;
		mac_addr[11] <= 8'h0F;
		
		// 0800: IP type
		mac_addr[12] <= 8'h08;
		mac_addr[13] <= 8'h00;
		
		i <= 0;
	end
	
	reg	[16 : 0] temp_a;
	reg	[16 : 0] temp_b;
	reg	[16 : 0] temp_c;
	reg	[16 : 0] temp_d;
	reg	[16 : 0] temp_e;
	reg	[17 : 0] temp_f;
	reg	[17 : 0] temp_g;
	reg	[18 : 0] temp_h;
	
	always@(negedge clk)begin
		
		case(tx_state)
			
			idle: begin
				
				txer <= 1'b0;
				txen <= 1'b0;
				crcen <= 1'b0;
				crcre <= 1;
				j <= 0;
				dataout <= 0;
				ram_rd_addr <= 1;
				tx_data_counter <= 0;
				
				// send after a short delay
				if(time_counter == 32'h04000000)begin
					tx_state <= start;
					time_counter <= 0;
				end else
					time_counter <= time_counter + 1'b1;
			end
			
			//IP header
			start: begin
				
				ip_header[0] <= {16'h4500,tx_total_length};			// version 4£» header length 20£»IP
				ip_header[1][31:16] <= ip_header[1][31:16] + 1'b1;	// serial number
				ip_header[1][15:0] <= 16'h4000;						// Fragment offset
				ip_header[2] <= 32'h80110000;						// mema[2][15:0] protocol 17(UDP)
				ip_header[3] <= {8'd192, 8'd168, 8'd1, 8'd183};	// 192.168.1.xx source IP
				ip_header[4] <= {8'd192, 8'd168, 8'd1, 8'd37};		// 192.168.1.xx target IP
				ip_header[5] <= {16'd8080, 16'd8080};				// ports
				ip_header[6] <= {tx_data_length,16'h0000};			// data length
				tx_state <= make;
			end
			
			// calculate the check sum
			make: begin
				
				if(i == 0)begin
					temp_a <= ip_header[0][15:0] + ip_header[0][31:16];
					temp_b <= ip_header[1][15:0] + ip_header[1][31:16];
					temp_c <= ip_header[2][15:0] + ip_header[2][31:16];
					temp_d <= ip_header[3][15:0] + ip_header[3][31:16];
					temp_e <= ip_header[4][15:0] + ip_header[4][31:16];
					i <= i + 1'b1;
					
				end else if(i == 1)begin
					temp_f <= temp_a + temp_b;
					temp_g <= temp_c + temp_d;
					i <= i + 1'b1;
					
				end else if(i == 2)begin
					temp_h <= temp_f + temp_g;
					i <= i + 1'b1;
					
				end else if(i == 3)begin
					check_buffer <= temp_h + temp_e;
					i <= i + 1'b1;
					
				end else if(i == 4)begin
					check_buffer[15:0] <= check_buffer[31:16] + check_buffer[15:0];
					i <= i + 1'b1;
				end else begin
					//header checksum
					ip_header[2][15:0] <= ~check_buffer[15:0];
					i <= 0;
					tx_state <= send55;
				end
			end
			
			// send 7x 55 1x d5
			send55: begin
				
				txen <= 1'b1;	//GMII send data is valid
				crcre <= 1'b1;	//reset crc
				
				if(i == 7)begin
					dataout[7:0] <= preamble[i][7:0];
					i <= 0;
					tx_state <= sendmac;
				end else begin
					dataout[7:0] <= preamble[i][7:0];
					i <= i + 1;
				end
			end
			
			//send target MAC address, source MAC address, IP type
			sendmac: begin
				
				// crc enable£¬crc 32 bits data
				crcen <= 1'b1;
				crcre <= 1'b0;
				
				if(i == 13)begin
					dataout[7:0] <= mac_addr[i][7:0];
					i <= 0;
					tx_state <= sendheader;
				end else begin                        
					dataout[7:0] <= mac_addr[i][7:0];
					i <= i + 1'b1;
				end
			end
			
			//send 7 32 bits IP header
			sendheader: begin
				
				// send data
				datain_reg <= datain;
				
				if(j == 6)begin
					
					if(i == 0)begin
						dataout[7:0] <= ip_header[j][31:24];
						i <= i + 1'b1;
					end else if(i == 1)begin
						dataout[7:0] <= ip_header[j][23:16];
						i <= i + 1'b1;
					end else if(i == 2)begin
						dataout[7:0] <= ip_header[j][15:8];
						i <= i + 1'b1;
					end else if(i == 3)begin
						dataout[7:0] <= ip_header[j][7:0];
						i <= 0;
						j <= 0;
						tx_state <= senddata;
					end else
						txer <= 1'b1;
					
				end else begin
					
					if(i == 0)begin
						dataout[7:0] <= ip_header[j][31:24];
						i <= i + 1'b1;
					end else if(i == 1)begin
						dataout[7:0] <= ip_header[j][23:16];
						i <= i + 1'b1;
					end else if(i == 2)begin
						dataout[7:0] <= ip_header[j][15:8];
						i <= i + 1'b1;
					end else if(i == 3)begin
						dataout[7:0] <= ip_header[j][7:0];
						i <= 0;
						j <= j + 1'b1;
					end else
						txer <= 1'b1;
				end
			end
			
			//send UDP
			senddata: begin
				
				//send last data
				if(tx_data_counter == tx_data_length-9)begin
					
					tx_state <= sendcrc;
					
					if(i == 0)begin    
						dataout[7:0] <= datain_reg[31:24];
						i <= 0;
					end else if(i == 1)begin
						dataout[7:0] <= datain_reg[23:16];
						i <= 0;
					end else if(i == 2)begin
						dataout[7:0] <= datain_reg[15:8];
						i <= 0;
					end else if(i == 3)begin
						dataout[7:0] <= datain_reg[7:0];
						// ready data
						datain_reg <= datain;
						i <= 0;
					end
					
				//send others
				end else begin
					
					tx_data_counter <= tx_data_counter + 1'b1;			
					
					if(i == 0)begin    
						dataout[7:0] <= datain_reg[31:24];
						i <= i + 1'b1;
						// RAM + 1, RAM output data
						ram_rd_addr <= ram_rd_addr + 1'b1;
					end else if(i == 1)begin
						dataout[7:0] <= datain_reg[23:16];
						i <= i + 1'b1;
					end else if(i == 2)begin
						dataout[7:0] <= datain_reg[15:8];
						i <= i + 1'b1;
					end else if(i == 3)begin
						dataout[7:0] <= datain_reg[7:0];
						// ready data
						datain_reg <= datain;
						i <= 0;
					end
				end
			end
			
			// send 32 bits CRC
			sendcrc: begin
				crcen <= 1'b0;
				
				if(i == 0)begin
					dataout[7:0] <= {~crc[24], ~crc[25], ~crc[26], ~crc[27], ~crc[28], ~crc[29], ~crc[30], ~crc[31]};
					i <= i + 1'b1;
				end else begin
					if(i == 1)begin
						dataout[7:0] <= {~crc[16], ~crc[17], ~crc[18], ~crc[19], ~crc[20], ~crc[21], ~crc[22], ~crc[23]};
						i <= i + 1'b1;
					end else if(i == 2)begin
						dataout[7:0] <= {~crc[8], ~crc[9], ~crc[10], ~crc[11], ~crc[12], ~crc[13], ~crc[14], ~crc[15]};
						i <= i + 1'b1;
					end else if(i == 3)begin
						dataout[7:0] <= {~crc[0], ~crc[1], ~crc[2], ~crc[3], ~crc[4], ~crc[5], ~crc[6], ~crc[7]};
						i <= 0;
						tx_state <= idle;
					end else begin
						txer <= 1'b1;
					end
				end
			end
			
			default:tx_state <= idle;
			
		endcase
	end
	
endmodule
