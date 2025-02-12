// this file is for or gate test betch

`timescale 1ns/1ps

module or_gate_tb;

	reg a, b;
	wire y;

	or_gate uut(.a(a), .b(b), .y(y));

	initial
		begin
			$dumpfile("or_gate.vcd"); // dump file for waveform
			$dumpvars(0, or_gate_tb);

			$display("applying inputs: ");

			a = 0; b = 0; #10
			a = 0; b = 1; #10
			a = 1; b = 0; #10
			a = 1; b = 1; #10
			$display("simulation finish");
			$finish;
		end
endmodule
