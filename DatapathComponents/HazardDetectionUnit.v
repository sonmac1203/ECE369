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


module HazardDetectionUnit(IF_ID_rs, IF_ID_rt, ID_EX_MemRead, ID_EX_rs, ID_EX_rt, IF_ID_Write, PCWrite, Flush);

    input [4:0] IF_ID_rs, IF_ID_rt, ID_EX_rt, ID_EX_rs;
    input ID_EX_MemRead;
    
    output reg PCWrite, IF_ID_Write, Flush;
    
    
    initial begin 
        PCWrite <= 1;
        IF_ID_Write <= 1;
        Flush <= 0;
    end
    
    always @ (*)    begin
        //do nothing for now
    end
    

endmodule
