module StopCounter_testbench();

logic stop, go, control;

StopCounter dut(stop,go,control);

initial
	begin
	
	stop = 1;
	#10;
	stop = 0;
	#10;
	go = 1;
	#10;
	go = 0;
	#10;
	stop = 1;
	#10;
	stop = 0;
	#10;
	go = 1;
	#10;
	go = 0;
	#10;
	
	end
endmodule 