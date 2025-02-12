`timescale 1ns/1ps

module and_gate_tb;
	reg a, b;
	wire y;

	and_gate uut(.a(a), .b(b), .y(y));

	initial begin
		$dumpfile("and_gate.vcd"); // dump file for waveform
		$dumpvars(0, and_gate_tb);

		$display("begin_simulation");
		a = 0; b = 0; #10;
		a = 0; b = 1; #10;
		a = 1; b = 0; #10;
		a = 1; b = 1; #10;

		$display("end_simulation");
		$finish; // end the simulation	
	end
endmodule
