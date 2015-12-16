module ROM( endereco, dado );
	input [4:0] endereco;
	output [7:0] dado;

	reg [7:0] dado;
	
	always @*
		case (endereco)
			5'd0: dado = 8'b010_100_00;
			5'd1: dado = 8'b000_100_01;
			5'd2: dado = 8'b101_00000;
			5'd3: dado = 8'b000_000_01;
			5'd4: dado = 8'b000_110_00;
			5'd5: dado = 8'b101_00101;
			
			default: dado = 8'd0;
		endcase

endmodule