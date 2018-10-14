`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;

    wire [31:0] ReadData;


    integer i;
    integer temp;

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    @(posedge Clk);
    #10;
    MemWrite <= 1;
    MemRead <= 0;
    
        for (i=0; i < 1024; i = i+1)    begin
                #10;
                temp = i << 2; //because byte addressing by 4.
                WriteData <= i;
                Address <= temp;
                @(posedge Clk);
        end
    #10;
    
    
    MemWrite <= 0;
    MemRead <= 1;
    
    @(posedge Clk);
    #10;  
        for (i = 0; i < 1024; i = i+1)    begin
                 #10;
                 temp = i << 2;
                 Address <= temp;
                 @(posedge Clk);
        end
	
	end

endmodule

