`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension(in, out);

    /* A 16-Bit input word */
    input [15:0] in;
    
    /* A 32-Bit output word */
    output reg [31:0] out;
    
    /* Fill in the implementation here ... */
    
    
    always @ (*)    begin
        if (in[15] == 0)    begin
            out <= {16'b0, in};
        end
        else begin    
            out <= {16'b1111111111111111, in};

        end
    
    end
    
    

endmodule
