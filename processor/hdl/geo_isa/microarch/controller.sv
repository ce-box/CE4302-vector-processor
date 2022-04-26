module controller(  
    input  logic            clk, reset,
    input  logic [31:12]    InstrD,
    input  logic [3:0]      ALUFlagsE,
    output logic [1:0]      RegSrcD, ImmSrcD,
    output logic            ALUSrcE, BranchE, BranchTakenE,
    output logic [2:0]      ALUControlE,
    output logic            MemWriteM,
    output logic            MemtoRegW, PCSrcW, RegWriteW,
    // hazard
    output logic            RegWriteM, MemtoRegE,
    output logic            PCWrPendingF,
    input  logic            FlushE
);

    // InstrD
    // ------------------------------------------------
    // [31:28] cond
    // [27:24] opcode -> [27:26] op, [25] I, [24] S
    // [23:20] instr
    // [19:16] rd

    logic [9:0] controlsD;
    logic       CondExE, ALUOpD;
    logic [2:0] ALUControlD;
    logic       ALUSrcD;
    logic       MemtoRegD, MemtoRegM; 
    logic       RegWriteD, RegWriteE, RegWriteGatedE;
    logic       MemWriteD, MemWriteE, MemWriteGatedE;
    logic       BranchD;
    logic [1:0] FlagWriteD, FlagWriteE; 
    logic       PCSrcD, PCSrcE, PCSrcM; 
    logic [3:0] FlagsE, FlagsNextE, CondE;

    //  Decode stage (op)
    always_comb
        casex (InstrD[27:26])
            2'b00:  if (InstrD[25]) controlsD = 10'b0000101001; // DP imm 
                    else            controlsD = 10'b0000001001; // DP reg 
            2'b01:  if (InstrD[24]) controlsD = 10'b0001111000; // LDR 
                    else            controlsD = 10'b0001110100; // STR 
            2'b10:                  controlsD = 10'b0110100010; // B 
            default:                controlsD = 10'bx;          // unimplemented 
        endcase
    
    assign {RegSrcD, ImmSrcD, ALUSrcD, MemtoRegD, RegWriteD, MemWriteD, BranchD, ALUOpD} = controlsD;

    always_comb 
        if (ALUOpD) begin // which Data-processing Instr? 
            case(InstrD[23:20]) 
                4'b0000: ALUControlD  = 3'b000; // ADD (0) 
                4'b0001: ALUControlD  = 3'b001; // SUB (1)
                4'b0010: ALUControlD  = 3'b101; // MUL (2)
                4'b0011: ALUControlD  = 3'b010; // AND (3)
                4'b0100: ALUControlD  = 3'b011; // ORR (4)
                4'b0101: if (InstrD[25]) ALUControlD = 3'b100; // MOV (5)
                         else ALUControlD = 3'b011;            // ROR
                4'b0110: ALUControlD  = 3'b001; // CMP (6)

                default: ALUControlD = 3'bx;  // unimplemented
            endcase 
            FlagWriteD[1] = InstrD[24]; // update N and Z Flags if S bit is set 
            FlagWriteD[0] = InstrD[24] & (ALUControlD == 3'b000 | ALUControlD == 3'b001); 
        end 
        else begin 
            ALUControlD = 3'b000; // perform addition for nondataprocessing instr 
            FlagWriteD = 2'b00;  // don't update Flags 
        end

    assign PCSrcD = (((InstrD[19:16] == 4'b1111) & RegWriteD) | BranchD); // rd

    // Ojo con esto, está haciendo acá los registros que llevan toda la lógica

    // Execute stage
    floprc #(7) flushedregsE(clk, reset, FlushE,
        {FlagWriteD, BranchD, MemWriteD, RegWriteD, PCSrcD, MemtoRegD},
        {FlagWriteE, BranchE, MemWriteE, RegWriteE, PCSrcE, MemtoRegE});
    
    flopr #(4) regsE(clk, reset,
        {ALUSrcD, ALUControlD},
        {ALUSrcE, ALUControlE});

    flopr #(4) condregE(clk, reset, InstrD[31:28], CondE); 
    flopr #(4) flagsreg(clk, reset, FlagsNextE, FlagsE);

    // write and Branch controls are conditional
    conditional Cond(CondE, FlagsE, ALUFlagsE, FlagWriteE, CondExE, FlagsNextE);

    assign BranchTakenE = BranchE & CondExE;
    assign RegWriteGatedE = RegWriteE & CondExE;
    assign MemWriteGatedE = MemWriteE & CondExE;
    assign PCSrcGatedE = PCSrcE & CondExE;

    // Memory stage
    flopr #(4) regsM(clk, reset,
        {MemWriteGatedE, MemtoRegE, RegWriteGatedE, PCSrcGatedE},
        {MemWriteM, MemtoRegM, RegWriteM, PCSrcM});

    // Writeback stage
    flopr #(3) regsW(clk, reset,
        {MemtoRegM, RegWriteM, PCSrcM},
        {MemtoRegW, RegWriteW, PCSrcW});

    // Hazard Prediction
    assign  PCWrPendingF = PCSrcD | PCSrcE | PCSrcM;

endmodule