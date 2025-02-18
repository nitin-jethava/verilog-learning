// 	Bitwise Operator
// 	&, |, ^, ~
// 	and , or , xor, not

module bitwise_operator(
	input [3:0]a, b,
	output [3:0]bitwise_and, bitwise_or, bitwise_xor, bitwise_not
);
	assign bitwise_and = a & b;
	assign bitwise_or = a | b;
	assign bitwise_xor = a ^ b;
	assign bitwise_not = ~a;
endmodule
