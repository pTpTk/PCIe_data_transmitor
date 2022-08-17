`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2022 01:16:16 PM
// Design Name: 
// Module Name: data_generator
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


module data_generator(
    input clk_ref,
    input reset,
    output [31:0] data_out,
    output clk
    );
    
    reg [31:0] counter;
    
    design_2 clk_wiz(
    .reset(reset),
    .ref_clk(clk_ref),
    .clk_out(clk)
    );
    
    assign data_out = counter;
    
    always @(posedge clk or negedge reset) begin
        if(!reset) begin
            counter <= 32'hFFFFFC00;
        end
        else begin
            counter <= counter + 1;
        end
    end
endmodule
