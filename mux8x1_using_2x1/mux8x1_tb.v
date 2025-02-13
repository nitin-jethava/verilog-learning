// TB for 8x1 mux 

`timescale 1ns/1ps
module mux8x1_tb;

reg [7:0]a;
reg [2:0]select;

wire out;

// take instant

mux8x1 uut(.D(a), .select(select), .out(out));

initial 
begin
	$dumpfile("mux8x1_wave.vcd");
	$dumpvars(0, mux8x1_tb);

	$display("staring giving inputs");

	$monitor("a=%b, select=%b, out=%b", a, select, out);

	a = 8'b10101101; // inputs
	// a0 = 1, a1 = 0 ... a7 = 1
	
// test case: changing select lines

	select = 3'b000; #10; // select a0 (out = 1)
	select = 3'b001; #10; // select a1 (out = 0)
	select = 3'b010; #10; // select a2 (out = 1)
	select = 3'b011; #10; // select a3 (out = 1)
	select = 3'b100; #10; // select a4 (out = 0)
	select = 3'b101; #10; // select a5 (out = 1)
	select = 3'b110; #10; // select a6 (out = 0)
	select = 3'b111; #10; // select a8 (out = 1)

	$finish; // ending simulation


end
endmodule
