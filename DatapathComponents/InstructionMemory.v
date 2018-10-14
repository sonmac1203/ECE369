`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory  1
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
//
//
//we will store the machine code for a code written in C later. for now initialize 
//each entry to be its index * 3 (memory[i] = i * 3;)
//all you need to do is give an address as input and read the contents of the 
//address on your output port. 
// 
//Using a 32bit address you will index into the memory, output the contents of that specific 
//address. for data memory we are using 1K word of storage space. for the instruction memory 
//you may assume smaller size for practical purpose. you can use 128 words as the size and 
//hardcode the values.  in this case you need 7 bits to index into the memory. 
//
//be careful with the least two significant bits of the 32bit address. those help us index 
//into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 


////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address
    
    reg [31:0] Memory [127:0];

    //initializing memory with 0-127    
    integer index;
    
    
    initial begin
        //Given Simple Test
        Memory[0] = 32'h20090006;
        Memory[1] = 32'h00000000;
        Memory[2] = 32'h00000000;
        Memory[3] = 32'h00000000;
        Memory[4] = 32'h00000000;
        Memory[5] = 32'h00000000;
        Memory[6] = 32'h200a0008;
        Memory[7] = 32'h00000000;
        Memory[8] = 32'h00000000;
        Memory[9] = 32'h00000000;
        Memory[10] = 32'h00000000;
        Memory[11] = 32'h00000000;
        Memory[12] = 32'h00000000;
        Memory[13] = 32'h00000000;
        Memory[14] = 32'h00000000;
        Memory[15] = 32'h00000000;
        Memory[16] = 32'h00000000;
        Memory[17] = 32'h00000000;
        Memory[18] = 32'h000b60c0;
        Memory[19] = 32'h00000000;
        Memory[20] = 32'h00000000;
        Memory[21] = 32'h00000000;
        Memory[22] = 32'h00000000;
        Memory[23] = 32'h00000000;
        Memory[24] = 32'h000c6882;

        /* Count up by 3's
        for (index = 0; index < 128; index = index + 1) begin
            Memory[index] = index * 3;
        end
        */
    end
    
    
    always @ Address begin
        Instruction = Memory[Address[8:2]];
    end
    
    
endmodule
