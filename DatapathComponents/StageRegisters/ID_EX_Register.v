`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 01:02:38 PM
// Design Name: 
// Module Name: ID_EX_Register
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


module ID_EX_Register(Clk, in_ReadData1, in_ReadData2, in_immediate_extended, in_rd_i, in_rd_r, 
                      in_ALUSrc, in_ALUOP, in_RegDst, in_Mem_Write, in_MemRead, in_MemToReg, in_RegWrite,
                      out_ReadData1, out_ReadData2, out_immediate_extended, out_rd_i, out_rd_r, 
                      out_ALUSrc, out_ALUOP, out_RegDst, out_Mem_Write, out_MemRead, out_MemToReg, out_RegWrite
                      );

input Clk, in_ALUSrc, in_RegDst, in_Mem_Write, in_MemRead, in_MemToReg, in_RegWrite;
input [31:0] in_ReadData1, in_ReadData2, in_immediate_extended;
input [4:0] in_rd_i, in_rd_r;
input [5:0] in_ALUOP;

output reg out_ALUSrc, out_RegDst, out_Mem_Write, out_MemRead, out_MemToReg, out_RegWrite;
output reg [31:0] out_ReadData1, out_ReadData2, out_immediate_extended;
output reg [4:0] out_rd_i, out_rd_r;
output reg [5:0] out_ALUOP;
    
    always @ (posedge Clk)  begin
        out_RegWrite  <= in_RegWrite;
        out_ALUSrc    <= in_ALUSrc;
        out_ALUOP     <= in_ALUOP;
        out_RegDst    <= in_RegDst;
        out_Mem_Write <= in_Mem_Write;
        out_MemRead   <= in_MemRead;
        out_MemToReg  <= in_MemToReg;
        out_ReadData1 <= in_ReadData1;
        out_ReadData2 <= in_ReadData2;
        out_immediate_extended <= in_immediate_extended;
        out_rd_i      <= in_rd_i;
        out_rd_r      <= in_rd_r;
  
    end


endmodule
