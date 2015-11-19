`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:20 01/03/2007 
// Design Name: 
// Module Name:    datapath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module datapath( clock, reset, en, B, A, OPR, FLAGS);
input clock, reset, en;
input [7:0] B;
input [2:0] OPR;
output [7:0] A;
output [3:0] FLAGS;

reg [7:0] A;
reg [3:0] FLAGS;

wire [7:0] new_A;
wire [3:0] new_FLAGS;

lsdalu lsdalu_1(
                  .A( A ),
						.B( B ),
						.OPR( OPR ),
						.R( new_A ),
						.FLAGS( new_FLAGS )
					);

always @(posedge clock or posedge reset )
begin
  if ( reset )
  begin
    A <= 0;
	 FLAGS <= 0;
  end
  else
  begin
    if ( en )
	 begin
      A <= new_A;
	   FLAGS <= new_FLAGS;
    end
  end
end

endmodule
