//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Tue Aug 16 17:11:21 2022
//Host        : DESKTOP-DTL1MCC running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk,
    clk_div,
    diff_clk_n,
    diff_clk_p);
  output [0:0]clk;
  output [0:0]clk_div;
  input [0:0]diff_clk_n;
  input [0:0]diff_clk_p;

  wire [0:0]clk;
  wire [0:0]clk_div;
  wire [0:0]diff_clk_n;
  wire [0:0]diff_clk_p;

  design_1 design_1_i
       (.clk(clk),
        .clk_div(clk_div),
        .diff_clk_n(diff_clk_n),
        .diff_clk_p(diff_clk_p));
endmodule
