`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/14/2018 01:02:59 PM
// Design Name:
// Module Name: EX_MEM_Register
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


module EX_MEM_Register(Clk, in_ALU_out, in_ReadData_2, in_dest_reg, in_MemWrite, in_MemRead, in_MemToReg, in_RegWrite,
                        out_ALU_out, out_ReadData_2, out_dest_reg, out_MemWrite, out_MemRead, out_MemToReg, out_RegWrite,
                        in_adder_1, out_adder_1,
                        in_branch, out_branch,
                        in_zero,   out_zero,
                        in_SEMCtrl, out_SEMCtrl,
                        in_JLAdder, out_JLAdder,
                        in_JALSrc, out_JALSrc);


//module EX_MEM_Register(Clkc
//                       in_ALU_out       , out_ALU_out,
//                       in_ReadData_2    , out_ReadData_2,
//                       in_dest_reg      , out_dest_reg,
//                       in_MemWrite      , out_MemWrite,
//                       in_MemRead       , out_MemRead,
//                       in_MemToReg      , out_MemToReg,
//                       in_RegWrite      , out_RegWrite,
//                       in_adder_1       , out_adder_1,
//                       in_branch        , out_branch,
//                       in_zero          , out_zero,
//                       in_SEMCtrl       , out_SEMCtrl,
//                       in_JLAdder       , out_JLAdder,
//                       in_JALSrc        , out_JALSrc);




input Clk, in_MemWrite, in_MemRead, in_MemToReg, in_RegWrite, in_branch, in_zero, in_JALSrc;
input [1:0] in_SEMCtrl;
input [31:0] in_ALU_out, in_ReadData_2, in_adder_1, in_JLAdder;
input [4:0] in_dest_reg;

output reg out_MemWrite, out_MemRead, out_MemToReg, out_RegWrite, out_branch, out_zero, out_JALSrc;
output reg [1:0] out_SEMCtrl;
output reg [31:0] out_ALU_out, out_ReadData_2, out_adder_1, out_JLAdder;
output reg [4:0] out_dest_reg;

    initial begin
        out_JALSrc     <= 0;
        out_JLAdder    <= 0;
        out_SEMCtrl    <= 0;
        out_zero       <= 0;
        out_adder_1    <= 0;
        out_branch     <= 0;
        out_ALU_out    <= 0;
        out_ReadData_2 <= 0;
        out_dest_reg   <= 0;
        out_MemWrite   <= 0;
        out_MemRead    <= 0;
        out_MemToReg   <= 0;
        out_RegWrite   <= 0;
    end



    always @ (posedge Clk)  begin
        out_JALSrc     <= in_JALSrc;
        out_JLAdder    <= in_JLAdder;
        out_SEMCtrl    <= in_SEMCtrl;
        out_zero       <= in_zero;
        out_adder_1    <= in_adder_1;
        out_branch     <= in_branch;
        out_ALU_out    <= in_ALU_out;
        out_ReadData_2 <= in_ReadData_2;
        out_dest_reg   <= in_dest_reg;
        out_MemWrite   <= in_MemWrite;
        out_MemRead    <= in_MemRead;
        out_MemToReg   <= in_MemToReg;
        out_RegWrite   <= in_RegWrite;
    end


endmodule
