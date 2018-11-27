`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2018 02:47:26 PM
// Design Name: 
// Module Name: EXForwarding
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


module EXForwarding(ID_EX_rs, ID_EX_rt, 
                    EX_MEM_ALU, EX_MEM_dest_reg, mux3_out, 
                    EX_MEM_RegWrite, EX_MEM_RegRd,
                    MEM_WB_RegWrite, MEM_WB_RegisterRd,
                    ForwardA, ForwardB,
                    ID_EX_MemRead,
                    ID_EX_RegDst,
                    ID_EX_ALUSft,
                    DataMemForward,
                    MEM_WB_MemToReg,
                    ID_EX_MemWrite);

    input [31:0] EX_MEM_ALU, mux3_out;
    input [4:0] EX_MEM_dest_reg, ID_EX_rs, ID_EX_rt, MEM_WB_RegisterRd;
    input EX_MEM_RegWrite, EX_MEM_RegRd, MEM_WB_RegWrite, ID_EX_MemRead, 
            ID_EX_ALUSft, ID_EX_RegDst, MEM_WB_MemToReg, ID_EX_MemWrite;
    
    
    output reg [1:0] ForwardA, ForwardB, DataMemForward;
    
    initial begin
        ForwardA <= 0;
        ForwardB <= 0;
        DataMemForward <= 0;
    end
    
    always @ (*)    begin
    
        ForwardA <= 0;
        ForwardB <= 0;
        DataMemForward <= 0;
    
       if   ((MEM_WB_RegWrite == 1 && MEM_WB_RegisterRd != 0)
             && !(EX_MEM_RegWrite == 1 && EX_MEM_RegRd != 0)
             && (EX_MEM_RegRd == ID_EX_rs)
             && (MEM_WB_RegisterRd == ID_EX_rs)) begin
                ForwardA <= 01;
       end
       
       if   ((MEM_WB_RegWrite == 1 && MEM_WB_RegisterRd != 0)
             && !(EX_MEM_RegWrite == 1 && EX_MEM_RegRd != 0)
             && (EX_MEM_RegRd == ID_EX_rt)
             && (MEM_WB_RegisterRd == ID_EX_rt)) begin
                ForwardB <= 01;
       end       
       
       /*
       Handles
       add $s1, $s2, $s3
       sub $s4, $s1, $s3
       sub $s1, $s1, $s4
       mul $s4, $s1, $s3
       */
       
       if(MEM_WB_RegWrite == 1 && (ID_EX_rs == MEM_WB_RegisterRd))
               ForwardA <= 2'b01;
       
       if(MEM_WB_RegWrite == 1 && (ID_EX_rt == MEM_WB_RegisterRd)
            && ID_EX_RegDst == 1) begin //register ased op
               ForwardB <= 2'b01;
       end
              
       
       
       
       //handles
       //
       //la $s3, asize0		   #mipshelper convert this to ori
       //lw $s3, 4($s3)        #[s3] = 0xc8
       //
       if(EX_MEM_RegWrite == 1 && (ID_EX_rs == EX_MEM_dest_reg)
            //&& ID_EX_ALUSft == 0 //make sure that it is not a shift op
            )   begin
            ForwardA <= 2'b10;
       end
       
       if(EX_MEM_RegWrite == 1 && (ID_EX_rt == EX_MEM_dest_reg)
           && (ID_EX_RegDst == 1 || ID_EX_ALUSft == 1) //register based op or shift based op
           && ID_EX_MemRead == 0 //Made sure it's not lw
           )   begin
            ForwardB <= 2'b10;
       end
       
       
    
    
       /*
        *handles
        *
        * lw $s0, offset(base)  F D E M W
        * <any instruction>       F D E M W
        * sw $s0, offset(base)      F D E M W
        *
        *   issue because lw's writeback happens
        *   during sw's execution stage.
        *
        *
        */

       if (MEM_WB_MemToReg == 0         //proves mem/wb read from datamem
          && MEM_WB_RegWrite == 1 
          && MEM_WB_RegisterRd == ID_EX_rt 
          && ID_EX_MemWrite == 1
          ) begin
          DataMemForward <= 1;
       end
       
       
  
    end
    
    
endmodule
