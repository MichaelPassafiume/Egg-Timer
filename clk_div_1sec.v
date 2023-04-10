`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2023 01:52:37 PM
// Design Name: 
// Module Name: clk_div_1sec
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


module clk_div_1sec(
    input CLK_5_HZ,
    input enable,
    input reset,
    output reg CLK_1_HZ = 0
);
    integer count_1_HZ = 0;
    always @(posedge CLK_5_HZ, posedge reset) begin
        if(reset) begin
        count_1_HZ <= 0;
        CLK_1_HZ <= 0;
    end
    else if (enable) begin
        if(count_1_HZ == 2500000) begin
            count_1_HZ <= 0;
            CLK_1_HZ <= ~CLK_1_HZ;
        end
        else
            count_1_HZ <= count_1_HZ + 1;
        end
    else begin end
    
    end
endmodule
