// Example of generate for to replicate hardware
module invN #(parameter N=4) (output logic[N-1:0] Y, input logic[N-1:0] X);

//An integer that will never be represented in the final synthesis
genvar i;
genvar j;

generate 
 for (i=0; i<N; i=i+2) 
 begin : i_loop1
	not ui (Y[i], X[i]);
 end
 
 for (j=1; j<N; j=j+2) 
 begin : j_loop1
	assign Y[j] = X[j];
 end
endgenerate

endmodule



