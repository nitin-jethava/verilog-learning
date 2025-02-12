// test batch for half adder

module half_adder_tb;
	reg a, b;
	wire sum, carry;

	half_adder uut(.a(a), .b(b), .sum(sum), .carry(carry));

	initial begin
	$dumpfile("half_adder.vcd");
	$dumpvars(0, half_adder_tb);	
	
	$display("Starting stimulation");
	$display("a, b, carry, sum");
	$monitor(" %b, %b, %b, %b ", a, b, carry, sum);
	a = 0; b = 0; #10
	a = 0; b = 1; #10
	a = 1; b = 0; #10
	a = 1; b = 1; #10
	$display("end");	
end
endmodule
