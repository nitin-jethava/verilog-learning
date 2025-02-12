// this file is for or gate

module or_gate(input a, input b, output y);
	assign y = a | b;

	initial begin
	$display("design done");
	end
endmodule
