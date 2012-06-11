`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:31:54 06/11/2012 
// Design Name: 
// Module Name:    flop_greaterthan 
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
module flop_greaterthan
(
	input wire [12:0] first,
	input wire [12:0] second,
	output reg isFirstGreater
);

reg isFirstGreater_abs;

always @*
begin
	if (first[3:0] > second[3:0])
		isFirstGreater_abs = 1;
	else if(fist[11:0] > second[11:0])
		isFirstGreater_abs = 1;
	else
		isFirstGreater_abs = 0;
end

always @*
begin
	if (first[12:0] == second[12:0])
		isFirstGreater = 0;
	else if ( first[12] == 0)
		isFirstGreater = ~isFirstGreater_abs;
	else
		isFirstGreater = isFirstGreater_abs;
end

endmodule
