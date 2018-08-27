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

module InstructionFetchUnit(Instruction, Reset, Clk);

    input Reset;
    input Clk;
    
    
    
    output reg [31:0] Instruction;
    
    wire Clk_out;
    ClkDiv(Clk, Reset, Clk_out);
    
    
    wire address = 0;
    
    wire ProgramCounter_out;
            //module ProgramCounter(Address, PCResult, Reset, Clk);
        //ProgramCounter_out goes to IM and PCAdder
    ProgramCounter ProgramBoi(address, ProgramCounter_out, Reset, Clk_out);
    
            //module PCAdder(PCResult, PCAddResult)
    PCAdder PCAdder_1(ProgramCounter_out, address);
    
    wire IM_out;
            
            //module InstructionMemory(Address, Instruction); 
    InstructionMemory IM_1(ProgramCounter_out, IM_out);
    
    
    
    
    /* Please fill in the implementation here... */
endmodule

