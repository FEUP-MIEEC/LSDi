module ROM( endereco, dado );
	input [4:0] endereco;
	output [7:0] dado;

	reg [7:0] dado;
	
	always @*
		case (endereco)
			2'd0: dado 8'
			
			
			
			
			default: dado = 8'd0;
		endcase

endmodule