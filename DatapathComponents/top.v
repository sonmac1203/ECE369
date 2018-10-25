`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mitchell Dzurick & Lena Voytek
// 
// Percent Effort: 50% - 50%
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


module top(Clk, PC_Reset, Clk_Reset, debug_program_counter, debug_write_data,debug_HI, debug_LO);


input Clk, PC_Reset, Clk_Reset;

//output reg [31:0] debug_program_counter, debug_write_data,debug_HI, debug_LO;

output  [31:0]  debug_program_counter,
                    debug_write_data,
                    debug_HI,
                    debug_LO;

integer hard31 = 31;

wire    Clk_out,
        ALUSrc, 
        RegDst, 
        RegWrite, 
        MemRead,
        ID_EX_ALUSrc, 
        ID_EX_RegDst, 
        ID_EX_MemWrite, 
        ID_EX_MemRead, 
        ID_EX_MemToReg, 
        ID_EX_RegWrite,
        ALU1_zero,
        MemWrite,
        ALUSft, 
        ID_EX_ALUSft,
        EX_MEM__MemWrite,
        EX_MEM__MemRead,
        EX_MEM__MemToReg,
        EX_MEM__RegWrite,
        MEM_WB_MemToReg,
        MEM_WB_RegWrite,
        ZEROSrc,
        ID_EX_branch,
        EX_MEM_branch,
        branch,
        EX_MEM_ALUZero,
        AND1_out,
        JalSrc,
        MemToReg;

wire[31:0]  IFU_Instruction_out, 
            IF_ID_Instruction_out,
            SE_out,
            ReadData1_out, 
            ReadData2_out,
            Mux1_out,
            LO_in, 
            LO_out, 
            HI_in, 
            HI_out,
            Mux4_out,
            ALU1_out,
            EX_MEM_ALU_out,
            EX_MEM_ReadData_2,
            ID_EX_SE_out,
            ID_EX_ReadData2_out,
            ID_EX_ReadData1_out,
            MEM_WB_ALU1_output,
            MEM_WB_DataMemOut,
            Mux3_out,
            IM_out,
            DataMem_out,
            PCAdder_out,
            SE1_out,
            PCResult,
            ZE_out,
            Mux5_out,
            SE2_out,
            IF_ID_address,
            ID_EX_address,
            Adder_1_out,
            EX_MEM_Adder_1,
            mux6_out,
            mux7_out,
            ID_EX_ZE;
            
wire [4:0]  ID_EX_out_rd_i,
            ID_EX_out_rd_r,
            EX_MEM_dest_reg,
            MEM_WB_destination_register,
            Mux2_out;

wire [5:0]  ALUOp,
            ID_EX_ALUOp;
            
            
//(* mark_debug = "true" *)  wire [31:0]  debug_program_counter,
//                                        debug_write_data,
//                                        debug_HI,
//                                        debug_LO;


    /*
     ____ _____  _    ____ _____ 
    / ___|_   _|/ \  |  _ \_   _|
    \___ \ | | / _ \ | |_) || |  
     ___) || |/ ___ \|  _ < | |  
    |____/ |_/_/   \_\_| \_\|_|  
    
    */  
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 Mux6(mux6_out, PCAdder_out, EX_MEM_Adder_1, AND1_out);
    
    
    ClkDiv CD1(Clk, Clk_Reset, Clk_out);
    
    //module ProgramCounter(Address, PCResult, Reset, Clk, debug_program_counter);
    ProgramCounter PC(mux6_out, PCResult, PC_Reset, Clk_out, debug_program_counter);
        
    //module PCAdder(PCResult, PCAddResult)
    PCAdder PCAdd(PCResult, PCAdder_out);
            
    //module InstructionMemory(Address, Instruction); 
    InstructionMemory IM(PCResult, IM_out);

    /*
        ___ _____      __  ___ ____  
       |_ _|  ___|    / / |_ _|  _ \ 
        | || |_      / /   | || | | |
        | ||  _|    / /    | || |_| |
       |___|_|     /_/    |___|____/ 
    
    */
    
        
//    module IF_ID_Register(Clk, 
//                          in_Instruction, out_Instruction,
//                          in_PCplus4, out_PCplus4);
    IF_ID_Register IFID_Reg_1(Clk_out, 
                              IM_out, IF_ID_Instruction_out, 
                              PCAdder_out, IF_ID_address);

    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 Mux7(mux7_out, hard31, MEM_WB_destination_register, JalSrc);
    
    
    
    //module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2, debug_write_data);
    RegisterFile Register_1(IF_ID_Instruction_out[25:21], IF_ID_Instruction_out[20:16], mux7_out, Mux3_out, MEM_WB_RegWrite,
                     Clk_out, ReadData1_out, ReadData2_out, debug_write_data);    
    
    //module SignExtension(in, out);
    SignExtension SignExtend32_1(IF_ID_Instruction_out[15:0], SE_out);
    
    
    //module ZeroExtension(in, out);
    ZeroExtension ZeroExtension_1(IF_ID_Instruction_out[15:0], ZE_out);
    
    
    
    //module Controller(Instruction, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg);
    Controller Co_1(IF_ID_Instruction_out, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg, ALUSft, ZEROSrc, branch, JalSrc);
    
    
    
    
       /* 
        ___ ____       __  _______  __
       |_ _|  _ \     / / | ____\ \/ /
        | || | | |   / /  |  _|  \  / 
        | || |_| |  / /   | |___ /  \ 
       |___|____/  /_/    |_____/_/\_\
    
        */
    
    
//module ID_EX_Register(Clk, in_ReadData1, in_ReadData2, in_immediate_extended, in_rd_i, in_rd_r, 
//                              in_ALUSrc, in_ALUOP, in_RegDst, in_Mem_Write, in_MemRead, in_MemToReg, in_RegWrite,
//                              out_ReadData1, out_ReadData2, out_immediate_extended, out_rd_i, out_rd_r, 
//                              out_ALUSrc, out_ALUOP, out_RegDst, out_Mem_Write, out_MemRead, out_MemToReg, out_RegWrite,
//                              ALUSft, out_ALUSft,
//                              ZE_in, ZE_out,
//                              in_PCplus4, out_PCplus4,
//                              in_branch, out_branch
//                              );
    ID_EX_Register ID_EX_1(Clk_out, ReadData1_out, ReadData2_out, SE_out, IF_ID_Instruction_out[20:16], IF_ID_Instruction_out[15:11],
                            ALUSrc, ALUOp, RegDst, MemWrite, MemRead, MemToReg, RegWrite,
                            ID_EX_ReadData1_out, ID_EX_ReadData2_out, ID_EX_SE_out, ID_EX_out_rd_i, ID_EX_out_rd_r,
                            ID_EX_ALUSrc, ID_EX_ALUOp, ID_EX_RegDst, ID_EX_MemWrite, ID_EX_MemRead, ID_EX_MemToReg, ID_EX_RegWrite,
                            ALUSft, ID_EX_ALUSft,
                            ZE_out, ID_EX_ZE,
                            IF_ID_address, ID_EX_address,
                            branch, ID_EX_branch
                            );
    
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 Mux1(Mux1_out, ID_EX_ReadData2_out, Mux5_out, ID_EX_ALUSrc);
    
    
    //module Mux5Bit2To1(out, inA, inB, sel);
    Mux5Bit2To1 Mux2(Mux2_out, ID_EX_out_rd_i, ID_EX_out_rd_r, ID_EX_RegDst);
    
    
    Mux32Bit2To1 Mux5(Mux5_out, ID_EX_SE_out, ID_EX_ZE, ZEROSrc);
    
    
    
    //module HI_LO_Registers(HI_in, LO_in, HI_out, LO_out, debug_HI, debug_LO);
    HI_LO_Registers HI_LO_REG1(Clk_out, HI_in, LO_in, HI_out, LO_out, debug_HI, debug_LO);
    
    
    //module SignExtend5To32(in, out);
    SignExtend5To32 SignExtend5_1(Mux5_out[10:6], SE1_out);
    
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 Mux4(Mux4_out, ID_EX_ReadData1_out, SE1_out, ALUSft);
    
    
    
    //module ALU32Bit(ALUControl, A, B, ALUResult, Zero, LO_in, LO_out, HI_in, HI_out);
    ALU32Bit ALU1(ID_EX_ALUOp, Mux4_out, Mux1_out, ALU1_out,ALU1_zero, LO_out, LO_in, HI_out, HI_in);
    
    
    
    //module ShiftLeft2(in, out);
    ShiftLeft2 shiftleftby2_1(ID_EX_SE_out, SE2_out);
    
    
    //module Adder(A, B, out);
    Adder Adder_1(ID_EX_address, SE2_out, Adder_1_out);
    
    
    
    
    
   /* 
    _______  __     __  __  __ _____ __  __ 
   | ____\ \/ /    / / |  \/  | ____|  \/  |
   |  _|  \  /    / /  | |\/| |  _| | |\/| |
   | |___ /  \   / /   | |  | | |___| |  | |
   |_____/_/\_\ /_/    |_|  |_|_____|_|  |_|

    */
    
    
//module EX_MEM_Register(Clk, in_ALU_out, in_ReadData_2, in_dest_reg, in_MemWrite, in_MemRead, in_MemToReg, in_RegWrite,
//                            out_ALU_out, out_ReadData_2, out_dest_reg, out_MemWrite, out_MemRead, out_MemToReg, out_RegWrite,
//                            in_adder_1, out_adder_1,
//                            in_branch, out_branch,
//                            in_zero,   out_zero);
    EX_MEM_Register EX_MEM_1(Clk_out, ALU1_out, ID_EX_ReadData2_out, Mux2_out, ID_EX_MemWrite, ID_EX_MemRead, ID_EX_MemToReg, ID_EX_RegWrite,
                             EX_MEM_ALU_out, EX_MEM_ReadData_2, EX_MEM_dest_reg, EX_MEM__MemWrite, EX_MEM__MemRead, EX_MEM__MemToReg, EX_MEM__RegWrite,
                             Adder_1_out, EX_MEM_Adder_1,
                             ID_EX_branch, EX_MEM_branch,
                             ALU1_zero, EX_MEM_ALUZero);
        
    //module AND(Input_A, Input_B, Output);
    AND AND1(EX_MEM_branch, EX_MEM_ALUZero, AND1_out);
        
        
        
    //module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 
    DataMemory DM_1(EX_MEM_ALU_out, EX_MEM_ReadData_2, Clk_out, EX_MEM__MemWrite, EX_MEM__MemRead, DataMem_out);
    
    
   /* 
    __  __ _____ __  __      __ __        ______  
   |  \/  | ____|  \/  |    / / \ \      / / __ ) 
   | |\/| |  _| | |\/| |   / /   \ \ /\ / /|  _ \ 
   | |  | | |___| |  | |  / /     \ V  V / | |_) |
   |_|  |_|_____|_|  |_| /_/       \_/\_/  |____/ 

    */

    
    //module MEM_WB_Register(Clk, in_DataMemOut, in_destination_register, in_ALU1_output, in_MemToReg, in_RegWrite,
    //                       out_DataMemOut, out_destination_register, out_ALU1_output, out_MemToReg, out_RegWrite);
    MEM_WB_Register MEM_WB_1(Clk_out, DataMem_out, EX_MEM_dest_reg, EX_MEM_ALU_out, EX_MEM__MemToReg, EX_MEM__RegWrite,
                             MEM_WB_DataMemOut, MEM_WB_destination_register, MEM_WB_ALU1_output, MEM_WB_MemToReg, MEM_WB_RegWrite
                             );
    
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 Mux3(Mux3_out, MEM_WB_DataMemOut, MEM_WB_ALU1_output, MEM_WB_MemToReg);
    
    
    
    
    
        
        
endmodule
