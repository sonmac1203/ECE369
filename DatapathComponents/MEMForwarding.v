`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2018 05:26:19 PM
// Design Name: 
// Module Name: MEMForwarding
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


module MEMForwarding(EX_MEM_rt, MEM_WB_rd, MEM_WB_RegWrite, MEMForward);

    input [4:0] EX_MEM_rt, MEM_WB_rd;
    input MEM_WB_RegWrite;
    
    output reg MEMForward;


    initial begin
        MEMForward <= 0;
    end

    always @ (*)    begin
        if (EX_MEM_rt == MEM_WB_rd) begin
            if (MEM_WB_RegWrite)    begin
                MEMForward <=1;
            end
            else    begin
                MEMForward <= 0;
            end
        end
        else    begin
            MEMForward <= 0;
        end
    end



endmodule
