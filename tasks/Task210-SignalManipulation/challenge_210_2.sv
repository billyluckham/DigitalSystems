module challenge_210_2 (output wire Y, input wire A, input wire B, input wire C);

//internal wires
wire term0;
wire term1;

//wire logic
assign term0 = ~A & B & ~C;
assign term1 = A & ~B & C;

assign Y = term0 | term1;

endmodule