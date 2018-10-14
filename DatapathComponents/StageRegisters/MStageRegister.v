`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 12:34:41 PM
// Design Name: 
// Module Name: MStageRegister
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


module MStageRegister(Clk, in_MemWrite, in_MemRead, out_MemWrite, out_MemRead);
    
    input Clk, in_MemWrite, in_MemRead;
    output reg out_MemWrite, out_MemRead;
    
    always @ (posedge Clk)  begin
        out_MemWrite <= in_MemWrite;
        out_MemRead <= in_MemRead;
    end

endmodule
