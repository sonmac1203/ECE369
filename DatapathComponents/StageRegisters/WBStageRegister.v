`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 12:34:01 PM
// Design Name: 
// Module Name: WBStageRegister
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


module WBStageRegister(Clk, in_MemToReg, out_MemToReg);
    input Clk, in_MemToReg;
    output reg out_MemToReg;
    
    always @ (posedge Clk)  begin
        out_MemToReg <= in_MemToReg;
    end

endmodule
