`timescale 1ns / 1ps //timescale is in nanoseconds!! 
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2023 02:41:59 PM
// Design Name: 
// Module Name: adder_subtractor_tb
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


module adder_subtractor_tb(

    );
    
    // 1. Declare local reg and wire identifiers
    //reg = inputs and outputs are wires generally
    parameter n= 4;
    
    //inputs:
    reg [n-1:0] x, y;
    reg add_n;
    
    //outputs:
    wire [n-1:0] s;
    wire c_out, overflow;
    
    // 2. Instantiate the module under test
    adder_subtractor #(.n(n)) uut (
        .x(x),
        .y(y),
        .add_n(add_n),
        .s(s),
        .c_out(c_out),
        .overflow(overflow)
    );
    
    // 3. Specify a stopwatch to stop the simulation
    initial //initial = like an always statement that always runs once!!
    begin
        #40 $finish; //after 40 nanoseconds finish the simulation
        //the timescale is at the top of the code 
    end
    
    // 4. Generate stimuli, using initial and always
    //test vector generation
    //needs to be either in an always statement or an initial
    
    initial
    begin
        add_n = 1'b0; //1bit 0
        x = 4'd5; //4 bit decimal 5
        y = 4'd6; //4bit decimal 6
        
        #10 //wait for 10 nanoseconds
        add_n = 1'b1; //changes the value of add_n to 1 
        
        #10
        x = 4'd6; //4bit decimal 6
        y = -4'd3;//4bit decimal -3
        
        #10
        add_n = 1'b0;
        x = -4'd4; //4bit decimal -4
        y = -4'd5; //4bit decimal -5
        
        #10; //you have to wait a little after the last change otherwise you won't see the change in the simulation 
        //need semicolon here for some reason
    end
    
    // 5. Display the output response (text or graphics or both)
    //displaying through text:
    initial
    begin
        $monitor("time = %3d: x = %d \t y = %d \t add_n = %1b \t result = 3d% \t cout = %1b \t overflow = %1b",
        $time, x, y, add_n, s, c_out, overflow);
        //display time in 3-decimal digits
        //display x and y in decimal 
        //display 1-digit binary add_n
        //display 3-decimal result
        
    end
    
endmodule
