`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:55:17 08/27/2019
// Design Name:   Data_memory
// Module Name:   M:/Lab-20190813T125239Z-001/Lab/Assignment1/Data_memory_tb.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Data_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Data_memory_tb;

	// Inputs
	reg [15:0] ans_ex;
	reg [15:0] DM_data;
	reg mem_rw_ex;
	reg mem_en_ex;
	reg mem_mux_sel_dm;
	reg reset;
	reg clk;

	// Outputs
	wire [15:0] ans_dm;

	// Instantiate the Unit Under Test (UUT)
	Data_memory uut (
		.ans_ex(ans_ex), 
		.DM_data(DM_data), 
		.mem_rw_ex(mem_rw_ex), 
		.mem_en_ex(mem_en_ex), 
		.mem_mux_sel_dm(mem_mux_sel_dm), 
		.reset(reset), 
		.clk(clk), 
		.ans_dm(ans_dm)
	);
always begin
#5clk=~clk;
end
	initial begin
		// Initialize Inputs
		ans_ex =16'h0003 ;
		DM_data = 16'hffff;
		mem_rw_ex = 0;
		mem_en_ex = 0;
		mem_mux_sel_dm = 0;
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#2;
		reset=0;
		
		#6;
		reset=1;
		
		#2;
	   mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		
		#10;
		mem_rw_ex = 1;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
		
		#10;
		mem_rw_ex = 0;
		mem_en_ex = 1;
		mem_mux_sel_dm = 1;
        
		// Add stimulus here

	end
      
endmodule

