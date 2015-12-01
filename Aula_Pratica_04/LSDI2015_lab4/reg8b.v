`timescale 1ns/1ns

module reg8b (D, Q, ck, reset, enable);
input [7:0] D;
output [7:0] Q;
input ck, reset, enable;

reg [7:0] Q;

always @(posedge ck or posedge reset)
	if (reset)
		Q <= 8'd0;
	else
		if (enable)
			Q <= D;

endmodule