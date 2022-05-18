module InstSelector(input logic InstSelec,
							input logic[25:0] Inst,
							output logic[25:0] InstOut,
							output logic[25:0] InstOutV);
							
always_comb

	case(InstSelec)
	
	1'b0: begin
				InstOut = Inst;
				InstOutV = 25'h500000;
			end


	// 12-bit unsigned immediate
	1'b1: begin
				InstOut = 25'h500000;
				InstOutV = Inst;
			end
	
	default: begin
					InstOut = 25'h500000;
					InstOutV = 25'h500000;// undefined
				end
	endcase

endmodule
