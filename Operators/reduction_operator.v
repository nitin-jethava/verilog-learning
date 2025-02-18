// Reduction operator


module reduction_operator(
	input [3:0]a, // 4 bit veriable
	output [3:0]reduc_and, reduc_or, reduc_xor
);
	assign reduc_and = &a;
	assign reduc_or = |a;
	assign reduc_xor = ^a;

endmodule
