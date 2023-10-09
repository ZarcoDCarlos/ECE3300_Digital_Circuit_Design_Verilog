`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2023 05:24:59 PM
// Design Name: 
// Module Name: mux_2x1_nbit
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

//Parametrized nbit 2x1 MUX
module mux_2x1_nbit
    #(parameter N = 3)(
    input [N-1:0] w0,
    input [N-1:0] w1,
    input s, //select
    output reg [N-1:0] f //any output within an always statement is a register so use reg keyword!
    );
    
    
    
    always @(w0, w1, s) //execute if w0, w1, or s is changed
    begin
        //conditioning operator
         f = s?w1:w0; // A?:B:C this means What is the status of A is it asserted or not asserted?
        //if A is asserted return B and if not assert w0.
        //Based on s it will assign the corresponding output
        //don't need an assign keyword because it is not a continuous assignment anymore it is a procedural assignment
        //meaning it is only assigning when there is a change to w0, w1, s
    
    end
    
endmodule
