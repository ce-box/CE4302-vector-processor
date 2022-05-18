module mux_2to1 #(parameter N = 32) (output [N - 1 : 0] Y, input [N - 1 : 0] A, B, input sel);
	logic [N - 1 : 0] aux;
	
	always @(A or B or sel)
		case (sel)
			0 : aux = A;
			1 : aux = B;
		endcase
	assign Y = aux;
endmodule
	