`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 05:52:21 PM
// Design Name: 
// Module Name: up_counter
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

// by default counts from 0-15
module up_counter
    #(parameter BITS = 4)(
    input clk,
    input reset_n,
    input [BITS-1:0] Q
    );
    
    reg [BITS-1:0] Q_reg, Q_next; // Q_reg = current value and next is next value
    
    always@(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 'b0;
        else
            Q_reg <= Q_next;
    end
    
    // Next state logic
    always@(Q_reg)
    begin
        Q_next = Q_reg +1; //next value in a counter is the current value +1 // to count down change +1 to -1
    end
    
    assign Q = Q_reg;
    
endmodule
