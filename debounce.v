`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2023 12:25:52 PM
// Design Name: 
// Module Name: debounce
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


module debounce(
        input clk,
        input clk2,
        input min_in,
        input sec_in,
        input start_in,
        output min_bounce,
        output sec_bounce,
        output start_bounce
    );
    
    d_ff d1(clk2, min_in, Q1);
    d_ff d2(clk2, Q1, Q2);
    
    assign min_bounce = Q1 & ~Q2;
    
    d_ff d3(clk2, sec_in, Q3);
    d_ff d4(clk2, Q3, Q4);
        
    assign sec_bounce = Q3 & ~Q4;
    
    d_ff d5(clk2, start_in, Q5);
    d_ff d6(clk2, Q5, Q6);
    
    assign start_bounce = Q5 & ~Q6;
//    d_ff d3(clk2, Q2, Q3);
//    d_ff d4(clk2, Q3, Q4);
    
    
//    always@(posedge clk)begin
//        case(min_in)
//        0: begin min_bounce <= 0; min_shift = 6'b0; end
//        1: begin if(min_shift == 6'b111111) min_bounce <= 1; 
//            else begin min_shift <= min_shift +1; min_bounce <= 0; end end
//        default: min_shift = 6'b0;
//        endcase
        
//    end
    
//    always@(posedge clk)begin
//        case(sec_in)
//        0: sec_shift = 6'b0;
//        1: sec_shift <= sec_shift +1;
//        default: sec_shift = 6'b0;
//        endcase
//        if(sec_shift == 6'b111111) sec_bounce <= 1;
//        else sec_bounce <= 0;
//    end
endmodule
