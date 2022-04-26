module alu(
    input  logic [31:0] a,b,
    input  logic [2:0]  ALUControl,
    output logic [31:0] Result,
    output logic [3:0]  Flags
);

    logic neg, zero, carry, overflow;
    logic [31:0] condinvb;
    logic [32:0] sum;

    assign condinvb = ALUControl[0] ? ~b : b;
    assign sum = a + condinvb + ALUControl[0];

    always@(*)
        case (ALUControl)
            3'b000: Result = sum;
			3'b001: Result = sum;
            3'b010: Result = a & b;
            3'b011: Result = a | b;
            3'b100: Result = a ^ b;
            3'b101: Result = a * b; // TODO: Asignar el overflow
        endcase

    assign neg = Result[31];
    assign zero = (Result == 32'b0);
    assign carry = (ALUControl[1] == 1'b0) & sum[32];
    assign overflow = (ALUControl[1] == 1'b0) & ~(a[31] ^ b[31] ^ ALUControl[0]) & (a[31] ^ sum[31]);

    assign Flags = {neg, zero, carry, overflow};
endmodule