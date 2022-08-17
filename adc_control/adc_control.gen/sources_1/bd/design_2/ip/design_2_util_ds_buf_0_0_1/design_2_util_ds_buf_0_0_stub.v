// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
// Date        : Thu Aug 11 11:52:36 2022
// Host        : DESKTOP-DTL1MCC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/AnotherWorkstation/Documents/LiteFury/dso_top_litefury/dso_top_litefury.gen/sources_1/bd/design_2/ip/design_2_util_ds_buf_0_0_1/design_2_util_ds_buf_0_0_stub.v
// Design      : design_2_util_ds_buf_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "util_ds_buf,Vivado 2022.1" *)
module design_2_util_ds_buf_0_0(BUFG_I, BUFG_O)
/* synthesis syn_black_box black_box_pad_pin="BUFG_I[0:0],BUFG_O[0:0]" */;
  input [0:0]BUFG_I;
  output [0:0]BUFG_O;
endmodule
