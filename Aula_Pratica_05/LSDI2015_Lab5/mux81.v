`timescale 1ns/1ns

module mux81 ( SEL, I0, I1, I2, I3, I4, I5, I6, I7, Y );
input [7:0] I0, I1, I2, I3, I4, I5, I6, I7;
input [2:0] SEL;
output [7:0] Y;

reg [7:0] Y;

always @*
	case ( SEL )
		0: Y = I0;
		1: Y = I1;
		2: Y = I2;
		3: Y = I3;
		4: Y = I4;
		5: Y = I5;
		6: Y = I6;
		7: Y = I7;
	endcase

endmodule
