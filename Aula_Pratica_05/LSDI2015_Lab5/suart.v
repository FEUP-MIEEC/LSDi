//-------------------------------------------------------------------------------
//  Simple usart with fixed configuration: 
//  9600 baud, 1 start bit, 8 data bits, 1 stop bit, no parity
//  
//  jca@fe.up.pt
//  
//  PSD 2005/2006
//
//  Dec 6 - Corrected error withthe generation of stop bit when one byte
//          is transmitted right after the other.
//
//
//-------------------------------------------------------------------------------

`timescale 1ns/100ps

module suart  ( clock,  // master clock (50MHz)
                reset,  // master reset, assynchronous, active high
                tx,     // tx data
                rx,     // rx data
                txen,   // load data into transmit buffer and initiate a transmission
                txready,// ready to receive a new byte to tx
                rxready,// data is ready at dout port
                dout,   // data out (received data)
                din     // data in (data to transmit)
              );

input        clock, reset, txen;
input        rx;
output       tx;
output       txready, rxready;
input  [7:0] din;
output [7:0] dout;


// output registers:
reg           txready, rxready;
reg     [7:0] dout;
reg           tx;

reg           staterxbc, 
              statetxbc;
              
reg    [12:0] baudrxcount;
reg    [ 3:0] bitrxcount;
reg    [12:0] baudtxcount;
reg    [ 3:0] bittxcount;
reg           rx1, rx2, rx3;

reg    [8:0]  rxdata, txdata;

reg           staterx,
              statetx;

wire          baudrxclock;
wire          baudtxclock;
wire          startrxbit;
reg           starttxbit;


// State encoding for clock divider FSM:
parameter IDLE       = 1'b0,
          CNT10P     = 1'b1;


// State encoding for receive FSM
parameter IDLERX     = 1'b0,
          RXDATA     = 1'b1;

// State encoding for transmit FSM
parameter IDLETX     = 1'b0,
          TXDATA     = 1'b1;


// these are the baudrate clocks that synchronize the sampling of rx and tx data
// this is for baudarate=115200 and clock frequency=50MHz
//assign baudrxclock = (baudrxcount == 433);
//assign baudtxclock = (baudtxcount == 433);
assign baudrxclock = (baudrxcount == 433/2); // para clock=25MHz
assign baudtxclock = (baudtxcount == 433/2);

// clock generator for rx baudrate
// when startrxbit is asserted, initiate a 9600Hz clock 
// starting 5.21 us (1/2 period) after startrxbit;
always @(posedge clock or posedge reset)
begin
  if ( reset )
  begin
    baudrxcount <= 0;
    bitrxcount <= 0;
    staterxbc <= IDLE;
  end
  else
  begin
    case ( staterxbc )
      IDLE :        begin
                      bitrxcount <= 0;
                      if ( startrxbit )
                      begin
                        baudrxcount <= 217/2; // half period for 115200 baud
                        staterxbc <= CNT10P;
                      end
                      else
                      begin
                        staterxbc <= IDLE; // wait for startbit
                      end
                    end
                    
      CNT10P:       begin
                      if ( baudrxclock )
                      begin
                        if ( bitrxcount == 9 )
                        begin
                          staterxbc <= IDLE; // counts the 10th bit and stops
                        end
                        else
                        begin
                          staterxbc <= CNT10P;
                        end
                        
                        bitrxcount <= bitrxcount + 1; // counts bits up to 10
                        baudrxcount <= 0;
                      end
                      else
                        baudrxcount <= baudrxcount + 1; // increment baudrate counter
                    end
    endcase
  end
end


// clock generator for tx baudrate
// when starttxbit is asserted, initiate a 9600Hz clock 
// starting 5.21 us (1/2 period) after starttxbit;
always @(posedge clock or posedge reset)
begin
  if ( reset )
  begin
    baudtxcount <= 0;
    bittxcount <= 0;
    statetxbc <= IDLE;
  end
  else
  begin
    case ( statetxbc )
      IDLE :        begin
                      bittxcount <= 0;
                      if ( starttxbit )
                      begin
                        baudtxcount <= 217/2; // half period for 115200 baud
                        statetxbc <= CNT10P;
                      end
                      else
                      begin
                        statetxbc <= IDLE; // wait for startbit
                      end
                    end
                    
      CNT10P:       begin
                      if ( baudtxclock )
                      begin
                        if ( bittxcount == 10 )
                        begin
                          statetxbc <= IDLE; // counts the 10th bit and stops
                        end
                        else
                        begin
                          statetxbc <= CNT10P;
                        end
                        
                        bittxcount <= bittxcount + 1; // counts bits up to 10
                        baudtxcount <= 0;
                      end
                      else
                        baudtxcount <= baudtxcount + 1; // increment baudrate counter
                    end
    endcase
  end
end



// three stage synchonizer for rx input signal
always @(posedge clock or posedge reset)
begin
  if ( reset )
  begin
    rx1 <= 0;
    rx2 <= 0;
    rx3 <= 0;
  end
  else
  begin
    rx1 <= rx;
    rx2 <= rx1;
    rx3 <= rx2;
  end
end


// generate the startbit signal when the rx input changes from 1 to 0:
assign startrxbit = ( rx3 & ~rx2 ) & (bitrxcount == 0);


// input data shift-register
always @(posedge clock or posedge reset)
begin
  if ( reset )
  begin
    rxdata <= 0;
    staterx <= IDLERX;
    dout <= 0;
  end
  else
  begin
    case ( staterx )
      IDLERX:	begin // wait here for the start bit
                  rxready <= 0;
                  if ( startrxbit )
                    staterx <= RXDATA;
                  else
                    staterx <= IDLERX;
                end
                
      RXDATA:	begin
                  if ( baudrxclock ) // for each sampling point at baud clock
                  begin
                    if ( ( bitrxcount == 0 ) & (rx3 == 1'b1) ) // this was a false start bit, rx line is still high!
                      staterx <= IDLERX;
                    else
                    begin                       
                      rxdata <= {rx3, rxdata[8:1]}; // shift data in
                      if ( bitrxcount == 9 ) 
                      begin
                        if ( rx3 == 1'b0 ) // stop bit not detected
                          staterx <= IDLERX;
                        else
                        begin
                          dout <= rxdata[8:1];
                          rxready <= 1;
                          staterx <= IDLERX;
                        end
                      end
                    end
                  end
                end                
    endcase
  end
end


// output data shift-register
always @(posedge clock or posedge reset)
begin
  if ( reset )
  begin
    txdata <= 0;
    statetx <= IDLETX;
    starttxbit <= 0;
    txready <= 1;
    tx <= 1'b1;
  end
  else
  begin
    case ( statetx )
      IDLETX:	begin // wait here for entx
                  tx <= 1'b1;
                  if ( txen )
                  begin
                    statetx <= TXDATA;
                    txdata <= {1'b1,din}; // concatenate 1 stop bit
                    txready <= 0;
                    starttxbit <= 1;
                  end
                  else
                    statetx <= IDLETX;
                end
                
      TXDATA:	begin
                  starttxbit <= 0;
                  if ( baudtxclock ) // for each sampling point at baud clock
                  begin
                    if ( bittxcount == 0 )
                      tx <= 1'b0; // startbit
                    else
                    begin                       
                      if ( bittxcount == 10 ) 
                      begin
                        tx <= 1'b1; // stop bit
                        txready <= 1;
                        statetx <= IDLETX;
                      end
                      else
                      begin
                        tx <= txdata[0]; // databits, starting with LSB
                        txdata <= {1'b1, txdata[8:1]}; // shift right, enter 1 at left
                      end
                    end
                  end
                end                
    endcase
  end
end



endmodule

