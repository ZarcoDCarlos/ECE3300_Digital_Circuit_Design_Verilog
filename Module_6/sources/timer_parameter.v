`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 08:13:52 PM
// Design Name: 
// Module Name: timer_parameter
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

//done is asserted everytime the finalvalue is reached after the specified amount of time
module timer_parameter
    #(parameter FINAL_VALUE = 255 )(
    input clk,
    input reset_n,
    input enable,
    //output [BITS-1:0] Q
    output done
    );
    
    localparam BITS = $clog2(FINAL_VALUE);
    
    reg [BITS-1:0] Q_reg, Q_next;
    wire done; // if asserted then it is done counting
    
    always@(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next; 
        else
            Q_reg <= Q_reg;         
    end
    
    // Next State logic
    assign done = Q_reg ==FINAL_VALUE;
    
    always@(*)
        Q_next = done ? 'b0: Q_reg + 1; //if done = 1, Q_ next is 0 and count is reset, else keep counting until done
    
   
endmodule
