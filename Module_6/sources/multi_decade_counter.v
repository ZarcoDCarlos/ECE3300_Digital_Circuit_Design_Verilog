`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 08:00:14 PM
// Design Name: 
// Module Name: multi_decade_counter
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


module multi_decade_counter(
    input clk,
    input reser_n,
    input enable,
    input done,
    output [3:0] ones, tens, hundreds
    );
    
    wire done0, done1, done2;
    wire a0, a1, a2;
    
    BCD_counter D0(
        .clk(clk),
        .reset_n(reset_n),
        .enable(enable),
        .done(done0),
        .Q(ones)
    );
    
    assign a0 = enable & done0;
    BCD_counter D1(
        .clk(clk),
        .reset_n(reset_n),
        .enable(a0),
        .done(done1),
        .Q(tens)
    );
    
    assign a1 = a0 & done1;
    BCD_counter D2(
        .clk(clk),
        .reset_n(reset_n),
        .enable(a1),
        .done(done2),
        .Q(hundreds)
    );
    
    assign a2 = a1 & done2;
    
    assign done = a2;
    
    
endmodule
