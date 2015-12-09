`timescale 1ns/1ns

module reg8b (in, out, ck, reset, enable);
  input [7:0] in;
  output [7:0] out;
  input ck, reset, enable;

  reg [7:0] out;

  always @(posedge ck or posedge reset)
    if (reset)
	   out <= 8'd0;
	 else
		if (enable)
		  out <= in;
endmodule
