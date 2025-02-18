// pattern generation with foor loop
//
// basis pattern we will generate
// like
// 	000
// 	001
// 	010
// 	011
// 	likewise
//

module binary_couter;
reg[2:0] count; // 3 bit counter

initial begin
	for(count = 0; count < 9; count = count +1) begin
		#10 $display("count: %b", count);
	end
end

 endmodule
