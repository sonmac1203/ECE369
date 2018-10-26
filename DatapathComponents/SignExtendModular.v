`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 05:47:16 PM
// Design Name: 
// Module Name: SignExtendModular
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


module SignExtendModular(in, out, SEMCtrl);
    
    /* A 16-Bit input word */
        input [1:0] SEMCtrl;
        input [15:0] in;
        
        /* A 32-Bit output word */
        output reg [31:0] out;
        
        /* Fill in the implementation here ... */
        
        initial begin
            out <= 32'b0;
        end
        
        always @ (*)    begin
        
                //pass value through
            if (SEMCtrl == 0)   begin
                out <= in;
            end
    
                //sign extend 16 bits 
            else if (SEMCtrl == 1)   begin
                if (in[15] == 0)    begin
                    out <= {16'b0, in};
                end
                else begin    
                    out <= {16'b1111111111111111, in};
        
                end
                    
            end
            
            else if (SEMCtrl == 2)  begin
                if (in[7] == 0)    begin
                out <= {24'b0, in};
            end
            else begin    
                out <= {24'b111111111111111111111111, in};
    
            end        
            
            
            end

        
        end
endmodule
