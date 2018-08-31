`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2017 11:20:59 AM
// Design Name: 
// Module Name: top1_test
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


module top1_test( );
reg Clk;
reg [31:0]  WriteRegister, WriteData;
wire [31:0] out_data;
top U0 (Clk,  WriteRegister, WriteData, out_data);

initial begin 
Clk <= 0;
WriteRegister <=0;
WriteData <=0;
forever #50 Clk <= ~Clk;
end



endmodule
