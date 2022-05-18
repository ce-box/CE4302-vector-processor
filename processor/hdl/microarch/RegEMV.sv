module RegEMV (input logic clk,
					input logic PCSrcEA, RegWriteEA, MemWriteEA, MemtoRegE,
					input logic [255:0] ALUResultE, WriteDataE,
					input logic [2:0] WA3E,
					output logic PCSrcM, RegWriteM, MemWriteM, MemtoRegM,
					output logic [255:0] ALUResultM, WriteDataM,
					output logic [2:0] WA3M);
					

always_ff @(posedge clk) begin

		PCSrcM <= PCSrcEA;
		RegWriteM <= RegWriteEA;
		MemWriteM <= MemWriteEA;
		MemtoRegM <= MemtoRegE;
		ALUResultM <= ALUResultE;
		WriteDataM <= WriteDataE;
		WA3M <= WA3E;


end

endmodule