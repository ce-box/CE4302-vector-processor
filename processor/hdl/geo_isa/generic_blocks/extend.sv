module extend(
	input  logic [23:0] instr,
	input  logic [1:0]  immSrc,
	output logic [31:0] extImm
	);

	always_comb 
		case(immSrc)
		
			// 16 bits 
			2'b00:extImm = {16'b0, instr[15:0]};
			// 16 bits
			2'b01:extImm = 32'b0;
			// 24 bits
			2'b10:extImm = {{8{instr[23]}}, instr[23:0]};
			
			default: extImm = 32'bx;
			
		endcase
		
endmodule
					