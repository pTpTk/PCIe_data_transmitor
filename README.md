# PCIe data transmitor
## AXI Operation Modes
* Memory Mapped Protocols  
&ensp;&ensp;&ensp;&ensp;In memory mapped AXI (AXI3, AXI4 and AXI4-Lite), all transactions involve the concept of a target address within a system memory space and data to be transferred.  
&ensp;&ensp;&ensp;&ensp;Memeory mapped systems often provide a more homogeneous way to view the system, because the IPs operate around a defined memory map.
* AXI4-Stream Protocol  
&ensp;&ensp;&ensp;&ensp;The AXI4-Stream protocol is used for applications that typically focus on a data-centric and data-flow paradigm where the concept of an address is not present or not required. Each AXI4-stream acts as a single unidirectional channel for a handshake data flow.  
&ensp;&ensp;&ensp;&ensp;At this lower level of operation (compared to the memory mapped AXI protocol types), the mechanism to move data between IP is defined and efficient, but there is no unifying address contet between IP. The AXI4-Stream IP can be better optimized for performance in data flow applications, but also tends to be more specialized around a given application space.
  
## References
* DMA/Bridge Subsystem for PCI Express v4.1 Product Guide https://docs.xilinx.com/r/en-US/pg195-pcie-dma/IP-Facts
* AXI Reference Guide https://docs.xilinx.com/v/u/en-US/ug1037-vivado-axi-reference-guide
* AXI Tutorial https://github.com/absolutezero2730/AXI_DMA_FIFO
