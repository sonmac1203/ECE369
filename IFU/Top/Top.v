`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2018 10:51:30 AM
// Design Name: 
// Module Name: Top
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


module Top(Clk, Reset, out7, en_out ,top_clock_reset);

    input Clk, Reset;
    output [7:0] en_out;
    output [6:0] out7;
    wire Clk_out;
    wire [31:0] Instruction;
    input top_clock_reset;

    //module ClkDiv(Clk, Rst, ClkOut);
    ClkDiv IFU_Clk(Clk, top_clock_reset, Clk_out);
    
    //module InstructionFetchUnit(Reset, Clk, Instruction);
    InstructionFetchUnit top_IFU(Reset, Clk_out, Instruction);
    
    //module Two4DigitDisplay(Clk, NumberA, NumberB, out7, en_out);
    Two4DigitDisplay top_Display(Clk_out, Instruction[15:0], Instruction[31:16], out7, en_out);


endmodule
