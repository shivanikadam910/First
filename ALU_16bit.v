`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:10 08/13/2019 
// Design Name: 
// Module Name:    ALU_16bit 
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
module ALU_16bit(A, B, op_dec, data_in,clk,reset,
ans_ex, DM_data, data_out, flag_ex);

input [15:0] A,B,data_in;
input [5:0] op_dec;
input	clk,reset;

output reg [15:0] ans_ex, DM_data, data_out;
reg [1:0] flag_prv;
output wire [1:0] flag_ex;
wire [15:0] ans_tmp,data_out_buff;
wire[15:0] out;
wire [15:0] z;
wire[31:0] w;
wire c1,c2,b;
wire [15:0]sum,A1,B1,B3;

assign B3 = (op_dec[0]==1'b0) ? B :
					(op_dec[0]==1'b1) ? ~B + 16'b0000000000000001 : B; //taking 2's complement of B
wallace_16bit w1(A,B,w);
assign b = (w[31:16] == 16'b0)?1'b0:1'b1;					
   assign {c1,sum[14:0]}=A[14:0]+B3[14:0];     //15 bit carry c1 excluding MSB
	assign {c2,sum[15]}=A[15]+B3[15]+c1;        //final carry c2      
   assign flag_ex[0]=((op_dec==6'b000000) | (op_dec==6'b000001) | (op_dec==6'b001000) | (op_dec==6'b001001))?c1^c2:(op_dec== 6'b111111)?b:1'b0; //checking overflow condition 

right_shift r1(A,B,out);    //RSA function call

 assign ans_tmp = (op_dec==6'b000000)?sum:					//op code to find sum of two numbers
                  (op_dec==6'b000001)?sum:					//op code to find subtraction of two numbers
						(op_dec==6'b000010)?B:						//op code to get B as output
					   (op_dec==6'b000100)?A&B:					//op code to find AND of the two numbers
						(op_dec==6'b000101)?A|B:					//op code to find OR of the two numbers
						(op_dec==6'b000110)?A^B:					//op code to find XOR of the two numbers
					   (op_dec==6'b000111)?~B:						//op code to find negation of B
						(op_dec==6'b001000)?sum:					//op code to find sum of two numbers
						(op_dec==6'b001001)?sum:					//op code to find subtraction of two numbers
					   (op_dec==6'b001010)?B:						//op code to get B as output
						(op_dec==6'b001100)?A&B:					//op code to find AND of the two numbers
						(op_dec==6'b001101)?A|B:					//op code to find OR of the two numbers
						(op_dec==6'b001110)?A^B:					//op code to find XOR of the two numbers
						(op_dec==6'b001111)?~B:						//op code to find negation of B
					   (op_dec==6'b010000)?ans_ex:				//op code to hold the previous value
						(op_dec==6'b010001)?ans_ex:				//op code to hold the previous value
						(op_dec==6'b010100)?A:						//op code to get answer as A 
					   (op_dec==6'b010101)?A:						//op code to get answer as A
						(op_dec==6'b010110)?data_in:				//op code to get answer as data_in
						(op_dec==6'b010111)?ans_ex:				//op code to hold the previous value
						(op_dec==6'b011000)?ans_ex:				//op code to hold the previous value
						(op_dec==6'b011001)?A<<B:					//op code to find logical left shift of given number
						(op_dec==6'b011010)?A>>B:					//op code to find logical right shift of given number
						(op_dec==6'b011011)?out:
						(op_dec==6'b111111)?w[15:0]:ans_ex;			//op code to find arithmetic right shift of given number 
						
						
	assign flag_ex[1]=(ans_tmp==0)?1'b1:1'b0;             //Assigning Zero flag
	assign data_out_buff = (op_dec==6'b010111)?A:data_out; //External output is A

	always@(posedge clk)
	begin	
	if(reset==0)
	begin
	ans_ex<=0;
	data_out<=0;							//reset conditions for reset=0
	flag_prv<=0;
	DM_data<=0;
	end
	else
	begin
	ans_ex<=ans_tmp;
   data_out <= data_out_buff;    //storing values to register
   flag_prv <= flag_ex;
	DM_data<=B;
	end
end	
endmodule

module right_shift(A1,B1,out);
input signed[15:0]A1;
input [3:0] B1;					//module for arithmetic right shift
output [15:0]out;

assign out=A1>>>B1;


endmodule
