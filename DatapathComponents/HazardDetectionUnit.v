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


module HazardDetectionUnit(IF_ID_rs, IF_ID_rt, ID_EX_MemRead, ID_EX_rs, ID_EX_rt, Flush);

    input [4:0] IF_ID_rs, IF_ID_rt, ID_EX_rt, ID_EX_rs;
    input ID_EX_MemRead;
    
    output reg Flush;
    
    
    initial begin 
        Flush <= 0;
    end
    
    always @ (*)    begin
       Flush <= 0;
       
       if ((IF_ID_rs == ID_EX_rs) && ID_EX_MemRead) begin
           Flush <= 1;
       end
       
       
       
       
    end
    

endmodule
