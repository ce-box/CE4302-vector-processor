module RegFD (	input logic clk, en, clr,
					input logic [25:0] instF,
					input logic [25:0] instFV,
					output logic [25:0] instD,
					output logic [25:0] instDV);
					

always_ff @(posedge clk) begin

	if(clr)begin
				instD <= 26'b0;
				instDV <= 26'b0;
		end

	else if (en) begin
		instD <= instF;
		instDV <= instFV;
	end

end

endmodule