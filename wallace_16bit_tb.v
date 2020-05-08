`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:46:29 12/11/2019
// Design Name:   wallace_16bit
// Module Name:   D:/clg/CO_lab/Assignment1/wallace_16bit_tb.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: wallace_16bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module wallace_16bit_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;

	// Outputs
	wire [31:0] Z;

	// Instantiate the Unit Under Test (UUT)
	wallace_16bit uut (
		.A(A), 
		.B(B), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B=0;
		// Wait 100 ns for global reset to finish
		#100;
        A=65535;
		  B=2;
		// Add stimulus here

	end
      
endmodule

