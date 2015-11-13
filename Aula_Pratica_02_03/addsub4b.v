`timescale 1ns / 1ps

module addsub4b(add_sub, A3, A2, A1, A0, B3, B2, B1, B0, Co, R3, R2, R1, R0);
  input add_sub;  // Se add_sub=0 faz A+B; se add_sub=1 faz A-B
  input A3, A2, A1, A0;  // Operando A
  input B3, B2, B1, B0;  // Operando B 
  output Co;
  output R3, R2, R1, R0; // Resultado R
	wire w0,w1,w2,w3;
  // Acrescente a seguir a implementação
	xor #9 x0(w0, B0, add_sub), 
			x1(w1,B1,add_sub), 
			x2(w2,B2,add_sub), 
			x3(w3,B3,add_sub);
			
	adder4b AS(.Ci(add_sub), .Co(Co), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .B0(w0), .B1(w1), .B2(w2), .B3(w3), .S0(R0), .S1(R1), .S2(R2), .S3(R3));
  
endmodule
