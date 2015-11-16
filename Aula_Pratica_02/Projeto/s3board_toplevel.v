`timescale 1ns/100ps

module s3board_toplevel( 
								//------------------------------------------------------------------
                        // main clock sources:
                        clock50MHz,	// master clock input (external oscillator 50MHz)

								//------------------------------------------------------------------
                        // push buttons: button down = logic 1 (no debouncing hw)
								btn3,			// button 3 (leftmost)
								btn2,
								btn1,
								btn0,			// button 0 (rigthmost)

								//------------------------------------------------------------------
								// LEDs: logic 1 lights the LED
								ld7,			// LED 7 (leftmost)
								ld6,
								ld5,
								ld4,
								ld3,
								ld2,
								ld1,
								ld0,			// LED 6 (rightmost)

								//------------------------------------------------------------------
								// Slide switches: UP position generates a logic 1
								sw7,			// switch 7 (leftmost)
								sw6,
								sw5,
								sw4,
								sw3,
								sw2,
								sw1,
								sw0,			// switch 0 (rightmost)

								//------------------------------------------------------------------
								// Seven segment display: logic 0 lights the segment LED
								//                        logic 0 enables each display
								sega,			// segment a
								segb,
								segc,
								segd,
								sege,
								segf,
								segg,
								dp,			// decimal point

								an3,        // display enable (leftmost digit)
								an2,
								an1,
								an0,			// display enable (rightmost digit)
                        );

// clocks:
input				clock50MHz;
 
// buttons and switches:
input			btn3, btn2, btn1, btn0,
					sw7, sw6, sw5, sw4, sw3, sw2, sw1, sw0;

output 		ld0, ld1, ld2, ld3, ld4, ld5, ld6, ld7;

// 7-segment display:
output		sega, segb, segc, segd, sege, segf, segg, dp,
					an3, an2, an1, an0;

//-----------------------------------------------------------------------------------
// DISABLE_OUTPUTS
// This section disable all the output signals, assigning them to non-active logic levels
// Unused outputs should be left assigned to these levels; used outputs that are connected 
// to the user circuit must be commented out:
//------------------------------------------------------------------

//------------------------------------------------------------------
// LEDs: logic 1 lights the LED
assign ld7			= 1'b0;			// LED 7 (leftmost)
//assign ld6			= 1'b0;
assign ld6			= 1;
assign ld5			= 1'b0;
assign ld4			= 1'b0;
assign ld3			= 1'b0;
assign ld2			= 1'b0;
assign ld1			= 1'b0;
assign ld0			= 1'b0;			// LED 6 (rightmost)

// o reset assíncrono liga ao botão de pressão 3
wire reset = btn3;

// barramento ligado aos displays de 7 segmentos
// abus[15:12] - digito da esquerda
// abus[11: 8]
// abus[ 7: 4]
// abus[ 3: 0] - digito da direita
wire [15:0] abus;

// sinal de clock enable para o display de 7 segmentos:
wire 	clken250hz;

//-------------------------------------------------------------------------------
//###############################################################################
// Add additional wires here:

wire [3:0] numA, numB, numR;
wire add_sub, Co;

assign numA = {sw7, sw6, sw5, sw4};
assign numB = {sw3, sw2, sw1, sw0};

assign add_sub = btn0;
assign abus = {3'b000, Co, numR, numA, numB};

//-------------------------------------------------------------------------------
//###############################################################################
// Add your schematic here:

addsub4b as4(add_sub, numA[3], numA[2], numA[1], numA[0],
                 numB[3], numB[2], numB[1], numB[0],
					  Co,
                 numR[3], numR[2], numR[1], numR[0]);

//-------------------------------------------------------------------------------
//###############################################################################
// interface com o display de 7 segmentos
disp7seg  d7seg(.clockscan(clock50MHz),
                   .areset(reset),
						  
						 .clkenable(clken250hz),

             .d3(abus[15:12]),
						 .d2(abus[11: 8]),
						 .d1(abus[ 7: 4]),
						 .d0(abus[ 3: 0]),
						  
                   .dp3(1'b0), 
						 .dp2(1'b0), 
						 .dp1(1'b0), 
						 .dp0(1'b0),

                   .dp(dp), 
						 .seg_a(sega), 
						 .seg_b(segb), 
						 .seg_c(segc), 
						 .seg_d(segd),
						 .seg_e(sege),
						 .seg_f(segf),
						 .seg_g(segg),

                   .en_d3(an3),
						 .en_d2(an2),
						 .en_d1(an1),
						 .en_d0(an0)
						  );

// gerador de relógio (sinal de clock enable) para o interface com o display de 7 segmentos
// produz um sinal de clockenable de 250Hz (duração igual a um período de relógio), 
// para um sinal de relógio de 50MHz; para diferentes	frequências de relógio de entrada, 
// o factor de divisão e o número de bits do contador (registo clkdiv) devem ser ajustados 
// de forma apropriada a obter uma frequência de varrimento dos displays entre 100 e 300Hz
disp7seg_clockgen  disp7seg_clockgen_1(
																				.clock(clock50MHz), 
																				.reset(reset), 
																				.clocken(clken250hz)
																			);

endmodule

