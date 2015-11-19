`timescale 1ns/1ns

module lsdalu_testbench;

reg  [7:0] A, B;
reg  [2:0] OPR;
wire [7:0] R;
wire [3:0] FLAGS;


lsdalu lsdalu_1( .A(A), .B(B), .OPR(OPR), .R(R), .FLAGS(FLAGS) );

initial
begin
  $monitor($time," OPR=%b   A=%d (%b),  B=%d (%b),  A op B = %d (%b)  FLAGS = %b",
                   OPR, A, A, B, B, R, R, FLAGS );
  // Teste 1: OPR = 000, R = B
  $display("----- OPR=000: R = B");
  OPR = 3'b000;
  A = -14; B = -23; 
  #10
  A = 35; B = 36; 
  #10
  A = 10; B = 43;
  #10
  // acrescente outros testes que permitam verificar se as
  // saídas FLAGS da ALU produzem os resultados correctos
  
  // Teste 2: OPR=001, R = A - B
  $display("----- OPR=001: R = A - B");
  OPR = 3'b001;
  A = 10; B = 3;
  #10
  A = 10; B = 12;
  #10
  A = 10; B = 10;
  #10
  // acrescente outros testes que permitam verificar se as
  // saídas FLAGS da ALU produzem os resultados correctos
  
  // Teste 3: OPR=010, R = A + B
  $display("----- OPR=010: R = A + B");
  OPR = 3'b010;
  A = 10; B = 3;
  #10
  A = 10; B = -3;
  #10
  A = 112; B = 32;   // OVFL=1, CARRY=0
  #10
  A = 64; B = -1;    // OVFL=0, CARRY=1
  #10

  // acrescente outros testes que permitam verificar se as
  // saídas FLAGS da ALU produzem os resultados correctos
  
  // Teste 4: OPR=011, R = A xor B
  $display("----- OPR=011: R = A xor B");
  OPR = 3'b011;
  A = 8'b0000_0000; B = 8'b0000_1111;
  #10
  A = 8'b1010_0101; B = 8'b1010_1010;
  #10
  A = 112; B = 32;   // OVFL=0, CARRY=0 (OPR <> +- )!
  #10
  A = 64; B = -1;    // OVFL=0, CARRY=0 (OPR <> +- )!
  #10
  // acrescente outros testes que permitam verificar se as
  // saídas FLAGS da ALU produzem os resultados correctos
  
  // Teste 5: OPR=100, R = A >> 1
  $display("----- OPR=100: R = A >> 1");
  OPR = 3'b100; 
  A = -34; B = -10;
  #10
  A = 75; B = 10;
  #10
  A = 127; B = -10;
  #10
  // acrescente outros testes que permitam verificar se as
  // saídas FLAGS da ALU produzem os resultados correctos
  
  // Teste 6: OPR=101, R = A << 1
  $display("----- OPR=101: R = A << 1");
  OPR = 3'b101;
  A = 23; B = 11;
  #10
  A = 37; B = -10;
  #10
  A = 99; B = 123;
  #10
  // acrescente outros testes que permitam verificar se as
  // saídas FLAGS da ALU produzem os resultados correctos
  
  // Teste 7: OPR=110, R = A and B
  $display("----- OPR=110: R = A and B");
  OPR = 3'b110;
  A = 8'b0000_0000; B = 8'b0000_1111;
  #10
  A = 8'b1010_0000; B = 8'b1010_1010;
  #10
  // acrescente outros testes que permitam verificar se as
  // saídas FLAGS da ALU produzem os resultados correctos
  
  // Teste 8: OPR=111, R = A or B
  $display("----- OPR=111: R = A or B");
  OPR = 3'b111;
  A = 8'b0000_0000; B = 8'b0000_1111;
  #10
  A = 8'b1010_0000; B = 8'b1010_1010;
  #10
  // acrescente outros testes que permitam verificar se as
  // saídas FLAGS da ALU produzem os resultados correctos
  $stop;
end
 
endmodule
