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


module comparer_storage_elements(
    input D,
    input clk,
    output Qa,
    output Qb,
    output Qc
    );
    
    D_latch L0 (
        .D(D),
        .clk(clk),
        .Q(Qa),
        .Q_b()
    );
    
    D_FF_pos FF0 (
        .D(D),
        .clk(clk),
        .Q(Qb)
    );
    
    D_FF_neg FF1 (
        .D(D),
        .clk(clk),
        .Q(Qc)
    );
    
endmodule
