# PCIe data transmitor

## dso_top_litefury
This is the main FPGA design (Currently not working because of the bug with the controls. And no I did not have any version control so there is no working version of the design anywhere). The block diagram of the design looks like this:![image](https://user-images.githubusercontent.com/51343090/185215547-8ac685cd-4bcc-4998-a3dc-47e93bcaa42e.png) The pdf of the schematics is in the dso folder for those who hasn't mastered microscopic vision yet.

The data generator block is the temperary replacement for the actual adc channels. The input clk_ref is a 100MHz clock signal, the reset is active-low. The output clk is 80MHz.

The adc_ctl block implements the vsync and hsync controls. This is the problematic block we have. The block functions like a clock divider. The issue is with the initialization. I wanted it to initalize through the AXI_Lite port, but it's not behaving as expected.

The adc_fifo block buffers the incoming data and feeds the output into the datamover block in design_1. rd_clk is 125MHz, rd_en is high whenever data is available. rst is active-high. wr_en is from adc_ctl.

The datamover_clt block ouputs the control signals used in datamover. I wanted to seperate the data path and the control components for a cleaner structure. Hence the adc_ctl and this module.

The design_1 block is largely from Alex's design. The design looks like this:![Screenshot_L](https://user-images.githubusercontent.com/51343090/185234036-13743528-e00a-4822-bc62-336cb2c2ee45.png) Again the pdf file is available.
* Datamover https://docs.xilinx.com/r/en-US/pg022_axi_datamover

The datamover is an interface for AXI stream to AXI data transfer.
* AXI_Lite_IO

The control interface.


## AXI Operation Modes
* Memory Mapped Protocols  
&ensp;&ensp;&ensp;&ensp;In memory mapped AXI (AXI3, AXI4 and AXI4-Lite), all transactions involve the concept of a target address within a system memory space and data to be transferred.  
&ensp;&ensp;&ensp;&ensp;Memeory mapped systems often provide a more homogeneous way to view the system, because the IPs operate around a defined memory map.
* AXI4-Stream Protocol  
&ensp;&ensp;&ensp;&ensp;The AXI4-Stream protocol is used for applications that typically focus on a data-centric and data-flow paradigm where the concept of an address is not present or not required. Each AXI4-stream acts as a single unidirectional channel for a handshake data flow.  
&ensp;&ensp;&ensp;&ensp;At this lower level of operation (compared to the memory mapped AXI protocol types), the mechanism to move data between IP is defined and efficient, but there is no unifying address contet between IP. The AXI4-Stream IP can be better optimized for performance in data flow applications, but also tends to be more specialized around a given application space.
  
## Miscellaneous
* PCIe uses big-endian.
  
## References
* DMA/Bridge Subsystem for PCI Express v4.1 Product Guide https://docs.xilinx.com/r/en-US/pg195-pcie-dma/IP-Facts
* AXI Reference Guide https://docs.xilinx.com/v/u/en-US/ug1037-vivado-axi-reference-guide
* AXI Tutorial https://github.com/absolutezero2730/AXI_DMA_FIFO
* AXI DataMover LogiCORE IP Product Guide https://docs.xilinx.com/r/en-US/pg022_axi_datamover
