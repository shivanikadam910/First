`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:33:37 09/03/2019
// Design Name:   stall_control
// Module Name:   M:/Lab-20190813T125239Z-001/Lab/Assignment1/stall_control_tb.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stall_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stall_control_tb;

	// Inputs
	reg [5:0] op;
	reg clk;
	reg reset;

	// Outputs
	wire stall;
	wire stall_pm;

	// Instantiate the Unit Under Test (UUT)
	stall_control uut (
		.op(op), 
		.clk(clk), 
		.reset(reset), 
		.stall(stall), 
		.stall_pm(stall_pm)
	);
	initial begin
		// Initialize Inputs
		op = 6'b000000;
		//clk = 0;
		reset = 1;
		#2;
		reset = 0;
		// Wait 100 ns for global reset to finish
		#6;
		reset = 1;
		#8;
		
		op = 6'b 010100;
		

		// Wait 100 ns for global reset to finish
		#20;
		op = 6'b000000;
		#10;
		op = 6'b011110;
		#30;
		op = 6'b000000;
		#10;
		op = 6'b010001;
		
        
		// Add stimulus here

	end
	
	initial begin
		clk = 0;
		forever
		begin
			#5;
			clk = ~clk;
		end
        
		// Add stimulus here

	end
      
endmodule

