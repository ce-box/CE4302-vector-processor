module  top_geo_tb();

    logic        clk;
    logic        reset;
    logic [31:0] WriteData, DataAdr;
    logic        MemWrite;

    top cpu(
        clk,
        reset,
        WriteData,
        DataAdr,
        MemWrite
    );
	 
	 

    // Initialize test
	logic [31:0] i;

    // Initialize test
    initial begin

        // Test program
        reset <=1 ; #22; reset <= 0;

        for (i = 0; i < 500 ; i = i + 1) begin
           
            // generate clock to sequence tests
            clk =1; #5; clk = 0; #5;
				
        end
		  
        $stop;
    end
    
endmodule