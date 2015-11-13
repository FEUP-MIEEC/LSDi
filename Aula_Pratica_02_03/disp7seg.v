module disp7seg(clockscan, areset, clkenable,
                 d3, d2, d1, d0, 
                 dp3, dp2, dp1, dp0,
                 dp, seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g,
                 en_d3, en_d2, en_d1, en_d0 );
                 
input       clockscan, areset;
input       clkenable;
input [3:0] d3, d2, d1, d0;
input       dp3, dp2, dp1, dp0;
output      dp, seg_a, seg_b, seg_c, seg_d, seg_e, seg_f, seg_g;
output      en_d3, en_d2, en_d1, en_d0;
reg         dp;

reg    [3:0] out_display;
reg    [3:0] en_disp;


reg    [6:0] segments;


assign en_d3 = en_disp[3];
assign en_d2 = en_disp[2];
assign en_d1 = en_disp[1];
assign en_d0 = en_disp[0];


assign seg_a = ~segments[6];
assign seg_b = ~segments[5];
assign seg_c = ~segments[4];
assign seg_d = ~segments[3];
assign seg_e = ~segments[2];
assign seg_f = ~segments[1];
assign seg_g = ~segments[0];


// hex to 7-segment decoder
always @( out_display )
begin
  case ( out_display )
    4'b0000: begin
               segments = 7'b1111110;
             end
    4'b0001: begin
               segments = 7'b0110000;
             end
    4'b0010: begin
               segments = 7'b1101101;
             end
    4'b0011: begin
               segments = 7'b1111001;
             end
    4'b0100: begin
               segments = 7'b0110011;
             end
    4'b0101: begin
               segments = 7'b1011011;
             end
    4'b0110: begin
               segments = 7'b1011111;
             end
    4'b0111: begin
               segments = 7'b1110000;
             end
    4'b1000: begin
               segments = 7'b1111111;
             end
    4'b1001: begin
               segments = 7'b1111011;
             end             
    4'b1010: begin
               segments = 7'b1110111;
             end
    4'b1011: begin
               segments = 7'b0011111;
             end
    4'b1100: begin
               segments = 7'b0001101;
             end
    4'b1101: begin
               segments = 7'b0111101;
             end
    4'b1110: begin
               segments = 7'b1001111;
             end
    4'b1111: begin
               segments = 7'b1000111;
             end
  endcase
end


// output multiplexer
always @( en_disp or d0 or d1 or d2 or d3 or dp3 or dp2 or dp1 or dp0)
begin
  casex ( en_disp )
    4'b0111: begin
               out_display = d3;
               dp = ~dp3;
             end
    4'b1011: begin
               out_display = d2;
               dp = ~dp2;
             end
    4'b1101: begin
               out_display = d1;
               dp = ~dp1;
             end
    4'b1110: begin
               out_display = d0;
               dp = ~dp0;
             end
    default: begin
               out_display = 4'b0000;
               dp = 1'b1;
             end
  endcase
end


// display scan
always @(posedge clockscan or posedge areset)
begin
  if ( areset )
  begin
    en_disp <= 4'b0111;
  end
  else
  if ( clkenable )
  begin
    case ( en_disp )
      4'b0111: en_disp <= 4'b1011;
      4'b1011: en_disp <= 4'b1101;
      4'b1101: en_disp <= 4'b1110;
      4'b1110: en_disp <= 4'b0111;
      default: en_disp <= 4'b0111;
    endcase
  end
end

endmodule
