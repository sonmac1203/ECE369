`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory  1
// Module - InstructionMemory.v
// Description - 32-Bit wide instruction memory.
//
// INPUT:-
// Address: 32-Bit address input port.
//
// OUTPUT:-
// Instruction: 32-Bit output port.
//
// FUNCTIONALITY:-
// Similar to the DataMemory, this module should also be byte-addressed
// (i.e., ignore bits 0 and 1 of 'Address'). All of the instructions will be 
// hard-coded into the instruction memory, so there is no need to write to the 
// InstructionMemory.  The contents of the InstructionMemory is the machine 
// language program to be run on your MIPS processor.
//
//
//we will store the machine code for a code written in C later. for now initialize 
//each entry to be its index * 3 (memory[i] = i * 3;)
//all you need to do is give an address as input and read the contents of the 
//address on your output port. 
// 
//Using a 32bit address you will index into the memory, output the contents of that specific 
//address. for data memory we are using 1K word of storage space. for the instruction memory 
//you may assume smaller size for practical purpose. you can use 128 words as the size and 
//hardcode the values.  in this case you need 7 bits to index into the memory. 
//
//be careful with the least two significant bits of the 32bit address. those help us index 
//into one of the 4 bytes in a word. therefore you will need to use bit [8-2] of the input address. 


////////////////////////////////////////////////////////////////////////////////

module InstructionMemory(Address, Instruction); 

    input [31:0] Address;        // Input Address 

    output reg [31:0] Instruction;    // Instruction at memory location Address
    
    reg [31:0] Memory [511:0];

    //initializing memory with 0-127    
    integer index;
    
    
    initial begin
//        //Given Simple Test
//        Memory[0] = 32'h20090006;
//        Memory[1] = 32'h00000000;
//        Memory[2] = 32'h00000000;
//        Memory[3] = 32'h00000000;
//        Memory[4] = 32'h00000000;
//        Memory[5] = 32'h00000000;
//        Memory[6] = 32'h200a0008;
//        Memory[7] = 32'h00000000;
//        Memory[8] = 32'h00000000;
//        Memory[9] = 32'h00000000;
//        Memory[10] = 32'h00000000;
//        Memory[11] = 32'h00000000;
//        Memory[12] = 32'h00000000;
//        Memory[13] = 32'h00000000;
//        Memory[14] = 32'h00000000;
//        Memory[15] = 32'h00000000;
//        Memory[16] = 32'h00000000;
//        Memory[17] = 32'h00000000;
//        Memory[18] = 32'h000b60c0;
//        Memory[19] = 32'h00000000;
//        Memory[20] = 32'h00000000;
//        Memory[21] = 32'h00000000;
//        Memory[22] = 32'h00000000;
//        Memory[23] = 32'h00000000;
//        Memory[24] = 32'h000c6882;



////        The intermet
//    Memory[0] = 32'h20090006;	//		addi	$t1, $zero, 6
//	Memory[1] = 32'h00000000;	//		nop
//	Memory[2] = 32'h00000000;	//		nop
//	Memory[3] = 32'h00000000;	//		nop
//	Memory[4] = 32'h00000000;	//		nop
//	Memory[5] = 32'h00000000;	//		nop
//	Memory[6] = 32'h200a0008;	//		addi	$t2, $zero, 8
//	Memory[7] = 32'h00000000;	//		nop
//	Memory[8] = 32'h00000000;	//		nop
//	Memory[9] = 32'h00000000;	//		nop
//	Memory[10] = 32'h00000000;	//		nop
//	Memory[11] = 32'h00000000;	//		nop
//	Memory[12] = 32'h01495822;	//		sub	$t3, $t2, $t1
//	Memory[13] = 32'h00000000;	//		nop
//	Memory[14] = 32'h00000000;	//		nop
//	Memory[15] = 32'h00000000;	//		nop
//	Memory[16] = 32'h00000000;	//		nop
//	Memory[17] = 32'h00000000;	//		nop
//	Memory[18] = 32'h000b60c0;	//		sll	$t4, $t3, 3
//	Memory[19] = 32'h00000000;	//		nop
//	Memory[20] = 32'h00000000;	//		nop
//	Memory[21] = 32'h00000000;	//		nop
//	Memory[22] = 32'h00000000;	//		nop
//	Memory[23] = 32'h00000000;	//		nop
//	Memory[24] = 32'h000c6882;	//		srl	$t5, $t4, 2


//          Public Test Case
    
    Memory[0] = 32'h20100001;
    Memory[1] = 32'h00000000;
    Memory[2] = 32'h00000000;
    Memory[3] = 32'h00000000;
    Memory[4] = 32'h00000000;
    Memory[5] = 32'h00000000;
    Memory[6] = 32'h20110001;
    Memory[7] = 32'h00000000;
    Memory[8] = 32'h00000000;
    Memory[9] = 32'h00000000;
    Memory[10] = 32'h00000000;
    Memory[11] = 32'h00000000;
    Memory[12] = 32'h02118024;
    Memory[13] = 32'h00000000;
    Memory[14] = 32'h00000000;
    Memory[15] = 32'h00000000;
    Memory[16] = 32'h00000000;
    Memory[17] = 32'h00000000;
    Memory[18] = 32'h02008024;
    Memory[19] = 32'h00000000;
    Memory[20] = 32'h00000000;
    Memory[21] = 32'h00000000;
    Memory[22] = 32'h00000000;
    Memory[23] = 32'h00000000;
    Memory[24] = 32'h02308022;
    Memory[25] = 32'h00000000;
    Memory[26] = 32'h00000000;
    Memory[27] = 32'h00000000;
    Memory[28] = 32'h00000000;
    Memory[29] = 32'h00000000;
    Memory[30] = 32'h02008027;
    Memory[31] = 32'h00000000;
    Memory[32] = 32'h00000000;
    Memory[33] = 32'h00000000;
    Memory[34] = 32'h00000000;
    Memory[35] = 32'h00000000;
    Memory[36] = 32'h02008027;
    Memory[37] = 32'h00000000;
    Memory[38] = 32'h00000000;
    Memory[39] = 32'h00000000;
    Memory[40] = 32'h00000000;
    Memory[41] = 32'h00000000;
    Memory[42] = 32'h00008025;
    Memory[43] = 32'h00000000;
    Memory[44] = 32'h00000000;
    Memory[45] = 32'h00000000;
    Memory[46] = 32'h00000000;
    Memory[47] = 32'h00000000;
    Memory[48] = 32'h02208025;
    Memory[49] = 32'h00000000;
    Memory[50] = 32'h00000000;
    Memory[51] = 32'h00000000;
    Memory[52] = 32'h00000000;
    Memory[53] = 32'h00000000;
    Memory[54] = 32'h00108080;
    Memory[55] = 32'h00000000;
    Memory[56] = 32'h00000000;
    Memory[57] = 32'h00000000;
    Memory[58] = 32'h00000000;
    Memory[59] = 32'h00000000;
    Memory[60] = 32'h02308004;
    Memory[61] = 32'h00000000;
    Memory[62] = 32'h00000000;
    Memory[63] = 32'h00000000;
    Memory[64] = 32'h00000000;
    Memory[65] = 32'h00000000;
    Memory[66] = 32'h0200802a;
    Memory[67] = 32'h00000000;
    Memory[68] = 32'h00000000;
    Memory[69] = 32'h00000000;
    Memory[70] = 32'h00000000;
    Memory[71] = 32'h00000000;
    Memory[72] = 32'h0211802a;
    Memory[73] = 32'h00000000;
    Memory[74] = 32'h00000000;
    Memory[75] = 32'h00000000;
    Memory[76] = 32'h00000000;
    Memory[77] = 32'h00000000;
    Memory[78] = 32'h00118043;
    Memory[79] = 32'h00000000;
    Memory[80] = 32'h00000000;
    Memory[81] = 32'h00000000;
    Memory[82] = 32'h00000000;
    Memory[83] = 32'h00000000;
    Memory[84] = 32'h00118007;
    Memory[85] = 32'h00000000;
    Memory[86] = 32'h00000000;
    Memory[87] = 32'h00000000;
    Memory[88] = 32'h00000000;
    Memory[89] = 32'h00000000;
    Memory[90] = 32'h00118042;
    Memory[91] = 32'h00000000;
    Memory[92] = 32'h00000000;
    Memory[93] = 32'h00000000;
    Memory[94] = 32'h00000000;
    Memory[95] = 32'h00000000;
    Memory[96] = 32'h001180c0;
    Memory[97] = 32'h00000000;
    Memory[98] = 32'h00000000;
    Memory[99] = 32'h00000000;
    Memory[100] = 32'h00000000;
    Memory[101] = 32'h00000000;
    Memory[102] = 32'h001080c2;
    Memory[103] = 32'h00000000;
    Memory[104] = 32'h00000000;
    Memory[105] = 32'h00000000;
    Memory[106] = 32'h00000000;
    Memory[107] = 32'h00000000;
    Memory[108] = 32'h02308004;
    Memory[109] = 32'h00000000;
    Memory[110] = 32'h00000000;
    Memory[111] = 32'h00000000;
    Memory[112] = 32'h00000000;
    Memory[113] = 32'h00000000;
    Memory[114] = 32'h02308006;
    Memory[115] = 32'h00000000;
    Memory[116] = 32'h00000000;
    Memory[117] = 32'h00000000;
    Memory[118] = 32'h00000000;
    Memory[119] = 32'h00000000;
    Memory[120] = 32'h02118026;
    Memory[121] = 32'h00000000;
    Memory[122] = 32'h00000000;
    Memory[123] = 32'h00000000;
    Memory[124] = 32'h00000000;
    Memory[125] = 32'h00000000;
    Memory[126] = 32'h02118026;
    Memory[127] = 32'h00000000;
    Memory[128] = 32'h00000000;
    Memory[129] = 32'h00000000;
    Memory[130] = 32'h00000000;
    Memory[131] = 32'h00000000;
    Memory[132] = 32'h20120004;
    Memory[133] = 32'h00000000;
    Memory[134] = 32'h00000000;
    Memory[135] = 32'h00000000;
    Memory[136] = 32'h00000000;
    Memory[137] = 32'h00000000;
    Memory[138] = 32'h72128002;
    Memory[139] = 32'h00000000;
    Memory[140] = 32'h00000000;
    Memory[141] = 32'h00000000;
    Memory[142] = 32'h00000000;
    Memory[143] = 32'h00000000;
    Memory[144] = 32'h22100004;
    Memory[145] = 32'h00000000;
    Memory[146] = 32'h00000000;
    Memory[147] = 32'h00000000;
    Memory[148] = 32'h00000000;
    Memory[149] = 32'h00000000;
    Memory[150] = 32'h32100000;
    Memory[151] = 32'h00000000;
    Memory[152] = 32'h00000000;
    Memory[153] = 32'h00000000;
    Memory[154] = 32'h00000000;
    Memory[155] = 32'h00000000;
    Memory[156] = 32'h36100001;
    Memory[157] = 32'h00000000;
    Memory[158] = 32'h00000000;
    Memory[159] = 32'h00000000;
    Memory[160] = 32'h00000000;
    Memory[161] = 32'h00000000;
    Memory[162] = 32'h2a100000;
    Memory[163] = 32'h00000000;
    Memory[164] = 32'h00000000;
    Memory[165] = 32'h00000000;
    Memory[166] = 32'h00000000;
    Memory[167] = 32'h00000000;
    Memory[168] = 32'h2a100001;
    Memory[169] = 32'h00000000;
    Memory[170] = 32'h00000000;
    Memory[171] = 32'h00000000;
    Memory[172] = 32'h00000000;
    Memory[173] = 32'h00000000;
    Memory[174] = 32'h3a100001;
    Memory[175] = 32'h00000000;
    Memory[176] = 32'h00000000;
    Memory[177] = 32'h00000000;
    Memory[178] = 32'h00000000;
    Memory[179] = 32'h00000000;
    Memory[180] = 32'h3a100001;
    Memory[181] = 32'h00000000;
    Memory[182] = 32'h00000000;
    Memory[183] = 32'h00000000;
    Memory[184] = 32'h00000000;
    Memory[185] = 32'h00000000;
    Memory[186] = 32'h2010fffe;
    Memory[187] = 32'h00000000;
    Memory[188] = 32'h00000000;
    Memory[189] = 32'h00000000;
    Memory[190] = 32'h00000000;
    Memory[191] = 32'h00000000;
    Memory[192] = 32'h20110002;
    Memory[193] = 32'h00000000;
    Memory[194] = 32'h00000000;
    Memory[195] = 32'h00000000;
    Memory[196] = 32'h00000000;
    Memory[197] = 32'h00000000;
    Memory[198] = 32'h0230902b;
    Memory[199] = 32'h00000000;
    Memory[200] = 32'h00000000;
    Memory[201] = 32'h00000000;
    Memory[202] = 32'h00000000;
    Memory[203] = 32'h00000000;
    Memory[204] = 32'h2e30fffe;
    Memory[205] = 32'h00000000;
    Memory[206] = 32'h00000000;
    Memory[207] = 32'h00000000;
    Memory[208] = 32'h00000000;
    Memory[209] = 32'h00000000;
    Memory[210] = 32'h0220800a;
    Memory[211] = 32'h00000000;
    Memory[212] = 32'h00000000;
    Memory[213] = 32'h00000000;
    Memory[214] = 32'h00000000;
    Memory[215] = 32'h00000000;
    Memory[216] = 32'h0011800b;
    Memory[217] = 32'h00000000;
    Memory[218] = 32'h00000000;
    Memory[219] = 32'h00000000;
    Memory[220] = 32'h00000000;
    Memory[221] = 32'h00000000;
    Memory[222] = 32'h02328020;
    Memory[223] = 32'h00000000;
    Memory[224] = 32'h00000000;
    Memory[225] = 32'h00000000;
    Memory[226] = 32'h00000000;
    Memory[227] = 32'h00000000;
    Memory[228] = 32'h2010fffe;
    Memory[229] = 32'h00000000;
    Memory[230] = 32'h00000000;
    Memory[231] = 32'h00000000;
    Memory[232] = 32'h00000000;
    Memory[233] = 32'h00000000;
    Memory[234] = 32'h02308821;
    Memory[235] = 32'h00000000;
    Memory[236] = 32'h00000000;
    Memory[237] = 32'h00000000;
    Memory[238] = 32'h00000000;
    Memory[239] = 32'h00000000;
    Memory[240] = 32'h2411ffff;
    Memory[241] = 32'h00000000;
    Memory[242] = 32'h00000000;
    Memory[243] = 32'h00000000;
    Memory[244] = 32'h00000000;
    Memory[245] = 32'h00000000;
    Memory[246] = 32'h20120020;
    Memory[247] = 32'h00000000;
    Memory[248] = 32'h00000000;
    Memory[249] = 32'h00000000;
    Memory[250] = 32'h00000000;
    Memory[251] = 32'h00000000;
    Memory[252] = 32'h02320018;
    Memory[253] = 32'h00000000;
    Memory[254] = 32'h00000000;
    Memory[255] = 32'h00000000;
    Memory[256] = 32'h00000000;
    Memory[257] = 32'h00000000;
    Memory[258] = 32'h0000a010;
    Memory[259] = 32'h00000000;
    Memory[260] = 32'h00000000;
    Memory[261] = 32'h00000000;
    Memory[262] = 32'h00000000;
    Memory[263] = 32'h00000000;
    Memory[264] = 32'h0000a812;
    Memory[265] = 32'h00000000;
    Memory[266] = 32'h00000000;
    Memory[267] = 32'h00000000;
    Memory[268] = 32'h00000000;
    Memory[269] = 32'h00000000;
    Memory[270] = 32'h02320019;
    Memory[271] = 32'h00000000;
    Memory[272] = 32'h00000000;
    Memory[273] = 32'h00000000;
    Memory[274] = 32'h00000000;
    Memory[275] = 32'h00000000;
    Memory[276] = 32'h0000a010;
    Memory[277] = 32'h00000000;
    Memory[278] = 32'h00000000;
    Memory[279] = 32'h00000000;
    Memory[280] = 32'h00000000;
    Memory[281] = 32'h00000000;
    Memory[282] = 32'h0000a812;
    Memory[283] = 32'h00000000;
    Memory[284] = 32'h00000000;
    Memory[285] = 32'h00000000;
    Memory[286] = 32'h00000000;
    Memory[287] = 32'h00000000;
    Memory[288] = 32'h72320000;
    Memory[289] = 32'h00000000;
    Memory[290] = 32'h00000000;
    Memory[291] = 32'h00000000;
    Memory[292] = 32'h00000000;
    Memory[293] = 32'h00000000;
    Memory[294] = 32'h0000a010;
    Memory[295] = 32'h00000000;
    Memory[296] = 32'h00000000;
    Memory[297] = 32'h00000000;
    Memory[298] = 32'h00000000;
    Memory[299] = 32'h00000000;
    Memory[300] = 32'h0000a812;
    Memory[301] = 32'h00000000;
    Memory[302] = 32'h00000000;
    Memory[303] = 32'h00000000;
    Memory[304] = 32'h00000000;
    Memory[305] = 32'h00000000;
    Memory[306] = 32'h02400011;
    Memory[307] = 32'h00000000;
    Memory[308] = 32'h00000000;
    Memory[309] = 32'h00000000;
    Memory[310] = 32'h00000000;
    Memory[311] = 32'h00000000;
    Memory[312] = 32'h02200013;
    Memory[313] = 32'h00000000;
    Memory[314] = 32'h00000000;
    Memory[315] = 32'h00000000;
    Memory[316] = 32'h00000000;
    Memory[317] = 32'h00000000;
    Memory[318] = 32'h0000a010;
    Memory[319] = 32'h00000000;
    Memory[320] = 32'h00000000;
    Memory[321] = 32'h00000000;
    Memory[322] = 32'h00000000;
    Memory[323] = 32'h00000000;
    Memory[324] = 32'h0000a812;
    Memory[325] = 32'h00000000;
    Memory[326] = 32'h00000000;
    Memory[327] = 32'h00000000;
    Memory[328] = 32'h00000000;
    Memory[329] = 32'h00000000;
    Memory[330] = 32'h3231ffff;
    Memory[331] = 32'h00000000;
    Memory[332] = 32'h00000000;
    Memory[333] = 32'h00000000;
    Memory[334] = 32'h00000000;
    Memory[335] = 32'h00000000;
    Memory[336] = 32'h72920004;
    Memory[337] = 32'h00000000;
    Memory[338] = 32'h00000000;
    Memory[339] = 32'h00000000;
    Memory[340] = 32'h00000000;
    Memory[341] = 32'h00000000;
    Memory[342] = 32'h0000a010;
    Memory[343] = 32'h00000000;
    Memory[344] = 32'h00000000;
    Memory[345] = 32'h00000000;
    Memory[346] = 32'h00000000;
    Memory[347] = 32'h00000000;
    Memory[348] = 32'h0000a812;
    Memory[349] = 32'h00000000;
    Memory[350] = 32'h00000000;
    Memory[351] = 32'h00000000;
    Memory[352] = 32'h00000000;
    Memory[353] = 32'h00000000;
    Memory[354] = 32'h20120001;
    Memory[355] = 32'h00000000;
    Memory[356] = 32'h00000000;
    Memory[357] = 32'h00000000;
    Memory[358] = 32'h00000000;
    Memory[359] = 32'h00000000;
    Memory[360] = 32'h00328fc2;
    Memory[361] = 32'h00000000;
    Memory[362] = 32'h00000000;
    Memory[363] = 32'h00000000;
    Memory[364] = 32'h00000000;
    Memory[365] = 32'h00000000;
    Memory[366] = 32'h2014001f;
    Memory[367] = 32'h00000000;
    Memory[368] = 32'h00000000;
    Memory[369] = 32'h00000000;
    Memory[370] = 32'h00000000;
    Memory[371] = 32'h00000000;
    Memory[372] = 32'h02918846;
    Memory[373] = 32'h00000000;
    Memory[374] = 32'h00000000;
    Memory[375] = 32'h00000000;
    Memory[376] = 32'h00000000;
    Memory[377] = 32'h00000000;
    Memory[378] = 32'h34110FF0;
    Memory[379] = 32'h00000000;
    Memory[380] = 32'h00000000;
    Memory[381] = 32'h00000000;
    Memory[382] = 32'h00000000;
    Memory[383] = 32'h00000000;
    Memory[384] = 32'h7c11a420;
    Memory[385] = 32'h00000000;
    Memory[386] = 32'h00000000;
    Memory[387] = 32'h00000000;
    Memory[388] = 32'h00000000;
    Memory[389] = 32'h00000000;
    Memory[390] = 32'h7c11a620;
    Memory[391] = 32'h00000000;
    Memory[392] = 32'h00000000;
    Memory[393] = 32'h00000000;
    Memory[394] = 32'h00000000;
    Memory[395] = 32'h00000000;








        /* Count up by 3's
        for (index = 0; index < 128; index = index + 1) begin
            Memory[index] = index * 3;
        end
        */
    end
    
    
    always @ Address begin
        Instruction = Memory[Address[11:2]];
    end
    
    
endmodule
