// alu
// we design alu for  8 bit and it will perform the below function:
// 	addition
// 	subtraction
// 	and
// 	or
// 	xor
// 	left and right shift


module alu(
	input wire[7:0] a, b, // take input
	input wire[2:0] select, // control or func selector
	output reg[7:0] out 
);

// define the alu operation

parameter ADD 		= 0;
parameter SUB 		= 1;
parameter ANDING 	= 2;
parameter ORING 	= 3;
parameter XORING 	= 4;
parameter LEFT_SHIFT 	= 5;
parameter RIGHT_SHIFT 	= 6;

always @(a or b or select)
	case(select)
		ADD: 		out = a + b;
		SUB: 		out = a - b;
		ANDING: 	out = a & b;
		ORING: 		out = a | b;
		XORING: 	out = a ^ b;
		LEFT_SHIFT: 	out = a << b;
		RIGHT_SHIFT: 	out = a >> b;
		default: 	out = 0;
	endcase
endmodule
