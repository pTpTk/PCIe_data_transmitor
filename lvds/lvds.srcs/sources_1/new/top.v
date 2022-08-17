`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2022 02:18:12 PM
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
    input lvds_p,
    input lvds_n,
    input clk_p,
    input clk_n,
    output reg [1:0] result
    );

    wire [1:0] data_out;
    wire clk;
    wire clk_div;
    wire clk_div_div;
    
    design_1 clking (
        .diff_clk_p(clk_p),
        .diff_clk_n(clk_n),
        .clk(clk),
        .clk_div(clk_div)
    );
    
    selectio_wiz_0 lvds (
        .data_in_from_pins_p(lvds_p),
        .data_in_from_pins_n(lvds_n),
        .data_in_to_device(data_out),
        .clk_in(clk),
        .clk_div_in(clk_div)
    );
    
    clk_div clk_div (
        .clock_in(clk_div),
        .clock_out(clk_div_div)
    );
    
    always @(posedge clk_div_div) begin
        result <= data_out;
    end
endmodule