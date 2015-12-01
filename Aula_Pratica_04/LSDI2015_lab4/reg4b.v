`timescale 1ns/1ns

module reg4b (D, Q, ck, reset, enable);
input [3:0] D;
output [3:0] Q;
input ck, reset, enable;

reg [3:0] Q;

always @(posedge ck or posedge reset)
	if (reset)
		Q <= 4'd0;
	else
		if (enable)
			Q <= D;

endmodule
