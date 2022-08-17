//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Fri Aug 12 14:03:10 2022
//Host        : DESKTOP-DTL1MCC running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk_out,
    diff_clock_clk_n,
    diff_clock_clk_p);
  output [0:0]clk_out;
  input [0:0]diff_clock_clk_n;
  input [0:0]diff_clock_clk_p;

  wire [0:0]clk_out;
  wire [0:0]diff_clock_clk_n;
  wire [0:0]diff_clock_clk_p;

  design_1 design_1_i
       (.clk_out(clk_out),
        .diff_clock_clk_n(diff_clock_clk_n),
        .diff_clock_clk_p(diff_clock_clk_p));
endmodule
