##################################################################################################
## 
##  Xilinx, Inc. 2010            www.xilinx.com 
##  Fri Aug  5 12:56:59 2022

##  Generated by MIG Version 4.2
##  
##################################################################################################
##  File name :       example_top.sd
##  Details :     Constraints file
##                    FPGA Family:       ARTIX7
##                    FPGA Part:         XC7A15TFGG484_PKG
##                    Speedgrade:        -2
##                    Design Entry:      VERILOG
##                    Frequency:         400 MHz
##                    Time Period:       2500 ps
##################################################################################################

##################################################################################################
## Controller 0
## Memory Device: DDR3_SDRAM->Components->MT41K256M16XX-125
## Data Width: 16
## Time Period: 2500
## Data Mask: 1
##################################################################################################

set_property IO_BUFFER_TYPE NONE [get_ports {ddr3_ck_n[*]} ]
set_property IO_BUFFER_TYPE NONE [get_ports {ddr3_ck_p[*]} ]
          
#create_clock -period 5 [get_ports sys_clk_i]
          
############## NET - IOSTANDARD ##################


