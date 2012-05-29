`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:35:40 05/28/2012
// Design Name:   sseg
// Module Name:   C:/xilinxProjects/tutorials/1DFF/DFF/sseg_test.v
// Project Name:  DFF
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sseg
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sseg_test;

	// Inputs
	reg [3:0] digit;
	reg dp;

	// Outputs
	wire [7:0] sseg;

	// Instantiate the Unit Under Test (UUT)
	sseg uut (
		.digit(digit), 
		.dp(dp), 
		.sseg(sseg)
	);

	initial begin
		// Initialize Inputs
		digit = 0;
		dp = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here
		dp = 1;
		#10;
		dp = 0;
		
		forever
		begin
			digit = digit + 1;
			#10;
		end

	end
      
endmodule

