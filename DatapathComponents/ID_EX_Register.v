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
                      JZEROSrc, ID_EX_JZEROSrc,
                      SEMCtrl_in, out_SEMCtrl,
                      in_JALSrc, out_JALSrc,
                      in_SADOp,  out_SADOp,
                      in_rs, out_rs,
                      in_rt, out_rt,
                      in_ZEROsrc, out_ZEROsrc,
                      in_address, out_address
                      );

input Clk, in_ALUSrc, in_RegDst, in_Mem_Write, in_MemRead, in_MemToReg, in_RegWrite, ALUSft, JZEROSrc, in_JALSrc, in_ZEROsrc, in_SADOp;
input [1:0] SEMCtrl_in;
input [31:0] in_ReadData1, in_ReadData2, in_immediate_extended, ZE_in, in_address;
input [4:0] in_rd_i, in_rd_r, in_rs, in_rt;
input [5:0] in_ALUOP;

output reg out_ALUSrc, out_RegDst, out_Mem_Write, out_MemRead, out_MemToReg, out_RegWrite, out_ALUSft, ID_EX_JZEROSrc, out_JALSrc, out_ZEROsrc, out_SADOp;
output reg [1:0] out_SEMCtrl;
output reg [31:0] out_ReadData1, out_ReadData2, out_immediate_extended, ZE_out, out_address;
output reg [4:0] out_rd_i, out_rd_r, out_rs, out_rt;
output reg [5:0] out_ALUOP;

    initial begin
        out_address     <= 0;
        out_ZEROsrc     <= 0;
        out_rs          <= 0;
        out_rt          <= 0;
        out_JALSrc      <= 0;
        out_SEMCtrl     <= 0;
        ID_EX_JZEROSrc  <= 0;
        ZE_out          <= 0;
        out_ALUSft      <= 0;
        out_RegWrite    <= 0;
        out_ALUSrc      <= 0;
        out_ALUOP       <= 0;
        out_RegDst      <= 0;
        out_Mem_Write   <= 0;
        out_MemRead     <= 0;
        out_MemToReg    <= 0;
        out_ReadData1   <= 0;
        out_ReadData2   <= 0;
        out_immediate_extended <= 0;
        out_rd_i        <= 0;
        out_rd_r        <= 0;
        out_SADOp       <= 0;
    end
    
    always @ (posedge Clk)  begin
    
        out_address     <= in_address;
        out_ZEROsrc     <= in_ZEROsrc;
        out_rs          <= in_rs;
        out_rt          <= in_rt;
        out_JALSrc      <= in_JALSrc;
        out_SEMCtrl     <= SEMCtrl_in;
        ID_EX_JZEROSrc  <= JZEROSrc;
        ZE_out          <= ZE_in;
        out_ALUSft      <= ALUSft;
        out_RegWrite    <= in_RegWrite;
        out_ALUSrc      <= in_ALUSrc;
        out_ALUOP       <= in_ALUOP;
        out_RegDst      <= in_RegDst;
        out_Mem_Write   <= in_Mem_Write;
        out_MemRead     <= in_MemRead;
        out_MemToReg    <= in_MemToReg;
        out_ReadData1   <= in_ReadData1;
        out_ReadData2   <= in_ReadData2;
        out_immediate_extended <= in_immediate_extended;
        out_rd_i        <= in_rd_i;
        out_rd_r        <= in_rd_r;
        out_SADOp       <= in_SADOp;
  
    end


endmodule
