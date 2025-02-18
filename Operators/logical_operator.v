// Logical operator
//


module logical_operator(
	input a, b,
	output and_out, or_out, not_a
);

	assign and_out = a && b;
	assign or_out = a || b;
	assign not_a = !a;
endmodule
