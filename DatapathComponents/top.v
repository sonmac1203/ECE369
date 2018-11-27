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


module top(Clk, PC_Reset, Clk_Reset, debug_program_counter, debug_write_data,debug_HI, debug_LO,
           s0, s1, s2, s3, s4, s5, s6, s7, t0, t1, t2, t3, t4, a0,
           mem0, mem1, mem2, mem3);


input Clk, PC_Reset, Clk_Reset;

//output reg [31:0] debug_program_counter, debug_write_data,debug_HI, debug_LO;


output  [31:0]  debug_program_counter,
                    debug_write_data,
                    debug_HI,
                    debug_LO,
                    s0, s1, s2, s3, s4, s5, s6, s7, t0, t1, t2, t3, t4, a0,
                    mem0,
                    mem1,
                    mem2,
                    mem3;


wire [4:0] hard31 = 31;
integer hard0  = 0;

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
        branch,
        EX_MEM_ALUZero,
        AND1_out,
        JalSrc,
        JZEROSrc,
        ID_EX_JZEROSrc,
        MEM_WB_JALSrc,
        ID_EX_JAlSrc,
        EX_MEM_JAlSrc,
        JRSrc,
        BLU_out,
        ID_EX_ZEROSrc,
        MemToReg,
        CR_ALUSrc,
        CR_RegDst,
        CR_RegWrite,    
        CR_MemRead,  
        CR_MemWrite,  
        CR_MemToReg,   
        CR_ALUSft,  
        CR_ZEROSrc,  
        CR_branch,    
        CR_JalSrc,   
        CR_JZEROSrc,  
        Flush,
        IF_ID_Write,
        PCWrite,
        MEMForward,
        CR_JRSrc;

wire [1:0]  SEMCtrl,
            ID_EX_SEMCtrl,
            ForwardA,
            ForwardB,
            DForwardA, 
            DForwardB,
            CR_SEMCtrl,
            EX_MEM_SEMCtrl;


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
            IF_ID_address,
            Adder_1_out,
            EX_MEM_Adder_1,
            mux6_out,
            mux7_out,
            mux8_out,
            SEM1_out,
            JLAdder_out,
            EX_MEM_JLAdder_out,
            mux9_out,
            SL2_out,
            mux10_out,
            mux11_out,
            mux12_out,
            mux13_out,
            Mux14_out,
            Mux15_out,
            ID_EX_address,
            ID_EX_ZE;




wire [4:0]  ID_EX_out_rd_i,
            ID_EX_out_rd_r,
            EX_MEM_dest_reg,
            MEM_WB_destination_register,
            ID_EX_rs,
            ID_EX_rt,
            EX_MEM_rt,
            Mux2_out;

wire [5:0]  ALUOp,
            CR_ALUOp,
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
    Mux32Bit2To1 Mux6(mux6_out, PCAdder_out, Adder_1_out, AND1_out);


    ClkDiv CD1(Clk, Clk_Reset, Clk_out);

    //module ProgramCounter(Address, PCResult, Reset, Clk, debug_program_counter, PCWrite);
    ProgramCounter PC(mux6_out, PCResult, PC_Reset, Clk_out, debug_program_counter, Flush);

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


    //module IF_ID_Register(Clk, HazardFlush, Branch,
    //                      in_Instruction, out_Instruction,
    //                      in_PCplus4, out_PCplus4);
    IF_ID_Register IFID_Reg_1(Clk_out, Flush, AND1_out,
                              IM_out, IF_ID_Instruction_out,
                              PCAdder_out, IF_ID_address);


    //module Mux5Bit2To1(out, inA, inB, sel);
    Mux5Bit2To1 Mux7(mux7_out, hard31, MEM_WB_destination_register, MEM_WB_JALSrc);



    //module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2, debug_write_data);
    RegisterFile Register_1(IF_ID_Instruction_out[25:21], IF_ID_Instruction_out[20:16], mux7_out, Mux3_out, MEM_WB_RegWrite,
                     Clk_out, ReadData1_out, ReadData2_out, debug_write_data, s0, s1, s2, s3, s4, s5, s6, s7, t0, t1, t2, t3, t4, a0);

    //module SignExtension(in, out);
    SignExtension SignExtend32_1(IF_ID_Instruction_out[15:0], SE_out);


    //module ZeroExtension(in, out);
    ZeroExtension ZeroExtension_1(IF_ID_Instruction_out[15:0], ZE_out);




    //module Controller(Instruction, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg);
    Controller Co_1(IF_ID_Instruction_out, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite,
                    MemToReg, ALUSft, ZEROSrc, branch, JalSrc, JZEROSrc, SEMCtrl, JRSrc);



