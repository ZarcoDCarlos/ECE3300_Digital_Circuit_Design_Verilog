`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 06:03:56 PM
// Design Name: 
// Module Name: ff_block_nonblock
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


module ff_block_nonblock(
    input D,
    input clk,
    output reg Q1,
    output reg Q2
    );

    always@(posedge clk)
    begin
        Q1 <= D;
        Q2 <= Q1; 
    end

endmodule
