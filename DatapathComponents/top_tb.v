`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
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
    
    reg Clk_tb, Reset_tb, Clk_Reset_tb;
    
    //module top(Clk, PC_Reset, Clk_Reset);
    top t0(.Clk(Clk_tb), 
           .PC_Reset(Reset_tb), 
           .Clk_Reset(Clk_Reset_tb));
    
//        ALU32Bit u0(
//        .ALUControl(ALUControl), 
//        .A(A), 
//        .B(B), 
//        .ALUResult(ALUResult), 
//        .Zero(Zero),
//        .LO_in(LO_in),
//        .LO_out(LO_out),
//        .HI_in(HI_in),
//        .HI_out(HI_out)
//    );
    
    always begin
        Clk_tb <= 0;
        #100;
        
        Clk_tb <= 1;
        #100;
    end
    
    initial begin
        Clk_Reset_tb <= 1;
        
        Reset_tb <= 1;
        
        
        #800;
        Clk_Reset_tb <= 0;
        Reset_tb <= 0;
    end

    
    
    //reset for 4-5 whole cycles
    
    
    
endmodule
