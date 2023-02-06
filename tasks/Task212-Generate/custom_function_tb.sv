module custom_function_tb;

logic A, B, Y1, Y2, Y3;
reg [1:0] f;

custom_function #(.f(0)) u0(Y1, A, B);
custom_function #(.f(1)) u1(Y2, A, B);
custom_function #(.f(2)) u2(Y3, A, B);



initial
begin

	// WRITE YOUR CODE HERE
f = 0;
#50ps assert (u0==0) $display("Y = A & B %b", mt); else $error("fail %b", mt); 

f = 1;
#50ps assert (u1==1) $display("Y = A | B %b", mt); else $error("fail %b", mt); 

f = 2;
#50ps assert (u2==2) $display("Y = A ^ B %b", mt); else $error("fail %b", mt); 

end

endmodule
