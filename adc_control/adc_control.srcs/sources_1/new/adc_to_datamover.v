`timescale 1ns / 1ps

module datamover_ctl(
    input axi_aclk,
    input axi_aresetn,
    input axis_cmd_tready,
    output axis_cmd_tvalid,
    output[71:0] axis_cmd_tdata,

    output S01_ARESETN,
    output s2mm_halt,
    
    input axis_data_tready,
    output axis_data_tvalid,
    output axis_data_tlast,
    
    input s2mm_err,
    input s2mm_wr_xfer_cmplt,
    input[31:0] gpio_io_o_0,
    output[31:0] gpio2_io_i,
    
    input fifo_empty,
    output fifo_rd_en
    );

  // varaibles for axis_cmd
  reg cmd_tvalid;
  reg [26:0] address;
  
  // varaibles for axis_data
  reg [7:0]data_counter;    // counting how many 128-bit packets are transmitted within each 4KB block.
  reg data_tlast;           // At the end of each block, the data_tlast signal needs to be set mannually
  wire new_sample;
  
  // Transfer Counter
  reg [15:0] transfer_counter;
  
  assign axis_cmd_tvalid = cmd_tvalid;
    
  assign axis_data_tlast = data_tlast;
  //Reserved[3:0], Tag[3:0], SADDR[31:0], DRE, EOF, DSA[3:0], Type, BTT[22:0]
  //BTT(bit to transfer) refers to the page size (currently 4KB).
  assign axis_cmd_tdata = {4'h0,4'h0,5'h0,address,1'b0,1'b1,6'h00,1'b1,23'h001000};
  
  assign new_sample = axis_data_tready & ~fifo_empty;
  assign fifo_rd_en = new_sample & S01_ARESETN & gpio_io_o_0[0];
  assign axis_data_tvalid = fifo_rd_en;
  
  //Status GPIOs
  assign gpio2_io_i = {s2mm_err,15'd0,transfer_counter};
  assign S01_ARESETN = (axi_aresetn & gpio_io_o_0[1]);
  assign s2mm_halt = ~gpio_io_o_0[0];
  
  always @(posedge axi_aclk) begin
    if (!S01_ARESETN) begin
    // for axis_cmd
        address <= 0;
        cmd_tvalid <= 0;
        
    // for axis_data
        data_counter <= 8'h0;
        
    // transfer counter
        transfer_counter <= 0;
    end
    else begin
        cmd_tvalid <= 1;
        // if data_mover is ready to take in another cmd
        if (axis_cmd_tready) begin
            address <= address + 16'h1000;
        end
        
        // if data mover is ready to accept a new block of 128 bits and there is data in the fifo
        if (new_sample) begin
            data_counter <= data_counter + 1;
            data_tlast <= 0;
            if (data_counter == 8'd254) begin
                data_tlast <= 1;
            end
        end
        
        // the cmplt signal is driven to high after a 4K page is transmitted.
        // The transfer counter is used in reading to determine how much of the ram is full.
        if (s2mm_wr_xfer_cmplt) begin
            transfer_counter <= transfer_counter + 1;
        end
        
    end
  end

endmodule
