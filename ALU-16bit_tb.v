`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:14:46 08/13/2019
// Design Name:   ALU_16bit
// Module Name:   C:/Users/Manasvi Dobariya/Downloads/Compressed/Lab-20190813T125239Z-001/Lab/Assignment1/ALU-16bit_tb.v
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
	`timescale 1ns/1ns;
	reg [15:0] A;
	reg [15:0] B;
	reg [5:0] op_dec;
	reg [15:0] data_in;
	//reg clk;
	//reg reset;

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
		//.clk(clk), 
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
		//clk = 0;
		#100;
      A = 5;
		B = 0;
		op_dec = 2;
		data_in = 4 ;

		// Wait 100 ns for global reset to finish
		#100;
      A = 5;
		B = 2;
		op_dec = 28;
		data_in = 4 ;
		//clk = 1;
			

	end
      
endmodule

