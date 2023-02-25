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
	repeat(50)
	#10ps CLK = ~CLK;
end

// Define a task to check the output 'Q' against the expected value 'Q_expected'
  task check(logic [3:0] Y_expected);
    	for(int i=0; i<16; i++) begin
		assert (Y == Y_expected) $display ("Y = %d", Y_expected); 
		else $error("Output Mismatch: Expected %d but got %d", Y_expected, Y);
		Y_expected <= Y_expected +1;
		@(posedge CLK);
		end
  endtask

// Test sequence
  initial begin
    // Test case 1: Counter starts at 0, counts up to 16
	$display("This works");
	@(posedge CLK);
	check(4'b0000);

	@(posedge CLK);
	check(4'b0001);

	@(posedge CLK);
	check(4'b0010);
	
	@(posedge CLK);
	check(4'b0011);

	@(posedge CLK);
	check(4'b0100);

	@(posedge CLK);
	check(4'b0101);

	@(posedge CLK);
	check(4'b0110);

	@(posedge CLK);
	check(4'b0111);

	@(posedge CLK);
	check(4'b0000);

	@(posedge CLK);
	check(4'b1000);

	@(posedge CLK);
	check(4'b1001);

	@(posedge CLK);
	check(4'b1010);

	@(posedge CLK);
	check(4'b1011);

	@(posedge CLK);
	check(4'b1100);

	@(posedge CLK);
	check(4'b1101);

	@(posedge CLK);
	check(4'b1110);

	@(posedge CLK);
	check(4'b1111);
	
	
  end

/*
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

	*/

endmodule