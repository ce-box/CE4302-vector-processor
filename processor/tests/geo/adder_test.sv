module adder_test;

	parameter N = 4;

	logic [N-1:0] a, b;
	logic [N-1:0] y;
	
	adder #(N) adder_t (
		.a(a),
		.b(b),
		.y(y)
	);
	
	initial begin 
		a = 0;
		b = 0;
		#100;
		
		a = 8;
		b = -1;
		#20
		
		a = 1;
		b = 4;
		#20
		
		$stop;
		
	end
	
endmodule 