`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:58 08/27/2019 
// Design Name: 
// Module Name:    Register_bank 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Register_bank(ans_ex,ans_wb,imm,mux_sel_A,mux_sel_B,imm_sel,RA,RB,RW_dm,clk,ans_dm,A,B,AR,BR);
input [4:0] RA,RB,RW_dm;
input clk,imm_sel;
input[1:0]mux_sel_A,mux_sel_B;
input [15:0] ans_dm,ans_ex,ans_wb,imm;
output wire [15:0]A,B;
output reg[15:0] AR,BR;
wire [15:0]BI;

reg [15:0] register [31:0];  //creating register bank using 2D array

assign A = (mux_sel_A==2'b00)?AR:(mux_sel_A==2'b01)?ans_ex:(mux_sel_A==2'b10)?ans_dm:(mux_sel_A==2'b11)?ans_wb:16'd0;//multiplexer for selecting A
assign BI = (mux_sel_B==2'b00)?BR:(mux_sel_B==2'b01)?ans_ex:(mux_sel_B==2'b10)?ans_dm:(mux_sel_B==2'b11)?ans_wb:16'd0;   //multiplexer for selecting BI

assign B = (imm_sel==1'b0)?BI:imm; //multiplexer for selecting B or imm

always@(posedge clk)
begin
register[RW_dm]=ans_dm;   
AR = register[RA];  //fetching value at address RA
BR = register[RB];
register[0] = 16'b0000000000001000;
  //fetching value at address RB
         // assigning value of ans_dm in register
//register[RA]=16'b1101000000000000; //assigning value at address RA
//register[RB]=16'b1101000000000000; //assigning value at address RB
end
endmodule