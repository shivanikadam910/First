`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:28:20 09/17/2019 
// Design Name: 
// Module Name:    Dependency_check_block 
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
module Dependency_check_block(ins,clk,reset,imm,op_dec,RW_dm,mux_sel_A,mux_sel_B,imm_sel,
mem_en_ex,mem_rw_ex,mem_mux_sel_dm);
input [31:0]ins;
input clk,reset;
output reg [15:0] imm;
output reg [5:0] op_dec;
output reg[4:0] RW_dm;
output [1:0] mux_sel_A,mux_sel_B;
output reg imm_sel,mem_en_ex,mem_rw_ex,mem_mux_sel_dm;
reg q1,q2,q3,q4,q5;
reg [4:0]reg1,reg2,reg3,reg4,reg5,reg6;
wire [14:0] in_ex,ins_and;

assign JMP = ((~ins[31])&ins[30]&ins[29]&(~ins[28])&(~ins[27])&(~ins[26])); //AND gate for jump
assign Cond_J = ((~ins[31])&ins[30]&(ins[29])&(ins[28]));//AND gate for Conditional Jump
assign LD_fb = ((~ins[31])&ins[30]&(~ins[29])&(ins[28])&(~ins[27])&(~ins[26])&(~q1));//AND gate for Load 
assign Imm = ((~ins[31])&(~ins[30])&ins[29]);//AND gate for Imm
assign LD1 = ((~ins[31])&ins[30]&(~ins[29])&(ins[28])&(~ins[27])&(~ins[26]));//AND gate for LOAD
assign ST = ((~ins[31])&ins[30]&(~ins[29])&(ins[28])&(~ins[27])&(ins[26]));//AND gate for store

always@(posedge clk)
begin
	if(reset==0)
		begin
			q1<=0;
			op_dec<=0;
			imm<=0;
			imm_sel<=0;
			q2<=0;
			mem_rw_ex<=0;
			q3<=0;
			q4<=0;
			mem_en_ex<=0;								//reset conditions
			q5<=0;
			mem_mux_sel_dm<=0;
			reg1<=0;
			reg2<=0;
			reg3<=0;
			reg4<=0;
			reg5<=0;
			reg6<=0;
		end
	else
		begin
			q1 <= LD_fb;
			op_dec <=ins[31:26];
			imm <=ins[15:0];
			imm_sel<=Imm;
			q2<=ins[26];
			mem_rw_ex<=q2;
			q3<=LD1&(~q3);
			q4<=ST;
			mem_en_ex<=(q3|q4);
			q5<=((~q2)&(q3|q4));
			mem_mux_sel_dm<=q5;		//Storing values in register and delaying values
			reg1<=ins_and[14:10];
			reg2<=reg1;
			RW_dm<=reg2;
			//RW_dm<=reg3;
			reg4<=RW_dm;
			reg5<=ins_and[4:0];
			reg6<=ins_and[9:5];
		end
end 

assign in_ex = {15{~(JMP|Cond_J|q1)}}; //OR gate to extend instruction
assign ins_and = ins[25:11]&in_ex;	

assign comp1 = (reg2==reg6)?1'b1:1'b0;
assign comp2 = (RW_dm==reg6)?1'b1:1'b0;
assign comp3 = (reg4==reg6)?1'b1:1'b0;		//Comparator to compare values of registers
assign comp4 = (reg2==reg5)?1'b1:1'b0;
assign comp5 = (RW_dm==reg5)?1'b1:1'b0;
assign comp6 = (reg4==reg5)?1'b1:1'b0;

assign and1 = (~comp1)&comp2;
assign and2 = (~comp1)&(~comp2)&comp3;
assign and3 = (~comp4)&comp5;						//And gates for comparators
assign and4 = (~comp4)&(~comp5)&comp6;

assign mux_sel_A=(and2==1)?2'b11:(and1==1)?2'b10:(comp1==1)?2'b01:2'b00;//Priority Encoder for mux_sel_A 
assign mux_sel_B=(and4==1)?2'b11:(and3==1)?2'b10:(comp4==1)?2'b01:2'b00;//Priority Encoder for mux_sel_B

endmodule