//    module ControllerRegister(Hazard, 
//                        in_ALUSrc,      out_ALUSrc, 
//                        in_RegDst,      out_RegDst,
//                        in_RegWrite,    out_RegWrite,
//                        in_ALUOp,       out_ALUOp,
//                        in_MemRead,     out_MemRead,
//                        in_MemWrite,    out_MemWrite,
//                        in_MemToReg,    out_MemToReg,
//                        in_ALUSft,      out_ALUSft,
//                        in_ZEROSrc,     out_ZEROSrc,
//                        in_branch,      out_branch,
//                        in_JalSrc,      out_JalSrc,
//                        in_JZEROSrc,    out_JZEROSrc,
//                        in_SEMCtrl,     out_SEMCtrl,
//                        in_JRSrc,        out_JRSrc
//                        );
    ControllerRegister ControlReg1(Flush, AND1_out,
                        ALUSrc,      CR_ALUSrc, 
                        RegDst,      CR_RegDst,
                        RegWrite,    CR_RegWrite,
                        ALUOp,       CR_ALUOp,
                        MemRead,     CR_MemRead,
                        MemWrite,    CR_MemWrite,
                        MemToReg,    CR_MemToReg,
                        ALUSft,      CR_ALUSft,
                        ZEROSrc,     CR_ZEROSrc,
                        branch,      CR_branch,
                        JalSrc,      CR_JalSrc,
                        JZEROSrc,    CR_JZEROSrc,
                        SEMCtrl,     CR_SEMCtrl,
                        JRSrc,       CR_JRSrc
                        );




//module HazardDetectionUnit(IF_ID_rs, IF_ID_rt, ID_EX_MemRead, ID_EX_rs, ID_EX_rt, Flush, IF_ID_MemWrite);
    HazardDetectionUnit HazardDetection1(IF_ID_Instruction_out[25:21], IF_ID_Instruction_out[20:16], ID_EX_MemRead,
                                         ID_EX_rs, ID_EX_rt, Flush, MemWrite, branch, ID_EX_RegWrite);


    
    //module DecodeForwarding(DForwardA, DForwardB, rs, rt, 
    //                        ID_EX_rd, ID_EX_RegWrite, EX_MEM__RegWrite, EX_MEM_rd);
    DecodeForwarding DecodeForward1(DForwardA, DForwardB, IF_ID_Instruction_out[25:21], IF_ID_Instruction_out[20:16],
                                    Mux2_out, ID_EX_RegWrite, EX_MEM__RegWrite, EX_MEM_dest_reg, branch);
    
    
    
    
    
    //module Mux32Bit3To1(out, inA, inB, inC, sel);
    Mux32Bit3To1 mux14(Mux14_out, ReadData1_out, EX_MEM_ALU_out, mux9_out, DForwardA);
    
    //module Mux32Bit3To1(out, inA, inB, inC, sel);
    Mux32Bit3To1 mux15(Mux15_out, ReadData2_out, EX_MEM_ALU_out, mux9_out, DForwardB);
    
    
    
    /*
     *Start BLU (Branch Logic Unit and associated Program Counter Manipulator)
     */
    
     //module BLU(BLUControl, A, B, Zero);
     BLU BLU1(ALUOp, Mux14_out, Mux15_out, BLU_out);
     
     //module AND(Input_A, Input_B, Output);
     AND AND1(branch, BLU_out, AND1_out);
     //END BLU ZONE
    
    
     //module ShiftLeft2(in, out);
     ShiftLeft2 shiftleftby2_1(SE_out, SL2_out);
 
     //module Mux32Bit2To1(out, inA, inB, sel);
     Mux32Bit2To1 mux8(mux8_out, hard0, IF_ID_address, JZEROSrc);
 
 
     //module Mux32Bit2To1(out, inA, inB, sel);
     Mux32Bit2To1 mux10(mux10_out, SL2_out, Mux14_out, JRSrc);
 
     //module Adder(A, B, out);
     Adder Adder_1(mux8_out, mux10_out, Adder_1_out);
    
    
    /*
     * END BLU
     */
    
    
    
    
       /*
        ___ ____       __  _______  __
       |_ _|  _ \     / / | ____\ \/ /
        | || | | |   / /  |  _|  \  /
        | || |_| |  / /   | |___ /  \
       |___|____/  /_/    |_____/_/\_\

        */


