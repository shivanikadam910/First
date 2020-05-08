`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:31 10/01/2019 
// Design Name: 
// Module Name:    top 
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
module top(data_in,clk,interrupt,reset,data_out);
input[15:0] data_in;
input clk,reset,interrupt;
output[15:0] data_out;
wire [31:0] ins;
wire [15:0] A;
wire [15:0] B;
wire [15:0] Current_Address;
wire [15:0] ans_ex;
wire [15:0] ans_dm;
wire[15:0] ans_wb;
wire [1:0] mux_sel_A;
wire [1:0] mux_sel_B;
wire imm_sel;
wire [15:0] AR,BR;
wire [5:0] op_dec;
wire [4:0] RA ;
wire [4:0] RB ;
wire [4:0] RW_dm;


wire [15:0] DM_data, imm, jmp_address_pm, jmp_loc;
wire  [1:0] flag_ex;
//wire [5:0] op_dec; 

wire interrupt, pc_mux_sel, stall, stall_pm;
wire mem_rw_ex, mem_en_ex, mem_mux_sel_dm;

//assign op_dec = ins[31:26];
assign RB = ins[15:11];
assign RA = ins [20:16];
assign jmp_address_pm = ins[15:0]; 

ALU_16bit a1(A, B, op_dec, data_in,clk,reset,ans_ex, DM_data, data_out, flag_ex);		//ALU block
Data_memory a2(ans_ex,DM_data,mem_rw_ex,mem_en_ex,mem_mux_sel_dm,reset,clk,ans_dm);		// Data memory block
Dependency_check_block a7(ins,clk,reset,imm,op_dec,RW_dm,mux_sel_A,mux_sel_B,imm_sel,mem_en_ex,mem_rw_ex,mem_mux_sel_dm); //Dependency block	
jump_control_block a4(jmp_address_pm,Current_Address, ins[31:26], flag_ex,interrupt,clk, reset,jmp_loc,pc_mux_sel); // jump control block
prog_memory a8(jmp_loc,pc_mux_sel,stall,stall_pm,reset,clk,ins,Current_Address); // Program memory block
Register_bank a3(ans_ex,ans_wb,imm,mux_sel_A,mux_sel_B,imm_sel,RA,RB,RW_dm,clk,ans_dm,A,B,AR,BR); //Register bank block
stall_control a5(ins[31:26],clk,reset,stall,stall_pm); //Stall control block
write_back a6(ans_dm,clk,reset,ans_wb); // Write back block



endmodule
