`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 
// Module - InstructionMemory_tb.v
// Description - Test the 'InstructionMemory_tb.v' module.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb(); 

    wire [31:0] Instruction;

    reg [31:0] Address;

    integer i;
    
	InstructionMemory u0(
		.Address(Address),
        .Instruction(Instruction)
	);

	initial begin
    /* Please fill in the implementation here... */
        for(i = 0; i < 127; i = i + 1) begin
            #100 Address <= i;
        end /* end of for loop */
	end

endmodule

