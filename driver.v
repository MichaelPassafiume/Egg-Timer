`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2023 12:11:45 PM
// Design Name: 
// Module Name: driver
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


module driver(
    input clk,
    input clk1,
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input enable,
    input reset,
    input str,
    input load,
    input firm,
    output reg [7:0] an,
    output [7:0] seg
    );
    wire [3:0] a1,b1,c1,d1;
    reg [2:0]co;
    reg [4:0] dig;
    reg [3:0] count_top = 3;
    
    bcd_decoder bcd0(dig, seg);
    counter count1(clk1, load, str, a, b, c, d, enable, reset, dn, a1, b1, c1, d1);
    always@(posedge clk)begin
        if(dn == 1) count_top <= 6;
        else count_top <= 3;    
    end 
      
    always@(posedge clk)
        begin
            if(!reset)begin
                case (co)
                0: begin an <= 8'b11111110; if(dn == 1 & firm == 0) dig<=5'd12;else if(dn == 1 & firm == 1) dig<= 5'd16; else if(str) dig <= a1; else dig <=a; end
                1: begin an <= 8'b11111101; if(dn == 1 & firm == 0) dig<=5'd13;else if(dn == 1 & firm == 1) dig<= 5'd17; else if(str) dig <= b1; else dig <=b; end
                2: begin an <= 8'b11111011; if(dn == 1 & firm == 0) dig<=5'd14;else if(dn == 1 & firm == 1) dig<= 5'd18; else if(str) dig <= c1; else dig <=c; end
                3: begin an <= 8'b11110111; if(dn == 1 & firm == 0) dig<=5'd15;else if(dn == 1 & firm == 1) dig<= 5'd19; else if(str) dig <= d1; else dig <=d; end
                4: begin an <= 8'b11101111; dig <= 5'd10 ;end
                5: begin an <= 8'b11011111; dig <= 5'd10 ;end
                6: begin an <= 8'b10111111; dig <= 5'd11 ;end
                default: an <= 8'b11111111; 
                endcase
                end
            else begin an <= 8'b11111111; end
            
            if(co == count_top)begin co <= 0; end
            else co <= co + 1;
        end
    
endmodule
