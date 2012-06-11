`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:43:29 06/06/2012
// Design Name:   flop
// Module Name:   C:/Users/fa/Documents/GitHub/nexys3/flop_test.v
// Project Name:  nexys3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: flop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module flop_test;

	// Inputs
	reg [12:0] one;
	reg [12:0] other;

	// Outputs
	wire [12:0] result;

	// Instantiate the Unit Under Test (UUT)
	flop_add uut (
		.one(one), 
		.other(other), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		one = 0;
		other = 0;

		// Wait 100 ns for global reset to finish
		#100;
		one   = 'b1101000000001;
		other = 'b0100100100010;
		#100;
        
		// Add stimulus here

	end
      
endmodule

