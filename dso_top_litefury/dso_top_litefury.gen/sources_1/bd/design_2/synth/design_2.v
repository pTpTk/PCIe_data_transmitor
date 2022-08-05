//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
//Date        : Fri Aug  5 12:57:01 2022
//Host        : DESKTOP-OPS50DH running 64-bit major release  (build 9200)
//Command     : generate_target design_2.bd
//Design      : design_2
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_2,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_2,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=7,da_clkrst_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_2.hwdef" *) 
module design_2
   (clk_out,
    ref_clk,
    reset);
  output [0:0]clk_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.REF_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.REF_CLK, CLK_DOMAIN design_2_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input ref_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset;

  wire clk_wiz_0_clk_out1;
  wire ref_clk_1;
  wire reset_rtl_0_1;
  wire [0:0]util_ds_buf_0_BUFG_O;
  wire [0:0]util_ds_buf_1_BUFG_O;

  assign clk_out[0] = util_ds_buf_1_BUFG_O;
  assign ref_clk_1 = ref_clk;
  assign reset_rtl_0_1 = reset;
  design_2_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(util_ds_buf_0_BUFG_O),
        .clk_out1(clk_wiz_0_clk_out1),
        .resetn(reset_rtl_0_1));
  design_2_util_ds_buf_0_0 util_ds_buf_0
       (.BUFG_I(ref_clk_1),
        .BUFG_O(util_ds_buf_0_BUFG_O));
  design_2_util_ds_buf_0_1 util_ds_buf_1
       (.BUFG_I(clk_wiz_0_clk_out1),
        .BUFG_O(util_ds_buf_1_BUFG_O));
endmodule
