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
module flop_add
(
	input wire [12:0] one, other,
	output reg [12:0] result
);

reg signBig, signSmall, signResult;
reg [3:0] expBig, expSmall, expDiff, normalizer, expResult;
reg [7:0] mantBig, mantSmall, mantSmallAligned, mantSumNorm, mantResult;
reg [8:0] mantSum;

always @*
begin
	if ({one[3:0], one[11:4]} > {other[3:0], other[11:4]}) // set exp to most significant for check
	begin
		signBig = one[12];
		signSmall = other[12];
		mantBig = one [11:4];
		mantSmall = other[11:4];
		expBig = one[3:0];
		expSmall = other[3:0];
	end
	else
	begin
		signBig = other[12];
		signSmall = one[12];
		mantBig = other[11:4];
		mantSmall = one[11:4];
		expBig = other[3:0];
		expSmall = one[3:0];
	end

	expDiff = expBig - expSmall;
	mantSmallAligned = mantSmall >> expDiff;

	mantSum = signBig == signSmall ?
				{1'b0, mantBig} + {1'b0, mantSmallAligned}:
				{1'b0, mantBig} - {1'b0, mantSmallAligned};
				
	normalizer = mantSum[7] ? 'o0 :
				 mantSum[6] ? 'o1 :
				 mantSum[5] ? 'o2 :
				 mantSum[4] ? 'o3 :
				 mantSum[3] ? 'o4 :
				 mantSum[2] ? 'o5 :
				 mantSum[1] ? 'o6 :
				 'o7;
				 
	mantSumNorm	= mantSum[7:0] << normalizer;
	
	if(mantSum[8])
	begin
		expResult = expBig + 1;
		mantResult = mantSum[8:1];
	end
	else if (normalizer > expBig)
	begin
		expResult = 0;
		mantResult = 0;
	end
	else
	begin
		expResult = expBig - normalizer;
		mantResult = mantSumNorm;
	end
  
	signResult = signBig == signSmall ? 1 : signBig;

	result = {signResult, mantResult, expResult};
	
end // always @*
// Seite 109

endmodule
