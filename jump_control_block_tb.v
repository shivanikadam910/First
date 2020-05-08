`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:10:11 09/10/2019
// Design Name:   jump_control_block
// Module Name:   C:/Users/student/Desktop/Lab/Lab5/jump_control_block_tb.v
// Project Name:  Lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: jump_control_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module jump_control_block_tb;

	// Inputs
	reg [15:0] jmp_address_pm;
	reg [15:0] current_address;
	reg [5:0] op;
	reg [1:0] flag_ex;
	reg interrupt;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] jmp_loc;
	wire pc_mux_sel;

	// Instantiate the Unit Under Test (UUT)
	jump_control_block uut (
		.jmp_address_pm(jmp_address_pm), 
		.current_address(current_address), 
		.op(op), 
		.flag_ex(flag_ex), 
		.interrupt(interrupt), 
		.clk(clk), 
		.reset(reset), 
		.jmp_loc(jmp_loc), 
		.pc_mux_sel(pc_mux_sel)
	);
initial begin
clk=0;
 forever begin #5clk=~clk;
 end

end
	initial begin
		// Initialize Inputs
		jmp_address_pm = 0;
		current_address = 16'h0001;
		op = 16'h0;
		flag_ex = 16'h3;
		interrupt = 16'h0;
		reset = 1;
		#2 reset=0;
		#6 reset=1;
		#2;
		#6;
		interrupt = 1;
		#10;
		
		jmp_address_pm = 16'h0008;
		//current_address = ;
		op = 16'h0;
		interrupt = 0;
		
		#10;
		op = 16'h18;

		#20;
		op = 16'h10;
		flag_ex = 0;
		
		#10;
		op = 16'h1e;

		
		// Add stimulus here

	end
      
endmodule

