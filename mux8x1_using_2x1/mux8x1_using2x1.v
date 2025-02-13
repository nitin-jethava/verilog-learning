// creating the 8x1 mux using the 2x1 mux
//

module mux2x1(input a, input b, input select, output out);
// using dataflow modeling
	assign out = select ? b : a;
endmodule

module mux8x1(input [7:0]D, input [2:0]select, output out);
wire y0, y1, y2, y3, y4, y5; //mux connector

// stage1: first four mux which select under select[0]

	mux2x1 m1(D[0], D[1], select[0], y0);
	mux2x1 m2(D[2], D[3], select[0], y1);
	mux2x1 m3(D[4], D[5], select[0], y2);
	mux2x1 m4(D[6], D[7], select[0], y3);

// stage2: another 2 mux for taking of value of above 4 mux
// we giving the input value of y0 - y3 and take output in y4 and y5

	mux2x1 m5(y0, y1, select[1], y4);
	mux2x1 m6(y2, y3, select[1], y5);

// stage3: giving above mux output value to next final mux's input

	mux2x1 m7(y4, y5, select[2], out);

endmodule
