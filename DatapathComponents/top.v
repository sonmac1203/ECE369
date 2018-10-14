`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2018 12:05:08 PM
// Design Name: 
// Module Name: top
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


module top(Clk, PC_Reset, Clk_Reset);


input Clk, PC_Reset, Clk_Reset;

wire Clk_out;



    ClkDiv CD1(Clk, Clk_Reset, Clk_out);


     ProgramCounter PC_1(ThirtyTwoBit_mux_to_PC ,PC_out, Reset, Clk_out);







endmodule
