`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 03:52:18 PM
// Design Name: 
// Module Name: AND
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


module AND(Input_A, Input_B, Output);
    
    input Input_A, Input_B;
    output reg Output;
    
    initial begin
        Output = 0;
    end
    always @(Input_A, Input_B) begin
        Output = Input_A & (Input_B);
    end
    
endmodule
