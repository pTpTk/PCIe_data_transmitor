`timescale 1 ps / 1 ps

module dso_top
   (
    input [0:0] pcie_clk_n,
    input [0:0] pcie_clk_p,
    input [3:0] pcie_mgt_rxn,
    input [3:0] pcie_mgt_rxp,
    output [3:0] pcie_mgt_txn,
    output [3:0] pcie_mgt_txp,
    input pcie_perstn,
    input ref_clk,
    input adc_ctl_in,
    output adc_ctl_out,
    output hsync_is_zero
    );
  
  wire S01_ARESETN;
  
  wire [71:0]S_AXIS_S2MM_CMD_tdata;
  wire S_AXIS_S2MM_CMD_tready;
  wire S_AXIS_S2MM_CMD_tvalid;
  wire [127:0]S_AXIS_S2MM_tdata;
  wire S_AXIS_S2MM_tready;
  wire S_AXIS_S2MM_tvalid;
  wire S_AXIS_S2MM_tlast;
  
  wire axi_aclk;
  wire axi_aresetn;
  
  wire [31:0]gpio2_io_i;
  wire [31:0]gpio_io_o_0;
  
  wire [31:0]vsync_count;
  wire [31:0]hsync_count;

  wire s2mm_err;
  wire s2mm_halt;
  wire s2mm_wr_xfer_cmplt; 

  wire [31:0]adc_data;
  wire adc_clk;
  
  wire sys_clk;
  
  wire fifo_empty;
  wire fifo_rd_en;
  
//  data_generator data_generator (
//    .clk_ref(sys_clk),
//    .reset(S01_ARESETN),
//    .data_out(adc_data),
//    .clk(adc_clk)
//  );
  
  adc_ctl adc_ctl (
    .adc_clk(adc_clk),
    .reset(S01_ARESETN),

    .adc_ctl_in(adc_ctl_in),
    .vsync_count(vsync_count),
    .hsync_count(hsync_count),
    .adc_ctl_out(adc_ctl_out),
    .hsync_is_zero(hsync_is_zero)
  );
  
//  fifo_generator_0 adc_fifo (
//    .rst(~S01_ARESETN | s2mm_halt),
//    .din(adc_data),
//    .dout(S_AXIS_S2MM_tdata),
//    .wr_clk(adc_clk),
//    .rd_clk(axi_aclk),
//    .rd_en(fifo_rd_en),
//    .wr_en(adc_ctl_out),
//    .empty(fifo_empty)
//  );

//  datamover_ctl datamover_ctl (
//    .axi_aclk(axi_aclk),
//    .axi_aresetn(axi_aresetn),
//    .S01_ARESETN(S01_ARESETN),
//    .axis_cmd_tready(S_AXIS_S2MM_CMD_tready),
//    .axis_cmd_tdata(S_AXIS_S2MM_CMD_tdata),
//    .axis_cmd_tvalid(S_AXIS_S2MM_CMD_tvalid),
//    .axis_data_tready(S_AXIS_S2MM_tready),
//    .axis_data_tvalid(S_AXIS_S2MM_tvalid),
//    .axis_data_tlast(S_AXIS_S2MM_tlast),
//    .s2mm_err(s2mm_err),
//    .s2mm_halt(s2mm_halt),
//    .s2mm_wr_xfer_cmplt(s2mm_wr_xfer_cmplt),
//    .gpio_io_o_0(gpio_io_o_0),
//    .gpio2_io_i(gpio2_io_i),
//    .fifo_empty(fifo_empty),
//    .fifo_rd_en(fifo_rd_en)
//  );
  
  design_1 design_1_i
   (
    .S01_ARESETN(S01_ARESETN),
    .axi_aclk(axi_aclk),
    .axi_aresetn(axi_aresetn),
    .gpio2_io_i(gpio2_io_i),
    .gpio_io_o_0(gpio_io_o_0),
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
    .vsync_count(vsync_count),
    .hsync_count(hsync_count)
    );
        
endmodule