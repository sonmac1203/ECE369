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


/* Arithmetic */

// Op   |'ALUControl' value  | Description | Notes
/* Arithmetic Subset */
// add  | 000000 | ALURESULT <= A + B signed
// addu | 100000 | ALUResult <= A + B unsigned 
// sub  | 000001 | ALURESULT <= A - B
// mul  | 000010 | ALURESULT <= A * B
// mult | 000011 | (hi, lo) <= A * B signed
// multu| 100001 | (hi, lo) <= A * B unsigned
// madd | 000100 | (hi, lo) <= (hi, lo) + (A * B)
// msub | 000101 | (hi, lo) <= (hi, lo) - (A * B)

/* Data Subset */
// lui  | 000110 |  ALURESULT <= imm || 0^16

/*  Branch SubSet */

// bgez | 000111 |   if rs >= 0, then branch
// beq  | 001000 |   if rs == rt, then branch
// bne  | 001001 |   if rs !=  rt, then branch
// bgtz | 001010 |   if rs  >  0, then branch
// blez | 001011 |   if rs <= 0, then branch
// bltz | 001100 |   if rs  <  0, then branch
// j    | 001101 |   PC = PC + I[25:0]
// jal  | 001110 |   PC = PC + I[25:0] & link
// jr   | 100011 |   PC <- rs (I[25:21])

/* Logical Subset */
// and  | 001111 |   ALUResult <= A & B;
// or   | 010000 |   ALUResult <= A | B;
// nor  | 010001 |   ALUResult <= ~(A | B);
// xor  | 010010 |   ALUResult <= (A & ~B) | (~A | B);
// seh  | 010011 |   ALUResult <= SignExt(B[15:0]);
// sll  | 010100 |   ALUResult <= B << A;
// srl  | 010101 |   ALUResult <= B >> A;
// movn | 010110 |   if (B != 0) ALUResult <= A;
// movz | 010111 |   if (B == 0) ALUResult <= A;
// rotr | 011000 |   ALUResult <= ((A >> B) | (A << (32-B)));
// sra  | 011001 |   ALUResult <= B >> A (arithmetic);
// seb  | 011010 |   ALUResult <= SignExtend(B[7:0]);
// slt  | 011011 |   ALUResult <= (A < B) signed
// sltu | 100010 |   ALUResult <= (A < B) unsigned
// mthi | 011100 |   HI_out <= A;
// mtlo | 011101 |   LO_out <= A;
// mfhi | 011110 |   ALUResult <= HI_in;
// mflo | 011111 |   ALUResult <= LO_in;



