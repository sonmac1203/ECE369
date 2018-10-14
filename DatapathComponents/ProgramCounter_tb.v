`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ProgramCounter_tb.v
// Description - Test the 'ProgramCounter.v' module.
////////////////////////////////////////////////////////////////////////////////

module ProgramCounter_tb(); 

	reg [31:0] Address;
	reg Reset, Clk;

	wire [31:0] PCResult;

    ProgramCounter u0(
        .Address(Address), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(Clk)
    );

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end
    
	initial begin
	
	Address = 0;
	Reset = 0;
	Clk = 0;
	//module ProgramCounter(Address, PCResult, Reset, Clk);

    #200;
    Address = 0;
    Reset = 0;
    
    #200;
    Address = 4;
    Reset = 0;
    
    #200;
    Reset = 1;
    
	#200;
	Reset = 0;
	
	#200;
	Address = 8;
	
	#200;
	Address = 12;
	
	#200;
	Reset = 1;
	
	#200;
	Reset = 0;
	
	
	
	end

endmodule

