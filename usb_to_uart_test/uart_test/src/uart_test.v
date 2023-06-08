
//*******************************************************************************/

module uart_test(
input                           sys_clk_p,      // Differentia system clock 200Mhz input on board
input                           sys_clk_n,
input                           rst_n,
input                           uart_rx,
output                          uart_tx
);

parameter                      CLK_FRE = 200;//Mhz
localparam                       IDLE =  0;
localparam                       SEND =  1;   //send HELLO ALINX\r\n
localparam                       WAIT =  2;   //wait 1 second and send uart received data
reg[7:0]                         tx_data;
reg[7:0]                         tx_str;
reg                              tx_data_valid;
wire                             tx_data_ready;
reg[7:0]                         tx_cnt;
wire[7:0]                        rx_data;
wire                             rx_data_valid;
wire                             rx_data_ready;
reg[31:0]                        wait_cnt;
reg[3:0]                         state;

//===========================================================================
//Differentia system clock to single end clock
//===========================================================================
wire        sys_clk;
 IBUFGDS #
   (
    .DIFF_TERM    ("FALSE"),
    .IBUF_LOW_PWR ("FALSE")
    )
  u_ibufg_sys_clk
   (
    .I  (sys_clk_p),            
    .IB (sys_clk_n),          
    .O  (sys_clk  )        
    );  
assign rx_data_ready = 1'b1;//always can receive data,
							//if HELLO ALINX\r\n is being sent, the received data is discarded

always@(posedge sys_clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
	begin
		wait_cnt <= 32'd0;
		tx_data <= 8'd0;
		state <= IDLE;
		tx_cnt <= 8'd0;
		tx_data_valid <= 1'b0;
	end
	else
	case(state)
		IDLE:
			state <= SEND;
		SEND:
		begin
			wait_cnt <= 32'd0;
			tx_data <= tx_str;

			if(tx_data_valid == 1'b1 && tx_data_ready == 1'b1 && tx_cnt < 8'd12)//Send 12 bytes data
			begin
				tx_cnt <= tx_cnt + 8'd1; //Send data counter
			end
			else if(tx_data_valid && tx_data_ready)//last byte sent is complete
			begin
				tx_cnt <= 8'd0;
				tx_data_valid <= 1'b0;
				state <= WAIT;
			end
			else if(~tx_data_valid)
			begin
				tx_data_valid <= 1'b1;
			end
		end
		WAIT:
		begin
			wait_cnt <= wait_cnt + 32'd1;

			if(rx_data_valid == 1'b1)
			begin
				tx_data_valid <= 1'b1;
				tx_data <= rx_data;   // send uart received data
			end
			else if(tx_data_valid && tx_data_ready)
			begin
				tx_data_valid <= 1'b0;
			end
			else if(wait_cnt >= CLK_FRE * 1000000) // wait for 1 second
				state <= SEND;
		end
		default:
			state <= IDLE;
	endcase
end

//combinational logic
//Send "HELLO ALINX\r\n"
always@(*)
begin
	case(tx_cnt)
		8'd0 :  tx_str <= "F";
		8'd1 :  tx_str <= "P";
		8'd2 :  tx_str <= "G";
		8'd3 :  tx_str <= "A";
		8'd4 :  tx_str <= " ";
		8'd5 :  tx_str <= "S";
		8'd6 :  tx_str <= "T";
		8'd7 :  tx_str <= "L";
		8'd8 :  tx_str <= "I";
		8'd9 :  tx_str <= "N";
		8'd10:  tx_str <= "V";
		8'd11:  tx_str <= "\r";
		8'd12:  tx_str <= "\n";
		default:tx_str <= 8'd0;
	endcase
end

uart_rx#
(
	.CLK_FRE(CLK_FRE),
	.BAUD_RATE(115200)
) uart_rx_inst
(
	.clk                        (sys_clk                  ),
	.rst_n                      (rst_n                    ),
	.rx_data                    (rx_data                  ),
	.rx_data_valid              (rx_data_valid            ),
	.rx_data_ready              (rx_data_ready            ),
	.rx_pin                     (uart_rx                  )
);

uart_tx#
(
	.CLK_FRE(CLK_FRE),
	.BAUD_RATE(115200)
) uart_tx_inst
(
	.clk                        (sys_clk                  ),
	.rst_n                      (rst_n                    ),
	.tx_data                    (tx_data                  ),
	.tx_data_valid              (tx_data_valid            ),
	.tx_data_ready              (tx_data_ready            ),
	.tx_pin                     (uart_tx                  )
);
endmodule