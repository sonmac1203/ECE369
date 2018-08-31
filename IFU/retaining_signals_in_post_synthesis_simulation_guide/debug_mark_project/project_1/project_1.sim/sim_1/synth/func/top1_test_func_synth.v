// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.4.2 (win64) Build 1494164 Fri Feb 26 04:18:56 MST 2016
// Date        : Mon Mar 20 11:26:14 2017
// Host        : ENGR-ECE232PC13 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/nirmalk/project_1/project_1.sim/sim_1/synth/func/top1_test_func_synth.v
// Design      : top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module RegisterFile
   (Q,
    WriteRegister_IBUF,
    D,
    CLK);
  output [31:0]Q;
  input [4:0]WriteRegister_IBUF;
  input [31:0]D;
  input CLK;

  wire CLK;
  wire [31:0]D;
  wire [31:0]Q;
  wire [4:0]WriteRegister_IBUF;
  wire \regFile[23][31]_i_1_n_0 ;

  LUT5 #(
    .INIT(32'h40000000)) 
    \regFile[23][31]_i_1 
       (.I0(WriteRegister_IBUF[3]),
        .I1(WriteRegister_IBUF[1]),
        .I2(WriteRegister_IBUF[0]),
        .I3(WriteRegister_IBUF[4]),
        .I4(WriteRegister_IBUF[2]),
        .O(\regFile[23][31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][0] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][10] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[10]),
        .Q(Q[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][11] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[11]),
        .Q(Q[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][12] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[12]),
        .Q(Q[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][13] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[13]),
        .Q(Q[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][14] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[14]),
        .Q(Q[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][15] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[15]),
        .Q(Q[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][16] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[16]),
        .Q(Q[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][17] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[17]),
        .Q(Q[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][18] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[18]),
        .Q(Q[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][19] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[19]),
        .Q(Q[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][1] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][20] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[20]),
        .Q(Q[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][21] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[21]),
        .Q(Q[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][22] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[22]),
        .Q(Q[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][23] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[23]),
        .Q(Q[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][24] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[24]),
        .Q(Q[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][25] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[25]),
        .Q(Q[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][26] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[26]),
        .Q(Q[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][27] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[27]),
        .Q(Q[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][28] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[28]),
        .Q(Q[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][29] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[29]),
        .Q(Q[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][2] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][30] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[30]),
        .Q(Q[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][31] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[31]),
        .Q(Q[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][3] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][4] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][5] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][6] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][7] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[7]),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][8] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[8]),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \regFile_reg[23][9] 
       (.C(CLK),
        .CE(\regFile[23][31]_i_1_n_0 ),
        .D(D[9]),
        .Q(Q[9]),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module top
   (Clk,
    WriteRegister,
    WriteData,
    out_data);
  input Clk;
  input [31:0]WriteRegister;
  input [31:0]WriteData;
  output [31:0]out_data;

  wire Clk;
  wire Clk_IBUF;
  wire Clk_IBUF_BUFG;
  wire [31:0]WriteData;
  wire [31:0]WriteData_IBUF;
  wire [31:0]WriteRegister;
  wire [4:0]WriteRegister_IBUF;
  wire [31:0]out_data;
  wire [31:0]out_data_OBUF;

  BUFG Clk_IBUF_BUFG_inst
       (.I(Clk_IBUF),
        .O(Clk_IBUF_BUFG));
  IBUF Clk_IBUF_inst
       (.I(Clk),
        .O(Clk_IBUF));
  RegisterFile U0
       (.CLK(Clk_IBUF_BUFG),
        .D(WriteData_IBUF),
        .Q(out_data_OBUF),
        .WriteRegister_IBUF(WriteRegister_IBUF));
  IBUF \WriteData_IBUF[0]_inst 
       (.I(WriteData[0]),
        .O(WriteData_IBUF[0]));
  IBUF \WriteData_IBUF[10]_inst 
       (.I(WriteData[10]),
        .O(WriteData_IBUF[10]));
  IBUF \WriteData_IBUF[11]_inst 
       (.I(WriteData[11]),
        .O(WriteData_IBUF[11]));
  IBUF \WriteData_IBUF[12]_inst 
       (.I(WriteData[12]),
        .O(WriteData_IBUF[12]));
  IBUF \WriteData_IBUF[13]_inst 
       (.I(WriteData[13]),
        .O(WriteData_IBUF[13]));
  IBUF \WriteData_IBUF[14]_inst 
       (.I(WriteData[14]),
        .O(WriteData_IBUF[14]));
  IBUF \WriteData_IBUF[15]_inst 
       (.I(WriteData[15]),
        .O(WriteData_IBUF[15]));
  IBUF \WriteData_IBUF[16]_inst 
       (.I(WriteData[16]),
        .O(WriteData_IBUF[16]));
  IBUF \WriteData_IBUF[17]_inst 
       (.I(WriteData[17]),
        .O(WriteData_IBUF[17]));
  IBUF \WriteData_IBUF[18]_inst 
       (.I(WriteData[18]),
        .O(WriteData_IBUF[18]));
  IBUF \WriteData_IBUF[19]_inst 
       (.I(WriteData[19]),
        .O(WriteData_IBUF[19]));
  IBUF \WriteData_IBUF[1]_inst 
       (.I(WriteData[1]),
        .O(WriteData_IBUF[1]));
  IBUF \WriteData_IBUF[20]_inst 
       (.I(WriteData[20]),
        .O(WriteData_IBUF[20]));
  IBUF \WriteData_IBUF[21]_inst 
       (.I(WriteData[21]),
        .O(WriteData_IBUF[21]));
  IBUF \WriteData_IBUF[22]_inst 
       (.I(WriteData[22]),
        .O(WriteData_IBUF[22]));
  IBUF \WriteData_IBUF[23]_inst 
       (.I(WriteData[23]),
        .O(WriteData_IBUF[23]));
  IBUF \WriteData_IBUF[24]_inst 
       (.I(WriteData[24]),
        .O(WriteData_IBUF[24]));
  IBUF \WriteData_IBUF[25]_inst 
       (.I(WriteData[25]),
        .O(WriteData_IBUF[25]));
  IBUF \WriteData_IBUF[26]_inst 
       (.I(WriteData[26]),
        .O(WriteData_IBUF[26]));
  IBUF \WriteData_IBUF[27]_inst 
       (.I(WriteData[27]),
        .O(WriteData_IBUF[27]));
  IBUF \WriteData_IBUF[28]_inst 
       (.I(WriteData[28]),
        .O(WriteData_IBUF[28]));
  IBUF \WriteData_IBUF[29]_inst 
       (.I(WriteData[29]),
        .O(WriteData_IBUF[29]));
  IBUF \WriteData_IBUF[2]_inst 
       (.I(WriteData[2]),
        .O(WriteData_IBUF[2]));
  IBUF \WriteData_IBUF[30]_inst 
       (.I(WriteData[30]),
        .O(WriteData_IBUF[30]));
  IBUF \WriteData_IBUF[31]_inst 
       (.I(WriteData[31]),
        .O(WriteData_IBUF[31]));
  IBUF \WriteData_IBUF[3]_inst 
       (.I(WriteData[3]),
        .O(WriteData_IBUF[3]));
  IBUF \WriteData_IBUF[4]_inst 
       (.I(WriteData[4]),
        .O(WriteData_IBUF[4]));
  IBUF \WriteData_IBUF[5]_inst 
       (.I(WriteData[5]),
        .O(WriteData_IBUF[5]));
  IBUF \WriteData_IBUF[6]_inst 
       (.I(WriteData[6]),
        .O(WriteData_IBUF[6]));
  IBUF \WriteData_IBUF[7]_inst 
       (.I(WriteData[7]),
        .O(WriteData_IBUF[7]));
  IBUF \WriteData_IBUF[8]_inst 
       (.I(WriteData[8]),
        .O(WriteData_IBUF[8]));
  IBUF \WriteData_IBUF[9]_inst 
       (.I(WriteData[9]),
        .O(WriteData_IBUF[9]));
  IBUF \WriteRegister_IBUF[0]_inst 
       (.I(WriteRegister[0]),
        .O(WriteRegister_IBUF[0]));
  IBUF \WriteRegister_IBUF[1]_inst 
       (.I(WriteRegister[1]),
        .O(WriteRegister_IBUF[1]));
  IBUF \WriteRegister_IBUF[2]_inst 
       (.I(WriteRegister[2]),
        .O(WriteRegister_IBUF[2]));
  IBUF \WriteRegister_IBUF[3]_inst 
       (.I(WriteRegister[3]),
        .O(WriteRegister_IBUF[3]));
  IBUF \WriteRegister_IBUF[4]_inst 
       (.I(WriteRegister[4]),
        .O(WriteRegister_IBUF[4]));
  OBUF \out_data_OBUF[0]_inst 
       (.I(out_data_OBUF[0]),
        .O(out_data[0]));
  OBUF \out_data_OBUF[10]_inst 
       (.I(out_data_OBUF[10]),
        .O(out_data[10]));
  OBUF \out_data_OBUF[11]_inst 
       (.I(out_data_OBUF[11]),
        .O(out_data[11]));
  OBUF \out_data_OBUF[12]_inst 
       (.I(out_data_OBUF[12]),
        .O(out_data[12]));
  OBUF \out_data_OBUF[13]_inst 
       (.I(out_data_OBUF[13]),
        .O(out_data[13]));
  OBUF \out_data_OBUF[14]_inst 
       (.I(out_data_OBUF[14]),
        .O(out_data[14]));
  OBUF \out_data_OBUF[15]_inst 
       (.I(out_data_OBUF[15]),
        .O(out_data[15]));
  OBUF \out_data_OBUF[16]_inst 
       (.I(out_data_OBUF[16]),
        .O(out_data[16]));
  OBUF \out_data_OBUF[17]_inst 
       (.I(out_data_OBUF[17]),
        .O(out_data[17]));
  OBUF \out_data_OBUF[18]_inst 
       (.I(out_data_OBUF[18]),
        .O(out_data[18]));
  OBUF \out_data_OBUF[19]_inst 
       (.I(out_data_OBUF[19]),
        .O(out_data[19]));
  OBUF \out_data_OBUF[1]_inst 
       (.I(out_data_OBUF[1]),
        .O(out_data[1]));
  OBUF \out_data_OBUF[20]_inst 
       (.I(out_data_OBUF[20]),
        .O(out_data[20]));
  OBUF \out_data_OBUF[21]_inst 
       (.I(out_data_OBUF[21]),
        .O(out_data[21]));
  OBUF \out_data_OBUF[22]_inst 
       (.I(out_data_OBUF[22]),
        .O(out_data[22]));
  OBUF \out_data_OBUF[23]_inst 
       (.I(out_data_OBUF[23]),
        .O(out_data[23]));
  OBUF \out_data_OBUF[24]_inst 
       (.I(out_data_OBUF[24]),
        .O(out_data[24]));
  OBUF \out_data_OBUF[25]_inst 
       (.I(out_data_OBUF[25]),
        .O(out_data[25]));
  OBUF \out_data_OBUF[26]_inst 
       (.I(out_data_OBUF[26]),
        .O(out_data[26]));
  OBUF \out_data_OBUF[27]_inst 
       (.I(out_data_OBUF[27]),
        .O(out_data[27]));
  OBUF \out_data_OBUF[28]_inst 
       (.I(out_data_OBUF[28]),
        .O(out_data[28]));
  OBUF \out_data_OBUF[29]_inst 
       (.I(out_data_OBUF[29]),
        .O(out_data[29]));
  OBUF \out_data_OBUF[2]_inst 
       (.I(out_data_OBUF[2]),
        .O(out_data[2]));
  OBUF \out_data_OBUF[30]_inst 
       (.I(out_data_OBUF[30]),
        .O(out_data[30]));
  OBUF \out_data_OBUF[31]_inst 
       (.I(out_data_OBUF[31]),
        .O(out_data[31]));
  OBUF \out_data_OBUF[3]_inst 
       (.I(out_data_OBUF[3]),
        .O(out_data[3]));
  OBUF \out_data_OBUF[4]_inst 
       (.I(out_data_OBUF[4]),
        .O(out_data[4]));
  OBUF \out_data_OBUF[5]_inst 
       (.I(out_data_OBUF[5]),
        .O(out_data[5]));
  OBUF \out_data_OBUF[6]_inst 
       (.I(out_data_OBUF[6]),
        .O(out_data[6]));
  OBUF \out_data_OBUF[7]_inst 
       (.I(out_data_OBUF[7]),
        .O(out_data[7]));
  OBUF \out_data_OBUF[8]_inst 
       (.I(out_data_OBUF[8]),
        .O(out_data[8]));
  OBUF \out_data_OBUF[9]_inst 
       (.I(out_data_OBUF[9]),
        .O(out_data[9]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
