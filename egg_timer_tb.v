`timescale 1ms / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2023 11:40:43 AM
// Design Name: 
// Module Name: egg_timer_tb
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


module egg_timer_tb(

    );
    reg clk;
    reg cook_time;
    reg start;
    reg min_in;
    reg sec_in;
    reg reset;
    reg enable;
    wire [7:0] an;
    wire [7:0] seg;
    wire led;
    
    initial
        begin
        clk = 0; cook_time = 0; start = 0; min_in = 0; sec_in = 0; reset = 0; enable = 0;
        #1 enable = 1; cook_time = 1;
        #10 min_in = 1;
//        #600 min_in = 1;
//        #600 min_in = 0; sec_in = 1;
//        #600 sec_in = 0;
//        #600 sec_in = 1;
//        #600 sec_in = 0;
        
        #400 $finish;
        end
    
    initial 
        begin
        forever
        #0.000000001 clk=~clk;
        end    
    
endmodule
