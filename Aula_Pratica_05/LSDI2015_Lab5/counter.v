module counter ( ck, reset, load, I, Q );
	input ck, reset, load;
	input [4:0] I;
	output [4:0] Q;
	
	reg [4:0] Q;

	always @(posedge ck or posedge reset)
		if (reset)
			Q <= 8'd0;
		else
			if (load)
				Q <= I;
			else
				Q <= Q + 1;
			
endmodule