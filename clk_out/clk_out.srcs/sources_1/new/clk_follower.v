`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/12/2022 11:05:57 AM
// Design Name: 
// Module Name: clk_follower
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

    input adc_ctl_in,
    output adc_ctl_out,
    output reg hsync_is_zero
    );
    
    wire reset_hsync;
    
    reg [31:0] vsync = 9999;
    reg [31:0] hsync = 6000;
    
    assign reset_hsync = adc_ctl_in && (hsync == 0);
    assign adc_ctl_out = |hsync;
    
    always @(posedge adc_clk) begin
        if(hsync == 0) begin
            hsync_is_zero <= 1;
        end
        else begin
            hsync_is_zero <= 0;
        end
        
        if(reset_hsync) begin
            hsync <= 6000;
        end
        else if(hsync != 0) begin
            hsync <= hsync - 1;
        end
    end
    
    always @(posedge adc_ctl_in) begin      // decrementing vsync
        begin
            vsync <= (vsync == 0) ? 0 : vsync - 1;
        end
    end
endmodule