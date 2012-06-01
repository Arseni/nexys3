`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:31:46 06/01/2012 
// Design Name: 
// Module Name:    smadder 
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
module smadder
#(parameter N = 4)
(
	input wire [N-1:0] a, b,
	output reg [N-1:0] sum
);

reg [N-2:0] mag_a, mag_b, mag_sum, max, min;
reg sgn_a, sgn_b, sgn_sum;

always @*
begin
	mag_a = a[N-2:0];
	mag_b = b[N-2:0];
	sgn_a = a[N-1];
	sgn_b = b[N-1];
	
	// GET Min & Max 
	if(mag_a > mag_b)
	begin
		max = mag_a;
		min = mag_b;
		sgn_sum = sgn_a;
	end
	else
	begin
		max = mag_b;
		min = mag_a;
		sgn_sum = sgn_b;
	end
	
	if (sgn_a == sgn_b)
		mag_sum = max + min;
	else
		mag_sum = max - min;	

sum = {sgn_sum, mag_sum};
end

endmodule
