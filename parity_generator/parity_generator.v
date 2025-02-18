// parity_generator
//
//


module parity_generator(
	input wire d2, d1, d0,
	output wire parity
);

assign parity = d2 ^ d1 ^ d0;

endmodule
