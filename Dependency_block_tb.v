`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:40:55 09/17/2019
// Design Name:   Dependency_check_block
// Module Name:   M:/Lab-20190813T125239Z-001/Lab/Assignment1/Dependency_block_tb.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Dependency_check_block
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Dependency_block_tb;

	// Inputs
	reg [31:0] ins;
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] imm;
	wire [5:0] op_dec;
	wire [4:0] RW_dm;
	wire [1:0] mux_sel_A;
	wire [1:0] mux_sel_B;
	wire imm_sel;
	wire mem_en_ex;
	wire mem_rw_ex;
	wire mem_mux_sel_dm;

	// Instantiate the Unit Under Test (UUT)
	Dependency_check_block uut (
		.ins(ins), 
		.clk(clk), 
		.reset(reset), 
		.imm(imm), 
		.op_dec(op_dec), 
		.RW_dm(RW_dm), 
		.mux_sel_A(mux_sel_A), 
		.mux_sel_B(mux_sel_B), 
		.imm_sel(imm_sel), 
		.mem_en_ex(mem_en_ex), 
		.mem_rw_ex(mem_rw_ex), 
		.mem_mux_sel_dm(mem_mux_sel_dm)
	);

always begin
#5clk=~clk;
end
	initial begin
		// Initialize Inputs
		ins = 32'b000000_00001_00010_00011_00000000000;
		clk = 0;
		reset = 1;
		
		#2;
		reset=0;
		
		#6;
		reset=1;
		// Wait 100 ns for global reset to finish
		#2;
		
		#10;
		ins = 32'b010100_00100_00001_00000_00000000000;
		#20;
		ins = 32'b000100_00101_00001_00100_00000000000;
		#10;
		ins = 32'b001101_00110_00001_00000_00000000101;
		
		// Add stimulus here

	end
      
endmodule

