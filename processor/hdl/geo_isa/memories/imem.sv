module imem(input  logic  [31:0]    address,
            output logic  [31:0]    data_out);

    logic [31:0] mem[1024:0]; //  64 32-bit array

    initial begin
        $readmemh("instructions_file.mem",mem);
    end

    assign data_out = mem[address[22:2]]; // word aligned

endmodule