`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData, mem0, mem1, mem2, mem3, SEMCtrl); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input [1:0] SEMCtrl;
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 

    output reg[31:0] ReadData;
    
    output [31:0] mem0, mem1, mem2, mem3;

    /* Please fill in the implementation here */
    
    reg[31:0] memory [0:1023];

    integer index;

    initial begin
//        memory[0] <= 32'h0;
//        memory[1] <= 32'h00000001;
//        memory[2] <= 32'hffffffff;
        memory[0] <= 0;
        memory[1] <= 1;
        memory[2] <= 2;
        memory[3] <= 3;
        memory[4] <= 4;
        memory[5] <= -1;
    



        for (index = 0; index < 1024; index = index + 1) begin
            memory[index] = 32'h0;
        end


    end
    
    
    always @ (posedge Clk)  begin
        if (MemWrite)   begin
            if(SEMCtrl == 2'b0)
                memory[Address[11:2]] <= WriteData;
            
            else if(SEMCtrl == 2'b01)
                memory[Address[11:2]] <= WriteData[15:0];
                
            else if(SEMCtrl == 2'b10)
                memory[Address[11:2]] <= WriteData[7:0];
        end
        
     end
     
     always @ (negedge Clk) begin
        if (MemRead)    begin
            ReadData <= memory[Address[11:2]];
        end
        else
            ReadData = 0;
      end
   
   assign mem0 = memory[0];
   assign mem1 = memory[1];
   assign mem2 = memory[2];
   assign mem3 = memory[3];
   
   

endmodule
