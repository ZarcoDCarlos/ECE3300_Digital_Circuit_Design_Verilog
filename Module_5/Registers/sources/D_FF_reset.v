`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 07:07:26 PM
// Design Name: 
// Module Name: D_FF_reset
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


module D_FF_reset(
    input clk,
    input D,
    input reset_n, //asynchronous (regardless of the clock)
    input clear_n,  //synchronous clear (based on the clock)
    output Q
    );
    
    reg Q_reg, Q_next;
    
    always@(negedge clk,  negedge reset_n)
    begin
        Q_reg <= Q_reg; 
        if (!reset_n) //if reset_n is not asserted
            Q_reg <= 1'b0; //set Q_reg to 0
        else
            Q_reg <= Q_next;
    end
    
    always@(D, clear_n)
    begin
    Q_next = Q_reg;
        if(!clear_n)
            Q_next = D;
        else
            Q_next = D;    
    end
    
    assign Q = Q_reg;
    
endmodule