module ALU32Bit(ALUControl, A, B, ALUResult, Zero, LO_in, LO_out, HI_in, HI_out);

	input [5:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input [31:0] A, B;	    // inputs

    input [31:0] LO_in;
    input [31:0] HI_in;


	output reg [31:0] ALUResult;	// answer
	output reg Zero;	    // Zero=1 if ALUResult == 0
	
	output reg [31:0] HI_out;
	output reg [31:0] LO_out;
	
	reg [63:0] temp;
    
    always @ (*)    begin
         
         Zero <= 0;
         //ALUResult <= 0;
         
         if (ALUControl == 6'b00000)    begin
             //A + B signed
             ALUResult <= $signed(A) + $signed(B);
             if (ALUResult == 0)
                 Zero <= 1;
         end
         
         if (ALUControl == 6'b100000)   begin
            //A + B unsigned
            ALUResult <= A + B; //UNSIGNED
            if (ALUResult == 0)
                Zero <= 1;           
         end
         
         
         else if (ALUControl == 6'b00001)    begin
            //A - B
            ALUResult = $signed(A) - $signed(B);
            if (ALUResult == 0)
                Zero <= 1;
         end
         

         // mul  | 00010 | ALURESULT <= A * B
         else if (ALUControl == 6'b00010)    begin
            ALUResult <= $signed(A) * $signed(B);
            if (ALUResult == 0)
                Zero <= 1;
         end
         
         // mult | 00011 | (hi,lo) <= A * B
         else if (ALUControl == 6'b00011)   begin
            temp = $signed(A) * $signed(B);
            HI_out = temp[63:32];
            LO_out = temp[31:0];
            if (temp == 0)
                Zero <= 1;
         end
         
         // multu| 100001 | (hi, lo) <= A * B unsigned
         else if (ALUControl == 6'b100001)  begin
            temp = A * B;   //UNSIGNED
             HI_out = temp[63:32];
             LO_out = temp[31:0];
             if (temp == 0)
                 Zero <= 1;
         end
         
         // madd | 00100 | (hi, lo) <= (hi, lo) + (A * B)
         else if (ALUControl == 6'b00100)   begin
            temp = $signed({HI_in, LO_in}) + $signed(($signed(A) * $signed(B)));
            
            HI_out = $signed(temp[63:32]);
            LO_out = $signed(temp[31:0]);
            if (temp == 0)
                Zero <= 1;
         end
         
         
         // msub | 00101 | (hi, lo) <= (hi, lo) - (A * B)
         else if (ALUControl == 6'b000101)   begin
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
          else if (ALUControl == 6'b01111)   begin
            ALUResult <= A & B;
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // or   | 10000 |   ALUResult <= A | B;
          else if (ALUControl == 6'b10000)   begin
            ALUResult <= A | B;
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // nor  | 10001 |   ALUResult <= ~(A | B);
          else if (ALUControl == 6'b10001)   begin
            ALUResult <= ~(A | B);
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // xor  | 10010 |   ALUResult <= (A & ~B) | (~A | B);
          else if (ALUControl == 6'b10010)   begin
            ALUResult <= (A & ~B) | (~A & B);
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          
          // seh  | 10011 |   ALUResult <= SignExt(B[15:0]);
          else if (ALUControl == 6'b10011)   begin
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
          else if (ALUControl == 6'b10100)   begin
            ALUResult <= B << A;
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // srl  | 10101 |   ALUResult <= B >> A;
          else if (ALUControl == 6'b10101)   begin
             ALUResult <= B >> A;
             if (ALUResult == 0)
                Zero <= 1;
          end
          
          // movn | 10110 |   if (B != 0) ALUResult <= A;
          else if (ALUControl == 6'b10110)  begin
            if (B != 0) 
                ALUResult <= A;
          end
          
          // movz | 10111 |   if (B == 0) ALUResult <= A;
          else if (ALUControl == 6'b10111)  begin
            if (B == 0) 
                ALUResult <= A;
          end
          
          // rotr | 11000 |   ALUResult <= ((A >> B) | (A << (32-B)));
          else if (ALUControl == 6'b11000)  begin
            ALUResult <= ((B >> A[4:0]) | (B << (32-A[4:0])));
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // sra  | 11001 |   ALUResult <= B >> A (arithmetic);
          else if (ALUControl == 6'b11001)  begin
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
          else if (ALUControl == 6'b11010)   begin  
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
          else if (ALUControl == 6'b11011)   begin
            ALUResult <= ($signed(A) < $signed(B));
            if (ALUResult == 0)
                Zero <= 1;
          end
          
          // sltu | 100010 |   ALUResult <= (A < B) unsigned
          else if (ALUControl == 6'b100010) begin
            ALUResult <= (A < B);
            if (ALUResult == 0)
              Zero <= 1;

          end
          
          // mthi | 11100 |   HI_out <= A;
          else if (ALUControl == 6'b11100)   begin
            HI_out <= A;
          end
          
          // mtlo | 11101 |   LO_out <= A;
          else if (ALUControl == 6'b011101)   begin
            LO_out <= A;
          end
          
          // mfhi | 011110 |   ALUResult <= HI_in;
          else if (ALUControl == 6'b011110)   begin
            ALUResult <= HI_in;
          end
          
          // mflo | 011111 |   ALUResult <= LO_in;
          else if (ALUControl == 6'b011111)   begin
            ALUResult <= LO_in;
          end
          
          
          /* Data Subset */
          
          // lui  | 000110 |  ALURESULT <= imm || 0^16
          else if (ALUControl == 6'b000110) begin
            ALUResult <= {B, 16'b0};
            if (ALUResult == 0)
                Zero <= 1;
          end

          /*  Branch SubSet */
          //
          //    Branch statements use ALU only for the zero flag.
          //    If zero is high, branch is taken.
          //
          //
          
          // bgez | 000111 |   if rs >= 0, then branch
          else if (ALUControl == 6'b000111) begin
            if (A >= 0)
                Zero <= 1;
          end
          
          // beq  | 001000 |   if rs == rt, then branch
          else if (ALUControl == 6'b001000) begin
            if (A == B)
                Zero <= 1;
          end
          
          // bne  | 001001 |   if rs !=  rt, then branch
          else if (ALUControl == 6'b001001) begin
            if (A != B)
                Zero <= 1;
          end
          
          // bgtz | 001010 |   if rs  >  0, then branch
          else if (ALUControl == 6'b001010) begin
            if (A > 0)
                Zero <= 1;
          end
          
          // blez | 001011 |   if rs <= 0, then branch
          else if (ALUControl == 6'b001011) begin
            if (A <= 0)
                Zero <= 1;
          end
          
          // bltz | 001100 |   if rs  <  0, then branch
          else if (ALUControl == 6'b001100) begin
            if (A < 0)
                Zero <= 1;
          end
          
          // j    | 001101 |   PC = PC + I[25:0]
          else if (ALUControl == 6'b001101) begin
            Zero <= 1;
          end
          // jal  | 001110 |   PC = PC + I[25:0] & link
          else if (ALUControl == 6'b001110) begin
            Zero <= 1;
          end
          
          // jr   | 100011 |   PC <- rs (I[25:21])
          else if (ALUControl == 6'b100011) begin
            Zero <= 1;
          end
        





    
    end
endmodule

