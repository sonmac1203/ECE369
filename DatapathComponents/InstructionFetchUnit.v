`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members: Mitchell Dzurick & Lena Voytek
// Overall percent effort of each team meber: 50% - 50%
// 
// ECE369A - Computer Architecture
// Laboratory 3 (PostLab)
// Module - InstructionFetchUnit.v
// Description - Fetches the instruction from the instruction memory based on 
//               the program counter (PC) value.
// INPUTS:-
// Reset: 1-Bit input signal. 
// Clk: Input clock signal.
//
// OUTPUTS:-
// Instruction: 32-Bit output instruction from the instruction memory. 
//              Decimal value diplayed on the LCD usng the wrapper given in Lab 2
//
// FUNCTIONALITY:-
// Please connect up the following implemented modules to create this
// 'InstructionFetchUnit':-
//   (a) ProgramCounter.v
//   (b) PCAdder.v
//   (c) InstructionMemory.v
// Connect the modules together in a testbench so that the instruction memory
// outputs the contents of the next instruction indicated by the memory location
// in the PC at every clock cycle. Please initialize the instruction memory with
// some preliminary values for debugging purposes.
//
// @@ The 'Reset' input control signal is connected to the program counter (PC) 
// register which initializes the unit to output the first instruction in 
// instruction memory.
// @@ The 'Instruction' output port holds the output value from the instruction
// memory module.
// @@ The 'Clk' input signal is connected to the program counter (PC) register 
// which generates a continuous clock pulse into the module.
////////////////////////////////////////////////////////////////////////////////

module InstructionFetchUnit(Reset, Clk, Instruction);

    input Reset;
    input Clk;
    
    output [31:0] Instruction;
    
    //wire [31:0] IM_out;
    wire [31:0] address;
    wire [31:0] PCResult;
    
    //module ProgramCounter(Address, PCResult, Reset, Clk);
    ProgramCounter IFU_PC(address, PCResult, Reset, Clk);
    
    //module PCAdder(PCResult, PCAddResult)
    PCAdder IFU_PCAdd(PCResult, address);
            
    //module InstructionMemory(Address, Instruction); 
    InstructionMemory IFU_IM(PCResult, Instruction);
    
    
//    always @ (posedge Clk)  begin
//        Inst
//    end
    
//    output [7:0] en_out;
//    output [6:0] out7;
//    //module ClkDiv(Clk, Rst, ClkOut);
//    ClkDiv IFU_Clk(Clk, Reset, Clk_out);
//    //module Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out);
//    Two4DigitDisplay IFU_Display(Clk_out, Instruction[15:0], Instruction[31:16], out7, en_out);
    
    /* Please fill in the implementation here... */
endmodule

