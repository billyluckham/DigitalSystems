module my_parallel_to_serial#(parameter N = 4)
	(output logic SERIAL_OUT, 				//serial out is the Q value from the flip flip
	input logic CLK, n_Reset, EN, SHIFT, logic [N-1:0] DATAW);

logic [1:0]SHIFT_REG; 					//serial reg is the Q value from the multiplexer
assign SERIAL_OUT = SHIFT_REG[0];


always_ff @(posedge CLK, negedge n_Reset) begin
	//Reset takes precedence
	if (n_Reset == 1'b0) begin
		SHIFT_REG <= 0;
	end
	else begin
		//Otherwise Q = D (and latches)
		if (EN == 1) 
			case (SHIFT) 
				0 : SHIFT_REG <= DATAW;				//Load
				1 : SHIFT_REG <= {1'b0 , SHIFT_REG[N-1:1]};	//Shift
			endcase

	end
end
endmodule
/*
module my_parallel_to_serial (
  input logic clk,
  input logic reset,
  input logic [3:0] parallel_in,
  output logic serial_out
);

  logic [3:0] shift_reg;
  logic [1:0] shift_cnt;

  always_ff @(posedge clk) begin
    if (reset) begin
      shift_reg <= parallel_in;
      shift_cnt <= 2'b11;
    end else begin
      shift_reg <= {shift_reg[2:0], parallel_in};
      shift_cnt <= shift_cnt - 1;
    end
  end

  assign serial_out = shift_reg[3] & (shift_cnt == 0);

endmodule
*/