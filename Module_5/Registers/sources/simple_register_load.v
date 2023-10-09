`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 05:04:57 PM
// Design Name: 
// Module Name: comparer_storage_elements
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


module simple_register_load
    #(parameter N = 4)(
        input clk,
        input load,
        input [N-1:0] I,
        output [N-1:0] Q    
    );
    
    
    //behavioral way
    reg [N-1:0] Q_reg, Q_next;
    always@(posedge clk)
    begin
        Q_reg <= Q_next;
    end
    
    // Next state logic
    
    always@(I, load)
    begin
        if(load)
            Q_next = I; //load in new value directly from the input
        else 
            Q_next = Q_reg;  //input is the output of the dflip flop   
    end
    
    assign A = Q_reg;
endmodule    