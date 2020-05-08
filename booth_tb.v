`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:50:41 12/08/2019
// Design Name:   booth
// Module Name:   D:/clg/CO_lab/Assignment1/booth_tb.v
// Project Name:  Assignment1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: booth
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module booth_tb;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;
	reg clk;

	// Outputs
	wire [15:0] Z;
	wire [5:0] temp;

	// Instantiate the Unit Under Test (UUT)
	booth uut (
		.A(A), 
		.B(B), 
		.clk(clk), 
		.Z(Z), 
		.temp(temp)
	);
always begin
#5 clk=~clk;
end
	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        A=255;
		  B=255;
		// Add stimulus here

	end
      
endmodule

