module Fetch_testbench ();

	logic clk, reset;
	logic [31:0] ResultW, ALUResultE;
	logic PCSrcW, BranchTakenE, StallF, StallD, FlushD;
	logic [31:0] InstrD, InstrDV, PCPlus8D;

Fetch dut( 	clk, reset,
				ResultW, ALUResultE,
				PCSrcW, BranchTakenE, StallF, StallD, FlushD,
				InstrD, InstrDV, PCPlus8D);
				
initial
begin
	
	ResultW = 32'b0; ALUResultE = 32'b0;
	PCSrcW = 1'b0; BranchTakenE = 1'b0; StallF = 1'b1; StallD = 1'b1; FlushD = 1'b0;

	begin
		reset <= 1; # 10; reset <= 0;
	end
	
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end
end

endmodule 