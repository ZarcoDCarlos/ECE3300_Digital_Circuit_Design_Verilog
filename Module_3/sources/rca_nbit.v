`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2023 06:05:18 PM
// Design Name: 
// Module Name: rca_nbit
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

//parametrized ripple carry adder!
module rca_nbit
    #(parameter n = 4) //a parameter is used only in the code it is not a signal, input, or output
    //generally you define a parameter. here it is 4, unless otherwise stated in your code it iwll run with n = 4!
    (
    input [n-1:0] x, y,
    input c_in,
    output [n-1:0] s,
    output c_out
    );
    
    wire [n:0] c; //c goes from 0-n because in the diagram there is an n+1 number of wires
    assign c[0] = c_in;//c[0] = cin at the beginning of the circuit
    assign c_out = c[n]; //c[n] is c-out at the end of the circuit. We have our final output as c_out!
    
    
    //generate and endgenerate are typically used for REPLICATED HARDWARE STRUCTURES
    //this is when the structures are based on a certain pattern and are generated many times
    //here we will use it to instantiate n-amount of adders 
    generate
        genvar k; //genvar = generate variable type is an integer that cannot take negative values
        //vivado does have integers and in c you  might write int k; to initialize the variable
        // but in verilog when you have a for loop in a generate section, you have to use genvar
        
        for (k=0; k < n; k = k+1) // k++ isn't a thing in verilog so you have to use k+1
        begin: stage //begin and end in place of {} brackets 
                     //the :stage will make the names more clear in the eleaborated design for each adder. they will be stage[0], stage[1] stage[2] etc...
            full_adder FA (
                .x(x[k]),
                .y(y[k]),
                .c_in(c[k]),  //carry in is previous cout 
                .s(s[k]),
                .c_out(c[k+1]) //the input of .cout is c[k+1] because the output is the index of the next #amount of adders instantiated
            );
        
        end
    endgenerate
    
    
endmodule
