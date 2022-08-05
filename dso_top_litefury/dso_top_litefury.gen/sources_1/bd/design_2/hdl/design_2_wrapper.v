//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
//Date        : Fri Aug  5 12:57:01 2022
//Host        : DESKTOP-OPS50DH running 64-bit major release  (build 9200)
//Command     : generate_target design_2_wrapper.bd
//Design      : design_2_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_2_wrapper
   (clk_out,
    ref_clk,
    reset);
  output [0:0]clk_out;
  input ref_clk;
  input reset;

  wire [0:0]clk_out;
  wire ref_clk;
  wire reset;

  design_2 design_2_i
       (.clk_out(clk_out),
        .ref_clk(ref_clk),
        .reset(reset));
endmodule
