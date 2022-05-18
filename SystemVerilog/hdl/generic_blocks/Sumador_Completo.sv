module Sumador_Completo #(parameter N = 32) (input logic [N-1:0] A,
														  input logic [N-1:0] B,
														  input logic Cin,
														  output logic [N-1:0] S,
														  output logic Cout);

	logic [N:0] Cout_Temp; // Cout Temporal para conectar sumadores de 1 bit
	assign Cout_Temp[0] = Cin;
	genvar i;
	
	generate
		for (i = 0 ; i < N ; i = i+1) // Generar tantos sumadores como N
			begin: forloop
				Sumador_1bit sumador (A[i],B[i],Cout_Temp[i],S[i],Cout_Temp[i+1]);
			end
			assign Cout = Cout_Temp[N]; // Asigna el ultima valor del temp al Cout
	endgenerate
								
endmodule
