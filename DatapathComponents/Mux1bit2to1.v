`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 06:58:30 PM
// Design Name: 
// Module Name: Mux1bit2to1
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


module Mux1bit2to1(out, inA, inB, sel);
    output reg [31:0] out;

    input [31:0] inA;
    input [31:0] inB;
    input sel;

/* Fill in the implementation here ... */ 

always @ (sel, inA, inB) begin
    if (sel == 0)   begin
        out <= inA;
    end
    else begin
        out <= inB;
    
    end
end

endmodule
