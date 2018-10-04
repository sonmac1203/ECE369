`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////


//module ALU32Bit(ALUControl, A, B, ALUResult, Zero, LO_in, LO_out, HI_in, HI_out);

module ALU32Bit_tb(); 

	reg [3:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs
	reg [31:0] HI_in;
	reg [31:0] LO_in;

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    wire [32:0] HI_out;
    wire [32:0] LO_out;

    wire [63:0] temp_64;

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero)
    );
    
	initial begin
	ALUControl <= 0;
    A = 0;
    B = 0;
    HI_in = 0;
    LO_in = 0;
    
	
    // add  | 00000 | ALURESULT <= A + B 
    #10;
    ALUControl <= 5'b0;
    A = 2;
    B = 3;
       
    
    // sub  | 00001 | ALURESULT <= A - B
    #10;
    ALUControl <= 5'b00001;
    A <= 3;
    B <= 2;
    
    // mul  | 00010 | ALURESULT <= A * B
    #10;
    ALUControl <= 5'b00010;
    A <= 2;
    B <= 3;
    
    #10;
    ALUControl <= 5'b00010;
    A <= -1;
    B <= 5;
    
    
    // mult | 00011 | (hi,lo) <= A * B
    #10;
    ALUControl <= 5'b00011;
    A <= 6;
    B <= 7;
    
    #10;
    A <= 2000000000;
    B <= 7;
    
    #10;
    A <= 2000000000;
    B <= -7;
    
    
    // madd | 00100 | (hi, lo) <= (hi, lo) + (A * B)
    #10;
    HI_in = 12;
    LO_in = 1;
    A <= 3;
    B <= 4;
    
    #10;
    HI_in = 12;
    LO_in = 1;
    A <= 3;
    B <= -4;
    
    
    // msub | 00101 | (hi, lo) <= (hi, lo) - (A * B)
    #10;
    HI_in = 12;
    LO_in = 1;
    A <= 3;
    B <= 4;
    
    #10;
    HI_in = 12;
    LO_in = 1;
    A <= 3;
    B <= -4;
      
    
    
    
    
    /* Data Subset */
    // lui  | 00110 |  ALURESULT <= imm || 0^16
    // bgez | 00111 |   
    // beq  | 01000 |
    // bne  | 01001 |
    // bgtz | 01010 |
    // blez | 01011 |
    // bltz | 01100 |
    // j    | 01101 |
    // jal  | 01110 |
    
    /* Logical Subset */
    // and  | 01111 |   ALUResult <= A & B;
    #10;
    ALUControl <=5'b01111;
    A <= 10;
    B <= 10;
    
    #10;
    A <= 9;
    B <= 10;
    
    #10;
    A <= -1;
    B <= -1;
    
    #10;
    A <= -1;
    B <= 1;

    // or   | 10000 |   ALUResult <= A | B;
    ALUControl <= 5'b10000;
    A <= 1;
    
    
    // nor  | 10001 |   ALUResult <= ~(A | B);
    // xor  | 10010 |   ALUResult <= (A & ~B) | (~A | B);
    // seh  | 10011 |   ALUResult <= SignExt(B[15:0]);
    // sll  | 10100 |   ALUResult <= B << A;
    // srl  | 10101 |   ALUResult <= B >> A;
    // movn | 10110 |   if (B != 0) ALUResult <= A;
    // movz | 10111 |   if (B == 0) ALUResult <= A;
    // rotr | 11000 |   ALUResult <= ((A >> B) | (A << (32-B)));
    // sra  | 11001 |   ALUResult <= B >> A (arithmetic);
    // seb  | 11010 |   ALUResult <= SignExtend(B[7:0]);
    // slt  | 11011 |   ALUResult <= (A < B);
    // mthi | 11100 |   HI_out <= A;
    // mtlo | 11101 |   LO_out <= A;
    // mfhi | 11110 |   ALUResult <= HI_in;
    // mflo | 11111 |   ALUResult <= LO_in;    
    
    
	
	end

endmodule

