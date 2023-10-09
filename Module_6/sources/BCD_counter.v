`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 07:54:38 PM
// Design Name: 
// Module Name: BCD_counter
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

//modulo 10
// counts from 0-9 (9 inclusive)
module BCD_counter (
    input clk,
    input reset_n,
    input enable,
    input done,
    output [3:0] Q
    );
    
    reg [3:0] Q_reg, Q_next;
    
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
    assign done = Q_reg ==9;
    
    always@(*)
        Q_next = done ? 'b0: Q_reg + 1; //if done = 1, Q_ next is 0 and count is reset, else keep counting until done
    
    //Output Logic
    assign Q = Q_reg;
endmodule
