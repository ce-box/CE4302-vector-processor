module ALU_NBITS #(parameter N = 32) 
	(
		input logic [N - 1 : 0] inA, inB,
		input logic [1 : 0] selec,
		output logic [N - 1 : 0] out
	);
	logic [N - 1 : 0] a, b, c, d;
	
	assign a = inA * inB; //0001
	
	assign b = inA + inB;//0000
	
	assign c = inA - inB;//0010

	assign d = inA / inB;//0100
	
	mux_4to1 #(N) muxd (out, b, a, c, d, selec[0], selec[1]);
	
endmodule
