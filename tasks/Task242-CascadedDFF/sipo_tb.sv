module sipo_tb;

  // Define module inputs and outputs
 
	parameter N = 8;
	logic [N-1:0] q;
	logic D, clk, n_reset;

  // Instantiate the SIPO module
  sipo dut (
    .clk(clk),
    .n_reset(n_reset),
    .D(D),
    .q(q)
  );

  // Define clock and reset signals
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    n_reset = 0;
    #10 n_reset = 1;
  end

  // Test stimulus
  initial begin
    // Initialize input data
    D = 1'b0;
    
    // Wait for a few clock cycles
    #20;
    
    // Test case 1: Shift in 0b1011
    D = 1'b1;
    #5 D = 1'b0;
    #5 D = 1'b1;
    #5 D = 1'b1;
    #5 D = 1'b0;
    #5;
    
    // Test case 2: Shift in 0b0101
    D = 1'b0;
    #5 D = 1'b1;
    #5 D = 1'b0;
    #5 D = 1'b1;
    #5 D = 1'b0;
    #5;
    
    // Test case 3: Shift in all 1s
    D = 1'b1;
    #5 D = 1'b1;
    #5 D = 1'b1;
    #5 D = 1'b1;
    #5 D = 1'b1;
    #5;
    
    // Test case 4: Shift in all 0s
    D = 1'b0;
    #5 D = 1'b0;
    #5 D = 1'b0;
    #5 D = 1'b0;
    #5 D = 1'b0;
    #5;
    
    // End of test
    $finish;
  end

  // Monitor output data
  always @(posedge clk) begin
    $display("q = %b", q);
  end

endmodule
