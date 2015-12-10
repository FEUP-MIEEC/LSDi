module ROM( endereco, dado );
	input [4:0] endereco;
	output [7:0] dado;

	reg [7:0] dado;
	
	always @*
		case (endereco)
			5'd0: dado = 8'b0001_0000;
			5'd1: dado = 8'b0001_0001;
			5'd2: dado = 8'b0001_0010;
			5'd3: dado = 8'b0000_0011;
			5'd4: dado = 8'b0000_1000;
			5'd5: dado = 8'b0011_0110;
			5'd6: dado = 8'b0000_0100;
			5'd7: dado = 8'b0100_1111;
			5'd8: dado = 8'b0000_1000;
			5'd9: dado = 8'b0011_0110;
			5'd10: dado = 8'b1010_0110;
			5'd11: dado = 8'b0000_1100;
			
			default: dado = 8'd0;
		endcase

endmodule