`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lena Voytek & Mitchell Dzurick
// 
// Create Date: 10/12/2018 11:01:02 AM
// Design Name: 
// Module Name: Controller
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


module Controller(Instruction, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg);

    input [31:0] Instruction;

    output reg ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemToReg;
    output reg [5:0] ALUOp;
    
    
    //        | I31:26 | I10:6 | I05:00 |
    // INSTR  | OPCODE | SPECI |  FUNC  | ALUOP

    // add    | 000000 | 00000 | 100000 | add
    // addu   | 000000 | 00000 | 100001 | addu
    // sub    | 000000 | 00000 | 100010 | sub
    // mult   | 000000 | 00000 | 011000 | mult
    // multu  | 000000 | 00000 | 011001 | multu
    // and    | 000000 | 00000 | 100100 | and
    // or     | 000000 | 00000 | 100101 | or
    // nor    | 000000 | 00000 | 100111 | nor
    // xor    | 000000 | 00000 | 100110 | xor
    // sll    | 000000 | ----- | 000000 | sll
    // srl    | 000000 | ----- | 000010 | srl
    // sllv   | 000000 | 00000 | 000100 | sll
    // srlv   | 000000 | 0000- | 000110 | srl
    // slt    | 000000 | 00000 | 101010 | slt
    // movn   | 000000 | 00000 | 001011 | movn
    // movz   | 000000 | 00000 | 001010 | movz
    // rotrv  | 000000 | 0000- | 000110 | rotr
    // rotr   | 000000 | ----- | 000010 | rotr
    // sra    | 000000 | ----- | 000011 | sra
    // srav   | 000000 | 00000 | 000111 | sra
    // sltu   | 000000 | 00000 | 101011 | sltu
    // mthi   | 000000 | 00000 | 010001 | mthi
    // mtlo   | 000000 | 00000 | 010011 | mtlo
    // mfhi   | 000000 | 00000 | 010000 | mfhi
    // mflo   | 000000 | 00000 | 010010 | mflo



    // addiu  | 001001 | ----- | ------ | addu
    // addi   | 001000 | ----- | ------ | add
    // mul    | 011100 | 00000 | 000010 | mul
    // madd   | 011100 | 00000 | 000000 | madd
    // msub   | 011100 | 00000 | 000100 | msub
    // andi   | 001100 | ----- | ------ | and
    // ori    | 001101 | ----- | ------ | or
    // xori   | 001110 | ----- | ------ | xor
    // seh    | 011111 | 11000 | 100000 | seh
    // slti   | 001010 | ----- | ------ | slt
    // seb    | 011111 | 10000 | 100000 | seb
    // sltiu  | 001011 | ----- | ------ | sltu


    always@(Instruction) begin




        //OPCode 0 Operations
        if(Instruction[31:26] == 6'b0) begin
        
            //Ops with zeroes in beginning
            if(Instruction[25:22] == 4'b0) begin
                //sll, srl, rotr, sra 
               
            end 
            else begin
                
            
            end
        end

    end
    
    
    
/*            //add
            ALUSrc <= 1;
            RegDst <= 1;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            MemToReg <= 0;
            //  PCSrc <= 0;
            ALUOp <= 6'b0; //add
        end
        66: begin //sub
            ALUSrc <= 1;
            RegDst <= 1;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            MemToReg <= 0;
            //  PCSrc <= 0;
            ALUOp <= 6'b1; //sub
        end
        68: begin //and
            ALUSrc <= 1;
            RegDst <= 1;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            MemToReg <= 0;
            //  PCSrc <= 0;
            ALUOp <= 6'b11;
        end
        69: begin //or
            ALUSrc <= 1;
            RegDst <= 1;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            MemToReg <= 0;
            //  PCSrc <= 0;
            ALUOp <= 6'b100;        
        end
        82:begin //slt
            ALUSrc <= 1;
            RegDst <= 1;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            MemToReg <= 0;
            //  PCSrc <= 0;
            ALUOp <= 6'b101;        
        end
        0:begin //sll
            ALUSrc <= 1;
            RegDst <= 1;
            RegWrite <= 1;
            MemRead <= 1;
            MemWrite <= 1;
            MemToReg <= 1;
            //  PCSrc <= 0;
            ALUOp <= 6'b1000;        
        end
        2:begin //srl
             ALUSrc <= 1;
            RegDst <= 1;
            RegWrite <= 1;
            MemRead <= 1;
            MemWrite <= 1;
            MemToReg <= 1;
            //  PCSrc <= 0;
            ALUOp <= 6'b1001;       
        end
*/

endmodule
