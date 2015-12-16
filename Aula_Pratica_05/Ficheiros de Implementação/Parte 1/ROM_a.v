module ROM( endereco, dado );
	input [4:0] endereco;
	output [7:0] dado;

	reg [7:0] dado;
	
	always @*
		case (endereco)
			2’d0: dado = 8’b1101_0001;
			2’d1: dado = 8’hAB;
			2’d2: dado = 8’d29;
			2’d3: dado = 8’b1010_0001;
			
			default: dado = 8'd0;
		endcase

endmodule