// this file is for x-or gate


module xor_gate(input a, input b, output y);

	assign y = a ^ b;
	
	initial begin
		$display("finish design");
	end
endmodule

