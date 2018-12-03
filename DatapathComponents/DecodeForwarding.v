`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2018 06:02:24 PM
// Design Name: 
// Module Name: DecodeForwarding
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


module DecodeForwarding(DForwardA, DForwardB, IF_ID_rs, IF_ID_rt, ID_EX_rd, ID_EX_RegWrite, EX_MEM__RegWrite, EX_MEM_rd, branch, EX_MEM_JALSrc);

input ID_EX_RegWrite, EX_MEM__RegWrite, branch, EX_MEM_JALSrc;
input [4:0] IF_ID_rs, IF_ID_rt, ID_EX_rd, EX_MEM_rd;


output reg [1:0] DForwardA, DForwardB;


    initial begin
        DForwardA <= 0;
        DForwardB <= 0;
    end

    
    always @ (*) begin
        DForwardA <= 0;
        DForwardB <= 0;
        
        
        if (IF_ID_rs == EX_MEM_rd
            && EX_MEM__RegWrite == 1
            && branch == 1
            ) begin
            DForwardA <= 1;
        end
        
        
        //jal to a jr
        if (EX_MEM_JALSrc == 0
            && EX_MEM__RegWrite == 1
            && IF_ID_rs == 31
            )   begin
            DForwardA <= 3;
        end
        
        //addi to beq
        if  (IF_ID_rt == EX_MEM_rd
            && EX_MEM__RegWrite == 1
            && branch == 1
            )   begin
            DForwardB <= 1;
        end
        
        
        
        
        
    end




endmodule
