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

//parametrized simple register
//N says howw many registers of FLip Flops there are
module simple_register
    #(parameter N = 4)(
        input clk,
        input [N-1:0] I,
        output [N-1:0] Q
    );
    
    
    
    //behavioral way
    reg [N-1:0] Q_reg, Q_next;
    always@(posedge clk)
    begin
        Q_reg <= Q_next;
    end
    
    always@(I)
    begin
        Q_next = I;
    end
    
    assign A = Q_reg;
    
    /*
    //replicated structure so we do the following
    genvar k;
    generate
        for (k = 0; k < N;  k = k+1)
        begin: FF
            D_FF_rest(
                .clk(clk),
                .D(I[k]),
                .Q(Q[k]),
                .reset_n(),
                .clear_n()
            );
        end
    endgenerate
    */
endmodule