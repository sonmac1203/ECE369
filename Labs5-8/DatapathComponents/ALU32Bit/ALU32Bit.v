`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

// Op|'ALUControl' value  | Description | Notes
// ==========================
// ADDITION       |  | ALUResult = A + B
// SUBRACTION     |  | ALUResult = A - B
// MULTIPLICATION |  | ALUResult = A * B        (see notes below)
// AND            |  | ALUResult = A and B
// OR             |  | ALUResult = A or B
// SET LESS THAN  |  | ALUResult =(A < B)? 1:0  (see notes below)
// SET EQUAL      |  | ALUResult =(A=B)  ? 1:0
// SET NOT EQUAL  |  | ALUResult =(A!=B) ? 1:0
// LEFT SHIFT     |  | ALUResult = A << B       (see notes below)
// RIGHT SHIFT    |  | ALUResult = A >> B	    (see notes below)
// ROTATE RIGHT   |  | ALUResult = A ROTR B     (see notes below)

/* Arithmetic */



// add      - add
// addiu    - add
// addu     - add
// addi     - add
// sub      - sub
// mul      - mul
// mult     - mult
// multu    - mult
// madd     - MADD
// msub     - msub


/* DATA */

// lw       - add
// sw       - add
// sb       - add
// lh       - add
// lb       - add
// sh       - add
// lui      - lui

/* Branches */

// bgez     - bgez
// beq      - beq
// bne      - bne
// bgtz     - bgtz
// blez     - blez
// bltz     - bltz
// j        - j
// jr       - j
// jal      - jal

/* Logical */

// and      - and
// andi     - and
// or       - or
// nor      - nor
// xor      - xor
// ori      - or
// xori     - xor
// seh      - seh
// sll      - sll
// srl      - srl
// sllv     - sll
// srlv     - srl
// slt      - slt
// slti     - slt
// movn     - movn
// movz     - movz
// rotrv    - rotr
// rotr     - rotr
// sra      - sra
// srav     - sra
// seb      - seb
// sltiu    - slt
// sltu     - slt


/* Hi Lo */

// mthi     -mthi
// mtlo     -mtlo
// mfhi     -mfhi
// mflo     -mflo




/*
 *  Unique Operations
 */

// add, sub, mul, mult, MADD, msub, lui, bgez, beq, bne, bgtz, blez, bltz, j, jal
// and, or, nor, xor, seh, sll, srl, movn, movz, rotr, sra, seb slt, mthi, mtlo, mfhi, mflo



// Op   |'ALUControl' value  | Description | Notes
/* Arithmetic Subset */
// add  | 00000 | ALURESULT <= A + B 
// sub  | 00001 | ALURESULT <= A - B
// mul  | 00010 | ALURESULT <= A * B
// mult | 00011 | (hi,lo) <= A * B
// madd | 00100 | (hi, lo) <= (hi, lo) + (A * B)
// msub | 00101 | (hi, lo) <= (hi, lo) - (A * B)

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
// and  | 01111 |
// or   | 10000 |
// nor  | 10001 |
// xor  | 10010 |
// seh  | 10011 |
// sll  | 10100 |
// srl  | 10101 |
// movn | 10110 |
// movz | 10111 |
// rotr | 11000 |
// sra  | 11001 |
// seb  | 11010 |
// slt  | 11011 |
// mthi | 11100 |
// mtlo | 11101 |
// mfhi | 11110 |
// mflo | 11111 |



module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input [4:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input [31:0] A, B;	    // inputs

	output reg [31:0] ALUResult;	// answer
	output reg Zero;	    // Zero=1 if ALUResult == 0

    /* Please fill in the implementation here... */
    
    /*
     *
     *  Arithmetic Type
     *
     */
    
    always @ (*)    begin
         
         Zero <= 0;
         
         if (ALUControl == 4'b00000)    begin
             //A + B
             
             ALUResult = A + B;
             if (ALUResult == 0)
                 Zero <= 1;
         end
         
         
         
         
    
    
    
    /*
     *
     *  Data Type
     *
     */
    
    
    
    
    
    
    
    /*
     *
     *  Branch Type
     *
     */
    
    
    
    
    
    
    
    /*
     *
     *  Logical Type
     *
     */
    
    
    end
endmodule

