`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2022 01:39:42 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    input adc_ctl_in,
    input clk_n,
    input clk_p,
    output adc_ctl_out,
    output hsync_is_zero
    );
    
    wire clk;
  
    adc_ctl clk_f (
        .adc_clk(clk),
        .adc_ctl_in(adc_ctl_in),
        .adc_ctl_out(adc_ctl_out),
        .hsync_is_zero(hsync_is_zero)
    );
    
    design_1 d (
        .clk_out(clk),
        .diff_clock_clk_n(clk_n),
        .diff_clock_clk_p(clk_p)
    );
endmodule
