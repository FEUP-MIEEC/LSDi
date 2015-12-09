module ROM( endereco, dado );
	input [4:0] endereco;
	output [7:0] dado;
  
	reg [7:0] dado;

	always @*
		case (endereco)
			// INSIRA NAS LINHAS SEGUINTES O SEU PROGRAMA
			
			
			
			
			default: dado = 8'd0;
		endcase

endmodule
