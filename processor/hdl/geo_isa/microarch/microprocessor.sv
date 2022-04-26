module microprocessor(
    input  logic        clk, reset,
    output logic [31:0] PCF, 
    input  logic [31:0] InstrF, 
    output logic        MemWriteM, 
    output logic [31:0] ALUOutM, WriteDataM, 
    input  logic [31:0] ReadDataM
);

    logic [1:0] RegSrcD, ImmSrcD;
    logic [2:0] ALUControlE; 
    logic ALUSrcE, BranchE, BranchTakenE, MemtoRegW, PCSrcW, RegWriteW; 
    logic [3:0] ALUFlagsE; 
    logic [31:0] InstrD; 
    logic RegWriteM, MemtoRegE, PCWrPendingF; 
    logic [1:0] ForwardAE, ForwardBE; 
    logic StallF, StallD, FlushD, FlushE; 
    logic Match_1E_M, Match_1E_W, Match_2E_M, Match_2E_W, Match_12D_E;

    controller controller(clk, reset, InstrD[31:12], ALUFlagsE,
                RegSrcD, ImmSrcD,
                ALUSrcE, BranchE, BranchTakenE, ALUControlE, 
                MemWriteM,
                MemtoRegW, PCSrcW, RegWriteW, 
                RegWriteM, MemtoRegE, PCWrPendingF, 
                FlushE);

    datapath datapath(clk, reset, 
                RegSrcD, ImmSrcD, 
                ALUSrcE, BranchE, BranchTakenE, ALUControlE, 
                MemtoRegW, PCSrcW, RegWriteW, 
                PCF, InstrF, InstrD, 
                ALUOutM, WriteDataM, ReadDataM, 
                ALUFlagsE, 
                Match_1E_M, Match_1E_W, Match_2E_M, Match_2E_W, Match_12D_E, 
                ForwardAE, ForwardBE, StallF, StallD, FlushD);

    hazard   hazard(clk, reset,
                Match_1E_M, Match_1E_W, Match_2E_M, Match_2E_W, Match_12D_E, 
                RegWriteM, RegWriteW, BranchTakenE, MemtoRegE, 
                PCWrPendingF, PCSrcW, 
                ForwardAE, ForwardBE, 
                StallF, StallD, FlushD, FlushE);

endmodule