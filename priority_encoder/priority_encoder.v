/// priotity encoder


module priority_encoder(
	input[3:0] data,
	output reg [1:0] out,
	output reg valid
);

always @(*)
begin
	valid = 1'b0; // default :no input
	out = 2'b00;  // default output

	if(data[3])
	begin // highest prio
		out = 2'b11;
		valid = 1'b1;
	end
	else if(data[2])
	begin
		out = 2'b10;
		valid = 1'b1;
	end
	else if(data[1])
	begin
		out = 2'b01;
		valid = 1'b1;
	end
	else if(data[0])
	begin // lowest prio
		out = 2'b00;
		valid = 1'b1;
	end
end
endmodule
