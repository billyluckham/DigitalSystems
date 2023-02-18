module my_jkff (output logic Q, input logic J, K, CLK);

//D-Type Flip-Flop (without asynchronous reset)
always_ff @(negedge CLK) begin

//If J is HIGH and K is LOW, then Q latches HIGH
	if({J,K} == 2'b10) begin
		Q <= 1'b1;
	end
//If J is LOW and K is HIGH, then Q latches LOW
	if({J,K} == 2'b01) begin
		Q <= 1'b0;
	end

//If J is HIGH and K is HIGH, then Q toggles (flips state)
	if({J,K} == 2'b11) begin
		Q <= ~Q;
	end

//If J is LOW and K is LOW, then Q simply latches.

/*
	case ({J,K})

		2'b10: Q <= 1'b1; 	//If J is HIGH and K is LOW, then Q latches HIGH
		2'b01: Q <= 1'b0; 	//If J is LOW and K is HIGH, then Q latches LOW
		2'b11: Q <= ~Q;   	//If J is HIGH and K is HIGH, then Q toggles (flips state)
		//00 not stated but latches output, Q = current state.
	
	endcase
*/
end
endmodule 
	

