module MemInst_testbench();

logic [31:0] a, rd;

MemInst dut(a,rd);

initial
	begin
	
	a = 32'b0;
	#10;
	a = 32'd4;
	#10;
	a = 32'd8;
	#10;
	
	end
endmodule