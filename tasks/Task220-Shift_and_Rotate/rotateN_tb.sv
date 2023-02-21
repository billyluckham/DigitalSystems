module rotateN_tb;

//8'b10101100
//rotate it forwards 8 times, then backwards 8 times

parameter N = 8;
logic [N-1:0] X,Y;
logic DIR;
int n;
rotateN #(.N(N)) u1(Y,X,DIR);

initial
begin

X = 8'b10101100; 
DIR = 0;

	$display("X = %b", X);
	for (n=0; n<=8; n++)
	begin
		$display("Hey Rotate left");
		#10ps;
		X = Y;
		$display("X = %b", X);
	end

DIR = 1;
	for (n=0; n<=8; n++)
	begin
		$display("Hey Rotate right");
		#10ps;
		X = Y;
		$display("X = %b", X);
	end

end
endmodule
