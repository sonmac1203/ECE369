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
    reg [31:0]  nonAbsOut;
    
    initial begin
        out <= 0;
    end

    always @ (*)    begin
        nonAbsOut <=  A - B;
        if(nonAbsOut[31] == 1'b1) begin
            out <= B - A;
       end
        else begin
            out <= A - B;
         end      
    end

endmodule
