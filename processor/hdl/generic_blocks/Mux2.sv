module Mux2 #(parameter N = 8) (	input logic [N-1:0] d0, d1,
											input logic s,
											output logic [N-1:0] y);
always_comb begin 
	if(s ==1) y=d1;
	else  y=d0;
end

endmodule
