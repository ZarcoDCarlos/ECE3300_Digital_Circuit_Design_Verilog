`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2023 05:14:53 PM
// Design Name: 
// Module Name: compare_storage_elements_tb
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


module compare_storage_elements_tb(

    );
    
    // 1. Declare local reg (input) and wire (output)
    reg clk, D;
    wire Q_latch, Q_ff_pos, q_ff_neg; //qa,qb, qc
    
    
    // 2. Instantiate the unit under test (uut)
    compare_storage_elementsuut(
        .D(D),
        .clk(clk),
        .Qa(Q_latch),
        .Qb(Q_ff_pos),
        .Qc(Q_ff_neg)
    );
    
    // 3. generate stimuli using initial and always
    
    //generating a clock: parametrized clock period
    localparam T = 20; // clock period
    
    always //runs forever (notice there is no sensitivity list like an always@ needs)
    begin
        clk=1'b0;
        #(T/2);
        clk = 1'b1;
        #(T/2);
    end
    
    initial //runs one time
    begin
        D = 1'b1;
        
        #(2 * T) //wait for two clock periods
        D = 1'b0;
        
        @(posedge clk); //at next pos edge change D to 1
        D = 1'b1;
        
        #2 D = 1'b0;
        #3 D = 1'b1;
        #4 D = 1'b0;
        
        repeat(2) @(negedge clk); //wait for 2 neg edge of the clock then do the following line
        D = 1'b1;
        
        #20 $stop; //wait for 20 ns then stop
        
    end
    
endmodule
