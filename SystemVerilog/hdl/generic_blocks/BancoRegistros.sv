module BancoRegistros(	input logic clk,
								input logic we3, reset,
								input logic [2:0] ra1, ra2, wa3,
								input logic [31:0] wd3, r15,
								output logic [31:0] rd1, rd2);


logic [31:0] rf[7:0];
// three ported register file
// read two ports combinationally
// write third port on rising edge of clock
// register 15 reads PC + 8 instead

always_ff @(negedge clk) begin

	if(reset)begin
				rf[0] <= 32'b0;
				rf[1] <= 32'b0;
				rf[2] <= 32'b0;
				rf[3] <= 32'b0;
				rf[4] <= 32'b0;
				rf[5] <= 32'b0;
				rf[6] <= 32'b0;
				rf[7] <= 32'b0;
		end

	else if (we3) rf[wa3] <= wd3;

end

assign rd1 = (ra1 == 3'b111) ? r15 : rf[ra1];
assign rd2 = (ra2 == 3'b111) ? r15 : rf[ra2];
endmodule