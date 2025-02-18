// parity checker
// 4 bit even parity
// error = d3 ^ d2 ^ d1 ^ d0 ^ parity

// if result is 0 then parity is correct else error

module parity_checker(
	input wire d3, d2, d1, d0, parity,
	output wire error
);

	assign error = d3 ^ d2 ^ d1 ^ d0 ^ parity;

endmodule

