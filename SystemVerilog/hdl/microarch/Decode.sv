module Decode (input logic clk, reset, RegWriteW, FlushE,
					input logic [3:0] InFlags,
					input logic [25:0] InstD, 
					input logic [31:0] PCPlus8, ResultW, 
					input logic [2:0] WA3W,
					output logic [31:0] RD1E, RD2E, ExtImmE,
					output logic PCSrcD, PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE, Stuck,
					output logic [2:0] ALUControlE, 
					output logic [1:0] FlagWriteE, 
					output logic CondE,
					output logic [3:0] FlagsE, 
					output logic [2:0] WA3E, ra1d, ra2d, RA1E, RA2E);

	logic [31:0] RD1, RD2, ExtOut;
	logic [2:0] RA1D, RA2D;
	
	
	logic CondD;
	logic [2:0] Rd;
	logic [5:0] Funct;
	logic [1:0] Opcode;
	logic [1:0] RegSrcD, ImmSrcD;
	
	logic [1:0] FlagWriteD;
	logic RegWriteD,MemtoRegD;
	logic MemWriteD, BranchD,ALUSrcD;
	logic [2:0] ALUControlD;
	
	assign Opcode = InstD [24:23];
	assign Funct = InstD [22:17];
	assign Rd = InstD [13:11];
	assign CondD = InstD [25];
	
	//unidad de control
	Control_Unit controlUnit (	Opcode, Funct, Rd,
										FlagWriteD,
										PCSrcD, RegWriteD,MemtoRegD,
										MemWriteD, BranchD,ALUSrcD, Stuck,
										ALUControlD,ImmSrcD,RegSrcD);
	
	Mux2 # (3) mux_ra1 (InstD[16:14], 3'b111, RegSrcD[0], RA1D);
	Mux2 # (3) mux_ra2 (InstD[2:0], InstD[13:11], RegSrcD[1], RA2D);
	
	BancoRegistros BR (clk, RegWriteW, reset, RA1D, RA2D, WA3W, ResultW, PCPlus8, RD1, RD2);
	
	Extend extend (InstD[20:0], ImmSrcD, ExtOut);
	
	//registro de Deco-Exe
	
	assign ra1d = RA1D;
	assign ra2d = RA2D;
	
	RegDE regde (	clk, FlushE,reset,
						PCSrcD, RegWriteD, MemtoRegD, MemWriteD, BranchD, ALUSrcD,
						ALUControlD, FlagWriteD, 
						CondD, InFlags,
						RD1, RD2, ExtOut,
						InstD[13:11], RA1D, RA2D,
						RD1E, RD2E, ExtImmE,
						WA3E, RA1E, RA2E,
						PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
						ALUControlE, FlagWriteE, 
						CondE, FlagsE);
						
endmodule 