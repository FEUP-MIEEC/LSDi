`timescale 1ns / 1ps

module datapath( clock, reset, X, A, B, R1, R2, R3, FLAGS, endereco, dados);

input clock, reset;
input [7:0] X;
output [7:0] A, B, R1, R2, R3;
output [3:0] FLAGS;
output [4:0] endereco;
output [7:0] dados;

wire [3:0] new_FLAGS;
wire enA, enR1, enR2, enR3;
wire [7:0] R;

wire [2:0] OPR = dados[7:5];
wire [2:0] SEL = dados[4:2];
wire [1:0] CE  = dados[1:0];

wire jump, jumpNotZ;

assign jump = (OPR == 3'b101);
assign jumpNotZ = ((OPR == 3'b101) && ~FLAGS[0]);

dec24 dec24_1( CE, ~jump, enR3, enR2, enR1, enA );

mux81 mux81_1( SEL, A, R1, R2, R3, X, 8'd1, 8'd15, {7'd0, FLAGS[2]}, B );

lsdalu lsdalu_1( A, B, OPR, R, new_FLAGS );

reg8b RegA  ( R, A,  clock, reset, enA  );
reg8b RegR1 ( R, R1, clock, reset, enR1 );
reg8b RegR2 ( R, R2, clock, reset, enR2 );
reg8b RegR3 ( R, R3, clock, reset, enR3 );

reg4b RegF ( new_FLAGS, FLAGS, clock, reset, ~jump ); // O último sinal é o 'enable'

counter counter1 ( ~clock, reset, jumpNotZ, dados[4:0], endereco );

ROM memoria (endereco, dados);

endmodule

