module Execute (	input logic clk, reset,
						input logic [31:0] RD1E, RD2E, ExtImmE, ResultW, ALUResultMFB,
						input logic PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
						input logic [2:0] ALUControlE, 
						input logic [1:0] FlagWriteE, ForwardAE, ForwardBE,
						input logic CondE, 
						input logic [3:0]FlagsE, 
						input logic [2:0]WA3E,
						output logic PCSrcM, RegWriteM, MemWriteM, MemtoRegM, BranchTakenE,
						output logic [31:0] ALUResultM, WriteDataM, ALUResultEA,
						output logic [2:0] WA3M,
						output logic [3:0] FlagsD);

	logic [31:0] WriteDataE, Op1, Op2, ALUResultE;
	logic [3:0] ALUFlags;
	
	Mux3 # (32) mux_ra1E (RD1E, ResultW, ALUResultMFB, ForwardAE, Op1);
	Mux3 # (32) mux_ra2E (RD2E, ResultW, ALUResultMFB, ForwardBE, WriteDataE);
	Mux2 # (32) mux_op2  (WriteDataE, ExtImmE, ALUSrcE, Op2);
		
	ALU #(32) alu( Op1, Op2, ALUControlE[1:0], ALUFlags, ALUResultE);
	
	logic PCSrcEA, RegWriteEA, MemWriteEA;
	
	Condition_Unit condUnit (clk, reset,
									 CondE,
									 ALUFlags,
									 FlagsE,
									 FlagsD,
									 FlagWriteE,
									 PCSrcE, RegWriteE, MemWriteE,BranchE,
									 PCSrcEA, RegWriteEA,MemWriteEA, BranchTakenE);
	
	RegEM regem(clk,
					PCSrcEA, RegWriteEA, MemWriteEA, MemtoRegE,
					ALUResultE, WriteDataE,
					WA3E,
					PCSrcM, RegWriteM, MemWriteM, MemtoRegM,
					ALUResultM, WriteDataM,
					WA3M);
					
	assign ALUResultEA = ALUResultE;


endmodule 