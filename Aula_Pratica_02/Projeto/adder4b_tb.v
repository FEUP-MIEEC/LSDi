`timescale 1ns / 1ps

// Testbench para a simulação do somador de 4 bits.

module adder4b_tb;

// Inputs
reg A3, A2, A1, A0;
reg B3, B2, B1, B0;
reg Ci;

// Outputs
wire S3, S2, S1, S0;
wire Co;

// Instantiate the Unit Under Test (UUT)
adder4b uut (.Ci(Ci),
					.A3(A3), .A2(A2), .A1(A1), .A0(A0), 
					.B3(B3), .B2(B2), .B1(B1), .B0(B0),
					.Co(Co), 
					.S3(S3), .S2(S2), .S1(S1), .S0(S0)
				 );


initial begin
	$monitor($time, " A3=%b, A2=%b, A1=%b, A0=%b, B3=%b, B2=%b, B1=%b, B0=%b, Ci=%b : Co=%b, S3=%b, S2=%b, S1=%b, S0=%b",
		         A3, A2, A1, A0, B3, B2, B1, B0, Ci, Co, S3, S2, S1, S0);
       
	// Add stimulus here
	#100; A3=0; A2=0; A1=0; A0=0; B3=0; B2=0; B1=0; B0=0; Ci = 0;
	#100; A3=1; A2=1; A1=1; A0=0; B3=1; B2=1; B1=0; B0=0; Ci = 1;
	#100; A3=0; A2=0; A1=1; A0=0; B3=0; B2=0; B1=1; B0=1; Ci = 0;
	#100; A3=1; A2=1; A1=1; A0=1; B3=1; B2=1; B1=1; B0=1; Ci = 1;
	#100; A3=0; A2=0; A1=0; A0=0; B3=1; B2=1; B1=1; B0=1; Ci = 0;
	#100; A3=1; A2=1; A1=1; A0=1; B3=0; B2=0; B1=0; B0=0; Ci = 1;
	#100; $stop;
end
      
endmodule

