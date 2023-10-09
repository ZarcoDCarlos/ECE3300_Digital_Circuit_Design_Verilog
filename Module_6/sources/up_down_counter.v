`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 06:19:48 PM
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter
    #(parameter BITS = 4)(
    input clk,
    input reset_n,
    input enable,
    input up, // when asserted the counter is up counter; otherwise it is a down couner
    output [BITS-1:0] Q
    );
    
    reg [BITS-1:0] Q_reg, Q_next;
    
    always@(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next; 
        else 
            Q_reg <= Q_reg;      // if enable is 0 then the value stays as the current value 
    end
    
    // Next state logic
    always@(Q_reg, up)
    begin
        Q_next = Q_reg; //default just in case
        if (up)
            Q_next = Q_reg +1;
        else 
            Q_next = Q_reg -1;         
    end     
    
    // output logic
    assign Q = Q_reg;
    
endmodule
