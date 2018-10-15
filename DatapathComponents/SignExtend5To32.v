`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2018 05:59:33 PM
// Design Name: 
// Module Name: SignExtend5To32
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


module SignExtend5To32(in, out);
    
        input [4:0] in;
        
        /* A 32-Bit output word */
        output reg [31:0] out;
        
        /* Fill in the implementation here ... */
        
        
        always @ (*)    begin
            if (in[4] == 0)    begin
                out <= {27'b0, in};
            end
            else begin    
                out <= {27'b111111111111111111111111111, in};
    
            end
        
        end
endmodule
