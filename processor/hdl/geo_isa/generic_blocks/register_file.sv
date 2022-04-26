module register_file(
	input  logic 	    clk, we,
	input  logic [3:0]  ra1, ra2, wa,
	input  logic [31:0] wd, r15,
	output logic [31:0] rd1, rd2
	);
	
	logic [31:0] rf[14:0];
	
	initial begin
		  $readmemh("ref.mem", rf);
	end
	
	always_ff @(posedge clk)	
			if (we) rf[wa] <= wd;
		
	assign rd1 = (ra1 == 4'b1111) ? r15 : rf[ra1];
	assign rd2 = (ra2 == 4'b1111) ? r15 : rf[ra2];

endmodule
