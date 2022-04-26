module alu_test;
	
	logic[31:0] a;
	logic[31:0] b;
	
	logic [2:0]  ALUControl;
	logic [31:0] Result;
   logic [3:0]  Flags;
	
	
	alu alu_test (a, b, ALUControl, Result, Flags);
	
	
	initial begin 
		
		//Suma
		ALUControl = 3'b000;
		a =          4;
		b =          6;
		#20
		
		//Suma
		ALUControl = 3'b001;
		a =          4;
		b =          1;
		#20
		
		//Suma
		ALUControl = 3'b001;
		a =          -4;
		b =           1;
		#20
		
		//AND
		ALUControl = 3'b010;
		a =          4'b1000;
		b =          4'b1010;
		#20
		
		//OR
		ALUControl = 3'b011;
		a =          4'b1000;
		b =          4'b1010;
		#20
		
		//XOR
		ALUControl = 3'b100;
		a =          4'b1000;
		b =          4'b1010;
		#20
		
		//MULT
		ALUControl = 3'b101;
		a =          2;
		b =          2;
		#20
		
		//MULT
		ALUControl = 3'b101;
		a =          0;
		b =          2;
		#20
		
		
		$stop;
		
	end
	
endmodule 
