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


module MEM_WB_Register(Clk, 
                       in_DataMemOut, out_DataMemOut,
                       in_destination_register, out_destination_register,
                       in_ALU1_output, out_ALU1_output,
                       in_MemToReg, out_MemToReg,
                       in_RegWrite, out_RegWrite,
                       in_JALSrc, out_JALSrc);
                       
                       
input Clk, in_MemToReg, in_RegWrite, in_JALSrc;
input [31:0] in_DataMemOut, in_ALU1_output;
input [4:0] in_destination_register;

output reg out_MemToReg, out_RegWrite, out_JALSrc;
output reg [31:0]  out_DataMemOut, out_ALU1_output;
output reg [4:0] out_destination_register;

    initial begin
        out_JALSrc               <= 0;
        out_DataMemOut           <= 0; 
        out_destination_register <= 0; 
        out_ALU1_output          <= 0;
        out_MemToReg             <= 0;
        out_RegWrite             <= 0;
    
    end


    always @ (posedge Clk)  begin
        out_JALSrc               <= in_JALSrc;
        out_DataMemOut           <= in_DataMemOut; 
        out_destination_register <= in_destination_register; 
        out_ALU1_output          <= in_ALU1_output;
        out_MemToReg             <= in_MemToReg;
        out_RegWrite             <= in_RegWrite;
    
    end


endmodule
