`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 01:03:17 PM
// Design Name: 
// Module Name: MEM_WB_Register
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MEM_WB_Register(Clk, in_DataMemOut, in_destination_register, in_ALU1_output, in_MemToReg, in_RegWrite,
                       out_DataMemOut, out_destination_register, out_ALU1_output, out_MemToReg, out_RegWrite);
                       
                       
input Clk, in_MemToReg, in_RegWrite;
input [31:0] in_DataMemOut, in_ALU1_output;
input [4:0] in_destination_register;

output reg out_MemToReg, out_RegWrite;
output reg [31:0]  out_DataMemOut, out_destination_register, out_ALU1_output;
output reg [4:0] out_destination_register;

    always @ (posedge Clk)  begin
        out_DataMemOut           <= in_DataMemOut; 
        out_destination_register <= in_destination_register; 
        out_ALU1_output          <= in_ALU1_output;
        out_MemToReg             <= in_MemToReg;
        out_RegWrite             <= in_RegWrite;
    
    end


endmodule
