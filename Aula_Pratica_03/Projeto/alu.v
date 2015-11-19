`timescale 1ns/1ns

module alu ( A, B, OPR, R, Co );
input  [7:0] A, B;
input  [2:0] OPR;
output [7:0] R;
output Co;

// INSIRA AQUI O SEU MODELO DA ALU

reg [7:0] R;

wire [7:0] ROPR0, ROPR1, ROPR2, ROPR3, ROPR4, ROPR5, ROPR6, ROPR7;
wire CoS, CoA;

assign ROPR0=B;
assign {CoS, ROPR1}=A-B;
assign {CoA, ROPR2}=A+B;
assign ROPR3=A^B;
assign ROPR4={A[7], A[7:1]};
assign ROPR5=A<<1;
assign ROPR6=A&B;
assign ROPR7=A|B;

assign Co=(OPR==3'b001) ? CoS : (OPR==3'b010) ? CoA : 1'b0;   // CARRY
					 
always @*
  case (OPR)
    3'b000: R=ROPR0;
    3'b001: R=ROPR1;
    3'b010: R=ROPR2;
    3'b011: R=ROPR3;
    3'b100: R=ROPR4;
    3'b101: R=ROPR5;
    3'b110: R=ROPR6;
    3'b111: R=ROPR7;
  endcase  

endmodule
