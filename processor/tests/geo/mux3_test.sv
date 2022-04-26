module mux3_test;

	parameter N = 4;

	logic [N-1:0] d0, d1, d2;
	logic [2:0]   select;
	logic [N-1:0] y;
	
	mux3 #(N) mux_t (
		.d0(d0),
		.d1(d1),
		.d2(d2),
		.select(select),
		.y(y)
	);
	
	initial begin 
		d0 = 4'b0101;
		d1 = 4'b1111;
		d2 = 4'b0011;
		select = 00;
		
		#100;
		
		select = 01;
		#20
		
		select = 10;
		#20
		
		$stop;
		
	end
	
endmodule
