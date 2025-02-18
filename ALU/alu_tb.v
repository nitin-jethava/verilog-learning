// test batch for alu 
// give input and check the output with display statemetn


module alu_tb;

reg[7:0] a, b;
reg[2:0] select;
wire[7:0] out;

// instatiate alu func

alu uut(.a(a), .b(b), .select(select), .out(out));

initial begin
	$dumpfile("wave_alu.vcd");
	$dumpvars(0, alu_tb);

	a = 8'b00001111; b = 8'b00000011;
	for(select =0; select < 7; select = select +1) begin
		#10 $display("select: %b | a: %b | b: %b | out: %b", select, a, b, out);
	end
end
endmodule
