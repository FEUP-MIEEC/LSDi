`timescale 1ns / 1ps

// Testbench para a simulação do somador/subtractor de 4 bits.

module addsub4b_tb;

// Inputs
reg [3:0] A;
reg [3:0] B;
reg add_sub;

// Outputs
wire [3:0] R;
wire Co;

// Instantiate the Unit Under Test (UUT)
addsub4b uut (	.add_sub(add_sub),
							.A3(A[3]), .A2(A[2]), .A1(A[1]), .A0(A[0]), 
							.B3(B[3]), .B2(B[2]), .B1(B[1]), .B0(B[0]),
							.Co(Co), 
							.R3(R[3]), .R2(R[2]), .R1(R[1]), .R0(R[0])
						);

initial begin       
	// Add stimulus here
  #100; A = 4'b0000; B = 4'b0000; add_sub = 0;
	#100; A = 4'b0000; B = 4'b0001; add_sub = 0;
	#100; A = 4'b1110; B = 4'b1100; add_sub = 1;
	#100; A = 4'b1010; B = 4'b0011; add_sub = 0;
	#100; A = 4'b1111; B = 4'b1111; add_sub = 1;
	#100; $stop;
end
      
endmodule

