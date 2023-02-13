module demux_tb;

  parameter N = 8;

  reg D;
  reg [2:0] SEL;
  wire [N-1:0] Y;

  demux u1 ( .D(D), .SEL(SEL), .Y(Y));

  initial 
  begin
    // test case 1: D = 0, SEL = ??? (don't care)
    D = 0;
    SEL = 3'b???;
    #10ps;
    assert(Y == 8'b00000000);
	$display("Pass: Y = %b, D = %b, SEL = %b", Y, D, SEL); // else $error("error: Y = %b, D = %b, SEL = %b", Y, D, SEL); 

    // test case 2: D = 0, SEL = 000
    D = 1;
    SEL = 3'b000;
    #10ps;
    assert(Y == 8'b00000001);
	$display("Pass: Y = %b, D = %b, SEL = %b", Y, D, SEL);// else $error("error: Y = %b, D = %b, SEL = %b", Y, D, SEL);

    // test case 3: D = 1, SEL = 001
    D = 1;
    SEL = 3'b001;
    #10ps;
    assert(Y == 8'b00000010);
	$display("Pass: Y = %b, D = %b, SEL = %b", Y, D, SEL);// else $error("error: Y = %b, D = %b, SEL = %b", Y, D, SEL);

    // test case 4: D = 1, SEL = 010
    D = 1;
    SEL = 3'b010;
    #10ps;
    assert(Y == 8'b00000100);
	$display("Pass: Y = %b, D = %b, SEL = %b", Y, D, SEL);// else $error("error: Y = %b, D = %b, SEL = %b", Y, D, SEL);

    // test case 5: D = 1, SEL = 011
    D = 1;
    SEL = 3'b011;
    #10ps;
    assert(Y == 8'b00001000);
	$display("Pass: Y = %b, D = %b, SEL = %b", Y, D, SEL);// else $error("error: Y = %b, D = %b, SEL = %b", Y, D, SEL);

    // test case 6: D = 1, SEL = 100
    D = 1;
    SEL = 3'b100;
    #10ps;
    assert(Y == 8'b00010000);
	$display("Pass: Y = %b, D = %b, SEL = %b", Y, D, SEL);// else $error("error: Y = %b, D = %b, SEL = %b", Y, D, SEL);

    // test case 7: D = 1, SEL = 101
    D = 1;
    SEL = 3'b101;
    #10ps;
    assert(Y == 8'b00100000);
	$display("Pass:Y = %b, D = %b, SEL = %b", Y, D, SEL);// else $error("error: Y = %b, D = %b, SEL = %b", Y, D, SEL);

    // test case 8: D = 1, SEL = 110
    D = 1;
    SEL = 3'b110;
    #10ps;
    assert(Y == 8'b01000000);
	$display("Pass: Y = %b, D = %b, SEL = %b", Y, D, SEL); //else $error("error: Y = %b, D = %b, SEL = %b", Y, D, SEL);

    // test case 9: D = 1, SEL = 111
    D = 1;
    SEL = 3'b111;
    #10ps;
    assert(Y == 8'b10000000);
	$display("Pass: Y = %b, D = %b, SEL = %b", Y, D, SEL);// else $error("error: Y = %b, D = %b, SEL = %b", Y, D, SEL);

  end
endmodule

