// parity checker test betch

`timescale 1ns/1ps

module parity_checker_tb;

	reg d3, d2, d1, d0, parity;
	wire error;

	// instantiate the parity module here
	
	parity_checker uut(.d3(d3), .d2(d2), .d1(d1), .d0(d0), .parity(parity), .error(error));

	initial begin

	$dumpfile("wave_parity_checker.vcd");
	$dumpvars(0, parity_checker_tb);

$monitor("time: %0t | d3: %b | d2: %b | d1: %b | d0: %b | parity: %b | error: %b", $time, d3, d2, d1, d0, parity, error);


// test cases: correct parity

d3 =0; d2 = 0; d1 = 0; d0 = 0; parity =0;  #10;
d3 =0; d2 = 0; d1 = 1; d0 = 0; parity =1;  #10;
d3 =1; d2 = 0; d1 = 1; d0 = 0; parity =0;  #10;
d3 =1; d2 = 1; d1 = 1; d0 = 0; parity =1;  #10;

// test cases: incorrect parity


d3 =0; d2 = 1; d1 = 1; d0 = 0; parity =1;  #10;
d3 =1; d2 = 1; d1 = 1; d0 = 0; parity =0;  #10;

end
endmodule
