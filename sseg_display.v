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
	input clk,
	input wire [3:0] digit [0:3],
	input wire dp [0:3],
	output wire [3:0] sseg_sel,
	output wire [7:0] sseg_sig
);

wire [7:0] sseg_sig_mux [0:3];
reg [2:0] enable;

sseg sseg0 [3:0] (digit, dp, sseg_sig_mux);

always @(posedge clk)
begin
	enable <= enable + 1;
end

assign sseg_sig =
	enable == 'd0 ? sseg_sig_mux[0] :
	enable == 'd1 ? sseg_sig_mux[1] :
	enable == 'd2 ? sseg_sig_mux[2] :
	enable == 'd3 ? sseg_sig_mux[3] :
	'bZ;

endmodule
