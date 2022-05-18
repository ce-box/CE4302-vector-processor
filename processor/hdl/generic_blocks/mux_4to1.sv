module mux_4to1 #(parameter N = 32) (output [N - 1 : 0] Y, input [N - 1 : 0] A, B, C, D, input sel1, input sel2);
	logic [N - 1 : 0] out1;
	logic [N - 1 : 0] out2;
	
	mux_2to1 #(N) mux1 (out1, A, B, sel1);
	mux_2to1 #(N) mux2 (out2, C, D, sel1);
	mux_2to1 #(N) mux3 (Y, out1, out2, sel2);
endmodule
