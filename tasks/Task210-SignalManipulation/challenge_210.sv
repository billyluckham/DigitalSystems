module challenge_210 (output wire Y, input wire A, input wire B, input wire C);

//internal wires
wire term0;
wire term1;
wire term2;
wire term3;

//Wire logic
assign term0 = ~A & B & ~C;
assign term1 = ~A & B & C;
assign term2 = A & ~B & ~C;
assign term3 = A & ~B & C;

assign Y = term0 | term1 | term2 | term3;

endmodule