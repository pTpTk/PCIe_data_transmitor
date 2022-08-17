`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2022 11:52:00 AM
// Design Name: 
// Module Name: adc_fifo
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


module adc_ctl(
    input adc_clk,
    input reset,

    input adc_ctl_in,
    input [31:0] vsync_count,
    input [31:0] hsync_count,
    output adc_ctl_out,
    output reg hsync_is_zero
    );
    
    wire reset_hsync;
    
    reg [31:0] vsync;
    reg [31:0] hsync;
    
    assign reset_hsync = (vsync_count == 0) ? adc_ctl_in && (hsync == 0)                    // non-stop mode
                                            : adc_ctl_in && (hsync == 0) && (vsync != 0);
    assign adc_ctl_out = |hsync;
    
    always @(posedge adc_clk or negedge reset) begin
        if(hsync == 0) begin
            hsync_is_zero <= 1;
        end
        else begin
            hsync_is_zero <= 0;
        end
    
        if(!reset) begin
            hsync <= hsync_count;
        end
        else if(reset_hsync) begin
            hsync <= hsync_count;
        end
        else if(hsync != 0) begin
            hsync <= hsync - 1;
        end
    end
    
    always @(posedge adc_ctl_in or negedge reset) begin      // decrementing vsync
        if(!reset) begin
            vsync <= vsync_count;
        end
        else begin
            vsync <= (vsync == 0) ? 0 : vsync - 1;
        end
    end
endmodule
