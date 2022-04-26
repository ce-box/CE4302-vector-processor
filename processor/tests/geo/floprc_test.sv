module floprc_test;

	parameter WIDTH = 4;

	logic clk, reset, clear; 
   logic [WIDTH-1:0] d; 
   logic [WIDTH-1:0] q;
	
	floprc #(WIDTH) floprc_t (clk, reset, clear, d, q);
	
	initial begin 
		clk   = 0;
		reset = 0;
		clear = 0;
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
		
		clk = 0;
		clear = 1;
		#20
		
		clk = 1;
		#20
		
		$stop;
		
	end
	
endmodule 
