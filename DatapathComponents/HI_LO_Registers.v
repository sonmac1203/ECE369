`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lena Voytek & Mitchell Dzurick
// 
// Create Date: 10/14/2018 02:52:58 PM
// Design Name: 
// Module Name: HI_LO_Registers
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


module HI_LO_Registers(Clk, HI_in, LO_in, HI_out, LO_out);

    input Clk;

    input [31:0]    HI_in, 
                    LO_in;
    
    output reg [31:0]   HI_out,
                        LO_out;
    
    initial begin
        HI_out = 0;
        LO_out = 0;    
    end
    
    
    always @(posedge Clk) begin
        HI_out = HI_in;
        LO_out = LO_in;
    end
    
endmodule