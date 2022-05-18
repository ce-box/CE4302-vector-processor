module RegDEV (input logic clk, clr,reset,
					input logic PCSrcD, RegWriteD, MemtoRegD, MemWriteD, BranchD, ALUSrcD,
					input logic [2:0] ALUControlD, 
					input logic [1:0] FlagWriteD, 
					input logic CondD, 
					input logic [3:0]FlagsD,
					input logic [255:0] rd1, rd2,
					input logic [255:0] ext,
					input logic [2:0] a3, RA1D, RA2D,
					output logic [255:0] rdo1, rdo2, 
					output logic [255:0] exto,
					output logic [2:0] ao3, RA1E, RA2E,
					output logic PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
					output logic [2:0] ALUControlE, 
					output logic [1:0] FlagWriteE, 
					output logic CondE, 
					output logic [3:0]FlagsE);
					

always_ff @(posedge clk) begin

	if(clr || reset)begin
				rdo1 <= 255'b0;
				rdo2 <= 255'b0;
				exto <= 255'b0;
				ao3 <= 3'b0;
				RA1E <= 3'b0;
				RA2E <= 3'b0;
				PCSrcE <= 1'b0;
				RegWriteE <= 1'b0;
				MemtoRegE <= 1'b0;
				MemWriteE <= 1'b0;
				BranchE <= 1'b0;
				ALUSrcE <= 1'b0;
				ALUControlE <= 3'b0;
				FlagWriteE <= 2'b0;
				CondE <= 1'b0;
				FlagsE <= 4'b0;
				
		end

	else 	begin
			rdo1 <= rd1;
			rdo2 <= rd2;
			exto <= ext;
			ao3 <= a3;
			RA1E <= RA1D;
			RA2E <= RA2D;
			PCSrcE <= PCSrcD;
			RegWriteE <= RegWriteD;
			MemtoRegE <= MemtoRegD;
			MemWriteE <= MemWriteD;
			BranchE <= BranchD;
			ALUSrcE <= ALUSrcD;
			ALUControlE <= ALUControlD;
			FlagWriteE <= FlagWriteD;
			CondE <= CondD;
			FlagsE <= FlagsD;
		end

end

endmodule
