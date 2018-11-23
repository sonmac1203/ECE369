`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module MassReadWindowMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData0, ReadData1, ReadData2, ReadData3, ReadData4, ReadData5, ReadData6, ReadData7, ReadData8, ReadData9, ReadData10, ReadData11, ReadData12, ReadData13, ReadData14, ReadData15, ReadData16, ReadData17, ReadData18, ReadData19, ReadData20, ReadData21, ReadData22, ReadData23, ReadData24, ReadData25, ReadData26, ReadData27, ReadData28, ReadData29, ReadData30, ReadData31, ReadData32, ReadData33, ReadData34, ReadData35, ReadData36, ReadData37, ReadData38, ReadData39, ReadData40, ReadData41, ReadData42, ReadData43, ReadData44, ReadData45, ReadData46, ReadData47, ReadData48, ReadData49, ReadData50, ReadData51, ReadData52, ReadData53, ReadData54, ReadData55, ReadData56, ReadData57, ReadData58, ReadData59, ReadData60, ReadData61, ReadData62, ReadData63, ReadData64, ReadData65, ReadData66, ReadData67, ReadData68, ReadData69, ReadData70, ReadData71, ReadData72, ReadData73, ReadData74, ReadData75, ReadData76, ReadData77, ReadData78, ReadData79, ReadData80, ReadData81, ReadData82, ReadData83, ReadData84, ReadData85, ReadData86, ReadData87, ReadData88, ReadData89, ReadData90, ReadData91, ReadData92, ReadData93, ReadData94, ReadData95, ReadData96, ReadData97, ReadData98, ReadData99, ReadData100, ReadData101, ReadData102, ReadData103, ReadData104, ReadData105, ReadData106, ReadData107, ReadData108, ReadData109, ReadData110, ReadData111, ReadData112, ReadData113, ReadData114, ReadData115, ReadData116, ReadData117, ReadData118, ReadData119, ReadData120, ReadData121, ReadData122, ReadData123, ReadData124, ReadData125, ReadData126, ReadData127, ReadData128, ReadData129, ReadData130, ReadData131, ReadData132, ReadData133, ReadData134, ReadData135, ReadData136, ReadData137, ReadData138, ReadData139, ReadData140, ReadData141, ReadData142, ReadData143, ReadData144, ReadData145, ReadData146, ReadData147, ReadData148, ReadData149, ReadData150, ReadData151, ReadData152, ReadData153, ReadData154, ReadData155, ReadData156, ReadData157, ReadData158, ReadData159, ReadData160, ReadData161, ReadData162, ReadData163, ReadData164, ReadData165, ReadData166, ReadData167, ReadData168, ReadData169, ReadData170, ReadData171, ReadData172, ReadData173, ReadData174, ReadData175, ReadData176, ReadData177, ReadData178, ReadData179, ReadData180, ReadData181, ReadData182, ReadData183, ReadData184, ReadData185, ReadData186, ReadData187, ReadData188, ReadData189, ReadData190, ReadData191, ReadData192, ReadData193, ReadData194, ReadData195, ReadData196, ReadData197, ReadData198, ReadData199, ReadData200, ReadData201, ReadData202, ReadData203, ReadData204, ReadData205, ReadData206, ReadData207, ReadData208, ReadData209, ReadData210, ReadData211, ReadData212, ReadData213, ReadData214, ReadData215, ReadData216, ReadData217, ReadData218, ReadData219, ReadData220, ReadData221, ReadData222, ReadData223, ReadData224, ReadData225, ReadData226, ReadData227, ReadData228, ReadData229, ReadData230, ReadData231, ReadData232, ReadData233, ReadData234, ReadData235, ReadData236, ReadData237, ReadData238, ReadData239, ReadData240, ReadData241, ReadData242, ReadData243, ReadData244, ReadData245, ReadData246, ReadData247, ReadData248, ReadData249, ReadData250, ReadData251, ReadData252, ReadData253, ReadData254, ReadData255); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input MemWrite; 		// Control signal for memory write 
    input MemRead; 			// Control signal for memory read 

    output reg[31:0]  ReadData0, ReadData1, ReadData2, ReadData3, ReadData4, ReadData5, ReadData6, ReadData7, ReadData8, ReadData9, ReadData10, ReadData11, ReadData12, ReadData13, ReadData14, ReadData15, ReadData16, ReadData17, ReadData18, ReadData19, ReadData20, ReadData21, ReadData22, ReadData23, ReadData24, ReadData25, ReadData26, ReadData27, ReadData28, ReadData29, ReadData30, ReadData31, ReadData32, ReadData33, ReadData34, ReadData35, ReadData36, ReadData37, ReadData38, ReadData39, ReadData40, ReadData41, ReadData42, ReadData43, ReadData44, ReadData45, ReadData46, ReadData47, ReadData48, ReadData49, ReadData50, ReadData51, ReadData52, ReadData53, ReadData54, ReadData55, ReadData56, ReadData57, ReadData58, ReadData59, ReadData60, ReadData61, ReadData62, ReadData63, ReadData64, ReadData65, ReadData66, ReadData67, ReadData68, ReadData69, ReadData70, ReadData71, ReadData72, ReadData73, ReadData74, ReadData75, ReadData76, ReadData77, ReadData78, ReadData79, ReadData80, ReadData81, ReadData82, ReadData83, ReadData84, ReadData85, ReadData86, ReadData87, ReadData88, ReadData89, ReadData90, ReadData91, ReadData92, ReadData93, ReadData94, ReadData95, ReadData96, ReadData97, ReadData98, ReadData99, ReadData100, ReadData101, ReadData102, ReadData103, ReadData104, ReadData105, ReadData106, ReadData107, ReadData108, ReadData109, ReadData110, ReadData111, ReadData112, ReadData113, ReadData114, ReadData115, ReadData116, ReadData117, ReadData118, ReadData119, ReadData120, ReadData121, ReadData122, ReadData123, ReadData124, ReadData125, ReadData126, ReadData127, ReadData128, ReadData129, ReadData130, ReadData131, ReadData132, ReadData133, ReadData134, ReadData135, ReadData136, ReadData137, ReadData138, ReadData139, ReadData140, ReadData141, ReadData142, ReadData143, ReadData144, ReadData145, ReadData146, ReadData147, ReadData148, ReadData149, ReadData150, ReadData151, ReadData152, ReadData153, ReadData154, ReadData155, ReadData156, ReadData157, ReadData158, ReadData159, ReadData160, ReadData161, ReadData162, ReadData163, ReadData164, ReadData165, ReadData166, ReadData167, ReadData168, ReadData169, ReadData170, ReadData171, ReadData172, ReadData173, ReadData174, ReadData175, ReadData176, ReadData177, ReadData178, ReadData179, ReadData180, ReadData181, ReadData182, ReadData183, ReadData184, ReadData185, ReadData186, ReadData187, ReadData188, ReadData189, ReadData190, ReadData191, ReadData192, ReadData193, ReadData194, ReadData195, ReadData196, ReadData197, ReadData198, ReadData199, ReadData200, ReadData201, ReadData202, ReadData203, ReadData204, ReadData205, ReadData206, ReadData207, ReadData208, ReadData209, ReadData210, ReadData211, ReadData212, ReadData213, ReadData214, ReadData215, ReadData216, ReadData217, ReadData218, ReadData219, ReadData220, ReadData221, ReadData222, ReadData223, ReadData224, ReadData225, ReadData226, ReadData227, ReadData228, ReadData229, ReadData230, ReadData231, ReadData232, ReadData233, ReadData234, ReadData235, ReadData236, ReadData237, ReadData238, ReadData239, ReadData240, ReadData241, ReadData242, ReadData243, ReadData244, ReadData245, ReadData246, ReadData247, ReadData248, ReadData249, ReadData250, ReadData251, ReadData252, ReadData253, ReadData254, ReadData255;

    /* Please fill in the implementation here */
    
    reg[31:0] memory [0:1023];

    integer index;

    initial begin
    
         for (index = 0; index < 1024; index = index + 1) begin
            memory[index] = 32'h0;
        end

        memory[0] <= 0;
        memory[1] <= 0;
        memory[2] <= 0;
        memory[3] <= 0;
        memory[4] <= 0;
        memory[5] <= 0;

    end
    
    
    always @ (negedge Clk)  begin
        if (MemWrite)   begin
            memory[Address[11:2]] <= WriteData;
        end  
        
    end

   always @ (*) begin
        if (MemRead)    begin
            ReadData0 <= memory[Address[11:2] + 0];
            ReadData1 <= memory[Address[11:2] + 1];
            ReadData2 <= memory[Address[11:2] + 2];
            ReadData3 <= memory[Address[11:2] + 3];
            ReadData4 <= memory[Address[11:2] + 4];
            ReadData5 <= memory[Address[11:2] + 5];
            ReadData6 <= memory[Address[11:2] + 6];
            ReadData7 <= memory[Address[11:2] + 7];
            ReadData8 <= memory[Address[11:2] + 8];
            ReadData9 <= memory[Address[11:2] + 9];
            ReadData10 <= memory[Address[11:2] + 10];
            ReadData11 <= memory[Address[11:2] + 11];
            ReadData12 <= memory[Address[11:2] + 12];
            ReadData13 <= memory[Address[11:2] + 13];
            ReadData14 <= memory[Address[11:2] + 14];
            ReadData15 <= memory[Address[11:2] + 15];
            ReadData16 <= memory[Address[11:2] + 16];
            ReadData17 <= memory[Address[11:2] + 17];
            ReadData18 <= memory[Address[11:2] + 18];
            ReadData19 <= memory[Address[11:2] + 19];
            ReadData20 <= memory[Address[11:2] + 20];
            ReadData21 <= memory[Address[11:2] + 21];
            ReadData22 <= memory[Address[11:2] + 22];
            ReadData23 <= memory[Address[11:2] + 23];
            ReadData24 <= memory[Address[11:2] + 24];
            ReadData25 <= memory[Address[11:2] + 25];
            ReadData26 <= memory[Address[11:2] + 26];
            ReadData27 <= memory[Address[11:2] + 27];
            ReadData28 <= memory[Address[11:2] + 28];
            ReadData29 <= memory[Address[11:2] + 29];
            ReadData30 <= memory[Address[11:2] + 30];
            ReadData31 <= memory[Address[11:2] + 31];
            ReadData32 <= memory[Address[11:2] + 32];
            ReadData33 <= memory[Address[11:2] + 33];
            ReadData34 <= memory[Address[11:2] + 34];
            ReadData35 <= memory[Address[11:2] + 35];
            ReadData36 <= memory[Address[11:2] + 36];
            ReadData37 <= memory[Address[11:2] + 37];
            ReadData38 <= memory[Address[11:2] + 38];
            ReadData39 <= memory[Address[11:2] + 39];
            ReadData40 <= memory[Address[11:2] + 40];
            ReadData41 <= memory[Address[11:2] + 41];
            ReadData42 <= memory[Address[11:2] + 42];
            ReadData43 <= memory[Address[11:2] + 43];
            ReadData44 <= memory[Address[11:2] + 44];
            ReadData45 <= memory[Address[11:2] + 45];
            ReadData46 <= memory[Address[11:2] + 46];
            ReadData47 <= memory[Address[11:2] + 47];
            ReadData48 <= memory[Address[11:2] + 48];
            ReadData49 <= memory[Address[11:2] + 49];
            ReadData50 <= memory[Address[11:2] + 50];
            ReadData51 <= memory[Address[11:2] + 51];
            ReadData52 <= memory[Address[11:2] + 52];
            ReadData53 <= memory[Address[11:2] + 53];
            ReadData54 <= memory[Address[11:2] + 54];
            ReadData55 <= memory[Address[11:2] + 55];
            ReadData56 <= memory[Address[11:2] + 56];
            ReadData57 <= memory[Address[11:2] + 57];
            ReadData58 <= memory[Address[11:2] + 58];
            ReadData59 <= memory[Address[11:2] + 59];
            ReadData60 <= memory[Address[11:2] + 60];
            ReadData61 <= memory[Address[11:2] + 61];
            ReadData62 <= memory[Address[11:2] + 62];
            ReadData63 <= memory[Address[11:2] + 63];
            ReadData64 <= memory[Address[11:2] + 64];
            ReadData65 <= memory[Address[11:2] + 65];
            ReadData66 <= memory[Address[11:2] + 66];
            ReadData67 <= memory[Address[11:2] + 67];
            ReadData68 <= memory[Address[11:2] + 68];
            ReadData69 <= memory[Address[11:2] + 69];
            ReadData70 <= memory[Address[11:2] + 70];
            ReadData71 <= memory[Address[11:2] + 71];
            ReadData72 <= memory[Address[11:2] + 72];
            ReadData73 <= memory[Address[11:2] + 73];
            ReadData74 <= memory[Address[11:2] + 74];
            ReadData75 <= memory[Address[11:2] + 75];
            ReadData76 <= memory[Address[11:2] + 76];
            ReadData77 <= memory[Address[11:2] + 77];
            ReadData78 <= memory[Address[11:2] + 78];
            ReadData79 <= memory[Address[11:2] + 79];
            ReadData80 <= memory[Address[11:2] + 80];
            ReadData81 <= memory[Address[11:2] + 81];
            ReadData82 <= memory[Address[11:2] + 82];
            ReadData83 <= memory[Address[11:2] + 83];
            ReadData84 <= memory[Address[11:2] + 84];
            ReadData85 <= memory[Address[11:2] + 85];
            ReadData86 <= memory[Address[11:2] + 86];
            ReadData87 <= memory[Address[11:2] + 87];
            ReadData88 <= memory[Address[11:2] + 88];
            ReadData89 <= memory[Address[11:2] + 89];
            ReadData90 <= memory[Address[11:2] + 90];
            ReadData91 <= memory[Address[11:2] + 91];
            ReadData92 <= memory[Address[11:2] + 92];
            ReadData93 <= memory[Address[11:2] + 93];
            ReadData94 <= memory[Address[11:2] + 94];
            ReadData95 <= memory[Address[11:2] + 95];
            ReadData96 <= memory[Address[11:2] + 96];
            ReadData97 <= memory[Address[11:2] + 97];
            ReadData98 <= memory[Address[11:2] + 98];
            ReadData99 <= memory[Address[11:2] + 99];
            ReadData100 <= memory[Address[11:2] + 100];
            ReadData101 <= memory[Address[11:2] + 101];
            ReadData102 <= memory[Address[11:2] + 102];
            ReadData103 <= memory[Address[11:2] + 103];
            ReadData104 <= memory[Address[11:2] + 104];
            ReadData105 <= memory[Address[11:2] + 105];
            ReadData106 <= memory[Address[11:2] + 106];
            ReadData107 <= memory[Address[11:2] + 107];
            ReadData108 <= memory[Address[11:2] + 108];
            ReadData109 <= memory[Address[11:2] + 109];
            ReadData110 <= memory[Address[11:2] + 110];
            ReadData111 <= memory[Address[11:2] + 111];
            ReadData112 <= memory[Address[11:2] + 112];
            ReadData113 <= memory[Address[11:2] + 113];
            ReadData114 <= memory[Address[11:2] + 114];
            ReadData115 <= memory[Address[11:2] + 115];
            ReadData116 <= memory[Address[11:2] + 116];
            ReadData117 <= memory[Address[11:2] + 117];
            ReadData118 <= memory[Address[11:2] + 118];
            ReadData119 <= memory[Address[11:2] + 119];
            ReadData120 <= memory[Address[11:2] + 120];
            ReadData121 <= memory[Address[11:2] + 121];
            ReadData122 <= memory[Address[11:2] + 122];
            ReadData123 <= memory[Address[11:2] + 123];
            ReadData124 <= memory[Address[11:2] + 124];
            ReadData125 <= memory[Address[11:2] + 125];
            ReadData126 <= memory[Address[11:2] + 126];
            ReadData127 <= memory[Address[11:2] + 127];
            ReadData128 <= memory[Address[11:2] + 128];
            ReadData129 <= memory[Address[11:2] + 129];
            ReadData130 <= memory[Address[11:2] + 130];
            ReadData131 <= memory[Address[11:2] + 131];
            ReadData132 <= memory[Address[11:2] + 132];
            ReadData133 <= memory[Address[11:2] + 133];
            ReadData134 <= memory[Address[11:2] + 134];
            ReadData135 <= memory[Address[11:2] + 135];
            ReadData136 <= memory[Address[11:2] + 136];
            ReadData137 <= memory[Address[11:2] + 137];
            ReadData138 <= memory[Address[11:2] + 138];
            ReadData139 <= memory[Address[11:2] + 139];
            ReadData140 <= memory[Address[11:2] + 140];
            ReadData141 <= memory[Address[11:2] + 141];
            ReadData142 <= memory[Address[11:2] + 142];
            ReadData143 <= memory[Address[11:2] + 143];
            ReadData144 <= memory[Address[11:2] + 144];
            ReadData145 <= memory[Address[11:2] + 145];
            ReadData146 <= memory[Address[11:2] + 146];
            ReadData147 <= memory[Address[11:2] + 147];
            ReadData148 <= memory[Address[11:2] + 148];
            ReadData149 <= memory[Address[11:2] + 149];
            ReadData150 <= memory[Address[11:2] + 150];
            ReadData151 <= memory[Address[11:2] + 151];
            ReadData152 <= memory[Address[11:2] + 152];
            ReadData153 <= memory[Address[11:2] + 153];
            ReadData154 <= memory[Address[11:2] + 154];
            ReadData155 <= memory[Address[11:2] + 155];
            ReadData156 <= memory[Address[11:2] + 156];
            ReadData157 <= memory[Address[11:2] + 157];
            ReadData158 <= memory[Address[11:2] + 158];
            ReadData159 <= memory[Address[11:2] + 159];
            ReadData160 <= memory[Address[11:2] + 160];
            ReadData161 <= memory[Address[11:2] + 161];
            ReadData162 <= memory[Address[11:2] + 162];
            ReadData163 <= memory[Address[11:2] + 163];
            ReadData164 <= memory[Address[11:2] + 164];
            ReadData165 <= memory[Address[11:2] + 165];
            ReadData166 <= memory[Address[11:2] + 166];
            ReadData167 <= memory[Address[11:2] + 167];
            ReadData168 <= memory[Address[11:2] + 168];
            ReadData169 <= memory[Address[11:2] + 169];
            ReadData170 <= memory[Address[11:2] + 170];
            ReadData171 <= memory[Address[11:2] + 171];
            ReadData172 <= memory[Address[11:2] + 172];
            ReadData173 <= memory[Address[11:2] + 173];
            ReadData174 <= memory[Address[11:2] + 174];
            ReadData175 <= memory[Address[11:2] + 175];
            ReadData176 <= memory[Address[11:2] + 176];
            ReadData177 <= memory[Address[11:2] + 177];
            ReadData178 <= memory[Address[11:2] + 178];
            ReadData179 <= memory[Address[11:2] + 179];
            ReadData180 <= memory[Address[11:2] + 180];
            ReadData181 <= memory[Address[11:2] + 181];
            ReadData182 <= memory[Address[11:2] + 182];
            ReadData183 <= memory[Address[11:2] + 183];
            ReadData184 <= memory[Address[11:2] + 184];
            ReadData185 <= memory[Address[11:2] + 185];
            ReadData186 <= memory[Address[11:2] + 186];
            ReadData187 <= memory[Address[11:2] + 187];
            ReadData188 <= memory[Address[11:2] + 188];
            ReadData189 <= memory[Address[11:2] + 189];
            ReadData190 <= memory[Address[11:2] + 190];
            ReadData191 <= memory[Address[11:2] + 191];
            ReadData192 <= memory[Address[11:2] + 192];
            ReadData193 <= memory[Address[11:2] + 193];
            ReadData194 <= memory[Address[11:2] + 194];
            ReadData195 <= memory[Address[11:2] + 195];
            ReadData196 <= memory[Address[11:2] + 196];
            ReadData197 <= memory[Address[11:2] + 197];
            ReadData198 <= memory[Address[11:2] + 198];
            ReadData199 <= memory[Address[11:2] + 199];
            ReadData200 <= memory[Address[11:2] + 200];
            ReadData201 <= memory[Address[11:2] + 201];
            ReadData202 <= memory[Address[11:2] + 202];
            ReadData203 <= memory[Address[11:2] + 203];
            ReadData204 <= memory[Address[11:2] + 204];
            ReadData205 <= memory[Address[11:2] + 205];
            ReadData206 <= memory[Address[11:2] + 206];
            ReadData207 <= memory[Address[11:2] + 207];
            ReadData208 <= memory[Address[11:2] + 208];
            ReadData209 <= memory[Address[11:2] + 209];
            ReadData210 <= memory[Address[11:2] + 210];
            ReadData211 <= memory[Address[11:2] + 211];
            ReadData212 <= memory[Address[11:2] + 212];
            ReadData213 <= memory[Address[11:2] + 213];
            ReadData214 <= memory[Address[11:2] + 214];
            ReadData215 <= memory[Address[11:2] + 215];
            ReadData216 <= memory[Address[11:2] + 216];
            ReadData217 <= memory[Address[11:2] + 217];
            ReadData218 <= memory[Address[11:2] + 218];
            ReadData219 <= memory[Address[11:2] + 219];
            ReadData220 <= memory[Address[11:2] + 220];
            ReadData221 <= memory[Address[11:2] + 221];
            ReadData222 <= memory[Address[11:2] + 222];
            ReadData223 <= memory[Address[11:2] + 223];
            ReadData224 <= memory[Address[11:2] + 224];
            ReadData225 <= memory[Address[11:2] + 225];
            ReadData226 <= memory[Address[11:2] + 226];
            ReadData227 <= memory[Address[11:2] + 227];
            ReadData228 <= memory[Address[11:2] + 228];
            ReadData229 <= memory[Address[11:2] + 229];
            ReadData230 <= memory[Address[11:2] + 230];
            ReadData231 <= memory[Address[11:2] + 231];
            ReadData232 <= memory[Address[11:2] + 232];
            ReadData233 <= memory[Address[11:2] + 233];
            ReadData234 <= memory[Address[11:2] + 234];
            ReadData235 <= memory[Address[11:2] + 235];
            ReadData236 <= memory[Address[11:2] + 236];
            ReadData237 <= memory[Address[11:2] + 237];
            ReadData238 <= memory[Address[11:2] + 238];
            ReadData239 <= memory[Address[11:2] + 239];
            ReadData240 <= memory[Address[11:2] + 240];
            ReadData241 <= memory[Address[11:2] + 241];
            ReadData242 <= memory[Address[11:2] + 242];
            ReadData243 <= memory[Address[11:2] + 243];
            ReadData244 <= memory[Address[11:2] + 244];
            ReadData245 <= memory[Address[11:2] + 245];
            ReadData246 <= memory[Address[11:2] + 246];
            ReadData247 <= memory[Address[11:2] + 247];
            ReadData248 <= memory[Address[11:2] + 248];
            ReadData249 <= memory[Address[11:2] + 249];
            ReadData250 <= memory[Address[11:2] + 250];
            ReadData251 <= memory[Address[11:2] + 251];
            ReadData252 <= memory[Address[11:2] + 252];
            ReadData253 <= memory[Address[11:2] + 253];
            ReadData254 <= memory[Address[11:2] + 254];
            ReadData255 <= memory[Address[11:2] + 255];
        end
        else begin
            ReadData0 = 0;
            ReadData1 = 0;
            ReadData2 = 0;
            ReadData3 = 0;
            ReadData4 = 0;
            ReadData5 = 0;
            ReadData6 = 0;
            ReadData7 = 0;
            ReadData8 = 0;
            ReadData9 = 0;
            ReadData10 = 0;
            ReadData11 = 0;
            ReadData12 = 0;
            ReadData13 = 0;
            ReadData14 = 0;
            ReadData15 = 0;
            ReadData16 = 0;
            ReadData17 = 0;
            ReadData18 = 0;
            ReadData19 = 0;
            ReadData20 = 0;
            ReadData21 = 0;
            ReadData22 = 0;
            ReadData23 = 0;
            ReadData24 = 0;
            ReadData25 = 0;
            ReadData26 = 0;
            ReadData27 = 0;
            ReadData28 = 0;
            ReadData29 = 0;
            ReadData30 = 0;
            ReadData31 = 0;
            ReadData32 = 0;
            ReadData33 = 0;
            ReadData34 = 0;
            ReadData35 = 0;
            ReadData36 = 0;
            ReadData37 = 0;
            ReadData38 = 0;
            ReadData39 = 0;
            ReadData40 = 0;
            ReadData41 = 0;
            ReadData42 = 0;
            ReadData43 = 0;
            ReadData44 = 0;
            ReadData45 = 0;
            ReadData46 = 0;
            ReadData47 = 0;
            ReadData48 = 0;
            ReadData49 = 0;
            ReadData50 = 0;
            ReadData51 = 0;
            ReadData52 = 0;
            ReadData53 = 0;
            ReadData54 = 0;
            ReadData55 = 0;
            ReadData56 = 0;
            ReadData57 = 0;
            ReadData58 = 0;
            ReadData59 = 0;
            ReadData60 = 0;
            ReadData61 = 0;
            ReadData62 = 0;
            ReadData63 = 0;
            ReadData64 = 0;
            ReadData65 = 0;
            ReadData66 = 0;
            ReadData67 = 0;
            ReadData68 = 0;
            ReadData69 = 0;
            ReadData70 = 0;
            ReadData71 = 0;
            ReadData72 = 0;
            ReadData73 = 0;
            ReadData74 = 0;
            ReadData75 = 0;
            ReadData76 = 0;
            ReadData77 = 0;
            ReadData78 = 0;
            ReadData79 = 0;
            ReadData80 = 0;
            ReadData81 = 0;
            ReadData82 = 0;
            ReadData83 = 0;
            ReadData84 = 0;
            ReadData85 = 0;
            ReadData86 = 0;
            ReadData87 = 0;
            ReadData88 = 0;
            ReadData89 = 0;
            ReadData90 = 0;
            ReadData91 = 0;
            ReadData92 = 0;
            ReadData93 = 0;
            ReadData94 = 0;
            ReadData95 = 0;
            ReadData96 = 0;
            ReadData97 = 0;
            ReadData98 = 0;
            ReadData99 = 0;
            ReadData100 = 0;
            ReadData101 = 0;
            ReadData102 = 0;
            ReadData103 = 0;
            ReadData104 = 0;
            ReadData105 = 0;
            ReadData106 = 0;
            ReadData107 = 0;
            ReadData108 = 0;
            ReadData109 = 0;
            ReadData110 = 0;
            ReadData111 = 0;
            ReadData112 = 0;
            ReadData113 = 0;
            ReadData114 = 0;
            ReadData115 = 0;
            ReadData116 = 0;
            ReadData117 = 0;
            ReadData118 = 0;
            ReadData119 = 0;
            ReadData120 = 0;
            ReadData121 = 0;
            ReadData122 = 0;
            ReadData123 = 0;
            ReadData124 = 0;
            ReadData125 = 0;
            ReadData126 = 0;
            ReadData127 = 0;
            ReadData128 = 0;
            ReadData129 = 0;
            ReadData130 = 0;
            ReadData131 = 0;
            ReadData132 = 0;
            ReadData133 = 0;
            ReadData134 = 0;
            ReadData135 = 0;
            ReadData136 = 0;
            ReadData137 = 0;
            ReadData138 = 0;
            ReadData139 = 0;
            ReadData140 = 0;
            ReadData141 = 0;
            ReadData142 = 0;
            ReadData143 = 0;
            ReadData144 = 0;
            ReadData145 = 0;
            ReadData146 = 0;
            ReadData147 = 0;
            ReadData148 = 0;
            ReadData149 = 0;
            ReadData150 = 0;
            ReadData151 = 0;
            ReadData152 = 0;
            ReadData153 = 0;
            ReadData154 = 0;
            ReadData155 = 0;
            ReadData156 = 0;
            ReadData157 = 0;
            ReadData158 = 0;
            ReadData159 = 0;
            ReadData160 = 0;
            ReadData161 = 0;
            ReadData162 = 0;
            ReadData163 = 0;
            ReadData164 = 0;
            ReadData165 = 0;
            ReadData166 = 0;
            ReadData167 = 0;
            ReadData168 = 0;
            ReadData169 = 0;
            ReadData170 = 0;
            ReadData171 = 0;
            ReadData172 = 0;
            ReadData173 = 0;
            ReadData174 = 0;
            ReadData175 = 0;
            ReadData176 = 0;
            ReadData177 = 0;
            ReadData178 = 0;
            ReadData179 = 0;
            ReadData180 = 0;
            ReadData181 = 0;
            ReadData182 = 0;
            ReadData183 = 0;
            ReadData184 = 0;
            ReadData185 = 0;
            ReadData186 = 0;
            ReadData187 = 0;
            ReadData188 = 0;
            ReadData189 = 0;
            ReadData190 = 0;
            ReadData191 = 0;
            ReadData192 = 0;
            ReadData193 = 0;
            ReadData194 = 0;
            ReadData195 = 0;
            ReadData196 = 0;
            ReadData197 = 0;
            ReadData198 = 0;
            ReadData199 = 0;
            ReadData200 = 0;
            ReadData201 = 0;
            ReadData202 = 0;
            ReadData203 = 0;
            ReadData204 = 0;
            ReadData205 = 0;
            ReadData206 = 0;
            ReadData207 = 0;
            ReadData208 = 0;
            ReadData209 = 0;
            ReadData210 = 0;
            ReadData211 = 0;
            ReadData212 = 0;
            ReadData213 = 0;
            ReadData214 = 0;
            ReadData215 = 0;
            ReadData216 = 0;
            ReadData217 = 0;
            ReadData218 = 0;
            ReadData219 = 0;
            ReadData220 = 0;
            ReadData221 = 0;
            ReadData222 = 0;
            ReadData223 = 0;
            ReadData224 = 0;
            ReadData225 = 0;
            ReadData226 = 0;
            ReadData227 = 0;
            ReadData228 = 0;
            ReadData229 = 0;
            ReadData230 = 0;
            ReadData231 = 0;
            ReadData232 = 0;
            ReadData233 = 0;
            ReadData234 = 0;
            ReadData235 = 0;
            ReadData236 = 0;
            ReadData237 = 0;
            ReadData238 = 0;
            ReadData239 = 0;
            ReadData240 = 0;
            ReadData241 = 0;
            ReadData242 = 0;
            ReadData243 = 0;
            ReadData244 = 0;
            ReadData245 = 0;
            ReadData246 = 0;
            ReadData247 = 0;
            ReadData248 = 0;
            ReadData249 = 0;
            ReadData250 = 0;
            ReadData251 = 0;
            ReadData252 = 0;
            ReadData253 = 0;
            ReadData254 = 0;
            ReadData255 = 0;
      end
end
    
endmodule
