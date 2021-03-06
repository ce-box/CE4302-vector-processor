`timescale 1 ps / 1 ps

module testbench_Pipeline();



logic clk, clkVga;
logic reset, V_SyncOut, H_SyncOut, and_enable, Stuck, go,clock_vga,vga_sync;
logic [25:0] InstrD; 
logic [25:0] InstrDV; 
logic [31:0]ALUResultEA, ALUResultM, ResultW,WriteDataM,VGAData;
logic [7:0] RedOut, GreenOut, BlueOut;
logic visible;
integer f, count;

Pipeline_SIMD dut(	clk, reset, go, clkVga,
						InstrD, InstrDV, ALUResultEA, ALUResultM, ResultW,WriteDataM);
						//V_SyncOut, H_SyncOut, and_enable, Stuck,vga_sync,
						//RedOut, GreenOut, BlueOut, visible);

// initialize test
initial

	begin
		reset <= 1; # 10; reset <= 0;
		clkVga = 0;
		f = $fopen("output.txt","w");
		count = 0;
		forever begin
			#10 clkVga = ~clkVga;
			if (visible == 1) begin
				count = count + 1;
				if (count == 4) begin
					$fwrite(f,"VGA CLK %b\n",clkVga);
					$fwrite(f,"HSYNC %b\n",H_SyncOut);
					$fwrite(f,"VSYNC %b\n",V_SyncOut);
					$fwrite(f,"R %b\n",RedOut);
					$fwrite(f,"G %b\n",GreenOut);
					$fwrite(f,"B %b\n",BlueOut);
					count = 0;
				end
			end
		end
	end
// generate clock to sequence tests

	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;

	end
	
	always@(negedge clk)
	begin
		$display("InstrD=%h,   InstrDV=%h", InstrD, InstrDV);
	end
	
	
	

endmodule