//module ID_EX_Register(Clk, in_ReadData1, in_ReadData2, in_immediate_extended, in_rd_i, in_rd_r, 
//                      in_ALUSrc, in_ALUOP, in_RegDst, in_Mem_Write, in_MemRead, in_MemToReg, in_RegWrite,
//                      out_ReadData1, out_ReadData2, out_immediate_extended, out_rd_i, out_rd_r, 
//                      out_ALUSrc, out_ALUOP, out_RegDst, out_Mem_Write, out_MemRead, out_MemToReg, out_RegWrite,
//                      ALUSft, out_ALUSft,
//                      ZE_in, ZE_out,
//                      in_branch, out_branch,
//                      JZEROSrc, ID_EX_JZEROSrc,
//                      SEMCtrl_in, out_SEMCtrl,
//                      in_JALSrc, out_JALSrc,
//                      in_JRSrc, out_JRSrc,
//                      in_rs, out_rs,
//                      in_rt, out_rt
//                      );
    ID_EX_Register ID_EX_1(Clk_out, Mux14_out, Mux15_out, SE_out, IF_ID_Instruction_out[20:16], IF_ID_Instruction_out[15:11],
                            CR_ALUSrc, CR_ALUOp, CR_RegDst, CR_MemWrite, CR_MemRead, CR_MemToReg, CR_RegWrite,
                            ID_EX_ReadData1_out, ID_EX_ReadData2_out, ID_EX_SE_out, ID_EX_out_rd_i, ID_EX_out_rd_r,
                            ID_EX_ALUSrc, ID_EX_ALUOp, ID_EX_RegDst, ID_EX_MemWrite, ID_EX_MemRead, ID_EX_MemToReg, ID_EX_RegWrite,
                            CR_ALUSft, ID_EX_ALUSft,
                            ZE_out, ID_EX_ZE,
                            CR_JZEROSrc, ID_EX_JZEROSrc,
                            CR_SEMCtrl, ID_EX_SEMCtrl,
                            CR_JalSrc, ID_EX_JAlSrc,
                            IF_ID_Instruction_out[25:21], ID_EX_rs,
                            IF_ID_Instruction_out[20:16], ID_EX_rt,
                            CR_ZEROSrc, ID_EX_ZEROSrc,
                            IF_ID_address, ID_EX_address
                            );
    
    
    
    
    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 Mux1(Mux1_out, ID_EX_ReadData2_out, Mux5_out, ID_EX_ALUSrc);


    //module Mux5Bit2To1(out, inA, inB, sel);
    Mux5Bit2To1 Mux2(Mux2_out, ID_EX_out_rd_i, ID_EX_out_rd_r, ID_EX_RegDst);


    Mux32Bit2To1 Mux5(Mux5_out, ID_EX_SE_out, ID_EX_ZE, ID_EX_ZEROSrc);



    //module HI_LO_Registers(HI_in, LO_in, HI_out, LO_out, debug_HI, debug_LO);
    HI_LO_Registers HI_LO_REG1(Clk_out, HI_in, LO_in, HI_out, LO_out, debug_HI, debug_LO);


    //module SignExtend5To32(in, out);
    SignExtend5To32 SignExtend5_1(Mux5_out[10:6], SE1_out);


    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 Mux4(Mux4_out, ID_EX_ReadData1_out, SE1_out, ID_EX_ALUSft);
    
    
    
    //module Mux32Bit3To1(out, inA, inB, inC, sel);
    Mux32Bit3To1 mux11(mux11_out, Mux4_out, Mux3_out, EX_MEM_ALU_out, ForwardA);
    
    //module Mux32Bit3To1(out, inA, inB, inC, sel);
    Mux32Bit3To1 mux12(mux12_out, Mux1_out, Mux3_out, EX_MEM_ALU_out, ForwardB);
    
    
    //module ALU32Bit(ALUControl, A, B, ALUResult, Zero, LO_in, LO_out, HI_in, HI_out);
    ALU32Bit ALU1(ID_EX_ALUOp, mux11_out, mux12_out, ALU1_out,ALU1_zero, LO_out, LO_in, HI_out, HI_in);


    //module PCAdder(PCResult, PCAddResult);
    PCAdder JLAdder(ID_EX_address, JLAdder_out);



    
    
//module EXForwarding(ID_EX_rs, ID_EX_rt, 
//                        EX_MEM_ALU, EX_MEM_dest_reg, mux3_out, 
//                        EX_MEM_RegWrite, EX_MEM_RegRd,
//                        MEM_WB_RegWrite, MEM_WB_RegisterRd,
//                        ForwardA, ForwardB,
//                        ID_EX_MemRead,
//                        ID_EX_regDst);

    EXForwarding EXForwarding1(ID_EX_rs, ID_EX_rt, 
                               EX_MEM_ALU_out, EX_MEM_dest_reg, Mux3_out, 
                               EX_MEM__RegWrite, EX_MEM_dest_reg,
                               MEM_WB_RegWrite, MEM_WB_destination_register,
                               ForwardA, ForwardB,
                               ID_EX_MemRead,
                               ID_EX_RegDst);
    
    
    


   /*
    _______  __     __  __  __ _____ __  __
   | ____\ \/ /    / / |  \/  | ____|  \/  |
   |  _|  \  /    / /  | |\/| |  _| | |\/| |
   | |___ /  \   / /   | |  | | |___| |  | |
   |_____/_/\_\ /_/    |_|  |_|_____|_|  |_|

    */


