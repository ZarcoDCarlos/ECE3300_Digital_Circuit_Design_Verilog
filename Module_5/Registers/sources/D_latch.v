`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 04:45:07 PM
// Design Name: 
// Module Name: D_latch
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

//level triggered
//behavioral modeling
module D_latch(
    input D,
    input clk,
    output reg Q, //needs to be a reg since it is assigned in an always statement
    output  Q_b //for q_bar or NOT of Q
    );
    
    assign Q_b = ~Q; //q_b = NOT of Q
    always@(D, clk)
    begin
        Q = Q;
        if (clk) //if clk is asserted (clk = 1)
            Q = D;
        else
            Q = Q;    //nothing changes if clk is 0
                      //else is not needed for sequential ckt but is included as a good habit since it is needed for combinational ckts
    end
    
endmodule
