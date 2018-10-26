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
    
    reg Clk_tb, Reset_tb, Clk_Reset_tb;
    
    wire  [31:0]  debug_program_counter,
                        debug_write_data,
                        debug_HI,
                        debug_LO,
                        s0,
                        s1,
                        s2,
                        mem0,
                        mem1,
                        mem2,
                        mem3;
    
    
    //module top(Clk, PC_Reset, Clk_Reset);
    top t0(.Clk(Clk_tb), 
           .PC_Reset(Reset_tb), 
           .Clk_Reset(Clk_Reset_tb),
           .debug_program_counter(debug_program_counter),
           .debug_write_data(debug_write_data),
           .debug_HI(debug_HI),
           .debug_LO(debug_LO),
           .s0(s0),
           .s1(s1),
           .s2(s2),
           .mem0(mem0),
           .mem1(mem1),
           .mem2(mem2),
           .mem3(mem3)
           );
    

    
    always begin
        Clk_tb <= 0;
        #100;
        
        Clk_tb <= 1;
        #100;
    end
    
    initial begin
        Clk_Reset_tb <= 1;
        Reset_tb <= 1;
        
        #200;
        Clk_Reset_tb <= 0;
        #800;
        Reset_tb <= 0;
    end

    
    
    //reset for 4-5 whole cycles
    
    
    
endmodule
