`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 07:48:08 PM
// Design Name: 
// Module Name: adder_subtractor_4bit
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


module adder_subtractor_4bit(
    input [3:0] x, y,
    input add_n, //_n means that it s asserted when it is low (when control is zero it will add)
    output [3:0] s,
    output c_out
    );
    
    wire [3:0] xored_y;
    assign xored_y[0] = y[0] ^ add_n;
    assign xored_y[1] = y[1] ^ add_n;
    assign xored_y[2] = y[2] ^ add_n;
    assign xored_y[3] = y[3] ^ add_n;
    
    rca_nbit #(.n(4)) A0 (
        .x(x),
        .y(xored_y),
        .c_in(add_n),
        .s(s),
        .c_out(cout)     
    );
    
endmodule
