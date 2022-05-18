module RegFDV (	input logic clk, en, clr,
					input logic [25:0] instF,
					output logic [25:0] instD);
					

always_ff @(posedge clk) begin

	if(clr)begin
				instD <= 26'b0;
		end

	else if (en) instD <= instF;

end

endmodule