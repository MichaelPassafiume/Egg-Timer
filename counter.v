`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2023 01:04:41 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input load,
    input str,
    input [3:0] a1,
    input [3:0] b1,
    input [3:0] c1,
    input [3:0] d1,
    input enable,
    input reset,
    output dn,
    output reg [3:0] a,
    output reg [3:0] b,
    output reg [3:0] c,
    output reg [3:0] d
    );
    reg ena = 1;
    reg dn = 0;
    
    always@(posedge clk)begin 
        if(reset) dn = 0;        
        if(enable == 1 & str == 1)begin
            if(a == 0 & b == 0 & c == 0 & d == 0 & str == 1)begin
                ena = 0;
                dn = 1;
            end else begin
                ena = 1;
            end
            if(a == 0 & ena == 1)begin
                b <= b-1;
                a <= 9;
                if(b == 0)begin
                    c <= c-1;
                    b <= 5;
                    if(c == 0)begin
                        d <= d-1;
                        c <= 9;
                    end 
                end
            end else if (ena == 1) begin
            a <= a -1; end
        end 
        else if(load)begin
            a <= a1;
            b <= b1;
            c <= c1;
            d <= d1;
        end
    end 
endmodule
