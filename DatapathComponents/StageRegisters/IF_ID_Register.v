`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 01:02:13 PM
// Design Name: 
// Module Name: IF_ID_Register
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


module IF_ID_Register(Clk, in_Instruction, out_Instruction);
    input Clk;
    input [31:0] in_Instruction;
    output reg [31:0] out_Instruction;

    always @ (posedge Clk)  begin
        out_Instruction <= in_Instruction;
    end

endmodule
