`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2023 12:55:09 PM
// Design Name: 
// Module Name: arithmetic_operators
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

//Parametrized n-bit multi adder.
module arithmetic_operators
    #(parameter n = 4)
    (
        input [n-1:0] x,//n-1 since we want 4 bit numbers this will leave us with [3:0]
        input [n-1:0] y,
        output [n-1:0] s,
        output cout, overflow
    );
    
    wire [n:0] sum; // from 0 to n, o inclusive. So this wire is has n+1 bits. In this case where n = 4 this wire is 5 bits.
    
    /* Deleting the stars here shows the second to last revision made in lecture
    //Originally we wrote the followig line!
    //assign sum = {1'b0, x} + {1'b0, y}; //this is addition of two 5-bit numbers
    //the {} = concatenation operator helps concatenate different vectors/signals next to each other
    //anything after or before the comma are next to each other
    
    //but we can just write this: why does this simplified version still work despite trying to assign a 5-bit sum to 4-bit addition?
    assign sum = x + y;  
    //in verilog it will automatically add a zero before x and before y like we did manually in the concatenation in the comments. This can be dangerous
    //if the numbers are signed because adding a zero bit to a negative number will change the sign. 
    //to force a number to be signed you can do this: input signed [n-1:0] x,
    //now if you do the assignment of a 5 bit sum to the 4 bit x and y's it will add an extra 1 bit to the front if it is negative to keep the correct sign
      
    assign s = sum [n-1:0]; //s is the sum  output we chose in the beginning. We are particularly interested in the first 4 bits
    //This is because the last bit is the carry out (cout)
    assign cout = sum[n];// the carryout is the last bit in this case the 5th bit. sum[n] = sum[4] since n=4. this is the 5th bit!
    */
    
    //instead of doing all that mumbo jumbo above we can simply do this
    
    assign {cout, s} = x + y; //it is the same!
    //by default vivado will expand x and y depending on the MSB. if it is 0 it will expand with 0 and if it is 1 it will expand with 1
    
    assign overflow = (x[n-1] & y[n-1] & ~s[n-1]) | (~x[n-1] & ~y[n-1] & s[n-1]);
    //if x is positive and y is positive and the sum is not positive then overflow is 1
    //if x is negative and y is negative and sum is 0, then overflow is 1
    
     
    
endmodule
