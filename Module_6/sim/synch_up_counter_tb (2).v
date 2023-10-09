`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 03:12:00 PM
// Design Name: 
// Module Name: asynch_up_counter_tb
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


module asynch_up_counter_tb(

    );
    
    // Declare local reg and wire identifiers
    reg clk, reset_n;
    wire [3:0] Q;
    
    
    // Instantiate the module under test
    asynch_up_counter uut(
        .clk(clk),
        .reset_n(reset_n),
        .Q(Q)
    );
    
    // timer
    initial
        #200 $stop; //stop after 200 ns
        
    // Generate stimuli:
    
    //Generating a clk signal
    localparam T = 10;
    always
    begin
        clk = 1'b0;
        #(T/2);
        clk = 1'b1;
        #(T/2);
    end    
    
    initial
    begin
        // issue a quick reset for 2 ns
            reset_n = 1'b0;
       #2   reset_n = 1'b1;
    end
    
     
endmodule
