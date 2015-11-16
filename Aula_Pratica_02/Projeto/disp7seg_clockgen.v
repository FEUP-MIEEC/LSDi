`timescale 1ns / 1ps
// gera 250Hz a partir do relógio de 50MHz 
// (divide por 200000, 18 bits)
module disp7seg_clockgen(clock, reset, clocken);
input  clock, reset;
output clocken;
reg    clocken;

reg [17:0] clkdiv;

always @(posedge clock or posedge reset)
begin
  if ( reset )
  begin
    clkdiv <= 18'b0;
	 clocken <= 1'b0;
  end
  else
  begin
    if ( clkdiv == 18'd200000 )
	 begin
	   clkdiv <= 0;
		clocken <= 1'b1;
	 end
	 else
	 begin
	   clocken <= 1'b0;
		clkdiv <= clkdiv + 1;
	 end
  end
end



endmodule
