module mux2_test;

	parameter N = 4;

	logic [N-1:0] d0, d1;
	logic     	  s;
	logic [N-1:0] y;
	
	mux2 #(N) mux_t (
		.d0(d0),
		.d1(d1),
		.s(s),
		.y(y)
	);
	
	initial begin 
		d0 = 4'b0101;
		d1 = 4'b1111;
		s = 0;
		
		#100;
		
		s = 1;
		#20
		
		$stop;
		
	end
	
endmodule 