module counterN_tb;

// Add internal signals here
logic CLK, N_RESET;
logic [7:0] Y;

counterN_v2 u1 (Y, CLK, N_RESET);

//Reset
initial begin
   //Generate reset signal here
	
	N_RESET = '1;
	#1 N_RESET = '0;
	#1 N_RESET = '1;

end

//Clock
initial begin
   //Generate clock signal here
	CLK = 0;
	repeat(30)
	#10ps CLK = ~CLK;
end

//Input Stimulus
initial begin
	$display("Begin testing");
	
   //Write testbench here
	#10 $display("Test 1: Counter reset to 0");
	assert (Y == '0) else $error("Test 1 failed: Counter did not reset to 0");
	end
  
  // Test case 2: Count from 0 to 15
	initial begin
	#10 $display("Test 2: Count from 0 to 15");
	for (int i = 0; i < 16; i++) begin
		
		#1 $display("Y = %d", Y);
		@(posedge CLK);
		assert (Y == $unsigned(Y)) else $error("Test 2 failed: Counter value is negative");
		assert (Y <= 3'b111) else $error("Test 2 failed: Counter value exceeds maximum value");
		Y <= Y + 1;
		end

	

	end

	

endmodule