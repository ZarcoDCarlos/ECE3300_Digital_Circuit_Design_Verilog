`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 05:03:00 PM
// Design Name: 
// Module Name: D_FF_pos
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


//note Q_b is not included but to see how to do it reference D_latch it is the same as there
//behavioral modeling
//negative edge triggered
module D_FF_pos(
    input D,
    input clk,
    output reg Q
    );
    
    always @(posedge clk)
    begin
        Q = D;
    end
    
    
endmodule
