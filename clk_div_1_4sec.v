`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2023 09:15:13 AM
// Design Name: 
// Module Name: clk_div_1_4sec
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


module clk_div_1_4sec(
    input CLK_5_HZ,
    input enable,
    output reg CLK_4_HZ = 0
    );
    integer count_4_HZ = 0;
    always @(posedge CLK_5_HZ) begin
    if (enable) begin
        if(count_4_HZ == 625000) begin
            count_4_HZ <= 0;
            CLK_4_HZ <= ~CLK_4_HZ;
        end
        else
            count_4_HZ <= count_4_HZ + 1;
        end
    else begin end
    
    end
endmodule
