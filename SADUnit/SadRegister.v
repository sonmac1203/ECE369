`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2018 06:01:28 PM
// Design Name: 
// Module Name: SadRegister
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


module SadRegister( Clk, Width,  Height,  SADOp, ALUOp, MemWidth, MemHeight, FrameWidth);

    input [31:0] Width, //Amount of memory per row read
                          Height;
   input [5:0] ALUOp;
   input Clk, SADOp;
   
   output reg [31:0] MemWidth,
                                   MemHeight,
                                   FrameWidth; 
   
   
                          
   initial begin
        MemWidth <= 0;
        MemHeight <= 0;
        FrameWidth <= 0;
   end
   
   always @(posedge Clk) begin
   
         if (SADOp == 1)    begin 
                  //Initialize Frame
                  if(ALUOp == 6'b111100) begin
                       FrameWidth <= Width;
                 end
                 
                 //Initialize Window
                 else if(ALUOp == 6'b111110) begin
                      MemWidth <= Width;
                      MemHeight <= Height;
                 end 
         end
   
   end

endmodule
