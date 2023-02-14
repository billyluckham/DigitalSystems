module my_srgate_tb;
  
  // Input and Output signals
  logic S, R, Q, Qbar;

  // Instantiate the design under test (DUT)
  srgate dut ( .S(S), .R(R), .Q(Q), .Qbar(Qbar));
  
  initial 
  begin
    
    //Initial state before inputs
    #10ps 
    assert ((Q==1'bx) && (Qbar==1'bx)) $display("Pass: Q = %b, Qbar =%b S = %b, R = %b", Q, Qbar, S, R); 
    else $error("Error");


    //Inputs 0 initial state
    {S,R} = 2'b00;
    #10ps 
    assert ((Q==1'bx) && (Qbar==1'bx)) $display("Pass: Q = %b, Qbar = %b S = %b, R = %b", Q, Qbar, S, R); 
    else $error("Error");

    {S,R} = 2'b10;
    #10ps 
    assert (Q==1 && Qbar==0) $display("Pass: Q = %b, notQ = %b, S = %b, R = %b", Q, Qbar, S, R); 
    else $error("Error");

    //Latched High
    {S,R} = 2'b00;
    #10ps 
    assert (Q==1 && Qbar==0) $display("Pass: Q = %b, notQ = %b, S = %b, R = %b", Q, Qbar, S, R); 
    else $error("Error");

    {S,R} = 2'b01;
    #10ps 
    assert (Q==0 && Qbar==1) $display("Pass: Q = %b, notQ = %b, S = %b, R = %b", Q, Qbar, S, R); 
    else $error("Error");

    //Latched Low
    {S,R} = 2'b00;
    #10ps 
    assert (Q==0 && Qbar==1) $display("Pass: Q = %b, Qbar = %b, S = %b, R = %b", Q, Qbar, S, R); 
    else $error("Error");

    //Illegal condition
    {S,R} = 2'b11;
    #10ps 
    assert ((Q==1'bz) && (Qbar==1'bz)) $display("Pass: Q = %b, Qbar = %b S = %b, R = %b", Q, Qbar, S, R); 
    else $error("Error");

   end
endmodule
