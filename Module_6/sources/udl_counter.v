`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 07:04:28 PM
// Design Name: 
// Module Name: udl_counter
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

// like the up_down_counter but this also has a parallel load
module udl_counter
    #(parameter BITS = 4)(
    input clk,
    input reset_n,
    input enable,
    input up, // when asserted the counter counts up; otherwise it is a down counter
    input load,
    input [BITS-1:0] D, // continues counting from the loaded counter
    output [BITS-1:0] Q
    );
    
        
    reg [BITS-1:0] Q_reg, Q_next;
    
    always@(posedge clk, negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= 'b0;
        else if(enable)
            Q_reg <= Q_next; 
        else 
            Q_reg <= Q_reg;      // if enable is 0 then the value stays as the current value 
    end
    
    // Next state logic
    always@(*) // vivado figures out the sensitivity list for me 
    begin
        Q_next = Q_reg;
        casex({load, up}) //if you don't use a case x it tries to find a literal 1x for the final case instead of a DONT CARE
            2'b00: Q_next = Q_reg - 1;
            2'b01: Q_next = Q_reg + 1;
            2'b1x: Q_next = D; 
            default: Q_next = Q_reg; 
        endcase              
    end     
    
    // output logic
    assign Q = Q_reg;
    
    
    
endmodule
