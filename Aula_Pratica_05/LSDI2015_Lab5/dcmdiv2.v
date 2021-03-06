////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2006 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 8.2i
//  \   \         Application : xaw2verilog
//  /   /         Filename : dcmdiv2.v
// /___/   /\     Timestamp : 10/09/2006 10:46:45
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: xaw2verilog -st D:\usr\jca\FEUP\psd2006\projectos\dcam\xilinx\dcam_v1\dcmdiv2.xaw D:\usr\jca\FEUP\psd2006\projectos\dcam\xilinx\dcam_v1\dcmdiv2
//Design Name: dcmdiv2
//Device: xc3s200-ft256-5
//
// Module dcmdiv2
// Generated by Xilinx Architecture Wizard
// Written for synthesis tool: XST
`timescale 1ns / 1ps

module dcmdiv2(CLKIN_IN, 
               CLKIN_IBUFG_OUT, 
               CLK0_OUT, 
               CLK180_OUT);

    input CLKIN_IN;
   output CLKIN_IBUFG_OUT;
   output CLK0_OUT;
   output CLK180_OUT;
   
   wire CLKFB_IN;
   wire CLKIN_IBUFG;
   wire CLK0_BUF;
   wire CLK180_BUF;
   wire GND1;
   
   assign GND1 = 0;
   assign CLKIN_IBUFG_OUT = CLKIN_IBUFG;
   assign CLK0_OUT = CLKFB_IN;
   IBUFG CLKIN_IBUFG_INST (.I(CLKIN_IN), 
                           .O(CLKIN_IBUFG));
   BUFG CLK0_BUFG_INST (.I(CLK0_BUF), 
                        .O(CLKFB_IN));
   BUFG CLK180_BUFG_INST (.I(CLK180_BUF), 
                          .O(CLK180_OUT));
   DCM DCM_INST (.CLKFB(CLKFB_IN), 
                 .CLKIN(CLKIN_IBUFG), 
                 .DSSEN(GND1), 
                 .PSCLK(GND1), 
                 .PSEN(GND1), 
                 .PSINCDEC(GND1), 
                 .RST(GND1), 
                 .CLKDV(), 
                 .CLKFX(), 
                 .CLKFX180(), 
                 .CLK0(CLK0_BUF), 
                 .CLK2X(), 
                 .CLK2X180(), 
                 .CLK90(), 
                 .CLK180(CLK180_BUF), 
                 .CLK270(), 
                 .LOCKED(), 
                 .PSDONE(), 
                 .STATUS());
   defparam DCM_INST.CLK_FEEDBACK = "1X";
   defparam DCM_INST.CLKDV_DIVIDE = 2.0;
   defparam DCM_INST.CLKFX_DIVIDE = 1;
   defparam DCM_INST.CLKFX_MULTIPLY = 4;
   defparam DCM_INST.CLKIN_DIVIDE_BY_2 = "TRUE";
   defparam DCM_INST.CLKIN_PERIOD = 40.0;
   defparam DCM_INST.CLKOUT_PHASE_SHIFT = "NONE";
   defparam DCM_INST.DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS";
   defparam DCM_INST.DFS_FREQUENCY_MODE = "LOW";
   defparam DCM_INST.DLL_FREQUENCY_MODE = "LOW";
   defparam DCM_INST.DUTY_CYCLE_CORRECTION = "TRUE";
   defparam DCM_INST.FACTORY_JF = 16'hC080;
   defparam DCM_INST.PHASE_SHIFT = 0;
   defparam DCM_INST.STARTUP_WAIT = "TRUE";
endmodule
