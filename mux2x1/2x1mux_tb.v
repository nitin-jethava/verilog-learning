// TB for 2x1 mux
// we give the stimuli inuputs
//

`timescale 1ns/ 1ps


module mux2x1_tb;
reg a, b, sel;
wire y;

mux2x1  uut(.a(a), .b(b), .select(sel), .y(y));

initial 
	begin
		$display("begin tb");
		$dumpfile("2x1mux_wave.vcd");
		$dumpvars(0, mux2x1_tb);

		$monitor("a=%b, b=%b, sel=%b", a, b, sel);

		a = 0; b = 1; sel = 0; #10; // selecting a
		a = 0; b = 1; sel = 1; #10; // selecting b
		a = 1; b = 0; sel = 0; #10; // selecting a
		a = 1; b = 0; sel = 1; #10; // selecting b

		
	end

endmodule
