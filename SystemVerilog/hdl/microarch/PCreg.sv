module PCreg #	(	parameter N = 8) (	input logic clk, reset, en,
													input logic [N-1:0] inPC,
													output logic [N-1:0] outPC);
	
always_ff @(posedge clk, posedge reset) begin
	
	if (reset) outPC <= 0;
	
	else if (en) outPC <= inPC;
	
	end
	
endmodule