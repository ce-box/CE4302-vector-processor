module RegMWV (	input logic clk,
					input logic PCSrcM, RegWriteM, MemtoRegM,
					input logic [255:0] MemOut, ALUResultM,
					input logic [2:0] WA3M,
					output logic PCSrcW, RegWriteW, MemtoRegW,
					output logic [255:0] ReadDataW,ALUOutW,
					output logic [2:0] WA3W);
					

always_ff @(posedge clk) begin

		PCSrcW <= PCSrcM;
		RegWriteW <= RegWriteM;
		MemtoRegW <= MemtoRegM;
		ReadDataW <= MemOut;
		ALUOutW <= ALUResultM;
		WA3W <= WA3M;

end

endmodule 