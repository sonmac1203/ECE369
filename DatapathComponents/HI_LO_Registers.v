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


module HI_LO_Registers(HI_in, LO_in, HI_out, LO_out);

    input [31:0]    HI_in, 
                    LO_in;
    
    output reg [31:0]   HI_out,
                        LO_out;
                        
    always @(HI_in, LO_in) begin
        HI_out <= HI_in;
        LO_out <= LO_in;
    end
    
endmodule