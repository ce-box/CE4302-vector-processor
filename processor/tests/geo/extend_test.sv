module extend_test;

	logic [23:0] instr;
	logic [1:0]  immSrc;
	logic [31:0] extImm;
	
	extend extend_test(instr, immSrc, extImm);
	
	initial begin
	
	instr = 24'b111100001111000011110000;
	immSrc = 2'b00;
	#20
	
	instr = 24'b111100001111111111110000;
	immSrc = 2'b01;
	#20
	
	immSrc = 2'b10;
	#20
	
	$stop;
	
	end
	
endmodule 