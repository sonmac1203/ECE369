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
    
    reg Clk, SADOp;
    reg [31:0] MemAddress, WindowAddress, Width, Height;
    reg [5:0] ALUOp;
    
    wire  [31:0]  SAD_out;
    
    
    // top(Clk, MemAddress, WindowAddress, Width, Height, ALUOp, SADOp, SAD_out );
    top t0(.Clk(Clk), 
                .MemAddress(MemAddress),
                .WindowAddress(WindowAddress),
                .Width(Width),
                .Height(Height),
                .ALUOp(ALUOp),
                .SADOp(SADOp),
                .SAD_out(SAD_out) );
    

    
    always begin
        Clk <= 0;
        #100;
        
        Clk <= 1;
       MemAddress <= MemAddress + 4;
        #100;
    end
    
    
    initial begin
        //Set window size
        MemAddress <= 32'b0;
        WindowAddress <= 32'b0;
        Width <= 32'b10;
        Height <= 32'b10;
        ALUOp <= 6'b111110;
        SADOp <= 1'b1;
        
        //Set Frame Width
        #200;
        Width <= 32'b100;
        ALUOp <= 6'b111100;
          
        //Begin Sad
       #200;
       MemAddress <= 0;
       ALUOp <= 6'b111111; 
    end
    
    
    
endmodule
