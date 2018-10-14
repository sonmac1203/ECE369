`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////


//module ALU32Bit(ALUControl, A, B, ALUResult, Zero, LO_in, LO_out, HI_in, HI_out);

module ALU32Bit_tb(); 

	reg [5:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs
	reg [31:0] HI_in;
	reg [31:0] LO_in;

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    wire [31:0] HI_out;
    wire [31:0] LO_out;


//module ALU32Bit(ALUControl, A, B, ALUResult, Zero, LO_in, LO_out, HI_in, HI_out);


    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero),
        .LO_in(LO_in),
        .LO_out(LO_out),
        .HI_in(HI_in),
        .HI_out(HI_out)
    );
    
	initial begin
	ALUControl <= 0;
    A = 0;
    B = 0;
    HI_in = 0;
    LO_in = 0;
    
	
    // add  | 00000 | ALURESULT <= A + B 
    #10;
    ALUControl <= 6'b0;
    A <= 2;
    B <= 3;
    
    #10;
    A <= 2;
    B <= -1;
    
       
    // addu | 100000 | ALUResult <= A + B unsigned 
    #10;
    ALUControl <= 6'b100000;
    A <= 2;
    B <= 3;
       
    #10;
    A <= 2;
    B <= -1;
    
    
    // sub  | 00001 | ALURESULT <= A - B
    #10;
    ALUControl <= 6'b00001;
    A <= 3;
    B <= 2;
    
    #10;
    A <= 3;
    B <= -2;
    
    
    // mul  | 00010 | ALURESULT <= A * B
    #10;
    ALUControl <= 6'b00010;
    A <= 2;
    B <= 3;
    
    #10;
    ALUControl <= 6'b00010;
    A <= -1;
    B <= 5;
    
    
    // mult | 00011 | (hi,lo) <= A * B
    #10;
    ALUControl <= 6'b00011;
    A <= 6;
    B <= 7;
    
    #10;
    A <= 2000000000;
    B <= 7;
    
    #10;
    A <= 2000000000;
    B <= -7;
    
    // multu| 100001 | (hi, lo) <= A * B unsigned
    #10;
    ALUControl <= 6'b100001;
    A <= 6;
    B <= 7;
    
    #10;
    A <= -1;
    B <= 3;
    
    
    
    // madd | 00100 | (hi, lo) <= (hi, lo) + (A * B)
    #10;
    ALUControl <= 6'b00100;
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
    ALUControl <= 6'b00101;
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
    ALUControl <=6'b01111;
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
    #10;
    ALUControl <= 6'b10000;
    A <= 1;
    B <= 1;
    
    #10;
    A <= 1;
    B <= 3;
     
    #10;
    A <= 1;
    B <= 4;
    
    
    // nor  | 10001 |   ALUResult <= ~(A | B);
    #10;
    ALUControl <=6'b10001;
    // should result in something
    A <= 32'b1;
    B <= 32'b1;
    
    
    // xor  | 10010 |   ALUResult <= (A & ~B) | (~A | B);
    #10;
    ALUControl <= 6'b10010;
    //should be 1
    A <= 1;
    B <= 0;
    
    #10;
    // should be 2
    A <= 1;
    B <= 3;
    
    
    // seh  | 10011 |   ALUResult <= SignExt(B[15:0]);
    #10;
    ALUControl <= 6'b10011;
    B <= 12;
    
    #10;
    B <= 0;
    
    #10; 
    B <= 16'h0004;
    
    #10; 
    B <= 16'h7000;
    
    #10;
    B <= 16'h9000;
    
    #10;
    B <= 16'hF000;
    
    
    // sll  | 10100 |   ALUResult <= B << A;
    #10
    ALUControl <= 6'b10100;
    A <= 2;
    B <= 3;
    
    
    #10;
    A <= 0;
    B <= 3;
    
    #10;
    A <= 1;
    B <= 3;
    
    
    
    
    // srl  | 10101 |   ALUResult <= B >> A;
    #10;
    ALUControl <= 6'b10101;
    A <= 1;
    B <= 16;
    
    #10;
    
    A <= 2;
    B <= 12;
    
    
    
    // movn | 10110 |   if (B != 0) ALUResult <= A;
    #10;
    ALUControl <= 6'b10110;
    B <= 1;
    A <= 4;
    
    #10;
    B <= 0;
    A <= 0;
    
    
    // movz | 10111 |   if (B == 0) ALUResult <= A;
    #10;
    ALUControl <= 6'b10111;
    B <= 0;
    A <= 3;
    
    #10;
    B <= 1;
    A <= 0;
    
    
    // rotr | 11000 |   ALUResult <= ((A >> B) | (A << (32-B)));
    #10;
    ALUControl <= 6'b11000;
    A <= 32'b0000_0000_0000_0000_0000_0000_0000_1111;
    B <= 4;
    
    #10;
    
    A <= 20;
    B <= 1;
    
    #10;
    A <= 1;
    B <= 1;
    
    
    
    // sra  | 11001 |   ALUResult <= B >> A (arithmetic);
    #10;
    ALUControl <= 6'b11001;
    
    //should result in 3 1's at the leftmost side.
    B <= {1'b1, 31'b0};
    A <= 3;
    
    //should result in 0
    #10;
    B <= 32'b1;
    A <= 3;
    
    //should NOT extend the 1 bits.
    #10;
    B <= {1'b0, 1'b1, 30'b0};
    A <= 3;
    
    
    // seb  | 11010 |   ALUResult <= SignExtend(B[7:0]);
    #10;
    ALUControl <= 6'b11010; 
    
    //should result in all B's and 7 0's
    B <= 8'b1000_0000;
    
    #10;
    //should be all 0's
    B <= 8'b0;
    
    
    
    // slt  | 11011 |   ALUResult <= (A < B);
    #10;
    ALUControl <= 6'b11011;
    //should be 0
    A <= 5;
    B <= 3;
    
    #10;
    //should be 1
    A <= 3;
    B <= 5;
    
    #10;
    //should be 0
    A <= 3;
    B <= 3;
    
    #10;
    //should be 1
    A <= -4;
    B <= -3;
    
    #10;
    //should be 0
    A <= -3;
    B <= -4;
    
    
    // sltu | 100010 |   ALUResult <= (A < B) unsigned
    #10;
    ALUControl <= 6'b100010;
    
    A <= 5;
    B <= 3;
    
    #10;
    //should be 1
    A <= 3;
    B <= 5;
    
    #10;
    //should be 0
    A <= 3;
    B <= 3;
    
    #10;
    //should be 1
    A <= -4;
    B <= -3;
    
    #10;
    //should be 0
    A <= -3;
    B <= -4;



    // mthi | 11100 |   HI_out <= A;
    #10;
    ALUControl <= 6'b11100;
    A <= 32'b11111111111111111111111111111111;
    B <= 0;
    
    #10;
    A <= 32'b0;
    B <= 3;
    
    #10;
    A <= 32'b1;
    B <= 4;
    
    // mtlo | 11101 |   LO_out <= A;
    #10;
    ALUControl <= 6'b11101;
    A <= 32'b11111111111111111111111111111111;
    B <= 0;
    
    #10;
    A <= 32'b0;
    B <= 3;
    
    #10;
    A <= 32'b1;
    B <= 4;    
    
    
    // mfhi | 11110 |   ALUResult <= HI_in;
    #10;
    ALUControl <= 6'b11110;
    HI_in <= 32'b11111111111111111111111111111111;
    LO_in <= 0;
    A <= 0;
    B <= 0;
    
    #10;
    HI_in <= 32'b0;
    LO_in <= 3;
    A <= 2;
    B <= 1;
    
    #10;
    HI_in <= 32'b1;
    LO_in <= 4;   
    A <= 3;
    B <= 12;
    
    
    // mflo | 11111 |   ALUResult <= LO_in;    
    ALUControl <= 6'b11111;
    LO_in <= 32'b11111111111111111111111111111111;
    HI_in <= 0;
    A <= 0;
    B <= 0;
    
    #10;
    LO_in <= 32'b0;
    HI_in <= 3;
    A <= 2;
    B <= 1;
    
    #10;
    LO_in <= 32'b1;
    HI_in <= 4;   
    A <= 3;
    B <= 12;
    
	
	end

endmodule

