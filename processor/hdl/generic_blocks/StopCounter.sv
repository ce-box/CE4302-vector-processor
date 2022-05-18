module StopCounter (	input logic stop, go,
							output logic stopCont);


always_ff @(posedge stop or posedge go) begin

	if(go)begin
				stopCont <= 0;
		end

	else if (stop) stopCont <= 1;

end

endmodule 