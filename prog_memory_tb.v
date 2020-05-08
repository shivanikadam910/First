`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:07:41 10/04/2019
// Design Name:   prog_memory
// Module Name:   C:/Users/Manasvi Dobariya/Desktop/Assignment1/prog_memory_tb.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: prog_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prog_memory_tb;

	// Inputs
	reg [15:0] jmp_loc;
	reg pc_mux_sel;
	reg stall;
	reg stall_pm;
	reg reset;
	reg clk;

	// Outputs
	wire [31:0] ins;
	wire [15:0] current_address;

	// Instantiate the Unit Under Test (UUT)
	prog_memory uut (
		.jmp_loc(jmp_loc), 
		.pc_mux_sel(pc_mux_sel), 
		.stall(stall), 
		.stall_pm(stall_pm), 
		.reset(reset), 
		.clk(clk), 
		.ins(ins), 
		.current_address(current_address)
	);

	initial begin
		// Initialize Inputs
	
		clk = 0;

		#0;
		reset=1'b1;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b1;
		stall=1'b0;
		stall_pm=1'b0;
		
		#2;
		reset=1'b0;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b1;
		stall=1'b0;
		stall_pm=1'b0;
		
		#6;
		reset=1'b1;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b1;
		stall=1'b0;
		stall_pm=1'b0;
		
		#2;
		reset=1'b1;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b0;
		stall=1'b0;
		stall_pm=1'b0;
		
		#5;
		reset=1'b1;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b0;
		stall=1'b0;
		stall_pm=1'b0;
		
		#10;
		reset=1'b1;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b0;
		stall=1'b0;
		stall_pm=1'b0;
		
		#10;
		reset=1'b1;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b0;
		stall=1'b0;
		stall_pm=1'b0;
		
		#5;
		reset=1'b1;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b0;
		stall=1'b1;
		stall_pm=1'b0;
		
		#10;
		reset=1'b1;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b0;
		stall=1'b0;
		stall_pm=1'b1;
		
		#5;
		reset=1'b1;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b0;
		stall=1'b0;
		stall_pm=1'b1;

		#5;
		reset=1'b1;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b1;
		stall=1'b0;
		stall_pm=1'b0;

		#5;
		reset=1'b1;
		jmp_loc=4'h0008;
		pc_mux_sel=1'b1;
		stall=1'b0;
		stall_pm=1'b0;

	end

always #5
begin
	clk = ~clk;

end   
      
      
endmodule

