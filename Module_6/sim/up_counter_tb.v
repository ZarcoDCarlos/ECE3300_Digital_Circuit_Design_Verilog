`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 06:03:39 PM
// Design Name: 
// Module Name: up_counter_tb
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


module up_counter_tb(
    
    );
    
    // Declare local reg and wire identifiers
    localparam BITS = 4;
    reg clk, reset_n;
    wire [BITS-1:0] Q;
    
    //instantiate moudle under test
    up_counter #(.BITS(BITS)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q)
    );
    
    
    // Timer
    initial
        #200 $Stop;
     
     
     // Generate stimuli
     
     // Generating a clk signal
     localparam T = 10;
     always
     begin
        clk = 1'b0;
        #(T/2)
        clk = 1'b1;
        #(T/2);
     end 
     
     initial
     begin
        // issue a quick reset for 2ns
            reset_n = 1'b0;
         #2 reset_n = 1'b1;
     end
    
    
endmodule
