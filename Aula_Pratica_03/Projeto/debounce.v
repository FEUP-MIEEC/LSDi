/*

  debounce

  V1.0 Dez 2005

  This module implements a digital debounce for a push-button. Output is synchronous
  with the master clock and is activated only when the input signal is high for
  at least 100ms (sampled at 10 points separeated by 10ms). 

             

------------------------------------------------------------

  Revision history:

  - Dec 21, 2005 - First release, jca (jca@fe.up.pt)
------------------------------------------------------------

  
*/
`timescale 1ns/100ps

module debounce
              ( clock,  // master clock (50MHz)
                reset,  // master reset, assynchronous, active high
		    clken100hz,  // clock enable output, 100Hz
                key0in, // connects to external key input
                key1in, // connects to external key input
                key2in, // connects to external key input
                key3in, // connects to external key input
                key0out,// output signal
                key1out,// output signal
                key2out,// output signal
                key3out // output signal
              );

parameter    TIME_BASE   = 499999;  // (50000000Hz / 100Hz / 2) - 1


input        clock, reset;
output       clken100hz;
input        key0in,key1in,key2in,key3in;
output       key0out,key1out,key2out,key3out;



// local signals:
reg  [18:0]  clkdiv; // clock divider counter (50MHz / 500000 = 100Hz = 1/10ms)

reg  [11:0]  key0sr;	 // synchronizer and debounce shift register
reg  [11:0]  key1sr;	 // synchronizer and debounce shift register
reg  [11:0]  key2sr;	 // synchronizer and debounce shift register
reg  [11:0]  key3sr;	 // synchronizer and debounce shift register


// clock divider counter:
always @(posedge clock or posedge reset)
begin
  if ( reset )
  begin
    clkdiv <= 0;
  end
  else
  begin
    if ( clkdiv == TIME_BASE )		
	   clkdiv <= 0;
    else
	   clkdiv <= clkdiv + 1;
  end
end


// clock enable 100Hz
assign clken100hz = ( clkdiv == TIME_BASE ); 

// 2-stage input synchronizer and 
// 10-stage debounce shift register:
always @(posedge clock or posedge reset)
begin
  if ( reset )
  begin
    key0sr <= 0;
	 key1sr <= 0;
	 key2sr <= 0;
	 key3sr <= 0;
  end
  else
  begin
    if ( clken100hz )	  // shift right and load input key
	 begin
      key0sr <= (key0sr >> 1) | {key0in, 11'b0};
      key1sr <= (key1sr >> 1) | {key1in, 11'b0};
      key2sr <= (key2sr >> 1) | {key2in, 11'b0};
      key3sr <= (key3sr >> 1) | {key3in, 11'b0};
	 end
  end
end

// debounced key output:
// key0out is activated only when input is high for more than 40ms
assign key0out = & key0sr[9:6];
assign key1out = & key1sr[9:6];
assign key2out = & key2sr[9:6];
assign key3out = & key3sr[9:6];


endmodule

