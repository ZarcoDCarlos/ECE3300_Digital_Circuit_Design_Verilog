`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 08:17:37 PM
// Design Name: 
// Module Name: adder_subtractor_nbit
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


module adder_subtractor_nbit
    # (parameter n = 4)
( 
    input [n-1:0] x, y,
    input add_n, //_n means that it s asserted when it is low (when control is zero it will add)
    output [n-1:0] s,
    output c_out
    );
    
    wire [n-1:0] xored_y;
    generate
        genvar k;
        
        for (k = 0; k < n; k =k+1) 
        begin
            assign xored_y[k] = y[k] ^add_n;
        end
        
    endgenerate
    
    rca_nbit #(.n(n)) A0 (
        .x(x),
        .y(xored_y),
        .c_in(add_n),
        .s(s),
        .c_out(cout)     
    );
    
endmodule
