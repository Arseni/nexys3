`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:32:09 06/04/2012 
// Design Name: 
// Module Name:    flop 
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
module flop
(
	input wire [12:0] one, other,
	output reg [12:0] result
);

wire signOne, signTwo, signResult;
wire [3:0] expOne, expTwo, expResult;
wire [7:0] mantOne, mantTwo, mantResult;

assign signOne = one[12];
assign signTwo = other[12];
assign expOne = one[11:8];
assign expTwo = other[11:8];
assign mantOne = one[7:0];
assign mantOther = other[7:0];

// Seite 109

endmodule
