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
                      out_ALUSrc, out_ALUOP, out_RegDst, out_Mem_Write, out_MemRead, out_MemToReg, out_RegWrite,
                      ALUSft, out_ALUSft,
                      ZE_in, ZE_out,
                      in_PCplus4, out_PCplus4,
                      in_branch, out_branch,
                      JZEROSrc, ID_EX_JZEROSrc
                      );

input Clk, in_ALUSrc, in_RegDst, in_Mem_Write, in_MemRead, in_MemToReg, in_RegWrite, ALUSft, in_branch, JZEROSrc;
input [31:0] in_ReadData1, in_ReadData2, in_immediate_extended, ZE_in, in_PCplus4;
input [4:0] in_rd_i, in_rd_r;
input [5:0] in_ALUOP;

output reg out_ALUSrc, out_RegDst, out_Mem_Write, out_MemRead, out_MemToReg, out_RegWrite, out_ALUSft, out_branch, ID_EX_JZEROSrc;
output reg [31:0] out_ReadData1, out_ReadData2, out_immediate_extended, ZE_out, out_PCplus4;
output reg [4:0] out_rd_i, out_rd_r;
output reg [5:0] out_ALUOP;

    initial begin
        ID_EX_JZEROSrc <= 0;
        out_branch    <= 0;
        out_PCplus4   <= 0;
        ZE_out        <= 0;
        out_ALUSft    <= 0;
        out_RegWrite  <= 0;
        out_ALUSrc    <= 0;
        out_ALUOP     <= 0;
        out_RegDst    <= 0;
        out_Mem_Write <= 0;
        out_MemRead   <= 0;
        out_MemToReg  <= 0;
        out_ReadData1 <= 0;
        out_ReadData2 <= 0;
        out_immediate_extended <= 0;
        out_rd_i      <= 0;
        out_rd_r      <= 0;
    end
    
    always @ (posedge Clk)  begin
        ID_EX_JZEROSrc <= JZEROSrc;
        out_branch    <= in_branch;
        out_PCplus4   <= in_PCplus4;
        ZE_out        <= ZE_in;
        out_ALUSft    <= ALUSft;
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
