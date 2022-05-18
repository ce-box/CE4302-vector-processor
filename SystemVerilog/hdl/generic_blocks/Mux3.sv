module Mux3 #(parameter N = 8)(	input logic [N-1:0] d0, d1, d2,
											input logic [1:0] s,
											output logic [N-1:0] y);

always_comb begin
	if(s == 2'b01) y = d1;
	else if(s == 2'b10)  y = d2;
	else y = d0;
end
endmodule
