module ROM( endereco, dado );
	input [4:0] endereco;
	output [7:0] dado;

	reg [7:0] dado;
	
	always @*
		case (endereco)
			5'd0: dado = 8'b001_100_00;
			5'd1: dado = 8'b100_000_00;
			5'd2: dado = 8'b100_000_00;
			5'd3: dado = 8'b100_000_00;
			5'd4: dado = 8'b100_000_00;
			5'd5: dado = 8'b100_000_00;
			5'd6: dado = 8'b100_000_00;
			5'd7: dado = 8'b100_000_00;
			5'd8: dado = 8'b100_000_00;
			5'd9: dado = 8'b101_01011;
			5'd10: dado = 8'b101_00000;
			5'd11: dado = 8'b000_100_01;
			5'd12: dado = 8'b101_00000;
			
			default: dado = 8'd0;
		endcase

endmodule