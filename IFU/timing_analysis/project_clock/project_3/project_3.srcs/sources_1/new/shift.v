`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2017 11:24:10 AM
// Design Name: 
// Module Name: shift
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
module shift (C, SI, SO); 
input C,SI; 
output SO; 
reg [7:0] tmp; 
 
  always @(posedge C) 
    begin 
      tmp = tmp << 1; 
      tmp[0] = SI; 
    end 
    assign SO  = tmp[7]; 
endmodule 
