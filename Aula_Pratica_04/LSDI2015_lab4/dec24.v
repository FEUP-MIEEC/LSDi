`timescale 1ns/1ns

module dec24( CE, Y3, Y2, Y1, Y0  );
input [1:0] CE;
output Y3, Y2, Y1, Y0;

reg Y3, Y2, Y1, Y0;

always @*
	case ( CE )
		0: {Y3, Y2, Y1, Y0} = 4'b0001;
		1: {Y3, Y2, Y1, Y0} = 4'b0010;
		2: {Y3, Y2, Y1, Y0} = 4'b0100;
		3: {Y3, Y2, Y1, Y0} = 4'b1000;
	endcase

endmodule
