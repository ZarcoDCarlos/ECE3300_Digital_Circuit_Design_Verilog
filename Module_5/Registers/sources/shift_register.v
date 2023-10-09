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


module shift_register
    #(parameter N = 4)(
        input clk,
        input SI,
        //output [N-1:0] I //if we care about the content
        output SO 
    );
    
    //behavioral way
    reg [N-1:0] Q_reg, Q_next;
    
    always@(posedge clk)
    begin
        Q_reg <= Q_next;
    end
    
    //next state logic
    always@(SI, Q_reg)
    begin
        //right shift
        Q_next = {SI, Q_reg[N-1:1]};
        
        //left shift
        //Q_next = {Q_reg[N-2:0], SI};
    end
    
    assign SO = Q_reg[0]; //if you only care about the serial output
    assign Q = Q_reg; //you care to see q3, q2, q1, q0 of the registers
endmodule    