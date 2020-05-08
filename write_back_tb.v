`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:17:10 09/03/2019
// Design Name:   write_back
// Module Name:   M:/Lab-20190813T125239Z-001/Lab/Assignment1/write_back_tb.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: write_back
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module write_back_tb;

	// Inputs
	reg [15:0] ans_dm;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] ans_wb;

	// Instantiate the Unit Under Test (UUT)
	write_back uut (
		.ans_dm(ans_dm), 
		.clk(clk), 
		.reset(reset), 
		.ans_wb(ans_wb)
	);
always begin 
#5clk=~clk;
end
	initial begin
	ans_dm=0;
	clk=0;
		reset=1;
		 #2 reset=0;
	    #6 reset=1;
	    #2;
		// Initialize Inputs
		ans_dm =8 ;

		// Wait 100 ns for global reset to finish
		#10;
      ans_dm = 42158;
		#10
		ans_dm = 7777;
		#10
		ans_dm = 1000;
		// Add stimulus here

	end
      
endmodule

