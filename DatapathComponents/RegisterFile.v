`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
//
//
// Student(s) Name and Last Name: Mitchell Dzurick & Lena Voytek
//
//
// Module - register_file.v
// Description - Implements a register file with 32 32-Bit wide registers.
//
// 
// INPUTS:-
// ReadRegister1: 5-Bit address to select a register to be read through 32-Bit 
//                output port 'ReadRegister1'.
// ReadRegister2: 5-Bit address to select a register to be read through 32-Bit 
//                output port 'ReadRegister2'.
// WriteRegister: 5-Bit address to select a register to be written through 32-Bit
//                input port 'WriteRegister'.
// WriteData: 32-Bit write input port.
// RegWrite: 1-Bit control input signal.
//
// OUTPUTS:-
// ReadData1: 32-Bit registered output. 
// ReadData2: 32-Bit registered output. 
//
// FUNCTIONALITY:-
// 'ReadRegister1' and 'ReadRegister2' are two 5-bit addresses to read two 
// registers simultaneously. The two 32-bit data sets are available on ports 
// 'ReadData1' and 'ReadData2', respectively. 'ReadData1' and 'ReadData2' are 
// registered outputs (output of register file is written into these registers 
// at the falling edge of the clock). You can view it as if outputs of registers
// specified by ReadRegister1 and ReadRegister2 are written into output 
// registers ReadData1 and ReadData2 at the falling edge of the clock. 
//
// 'RegWrite' signal is high during the rising edge of the clock if the input 
// data is to be written into the register file. The contents of the register 
// specified by address 'WriteRegister' in the register file are modified at the 
// rising edge of the clock if 'RegWrite' signal is high. The D-flip flops in 
// the register file are positive-edge (rising-edge) triggered. (You have to use 
// this information to generate the write-clock properly.) 
//
// NOTE:-
// We will design the register file such that the contents of registers do not 
// change for a pre-specified time before the falling edge of the clock arrives 
// to allow for data multiplexing and setup time.
////////////////////////////////////////////////////////////////////////////////

module RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, 
                    RegWrite, Clk, ReadData1, ReadData2, debug_write_data, 
                    s0, s1, s2, s3, s4, s5, s6, s7, t0, t1, t2, t3, t4, a0);

	/* Please fill in the implementation here... */
	
//	(* mark_debug = "true" *) input [31:0] WriteData;
	input [31:0] WriteData;
	
	output [31:0] debug_write_data,
	              s0, s1, s2, s3, s4, s5, s6, s7, t0, t1, t2, t3, t4, a0;

	
	input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input RegWrite, Clk;
	
	output reg [31:0] ReadData1, ReadData2;

	reg [31:0] registers [0:31];
	
	initial begin
	   registers[0] = 32'b0;
	end
	
	
	
	
	//always @ (negedge Clk) begin
	always @ (*) begin
        ReadData1 <= registers[ReadRegister1];
        ReadData2 <= registers[ReadRegister2];
    end	
	
	
	//always @ (posedge Clk) begin
	always @ (negedge Clk) begin
	  if (RegWrite)    begin
	   registers[WriteRegister] <= WriteData;
	  end

	end
	
	assign s0 = registers[16];
	assign s1 = registers[17];
	assign s2 = registers[18];
	assign s3 = registers[19];
	assign s4 = registers[20];
	assign s5 = registers[21];
	assign s6 = registers[22];
	assign s7 = registers[23];
	
	assign t0 = registers[8];
	assign t1 = registers[9];
	assign t2 = registers[10];
	assign t3 = registers[11];
	assign t4 = registers[12];
	
	assign a0 = registers[4];
	
	assign debug_write_data = WriteData;

endmodule
