`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2018 02:13:15 PM
// Design Name: 
// Module Name: InstructionFetchUnit_tb
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


module InstructionFetchUnit_tb();

    wire [31:0] Instruction;
    reg Reset, Clk;
    
    InstructionFetchUnit p1(
        .Instruction(Instruction),
        .Reset(Reset),
        .Clk(Clk)
    );
    
    //module InstructionFetchUnit(Instruction, Reset, Clk, en_out);
    
    initial begin
        Clk <= 1'b0;
        forever #100 Clk <= ~Clk;
    end
   
   initial begin
   #200;
   Reset = 1;
   
   #200;
   Reset = 0;

   
   end
   
   
endmodule
