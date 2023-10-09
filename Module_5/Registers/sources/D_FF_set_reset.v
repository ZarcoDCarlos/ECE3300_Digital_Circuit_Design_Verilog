`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 07:21:01 PM
// Design Name: 
// Module Name: D_FF_set_reset
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


module D_FF_set_reset(
    input clk,
    input D,
    input reset_n, //asynchronous (regardless of the clock)
    input set_n,  //synchronous clear (based on the clock)
    output Q
    );
 
    reg Q_reg, Q_next;
    
    always@(negedge clk,  negedge reset_n) //asynchronous reset
    begin
        Q_reg <= Q_reg; 
        if (!reset_n) //if reset_n is not asserted
            Q_reg <= 1'b0; //set Q_reg to 0
        else
            Q_reg <= Q_next;
    end
    
    always@(D, set_n) //synchronous reset (only does it if active edge comes in)
    begin
        Q_next = Q_reg;
        if(!set_n)
            Q_next = 1'b1;
        else    
            Q_next = D;    
    end
    
    assign Q = Q_reg;
        
endmodule
