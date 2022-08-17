set_property PACKAGE_PIN J2 [get_ports result[1]]
set_property IOSTANDARD LVCMOS33 [get_ports result[1]]
set_property PULLUP true [get_ports result[1]]
set_property DRIVE 8 [get_ports result[1]]

set_property PACKAGE_PIN K2 [get_ports result[0]]
set_property IOSTANDARD LVCMOS33 [get_ports result[0]]
set_property PULLUP true [get_ports result[0]]
set_property DRIVE 8 [get_ports result[0]]

set_property PACKAGE_PIN F6 [get_ports clk_p]
set_property PACKAGE_PIN E6 [get_ports clk_n]

set_property PACKAGE_PIN J5 [get_ports lvds_p]
set_property PACKAGE_PIN H5 [get_ports lvds_n]
set_property IOSTANDARD LVDS_25 [get_ports lvds_p]
set_property IOSTANDARD LVDS_25 [get_ports lvds_n]