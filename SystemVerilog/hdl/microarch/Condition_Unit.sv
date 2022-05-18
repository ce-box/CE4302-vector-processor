module Condition_Unit(input logic clk, reset,
							 input logic CondE,
							 input logic [3:0] ALUFlags,
							 input logic [3:0] FlagsE,
							 output logic [3:0] ALUFlags_Out,
							 input logic [1:0] FlagWriteE,
							 input logic PCSrcE, RegWriteE, MemWriteE,BranchE,
							 output logic PCSrcM, RegWriteM,MemWriteM, BranchTakenE);
							 

logic [1:0] FlagWrite;
logic [3:0] Flags;
logic CondEx;

flopenr #(2)flagreg1(clk, reset, FlagWrite[1],
							ALUFlags[3:2], Flags[3:2]);
flopenr #(2)flagreg0(clk, reset, FlagWrite[0],
							ALUFlags[1:0], Flags[1:0]);
							
							
// write controls are conditional
condcheck cc(CondE, Flags, CondEx);

assign FlagWrite = FlagWriteE & {2{CondEx}};
assign RegWriteM = RegWriteE & CondEx;
assign MemWriteM = MemWriteE & CondEx;
assign PCSrcM = PCSrcE & CondEx;
assign BranchTakenE = CondEx & BranchE;
 
assign ALUFlags_Out = ALUFlags;

endmodule


module condcheck(input logic Cond,
					  input logic [3:0] Flags,
					  output logic CondEx);
					  
					  
logic neg, zero, carry1, overflow, ge;

assign {neg, zero, carry1, overflow} = Flags;

assign ge = (neg == overflow);

always_comb
	case(Cond)
		4'b1010:
			CondEx = zero; // EQ
		4'b0001: 
			CondEx = ~zero; // NE
		4'b0010: 
			CondEx = carry1; // CS
		4'b0011: 
			CondEx = ~carry1; // CC
		4'b0100: 
			CondEx = neg; // MI
		4'b0101:
			CondEx = ~neg; // PL
		4'b0110: 
			CondEx = overflow; // VS
		4'b0111: 
			CondEx = ~overflow; // VC
		4'b1000: 
			CondEx = carry1 & ~zero; // HI
		4'b1001: 
			CondEx = ~(carry1 & ~zero); // LS
		1'b1: 
			CondEx = ge; // GE
		4'b1011: 
			CondEx = ~ge; // LT
		4'b1100: 
			CondEx = ~zero & ge; // GT
		4'b1101: 
			CondEx = ~(~zero & ge); // LE
		1'b0: 
			CondEx = 1'b1; // Always
		default: 
			CondEx = 1'bx; // undefined
			
	endcase
endmodule
