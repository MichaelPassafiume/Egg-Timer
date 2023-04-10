`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2023 09:33:25 AM
// Design Name: 
// Module Name: bcd_decoder
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


module bcd_decoder(
        input [4:0] m,
        output reg [7:0] seg0
    );
        always @*
        begin
        case(m)
            5'b00000: seg0 = 8'b11000000; //0
            5'b00001: seg0 = 8'b11111001; //1
            5'b00010: seg0 = 8'b10100100; //2
            5'b00011: seg0 = 8'b10110000; //3
            5'b00100: seg0 = 8'b10011001; //4
            5'b00101: seg0 = 8'b10010010; //5
            5'b00110: seg0 = 8'b10000010; //6
            5'b00111: seg0 = 8'b11111000; //7
            5'b01000: seg0 = 8'b10000000; //8
            5'b01001: seg0 = 8'b10010000; //9
            5'b01010: seg0 = 8'b10000010; //G
            5'b01011: seg0 = 8'b10000110; //E
            5'b01100: seg0 = 8'b11001110; //T need to fix
            5'b01101: seg0 = 8'b10001110; //F need to fix
            5'b01110: seg0 = 8'b11000000; //O
            5'b01111: seg0 = 8'b10010010; //S
            5'b10000: seg0 = 8'b10100001; //D
            5'b10001: seg0 = 8'b10101111; //R
            5'b10010: seg0 = 8'b10001000; //A
            5'b10011: seg0 = 8'b10001001; //H
            default: seg0 = 8'b11111111;  
        endcase
        end
    
endmodule
