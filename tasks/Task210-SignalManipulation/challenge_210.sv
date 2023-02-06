module challenge_210 (output wire Y, input wire A, input wire B, input wire C);

//internal wires
wire term0;
wire term1;
wire term2;
wire term3;

assign term0 = B;
assign term1 = B & C;
assign term2 = A;
assign term3 = A & C;
assign Y = term0 | term1 | term2 | term3;

endmodule