`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 05:43:23 PM
// Design Name: 
// Module Name: comb_block_nonblock
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


module comb_block_nonblock(
    input a,
    input b,
    input c,
    output reg x
    );
    
    always@(a, b, c) //procedural assignment
    begin
        x = (a ^ b) | c; //don't reassign x, avoid it and write code like this
    end //when end is reached then it assigns x
endmodule
