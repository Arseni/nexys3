`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:29 05/27/2012 
// Design Name: 
// Module Name:    sseg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module sseg
(
	input wire [3:0] digit,   // digital in
	input wire dp,						// Digit Point
	output reg [7:0] sseg    // seven sig + dp out
);


always @*
begin
	case (digit)
	4'h0 : sseg[6:0] = 7'b0000001;
	4'h1 : sseg[6:0] = 7'b1001111;
	4'h2 : sseg[6:0] = 7'b0010101;
	4'h3 : sseg[6:0] = 7'b0000110;
	4'h4 : sseg[6:0] = 7'b1001100;
	4'h5 : sseg[6:0] = 7'b0100100;
	4'h6 : sseg[6:0] = 7'b0100000;
	4'h7 : sseg[6:0] = 7'b0001111;
	4'h8 : sseg[6:0] = 7'b0000000;
	4'h9 : sseg[6:0] = 7'b0000100;
	default: sseg[6:0] = 7'b1111111;
	endcase
	sseg[7] = dp;
end

endmodule
