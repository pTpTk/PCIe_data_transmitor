//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Fri Aug 12 11:40:50 2022
//Host        : DESKTOP-DTL1MCC running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (S01_ARESETN,
    axi_aclk,
    axi_aresetn,
    gpio2_io_i,
    gpio_io_o_0,
    hsync_count,
    pcie_clk_n,
    pcie_clk_p,
    pcie_mgt_rxn,
    pcie_mgt_rxp,
    pcie_mgt_txn,
    pcie_mgt_txp,
    pcie_perstn,
    s2mm_err,
    s2mm_halt,
    s2mm_wr_xfer_cmplt,
    sys_clk,
    vsync_count);
  input S01_ARESETN;
  output axi_aclk;
  output axi_aresetn;
  input [31:0]gpio2_io_i;
  output [31:0]gpio_io_o_0;
  output [31:0]hsync_count;
  input [0:0]pcie_clk_n;
  input [0:0]pcie_clk_p;
  input [3:0]pcie_mgt_rxn;
  input [3:0]pcie_mgt_rxp;
  output [3:0]pcie_mgt_txn;
  output [3:0]pcie_mgt_txp;
  input pcie_perstn;
  output s2mm_err;
  input s2mm_halt;
  output s2mm_wr_xfer_cmplt;
  output [0:0]sys_clk;
  output [31:0]vsync_count;

  wire S01_ARESETN;
  wire axi_aclk;
  wire axi_aresetn;
  wire [31:0]gpio2_io_i;
  wire [31:0]gpio_io_o_0;
  wire [31:0]hsync_count;
  wire [0:0]pcie_clk_n;
  wire [0:0]pcie_clk_p;
  wire [3:0]pcie_mgt_rxn;
  wire [3:0]pcie_mgt_rxp;
  wire [3:0]pcie_mgt_txn;
  wire [3:0]pcie_mgt_txp;
  wire pcie_perstn;
  wire s2mm_err;
  wire s2mm_halt;
  wire s2mm_wr_xfer_cmplt;
  wire [0:0]sys_clk;
  wire [31:0]vsync_count;

  design_1 design_1_i
       (.S01_ARESETN(S01_ARESETN),
        .axi_aclk(axi_aclk),
        .axi_aresetn(axi_aresetn),
        .gpio2_io_i(gpio2_io_i),
        .gpio_io_o_0(gpio_io_o_0),
        .hsync_count(hsync_count),
        .pcie_clk_n(pcie_clk_n),
        .pcie_clk_p(pcie_clk_p),
        .pcie_mgt_rxn(pcie_mgt_rxn),
        .pcie_mgt_rxp(pcie_mgt_rxp),
        .pcie_mgt_txn(pcie_mgt_txn),
        .pcie_mgt_txp(pcie_mgt_txp),
        .pcie_perstn(pcie_perstn),
        .s2mm_err(s2mm_err),
        .s2mm_halt(s2mm_halt),
        .s2mm_wr_xfer_cmplt(s2mm_wr_xfer_cmplt),
        .sys_clk(sys_clk),
        .vsync_count(vsync_count));
endmodule
