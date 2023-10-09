`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2023 05:37:53 PM
// Design Name: 
// Module Name: mux_4x1_nbit
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

//parametrized 4x1 mux for n-bits
//by default n is 3
module mux_4x1_nbit
    #(parameter N=3)(
    input [N-1:0] w0, w1, w2, w3,
    input [1:0] s, //2-bit select
    output reg [N-1:0] f //output is a function of current inputs: combinational circuit, no sotrage elements should be included
    );
    
    always@ (w0, w1, w2, w3, s) //execute always loop whenever any of these variables change
    begin
        //structural representation 
        //f = s[1]?(s[0]? w3: w2) : (s[0]? w1: w0); //condition operator within a condition operator
        //if s[1] is true then the output is either w3 or w2 (depending on the value of s[0])
        //if s[1] is falase the output is either w1 or w0 (depending on the value of s[0])
        
        //behavioral representation
        //if-else method: advantages of this method are that it is more easily readable (order matters for if else)
        //PRIORITY ROUTING NETWORK
        //if else in an always statement vivado interprets this as a sequence of 2x1 mux connected and cascaded
//        if (s == 2'b00)
//            f = w0; //has the highest priority since 
//        else if (s == 2'b01)
//            f = w1;
//        else if (s == 2'b10)
//            f = w2;
//        else if (s == 2'b11)
//            f = w3; //lowest priority 
//        else
//            f = 'bx; //x = don;t care
            //if none of the above cases then there was a problem somewhere and we have f as a who knows how many bit don't care value
            
            
            
            
        //Case Statments:
        //parallel case: multiplexing network
        //basically a big multiplexer
        
        //default values: note they have NOTHING to do with case defaults
        f = 'bx; //if you miss a case or forget to assign f to an output it will be a don't care
                 //This is done to help avoid LATCHES in your hardware solution
        case(s)
            2'b00: f = w0;
            2'b01: f = w1;
            2'b10: f = w2;
            2'b11: f = w3;
            default f = 'bx; //default casse similar to above
        endcase
           
    end
    
endmodule
