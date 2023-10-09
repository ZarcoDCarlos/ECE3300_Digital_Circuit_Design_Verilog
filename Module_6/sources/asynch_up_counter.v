`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 03:02:18 PM
// Design Name: 
// Module Name: asynch_up_counter
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


module asynch_up_counter(
    input clk,
    input reset_n, // way to reset all values of T-Flip flops to 0
    output [3:0] Q
    );
    
    T_FF FF0(
        .clk(clk),
        .T(1'b1),
        .reset_n(reset_n),
        .Q(Q[0])
    );
    
    T_FF FF1 (
        .clk(~Q[0]),
        .T(1'b1),
        .reset_n(reset_n),
        .Q(Q[1])
    );
    
    T_FF FF2 (
        .clk(~Q[1]),
        .T(1'b1),
        .reset_n(reset_n),
        .Q(Q[2]) 
    );
    
    T_FF FF3 (
        .clk(~Q[2]),
        .T(1'b1),
        .reset_n(reset_n),
        .Q(Q[3]) 
    );
    
    
    
endmodule
