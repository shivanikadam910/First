`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:19:38 05/07/2020
// Design Name:   wallace_16bit
// Module Name:   D:/S123/CO_lab/Assignment1/wallace_tb.v
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

module wallace_tb;

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
		B = 0;

		// Wait 100 ns for global reset to finish
		#100;
		A=27;
		B=3;
        
		// Add stimulus here

	end
      
endmodule

