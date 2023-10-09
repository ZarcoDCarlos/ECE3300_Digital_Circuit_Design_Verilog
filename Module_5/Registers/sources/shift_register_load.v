`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 08:33:37 PM
// Design Name: 
// Module Name: shift_register_load
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


module shift_register_load
    #(parameter N = 4)(
        input clk,
        input SI,
        input [N-1:0] I,
        input load, //if load is o it will shift, if load = 1 it will load
        input reset_n,
        output [N-1:0] Q, //if we care about the content
        output SO 
    );
    
    //behavioral way
    reg [N-1:0] Q_reg, Q_next;
    
    always@(posedge clk, negedge reset_n) //asynchronous
    begin
        if(!reset_n)
            Q_reg <= 1'b0;
        else    
            Q_reg <= Q_next;
    end
    
    //Next state logic
    always@(SI, Q_reg)
    begin
        if (load)
            Q_next =I;
        else
        //right shift
        Q_next = {SI, Q_reg[N-1:1]};
        
        //left shift
        //Q_next = {Q_reg[N-2:0], SI};
    end
    
    assign SO = Q_reg[0]; //if you only care about the serial output
    assign Q = Q_reg; //you care to see q3, q2, q1, q0 of the registers
    
endmodule
