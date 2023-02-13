module my_mul_tb;

parameter N = 4;

//These are unsigned by default
logic [2*N - 1 : 0] Y;
logic [N-1:0] A, B;

//Connect the multiplier
mul m1(Y,A,B);

initial
begin
	//Write test code here
	#10ps
	{A,B} = 2'b00;
	assert (Y==0) $display("Pass: A = %d, B = %d, Y = %d", A,B,Y); $else("Wrong");
	
	#10ps
	{A,B} = 2'b1111;
	assert (Y==1) $display("Pass: A = %d, B = %d, Y = %d", A,B,Y); $else("Wrong: %b");
end

endmodule