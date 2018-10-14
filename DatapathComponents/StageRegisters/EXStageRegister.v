`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 12:35:25 PM
// Design Name: 
// Module Name: EXStageRegister
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


module EXStageRegister(Clk, in_ALUSrc, in_ALUOP, in_RegDst, out_ALUSrc, out_ALUOP, out_RegDst);

    input  in_ALUSrc, in_ALUOP, in_RegDst, Clk;
    output reg out_ALUSrc, out_ALUOP, out_RegDst;

    always @ (posedge Clk)  begin
        out_ALUSrc <= in_ALUSrc;
        out_ALUOP <= in_ALUOP;
        out_RegDst <= in_RegDst;
    end


endmodule
