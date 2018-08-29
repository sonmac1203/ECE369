`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members:
// Overall percent effort of each team meber: 
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

module InstructionFetchUnit(Instruction, Reset, Clk, en_out);

    input Reset;
    input Clk;
    
    
    output [31:0] Instruction;
    output [6:0] en_out;
    
    wire Clk_out;
    
    //wire [31:0] IM_out;
    wire [31:0] address = 0;
    
    wire [31:0] ProgramCounter_out;
    
    
    ClkDiv Clk_1(Clk, Reset, Clk_out);
    
    //module ProgramCounter(Address, PCResult, Reset, Clk);
    //ProgramCounter_out goes to IM and PCAdder
    ProgramCounter ProgramBoi(address, ProgramCounter_out, Reset, Clk_out);
    
    //module PCAdder(PCResult, PCAddResult)
    PCAdder PCAdder_1(ProgramCounter_out, address);
            
    //module InstructionMemory(Address, Instruction); 
    InstructionMemory IM_1(ProgramCounter_out, Instruction);
    
    //module Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out);
    Two4DigitDisplay DisplayBoi(Clk_out, Instruction[15:0], Instruction[31:16], en_out);
    
    /* Please fill in the implementation here... */
endmodule

