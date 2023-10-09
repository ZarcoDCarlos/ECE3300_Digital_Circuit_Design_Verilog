`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2023 05:58:59 PM
// Design Name: 
// Module Name: mux_generic_1bit
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

//multiplexer with unknown number of inputs, the inputs are parametrized
//each input is 1-bit
module mux_generic_1bit
    #(parameter INS = 6)
    (
        input [INS-1:0] w,
        input [$clog2(INS)-1:0]s,
        output reg f 
    );
    
    integer k; //cannot use genvar k because it is not a generate for loop
    always@(w, s) //if any w or s changes execute this!!
    begin
        f = 'bx; //gets rid of a latch in the code
        for(k = 0; k < INS; k = k+1)
            //if statement = priority routing network: cascading mux's
            if (k == s) //if the value of k is the same as the select then the output is that value
                f = w[k];
    
    end
    
endmodule
