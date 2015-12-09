/*
  Universal command interpreter
  
  VERSAO QUE FUNCIONA
 
 jca@fe.up.pt, Nov 2006 - PSDI 2006/2007
 */
`timescale 1ns/100ps

module unisepa( clk,    // master clock 
                reset,  // master reset, assynchronous, active high
                load,   // load enable for din bus
                ready,  // ready to consume dout data
                enout,  // enable loading of dout data
                datain, // data in bus (8 bits)
                dataout,// data out bus (8 bits)
                Ain,    // A input port (16 bits)
                Bin,    // B input port (16 bits)
                Cin,    // C input port (16 bits)
                Din,    // D input port (16 bits)
                Aout,   // A output port (16 bits)
                Bout,   // B output port (16 bits)
                Cout,   // C output port (16 bits)
                Dout,   // D output port (16 bits)
					 pulse0,
					 pulse1
              );

input        clk, reset, load, ready;
output       enout;
input  [7:0] datain;
output [7:0] dataout;

input  [15:0] Ain, Bin, Cin, Din;
output [15:0] Aout, Bout, Cout, Dout;

output pulse0, pulse1;

assign pulse0 = 1'b0, pulse1 = 1'b0;


// Registers:
reg    [5:0]  state;
reg    [15:0] Aout, Bout, Cout, Dout;
reg    [7:0]  dataout;
reg    [7:0]  byteH, byteL;

reg           enout;
reg    [1:0]  address;
reg    [15:0] datatoout;

reg    [7:0]  wdata;
reg    [8:0]  addr;
reg           start;


// State encoding:
parameter IDLE       = 6'd0,
          WRITECMD   = 6'd1,
          WRITECMD2  = 6'd2,
          READCMD    = 6'd3,
          READCMD2   = 6'd4,
          READCMD3   = 6'd5,
          READCMD4   = 6'd6;


          
// Commands:
parameter RESET      = 4'b0001,
          WRITE      = 4'b0010,
          READ       = 4'b0011,
			 RWBYTE     = 4'b1111, // read/write one byte
		    REPROG     = 4'b0101, // cycle PROG line high - low - high
          SENDBITS   = 4'b1010, // receive a buffer wth bytes and send bits to Fdin...
			 WRITEREAD  = 4'b1100; // implementa a função writeread: recebe 2 bytes e envia pela PP e envia 2 bytes recolhidods da PP

always @(posedge clk or posedge reset)
begin
  if ( reset )
  begin
    Aout <= 0;
    Bout <= 0;
    Cout <= 0;
    Dout <= 0;
    enout <= 0;
	byteH <= 0;
	byteL <= 0;
	state <= 0;
   address <= 0;
  end
  else
  begin

    case ( state )
      IDLE :        begin
                      start <= 1'b0;
                      if ( load )
                      begin
                        case ( datain[7:4] ) // which command?
                          RESET : begin
                                    Aout <= 0;
                                    Bout <= 0;
                                    Cout <= 0;
                                    Dout <= 0;
                                    enout <= 0;
												address <= 0;
                                    state <= IDLE;
                                  end
                          WRITE : begin
                                    address <= datain[1:0]; // address of port
                                    state <= WRITECMD;
                                  end
                          READ  : begin
                                    case ( datain[1:0] )
                                      0: datatoout <= Ain;
                                      1: datatoout <= Bin;
                                      2: datatoout <= Cin;
                                      3: datatoout <= Din;
                                    endcase
                                    state <= READCMD;
                                  end
                        endcase
                      end
                      else
                      begin
                        state <= IDLE;
                      end
                    end
                    
      WRITECMD:     begin
                     if ( load )           // MSbyte arrived
                     begin
                       byteH <= datain;       // load byte high
                       state <= WRITECMD2;
                     end
                     else
                     begin
                       state <= WRITECMD;  // keep waiting for MS byte
                     end
                    end
                    
      WRITECMD2   : begin
                     if ( load )           // LSbyte arrived
                     begin
                       case ( address )
                         0 : Aout <= {byteH, datain};
                         1 : Bout <= {byteH, datain};
                         2 : Cout <= {byteH, datain};
                         3 : Dout <= {byteH, datain};
                       endcase
                       state <= IDLE;
                     end
                     else
                     begin
                       state <= WRITECMD2;  // keep waiting for LS byte
                     end
                    end
                    
      READCMD     : begin
                      if ( ready )
                      begin
                        dataout <= datatoout[15:8]; // output MSbyte
                        enout <= 1;
                        state <= READCMD2;
                      end
                      else
                      begin
                        enout <= 0;
                        state <= READCMD;  // wait for ready
                      end
                    end
                    
      READCMD2    : begin              // wait for ready low
                      if ( ready )
                      begin
                        enout <= 1;    // keep enout active until ready is deasserted
                        state <= READCMD2;
                      end
                      else
                      begin
                        enout <= 0;
                        state <= READCMD3;
                      end
                    end
                      
      READCMD3    : begin
                      if ( ready )
                      begin
                        dataout <= datatoout[7:0]; // output LSbyte
                        enout <= 1;
                        state <= READCMD4;
                      end
                      else
                      begin
                        enout <= 0;
                        state <= READCMD3;  // wait for ready
                      end
                    end
                    
      READCMD4    : begin              // wait for ready low
                      if ( ready )
                      begin
                        enout <= 1;    // keep enout active until ready is deasserted
                        state <= READCMD4;
                      end
                      else
                      begin
                        enout <= 0;
                        state <= IDLE;
                      end
                    end
						  

      default     : begin
                      state <= IDLE;
                    end
    endcase
  end
end


endmodule

