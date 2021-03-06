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


module HI_LO_Registers(Clk, HI_in, LO_in, HI_out, LO_out, debug_HI, debug_LO);

    input Clk;

    (* mark_debug = "true" *) input [31:0]    HI_in, 
                    LO_in;
    
//    (* mark_debug = "true" *)   output reg [31:0]   HI_out,
//                                LO_out;

    output reg [31:0]   HI_out,
                            LO_out;



    output [31:0] debug_HI,
                  debug_LO;
    
    initial begin
        HI_out <= 0;
        LO_out <= 0;    
    end
    
    
    always @(posedge Clk) begin
        HI_out <= HI_in;
        LO_out <= LO_in;
    end
    
    assign debug_HI = HI_out;
    assign debug_LO = LO_out;
    
endmodule