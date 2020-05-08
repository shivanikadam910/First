`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:18 09/03/2019 
// Design Name: 
// Module Name:    stall_control 
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
module stall_control(op,clk,reset,stall,stall_pm);
input [5:0] op;
input clk,reset;
output reg stall_pm;
output stall;
wire jump,ld,hlt;
reg q,q1,q2;
wire p,p1,p2,stall_pm_tmp;

assign jump = (~op[5])&op[4]&op[3]&op[2]&(~q1);							//AND operation for jump coditions where output must be 1 and taking only constant bits of the op code
assign ld = op[4]&op[2]&(~op[1])&(~op[5])&(~op[3])&(~op[0])&(~q2);//AND operation for load stage so that the output is 1 
assign hlt = (op==6'b010001)?1'b1:1'b0;											//AND operation for hault stage so that the output is 1
assign stall= (jump|ld|hlt);													//OR operation so that we get output 1

assign p=(reset==0)?1'b0:jump;													//reset conditions for flip flops
assign p1=(reset==0)?1'b0:q;														//using d flip flops to create delay 
assign p2=(reset==0)?1'b0:ld;
assign stall_pm_tmp=(reset==0)?1'b0:stall;

always@(posedge clk)
begin
	q<=p;																				//assisgning temp variables at positive edge of the clock
	q1<=p1;
	q2<=p2;
	stall_pm<=stall_pm_tmp;
end
endmodule

