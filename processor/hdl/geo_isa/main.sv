module main(
    input logic clk, reset
);

    logic [31:0] WriteData, DataAdr;
    logic        MemWrite;

    top cpu(
        clk,
        reset,
        WriteData,
        DataAdr,
        MemWrite
    );


endmodule