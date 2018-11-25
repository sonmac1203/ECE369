`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2018 02:08:33 PM
// Design Name: 
// Module Name: HazardDetectionUnit
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


module HazardDetectionUnit(IF_ID_rs, IF_ID_rt, ID_EX_MemRead, ID_EX_rs, ID_EX_rt, Flush, IF_ID_MemWrite, branch, ID_EX_RegWrite);

    input ID_EX_MemRead, IF_ID_MemWrite, branch, ID_EX_RegWrite;
    input [4:0] IF_ID_rs, IF_ID_rt, ID_EX_rt, ID_EX_rs;
    
    output reg Flush;
    
    
    initial begin 
        Flush <= 0;
    end
    
    always @ (*)    begin
       Flush <= 0;
       
       if ((IF_ID_rs == ID_EX_rt) && (ID_EX_MemRead == 1)
            ) begin
           Flush <= 1;
       end
       
       if ((IF_ID_rt == ID_EX_rt) && (ID_EX_MemRead == 1)
            && IF_ID_MemWrite == 0) begin
           Flush <= 1;
       end
       
       
       
       // FLUSH FOR:
       // addi rt rs imm
       // bltz rs imm
       if (IF_ID_rs == ID_EX_rt
           && branch == 1
           && ID_EX_RegWrite == 1
           ) begin
           Flush <= 1;
       end
       
       
       
       
       
       
       end

endmodule
