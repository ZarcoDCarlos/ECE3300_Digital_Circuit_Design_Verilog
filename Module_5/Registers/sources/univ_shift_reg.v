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


module univ_shift_reg 
    #(parameter N = 4)(
        input clk, reset_n,
        input MSB_in, LSB_in,
        input [N-1:0] I,
        input [1:0] s,
        output [N-1:0] Q    
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
    always@(Q_reg, MSB_in, LSB_in, I)
    begin
        Q_next = Q_reg; //default value
        case(s)
            2'b00: Q_next = Q_reg;
            2'b01: Q_next = {MSB_in, Q_reg[N-1:0]};
            2'b10: Q_next = {Q_reg[N-2:0], LSB_in};
            2'b11: Q_next = I;
            default: Q_next = Q_reg;
    end
    
    //output logic
    assign Q = Q_reg; //you care to see q3, q2, q1, q0 of the registers
    
endmodule    