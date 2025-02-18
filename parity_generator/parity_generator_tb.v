// parity generator test betch
//

`timescale 1ns/1ps

module parity_generator_tb;
reg d2, d1, d0;
wire parity;

// instatiate the main module

parity_generator uut(.d2(d2), .d1(d1), .d0(d0), .parity(parity));

initial 
begin
	$dumpfile("parity_generator_wave.vcd");
	$dumpvars(0, parity_generator_tb);
	$monitor("time: %t | d2: %b | d1: %b | d0: %b | parity: %b ", $time, d2, d1, d0, parity);

	// writing all test case for 3 bit (truth-table)
	
	d2 = 0; d1 = 0; d0 = 0; #10;
	d2 = 0; d1 = 0; d0 = 1; #10;
	d2 = 0; d1 = 1; d0 = 0; #10;
	d2 = 0; d1 = 1; d0 = 1; #10;
	d2 = 1; d1 = 0; d0 = 0; #10;
	d2 = 1; d1 = 0; d0 = 1; #10;
	d2 = 1; d1 = 1; d0 = 0; #10;
	d2 = 1; d1 = 1; d0 = 1; #10;

	$finish;
end
endmodule
