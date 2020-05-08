`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:48:07 05/07/2020
// Design Name:   top
// Module Name:   D:/S123/CO_lab/Assignment1/top_tb.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_tb;

	// Inputs
	reg [15:0] data_in;
	reg clk;
	reg interrupt;
	reg reset;

	// Outputs
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.data_in(data_in), 
		.clk(clk), 
		.interrupt(interrupt), 
		.reset(reset), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		data_in = 0;
		clk = 0;
		interrupt = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		
			// Wait 100 ns for global reset to finish
		#200; reset = 0;
		#500; reset = 1;
        
		// Add stimulus here

	end
	always begin
	#500 clk=~clk;
	end
      
		// Add stimulus here

	
      
endmodule

