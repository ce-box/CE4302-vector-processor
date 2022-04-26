module eqcmp_test;

	parameter N = 4;

	logic [N-1:0] a, b;
	logic [N-1:0] y;
	
	eqcmp #(N) eqcmp_t (a,b,y);
	
	initial begin 
		a = 3'b001;
		b = 3'b110;
		
		
		#100;
		
		a = 3'b111;
		b = 3'b111;
		
		#20
		a = 3'b111;
		b = 3'b110;
		
		#20
		
		$stop;
		
	end
	
endmodule