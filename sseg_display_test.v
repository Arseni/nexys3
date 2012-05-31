`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:33:51 05/31/2012
// Design Name:   sseg_display
// Module Name:   C:/Users/fa/Documents/GitHub/nexys3/sseg_display_test.v
// Project Name:  nexys3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sseg_display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sseg_display_test;

	// Inputs
	reg rst;
	reg clk;
	reg [7:0] value;

	// Outputs
	wire [3:0] sseg_an;
	wire [7:0] sseg_sig;

	// Instantiate the Unit Under Test (UUT)
	sseg_display uut (
		.rst(rst),
		.clk(clk), 
		.value(value), 
		.sseg_an(sseg_an), 
		.sseg_sig(sseg_sig)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		value = 0;

		// Wait 100 ns for global reset to finish
		#100;
    rst = 0;
		// Add stimulus here
		forever
		begin
			clk = !clk;
			#10;
		end
	end
	
	always begin
		#100;
		value = value + 1;
	end
      
endmodule

