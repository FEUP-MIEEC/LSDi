`timescale 1ns/1ns

module reg4b (in, out, ck, reset, enable);
input [3:0] in;
output [3:0] out;
input ck, reset, enable;

reg [3:0] out;

always @(posedge ck or posedge reset)
	if (reset)
		out <= 4'd0;
	else
		if (enable)
			out <= in;

endmodule
