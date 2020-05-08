`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:19:19 08/27/2019
// Design Name:   Register_bank
// Module Name:   M:/Lab-20190813T125239Z-001/Lab/Assignment1/Register_bank_tb.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register_bank
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Register_bank_tb;

	// Inputs
	reg [15:0] ans_ex;
	reg [15:0] ans_wb;
	reg [15:0] imm;
	reg [1:0] mux_sel_A;
	reg [1:0] mux_sel_B;
	reg imm_sel;
	reg [4:0] RA;
	reg [4:0] RB;
	reg [4:0] RW_dm;
	reg clk;
	reg [15:0] ans_dm;

	// Outputs
	wire [15:0] A;
	wire [15:0] B;

	// Instantiate the Unit Under Test (UUT)
	Register_bank uut (
		.ans_ex(ans_ex), 
		.ans_wb(ans_wb), 
		.imm(imm), 
		.mux_sel_A(mux_sel_A), 
		.mux_sel_B(mux_sel_B), 
		.imm_sel(imm_sel), 
		.RA(RA), 
		.RB(RB), 
		.RW_dm(RW_dm), 
		.clk(clk), 
		.ans_dm(ans_dm), 
		.A(A), 
		.B(B)
	);
always begin
 #5clk=~clk;
 end
	initial begin
		// Initialize Inputs
		ans_ex = 49152;
		ans_wb = 57344;
		imm = 65535;
		mux_sel_A = 2'b00;
		mux_sel_B = 2'b00;
		imm_sel = 1;
		RA = 5;
		RB = 6;
		clk=0;
		RW_dm = 5'b00111;
		ans_dm = 53248;

		// Wait 100 ns for global reset to finish

        
		#10;
		imm_sel=0;
		mux_sel_A = 2'b10;
		mux_sel_B = 2'b01;
		// Add stimulus here
		
		#10;
		mux_sel_A = 2'b11;
		mux_sel_B = 2'b00;
	end
      
endmodule

