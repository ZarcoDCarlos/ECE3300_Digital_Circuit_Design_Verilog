`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 06:26:04 PM
// Design Name: 
// Module Name: coding_guidelines
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


module coding_guidelines(
    input a,
    input b,
    input c,
    input clk,
    output reg f, g //for long way delete reg from this line
    );
    
    reg ag, bc;
    always@(posedge clk)
    begin
        ag = a &~g; //blocking assignment
        f <= ag;
        
        bc = b | c; //blocing assignment
        g <= bc;    
    end
    
    
    
    /*
    //short way: (more error prone)
    always@(posedge clk)
    begin
        f <= a & ~g; // this is current value of g
        g <= b | c; // this is next value of g
    end
    */
    
    
    
    //Long way below
//    reg f_reg, f_next, g_reg, g_next;
    
//    //reg logic
//    always@(posedge clk)
//    begin
//        f_reg <= f_next;
//        g_reg <= g_next;
//    end
    
//    //next state logic
//    always@(a, b, c, g_reg) //sensitivity list includes anything on the right side of the following expressions
//    begin
//        f_next = a & (~g_reg);
//        g_next = b | c;
//    end
    
//    //output logic
//    assign f = f_reg;
//    assign g = g_reg;
    
endmodule
