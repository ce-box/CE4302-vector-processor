module dmem(
    input  logic        clk, we,
    input  logic [31:0] address,
    input  logic [31:0]  data_in,
    output logic [31:0]  data_out
	);

 
    //logic [7:0] image[65535:0]
    logic [31:0]  ram [65535:0]; // 64K
	 
    initial begin
        //$readmemh("image.mem",image,);
        $readmemh("rom.mem", ram,);
    end

    assign data_out = ram[address[22:2]];
	 
	
    // write
    always_ff @( posedge clk ) begin
        if (we) begin
				ram[address[22:2]] <= data_in;
		  end
	 end

endmodule