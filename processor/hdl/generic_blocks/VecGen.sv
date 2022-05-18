module VecGen( input clk,
					input logic [15:0] addr,
					input logic [31:0] memRead,
					input logic MemWrite,
					output logic [15:0] vecAddr,
					output logic [255:0] vector,
					output logic vecWrite);
					
logic [255:0] vecAux;

always_ff @(posedge clk)

	case(addr)
	
	16'd256: begin
				if(MemWrite) vecAux[31:0] <= memRead;
				vecWrite <= 1'b0;
			end
	
	16'd257: begin
				if(MemWrite) vecAux[63:32] <= memRead;
				vecWrite <= 1'b0;
			end
			
	16'd258: begin
				if(MemWrite) vecAux[95:64] <= memRead;
				vecWrite <= 1'b0;
			end

	16'd259: begin
				if(MemWrite) vecAux[127:96] <= memRead;
				vecWrite <= 1'b0;
			end

	16'd260: begin
				if(MemWrite) vecAux[159:128] <= memRead;
				vecWrite <= 1'b0;
			end
			
	16'd261: begin
				if(MemWrite) vecAux[191:160] <= memRead;
				vecWrite <= 1'b0;
			end
			
	16'd262: begin
				if(MemWrite) vecAux[223:192] <= memRead;
				vecWrite <= 1'b0;
			end
			
			
	16'd263: begin
				if(MemWrite) vecAux[255:224] <= memRead;
				vecWrite <= 1'b0;
			end
			
	16'd264: begin
				case (memRead)
					32'd0: begin
							vecAddr <= 16'd0;
							vecWrite <= 1'b1;
						end
						
					32'd1: begin
							vecAddr <= 16'd1;
							vecWrite <= 1'b1;
						end
						
					32'd2: begin
							vecAddr <= 16'd2;
							vecWrite <= 1'b1;
						end
					default : begin
								vecWrite <= 1'b0;
							end				
					endcase
			end
			
	default : vecWrite <= 1'b0;
	
	endcase
	
assign vector = vecAux;

endmodule
