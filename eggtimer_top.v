`timescale 1ns / 1ps

module eggtimer_top(
    input clk,
    input cook_time,
    input start,
    input min_in,
    input sec_in,
    input reset,
    input enable,
    output [7:0] an,
    output [7:0] seg,
    output reg led
    );
    integer en = 1;
    integer res  = 0;
    reg str;
    reg load = 1;
    reg [3:0] a,b,c,d;
    reg firm;
    
    clk_wiz_0 clk_500Mhz
       (
        // Clock out ports
        .clk_out1(clk_out1),     // output clk_out1
       // Clock in ports
        .clk_in1(clk));      // input clk_in1
    
    clk_div_1sec clk_1sec (clk_out1, en, res, clk1);
    clock_divider_500hz clk_500hz (clk_out1, en, clk500);
    clk_div_1_4sec clk_4hz(clk_out1, en, clk4);
    
    driver driv1 (clk500, clk1, a, b, c, d, enable, reset, str, load, firm, an, seg );
    
    debounce(clk500, clk4, min_in, sec_in, start, min_bounce, sec_bounce, start_bounce);
    
    //Increment Minutes 
    always@(posedge min_bounce or posedge reset)begin
        if(reset)begin
    
            c <= 0;
            d <= 0;
        end
        else if(cook_time == 1)begin
     
            c <= c+1;
            if(c == 9)begin
                c<= 0;
                d <= d+1;
            end
            if(c >= 4'd5 | d >= 4'd1) firm <= 1;
                    else firm <= 0;      
        end
           
    end
    
    //Increment Seconds
    always@(posedge sec_bounce or posedge reset)begin
        if(reset)begin

            a<=0;
            b<=0;
        end
        else if(cook_time == 1)begin

            a <= a+1;
            if(a == 9)begin
                a<= 0;
                b <= b+1;
            end    
        end 
    end
        
        
    //Start T-FF
    always@(posedge start_bounce or posedge reset)begin
        if (reset) 
            begin
            str <= 0; 
            load <= 1; end 
        else
            begin
            str <= ~str; 
            load <= 0; end
        end
    
    //Led Blink
    always@(posedge clk1)begin
        if(enable)
            led <= ~led;
        else led = 0;
    end
    
endmodule
