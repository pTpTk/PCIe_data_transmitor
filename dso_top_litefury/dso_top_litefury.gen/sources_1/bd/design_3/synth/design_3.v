//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Thu Aug 11 14:56:35 2022
//Host        : DESKTOP-DTL1MCC running 64-bit major release  (build 9200)
//Command     : generate_target design_3.bd
//Design      : design_3
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_3,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_3.hwdef" *) 
module design_3
   (buf_i,
    buf_o);
  input buf_i;
  output [0:0]buf_o;

  wire buf_i_1;
  wire [0:0]util_ds_buf_0_BUFG_O;

  assign buf_i_1 = buf_i;
  assign buf_o[0] = util_ds_buf_0_BUFG_O;
  design_3_util_ds_buf_0_0 util_ds_buf_0
       (.BUFG_I(buf_i_1),
        .BUFG_O(util_ds_buf_0_BUFG_O));
endmodule
