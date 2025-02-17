// test file for 2 to 4 decoder
//

`timescale 1ns/1ps


module decoder_2to4_tb;
reg[1:0] a;
wire[3:0] d;

// instantiate the decoder module
//

decoder2to4 uut(.data_in(a), .out(d));

initial begin
	$dumpfile("decoder_wave.vcd");
	$dumpvars(0, decoder_2to4_tb);

	$monitor("Time = %t | input = %b | output = %b", $time, a, d);

	// applying test inputs
	
	a = 2'b00; #10;
	a = 2'b01; #10;
	a = 2'b10; #10;
	a = 2'b11; #10;

	$finish;
end
endmodule
