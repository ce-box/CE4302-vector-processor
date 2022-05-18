module FlipFlop_SR (input logic S, 
						  input logic R, 
						  output logic Q);

	logic and1, and2;
	
	assign and1 = ~(~S & and2);
	assign and2 = ~(~R & and1);
	
	assign Q = and1;
	
						  
endmodule
