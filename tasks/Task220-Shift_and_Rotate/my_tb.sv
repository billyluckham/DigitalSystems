module my_tb;

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
$display("Hey Rotate left");
	$display("X = %b", X);
	for (n=0; n<=8; n++)
	begin
		#10ps;
		X = Y;
		$display("X = %b", X);
	end

DIR = 1;
$display("Hey Rotate right");
	for (n=0; n<=8; n++)
	begin
		#10ps;
		X = Y;
		$display("X = %b", X);
	end

end
endmodule