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


module Controller(Instruction, ALUSrc, RegDst, RegWrite, ALUOp, MemRead, MemWrite, MemToReg, ALUSft, ZEROSrc, branch, JalSrc, JZEROSrc, SEMCtrl);

    input [31:0] Instruction;

    output reg ALUSrc, RegDst, RegWrite, MemRead, MemWrite, MemToReg, ALUSft, ZEROSrc, branch, JalSrc, JZEROSrc;
    output reg [5:0] ALUOp;
    output reg [1:0] SEMCtrl;
    
    
    //        | I31:26 | I20:16| I10:6 | I05:00 |
    // INSTR  | OPCODE | jumpv | SPECI |  FUNC  | ALUOP
    
    // sll    | 000000 | ----- | ----- | 000000 | sll
    // srl    | 000000 | ----- | ----- | 000010 | srl
    // rotr   | 000000 | ----- | ----- | 000010 | rotr
    // sra    | 000000 | ----- | ----- | 000011 | sra

    // add    | 000000 | ----- | 00000 | 100000 | add
    // addu   | 000000 | ----- | 00000 | 100001 | addu
    // sub    | 000000 | ----- | 00000 | 100010 | sub
    // mult   | 000000 | ----- | 00000 | 011000 | mult
    // multu  | 000000 | ----- | 00000 | 011001 | multu
    // and    | 000000 | ----- | 00000 | 100100 | and
    // or     | 000000 | ----- | 00000 | 100101 | or
    // nor    | 000000 | ----- | 00000 | 100111 | nor
    // xor    | 000000 | ----- | 00000 | 100110 | xor
    // sllv   | 000000 | ----- | 00000 | 000100 | sll
    // slt    | 000000 | ----- | 00000 | 101010 | slt
    // movn   | 000000 | ----- | 00000 | 001011 | movn
    // movz   | 000000 | ----- | 00000 | 001010 | movz
    // srlv   | 000000 | ----- | 00000 | 000110 | srl
    // rotrv  | 000000 | ----- | 00001 | 000110 | rotr
    // srav   | 000000 | ----- | 00000 | 000111 | sra
    // sltu   | 000000 | ----- | 00000 | 101011 | sltu
    // mthi   | 000000 | ----- | 00000 | 010001 | mthi
    // mtlo   | 000000 | ----- | 00000 | 010011 | mtlo
    // mfhi   | 000000 | ----- | 00000 | 010000 | mfhi
    // mflo   | 000000 | ----- | 00000 | 010010 | mflo

    // mul    | 011100 | ----- | 00000 | 000010 | mul
    // madd   | 011100 | ----- | 00000 | 000000 | madd
    // msub   | 011100 | ----- | 00000 | 000100 | msub

    // seh    | 011111 | ----- | 11000 | 100000 | seh
    // seb    | 011111 | ----- | 10000 | 100000 | seb
    
    // addiu  | 001001 | ----- | ----- | ------ | addu
    // addi   | 001000 | ----- | ----- | ------ | add
    // andi   | 001100 | ----- | ----- | ------ | and
    // ori    | 001101 | ----- | ----- | ------ | or
    // xori   | 001110 | ----- | ----- | ------ | xor
    // slti   | 001010 | ----- | ----- | ------ | slt
    // sltiu  | 001011 | ----- | ----- | ------ | sltu
    
    // lw     | 100011 | ----- | ----- | ------ | add
    // sw     | 101011 | ----- | ----- | ------ | add
    // sb     | 101000 | ----- | ----- | ------ | add
    // lh     | 100001 | ----- | ----- | ------ | add
    // lb     | 100000 | ----- | ----- | ------ | add
    // sh     | 101001 | ----- | ----- | ------ | add
    // lui    | 001111 | ----- | ----- | ------ | lui
   
    // bgez   | 000001 | 00001 | ----- | ------ | bgez
    // bltz   | 000001 | 00000 | ----- | ------ | bltz
    // beq    | 000100 | ----- | ----- | ------ | beq
    // bne    | 000101 | ----- | ----- | ------ | bne
    // bgtz   | 000111 | 00000 | ----- | ------ | bgtz
    // blez   | 000110 | 00000 | ----- | ------ | blez
    // j      | 000010 | ----- | ----- | ------ | j
    // jr     | 000000 | ----- | ----- | 001000 | jr
    // jal    | 000011 | ----- | ----- | ------ | jal
    
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
            branch <= 0;
            JalSrc <= 1;
        
        end

        //Special R-Type Operations with OP Code 000000
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
                branch <= 0;
                JalSrc <= 1;   
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
                    branch <= 0;
                    JalSrc <= 1;
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
                    branch <= 0;
                    JalSrc <= 1;
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
                branch <= 0;
                JalSrc <= 1;  
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
                branch <= 0;
                JalSrc <= 1;
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
                branch <= 0;
                JalSrc <= 1;
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
                branch <= 0;
                JalSrc <= 1;
            end
            
            //mult
            else if(Instruction[5:0] == 6'b011000) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b000011;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                branch <= 0;
                JalSrc <= 1;                                                 
            end
            
            //multu
            else if(Instruction[5:0] == 6'b011001) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b100001;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                branch <= 0;
                JalSrc <= 1;                                                       
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
                branch <= 0;
                JalSrc <= 1;                                                        
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
                branch <= 0;
                JalSrc <= 1;                                                    
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
                branch <= 0;
                JalSrc <= 1;                                                            
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
                branch <= 0;
                JalSrc <= 1;                                                           
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
                branch <= 0;
                JalSrc <= 1;                                                          
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
                branch <= 0;
                JalSrc <= 1;                                                            
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
                branch <= 0;
                JalSrc <= 1;                                                       
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
                branch <= 0;
                JalSrc <= 1;                                                            
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
                    branch <= 0;
                    JalSrc <= 1;
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
                    branch <= 0;
                    JalSrc <= 1;
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
                branch <= 0;
                JalSrc <= 1;                                                          
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
                branch <= 0;
                JalSrc <= 1;                                                           
            end
            
            //mthi
            else if(Instruction[5:0] == 6'b010001) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b011100;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                branch <= 0;
                JalSrc <= 1;                                                     
            end
            
            //mtlo
            else if(Instruction[5:0] == 6'b010011) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b011101;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                branch <= 0;
                JalSrc <= 1;                                                            
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
                branch <= 0;
                JalSrc <= 1;                                                       
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
                branch <= 0;
                JalSrc <= 1;                                                                                      
            end
            
            //jr
            else if(Instruction[5:0] == 6'b001000) begin
                RegWrite <= 0;
                ALUOp <= 6'b100011;
                MemWrite <= 0;
                ALUSft <= 0;
                branch <= 1;
                JalSrc <= 1; 
                JZEROSrc <= 0;                                                                                
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
                branch <= 0;
                JalSrc <= 1;
            end
            
            //madd
            else if(Instruction[5:0] == 6'b000000) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b000100;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                branch <= 0;
                JalSrc <= 1;                                                                                      
            end
            
            //msub
            else if(Instruction[5:0] == 6'b000100) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b000101;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                branch <= 0;
                JalSrc <= 1;                                                                                       
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
                branch <= 0;
                JalSrc <= 1;
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
                branch <= 0;
                JalSrc <= 1;
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
                branch <= 0;
                JalSrc <= 1;
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
                branch <= 0;
                JalSrc <= 1;               
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
                branch <= 0;
                JalSrc <= 1;                     
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
                branch <= 0;
                JalSrc <= 1;               
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
                branch <= 0;
                JalSrc <= 1;                   
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
                branch <= 0;
                JalSrc <= 1;               
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
                branch <= 0;
                JalSrc <= 1;                
            end
            
            //lw
             else if(Instruction[31:26] == 6'b100011) begin
                 ALUSrc <= 1;
                 RegDst <= 0;
                 RegWrite <= 1;
                 ALUOp <= 6'b000000;
                 MemRead <= 1;
                 MemWrite <= 0;
                 MemToReg <= 0;
                 ALUSft <= 0;
                 ZEROSrc <= 0;
                 branch <= 0;
                 JalSrc <= 1;
                 SEMCtrl <= 2'b0;                   
             end
             
             //sw
             else if(Instruction[31:26] == 6'b101011) begin
                 ALUSrc <= 1;
                 RegWrite <= 0;
                 ALUOp <= 6'b000000;
                 MemWrite <= 1;
                 ALUSft <= 0;
                 ZEROSrc <= 0;
                 branch <= 0;
                 JalSrc <= 1;    
                 SEMCtrl <= 2'b0;
             end
             
             //sb
             else if(Instruction[31:26] == 6'b101000) begin
                 ALUSrc <= 1;
                 RegWrite <= 0;
                 ALUOp <= 6'b000000;
                 MemWrite <= 1;
                 ALUSft <= 0;
                 ZEROSrc <= 0;
                 branch <= 0;
                 JalSrc <= 1;  
                 SEMCtrl <= 2'b10;                
             end
             
             //lh
             else if(Instruction[31:26] == 6'b100001) begin
                 ALUSrc <= 1;
                 RegDst <= 0;
                 RegWrite <= 1;
                 ALUOp <= 6'b000000;
                 MemRead <= 1;
                 MemWrite <= 0;
                 MemToReg <= 0;
                 ALUSft <= 0;
                 ZEROSrc <= 0;
                 branch <= 0;
                 JalSrc <= 1;   
                 SEMCtrl <= 2'b01;               
             end
             
             //lb
             else if(Instruction[31:26] == 6'b100000) begin
                 ALUSrc <= 1;
                 RegDst <= 0;
                 RegWrite <= 1;
                 ALUOp <= 6'b000000;
                 MemRead <= 1;
                 MemWrite <= 0;
                 MemToReg <= 0;
                 ALUSft <= 0;
                 ZEROSrc <= 0;
                 branch <= 0;
                 JalSrc <= 1; 
                 SEMCtrl <= 2'b10;                 
             end
             
             //sh
             else if(Instruction[31:26] == 6'b101001) begin
                 ALUSrc <= 1;
                 RegWrite <= 0;
                 ALUOp <= 6'b000000;
                 MemWrite <= 1;
                 ALUSft <= 0;
                 ZEROSrc <= 0;
                 branch <= 0;
                 JalSrc <= 1; 
                 SEMCtrl <= 2'b01;                 
             end
            
            //bgez and bltz
            else if(Instruction[31:26] == 6'b000001) begin
            
                //bgez
                if(Instruction[20:16] == 6'b00001) begin
                    RegWrite <= 0;
                    ALUOp <= 6'b000111;
                    MemWrite <= 0;
                    ALUSft <= 0;
                    branch <= 1;
                    JalSrc <= 1;
                    JZEROSrc <= 1;   
                end
                
                //bltz
                else if(Instruction[20:16] == 6'b00000) begin
                    RegWrite <= 0;
                    ALUOp <= 6'b001100;
                    MemWrite <= 0;
                    ALUSft <= 0;
                    branch <= 1;
                    JalSrc <= 1;
                    JZEROSrc <= 1;   
                end
            end
            
            //beq
            else if(Instruction[31:26] == 6'b000100) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b001000;
                MemWrite <= 0;
                ALUSft <= 0;
                branch <= 1;
                JalSrc <= 1;              
                JZEROSrc <= 1; 
            end
            
            //bne
            else if(Instruction[31:26] == 6'b000101) begin
                ALUSrc <= 0;
                RegWrite <= 0;
                ALUOp <= 6'b001001;
                MemWrite <= 0;
                ALUSft <= 0;
                branch <= 1;
                JalSrc <= 1;  
                JZEROSrc <= 1; 
            end
            
            //bgtz
            else if(Instruction[31:26] == 6'b000111) begin
                RegWrite <= 0;
                ALUOp <= 6'b001010;
                MemWrite <= 0;
                ALUSft <= 0;
                branch <= 1;
                JalSrc <= 1; 
                JZEROSrc <= 1;              
            end
            
            //blez
            else if(Instruction[31:26] == 6'b000110) begin
                RegWrite <= 0;
                ALUOp <= 6'b001011;
                MemWrite <= 0;
                ALUSft <= 0;
                branch <= 1;
                JalSrc <= 1;  
                JZEROSrc <= 1; 
            end
            
            //j
            else if(Instruction[31:26] == 6'b000010) begin
                RegWrite <= 0;
                ALUOp <= 6'b001101;
                MemWrite <= 0;
                ALUSft <= 0;
                branch <= 1;
                JalSrc <= 1;  
                JZEROSrc <= 0; 
            end
            
            //jal
            else if(Instruction[31:26] == 6'b000011) begin
                RegWrite <= 1;
                ALUOp <= 6'b001110;
                MemWrite <= 0;
                MemToReg <= 1;
                ALUSft <= 0;
                branch <= 1;
                JalSrc <= 0;  
                JZEROSrc <= 0; 
            end
            
            //lui
            else if(Instruction[31:26] == 6'b001111) begin
                ALUSrc <= 1;
                RegDst <= 0;
                RegWrite <= 1;
                ALUOp <= 6'b000110;
                MemWrite <= 0;
                MemToReg <= 1;
                branch <= 0;
                JalSrc <= 1;  
            end
        end
    end
endmodule
