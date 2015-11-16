`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:55 11/12/2015 
// Design Name: 
// Module Name:    overflow 
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
module overflow(
    input S,
    input A,
    input B,
    input R,
    output OVF
    );
wire nB, nA, nR, nS
not(nB,B);

endmodule