//module EX_MEM_Register(Clk, in_ALU_out, in_ReadData_2, in_dest_reg, in_MemWrite, in_MemRead, in_MemToReg, in_RegWrite,
//                        out_ALU_out, out_ReadData_2, out_dest_reg, out_MemWrite, out_MemRead, out_MemToReg, out_RegWrite,
//                        in_SEMCtrl, out_SEMCtrl,
//                        in_JLAdder, out_JLAdder,
//                        in_JALSrc, out_JALSrc,
//                        in_rt, out_rt
//                        );





    EX_MEM_Register EX_MEM_1(Clk_out, ALU1_out, ID_EX_ReadData2_out, Mux2_out, ID_EX_MemWrite, ID_EX_MemRead, ID_EX_MemToReg, ID_EX_RegWrite,
                             EX_MEM_ALU_out, EX_MEM_ReadData_2, EX_MEM_dest_reg, EX_MEM__MemWrite, EX_MEM__MemRead, EX_MEM__MemToReg, EX_MEM__RegWrite,
                             ID_EX_SEMCtrl, EX_MEM_SEMCtrl,
                             JLAdder_out, EX_MEM_JLAdder_out,
                             ID_EX_JAlSrc, EX_MEM_JAlSrc,
                             ID_EX_rt, EX_MEM_rt);

    ////module AND(Input_A, Input_B, Output);
    //AND AND1(EX_MEM_branch, EX_MEM_ALUZero, AND1_out);

    
    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 mux13(mux13_out, EX_MEM_ReadData_2, Mux3_out, MEMForward);


    //module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData);
    DataMemory DM_1(EX_MEM_ALU_out, mux13_out, Clk_out, EX_MEM__MemWrite, EX_MEM__MemRead, DataMem_out, mem0, mem1, mem2, mem3, EX_MEM_SEMCtrl);


    //module SignExtendModular(in, out, SEMCtrl);
    SignExtendModular SignExtendModular1(DataMem_out, SEM1_out, EX_MEM_SEMCtrl);


    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 mux9(mux9_out, EX_MEM_JLAdder_out, EX_MEM_ALU_out,EX_MEM_JAlSrc);

    
    
    //module MEMForwarding(EX_MEM_rt, MEM_WB_rd, MEM_WB_RegWrite, MEMForward);
    MEMForwarding MEMForward1(EX_MEM_rt, MEM_WB_destination_register, MEM_WB_RegWrite, MEMForward);
    
    
    

   /*
    __  __ _____ __  __      __ __        ______
   |  \/  | ____|  \/  |    / / \ \      / / __ )
   | |\/| |  _| | |\/| |   / /   \ \ /\ / /|  _ \
   | |  | | |___| |  | |  / /     \ V  V / | |_) |
   |_|  |_|_____|_|  |_| /_/       \_/\_/  |____/

    */


//    module MEM_WB_Register(Clk,
//                           in_DataMemOut, out_DataMemOut,
//                           in_destination_register, out_destination_register,
//                           in_ALU1_output, out_ALU1_output,
//                           in_MemToReg, out_MemToReg,
//                           in_RegWrite, out_RegWrite,
//                           in_JALSrc, out_JALSrc);

    //MEM_WB_Register MEM_WB_1(Clk_out, SEM1_out, EX_MEM_dest_reg, mux9_out, EX_MEM__MemToReg, EX_MEM__RegWrite,
    //                         MEM_WB_DataMemOut, MEM_WB_destination_register, MEM_WB_ALU1_output, MEM_WB_MemToReg, MEM_WB_RegWrite,
    //                         EX_MEM_JAlSrc, MEM_WB_JALSrc
    //                         );
    MEM_WB_Register MEM_WB_1(Clk_out,
                             SEM1_out,        MEM_WB_DataMemOut,
                             EX_MEM_dest_reg , MEM_WB_destination_register,
                             mux9_out        , MEM_WB_ALU1_output,
                             EX_MEM__MemToReg, MEM_WB_MemToReg,
                             EX_MEM__RegWrite, MEM_WB_RegWrite,
                             EX_MEM_JAlSrc   , MEM_WB_JALSrc
                             );



    //module Mux32Bit2To1(out, inA, inB, sel);
    Mux32Bit2To1 Mux3(Mux3_out, MEM_WB_DataMemOut, MEM_WB_ALU1_output, MEM_WB_MemToReg);







endmodule
