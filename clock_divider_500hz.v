`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2023 09:35:55 AM
// Design Name: 
// Module Name: clock_divider_500hz
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


module clock_divider_500hz(
    input CLK_5_HZ,
    input enable,
    output reg CLK_500_HZ = 0
    );
    integer count_500_HZ = 0;
    
    
    always @(posedge CLK_5_HZ) begin
    if (enable) begin
        if(count_500_HZ == 5000) begin
            count_500_HZ <= 0;
            CLK_500_HZ <= ~CLK_500_HZ;
        end
        else
            count_500_HZ <= count_500_HZ + 1;
        end
    else begin end
    
    end
endmodule
