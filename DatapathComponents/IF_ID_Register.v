`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 01:02:13 PM
// Design Name: 
// Module Name: IF_ID_Register
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


module IF_ID_Register(Clk, HazardFlush, Branch,
                      in_Instruction, out_Instruction,
                      in_PCplus4, out_PCplus4);
    input Clk, HazardFlush, Branch;
    input [31:0] in_Instruction, in_PCplus4;
    output reg [31:0] out_Instruction, out_PCplus4;
    
    initial begin
            out_Instruction <= 0;
            out_PCplus4 <= 0;
    end

    always @ (posedge Clk)  begin
        if (Branch)    begin 
            out_PCplus4 <= in_PCplus4;
            out_Instruction <= 0;
        end
        
        
        else if (HazardFlush) begin
            //do nothing
        end
        
        
        else    begin
            out_Instruction <= in_Instruction;
            out_PCplus4 <= in_PCplus4;
        end
    end
    

endmodule
