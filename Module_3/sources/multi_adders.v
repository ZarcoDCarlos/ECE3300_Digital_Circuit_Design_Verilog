`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 06:36:04 PM
// Design Name: 
// Module Name: multi_adders
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

//Note no carry ins for these adders for simplicity
module multi_adders(
    input [15:0] a, b,
    output [15:0] s_ab, //the sum of a and b
    output [15:0] c_out_ab,
    
    input [33:0] x, y,
    output [33:0] s_xy,
    output [33:0] c_out_xy
    );
    
    //how do i change the value of n in the rca_nbit?
    //this is called named parameter connection: add #(.n(16)) before the name of the instantiation of the module rca_nbit
    //this makes n = 16!
    rca_nbit #(.n(16)) adder_16 (    
        .x(a),
        .y(b),
        .c_in(0),
        .s(s_ab),
        .c_out(c_out_ab)
    );
    
    rca_nbit #(.n(34)) adder_34 (    
        .x(x),
        .y(y),
        .c_in(0),
        .s(s_xy),
        .c_out(c_out_xy)
    );
endmodule
