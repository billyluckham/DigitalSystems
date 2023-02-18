module my_jkff_tb;

logic J, K, Q;
logic CLK = 0;

my_jkff dut (Q, J, K, CLK);

//Generate 20 clock cycles
initial begin
	CLK=0;
     	repeat(28) 
	#10ps CLK = ~CLK;  
end 

initial begin

	{J,K} = 2'b00;
	@(posedge CLK);
	@(negedge CLK);

	//If J is HIGH and K is LOW, then Q latches HIGH
	@(posedge CLK);
	{J,K} = 2'b10;
	@(negedge CLK);
	#1 assert(Q == 1) $display("PASS: Q = %b", Q); else $error("FAIL");	//Check Q

	//Latches output
	@(posedge CLK);
	{J,K} = 2'b00;
	@(negedge CLK);
	
	//If J is LOW and K is HIGH, then Q latches LOW
	@(posedge CLK);
	{J,K} = 2'b01;
	@(negedge CLK);
	#1 assert(Q == 0) $display("PASS: Q = %b", Q); else $error("FAIL");	//Check Q

	//Latches output
	@(posedge CLK);
	{J,K} = 2'b00;
	@(negedge CLK);
	$display("Q = %b", Q);

	//Toggle Q
	@(posedge CLK);
	{J,K} = 2'b11;
	@(negedge CLK);
	#1 assert(Q == 1) $display("PASS: Q = %b", Q); else $error("FAIL: Q = %b", Q);	//Check Q
	@(posedge CLK);
	@(negedge CLK);
	#1 assert(Q == 0) $display("PASS: Q = %b", Q); else $error("FAIL: Q = %b", Q);	//Check Q
	

	// Latches output
	@(posedge CLK);
	{J,K} = 2'b00;
	@(negedge CLK);	

	//Toggle Q
	@(posedge CLK);
	{J,K} = 2'b11;
	@(negedge CLK);
	#1 assert(Q == 1) $display("PASS: Q = %b", Q); else $error("FAIL: Q = %b", Q);	//Check Q
	@(posedge CLK);
	@(negedge CLK);
	
end
endmodule




