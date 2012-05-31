`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:35:20 05/28/2012 
// Design Name: 
// Module Name:    sseg_display 
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
module sseg_display
(
	input rst,
	input clk,
	input wire [7:0] value,
	output wire [3:0] sseg_an,
	output wire [7:0] sseg_sig
);

wire dp;
wire [3:0] digit [3:0];
wire [7:0] sseg_sig_mux [3:0];
reg [1:0] sseg_sel;

sseg sseg0 (digit[0], dp, sseg_sig_mux[0]);
sseg sseg1 (digit[1], dp, sseg_sig_mux[1]);
sseg sseg2 (digit[2], dp, sseg_sig_mux[2]);
sseg sseg3 (digit[3], dp, sseg_sig_mux[3]);

always @(posedge clk or rst)
begin
	if(rst == 1)
		sseg_sel <= 'b0;
	else
		sseg_sel <= sseg_sel + 1;
end

assign digit[0] = value[7:4];
assign digit[1] = value[3:0];

assign dp = 1;

assign sseg_sig =
	sseg_sel == 'd0 ? sseg_sig_mux[0] :
	sseg_sel == 'd1 ? sseg_sig_mux[1] :
	sseg_sel == 'd2 ? sseg_sig_mux[2] :
	sseg_sel == 'd3 ? sseg_sig_mux[3] :
	'bZ;

endmodule
