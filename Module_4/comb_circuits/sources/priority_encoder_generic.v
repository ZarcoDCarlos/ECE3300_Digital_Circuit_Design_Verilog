`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2023 08:31:39 PM
// Design Name: 
// Module Name: priority_encoder_generic
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


module priority_encoder_generic
    #(parameter N = 4) //4x2 priority encoder by default
    (
        input [N-1:0] w,
        output z,
        output reg [$clog2(N)-1:0] y //number of outputs is based on the number of inputs
    );
    
    assign z = |w; //reduction operator: OR'ing every bit of w to see if we get z as 1
    //z is like a flag, it is high if any bit of w is 1 and 0 if there is no bit of w as 1
    
    integer k; //when you have a variable in an alwaays and a for loop without a generate
    always@(w)
    begin
        y = 'bx; //default value
        
        for(k = 0; k <N; k = k+1)
            if (w[k])
                y = k;       
    end
    
endmodule
