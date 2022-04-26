module mux3 #(parameter N = 32)(
		input  logic [N-1: 0] d0, d1, d2, 
		input  logic [1:0]    select,
		output logic [N-1: 0] y
	);

	always_comb
	
		case(select)
		
			2'b00  : y  = d0;
			2'b01  : y  = d1;
			2'b10  : y  = d2;
			
			default : y  = 3'b000;
			
		endcase


endmodule
