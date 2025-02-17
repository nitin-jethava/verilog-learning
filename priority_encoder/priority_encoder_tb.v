// priority encoder testbench
// note: jeni vadhare priority enu output aavse


`timescale 1ns/ 1ps

module priority_encoder_tb;
	reg[3:0] data_in;
	wire [1:0] out;
	wire valid;

	// instantiating priority encoder func
	
	priority_encoder uut (.data(data_in), .out(out), .valid(valid));

	initial
	begin
		$dumpfile("priority_encoder.vcd");
		$dumpvars(0, priority_encoder_tb);

		$monitor("Time = %0t | data_in= %b | out = %b | valid = %b", $time, data_in, out, valid);

		// test cases begin
		data_in = 4'b0000; #10; // no valid i/p
		data_in = 4'b0001; #10;	// low prio
		data_in = 4'b0010; #10;
		data_in = 4'b0100; #10;
		data_in = 4'b1000; #10;

		// random test based on priority check
		//

		data_in = 4'b1010; #10;
		data_in = 4'b0111; #10;
		data_in = 4'b1111; #10;

		$finish;
	end
endmodule
