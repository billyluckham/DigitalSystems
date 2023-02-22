module my_dff_tb;

logic CLK;
logic n_Reset, EN, D, Q;

//D type flip flip design under testing
d_ff dut(Q, D, CLK, n_Reset, EN); 

initial begin
	CLK = 0;
	repeat(60)
	#10ps CLK = ~CLK;
end

//Tests (synchronous - write on falling edge of the clock; read on rising)
initial begin
	//Initial Conditions, inputs set to zero
	n_Reset = 0;
	#10ps;
	n_Reset = 1;

	{EN, D} = 2'b00;
	@(posedge CLK);
	@(negedge CLK);
	
	//Nothing happens while EN is low
	@(posedge CLK);
	{EN, D} = 2'b01;
	@(negedge CLK);
	#1 assert(Q == 0) $display("PASS: Q = %b", Q); else $error("FAIL");	//Check Q

	//Nothing happens while D is low even though EN is high
	@(posedge CLK);
	{EN, D} = 2'b10;
	@(negedge CLK);
	#1 assert(Q == 0) $display("PASS: Q = %b", Q); else $error("FAIL");	//Check Q

	//Set EN and D high, output still low because of 10ps delay
	@(posedge CLK);
	{EN, D} = 2'b11;
	@(negedge CLK);
	#1 assert(Q == 0) $display("PASS: Q = %b", Q); else $error("FAIL");	//Check Q

	//Output high lags behind, D goes low Q to follow 	
	@(posedge CLK);
	{EN, D} = 2'b10;
	@(negedge CLK);
	#1 assert(Q == 1) $display("PASS: Q = %b", Q); else $error("FAIL");	//Check Q

	//Toggling Q: Output follows D previous low, waiting to go high next cycle
	@(posedge CLK);
	{EN, D} = 2'b11;
	@(negedge CLK);
	#1 assert(Q == 0) $display("PASS: Q = %b", Q); else $error("FAIL");	//Check Q
	
	//Output high, D low
	@(posedge CLK);
	{EN, D} = 2'b10;
	@(negedge CLK);
	#1 assert(Q == 1) $display("PASS: Q = %b", Q); else $error("FAIL");	//Check Q

	//Output low, D high
	@(posedge CLK);
	{EN, D} = 2'b11;
	@(negedge CLK);
	#1 assert(Q == 0) $display("PASS: Q = %b", Q); else $error("FAIL");	//Check Q
	
	//Output high, D unchanged high
	@(posedge CLK);
	@(negedge CLK);
	#1 assert(Q == 1) $display("PASS: Q = %b", Q); else $error("FAIL");	//Check Q

	n_Reset = 0;

	//Output is low regardless because n_Reset low
	@(posedge CLK);
	@(negedge CLK);
	#1 assert(Q == 0) $display("Reset PASS: Q = %b", Q); else $error("FAIL");	//Check Q

end
endmodule

