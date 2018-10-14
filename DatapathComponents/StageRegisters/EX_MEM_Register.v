`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 01:02:59 PM
// Design Name: 
// Module Name: EX_MEM_Register
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


module EX_MEM_Register(Clk, in_ALU_out, in_ReadData_2, in_dest_reg, in_MemWrite, in_MemRead, in_MemToReg, in_RegWrite,
                        out_ALU_out, out_ReadData_2, out_dest_reg, out_MemWrite, out_MemRead, out_MemToReg, out_RegWrite);
                        
input Clk, in_MemWrite, in_MemRead, in_MemToReg, in_RegWrite;
input [31:0] in_ALU_out, in_ReadData_2;
input [4:0] in_dest_reg;
             
output reg out_MemWrite, out_MemRead, out_MemToReg, out_RegWrite;    
output reg [31:0] out_ALU_out, out_ReadData_2;
output reg [4:0] out_dest_reg;

    always @ (posedge Clk)  begin
        out_ALU_out    <= in_ALU_out;
        out_ReadData_2 <= in_ReadData_2;
        out_dest_reg   <= in_dest_reg;
        out_MemWrite   <= in_MemWrite;
        out_MemRead    <= in_MemRead;
        out_MemToReg   <= in_MemToReg;
        out_RegWrite   <= in_RegWrite;
    end

          
endmodule
