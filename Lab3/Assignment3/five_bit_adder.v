`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:00 01/28/2019 
// Design Name: 
// Module Name:    five_bit_adder 
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
module five_bit_adder(x, y, z, carry);
	input [4:0]x;
	input [4:0]y;
	output [4:0]z;
	wire [4:0]z;
	output carry;
	wire carry;
	wire [3:0]carry0;
	
	full_adder FA0 (x[0], y[0], 1'b0, z[0], carry0[0]);
	full_adder FA1 (x[1], y[1], carry0[0], z[1], carry0[1]);
	full_adder FA2 (x[2], y[2], carry0[1], z[2], carry0[2]);
	full_adder FA3 (x[3], y[3], carry0[2], z[3], carry0[3]);
	full_adder FA4 (x[4], y[4], carry0[3], z[4], carry);
endmodule
