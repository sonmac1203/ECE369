`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mitchell Dzurick & Lena Voytek
// 
// Percent Effort: 50% - 50%
// Create Date: 10/11/2018 12:05:53 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();
    
    reg Clk, MemWrite, MemRead;
    reg [31:0] MemAddress, WindowAddress, WriteData;
    
    wire  [31:0]  SAD_out;
    
    
    //module top(Clk, Address, MemWrite, MemRead, WriteData, SAD_out );
    top t0(.Clk(Clk), 
                .MemAddress(MemAddress),
                .WindowAddress(WindowAddress),
                .MemWrite(MemWrite),
                .MemRead(MemRead),
                .WriteData(WriteData),
                .SAD_out(SAD_out) );
    

    
    always begin
        Clk <= 0;
        #100;
        
        Clk <= 1;
       MemAddress <= MemAddress + 4;
        #100;
    end
    
    
    initial begin
        MemWrite <= 0;
        MemRead <= 1;
        MemAddress <= 32'b0;
        WindowAddress <= 32'b0;
    end
    
    
    
endmodule
