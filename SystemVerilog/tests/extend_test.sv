module Extend_TB();

	logic [23:0] Instr;
	logic [1:0] ImmSrc;
	logic [31:0] ExtImm;


Extend dut(
.Instr(Instr), 
.ImmSrc(ImmSrc),
.ExtImm(ExtImm)
 );

	initial begin
		Instr <= 24'b101011001111001111110000;
		ImmSrc <= 2'b00;
		#10; 
		ImmSrc <= 2'b01;
		#10;
		ImmSrc <= 2'b10;
		#10;
		ImmSrc <= 2'b11;

	end // initial

endmodule