module flopr_test;

	parameter N = 4;

	logic clk, reset; 
   logic [N-1:0] d; 
   logic [N-1:0] q;
	
	flopr #(N) flopr_t (clk, reset, d, q);
	
	initial begin 
		clk   = 0;
		reset = 0;
		d     = 4;
		#100;
		
		clk = 1;
		#20
		
		clk = 0;
		#20
		
		clk = 1;
		reset = 1;
		#20
		
		clk = 0;
		reset = 0;
		d = 2;
		#20
		
		clk = 1;
		#20
		
		$stop;
		
	end
	
endmodule 