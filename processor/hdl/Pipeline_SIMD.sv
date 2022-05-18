module Pipeline_SIMD (input logic clk50, reset, go, clk_vga,
							output logic [25:0] InstrD,
							output logic [25:0] InstrDV,
							output logic [31:0]	ALUResultEA, ALUResultM, ResultW, WriteDataM);


logic [31:0] ReadDataW, /*WriteDataM,*/ PCPlus8, ExtImmE, ALUOutM, ALUOutW, RD1E, RD2E, VGAData;
logic [2:0] RA1E, RA2E, ra1d, ra2d;
logic [3:0] FlagsD, FlagsE; 
logic [2:0] WA3E, WA3W, WA3M;
logic CondE;
logic [1:0] ForwardAE, ForwardBE, FlagWriteE;
logic [2:0] ALUControlE;
logic clk;

//Vector logic
logic [255:0]	ALUResultEAV, ALUResultMV, ResultWV, WriteDataMV;
logic [255:0] ReadDataWV; /*WriteDataM,*/ 
logic [255:0] ALUOutMV, ALUOutWV, RD1EV, RD2EV,ExtImmEV;
logic [31:0] VGADataV;
logic [2:0] RA1EV, RA2EV, ra1dV, ra2dV;
logic [3:0] FlagsDV, FlagsEV; 
logic [2:0] WA3EV, WA3WV, WA3MV;
logic CondEV;
logic [1:0] ForwardAEV, ForwardBEV, FlagWriteEV;
logic [2:0] ALUControlEV;
logic StuckV;

//Hard stop circuit

StopCounter stopcount (Stuck, go, StopCont);

assign clk = StopCont ? 0 : clk50;


Fetch fetch(clk, reset,
				ResultW, ALUResultEA,
				PCSrcW, BranchTakenE, ~StallF, ~StallD, FlushD,
				InstrD, InstrDV ,PCPlus8);

				
Decode decode(	clk, reset, RegWriteW, FlushE,
					FlagsD,
					InstrD, PCPlus8, ResultW, WA3W,
					RD1E, RD2E, ExtImmE,
					PCSrcD, PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,Stuck,
					ALUControlE, FlagWriteE, 
					CondE, FlagsE, WA3E, ra1d, ra2d, RA1E, RA2E);
					
					
DecodeV decodeV(	clk, reset, RegWriteWV, FlushEV,
					FlagsDV,
					InstrDV, PCPlus8, ResultWV, WA3WV,
					RD1EV, RD2EV, ExtImmEV,
					PCSrcDV, PCSrcEV, RegWriteEV, MemtoRegEV, MemWriteEV, BranchEV, ALUSrcEV,StuckV,
					ALUControlEV, FlagWriteEV, 
					CondEV, FlagsEV, WA3EV, ra1dV, ra2dV, RA1EV, RA2EV);


Execute execute(	clk, reset,
						RD1E, RD2E, ExtImmE, ResultW, ALUOutM,
						PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE,
						ALUControlE, FlagWriteE, ForwardAE, ForwardBE,
						CondE, FlagsE, WA3E,
						PCSrcM, RegWriteM, MemWriteM, MemtoRegM, BranchTakenE,
						ALUResultM, WriteDataM, ALUResultEA,
						WA3M, FlagsD);
						
ExecuteV executeV(	clk, reset,
						RD1EV, RD2EV, ExtImmEV, ResultWV, ALUOutMV,
						PCSrcEV, RegWriteEV, MemtoRegEV, MemWriteEV, BranchEV, ALUSrcEV,
						ALUControlEV, FlagWriteEV, ForwardAEV, ForwardBEV,
						CondEV, FlagsEV, WA3EV,
						PCSrcMV, RegWriteMV, MemWriteMV, MemtoRegMV, BranchTakenEV,
						ALUResultMV, WriteDataMV, ALUResultEAV,
						WA3MV, FlagsDV);
						

Memory memory(	clk, clock_vga,
					PCSrcM, RegWriteM, MemtoRegM, MemWriteM,
					ALUResultM, WriteDataM,
					WA3M,
					VGAArd,
					PCSrcMV, RegWriteMV, MemtoRegMV, MemWriteMV,
					ALUResultMV, WriteDataMV,
					WA3MV,
					VGAArdV,
					PCSrcW, RegWriteW, MemtoRegW,
					ReadDataW, ALUOutW, ALUOutM, VGAData,
					WA3W,
					PCSrcWV, RegWriteWV, MemtoRegWV,
					ReadDataWV, ALUOutWV, ALUOutMV, VGADataV,
					WA3WV); 


Mux2 # (32) mux_wb  (ALUOutW, ReadDataW, MemtoRegW, ResultW);

Mux2 # (256) mux_wbV  (ALUOutWV, ReadDataWV, MemtoRegWV, ResultWV);

Hazard_Unit hazard(	RA1E, RA2E, WA3M, WA3W, ra1d, ra2d, WA3E,
							RegWriteM, RegWriteW, MemtoRegE,
							PCSrcD,PCSrcE,PCSrcM,PCSrcW, BranchTakenE,
							ForwardAE, ForwardBE,
							StallF, StallD, FlushE, FlushD);
							
Hazard_Unit hazardV(	RA1EV, RA2EV, WA3MV, WA3WV, ra1dV, ra2dV, WA3EV,
							RegWriteMV, RegWriteWV, MemtoRegEV,
							PCSrcDV,PCSrcEV,PCSrcMV,PCSrcWV, BranchTakenEV,
							ForwardAEV, ForwardBEV,
							StallFV, StallDV, FlushEV, FlushDV);			
											
								
endmodule
