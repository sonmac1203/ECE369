`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;

    integer i;
    
	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    	   @(posedge Clk);
    #10;
    RegWrite <= 1;
    
        for (i=0; i < 32; i = i+1)    begin
                #10;
                WriteData <= i;
                WriteRegister <= i;
                @(posedge Clk);
        end
    #10;
    
    RegWrite <= 0;
    
    @(posedge Clk);
    #10;  
        for (i = 0; i < 31; i = i+1)    begin
                 #10;
                 ReadRegister1 <= i;
                 ReadRegister2 <= i + 1;   
                 @(posedge Clk);
        end
	
	end

endmodule
