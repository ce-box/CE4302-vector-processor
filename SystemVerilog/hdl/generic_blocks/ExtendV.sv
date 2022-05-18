
module ExtendV(input logic [20:0] Instr,
					input logic [1:0] ImmSrc,
					output logic [255:0] ExtImm);


always_comb

	case(ImmSrc)
	
	// 8-bit unsigned immediate
	2'b00: ExtImm = {248'b0, Instr[6:0]};


	// 12-bit unsigned immediate
	2'b01: ExtImm = {244'b0, Instr[10:0]};

	// 24-bit two's complement shifted branch
	2'b10: ExtImm = {{9{Instr[20]}}, Instr[20:0], 225'b00};

	default: ExtImm = 255'bx; // undefined

endcase

endmodule