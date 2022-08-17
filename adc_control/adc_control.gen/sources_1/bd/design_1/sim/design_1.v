//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (win64) Build 3526262 Mon Apr 18 15:48:16 MDT 2022
//Date        : Fri Aug 12 11:40:50 2022
//Host        : DESKTOP-DTL1MCC running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module AXI_LITE_IO_imp_1879I2S
   (S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    axi_aclk,
    axi_resetn,
    gpio2_io_i,
    gpio_io_o_0,
    hsync_count,
    vsync_count);
  input [31:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output [0:0]S00_AXI_arready;
  input [0:0]S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output [0:0]S00_AXI_awready;
  input [0:0]S00_AXI_awvalid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;
  input axi_aclk;
  input axi_resetn;
  input [31:0]gpio2_io_i;
  output [31:0]gpio_io_o_0;
  output [31:0]hsync_count;
  output [31:0]vsync_count;

  wire [31:0]S00_AXI_1_ARADDR;
  wire [2:0]S00_AXI_1_ARPROT;
  wire [0:0]S00_AXI_1_ARREADY;
  wire [0:0]S00_AXI_1_ARVALID;
  wire [31:0]S00_AXI_1_AWADDR;
  wire [2:0]S00_AXI_1_AWPROT;
  wire [0:0]S00_AXI_1_AWREADY;
  wire [0:0]S00_AXI_1_AWVALID;
  wire [0:0]S00_AXI_1_BREADY;
  wire [1:0]S00_AXI_1_BRESP;
  wire [0:0]S00_AXI_1_BVALID;
  wire [31:0]S00_AXI_1_RDATA;
  wire [0:0]S00_AXI_1_RREADY;
  wire [1:0]S00_AXI_1_RRESP;
  wire [0:0]S00_AXI_1_RVALID;
  wire [31:0]S00_AXI_1_WDATA;
  wire [0:0]S00_AXI_1_WREADY;
  wire [3:0]S00_AXI_1_WSTRB;
  wire [0:0]S00_AXI_1_WVALID;
  wire axi_aclk_1;
  wire [31:0]axi_crossbar_0_M00_AXI_ARADDR;
  wire axi_crossbar_0_M00_AXI_ARREADY;
  wire [0:0]axi_crossbar_0_M00_AXI_ARVALID;
  wire [31:0]axi_crossbar_0_M00_AXI_AWADDR;
  wire axi_crossbar_0_M00_AXI_AWREADY;
  wire [0:0]axi_crossbar_0_M00_AXI_AWVALID;
  wire [0:0]axi_crossbar_0_M00_AXI_BREADY;
  wire [1:0]axi_crossbar_0_M00_AXI_BRESP;
  wire axi_crossbar_0_M00_AXI_BVALID;
  wire [31:0]axi_crossbar_0_M00_AXI_RDATA;
  wire [0:0]axi_crossbar_0_M00_AXI_RREADY;
  wire [1:0]axi_crossbar_0_M00_AXI_RRESP;
  wire axi_crossbar_0_M00_AXI_RVALID;
  wire [31:0]axi_crossbar_0_M00_AXI_WDATA;
  wire axi_crossbar_0_M00_AXI_WREADY;
  wire [3:0]axi_crossbar_0_M00_AXI_WSTRB;
  wire [0:0]axi_crossbar_0_M00_AXI_WVALID;
  wire [63:32]axi_crossbar_0_M01_AXI_ARADDR;
  wire axi_crossbar_0_M01_AXI_ARREADY;
  wire [1:1]axi_crossbar_0_M01_AXI_ARVALID;
  wire [63:32]axi_crossbar_0_M01_AXI_AWADDR;
  wire axi_crossbar_0_M01_AXI_AWREADY;
  wire [1:1]axi_crossbar_0_M01_AXI_AWVALID;
  wire [1:1]axi_crossbar_0_M01_AXI_BREADY;
  wire [1:0]axi_crossbar_0_M01_AXI_BRESP;
  wire axi_crossbar_0_M01_AXI_BVALID;
  wire [31:0]axi_crossbar_0_M01_AXI_RDATA;
  wire [1:1]axi_crossbar_0_M01_AXI_RREADY;
  wire [1:0]axi_crossbar_0_M01_AXI_RRESP;
  wire axi_crossbar_0_M01_AXI_RVALID;
  wire [63:32]axi_crossbar_0_M01_AXI_WDATA;
  wire axi_crossbar_0_M01_AXI_WREADY;
  wire [7:4]axi_crossbar_0_M01_AXI_WSTRB;
  wire [1:1]axi_crossbar_0_M01_AXI_WVALID;
  wire [31:0]axi_gpio_0_gpio_io_o;
  wire [31:0]axi_gpio_1_gpio2_io_o;
  wire [31:0]axi_gpio_1_gpio_io_o;
  wire axi_resetn_1;
  wire [31:0]gpio2_io_i_1;

  assign S00_AXI_1_ARADDR = S00_AXI_araddr[31:0];
  assign S00_AXI_1_ARPROT = S00_AXI_arprot[2:0];
  assign S00_AXI_1_ARVALID = S00_AXI_arvalid[0];
  assign S00_AXI_1_AWADDR = S00_AXI_awaddr[31:0];
  assign S00_AXI_1_AWPROT = S00_AXI_awprot[2:0];
  assign S00_AXI_1_AWVALID = S00_AXI_awvalid[0];
  assign S00_AXI_1_BREADY = S00_AXI_bready[0];
  assign S00_AXI_1_RREADY = S00_AXI_rready[0];
  assign S00_AXI_1_WDATA = S00_AXI_wdata[31:0];
  assign S00_AXI_1_WSTRB = S00_AXI_wstrb[3:0];
  assign S00_AXI_1_WVALID = S00_AXI_wvalid[0];
  assign S00_AXI_arready[0] = S00_AXI_1_ARREADY;
  assign S00_AXI_awready[0] = S00_AXI_1_AWREADY;
  assign S00_AXI_bresp[1:0] = S00_AXI_1_BRESP;
  assign S00_AXI_bvalid[0] = S00_AXI_1_BVALID;
  assign S00_AXI_rdata[31:0] = S00_AXI_1_RDATA;
  assign S00_AXI_rresp[1:0] = S00_AXI_1_RRESP;
  assign S00_AXI_rvalid[0] = S00_AXI_1_RVALID;
  assign S00_AXI_wready[0] = S00_AXI_1_WREADY;
  assign axi_aclk_1 = axi_aclk;
  assign axi_resetn_1 = axi_resetn;
  assign gpio2_io_i_1 = gpio2_io_i[31:0];
  assign gpio_io_o_0[31:0] = axi_gpio_0_gpio_io_o;
  assign hsync_count[31:0] = axi_gpio_1_gpio2_io_o;
  assign vsync_count[31:0] = axi_gpio_1_gpio_io_o;
  design_1_axi_crossbar_0_0 axi_crossbar_0
       (.aclk(axi_aclk_1),
        .aresetn(axi_resetn_1),
        .m_axi_araddr({axi_crossbar_0_M01_AXI_ARADDR,axi_crossbar_0_M00_AXI_ARADDR}),
        .m_axi_arready({axi_crossbar_0_M01_AXI_ARREADY,axi_crossbar_0_M00_AXI_ARREADY}),
        .m_axi_arvalid({axi_crossbar_0_M01_AXI_ARVALID,axi_crossbar_0_M00_AXI_ARVALID}),
        .m_axi_awaddr({axi_crossbar_0_M01_AXI_AWADDR,axi_crossbar_0_M00_AXI_AWADDR}),
        .m_axi_awready({axi_crossbar_0_M01_AXI_AWREADY,axi_crossbar_0_M00_AXI_AWREADY}),
        .m_axi_awvalid({axi_crossbar_0_M01_AXI_AWVALID,axi_crossbar_0_M00_AXI_AWVALID}),
        .m_axi_bready({axi_crossbar_0_M01_AXI_BREADY,axi_crossbar_0_M00_AXI_BREADY}),
        .m_axi_bresp({axi_crossbar_0_M01_AXI_BRESP,axi_crossbar_0_M00_AXI_BRESP}),
        .m_axi_bvalid({axi_crossbar_0_M01_AXI_BVALID,axi_crossbar_0_M00_AXI_BVALID}),
        .m_axi_rdata({axi_crossbar_0_M01_AXI_RDATA,axi_crossbar_0_M00_AXI_RDATA}),
        .m_axi_rready({axi_crossbar_0_M01_AXI_RREADY,axi_crossbar_0_M00_AXI_RREADY}),
        .m_axi_rresp({axi_crossbar_0_M01_AXI_RRESP,axi_crossbar_0_M00_AXI_RRESP}),
        .m_axi_rvalid({axi_crossbar_0_M01_AXI_RVALID,axi_crossbar_0_M00_AXI_RVALID}),
        .m_axi_wdata({axi_crossbar_0_M01_AXI_WDATA,axi_crossbar_0_M00_AXI_WDATA}),
        .m_axi_wready({axi_crossbar_0_M01_AXI_WREADY,axi_crossbar_0_M00_AXI_WREADY}),
        .m_axi_wstrb({axi_crossbar_0_M01_AXI_WSTRB,axi_crossbar_0_M00_AXI_WSTRB}),
        .m_axi_wvalid({axi_crossbar_0_M01_AXI_WVALID,axi_crossbar_0_M00_AXI_WVALID}),
        .s_axi_araddr(S00_AXI_1_ARADDR),
        .s_axi_arprot(S00_AXI_1_ARPROT),
        .s_axi_arready(S00_AXI_1_ARREADY),
        .s_axi_arvalid(S00_AXI_1_ARVALID),
        .s_axi_awaddr(S00_AXI_1_AWADDR),
        .s_axi_awprot(S00_AXI_1_AWPROT),
        .s_axi_awready(S00_AXI_1_AWREADY),
        .s_axi_awvalid(S00_AXI_1_AWVALID),
        .s_axi_bready(S00_AXI_1_BREADY),
        .s_axi_bresp(S00_AXI_1_BRESP),
        .s_axi_bvalid(S00_AXI_1_BVALID),
        .s_axi_rdata(S00_AXI_1_RDATA),
        .s_axi_rready(S00_AXI_1_RREADY),
        .s_axi_rresp(S00_AXI_1_RRESP),
        .s_axi_rvalid(S00_AXI_1_RVALID),
        .s_axi_wdata(S00_AXI_1_WDATA),
        .s_axi_wready(S00_AXI_1_WREADY),
        .s_axi_wstrb(S00_AXI_1_WSTRB),
        .s_axi_wvalid(S00_AXI_1_WVALID));
  design_1_axi_gpio_0_1 axi_gpio_0
       (.gpio2_io_i(gpio2_io_i_1),
        .gpio_io_o(axi_gpio_0_gpio_io_o),
        .s_axi_aclk(axi_aclk_1),
        .s_axi_araddr(axi_crossbar_0_M01_AXI_ARADDR[40:32]),
        .s_axi_aresetn(axi_resetn_1),
        .s_axi_arready(axi_crossbar_0_M01_AXI_ARREADY),
        .s_axi_arvalid(axi_crossbar_0_M01_AXI_ARVALID),
        .s_axi_awaddr(axi_crossbar_0_M01_AXI_AWADDR[40:32]),
        .s_axi_awready(axi_crossbar_0_M01_AXI_AWREADY),
        .s_axi_awvalid(axi_crossbar_0_M01_AXI_AWVALID),
        .s_axi_bready(axi_crossbar_0_M01_AXI_BREADY),
        .s_axi_bresp(axi_crossbar_0_M01_AXI_BRESP),
        .s_axi_bvalid(axi_crossbar_0_M01_AXI_BVALID),
        .s_axi_rdata(axi_crossbar_0_M01_AXI_RDATA),
        .s_axi_rready(axi_crossbar_0_M01_AXI_RREADY),
        .s_axi_rresp(axi_crossbar_0_M01_AXI_RRESP),
        .s_axi_rvalid(axi_crossbar_0_M01_AXI_RVALID),
        .s_axi_wdata(axi_crossbar_0_M01_AXI_WDATA),
        .s_axi_wready(axi_crossbar_0_M01_AXI_WREADY),
        .s_axi_wstrb(axi_crossbar_0_M01_AXI_WSTRB),
        .s_axi_wvalid(axi_crossbar_0_M01_AXI_WVALID));
  design_1_axi_gpio_0_2 axi_gpio_1
       (.gpio2_io_o(axi_gpio_1_gpio2_io_o),
        .gpio_io_o(axi_gpio_1_gpio_io_o),
        .s_axi_aclk(axi_aclk_1),
        .s_axi_araddr(axi_crossbar_0_M00_AXI_ARADDR[8:0]),
        .s_axi_aresetn(axi_resetn_1),
        .s_axi_arready(axi_crossbar_0_M00_AXI_ARREADY),
        .s_axi_arvalid(axi_crossbar_0_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_crossbar_0_M00_AXI_AWADDR[8:0]),
        .s_axi_awready(axi_crossbar_0_M00_AXI_AWREADY),
        .s_axi_awvalid(axi_crossbar_0_M00_AXI_AWVALID),
        .s_axi_bready(axi_crossbar_0_M00_AXI_BREADY),
        .s_axi_bresp(axi_crossbar_0_M00_AXI_BRESP),
        .s_axi_bvalid(axi_crossbar_0_M00_AXI_BVALID),
        .s_axi_rdata(axi_crossbar_0_M00_AXI_RDATA),
        .s_axi_rready(axi_crossbar_0_M00_AXI_RREADY),
        .s_axi_rresp(axi_crossbar_0_M00_AXI_RRESP),
        .s_axi_rvalid(axi_crossbar_0_M00_AXI_RVALID),
        .s_axi_wdata(axi_crossbar_0_M00_AXI_WDATA),
        .s_axi_wready(axi_crossbar_0_M00_AXI_WREADY),
        .s_axi_wstrb(axi_crossbar_0_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_crossbar_0_M00_AXI_WVALID));
endmodule

module PCIe_imp_ZJ4W1S
   (M_AXI_LITE_araddr,
    M_AXI_LITE_arprot,
    M_AXI_LITE_arready,
    M_AXI_LITE_arvalid,
    M_AXI_LITE_awaddr,
    M_AXI_LITE_awprot,
    M_AXI_LITE_awready,
    M_AXI_LITE_awvalid,
    M_AXI_LITE_bready,
    M_AXI_LITE_bresp,
    M_AXI_LITE_bvalid,
    M_AXI_LITE_rdata,
    M_AXI_LITE_rready,
    M_AXI_LITE_rresp,
    M_AXI_LITE_rvalid,
    M_AXI_LITE_wdata,
    M_AXI_LITE_wready,
    M_AXI_LITE_wstrb,
    M_AXI_LITE_wvalid,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    axi_aclk,
    axi_aresetn,
    pcie_clk_n,
    pcie_clk_p,
    pcie_mgt_rxn,
    pcie_mgt_rxp,
    pcie_mgt_txn,
    pcie_mgt_txp,
    pcie_perstn,
    sys_clk);
  output [31:0]M_AXI_LITE_araddr;
  output [2:0]M_AXI_LITE_arprot;
  input [0:0]M_AXI_LITE_arready;
  output [0:0]M_AXI_LITE_arvalid;
  output [31:0]M_AXI_LITE_awaddr;
  output [2:0]M_AXI_LITE_awprot;
  input [0:0]M_AXI_LITE_awready;
  output [0:0]M_AXI_LITE_awvalid;
  output [0:0]M_AXI_LITE_bready;
  input [1:0]M_AXI_LITE_bresp;
  input [0:0]M_AXI_LITE_bvalid;
  input [31:0]M_AXI_LITE_rdata;
  output [0:0]M_AXI_LITE_rready;
  input [1:0]M_AXI_LITE_rresp;
  input [0:0]M_AXI_LITE_rvalid;
  output [31:0]M_AXI_LITE_wdata;
  input [0:0]M_AXI_LITE_wready;
  output [3:0]M_AXI_LITE_wstrb;
  output [0:0]M_AXI_LITE_wvalid;
  output M_AXI_araddr;
  output M_AXI_arburst;
  output M_AXI_arcache;
  output M_AXI_arid;
  output M_AXI_arlen;
  output M_AXI_arlock;
  output M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arsize;
  output M_AXI_arvalid;
  output M_AXI_awaddr;
  output M_AXI_awburst;
  output M_AXI_awcache;
  output M_AXI_awid;
  output M_AXI_awlen;
  output M_AXI_awlock;
  output M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awsize;
  output M_AXI_awvalid;
  input M_AXI_bid;
  output M_AXI_bready;
  input M_AXI_bresp;
  input M_AXI_bvalid;
  input M_AXI_rdata;
  input M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input M_AXI_rresp;
  input M_AXI_rvalid;
  output M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output M_AXI_wstrb;
  output M_AXI_wvalid;
  output axi_aclk;
  output axi_aresetn;
  input [0:0]pcie_clk_n;
  input [0:0]pcie_clk_p;
  input [3:0]pcie_mgt_rxn;
  input [3:0]pcie_mgt_rxp;
  output [3:0]pcie_mgt_txn;
  output [3:0]pcie_mgt_txp;
  input pcie_perstn;
  output [0:0]sys_clk;

  wire [0:0]CLK_IN_D_0_1_CLK_N;
  wire [0:0]CLK_IN_D_0_1_CLK_P;
  wire [31:0]PCIe_M_AXI_LITE_ARADDR;
  wire [2:0]PCIe_M_AXI_LITE_ARPROT;
  wire [0:0]PCIe_M_AXI_LITE_ARREADY;
  wire PCIe_M_AXI_LITE_ARVALID;
  wire [31:0]PCIe_M_AXI_LITE_AWADDR;
  wire [2:0]PCIe_M_AXI_LITE_AWPROT;
  wire [0:0]PCIe_M_AXI_LITE_AWREADY;
  wire PCIe_M_AXI_LITE_AWVALID;
  wire PCIe_M_AXI_LITE_BREADY;
  wire [1:0]PCIe_M_AXI_LITE_BRESP;
  wire [0:0]PCIe_M_AXI_LITE_BVALID;
  wire [31:0]PCIe_M_AXI_LITE_RDATA;
  wire PCIe_M_AXI_LITE_RREADY;
  wire [1:0]PCIe_M_AXI_LITE_RRESP;
  wire [0:0]PCIe_M_AXI_LITE_RVALID;
  wire [31:0]PCIe_M_AXI_LITE_WDATA;
  wire [0:0]PCIe_M_AXI_LITE_WREADY;
  wire [3:0]PCIe_M_AXI_LITE_WSTRB;
  wire PCIe_M_AXI_LITE_WVALID;
  wire PCIe_axi_aresetn;
  wire sys_rst_n_0_1;
  wire [0:0]util_ds_buf_0_IBUF_OUT;
  wire [63:0]xdma_0_M_AXI_ARADDR;
  wire [1:0]xdma_0_M_AXI_ARBURST;
  wire [3:0]xdma_0_M_AXI_ARCACHE;
  wire [1:0]xdma_0_M_AXI_ARID;
  wire [7:0]xdma_0_M_AXI_ARLEN;
  wire xdma_0_M_AXI_ARLOCK;
  wire [2:0]xdma_0_M_AXI_ARPROT;
  wire xdma_0_M_AXI_ARREADY;
  wire [2:0]xdma_0_M_AXI_ARSIZE;
  wire xdma_0_M_AXI_ARVALID;
  wire [63:0]xdma_0_M_AXI_AWADDR;
  wire [1:0]xdma_0_M_AXI_AWBURST;
  wire [3:0]xdma_0_M_AXI_AWCACHE;
  wire [1:0]xdma_0_M_AXI_AWID;
  wire [7:0]xdma_0_M_AXI_AWLEN;
  wire xdma_0_M_AXI_AWLOCK;
  wire [2:0]xdma_0_M_AXI_AWPROT;
  wire xdma_0_M_AXI_AWREADY;
  wire [2:0]xdma_0_M_AXI_AWSIZE;
  wire xdma_0_M_AXI_AWVALID;
  wire xdma_0_M_AXI_BID;
  wire xdma_0_M_AXI_BREADY;
  wire xdma_0_M_AXI_BRESP;
  wire xdma_0_M_AXI_BVALID;
  wire xdma_0_M_AXI_RDATA;
  wire xdma_0_M_AXI_RID;
  wire xdma_0_M_AXI_RLAST;
  wire xdma_0_M_AXI_RREADY;
  wire xdma_0_M_AXI_RRESP;
  wire xdma_0_M_AXI_RVALID;
  wire [127:0]xdma_0_M_AXI_WDATA;
  wire xdma_0_M_AXI_WLAST;
  wire xdma_0_M_AXI_WREADY;
  wire [15:0]xdma_0_M_AXI_WSTRB;
  wire xdma_0_M_AXI_WVALID;
  wire xdma_0_axi_aclk;
  wire [3:0]xdma_0_pcie_mgt_rxn;
  wire [3:0]xdma_0_pcie_mgt_rxp;
  wire [3:0]xdma_0_pcie_mgt_txn;
  wire [3:0]xdma_0_pcie_mgt_txp;

  assign CLK_IN_D_0_1_CLK_N = pcie_clk_n[0];
  assign CLK_IN_D_0_1_CLK_P = pcie_clk_p[0];
  assign M_AXI_LITE_araddr[31:0] = PCIe_M_AXI_LITE_ARADDR;
  assign M_AXI_LITE_arprot[2:0] = PCIe_M_AXI_LITE_ARPROT;
  assign M_AXI_LITE_arvalid[0] = PCIe_M_AXI_LITE_ARVALID;
  assign M_AXI_LITE_awaddr[31:0] = PCIe_M_AXI_LITE_AWADDR;
  assign M_AXI_LITE_awprot[2:0] = PCIe_M_AXI_LITE_AWPROT;
  assign M_AXI_LITE_awvalid[0] = PCIe_M_AXI_LITE_AWVALID;
  assign M_AXI_LITE_bready[0] = PCIe_M_AXI_LITE_BREADY;
  assign M_AXI_LITE_rready[0] = PCIe_M_AXI_LITE_RREADY;
  assign M_AXI_LITE_wdata[31:0] = PCIe_M_AXI_LITE_WDATA;
  assign M_AXI_LITE_wstrb[3:0] = PCIe_M_AXI_LITE_WSTRB;
  assign M_AXI_LITE_wvalid[0] = PCIe_M_AXI_LITE_WVALID;
  assign M_AXI_araddr = xdma_0_M_AXI_ARADDR[0];
  assign M_AXI_arburst = xdma_0_M_AXI_ARBURST[0];
  assign M_AXI_arcache = xdma_0_M_AXI_ARCACHE[0];
  assign M_AXI_arid = xdma_0_M_AXI_ARID[0];
  assign M_AXI_arlen = xdma_0_M_AXI_ARLEN[0];
  assign M_AXI_arlock = xdma_0_M_AXI_ARLOCK;
  assign M_AXI_arprot = xdma_0_M_AXI_ARPROT[0];
  assign M_AXI_arsize = xdma_0_M_AXI_ARSIZE[0];
  assign M_AXI_arvalid = xdma_0_M_AXI_ARVALID;
  assign M_AXI_awaddr = xdma_0_M_AXI_AWADDR[0];
  assign M_AXI_awburst = xdma_0_M_AXI_AWBURST[0];
  assign M_AXI_awcache = xdma_0_M_AXI_AWCACHE[0];
  assign M_AXI_awid = xdma_0_M_AXI_AWID[0];
  assign M_AXI_awlen = xdma_0_M_AXI_AWLEN[0];
  assign M_AXI_awlock = xdma_0_M_AXI_AWLOCK;
  assign M_AXI_awprot = xdma_0_M_AXI_AWPROT[0];
  assign M_AXI_awsize = xdma_0_M_AXI_AWSIZE[0];
  assign M_AXI_awvalid = xdma_0_M_AXI_AWVALID;
  assign M_AXI_bready = xdma_0_M_AXI_BREADY;
  assign M_AXI_rready = xdma_0_M_AXI_RREADY;
  assign M_AXI_wdata = xdma_0_M_AXI_WDATA[0];
  assign M_AXI_wlast = xdma_0_M_AXI_WLAST;
  assign M_AXI_wstrb = xdma_0_M_AXI_WSTRB[0];
  assign M_AXI_wvalid = xdma_0_M_AXI_WVALID;
  assign PCIe_M_AXI_LITE_ARREADY = M_AXI_LITE_arready[0];
  assign PCIe_M_AXI_LITE_AWREADY = M_AXI_LITE_awready[0];
  assign PCIe_M_AXI_LITE_BRESP = M_AXI_LITE_bresp[1:0];
  assign PCIe_M_AXI_LITE_BVALID = M_AXI_LITE_bvalid[0];
  assign PCIe_M_AXI_LITE_RDATA = M_AXI_LITE_rdata[31:0];
  assign PCIe_M_AXI_LITE_RRESP = M_AXI_LITE_rresp[1:0];
  assign PCIe_M_AXI_LITE_RVALID = M_AXI_LITE_rvalid[0];
  assign PCIe_M_AXI_LITE_WREADY = M_AXI_LITE_wready[0];
  assign axi_aclk = xdma_0_axi_aclk;
  assign axi_aresetn = PCIe_axi_aresetn;
  assign pcie_mgt_txn[3:0] = xdma_0_pcie_mgt_txn;
  assign pcie_mgt_txp[3:0] = xdma_0_pcie_mgt_txp;
  assign sys_clk[0] = util_ds_buf_0_IBUF_OUT;
  assign sys_rst_n_0_1 = pcie_perstn;
  assign xdma_0_M_AXI_ARREADY = M_AXI_arready;
  assign xdma_0_M_AXI_AWREADY = M_AXI_awready;
  assign xdma_0_M_AXI_BID = M_AXI_bid;
  assign xdma_0_M_AXI_BRESP = M_AXI_bresp;
  assign xdma_0_M_AXI_BVALID = M_AXI_bvalid;
  assign xdma_0_M_AXI_RDATA = M_AXI_rdata;
  assign xdma_0_M_AXI_RID = M_AXI_rid;
  assign xdma_0_M_AXI_RLAST = M_AXI_rlast;
  assign xdma_0_M_AXI_RRESP = M_AXI_rresp;
  assign xdma_0_M_AXI_RVALID = M_AXI_rvalid;
  assign xdma_0_M_AXI_WREADY = M_AXI_wready;
  assign xdma_0_pcie_mgt_rxn = pcie_mgt_rxn[3:0];
  assign xdma_0_pcie_mgt_rxp = pcie_mgt_rxp[3:0];
  design_1_util_ds_buf_0_0 util_ds_buf_0
       (.IBUF_DS_N(CLK_IN_D_0_1_CLK_N),
        .IBUF_DS_P(CLK_IN_D_0_1_CLK_P),
        .IBUF_OUT(util_ds_buf_0_IBUF_OUT));
  design_1_xdma_0_0 xdma_0
       (.axi_aclk(xdma_0_axi_aclk),
        .axi_aresetn(PCIe_axi_aresetn),
        .h2c_dsc_byp_ctl_0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .h2c_dsc_byp_dst_addr_0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .h2c_dsc_byp_len_0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .h2c_dsc_byp_load_0(1'b0),
        .h2c_dsc_byp_src_addr_0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_araddr(xdma_0_M_AXI_ARADDR),
        .m_axi_arburst(xdma_0_M_AXI_ARBURST),
        .m_axi_arcache(xdma_0_M_AXI_ARCACHE),
        .m_axi_arid(xdma_0_M_AXI_ARID),
        .m_axi_arlen(xdma_0_M_AXI_ARLEN),
        .m_axi_arlock(xdma_0_M_AXI_ARLOCK),
        .m_axi_arprot(xdma_0_M_AXI_ARPROT),
        .m_axi_arready(xdma_0_M_AXI_ARREADY),
        .m_axi_arsize(xdma_0_M_AXI_ARSIZE),
        .m_axi_arvalid(xdma_0_M_AXI_ARVALID),
        .m_axi_awaddr(xdma_0_M_AXI_AWADDR),
        .m_axi_awburst(xdma_0_M_AXI_AWBURST),
        .m_axi_awcache(xdma_0_M_AXI_AWCACHE),
        .m_axi_awid(xdma_0_M_AXI_AWID),
        .m_axi_awlen(xdma_0_M_AXI_AWLEN),
        .m_axi_awlock(xdma_0_M_AXI_AWLOCK),
        .m_axi_awprot(xdma_0_M_AXI_AWPROT),
        .m_axi_awready(xdma_0_M_AXI_AWREADY),
        .m_axi_awsize(xdma_0_M_AXI_AWSIZE),
        .m_axi_awvalid(xdma_0_M_AXI_AWVALID),
        .m_axi_bid({xdma_0_M_AXI_BID,xdma_0_M_AXI_BID}),
        .m_axi_bready(xdma_0_M_AXI_BREADY),
        .m_axi_bresp({xdma_0_M_AXI_BRESP,xdma_0_M_AXI_BRESP}),
        .m_axi_bvalid(xdma_0_M_AXI_BVALID),
        .m_axi_rdata({xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA,xdma_0_M_AXI_RDATA}),
        .m_axi_rid({xdma_0_M_AXI_RID,xdma_0_M_AXI_RID}),
        .m_axi_rlast(xdma_0_M_AXI_RLAST),
        .m_axi_rready(xdma_0_M_AXI_RREADY),
        .m_axi_rresp({xdma_0_M_AXI_RRESP,xdma_0_M_AXI_RRESP}),
        .m_axi_rvalid(xdma_0_M_AXI_RVALID),
        .m_axi_wdata(xdma_0_M_AXI_WDATA),
        .m_axi_wlast(xdma_0_M_AXI_WLAST),
        .m_axi_wready(xdma_0_M_AXI_WREADY),
        .m_axi_wstrb(xdma_0_M_AXI_WSTRB),
        .m_axi_wvalid(xdma_0_M_AXI_WVALID),
        .m_axil_araddr(PCIe_M_AXI_LITE_ARADDR),
        .m_axil_arprot(PCIe_M_AXI_LITE_ARPROT),
        .m_axil_arready(PCIe_M_AXI_LITE_ARREADY),
        .m_axil_arvalid(PCIe_M_AXI_LITE_ARVALID),
        .m_axil_awaddr(PCIe_M_AXI_LITE_AWADDR),
        .m_axil_awprot(PCIe_M_AXI_LITE_AWPROT),
        .m_axil_awready(PCIe_M_AXI_LITE_AWREADY),
        .m_axil_awvalid(PCIe_M_AXI_LITE_AWVALID),
        .m_axil_bready(PCIe_M_AXI_LITE_BREADY),
        .m_axil_bresp(PCIe_M_AXI_LITE_BRESP),
        .m_axil_bvalid(PCIe_M_AXI_LITE_BVALID),
        .m_axil_rdata(PCIe_M_AXI_LITE_RDATA),
        .m_axil_rready(PCIe_M_AXI_LITE_RREADY),
        .m_axil_rresp(PCIe_M_AXI_LITE_RRESP),
        .m_axil_rvalid(PCIe_M_AXI_LITE_RVALID),
        .m_axil_wdata(PCIe_M_AXI_LITE_WDATA),
        .m_axil_wready(PCIe_M_AXI_LITE_WREADY),
        .m_axil_wstrb(PCIe_M_AXI_LITE_WSTRB),
        .m_axil_wvalid(PCIe_M_AXI_LITE_WVALID),
        .pci_exp_rxn(xdma_0_pcie_mgt_rxn),
        .pci_exp_rxp(xdma_0_pcie_mgt_rxp),
        .pci_exp_txn(xdma_0_pcie_mgt_txn),
        .pci_exp_txp(xdma_0_pcie_mgt_txp),
        .sys_clk(util_ds_buf_0_IBUF_OUT),
        .sys_rst_n(sys_rst_n_0_1),
        .usr_irq_req(1'b0));
endmodule

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=2,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=10,da_board_cnt=2,da_clkrst_cnt=6,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S01_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S01_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input S01_ARESETN;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AXI_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AXI_ACLK, CLK_DOMAIN design_1_xdma_0_0_axi_aclk, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output axi_aclk;
  output axi_aresetn;
  input [31:0]gpio2_io_i;
  output [31:0]gpio_io_o_0;
  output [31:0]hsync_count;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcie, CAN_DEBUG false, FREQ_HZ 100000000" *) input [0:0]pcie_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie CLK_P" *) input [0:0]pcie_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt rxn" *) input [3:0]pcie_mgt_rxn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt rxp" *) input [3:0]pcie_mgt_rxp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt txn" *) output [3:0]pcie_mgt_txn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt txp" *) output [3:0]pcie_mgt_txp;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.PCIE_PERSTN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.PCIE_PERSTN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input pcie_perstn;
  output s2mm_err;
  input s2mm_halt;
  output s2mm_wr_xfer_cmplt;
  output [0:0]sys_clk;
  output [31:0]vsync_count;

  wire [31:0]AXI_LITE_IO_gpio_io_o_0;
  wire [31:0]AXI_LITE_IO_hsync_count;
  wire [31:0]AXI_LITE_IO_vsync_count;
  wire [0:0]CLK_IN_D_0_1_CLK_N;
  wire [0:0]CLK_IN_D_0_1_CLK_P;
  wire [31:0]PCIe_M_AXI_LITE_ARADDR;
  wire [2:0]PCIe_M_AXI_LITE_ARPROT;
  wire [0:0]PCIe_M_AXI_LITE_ARREADY;
  wire [0:0]PCIe_M_AXI_LITE_ARVALID;
  wire [31:0]PCIe_M_AXI_LITE_AWADDR;
  wire [2:0]PCIe_M_AXI_LITE_AWPROT;
  wire [0:0]PCIe_M_AXI_LITE_AWREADY;
  wire [0:0]PCIe_M_AXI_LITE_AWVALID;
  wire [0:0]PCIe_M_AXI_LITE_BREADY;
  wire [1:0]PCIe_M_AXI_LITE_BRESP;
  wire [0:0]PCIe_M_AXI_LITE_BVALID;
  wire [31:0]PCIe_M_AXI_LITE_RDATA;
  wire [0:0]PCIe_M_AXI_LITE_RREADY;
  wire [1:0]PCIe_M_AXI_LITE_RRESP;
  wire [0:0]PCIe_M_AXI_LITE_RVALID;
  wire [31:0]PCIe_M_AXI_LITE_WDATA;
  wire [0:0]PCIe_M_AXI_LITE_WREADY;
  wire [3:0]PCIe_M_AXI_LITE_WSTRB;
  wire [0:0]PCIe_M_AXI_LITE_WVALID;
  wire PCIe_axi_aresetn;
  wire [0:0]PCIe_sys_clk;
  wire [31:0]gpio2_io_i_0_1;
  wire sys_rst_n_0_1;
  wire xdma_0_axi_aclk;
  wire [3:0]xdma_0_pcie_mgt_rxn;
  wire [3:0]xdma_0_pcie_mgt_rxp;
  wire [3:0]xdma_0_pcie_mgt_txn;
  wire [3:0]xdma_0_pcie_mgt_txp;

  assign CLK_IN_D_0_1_CLK_N = pcie_clk_n[0];
  assign CLK_IN_D_0_1_CLK_P = pcie_clk_p[0];
  assign axi_aclk = xdma_0_axi_aclk;
  assign axi_aresetn = PCIe_axi_aresetn;
  assign gpio2_io_i_0_1 = gpio2_io_i[31:0];
  assign gpio_io_o_0[31:0] = AXI_LITE_IO_gpio_io_o_0;
  assign hsync_count[31:0] = AXI_LITE_IO_hsync_count;
  assign pcie_mgt_txn[3:0] = xdma_0_pcie_mgt_txn;
  assign pcie_mgt_txp[3:0] = xdma_0_pcie_mgt_txp;
  assign sys_clk[0] = PCIe_sys_clk;
  assign sys_rst_n_0_1 = pcie_perstn;
  assign vsync_count[31:0] = AXI_LITE_IO_vsync_count;
  assign xdma_0_pcie_mgt_rxn = pcie_mgt_rxn[3:0];
  assign xdma_0_pcie_mgt_rxp = pcie_mgt_rxp[3:0];
  AXI_LITE_IO_imp_1879I2S AXI_LITE_IO
       (.S00_AXI_araddr(PCIe_M_AXI_LITE_ARADDR),
        .S00_AXI_arprot(PCIe_M_AXI_LITE_ARPROT),
        .S00_AXI_arready(PCIe_M_AXI_LITE_ARREADY),
        .S00_AXI_arvalid(PCIe_M_AXI_LITE_ARVALID),
        .S00_AXI_awaddr(PCIe_M_AXI_LITE_AWADDR),
        .S00_AXI_awprot(PCIe_M_AXI_LITE_AWPROT),
        .S00_AXI_awready(PCIe_M_AXI_LITE_AWREADY),
        .S00_AXI_awvalid(PCIe_M_AXI_LITE_AWVALID),
        .S00_AXI_bready(PCIe_M_AXI_LITE_BREADY),
        .S00_AXI_bresp(PCIe_M_AXI_LITE_BRESP),
        .S00_AXI_bvalid(PCIe_M_AXI_LITE_BVALID),
        .S00_AXI_rdata(PCIe_M_AXI_LITE_RDATA),
        .S00_AXI_rready(PCIe_M_AXI_LITE_RREADY),
        .S00_AXI_rresp(PCIe_M_AXI_LITE_RRESP),
        .S00_AXI_rvalid(PCIe_M_AXI_LITE_RVALID),
        .S00_AXI_wdata(PCIe_M_AXI_LITE_WDATA),
        .S00_AXI_wready(PCIe_M_AXI_LITE_WREADY),
        .S00_AXI_wstrb(PCIe_M_AXI_LITE_WSTRB),
        .S00_AXI_wvalid(PCIe_M_AXI_LITE_WVALID),
        .axi_aclk(xdma_0_axi_aclk),
        .axi_resetn(PCIe_axi_aresetn),
        .gpio2_io_i(gpio2_io_i_0_1),
        .gpio_io_o_0(AXI_LITE_IO_gpio_io_o_0),
        .hsync_count(AXI_LITE_IO_hsync_count),
        .vsync_count(AXI_LITE_IO_vsync_count));
  PCIe_imp_ZJ4W1S PCIe
       (.M_AXI_LITE_araddr(PCIe_M_AXI_LITE_ARADDR),
        .M_AXI_LITE_arprot(PCIe_M_AXI_LITE_ARPROT),
        .M_AXI_LITE_arready(PCIe_M_AXI_LITE_ARREADY),
        .M_AXI_LITE_arvalid(PCIe_M_AXI_LITE_ARVALID),
        .M_AXI_LITE_awaddr(PCIe_M_AXI_LITE_AWADDR),
        .M_AXI_LITE_awprot(PCIe_M_AXI_LITE_AWPROT),
        .M_AXI_LITE_awready(PCIe_M_AXI_LITE_AWREADY),
        .M_AXI_LITE_awvalid(PCIe_M_AXI_LITE_AWVALID),
        .M_AXI_LITE_bready(PCIe_M_AXI_LITE_BREADY),
        .M_AXI_LITE_bresp(PCIe_M_AXI_LITE_BRESP),
        .M_AXI_LITE_bvalid(PCIe_M_AXI_LITE_BVALID),
        .M_AXI_LITE_rdata(PCIe_M_AXI_LITE_RDATA),
        .M_AXI_LITE_rready(PCIe_M_AXI_LITE_RREADY),
        .M_AXI_LITE_rresp(PCIe_M_AXI_LITE_RRESP),
        .M_AXI_LITE_rvalid(PCIe_M_AXI_LITE_RVALID),
        .M_AXI_LITE_wdata(PCIe_M_AXI_LITE_WDATA),
        .M_AXI_LITE_wready(PCIe_M_AXI_LITE_WREADY),
        .M_AXI_LITE_wstrb(PCIe_M_AXI_LITE_WSTRB),
        .M_AXI_LITE_wvalid(PCIe_M_AXI_LITE_WVALID),
        .M_AXI_arready(1'b0),
        .M_AXI_awready(1'b0),
        .M_AXI_bid(1'b0),
        .M_AXI_bresp(1'b0),
        .M_AXI_bvalid(1'b0),
        .M_AXI_rdata(1'b0),
        .M_AXI_rid(1'b0),
        .M_AXI_rlast(1'b0),
        .M_AXI_rresp(1'b0),
        .M_AXI_rvalid(1'b0),
        .M_AXI_wready(1'b0),
        .axi_aclk(xdma_0_axi_aclk),
        .axi_aresetn(PCIe_axi_aresetn),
        .pcie_clk_n(CLK_IN_D_0_1_CLK_N),
        .pcie_clk_p(CLK_IN_D_0_1_CLK_P),
        .pcie_mgt_rxn(xdma_0_pcie_mgt_rxn),
        .pcie_mgt_rxp(xdma_0_pcie_mgt_rxp),
        .pcie_mgt_txn(xdma_0_pcie_mgt_txn),
        .pcie_mgt_txp(xdma_0_pcie_mgt_txp),
        .pcie_perstn(sys_rst_n_0_1),
        .sys_clk(PCIe_sys_clk));
endmodule
