`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2017 11:05:09 AM
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
module top(Clk,  WriteRegister, WriteData, out_data);
    input Clk;
    input [31:0]  WriteRegister, WriteData;
    output [31:0] out_data;
  (* mark_debug = "true" *)  wire [31:0] debug_reg;
    RegisterFile U0(ReadRegister2, WriteRegister, WriteData, Clk, ReadData2, out_data, debug_reg);
endmodule