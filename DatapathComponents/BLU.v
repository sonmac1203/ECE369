`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2018 02:03:38 PM
// Design Name: 
// Module Name: BLU
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


module BLU(BLUControl, A, B, Zero);
    
    input [5:0] BLUControl;
    input [31:0] A, B;
    output reg Zero;
    
    initial begin
        Zero <= 0;
    end

    always @ (*) begin
    
    Zero <= 0;
    
    if (BLUControl == 6'b000111) begin
      if ($signed(A) >= 0)
          Zero <= 1;
    end
    
    // beq  | 001000 |   if rs == rt, then branch
    else if (BLUControl == 6'b001000) begin
      if ($signed(A) == $signed(B))
          Zero <= 1;
    end
    
    // bne  | 001001 |   if rs !=  rt, then branch
    else if (BLUControl == 6'b001001) begin
      if ($signed(A) != $signed(B))
          Zero <= 1;
    end
    
    // bgtz | 001010 |   if rs  >  0, then branch
    else if (BLUControl == 6'b001010) begin
      if ($signed(A) > 0)
          Zero <= 1;
    end
    
    // blez | 001011 |   if rs <= 0, then branch
    else if (BLUControl == 6'b001011) begin
      if ($signed(A) <= 0)
          Zero <= 1;
    end
    
    // bltz | 001100 |   if rs  <  0, then branch
    else if (BLUControl == 6'b001100) begin
      if ($signed(A) < 0)
          Zero <= 1;
    end
    
    // j    | 001101 |   PC = PC + I[25:0]
    else if (BLUControl == 6'b001101) begin
      Zero <= 1;
    end
    // jal  | 001110 |   PC = PC + I[25:0] & link
    else if (BLUControl == 6'b001110) begin
      Zero <= 1;
    end
    
    // jr   | 100011 |   PC <- rs (I[25:21])
    else if (BLUControl == 6'b100011) begin
      Zero <= 1;
    end
    
    
    end





endmodule
