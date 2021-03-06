`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2018 11:08:19 AM
// Design Name: 
// Module Name: Top_tb
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


module Top_tb();

//module Top(Clk, Reset, out7, en_out);

   reg Reset, Clk;
   wire [6:0] out7;
   wire [7:0] en_out;
   reg top_clock_reset;
//   wire [31:0] Instruction;
    
    
   Top t1(
       .Clk(Clk),
       .Reset(Reset),
       .out7(out7),
       .en_out(en_out),
       .top_clock_reset(top_clock_reset)
//       .Instruction(Instruction)
   );
    
   initial begin
       Clk <= 1'b0;
       forever #75 Clk <= ~Clk;
   end
   
   initial begin
   #200;
   Reset = 1;
   top_clock_reset = 1;
   
   #200;
   Reset = 0;
   top_clock_reset = 0;
   end
   
   
   
   
endmodule
