module ALU #(parameter N = 32) (input logic [N-1 : 0] Op_A,
										 input logic [N-1 : 0] Op_B,
										 input logic [1:0] Control,
										 output logic [3:0] Flags, // Flag[0]=overflow, Flag[1]=carry, Flag[2]=cero, Flag[3]=negativo
										 output logic [N-1 : 0] Result);
	//sumador y restador reciclan el mismo circuito
	logic sum_cin;
	logic sum_cout;
	logic [N-1:0] temp_B;
	logic [N-1:0] sum_s;
	
	always_comb begin
		//Si se desea hacer una resta con el sumador
		if (Control[0] == 1)
		begin
			sum_cin = 1;
			temp_B = ~Op_B;
		end
		//Si se deasea hacer una suma con el sumador
		else
		begin
			sum_cin = 0;
			temp_B = Op_B;
		end
	end
	
	//Se instancia un solo sumador que puede ser usado para sumas o restas
	Sumador_Completo #(N) sumador(Op_A,temp_B,sum_cin,sum_s,sum_cout);
	
	//and
	logic [N-1:0] and_s;
	assign and_s = Op_A & Op_B;
	
	//or
	logic [N-1:0] or_s;
	assign or_s = Op_A | Op_B;
	
	
	
	//MUX para el resultado
	always_comb begin
	//case(Control)
		//suma
		if (Control == 2'b00)
		begin
			Result = sum_s;
		end
		//resta
		else if (Control == 2'b01)
		begin
			Result = sum_s;
		end
		//and
		else if (Control == 2'b10)
		begin
			Result = and_s;
		end
		//or
		else
		begin
			Result = or_s;
		end
	end
	
	//Calculo para el flag cero
	always_comb begin
		if (Result[N-2:0] == 0) Flags[2] = 1;
		else Flags[2] = 0;
	end
	
	//Calculo para el flag negativo
	assign Flags[3] = Result[N-1];
	
	//Detectar si la operacion es aritmetica
	logic arit_flag;
	
	always_comb begin
		if (Control == 2'b00)
		begin
			arit_flag = 1;
		end
		else if (Control == 2'b01)
		begin
			arit_flag = 1;
		end
		else
		begin
			arit_flag = 0;
		end
	end
	
	
	//Calculo para el flag de carry
	assign Flags[1] = arit_flag & sum_cout;
	
	
	//Calculo para el flag de overflow
	logic sign_check;
	logic A_B_check;
	
	assign sign_check = Op_A[N-1] ^ sum_s[N-1];
	assign A_B_check = Op_A[N-1] ^~ Op_B[N-1] ^ Control[0];
	assign Flags[0] = sign_check & A_B_check & arit_flag;
	
	
			 
endmodule
