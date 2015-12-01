`timescale 1ns/100ps

module LSDI_Lab4( 
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
                        
								//------------------------------------------------------------------
								// Serial interface (RS232 port)
                        tx,			// tx data (output from the user circuit)
                        rx,			// rx data (input to the user circuit)
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

// RS232:
input				rx;
output			tx;

wire [3:0] FLAGS;
wire [2:0] OPR;
wire [2:0] SEL;
wire [1:0] CE;

//-----------------------------------------------------------------------------------
// DISABLE_OUTPUTS
// This section disable all the output signals, assigning them to non-active logic levels
// Unused outputs should be left assigned to these levels; used outputs that are connected 
// to the user circuit must be commented out:
//------------------------------------------------------------------

//------------------------------------------------------------------
// LEDs: logic 1 lights the LED
// assign ld7			= 1'b0;			// LED 7 (leftmost)
// assign ld6			= 1'b0;
// assign ld5			= 1'b0;
// assign ld4			= 1'b0;
// assign ld3			= FLAGS[3];
// assign ld2			= FLAGS[2];
// assign ld1			= FLAGS[1];
// assign ld0			= FLAGS[0];			// LED 0 (rightmost)
assign {ld7,ld6,ld5,ld4,ld3,ld2,ld1,ld0} = (btn1) ? {4'b0000, FLAGS} : {OPR, SEL, CE};

// sinal de clock enable para o display de 7 segmentos:
wire 	clken250hz;

//-------------------------------------------------------------------------------
//###############################################################################
// Add additional wires here:

wire  clock25MHz,
      clock25x180;

wire [7:0] result;
wire       en_clock, en_clocki;
wire       clken100hz, clockman_unbuf, clockman;

wire [10:0] ROMdata;
wire  [4:0] ROMaddress;

wire        pulse1, pulse0;	// neste exemplo estas saídas não são usadas

// barramentos que ligam as portas *in e *out do interface paralelo:
wire [15:0] abus, bbus, cbus, dbus; //, ext_ain;

// sinais de controlo da UART:
wire txen, rxready, txready;

// data bus entre a UART e o interface paralelo:
wire [7:0] din, dout;

wire [7:0] A, B;
wire [7:0] X = {sw7, sw6, sw5, sw4, sw3, sw2, sw1, sw0};
// wire [2:0] OPR; 
// wire [2:0] SEL;   <=== declarados atrás
// wire [1:0] CE;

//-------------------------------------------------------------------------------
//###############################################################################
// Add your schematic here:

assign reset = btn0;

// DCM: generates the 25MHz clock and the same clock inverted:
dcmdiv2  dcmdiv2_1
           (
           .CLKIN_IN(clock50MHz),  
           .CLK0_OUT(clock25MHz), 
           .CLK180_OUT(clock25x180)
			  );

// UART:
suart  suart_1  ( .clock(clock25MHz),	      // master clock (25MHz)
                  .reset(reset),			// master reset, assynchronous, active high
                  .tx(tx),					// tx data, connected to rx input
                  .rx(rx),					// rx data, connected to tx output
                  .txen(txen),			// load data into transmit buffer and initiate a transmission
                  .txready(txready),	// ready to receive a new byte to tx
                  .rxready(rxready),	// data is ready at dout port
                  .dout(dout),			// data out (received data)
                  .din(din)				// data in (data to transmit)
                );

// Interface paralela:
unisepa unisepa_1( .clk(clock25MHz),	// master clock 
                   .reset(reset),		// master reset, assynchronous, active high
                   
                   .load(rxready),		// load enable for din bus
                   .ready(txready),		// ready to consume dout data
                   .enout(txen),			// enable loading of dout data
                   
                   .datain(dout),		// data in bus (8 bits), from USART
                   .dataout(din),		// data out bus (8 bits), to USART
                   
                   .Ain(abus),		   // A input port (16 bits)
                   .Bin(bbus),			// B input port (16 bits)
                   .Cin(cbus),		// C input port (16 bits)
                   .Din(dbus),		// D input port (16 bits)
                   
                   .Aout({OPR, SEL, CE}),			// A output port (16 bits)
                   .Bout(bbus),			// B output port (16 bits)
                   .Cout(cbus),			// C output port (16 bits)
                   .Dout(dbus),			// D output port (16 bits)
                   
                   .pulse0(pulse0),		// pulse 0 (one clock period)
                   .pulse1(pulse1)		// pulse 1 (one clock period)
              );

datapath datapath_1 (
  .clock(clockman),
  .reset(reset),
  .OPR(OPR),
  .SEL(SEL),
  .CE(CE),
  .X(X),
  .A(A),
  .B(B),
  .FLAGS(FLAGS)
);

debounce debounce_1
              ( .clock( clock25MHz ),  // master clock (25MHz)
                .reset( 1'b0 ),  // master reset, assynchronous, active high
				    .clken100hz( clken100hz ), // clock enable output, 50Hz ( for Mclk=25M)
                .key0in( btn0 ), // connects to external key input
                .key1in( btn1 ), // connects to external key input
                .key2in( btn2 ), // connects to external key input
                .key3in( btn3 ), // connects to external key input
                .key3out( clockman_unbuf ) // output signal
              );

// global clock buffer
BUFG manclockbuf( .I(clockman_unbuf), .O( clockman ) );			  

//-------------------------------------------------------------------------------
//###############################################################################
// interface com o display de 7 segmentos
disp7seg  dip7seg (.clockscan(clock25MHz),
                   .areset(reset),
						  
						 .clkenable(clken250hz),

                   .d3( A[7:4] ),
						 .d2( A[3:0] ),
						 .d1( B[7:4] ),
						 .d0( B[3:0] ),
						  
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
disp7seg_clockgen  disp7seg_clockgen_1
           (
            .clock(clock25MHz), 
            .reset(reset), 
            .clocken(clken250hz)
			);

endmodule

