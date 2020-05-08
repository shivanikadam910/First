`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:02:41 08/21/2019
// Design Name:   ALU_16bit
// Module Name:   C:/Users/Manasvi Dobariya/Downloads/Compressed/Lab-20190813T125239Z-001/Lab/Assignment1/ALU_16bit_tb.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_16bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_16bit_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [5:0] op_dec;
	reg [15:0] data_in;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] ans_ex;
	wire [15:0] DM_data;
	wire [15:0] data_out;
	wire [1:0] flag_ex;

	// Instantiate the Unit Under Test (UUT)
	ALU_16bit uut (
		.A(A), 
		.B(B), 
		.op_dec(op_dec), 
		.data_in(data_in), 
		.clk(clk), 
		.reset(reset), 
		.ans_ex(ans_ex), 
		.DM_data(DM_data), 
		.data_out(data_out), 
		.flag_ex(flag_ex)
	);
initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		op_dec = 0;
		data_in = 0;
		clk = 0;
		reset = 1;

		#2 reset=0;
		#6 reset=1;
		#2 op_dec=6'd0; A=16'h4000; B=16'hC000; data_in = 16'h0008;

// All the inouts remains same except the op_dec			
		#10 op_dec=6'b000001;
		#10 op_dec=6'b000010;
		#10 op_dec=6'b000100;
		#10 op_dec=6'b000101;
		#10 op_dec=6'b000110;
		#10 op_dec=6'b000111;
		#10 op_dec=6'b001000;
		#10 op_dec=6'b001001;
		#10 op_dec=6'b001010;
		#10 op_dec=6'b001100;
		#10 op_dec=6'b001101;
		#10 op_dec=6'b001110;
		#10 op_dec=6'b001111;
		#10 op_dec=6'b010000;
		#10 op_dec=6'b010001;
		#10 op_dec=6'b010100;
		#10 op_dec=6'b010101;
		#10 op_dec=6'b010110;
		#10 op_dec=6'b010111;
		#10 op_dec=6'b011000;
		#10 op_dec=6'b011001; A=16'hC000; B=16'h0001;
		#10 op_dec=6'b011010;
		#10 op_dec=6'b011011;
		#10 op_dec=6'b011100;
		#10 op_dec=6'b011101;
		#10 op_dec=6'b011110;
		#10 op_dec=6'b011111;

	end
	
	always
	begin
			#5 clk = 1'b1;
			#5 clk = 1'b0;
	end         

      
endmodule

