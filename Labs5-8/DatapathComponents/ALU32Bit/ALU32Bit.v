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
// and  | 01111 |   ALUResult <= A & B;
// or   | 10000 |   ALUResult <= A | B;
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



module ALU32Bit(ALUControl, A, B, ALUResult, Zero, LO_in, LO_out, HI_in, HI_out);

	input [4:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input [31:0] A, B;	    // inputs

    input [31:0] LO_in;
    input [31:0] HI_in;


	output reg [31:0] ALUResult;	// answer
	output reg Zero;	    // Zero=1 if ALUResult == 0
	
	output reg [31:0] HI_out;
	output reg [31:0] LO_out;
	
	
	reg [63:0] temp;	

    /* Please fill in the implementation here... */
    
    /*
     *
     *  Arithmetic Type
     *
     */
    
    always @ (*)    begin
         
         Zero <= 0;
         //ALUResult <= 0;
         
         if (ALUControl == 5'b00000)    begin
             //A + B    
             ALUResult <= A + B;
             if (ALUResult == 0)
                 Zero <= 1;
         end
         
         
         else if (ALUControl == 5'b00001)    begin
            //A - B
            ALUResult = A-B;
            if (ALUResult == 0)
                Zero <= 1;
         end
         
         

         // mul  | 00010 | ALURESULT <= A * B
         else if (ALUControl == 5'b00010)    begin
            ALUResult <= A * B;
            if (ALUResult == 0)
                Zero <= 1;
         end
         
         // mult | 00011 | (hi,lo) <= A * B
         else if (ALUControl == 5'b00011)   begin
            temp = A * B;
            HI_out = temp[63:32];
            LO_out = temp[31:0];
            if (temp == 0)
                Zero <= 1;
         end
         
         
         // madd | 00100 | (hi, lo) <= (hi, lo) + (A * B)
         else if (ALUControl == 5'b00100)   begin
            temp = $signed({HI_in, LO_in}) + $signed(($signed(A) * $signed(B)));
            
            HI_out = $signed(temp[63:32]);
            LO_out = $signed(temp[31:0]);
            if (temp == 0)
                Zero <= 1;
         end
         
         
         // msub | 00101 | (hi, lo) <= (hi, lo) - (A * B)
         else if (ALUControl == 5'b00101)   begin
            temp = $signed({HI_in, LO_in}) - $signed(($signed(A) * $signed(B)));
            
            
            //temp = temp - (A * B);
            
            HI_out = $signed(temp[63:32]);
            LO_out = $signed(temp[31:0]);
            if (temp == 0)
                Zero <= 1;
         end      
         
    
        /*
          *
          *  Logical Type
          *
          */
          
          // and  | 01111 |   ALUResult <= A & B;
          else if (ALUControl == 5'b01111)   begin
            ALUResult <= A & B;
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // or   | 10000 |   ALUResult <= A | B;
          else if (ALUControl == 5'b10000)   begin
            ALUResult <= A | B;
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // nor  | 10001 |   ALUResult <= ~(A | B);
          else if (ALUControl == 5'b10001)   begin
            ALUResult <= ~(A | B);
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // xor  | 10010 |   ALUResult <= (A & ~B) | (~A | B);
          else if (ALUControl == 5'b10010)   begin
            ALUResult <= (A & ~B) | (~A | B);
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          
          // seh  | 10011 |   ALUResult <= SignExt(B[15:0]);
          else if (ALUControl == 5'b10011)   begin
              if (B[15] == 0)    begin
                  ALUResult <= {16'b0, B[15:0]};
              end
              else begin    
                  ALUResult <= {16'b1111111111111111, B[15:0]};
              end
              if (ALUResult == 0)
                Zero <= 1;
          end
          
          
          // sll  | 10100 |   ALUResult <= B << A;
          else if (ALUControl == 5'b10100)   begin
            ALUResult <= B << A;
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // srl  | 10101 |   ALUResult <= B >> A;
          else if (ALUControl == 5'b10101)   begin
             ALUResult <= B >> A;
             if (ALUResult == 0)
                Zero <= 1;
          end
          
          // movn | 10110 |   if (B != 0) ALUResult <= A;
          else if (ALUControl == 5'b10110)  begin
            if (B != 0) 
                ALUResult <= A;
          end
          
          // movz | 10111 |   if (B == 0) ALUResult <= A;
          else if (ALUControl == 5'b10111)  begin
            if (B == 0) 
                ALUResult <= A;
          end
          
          // rotr | 11000 |   ALUResult <= ((A >> B) | (A << (32-B)));
          else if (ALUControl == 5'b11000)  begin
            ALUResult <= ((A >> B) | (A << (32-B)));
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // sra  | 11001 |   ALUResult <= B >> A (arithmetic);
          else if (ALUControl == 5'b11001)  begin
            if (B[31] == 0)    begin
                ALUResult <= B >> A;
            end
            else begin
                //TODO check this in benchmarks
                temp[31:0] = (~B) >> A;
                ALUResult <= ~temp[31:0];
            end
            if (ALUResult == 0)
               Zero <= 1;
          
          end
          
          // seb  | 11010 |   ALUResult <= SignExtend(B[7:0]);
          else if (ALUControl == 5'b11010)   begin  
              if (B[7] == 0)    begin
                  ALUResult <= {24'b0, B[7:0]};
              end
              else begin    
                  ALUResult <= {24'b111111111111111111111111, B[7:0]};
              end
              if (ALUResult == 0)
                Zero <= 1;
          end
          
          // slt  | 11011 |   ALUResult <= (A < B);
          else if (ALUControl == 5'b11011)   begin
            ALUResult <= (A < B);
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // mthi | 11100 |   HI_out <= A;
          else if (ALUControl == 5'b11100)   begin
            HI_out <= A;
          end
          
          // mtlo | 11101 |   LO_out <= A;
          else if (ALUControl == 5'b11101)   begin
            LO_out <= A;
          end
          
          // mfhi | 11110 |   ALUResult <= HI_in;
          else if (ALUControl == 5'b11110)   begin
            ALUResult <= HI_in;
          end
          
          // mflo | 11111 |   ALUResult <= LO_in;
          else if (ALUControl == 5'b11111)   begin
            ALUResult <= LO_in;
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
    
    

    
    
    end
endmodule

