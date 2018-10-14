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
        ALU1_zero,
        MemWrite,
        EX_MEM__MemWrite,
        EX_MEM__MemRead,
        EX_MEM__MemToReg,
        EX_MEM__RegWrite,
        MEM_WB_MemToReg,
        MEM_WB_RegWrite,
        MemToReg;

wire[31:0]  IFU_Instruction_out, 
            IF_ID_Instruction_out,
            SE_out,
            ReadData1_out, 
            ReadData2_out,
            Mux1_out,
            Mux2_out,
            LO_in, 
            LO_out, 
            HI_in, 
            HI_out,
            ALU1_out,
            EX_MEM_ALU_out,
            EX_MEM_ReadData_2,
            ID_EX_SE_out,
            ID_EX_ReadData2_out,
            ID_EX_ReadData1_out,
            MEM_WB_ALU1_output,
            MEM_WB_DataMemOut,
            Mux3_out,
            DataMem_out;
            
wire [4:0]  ID_EX_out_rd_i,
            ID_EX_out_rd_r,
            EX_MEM_dest_reg,
            MEM_WB_destination_register;





    ClkDiv CD1(Clk, Clk_Reset, Clk_out);

    //module InstructionFetchUnit(Reset, Clk, Instruction);
    InstructionFetchUnit IF_1(PC_Reset, Clk_out, IFU_Instruction_out);
    
        
    //module IF_ID_Register(Clk, in_Instruction, out_Instruction);
    IF_ID_Register IFIDReg_1(Clk_out, IFU_Instruction_out, IF_ID_Instruction_out);
    
    
    //module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2);
    RegisterFile R_1(IF_ID_Instruction_out[25:21], IF_ID_Instruction_out[20:16], MEM_WB_destination_register, Mux3_out, MEM_WB_RegWrite,
                     Clk_out, ReadData1_out, ReadData2_out);
    
    
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
    
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 Mux1(Mux1_out, ID_EX_ReadData2_out, ID_EX_SE_out, ID_EX_ALUSrc);
    
    Mux32Bit2To1 Mux2(Mux2_out, ID_EX_out_rd_i, ID_EX_out_rd_r, ID_EX_RegDst);
    
    
    //module HI_LO_Registers(HI_in, LO_in, HI_out, LO_out);
    HI_LO_Registers(HI_in, LO_in, HI_out, LO_out);

    
    //module ALU32Bit(ALUControl, A, B, ALUResult, Zero, LO_in, LO_out, HI_in, HI_out);
    ALU32Bit ALU1(ID_EX_ALUOp, ID_EX_ReadData1_out, Mux1_out, ALU1_out,ALU1_zero, LO_in, LO_out, HI_in, HI_out);
    
    
    
    
    //module EX_MEM_Register(Clk, in_ALU_out, in_ReadData_2, in_dest_reg, in_MemWrite, in_MemRead, in_MemToReg, in_RegWrite,
    //                        out_ALU_out, out_ReadData_2, out_dest_reg, out_MemWrite, out_MemRead, out_MemToReg, out_RegWrite);
    EX_MEM_Register EX_MEM_1(Clk_out, ALU1_out, ID_EX_ReadData2_out, Mux2_out, ID_EX_MemWrite, ID_EX_MemRead, ID_EX_MemToReg, ID_EX_RegWrite,
                             EX_MEM_ALU_out, EX_MEM_ReadData_2, EX_MEM_dest_reg, EX_MEM__MemWrite, EX_MEM__MemRead, EX_MEM__MemToReg, EX_MEM__RegWrite);
        
        
    //module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 
    DataMemory DM_1(EX_MEM_ALU_out, EX_MEM__MemWrite, EX_MEM__MemRead, DataMem_out);
    
    
    
    //module MEM_WB_Register(Clk, in_DataMemOut, in_destination_register, in_ALU1_output, in_MemToReg, in_RegWrite,
    //                       out_DataMemOut, out_destination_register, out_ALU1_output, out_MemToReg, out_RegWrite);
    MEM_WB_Register MEM_WB_1(Clk_out, DataMem_out, EX_MEM_dest_reg, EX_MEM_ALU_out, EX_MEM__MemToReg, EX_MEM__RegWrite,
                             MEM_WB_DataMemOut, MEM_WB_destination_register, MEM_WB_ALU1_output, MEM_WB_MemToReg, MEM_WB_RegWrite
                             );
    
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 Mux3(Mux3_out, MEM_WB_DataMemOut, MEM_WB_ALU1_output, MEM_WB_MemToReg);
    
    
    
    
    
        
        
endmodule
