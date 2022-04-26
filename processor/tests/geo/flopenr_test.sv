module flopenr_test;

	parameter WIDTH = 4;

	logic clk, reset, en; 
   logic [WIDTH-1:0] d; 
   logic [WIDTH-1:0] q;
	
	flopenr #(WIDTH) flopenr_t (clk, reset, en, d, q);
	
	initial begin 
		clk   = 0;
		reset = 0;
		en    = 1;
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
		en    = 0;
		d = 2;
		#20
		
		clk = 1;
		#20
		
		$stop;
		
	end
	
endmodule 
