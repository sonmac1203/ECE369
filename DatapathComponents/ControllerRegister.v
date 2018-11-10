`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2018 02:58:08 PM
// Design Name: 
// Module Name: ControllerRegister
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


module ControllerRegister(Hazard, 
                        in_ALUSrc,      out_ALUSrc, 
                        in_RegDst,      out_RegDst,
                        in_RegWrite,    out_RegWrite,
                        in_ALUOp,       out_ALUOp,
                        in_MemRead,     out_MemRead,
                        in_MemWrite,    out_MemWrite,
                        in_MemToReg,    out_MemToReg,
                        in_ALUSft,      out_ALUSft,
                        in_ZEROSrc,     out_ZEROSrc,
                        in_branch,      out_branch,
                        in_JalSrc,      out_JalSrc,
                        in_JZEROSrc,    out_JZEROSrc,
                        in_SEMCtrl,     out_SEMCtrl,
                        in_JRSrc,        out_JRSrc
                        );

    input Hazard,in_ALUSrc, in_RegDst, in_RegWrite, in_ALUOp, in_MemRead, in_MemWrite,
            in_MemToReg, in_ALUSft, in_ZEROSrc, in_branch, in_JalSrc, in_JZEROSrc, in_SEMCtrl, in_JRSrc; 
    output reg out_ALUSrc, out_RegDst, out_RegWrite, out_ALUOp, out_MemRead, out_MemWrite, out_MemToReg, 
                out_ALUSft, out_ZEROSrc, out_branch, out_JalSrc, out_JZEROSrc, out_SEMCtrl, out_JRSrc;
    
    
    initial begin
        out_ALUSrc      <= 0;
        out_RegDst      <= 0;
        out_RegWrite    <= 0;
        out_ALUOp       <= 0;
        out_MemRead     <= 0;
        out_MemWrite    <= 0;
        out_MemToReg    <= 0;
        out_ALUSft      <= 0;
        out_ZEROSrc     <= 0;
        out_branch      <= 0;
        out_JalSrc      <= 0;
        out_JZEROSrc    <= 0;
        out_SEMCtrl     <= 0;
        out_JRSrc       <= 0;
    end

    always @ (*)    begin
    
        if  (Hazard)    begin
            out_ALUSrc      <= 0;
            out_RegDst      <= 0;
            out_RegWrite    <= 0;
            out_ALUOp       <= 0;
            out_MemRead     <= 0;
            out_MemWrite    <= 0;
            out_MemToReg    <= 0;
            out_ALUSft      <= 0;
            out_ZEROSrc     <= 0;
            out_branch      <= 0;
            out_JalSrc      <= 0;
            out_JZEROSrc    <= 0;
            out_SEMCtrl     <= 0;
            out_JRSrc       <= 0;
        end
        else    begin
            out_ALUSrc      <= in_ALUSrc;
            out_RegDst      <= in_RegDst;
            out_RegWrite    <= in_RegWrite;
            out_ALUOp       <= in_ALUOp;
            out_MemRead     <= in_MemRead;
            out_MemWrite    <= in_MemWrite;
            out_MemToReg    <= in_MemToReg;
            out_ALUSft      <= in_ALUSft;
            out_ZEROSrc     <= in_ZEROSrc;
            out_branch      <= in_branch;
            out_JalSrc      <= in_JalSrc;
            out_JZEROSrc    <= in_JZEROSrc;
            out_SEMCtrl     <= in_SEMCtrl;
            out_JRSrc       <= in_JRSrc;

        end
        
    end


endmodule
