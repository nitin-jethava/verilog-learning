// Testbatch for operators:
// 			1. logical
// 			2. bitwise
// 			3. reduction

`timescale 1ps/1ns

module operator_tb;
// logical operator signals
reg a, b;
wire and_out, or_out, not_a;

// bitwise operator signals

reg[3:0]x, y;
wire[3:0] bitwise_and_out, bitwise_or_out, bitwise_xor_out, bitwise_not_a;

// reduction operator signals

reg[3:0] z;
wire[3:0] red_and_out, red_or_out, red_xor_out;


/// instatiate all operators

logical_operator u1(.a(a), .b(b), .and_out(and_out), .or_out(or_out), .not_a(not_a));

bitwise_operator u2(.a(x), .b(y), .bitwise_and(bitwise_and_out), .bitwise_or(bitwise_or_out), .bitwise_xor(bitwise_xor_out), .bitwise_not(bitwise_not_a));


reduction_operator u3(.a(z), .reduc_and(red_and_out), .reduc_or(red_or_out), .reduc_xor(red_xor_out));

// init

initial begin
	$dumpfile("operator_wave.vcd");
	$dumpvars(0, operator_tb);

	$display("=======test begin===========");

	$display("logical test");

	a = 0; b = 1; #10;
	a = 1; b = 0; #10;
	a = 1; b = 0; #10;

	$display("Logical Results: and=%b, or=%b, not a=%b", and_out, or_out, not_a);
	$display("bitwise test");

	x = 4'b1100; y = 4'b1010; #10;
	x = 4'b0110; y = 4'b1101; #10;

	$display("bitwise result: and=%b, or=%b, xor=%b, not_a=%b", bitwise_and_out, bitwise_or_out, bitwise_xor_out, bitwise_not_a);

	$display("Reduction test");

	z = 4'b1101; #10;
	z = 4'b1111; #10;
	z = 4'b0000; #10;
	$display("Reduction result: and=%b, or=%b, xor=%b", red_and_out, red_or_out, red_xor_out);

	$display("all stimulus applied");

	$finish;

end
endmodule
