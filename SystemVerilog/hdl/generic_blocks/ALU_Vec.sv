module ALU_Vec #(parameter N = 32)(
	input logic [N - 1 : 0] inA, inB, inC, inD, inE, inF, inG, inH,
	input logic [N - 1 : 0] inA2, inB2,inC2, inD2, inE2, inF2, inG2, inH2,
	input logic [1 : 0] selec,
	output logic [N - 1 : 0] out1, out2, out3, out4, out5, out6, out7, out8
	);
	
	ALU_NBITS #(N) alu1(inA, inA2, selec, out1);
	
	ALU_NBITS #(N) alu2(inB, inB2, selec, out2);
	
	ALU_NBITS #(N) alu3(inC, inC2, selec, out3);
	
	ALU_NBITS #(N) alu4(inD, inD2, selec, out4);
	
	ALU_NBITS #(N) alu5(inE, inE2, selec, out5);
	
	ALU_NBITS #(N) alu6(inF, inF2, selec, out6);
	
	ALU_NBITS #(N) alu7(inG, inG2, selec, out7);
	
	ALU_NBITS #(N) alu8(inH, inH2, selec, out8);
	
endmodule