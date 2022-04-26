module register_file_test;

	logic        clk;
	logic        wr;
	logic [3:0]  ra1, ra2, wa;
	logic [31:0] wd, r15;
	logic [31:0] rd1, rd2;
	
	register_file register_test(clk, wr, ra1, ra2, wa, wd, r15, rd1, rd2);
	
	initial begin 
	
		clk = 1;
		wr  = 1;
		r15 = 32'h4c;
		#20
		
		//write
		clk = 0;
		ra1 = 4'b0;
		ra2 = 4'b0;
		wa  = 4'b0100;
		wd  = 32'h4;
		#20
		
		//Read
		clk = 1;
		ra1 = 4'b0100;
		ra2 = 4'b0;	
		#20
		
		//
		
		//write
		clk = 0;
		ra1 = 4'b0;
		ra2 = 4'b0;
		wa  = 4'b0011;
		wd  = 32'hf;
		#20
		
		//Read
		clk = 1;
		ra1 = 4'b0100;
		ra2 = 4'b0011;	
		#20
		
		//
		
		//Write
		clk = 0;
		#20
		
		//Read
		clk = 1;
		ra1 = 4'b1111;
		#20
		
		
		
		$stop;
			
	end
	
endmodule 