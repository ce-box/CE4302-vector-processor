module hazard(
    input  logic            clk, reset,
    input  logic            Match_1E_M, Match_1E_W,
    input  logic            Match_2E_M, Match_2E_W,
    input  logic            Match_12D_E,
    input  logic            RegWriteM, RegWriteW,
    input  logic            BranchTakenE, Mem2RegE,
    input  logic            PCWrPendingF, PCSrcW,
    output logic [1:0]      ForwardAE, ForwardBE,
    output logic            StallF, StallD,
    output logic            FlushD, FlushE
);

    logic ldrStallD;

    // Fordwarding logic
    always_comb 
        begin
            // Check for MUX A
            if (Match_1E_M & RegWriteM)         ForwardAE = 2'b10;
            else if (Match_1E_W & RegWriteW)    ForwardAE = 2'b01;
            else                                ForwardAE = 2'b00;

            // Checkfor MUX B
            if (Match_2E_M & RegWriteM)         ForwardBE = 2'b10;
            else if (Match_2E_W & RegWriteW)    ForwardBE = 2'b01;
            else                                ForwardBE = 2'b00;
        end

    // Stall logic
    assign ldrStallD = Match_12D_E & Mem2RegE;
    assign StallD = ldrStallD;
    assign StallF = ldrStallD | PCWrPendingF;

    // Flush logic
    assign FlushE = ldrStallD | BranchTakenE;
    assign FlushD = PCWrPendingF | PCSrcW | BranchTakenE;

endmodule