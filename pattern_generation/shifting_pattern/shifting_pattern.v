
// USING REPEATE FUNC

module shifting_pattern;

reg[3:0] shift_reg = 4'b0001;

initial begin
	repeat(4) begin
	#10 shift_reg = {shift_reg[2:0], shift_reg[3]};
	$display("shifted: %b", shift_reg);
end
end
endmodule
