`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 09:03:21 PM
// Design Name: 
// Module Name: adder_subtractor
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


module adder_subtractor
 # (parameter n = 4)
( 
    input [n-1:0] x, y,
    input add_n, //_n means that it s asserted when it is low (when control is zero it will add)
    output [n-1:0] s,
    output c_out,
    output overflow // if overflow is high there is something wrong!
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
    
    assign overflow = (x[n-1] & xored_y[n-1] & ~s[n-1]) | (~x[n-1] & ~xored_y[n-1] & s[n-1]);
    //Left side of the equation says this: MSB of X & MSB of xored_y & MSB of S is opposite 
    //basically if the MSB of x and y are negative & msb of output is positve then overflow is 1 (addition of two negatives should not be positive answers)
    //Right side says: if ~x is 1 and ~y_xor is 1 & MSB of S is 1 then overflow is 1 (because addition of two positive numbers should not be a negative answer)
endmodule
