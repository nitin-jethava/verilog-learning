// 2 * 1 mux
// y = (sel'*a) + (sel*b)
// gate level modeling
//

module mux2x1(input a, input b, input select, output y);

wire not_select, and1, and2; // taking wire to connection

	not(not_select, select); //not operation; it will [not_select = ~select]
	and(and1, a, not_select); // and operation; and1 = a * not select;
	and(and2, b, select); // and operation; and2 = b * select;
	or(y, and1, and2); // or operation; y = and1 | and2;

endmodule
