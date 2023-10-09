`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2023 08:15:01 PM
// Design Name: 
// Module Name: priority_encoder_4x2
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


module priority_encoder_4x2(
    input [3:0] w,
    output z,
    output reg [1:0] y
    );
    
    assign z = |w; //takes all the OR's of W and assigns that value to Z
    //Ex: w1 | w2 | w3 = z is what the preceding line says pretty much
    
    //priority encoder = should probalby use a Priority Routing Network
    // (if-else Statements)
    always@(w)
    begin
//        y=2'bxx; //default values
        
//        //if w[3] is asserted the output is the following.
//        if(w[3])  //w[3] is the highest priority!
//            y = 2'b11;
//        else if (w[2])
//            y = 2'b10;
//        else if (w[0]) //least priority
//            y = 2'b00;
//        else
//            y = 2'bxx;
        
        //multiplexing network implementation
        casex(w)
            4'b1xxx: y = 2'b11;
            4'b01xx: y = 2'b10;
            4'b001x: y = 2'b01;
            4'b0001: y = 2'b00;
            default: y = 2'bxx; 
        endcase        
    end
          
    
endmodule
