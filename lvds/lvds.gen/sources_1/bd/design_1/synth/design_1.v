//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Tue Aug 16 17:11:21 2022
//Host        : DESKTOP-DTL1MCC running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk,
    clk_div,
    diff_clk_n,
    diff_clk_p);
  output [0:0]clk;
  output [0:0]clk_div;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 diff " *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME diff, CAN_DEBUG false, FREQ_HZ 100000000" *) input [0:0]diff_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 diff " *) input [0:0]diff_clk_p;

  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out2;
  wire [0:0]diff_clock_rtl_0_1_CLK_N;
  wire [0:0]diff_clock_rtl_0_1_CLK_P;
  wire [0:0]util_ds_buf_0_IBUF_OUT;
  wire [0:0]util_ds_buf_1_BUFG_O;
  wire [0:0]util_ds_buf_2_BUFG_O;
  wire [0:0]util_ds_buf_3_BUFG_O;

  assign clk[0] = util_ds_buf_1_BUFG_O;
  assign clk_div[0] = util_ds_buf_2_BUFG_O;
  assign diff_clock_rtl_0_1_CLK_N = diff_clk_n[0];
  assign diff_clock_rtl_0_1_CLK_P = diff_clk_p[0];
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(util_ds_buf_3_BUFG_O),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out2(clk_wiz_0_clk_out2));
  design_1_util_ds_buf_0_0 util_ds_buf_0
       (.IBUF_DS_N(diff_clock_rtl_0_1_CLK_N),
        .IBUF_DS_P(diff_clock_rtl_0_1_CLK_P),
        .IBUF_OUT(util_ds_buf_0_IBUF_OUT));
  design_1_util_ds_buf_1_0 util_ds_buf_1
       (.BUFG_I(clk_wiz_0_clk_out1),
        .BUFG_O(util_ds_buf_1_BUFG_O));
  design_1_util_ds_buf_2_0 util_ds_buf_2
       (.BUFG_I(clk_wiz_0_clk_out2),
        .BUFG_O(util_ds_buf_2_BUFG_O));
  design_1_util_ds_buf_1_1 util_ds_buf_3
       (.BUFG_I(util_ds_buf_0_IBUF_OUT),
        .BUFG_O(util_ds_buf_3_BUFG_O));
endmodule
