`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:15 09/03/2019 
// Design Name: 
// Module Name:    write_back 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module write_back(ans_dm,clk,reset,ans_wb);
input [15:0] ans_dm;
input clk,reset;
output reg [15:0] ans_wb;
//wire[15:0] ans_wb_tmp;
//assign ans_wb_tmp = (reset==0)?16'b0000000000000000:ans_dm;	//storing the answer for write back in the register
always@(posedge clk)
begin
	if(reset==1'b0)
		ans_wb<=16'b0;
	else
		ans_wb<=ans_dm;								//assigning temporary answer to the final at the positive edge of the clock
end

endmodule
