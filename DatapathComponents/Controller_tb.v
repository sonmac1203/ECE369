`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lena Voytek & Mitchell Dzurick
// 
// Create Date: 10/12/2018 11:01:50 AM
// Design Name: 
// Module Name: Controller_tb
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

module Controller_tb();

    reg [31:0] Instruction;
    
    wire ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemToReg;
    wire [5:0] ALUOp;

    Controller c0(  .Instruction(Instruction), 
                    .ALUSrc(ALUSrc), 
                    .RegDst(RegDst), 
                    .RegWrite(RegWrite), 
                    .ALUOp(ALUOp), 
                    .MemRead(MemRead), 
                    .MemWrite(MemWrite), 
                    .MemToReg(MemToReg)
                  );


endmodule


