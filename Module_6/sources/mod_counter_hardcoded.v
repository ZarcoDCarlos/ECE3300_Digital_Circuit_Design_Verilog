`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 07:21:24 PM
// Design Name: 
// Module Name: mod_counter_input
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

//modulus 8 counter
// counts up from 0 to hardcoded number of 7, then starts over (7 inclusve)
module mod_counter_hardcoded
    #(parameter BITS = 4)(
    input clk,
    input reset_n,
    input enable,
    output [BITS-1:0] Q
    );
    
    reg [BITS-1:0] Q_reg, Q_next;
    wire done; // if asserted then it is done counting
    always@(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next; 
        else
            Q_reg <= Q_reg;         
    end
    
    // Next State logic
    assign done = Q_reg ==7;
    
    always@(*)
        Q_next = done ? 'b0: Q_reg + 1; //if done = 1, Q_ next is 0 and count is reset, else keep counting until done
    
    //Output Logic
    assign Q = Q_reg;
endmodule