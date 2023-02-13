module challenge_210_tb;

//internal wires
reg aa;
reg bb;
reg cc;
reg yy;

reg [2:0] mt; 

challenge_210 u1 (yy, aa, bb, cc);

initial
begin 
	assign {aa, bb, cc} = mt;

	mt = 0;
	#50ps assert (yy==0) $display("Passed %b", mt); else $error("FAIL %b", mt);

	mt = 1;
	#50ps assert (yy==0) $display("Passed %b", mt); else $error("FAIL %b", mt);
	
	mt = 2;
	#50ps assert (yy==1) $display("Passed %b", mt); else $error("FAIL %b", mt);
	
	mt = 3;
	#50ps assert (yy==1) $display("Passed %b", mt); else $error("FAIL %b", mt);
	
	mt = 4;
	#50ps assert (yy==1) $display("Passed %b", mt); else $error("FAIL %b", mt);
	
	mt = 5;
	#50ps assert (yy==1) $display("Passed %b", mt); else $error("FAIL %b", mt);
	
	mt = 6;
	#50ps assert (yy==0) $display("Passed %b", mt); else $error("FAIL %b", mt);
	
	mt = 7;
	#50ps assert (yy==0) $display("Passed %b", mt); else $error("FAIL %b", mt);

end
endmodule