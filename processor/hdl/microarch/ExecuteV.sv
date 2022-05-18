module ExecuteV (	input logic clk, reset,
						input logic [255:0] RD1E, RD2E,
						input logic [255:0] ExtImmE,
						input logic [255:0] ResultW, ALUResultMFB,
						input logic PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
						input logic [2:0] ALUControlE, 
						input logic [1:0] FlagWriteE, ForwardAE, ForwardBE,
						input logic CondE, 
						input logic [3:0]FlagsE, 
						input logic [2:0]WA3E,
						output logic PCSrcM, RegWriteM, MemWriteM, MemtoRegM, BranchTakenE,
						output logic [255:0] ALUResultM, WriteDataM, ALUResultEA,
						output logic [2:0] WA3M,
						output logic [3:0] FlagsD);

	logic [255:0] WriteDataE, Op1, Op2, ALUResultE;
	logic [3:0] ALUFlags;
	
	Mux3 # (256) mux_ra1E (RD1E, ResultW, ALUResultMFB, ForwardAE, Op1);
	Mux3 # (256) mux_ra2E (RD2E, ResultW, ALUResultMFB, ForwardBE, WriteDataE);
	Mux2 # (256) mux_op2  (WriteDataE, ExtImmE, ALUSrcE, Op2);
		
	ALU_Vec #(32) alu_vec(Op1[31:0], Op1[63:32], Op1[95:64], Op1[127:96], Op1[159:128], Op1[191:160],Op1[223:192], Op1[255:224],
									Op2[31:0], Op2[63:32], Op2[95:64], Op2[127:96], Op2[159:128], Op2[191:160],Op2[223:192], Op2[255:224],
									ALUControlE[1:0],
									ALUResultE[31:0], ALUResultE[63:32], ALUResultE[95:64], ALUResultE[127:96], ALUResultE[159:128], ALUResultE[191:160],ALUResultE[223:192], ALUResultE[255:224]);
									
	assign ALUFlags = 4'b0000;
	
	logic PCSrcEA, RegWriteEA, MemWriteEA;
	
	Condition_UnitV condUnit (clk, reset,
									 CondE,
									 ALUFlags,
									 FlagsE,
									 FlagsD,
									 FlagWriteE,
									 PCSrcE, RegWriteE, MemWriteE,BranchE,
									 PCSrcEA, RegWriteEA,MemWriteEA, BranchTakenE);
	
	RegEMV regem(clk,
					PCSrcEA, RegWriteEA, MemWriteEA, MemtoRegE,
					ALUResultE, WriteDataE,
					WA3E,
					PCSrcM, RegWriteM, MemWriteM, MemtoRegM,
					ALUResultM, WriteDataM,
					WA3M);
					
	assign ALUResultEA = ALUResultE;


endmodule 