`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Lena Voytek
// 
// Create Date: 10/17/2018 03:37:03 PM
// Design Name: 
// Module Name: Adder
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


module AbsoluteDifference(A, B, out);

    input [31:0] A, B;
    output reg [31:0] out;

    always @ (*)    begin
        out <= A - B;
        if(out < 0)
            out <= B - A;    
    end

endmodule
