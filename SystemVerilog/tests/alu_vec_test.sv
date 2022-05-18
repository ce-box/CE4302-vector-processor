module alu_vec_test ();

logic [3 : 0] v1A, v1B, v1C, v1D, v1E, v1F, v1G, v1H;
logic [3 : 0] v2A, v2B, v2C, v2D, v2E, v2F, v2G, v2H;
logic [1 : 0] selec;
logic [3 : 0] out1, out2, out3, out4, out5, out6, out7, out8;

ALU_Vec #(4) ALU (
    v1A, v1B, v1C, v1D, v1E, v1F, v1G, v1H,
    v2A, v2B, v2C, v2D, v2E, v2F, v2G, v2H,
    selec,
    out1, out2, out3, out4, out5, out6, out7, out8);

initial 
	begin
	
		$display("Testbench para Sumador Vectorial");
        v1A = 4'b0010; v1B = 4'b0010; v1C = 4'b0010; v1D = 4'b0010; v1E = 4'b0010; v1F = 4'b0010; v1G = 4'b0010; v1H = 4'b0010;
        v2A = 4'b0001; v2B = 4'b0001; v2C = 4'b0001; v2D = 4'b0001; v2E = 4'b0001; v2F = 4'b0001; v2G = 4'b0001; v2H = 4'b0001;
        selec = 2'b00;

		#10
		assert (out1 === 4'b0011) $display("Correcto"); else $error("000 failed.");
        assert (out2 === 4'b0011) $display("Correcto"); else $error("000 failed.");
        assert (out3 === 4'b0011) $display("Correcto"); else $error("000 failed.");
        assert (out4 === 4'b0011) $display("Correcto"); else $error("000 failed.");
        assert (out5 === 4'b0011) $display("Correcto"); else $error("000 failed.");
        assert (out6 === 4'b0011) $display("Correcto"); else $error("000 failed.");
        assert (out7 === 4'b0011) $display("Correcto"); else $error("000 failed.");
        assert (out8 === 4'b0011) $display("Correcto"); else $error("000 failed.");
		
		#10;
		
		$display("Testbench para Multiplicador Vectorial");
        v1A = 4'b0010; v1B = 4'b0010; v1C = 4'b0010; v1D = 4'b0010; v1E = 4'b0010; v1F = 4'b0010; v1G = 4'b0010; v1H = 4'b0010;
        v2A = 4'b0001; v2B = 4'b0001; v2C = 4'b0001; v2D = 4'b0001; v2E = 4'b0001; v2F = 4'b0001; v2G = 4'b0001; v2H = 4'b0001;
        selec = 2'b01;

		#10
		assert (out1 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out2 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out3 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out4 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out5 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out6 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out7 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out8 === 4'b0010) $display("Correcto"); else $error("000 failed.");
		
		#10;

        $display("Testbench para Restador Vectorial");
        v1A = 4'b0010; v1B = 4'b0010; v1C = 4'b0010; v1D = 4'b0010; v1E = 4'b0010; v1F = 4'b0010; v1G = 4'b0010; v1H = 4'b0010;
        v2A = 4'b0001; v2B = 4'b0001; v2C = 4'b0001; v2D = 4'b0001; v2E = 4'b0001; v2F = 4'b0001; v2G = 4'b0001; v2H = 4'b0001;
        selec = 2'b10;

		#10
		assert (out1 === 4'b0001) $display("Correcto"); else $error("000 failed.");
        assert (out2 === 4'b0001) $display("Correcto"); else $error("000 failed.");
        assert (out3 === 4'b0001) $display("Correcto"); else $error("000 failed.");
        assert (out4 === 4'b0001) $display("Correcto"); else $error("000 failed.");
        assert (out5 === 4'b0001) $display("Correcto"); else $error("000 failed.");
        assert (out6 === 4'b0001) $display("Correcto"); else $error("000 failed.");
        assert (out7 === 4'b0001) $display("Correcto"); else $error("000 failed.");
        assert (out8 === 4'b0001) $display("Correcto"); else $error("000 failed.");
		
		#10;

         $display("Testbench para Divisor Vectorial");
        v1A = 4'b0010; v1B = 4'b0010; v1C = 4'b0010; v1D = 4'b0010; v1E = 4'b0010; v1F = 4'b0010; v1G = 4'b0010; v1H = 4'b0010;
        v2A = 4'b0001; v2B = 4'b0001; v2C = 4'b0001; v2D = 4'b0001; v2E = 4'b0001; v2F = 4'b0001; v2G = 4'b0001; v2H = 4'b0001;
        selec = 2'b11;

		#10
		assert (out1 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out2 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out3 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out4 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out5 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out6 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out7 === 4'b0010) $display("Correcto"); else $error("000 failed.");
        assert (out8 === 4'b0010) $display("Correcto"); else $error("000 failed.");
		
		#10;
		
	end

endmodule 