`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:52 08/20/2019 
// Design Name: 
// Module Name:    stall_mux 
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
module mux(i1,i2,sel,op
    );
	 input [15:0] i1,i2;
	 input sel;
	 output [15:0] op;
	 
	 assign op = (sel==0)?i1:i2;


endmodule
assign s1=stall?s2:s3;