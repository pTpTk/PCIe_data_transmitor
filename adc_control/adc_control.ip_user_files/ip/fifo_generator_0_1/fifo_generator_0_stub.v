// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Thu Aug 11 11:04:17 2022
// Host        : DESKTOP-DTL1MCC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/AnotherWorkstation/Documents/LiteFury/dso_top_litefury/dso_top_litefury.runs/fifo_generator_0_synth_1/fifo_generator_0_stub.v
// Design      : fifo_generator_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.1" *)
module fifo_generator_0(wr_clk, wr_rst, rd_clk, rd_rst, din, wr_en, rd_en, 
  dout, full, empty)
/* synthesis syn_black_box black_box_pad_pin="wr_clk,wr_rst,rd_clk,rd_rst,din[31:0],wr_en,rd_en,dout[127:0],full,empty" */;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [31:0]din;
  input wr_en;
  input rd_en;
  output [127:0]dout;
  output full;
  output empty;
endmodule
