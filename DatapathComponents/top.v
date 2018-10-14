`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2018 12:05:08 PM
// Design Name: 
// Module Name: top
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


module top(Clk, PC_Reset, Clk_Reset);


input Clk, PC_Reset, Clk_Reset;

wire    Clk_out,
        ALUSrc, 
        RegDst, 
        RegWrite, 
        ALUOp, 
        MemRead,
        ID_EX_ALUSrc, 
        ID_EX_ALUOp, 
        ID_EX_RegDst, 
        ID_EX_MemWrite, 
        ID_EX_MemRead, 
        ID_EX_MemToReg, 
        ID_EX_RegWrite,
        MemWrite, 
        MemToReg;

wire[31:0]  IFU_Instruction_out, 
            IF_ID_Instruction_out,
            SE_out,
            ReadData1_out, 
            ReadData2_out,
            ID_EX_SE_out,
            ID_EX_ReadData2_out,
            ID_EX_ReadData1_out;
            
wire [4:0]  ID_EX_out_rd_i,
            ID_EX_out_rd_r;


    ClkDiv CD1(Clk, Clk_Reset, Clk_out);

    //module InstructionFetchUnit(Reset, Clk, Instruction);
    InstructionFetchUnit IF_1(PC_Reset, Clk_out, IFU_Instruction_out);
    
        
    //module IF_ID_Register(Clk, in_Instruction, out_Instruction);
    IF_ID_Register IFIDReg_1(Clk_out, IFU_Instruction_out, IF_ID_Instruction_out);
    
    
    //module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
    RegisterFile R_1(IF_ID_Instruction_out[25:21], IF_ID_Instruction_out[20:16], reg_dst_wb, MUX2_out, Clk_out, ReadData1_out, ReadData2_out);
    
    
    //module SignExtension(in, out);
    SignExtension SE_1(IF_ID_Instruction_out[15:0], SE_out);
    
    
    
    //module Controller(Instruction, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg);
    Controller Co_1(IF_ID_Instruction_out, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg);
    
    
    //module ID_EX_Register(Clk, in_ReadData1, in_ReadData2, in_immediate_extended, in_rd_i, in_rd_r, 
    //                      in_ALUSrc, in_ALUOP, in_RegDst, in_Mem_Write, in_MemRead, in_MemToReg, in_RegWrite,
    
    //                      out_ReadData1, out_ReadData2, out_immediate_extended, out_rd_i, out_rd_r, 
    //                      out_ALUSrc, out_ALUOP, out_RegDst, out_Mem_Write, out_MemRead, out_MemToReg, out_RegWrite
    //                      );
    ID_EX_Register ID_EX_1(Clk_out, ReadData1_out, ReadData2_out, SE_out, IF_ID_Instruction_out[20:16], IF_ID_Instruction_out[15:11],
                            ALUSrc, ALUOp, RegDst, MemWrite, MemRead, MemToReg, RegWrite,
                            
                            ID_EX_ReadData1_out, ID_EX_ReadData2_out, ID_EX_SE_out, ID_EX_out_rd_i, ID_EX_out_rd_r,
                            ID_EX_ALUSrc, ID_EX_ALUOp, ID_EX_RegDst, ID_EX_MemWrite, ID_EX_MemRead, ID_EX_MemToReg, ID_EX_RegWrite,

    );
    
    
    
    
    
    
        
    
        

        
        
        
endmodule
