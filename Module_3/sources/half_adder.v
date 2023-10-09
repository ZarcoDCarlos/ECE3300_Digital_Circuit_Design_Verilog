`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 04:58:55 PM
// Design Name: 
// Module Name: half_adder
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


module half_adder(
    input x, y,
    output c, s
    );
    
    //Structural Modeling, more specifically Dataflow modeling
    assign s = x ^ y; // XOR symbol in verilog is ^
    
    assign c = x & y; 
    
endmodule
