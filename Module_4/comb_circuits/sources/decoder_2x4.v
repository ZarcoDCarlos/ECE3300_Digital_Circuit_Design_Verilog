`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2023 07:22:16 PM
// Design Name: 
// Module Name: decoder_2x4
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

//2-bit input
module decoder_2x4(
    input [1:0] w,
    output reg [0:3] y //4-bits still: LSB = index of 3 and MSB = 0
    );
    
    //behavioral modeling:
    always @(w) // the () contains the sensitivity list in this case w
    begin
        //default value for y
        y = 4'b0000;
        
        
//        //if else = priority routing network
//        if (w == 2'b00) //2-bit 00
//            y = 4'b1000;   
//        else if (w == 2'b01)
//            y[1] = 1'b1;
//        else if (w == 2'b10)
//            y[2] = 1'b1;
//        else if (w == 2'b11)
//            y[3] = 1'b1;
//        else 
//            y = 4'b0000;
         
//         //multiplexing network
//         case(w) 
//            0: y = 4'b1000; //if w = 0, then y0 = 1 and the rest are zeroes. 
//                            //this is backwards because when we created the output y, we made it 4 bit using [0:3]
//            1: y = 4'b0100;
//            2: y = 4'b0010;
//            3: y = 4'b0001;
//            default: y = 4'b0000;
//          endcase

        //easier way
        
        y[w] = 1'b1;
        
    end 
     
endmodule
