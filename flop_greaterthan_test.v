`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:48:48 06/12/2012
// Design Name:   flop_greaterthan
// Module Name:   C:/Users/fa/Documents/GitHub/nexys3/flop_greaterthan_test.v
// Project Name:  nexys3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: flop_greaterthan
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module flop_greaterthan_test;

	// Inputs
	reg [12:0] first;
	reg [12:0] second;
	reg reset;

	// Outputs
	wire isFirstGreater;

	// Instantiate the Unit Under Test (UUT)
	flop_greaterthan uut (
		.first(first), 
		.second(second), 
		.isFirstGreater(isFirstGreater)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		// Wait 100 ns for global reset to finish
		#100;
    reset = 0;
		// Add stimulus here
	end
	
	always
	begin
		if(reset)
		begin
			first = 'b1100000000001;
			second = 'b1100000000001;
			#100;
		end
		else
		begin
			#100;
			first = first + 1;
			#100;
			second = second + 1;
		end
	end
      
endmodule

