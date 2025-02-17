// testbetch for bidir buffer

`timescale 1ns / 1ps

module bidir_buffer_tb;
	reg[7:0] din; // data to be driven
	reg enable;  // control signal
	wire[7:0] data; // bi-directional bus
	wire[7:0] dout; // read data form bus

// instantiate the bi-directional buffer module

bi_dir_buffer uut (.data(data), .din(din), .enable(enable), .dout(dout));

initial begin
	$dumpfile("bidir_buffer_wave.vcd");
	$dumpvars(0, bidir_buffer_tb);

	$display("time\t enable\t din\t data\t dout");
	$monitor("%t\t %b\t %b\t %b\t %b\t", $time, enable, din, data, dout);
	
	// case1: driving data with enable = 1
	
	enable = 1;
	din = 8'b10101010;
	#10;

	// case 2: reading data form data enable = 0
	enable = 0;
	#10;

	// case 3:  driving another value;
	enable = 1;
	din = 8'b11001100;
	#10;

	// case 4: release data bus
	enable = 0;
	#10;
end

endmodule
