module Memory (input logic clk, clock_img,
					input logic PCSrcM, RegWriteM, MemtoRegM, MemWriteM,
					input logic [31:0] ALUResultM, WriteDataM,
					input logic [2:0] WA3M,
					input logic [15:0] ImgAddr,
					input logic PCSrcMV, RegWriteMV, MemtoRegMV, MemWriteMV,
					input logic [255:0] ALUResultMV, WriteDataMV,
					input logic [2:0] WA3MV,
					input logic [15:0] ImgAddrV,
					output logic PCSrcW, RegWriteW, MemtoRegW,
					output logic [31:0] ReadDataW, ALUOutW, ALUOutM, ImgData,
					output logic [2:0] WA3W,
					output logic PCSrcWV, RegWriteWV, MemtoRegWV,
					output logic [255:0] ReadDataWV, ALUOutWV, ALUOutMV, ImgDataV,
					output logic [2:0] WA3WV);

	logic [31:0] MemOut;
	logic [255:0] MemOutV;
	
	logic wren_b;
	logic [31:0] data_b;
	assign wren_b = 0;
	assign data_b = 32'b0;
	
	logic wren_bV;
	logic [31:0] data_bV;
	assign wren_bV = 0;
	assign data_bV = 32'b0;
	
	logic [15:0] vecAddr, VectorAddr;
	logic [255:0] vector, VectorWrite;
	logic vecWrite;
	
	logic writeV;
	
	
	RAM memdatos (ALUResultM[15:0], ImgAddr, clk, clock_img, WriteDataM, data_b, MemWriteM, wren_b, MemOut, ImgData);
	
	VecGen vecG (clk, ALUResultM[15:0], MemOut, MemWriteM, vecAddr, vector, vecWrite);
	
	Mux2 #(256) vecMux (WriteDataMV, vector, vecWrite, VectorWrite);
	Mux2 #(16) vecAddres (ALUResultMV[15:0], vecAddr, vecWrite, VectorAddr);
	
	assign writeV = MemWriteMV || vecWrite;
	
	RamV memdatosV(VectorAddr, clk, VectorWrite, writeV, MemOutV);
	
	//registro de Mem-WB
	
	assign ALUOutM = ALUResultM;
	
	RegMW regmw(clk,
					PCSrcM, RegWriteM, MemtoRegM,
					MemOut, ALUResultM,
					WA3M,
					PCSrcW, RegWriteW, MemtoRegW,
					ReadDataW, ALUOutW,
					WA3W);
					
	assign ALUOutMV = ALUResultMV;
	
	RegMWV regmwV(clk,
					PCSrcMV, RegWriteMV, MemtoRegMV,
					MemOutV, ALUResultMV,
					WA3MV,
					PCSrcWV, RegWriteWV, MemtoRegWV,
					ReadDataWV, ALUOutWV,
					WA3WV);
					

endmodule 