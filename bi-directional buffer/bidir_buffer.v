// bi-dir_buffer

module bi_dir_buffer(
	inout wire[7:0] data, // data bus
	input wire[7:0] din,  // data input to drive bus
	input wire enable,    // control signal 
	output wire[7:0] dout // read data form bus
);

 // if enable is high, drive data with din; otherwise, set data to high
 // impedance (z).

	assign data = (enable) ? din : 8'bz;

 // read data form the bus when enable is low
 
 	assign dout = data;

endmodule
