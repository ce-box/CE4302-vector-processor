module Control_Unit(input logic [1:0] Op,
						  input logic [5:0] Funct,
						  input logic [2:0] Rd,
						  output logic [1:0] FlagWriteD,
						  output logic PCSrcD, RegWriteD,MemtoRegD,
						  output logic MemWriteD, BranchD,ALUSrcD, Stuck,
						  output logic [2:0] ALUControlD,
						  output logic [1:0] ImmSrcD,RegSrcD);
						  
logic [10:0] controls;
logic ALUOp, Stucktemp;


//Main Decoder

always_comb
	casex(Op)
		
		2'b00: 
			//Data Processing immediate
			if(Funct[5])
			begin 
				controls = 11'b00000101001;
			end
			//Data Processing Register
			else
			begin
				controls = 11'b00000001001;
			end
		2'b01:
			//LDR
			if(Funct[0])
			begin
				controls = 11'b00001111000;
			end
			//STR
			else
			begin
				controls = 11'b01001110100;
			end
		
		2'b10:
			//B
			controls = 11'b00110100010;
			
		2'b11:
			//Stuck: 1110 1101 1010 0000 0000 0000
			controls = 11'b10000001001;

			
	endcase
		
assign {Stuck, RegSrcD, ImmSrcD, ALUSrcD, MemtoRegD,
RegWriteD, MemWriteD, BranchD, ALUOp} = controls;


always_comb
	if (ALUOp) 
	begin // which DP Instr?
		case(Funct[4:1])
			4'b0100: 
				ALUControlD = 3'b000; // ADD
			4'b0010: 
				ALUControlD = 3'b001; // SUB
			4'b0000: 
				ALUControlD = 3'b010; // AND
			4'b1100: 
				ALUControlD = 3'b011; // ORR
			4'b0001:
				ALUControlD = 3'b100; // Multiplicar
			4'b0011:
				ALUControlD = 3'b101; // Promedio
			4'b0101:
				ALUControlD = 3'b110; // Umbral
			4'b0111:
				ALUControlD = 3'b111; // Shift left
			default: 
				ALUControlD = 3'bx; // unimplemented
		endcase
		// update flags if S bit is set (C & V only for arith)
		FlagWriteD[1] = Funct[0];
		FlagWriteD[0] = Funct[0] & (ALUControlD == 3'b000 | ALUControlD == 3'b001);
		end 
		else 
		begin
			ALUControlD = 3'b000; // add for non-DP instructions
			FlagWriteD = 2'b00; // don't update Flags
		end

		//PC Logic
		assign PCSrcD = ((Rd == 4'b1111) & RegWriteD) | BranchD;
		
endmodule



			