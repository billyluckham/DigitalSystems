module my_srgate_tb;

// Input and Output signals
  logic n_reset, S, R, Q, Qbar;
	
  // Instantiate the design under test (DUT)
  srgate dut (.n_reset(n_reset), .S(S), .R(R), .Q(Q), .Qbar(Qbar));

 initial begin

	//n_reset now set low, nothing happens
    	//Inputs 0 initial state
	n_reset = 0;
/*
    	{S,R} = 2'bxx;
    	#10ps; 
    	assert ((Q==1'bx) && (Qbar==1'bx)) $display("Pass: Q = %b, Qbar = %b, S = %b, R = %b", Q, Qbar, S, R); 
    	else $error("Error");
*/
	//Initial condition both set to zero
	{S,R} = 2'b00;
    	#10ps; 
   	assert ((Q==1'b0) && (Qbar==1'b0)) $display("Pass: Q = %b, Qbar = %b, S = %b, R = %b", Q, Qbar, S, R); 
   	else $error("Error");

	//Try to set latch, nothing happens because n_reset is 0
	{S,R} = 2'b10;
    	#10ps; 
   	assert ((Q==1'b0) && (Qbar==1'b0)) $display("Pass: Q = %b, Qbar = %b, S = %b, R = %b", Q, Qbar, S, R); 
   	else $error("Error");
	
	//Clear latch
	{S,R} = 2'b00;
    	#10ps; 
   	assert ((Q==1'b0) && (Qbar==1'b0)) $display("Pass: Q = %b, Qbar = %b, S = %b, R = %b", Q, Qbar, S, R); 
   	else $error("Error");

	//Now set n_reset to 1 to enable latch
	n_reset = 1;

	//Initial condition both set to zero
	{S,R} = 2'b00;
    	#10ps; 
   	assert ((Q==1'b0) && (Qbar==1'b0)) $display("Pass: Q = %b, Qbar = %b, S = %b, R = %b", Q, Qbar, S, R); 
   	else $error("Error");

	//Set latch
	{S,R} = 2'b10;
    	#10ps; 
   	assert ((Q==1'b1) && (Qbar==1'b0)) $display("Pass: Q = %b, Qbar = %b, S = %b, R = %b", Q, Qbar, S, R); 
   	else $error("Error");

	//Clear bit, output latched latched high
	{S,R} = 2'b00;
    	#10ps; 
   	assert ((Q==1'b1) && (Qbar==1'b0)) $display("Pass: Q = %b, Qbar = %b, S = %b, R = %b", Q, Qbar, S, R); 
   	else $error("Error");

	//Reset latch, output goes low
	{S,R} = 2'b01;
    	#10ps; 
   	assert ((Q==1'b0) && (Qbar==1'b1)) $display("Pass: Q = %b, Qbar = %b, S = %b, R = %b", Q, Qbar, S, R); 
   	else $error("Error");

	{S,R} = 2'b00;
    	#10ps; 
   	assert ((Q==1'b0) && (Qbar==1'b1)) $display("Pass: Q = %b, Qbar = %b, S = %b, R = %b", Q, Qbar, S, R); 
   	else $error("Error");

	//Test illegal condition

	{S,R} = 2'b11;
    	#10ps;
	assert ((Q === 1'bz) && (Qbar === 1'bz)) $display("Pass: Q = %b, Qbar = %b, S = %b, R = %b", Q, Qbar, S, R); 
	else $error("Error");

end
endmodule