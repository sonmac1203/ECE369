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


module Controller(Instruction, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg, ALUSft, ZEROSrc, branch);

    input [31:0] Instruction;

    output reg ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemToReg, ALUSft, ZEROSrc, branch;
    output reg [5:0] ALUOp;
    
    
    //        | I31:26 | I10:6 | I05:00 |
    // INSTR  | OPCODE | SPECI |  FUNC  | ALUOP
    
    // sll    | 000000 | ----- | 000000 | sll
    // srl    | 000000 | ----- | 000010 | srl
    // rotr   | 000000 | ----- | 000010 | rotr
    // sra    | 000000 | ----- | 000011 | sra

    // add    | 000000 | 00000 | 100000 | add
    // addu   | 000000 | 00000 | 100001 | addu
    // sub    | 000000 | 00000 | 100010 | sub
    // mult   | 000000 | 00000 | 011000 | mult
    // multu  | 000000 | 00000 | 011001 | multu
    // and    | 000000 | 00000 | 100100 | and
    // or     | 000000 | 00000 | 100101 | or
    // nor    | 000000 | 00000 | 100111 | nor
    // xor    | 000000 | 00000 | 100110 | xor
    // sllv   | 000000 | 00000 | 000100 | sll
    // slt    | 000000 | 00000 | 101010 | slt
    // movn   | 000000 | 00000 | 001011 | movn
    // movz   | 000000 | 00000 | 001010 | movz
    // srlv   | 000000 | 00000 | 000110 | srl
    // rotrv  | 000000 | 00001 | 000110 | rotr
    // srav   | 000000 | 00000 | 000111 | sra
    // sltu   | 000000 | 00000 | 101011 | sltu
    // mthi   | 000000 | 00000 | 010001 | mthi
    // mtlo   | 000000 | 00000 | 010011 | mtlo
    // mfhi   | 000000 | 00000 | 010000 | mfhi
    // mflo   | 000000 | 00000 | 010010 | mflo

    // mul    | 011100 | 00000 | 000010 | mul
    // madd   | 011100 | 00000 | 000000 | madd
    // msub   | 011100 | 00000 | 000100 | msub

    // seh    | 011111 | 11000 | 100000 | seh
    // seb    | 011111 | 10000 | 100000 | seb
    
    // addiu  | 001001 | ----- | ------ | addu
    // addi   | 001000 | ----- | ------ | add
    // andi   | 001100 | ----- | ------ | and
    // ori    | 001101 | ----- | ------ | or
    // xori   | 001110 | ----- | ------ | xor
    // slti   | 001010 | ----- | ------ | slt
    // sltiu  | 001011 | ----- | ------ | sltu
    
    initial begin
    
        branch <= 0;
    
    
    end


    always@(Instruction) begin

        branch <= 0;
    
        //NOP
        if(Instruction == 32'b0) begin
            RegWrite <= 0;
            ALUOp <= 6'b000000;
            MemWrite <= 0;
            //PCSrc <=  ;
        
        end

        //R-Type Operations with OP Code 000000
        else if(Instruction[31:26] == 6'b000000) begin
            
            //sll
            if(Instruction[5:0] == 6'b000000) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b010100;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 1;
                //PCSrc <=  ;   
            end
        
            //srl & rotr
            else if(Instruction[5:0] == 6'b000010) begin
                
                //srl
                if(Instruction[21] == 1'b0) begin
                    ALUSrc <= 0;
                    RegDst <= 1;
                    RegWrite <= 1;
                    ALUOp <= 6'b010101;
                    MemWrite <= 0;
                    MemToReg <= 1;
                    ALUSft <= 1;
                    //PCSrc <=  ;
                end
                
                //rotr
                else begin
                   ALUSrc <= 0;
                    RegDst <= 1;
                    RegWrite <= 1;
                    ALUOp <= 6'b011000;
                    MemWrite <= 0;
                    MemToReg <= 1;
                    ALUSft <= 1;
                    //PCSrc <=  ;
                end 
            end
            
            //sra
            else if(Instruction[5:0] == 6'b000011) begin  
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b011001;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 1;
                //PCSrc <=  ;  
            end
                
        
        //Arithmetic and bitwise logical R-Type Operations
            
            //add
            else if(Instruction[5:0] == 6'b100000) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b000000;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;
            end
            
            //addu
            else if(Instruction[5:0] == 6'b100001) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b100000;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;
            end
            
            //sub
            else if(Instruction[5:0] == 6'b100010) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b000001;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;
            end
            
            //mult
            else if(Instruction[5:0] == 6'b011000) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b000011;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                 
            end
            
            //multu
            else if(Instruction[5:0] == 6'b011001) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b100001;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                       
            end
            
            //and
            else if(Instruction[5:0] == 6'b100100) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b001111;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                        
            end
            
            //or
            else if(Instruction[5:0] == 6'b100101) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b010000;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                    
            end
            
            //nor
            else if(Instruction[5:0] == 6'b100111) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b010001;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                            
            end
            
            //xor
            else if(Instruction[5:0] == 6'b100110) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b010010;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                           
            end
            
            //sllv
            else if(Instruction[5:0] == 6'b000100) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b010100;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                          
            end
            
            //slt
            else if(Instruction[5:0] == 6'b101010) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b011011;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                            
            end
            
            //movn
            else if(Instruction[5:0] == 6'b001011) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b010110;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                       
            end
            
            //movz
            else if(Instruction[5:0] == 6'b001010) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b010111;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                            
            end
            
            //srlv & rotrv
            else if(Instruction[5:0] == 6'b000110) begin
            
                //srlv
                if(Instruction[6] == 1'b0) begin
                    ALUSrc <= 0;
                    RegDst <= 1;
                    RegWrite <= 1;
                    ALUOp <= 6'b010101;
                    MemWrite <= 0;
                    MemToReg <= 1;
                    ALUSft <= 0;
                    //PCSrc <=  ;
                end
                
                //rotrv
                else begin
                    ALUSrc <= 0;
                    RegDst <= 1;
                    RegWrite <= 1;
                    ALUOp <= 6'b011000;
                    MemWrite <= 0;
                    MemToReg <= 1;
                    ALUSft <= 0;
                    //PCSrc <=  ;
                end                             
            end
            
            //srav
            else if(Instruction[5:0] == 6'b000111) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b011001;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                          
            end
            
            //sltu
            else if(Instruction[5:0] == 6'b101011) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b100010;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                           
            end
            
            //mthi
            else if(Instruction[5:0] == 6'b010001) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b011100;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                     
            end
            
            //mtlo
            else if(Instruction[5:0] == 6'b010011) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b011101;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                            
            end
            
            //mfhi
            else if(Instruction[5:0] == 6'b010000) begin
                ALUSrc <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b011110;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                RegDst <= 1;
                //PCSrc <=  ;                                                       
            end
            
            //mflo
            else if(Instruction[5:0] == 6'b010010) begin
                ALUSrc <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b011111;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                RegDst <= 1;
                //PCSrc <=  ;                                                                                      
            end   
        end
        
        //Multiplication R-Type
        else if(Instruction[31:26] == 6'b011100) begin
        
            //mul
            if(Instruction[5:0] == 6'b000010) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b000010;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;
            end
            
            //madd
            else if(Instruction[5:0] == 6'b000000) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b000100;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                                                      
            end
            
            //msub
            else if(Instruction[5:0] == 6'b000100) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b000101;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;                                                                                       
            end
        end
        
        //Sign Extension
        else if(Instruction[31:26] == 6'b011111) begin
        
            //seh
            if(Instruction[9] == 1'b1) begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b010011;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;
            end
            
            //seb
            else begin
                ALUSrc <= 0;
                RegDst <= 1;
                RegWrite <= 1;
                ALUOp <= 6'b011010;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                //PCSrc <=  ;
            end
        end
        
        //I-Type Operations
        else begin
            
            //addiu
            if(Instruction[31:26] == 6'b001001) begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b100000;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                ZEROSrc <= 0;
                //PCSrc <=  ;
            end
            
            //addi
            else if(Instruction[31:26] == 6'b001000) begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b000000;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                ZEROSrc <= 0;
                //PCSrc <=  ;               
            end
            
            //andi
            else if(Instruction[31:26] == 6'b001100) begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b001111;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                ZEROSrc <= 1;
                //PCSrc <=  ;                     
            end
            
            //ori
            else if(Instruction[31:26] == 6'b001101) begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b010000;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                ZEROSrc <= 1;
                //PCSrc <=  ;               
            end
            
            //xori
            else if(Instruction[31:26] == 6'b001110) begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b010010;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                ZEROSrc <= 1;
                //PCSrc <=  ;                   
            end
        
            //slti
            else if(Instruction[31:26] == 6'b001010) begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b011011;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                ZEROSrc <= 0;
                //PCSrc <=  ;               
            end
            
            //sltiu
            else if(Instruction[31:26] == 6'b001011) begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b100010;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                ZEROSrc <= 1;
                //PCSrc <=  ;                
            end
        end
    end
endmodule
