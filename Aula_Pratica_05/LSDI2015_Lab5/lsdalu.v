
`timescale 1ns/1ns


module lsdalu ( A, B, OPR, R, FLAGS );
input [7:0] A, B;
input [2:0] OPR;
output [7:0] R;
output [3:0] FLAGS;
reg    [7:0] R;
reg          co;
reg          ovfl;

always @*
begin
  case( OPR )
    0: R = B;
    1: {co, R} = A - B;
    2: {co, R} = A + B;
    3: R = A ^ B;
    4: R = { A[7], A[7:1] };
    5: R = A << 1;
    6: R = A & B;
    7: R = A | B;
  endcase
end
 
assign FLAGS[0] = ~( | R ); // zero
assign FLAGS[1] = R[7]; // sinal
assign FLAGS[2] = (OPR == 1 || OPR == 2) ? co : 0; // carryout
assign FLAGS[3] = ovfl;


always @*
begin
  case ( OPR )
    3'b010: ovfl = (A[7] == B[7]) && (R[7] != A[7]); // adição
    3'b001: ovfl = (A[7] != B[7]) && (R[7] != A[7]); // subtracção
    default: ovfl = 1'b0;
  endcase
end

endmodule
