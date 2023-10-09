`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 02:35:30 PM
// Design Name: 
// Module Name: T_FF
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


module T_FF(
    input clk,
    input T,
    input reset_n,
    output Q
    );
    
    // clock to q delay: the time it takes for flip flop to reflect some change in the output after a clock comes in 
    // I want from the positivive edge of the clock to when Q is updated to be a 2 ns delay: only for the simulation, in real life on the FPGA
    // the delay is based on the physical characteristics of the device
    localparam C2Q_DELAY = 2; // for simulation only
    
    reg Q_reg;
    wire Q_next;
    
    always@(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 1'b0;
        else
            #C2Q_DELAY Q_reg <= Q_next; // creates an artificial delay between taking the next value and updating the current value
    
    end
    
    // Next State Logic 
    assign Q_next = T ? ~Q_reg: Q_reg; //if T = 1 take comp of Q if not then output is just Q
    
    //output
    assign Q = Q_reg; 
    
    
endmodule
