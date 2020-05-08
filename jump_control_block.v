`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:35 09/10/2019 
// Design Name: 
// Module Name:    jump_control_block 
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

module jump_control_block(jmp_address_pm,current_address, op, flag_ex,interrupt,clk, reset,jmp_loc,pc_mux_sel
    );
input [15:0] jmp_address_pm,current_address;
input [5:0] op;
input [1:0] flag_ex;
input interrupt,clk, reset;
output wire [15:0] jmp_loc;
output pc_mux_sel;
wire jnv, jv, jz, jnz, jmp, ret;
wire [1:0] flag_tmp,  flag_mux;
wire [15:0] jmp_address_pm_out, next_address;
wire [15:0] pc_counter_mux;
reg [15:0] current_address_tmp;
reg [1:0] flag_ex_tmp;
reg jmp_address_pm_sel, flag_ex_sel;

assign jv =(~op[5] & op[4] & op[3] & op[2] & ~op[1] & ~op[0]);
assign jnv = (~op[5] & op[4] & op[3] & op[2] & ~op[1] & op[0]);
assign jz = (~op[5] & op[4] & op[3] & op[2] & op[1] & ~op[0]);
assign jnz = (~op[5] & op[4] & op[3] & op[2] & op[1] & op[0]);
assign jmp = (~op[5] & op[4] & op[3] & ~op[2] & ~op[1] & ~op[0]);
assign ret = (~op[5] & op[4] & ~op[3] & ~op[2] & ~op[1] & ~op[0]);

always@(posedge clk)
begin

	if(reset == 1'b0)
	begin
	jmp_address_pm_sel <=0;
	flag_ex_sel	<= 0;
	end
	
	else
	begin
	jmp_address_pm_sel <= interrupt;
	flag_ex_sel	<= jmp_address_pm_sel;
	end
	
end

assign w1 = jv & flag_tmp[0];
assign w2 = jnv & ~flag_tmp[0];
assign w3 = jz & flag_tmp[1];
assign w4 = jnz & ~flag_tmp[1];
assign next_address = current_address + 16'b0000000000000001;

assign pc_mux_sel = (w1|w2|w3|w4|ret|jmp|jmp_address_pm_sel);

assign pc_counter_mux = ( interrupt == 0) ? current_address_tmp : next_address;

assign jmp_address_pm_out = (jmp_address_pm_sel == 0) ? jmp_address_pm : 16'b1111000000000000; 

assign jmp_loc = (ret == 1'b0) ? jmp_address_pm_out : current_address_tmp; 

assign flag_mux = (flag_ex_sel == 1'b0) ? flag_ex_tmp : flag_ex;

assign flag_tmp = (ret == 1'b0) ? flag_ex : flag_ex_tmp;

always@(posedge clk)
begin
if(reset == 1'b0)
begin
current_address_tmp <= 0;
flag_ex_tmp <= 0;
end
else
begin
current_address_tmp <= pc_counter_mux;
flag_ex_tmp <= flag_mux;
end
end

endmodule
