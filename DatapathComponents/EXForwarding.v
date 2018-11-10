`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2018 02:47:26 PM
// Design Name: 
// Module Name: EXForwarding
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


module EXForwarding(ID_EX_rs, ID_EX_rt, 
                    EX_MEM_ALU, EX_MEM_dest_reg, mux3_out, 
                    EX_MEM_RegWrite, EX_MEM_RegRd,
                    MEM_WB_RegWrite, MEM_WB_RegisterRd,
                    ForwardA, ForwardB);

    input [31:0] ID_EX_rs, ID_EX_rt, EX_MEM_ALU, EX_MEM_dest_reg, mux3_out, MEM_WB_RegisterRd;
    input EX_MEM_RegWrite, EX_MEM_RegRd, MEM_WB_RegWrite;
    
    
    output reg [1:0] ForwardA, ForwardB;
    
    initial begin
        ForwardA <= 0;
        ForwardB <= 0;
    end
    
    always @ (*)    begin
    
       if   ((MEM_WB_RegWrite == 1 && MEM_WB_RegisterRd != 0)
             && !(EX_MEM_RegWrite == 1 && EX_MEM_RegRd != 0)
             && (EX_MEM_RegRd == ID_EX_rs)
             && (MEM_WB_RegisterRd == ID_EX_rs)) begin
                ForwardA = 01;
       end
       
       
        
        
    end
    
    
endmodule
