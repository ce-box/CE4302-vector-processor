module ALU_tb ();


logic [1:0] Control;
logic [3:0] A,B,Result;
logic [3:0] Flags;

ALU #(4) DUT (A,B,Control, Flags, Result);

initial 
	begin
	
		$display("Testbench para Sumador");
		Control = 2'b00; A = 4'b0001; B = 4'b1110; 
		#10
		assert (Result === 4'b1111) $display("Correcto"); else $error("000 failed.");
		assert (Flags[2] === 0) $display("Correcto"); else $error("000 failed.");
		assert (Flags[3] === 1) $display("Correcto"); else $error("000 failed.");
		assert (Flags[1] === 0) $display("Correcto"); else $error("000 failed.");
		assert (Flags[0] === 0) $display("Correcto"); else $error("flag 000 failed.");
		#10;
		Control = 2'b00; A = 4'b0000; B = 4'b0000; 
		#10
		assert (Result === 4'b0000) $display("Correcto"); else $error("000 failed.");
		assert (Flags[2] === 1) $display("Correcto"); else $error("000 failed.");
		assert (Flags[3] === 0) $display("Correcto"); else $error("000 failed.");
		assert (Flags[0] === 0) $display("Correcto"); else $error("flag 000 failed.");
		#10;
		Control = 2'b00; A = 4'b0001; B = 4'b1111; 
		#10
		assert (Result === 4'b0000) $display("Correcto"); else $error("000 failed.");
		assert (Flags[2] === 1) $display("Correcto"); else $error("000 failed.");
		assert (Flags[3] === 0) $display("Correcto"); else $error("000 failed.");
		assert (Flags[1] === 1) $display("Correcto"); else $error("000 failed.");
		assert (Flags[0] === 0) $display("Correcto"); else $error("flag 000 failed.");
		#10;
		Control = 2'b00; A = 4'b0100; B = 4'b0101; 
		#10
		assert (Result === 4'b1001) $display("Correcto"); else $error("000 failed.");
		assert (Flags[2] === 0) $display("Correcto"); else $error("000 failed.");
		assert (Flags[3] === 1) $display("Correcto"); else $error("000 failed.");
		assert (Flags[1] === 0) $display("Correcto"); else $error("000 failed.");
		assert (Flags[0] === 1) $display("Correcto"); else $error("flag 000 failed.");
		#10;
		
		$display("Testbench para Restador");
		Control = 2'b01; A = 4'b0010; B = 4'b0001; 
		#10;
		assert (Result === 4'b0001) $display("Correcto"); else $error("Fallo el Restador");
		#10;
		Control = 2'b01; A = 4'b0000; B = 4'b1101; 
		#10;
		assert (Result === 4'b0011) $display("Correcto"); else $error("Fallo el Restador");
		#10;
		Control = 2'b01; A = 4'b0111; B = 4'b0010; 
		#10;
		assert (Result === 4'b0101) $display("Correcto"); else $error("Fallo el Restador");
		#10;
		Control = 2'b01; A = 4'b0100; B = 4'b0010; 
		#10;
		assert (Result === 4'b0010) $display("Correcto"); else $error("Fallo el Restador");
		#10;
		
		$display("Testbench para AND");
		Control = 2'b10; A = 4'b0100; B = 4'b0010; 
		#10;
		assert (Result === 4'b0000) $display("Correcto"); else $error("Fallo el Restador");
		#10;
		Control = 2'b10; A = 4'b0110; B = 4'b0010; 
		#10;
		assert (Result === 4'b0010) $display("Correcto"); else $error("Fallo el Restador");
		#10;
		
		$display("Testbench para OR");
		Control = 2'b11; A = 4'b0001; B = 4'b1110;
		#10
		assert (Result === 4'b1111) $display("Correcto"); else $error("Fallo la OR");
		#10;
		Control = 2'b11; A = 4'b1001; B = 4'b0101; 
		#10
		assert (Result === 4'b1101) $display("Correcto"); else $error("Fallo la OR");
		#10;
		Control = 2'b11; A = 4'b0111; B = 4'b0100;
		#10
		assert (Result === 4'b0111) $display("Correcto"); else $error("Fallo la OR");
		#10;
		Control = 2'b11; A = 4'b0011; B = 4'b0011; 
		#10
		assert (Result === 4'b0011) $display("Correcto"); else $error("Fallo la OR");
		#10;
		/*
		$display("Testbench para NOT");
		Control = 3'b100; A = 4'b0001;
		#10
		assert (Result === 4'b1110) $display("Correcto"); else $error("Fallo la NOT");
		#10;
		Control = 3'b100; A = 4'b1001; 
		#10
		assert (Result === 4'b0110) $display("Correcto"); else $error("Fallo la NOT");
		#10;
		Control = 3'b100; A = 4'b0111;
		#10
		assert (Result === 4'b1000) $display("Correcto"); else $error("Fallo la NOT");
		#10;
		Control = 3'b100; A = 4'b0011;
		#10
		assert (Result === 4'b1100) $display("Correcto"); else $error("Fallo la NOT");
		#10;
		
		$display("Testbench para XOR");
		Control = 3'b101; A = 4'b0001; B = 4'b1110;
		#10
		assert (Result === 4'b1111) $display("Correcto"); else $error("Fallo la XOR");
		#10;
		Control = 3'b101; A = 4'b1001; B = 4'b0101; 
		#10
		assert (Result === 4'b1100) $display("Correcto"); else $error("Fallo la XOR");
		#10;
		Control = 3'b101; A = 4'b0111; B = 4'b0100;
		#10
		assert (Result === 4'b0011) $display("Correcto"); else $error("Fallo la XOR");
		#10;
		Control = 3'b101; A = 4'b0011; B = 4'b0011; 
		#10
		assert (Result === 4'b0000) $display("Correcto"); else $error("Fallo la XOR");
		#10;
		
		$display("Testbench para shift a la derecha");
		Control = 3'b110; A=4'b1001; B=4'b0011;
		#10;
		assert (Result === 4'b0001) $display("Corrimiento Correcto"); else $error("Fallo Corrimiento.");
		#10;
		Control = 3'b110; A=4'b1111; B=4'b0010;
		#10;
		assert (Result === 4'b0011) $display("Corrimiento Correcto"); else $error("Fallo Corrimiento.");
		#10;
		Control = 3'b110; A=4'b0001; B=4'b0001;
		#10;
		assert (Result === 4'b0000) $display("Corrimiento Correcto"); else $error("Fallo Corrimiento.");
		#10;
		Control = 3'b110; A=4'b1101; B=4'b0010;
		#10;
		assert (Result === 4'b0011) $display("Corrimiento Correcto"); else $error("Fallo Corrimiento.");
		#10;
		
		$display("Testbench para shift a la izquierda");
		Control = 3'b111; A=4'b1001; B=4'b0011;
		#10;
		assert (Result === 4'b1000) $display("Corrimiento Correcto"); else $error("Fallo Corrimiento.");
		#10;
		Control = 3'b111; A=4'b1111; B=4'b0010;
		#10;
		assert (Result === 4'b1100) $display("Corrimiento Correcto"); else $error("Fallo Corrimiento.");
		#10;
		Control = 3'b111; A=4'b0001; B=4'b0001;
		#10;
		assert (Result === 4'b0010) $display("Corrimiento Correcto"); else $error("Fallo Corrimiento.");
		#10;
		Control = 3'b111; A=4'b1101; B=4'b0010;
		#10;
		assert (Result === 4'b0100) $display("Corrimiento Correcto"); else $error("Fallo Corrimiento.");
		#10;*/
		
	end

endmodule 