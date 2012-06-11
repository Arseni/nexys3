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
	input wire [12:0] value,
	output reg [3:0] sseg_an,
	output reg [7:0] sseg_sig
);

reg [3:0] digit [3:0];
reg [7:0] sseg_sig_mux [3:0];
reg [1:0] sseg_sel;

sseg sseg0 (digit[0], 'b1, sseg_sig_mux[0]);
sseg sseg1 (digit[1], 'b0, sseg_sig_mux[1]);
sseg sseg2 (digit[2], 'b0, sseg_sig_mux[2]);
sseg sseg3 (digit[3], 'b0, sseg_sig_mux[3]);

always @(posedge clk or rst)
begin
	if(rst == 1)
		sseg_sel <= 'b0;
	else
		sseg_sel <= sseg_sel + 1;
end

always @*
begin
	case (sseg_sel)
	'd0: begin
		sseg_sig = sseg_sig_mux[0];
		sseg_an = 'b0001;
	end
	'd1: begin
		sseg_sig = sseg_sig_mux[1];
		sseg_an = 'b0010;
	end
	'd2: begin
		sseg_sig = sseg_sig_mux[2];
		sseg_an = 'b0100;
	end
	'd3: begin
		sseg_sig = sseg_sig_mux[3];
		sseg_an = 'b1000;
	end
	default: begin
		sseg_sig = 'bZ;
		sseg_an = 'bZ;
	end
	endcase
end

endmodule
