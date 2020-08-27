`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:50 01/27/2019 
// Design Name: 
// Module Name:    one_bit_comparator 
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
module one_bit_comparator(a, b, gtin, ltin, eqin, gt, lt, eq);
	input a, b;
	input gtin, ltin, eqin;
	output gt, lt, eq;
	wire gt, lt, eq;
  
	assign gt = (a & ~b & eqin) | (gtin);
	assign lt = (~a & b & eqin) | (ltin);
	assign eq = ((a & b) | (~a & ~b)) & eqin;
endmodule