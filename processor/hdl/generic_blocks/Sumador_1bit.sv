module Sumador_1bit (input logic A,
							input logic B,
							input logic Cin,
							output logic S,
							output logic Cout);

	assign Cout = (A & B) | (Cin & A) | (Cin & B);
	assign S = A ^ B ^ Cin ;
			
endmodule 
											  