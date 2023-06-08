`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/11 21:47:15
// Design Name: 
// Module Name: led_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led_test (clk_100M,dataout);

input clk_100M;     //
output [7:0] dataout;  //
reg [7:0] dataout;
reg [27:0] count; //


always @ ( posedge clk_100M )
 begin
  count<=count+1;
 end

always @ (  count[27:24] )

 begin
  case ( count[27:24] )

  0: dataout<=8'b11111110;
  
  1: dataout<=8'b11111100;
  
  2: dataout<=8'b11111000;
  
  3: dataout<=8'b11110000;
  
  4: dataout<=8'b11100000;
  
  5: dataout<=8'b11000000;
  
  6: dataout<=8'b10000000;
    
  7: dataout<=8'b00000000; 
  
  
  8: dataout<=8'b11111111;
  
  9: dataout<=8'b10000000;
  
  10: dataout<=8'b11000000;
  
  11: dataout<=8'b11100000;
  
  12: dataout<=8'b11110000;
  
  13: dataout<=8'b11111000;
    
  14: dataout<=8'b11111100; 
  
  15: dataout<=8'b11111110;

  endcase
 end
endmodule


