`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:58:31 10/04/2019 
// Design Name: 
// Module Name:    prog_memory 
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
module prog_memory(jmp_loc,pc_mux_sel,stall,stall_pm,reset,clk,ins,current_address
    );
input [15:0] jmp_loc;
input pc_mux_sel,stall,stall_pm,reset,clk;
output [31:0] ins;
output [15:0] current_address;
wire [31:0] ins_pm,PM_out;
wire [15:0] CAJ,CAR;
wire [31:0] ins_prv_tmp;
reg [31:0] ins_prv;
reg [15:0] hold_address,next_address;

pm_memory p1(
  .clka(clk), // input clka
  .addra(current_address), // input [15 : 0] addra			//Generating the main memory block for ROM using IP core module
  .douta(PM_out) // output [31 : 0] douta
    );
assign CAJ = (stall==0)?next_address:hold_address;			//Multiplexer for selecting address(current or next) from register.
assign CAR = (pc_mux_sel==0)?CAJ:jmp_loc;						//Multiplexer for selecting jump location or location from the previous multiplexer.
assign current_address = (reset==0)?16'b0:CAR;				//Multiplexer for reseting the address or restores the previous output
assign ins_pm = (stall_pm==0)?PM_out:ins_prv;				//Multiplexer for selecting instruction from memory block or from instruction stored in register
assign ins = (reset==0)?32'b0:ins_pm;							//Multiplexer for reseting the instruction to 0 or restoring the output from the previous multiplexer

always@(posedge clk)
begin
if(reset==0)
begin
  ins_prv<=0;
  hold_address<=0;						//Here, we are givimg the reset condition
  next_address<=0;
end
else
begin
 hold_address<=current_address;
 next_address<=current_address+16'b0000000000000001;		//Here, the values are stored in the register
 ins_prv<=ins;
end
end

endmodule
