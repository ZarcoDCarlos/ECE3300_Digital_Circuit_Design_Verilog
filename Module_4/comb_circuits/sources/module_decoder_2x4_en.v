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
module decoder_2x4_en(
    input [1:0] w,
    input en,
    output reg [0:3] y //4-bits still: LSB = index of 3 and MSB = 0
    );
    
    //behavioral modeling:
    always @(w, en) // the () contains the sensitivity list in this case w
    begin
        //default value for y
        y = 4'b0000;
        

        //easier way 
        if (en)
            y[w] = 1'b1;
        else
            y=4'b0000;
        
    end 
     
endmodule
