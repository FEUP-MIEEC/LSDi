`timescale 1ns/1ns

module lsdalu ( A, B, OPR, R, FLAGS );
input  [7:0] A, B;
input  [2:0] OPR;
output [7:0] R;
output [3:0] FLAGS;

wire Co;

alu alu_( A, B, OPR, R, Co );
detFlags detFlags(.sA(A[7]), .sB(B[7]), .R(R), .Co(Co), .OPR(OPR), .ZERO(FLAGS[0]), .SINAL(FLAGS[1]), .CARRY(FLAGS[2]), .OVFL(FLAGS[3]));					 

endmodule
