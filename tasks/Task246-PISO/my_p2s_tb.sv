module my_p2s_tb;

parameter N = 4;
logic SERIAL_OUT; 			//serial out is the Q value from the flip flip
logic CLK, n_Reset, EN; 
logic [N-1:0] DATAW;
//logic [1:0]SHIFT_REG; 		//serial reg is the Q value from the multiplexer
//assign SERIAL_OUT = SHIFT_REG[0];

  // Declare the module instance and its inputs and outputs
     my_parallel_to_serial dut (
    .CLK(CLK),
    .n_Reset(n_Reset),
    .DATAW(DATAW),
    .SERIAL_OUT(SERIAL_OUT),
	.EN(EN)
  );

  // Initialize the clock and reset signals
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  // Drive some sample inputs and check the serial output
  initial begin
	n_Reset = 0;
	EN = 0;
	#10 
	n_Reset = 1;
	EN = 1;

    DATAW = 4'b0000;
    #10;
    assert (SERIAL_OUT === 1'b0);

    DATAW = 4'b0001;
    #10;
    assert (SERIAL_OUT === 1'b1);

    DATAW = 4'b0100;
    #10;
    assert (SERIAL_OUT === 1'b0);

    DATAW = 4'b1111;
    #10;
    assert (SERIAL_OUT === 1'b1);

    $finish;
  end

endmodule
