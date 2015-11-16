`timescale 1ns / 1ps


module fulladder_tb;

	// Inputs
	reg A;
	reg B;
	reg Ci;

	// Outputs
	wire S;
	wire Co;

	// Instantiate the Unit Under Test (UUT)
	fulladder uut(
								.A(A), 
								.B(B), 
								.Ci(Ci), 
								.Co(Co), 
								.S(S)
							);

initial begin   
		$monitor($time, " A=%b, B=%b, Ci=%b : Co=%b, S=%b",
		         A, B, Ci, Co, S);
		// Add stimulus here
    #100; A = 0; B = 0; Ci = 0;
    #100; A = 0; B = 0; Ci = 1;
    #100; A = 0; B = 1; Ci = 0;
    #100; A = 0; B = 1; Ci = 1;
    #100; A = 1; B = 0; Ci = 0;
    #100; A = 1; B = 0; Ci = 1;
    #100; A = 1; B = 1; Ci = 0;
    #100; A = 1; B = 1; Ci = 1;
    #100; $stop;
	end
      
endmodule

