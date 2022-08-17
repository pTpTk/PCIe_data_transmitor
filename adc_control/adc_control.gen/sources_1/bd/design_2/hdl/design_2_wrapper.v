//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Wed Aug 10 17:19:29 2022
//Host        : DESKTOP-DTL1MCC running 64-bit major release  (build 9200)
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
