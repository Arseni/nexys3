`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:07:50 06/13/2012 
// Design Name: 
// Module Name:    flop_mult 
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
module flop_mult
(
	input wire [12:0] one,
	input wire [12:0] other,
	output reg [12:0] result
);

reg [15:0] mant_mul, mant_norm;
reg [4:0] exp_mul, normalizer;
reg sign_mul;

always @*
begin
	mant_mul = one[11:4] * other[11:4];
	sign_mul = one[12] == other[12] ? 1 : 0;
	case({one[12], other[12]})
		'b00 : exp_mul = one[3:0] + other[3:0];
		'b01 : exp_mul = one[3:0] - other[3:0];
		'b10 : exp_mul = other[3:0] - one[3:0];
		'b11 : exp_mul = other[3:0] + one[3:0];
	endcase

	normalizer = (mant_mul[15] == 'b1)? -8 :
							 (mant_mul[14] == 'b1)? -7 :
							 (mant_mul[13] == 'b1)? -6 :
							 (mant_mul[12] == 'b1)? -5 :
							 (mant_mul[11] == 'b1)? -4 :
							 (mant_mul[10] == 'b1)? -3 :
							 (mant_mul[ 9] == 'b1)? -2 :
							 (mant_mul[ 8] == 'b1)? -1 :
							 (mant_mul[ 7] == 'b1)?  0 :
							 (mant_mul[ 6] == 'b1)?  1 :
							 (mant_mul[ 5] == 'b1)?  2 :
							 (mant_mul[ 4] == 'b1)?  3 :
							 (mant_mul[ 3] == 'b1)?  4 :
							 (mant_mul[ 2] == 'b1)?  5 :
							 (mant_mul[ 1] == 'b1)?  6 :
																			 7;
																			 
	mant_norm = mant_mul << normalizer;

end

endmodule
