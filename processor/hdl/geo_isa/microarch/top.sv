module top(
    input  logic        clk, reset,
    output logic [31:0] WriteData, DataAdr,
    output logic        MemWrite
);

    logic [31:0] PCF, InstrF, ReadData;

    // Instance microprocessor and memories
    microprocessor cpu(
        clk,
        reset,
        PCF,
        InstrF,
        MemWrite,
        DataAdr,
        WriteData,
        ReadData
    );

    imem imem(
        PCF,
        InstrF
    );

    dmem ram(
        clk,
        MemWrite,
        DataAdr,
        WriteData,
        ReadData
    );

endmodule