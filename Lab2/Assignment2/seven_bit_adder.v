`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:59 01/21/2019 
// Design Name: 
// Module Name:    seven_bit_adder 
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
/*module seven_bit_adder(x, y, z, carry);
	input [6:0]x;
	input [6:0]y;
	output [6:0]z;
	wire [6:0]z;
	output carry;
	wire carry;
	wire [5:0]carry0;
	
	full_adder FA0 (x[0], y[0], 1'b0, z[0], carry0[0]);
	full_adder FA1 (x[1], y[1], carry0[0], z[1], carry0[1]);
	full_adder FA2 (x[2], y[2], carry0[1], z[2], carry0[2]);
	full_adder FA3 (x[3], y[3], carry0[2], z[3], carry0[3]);
	full_adder FA4 (x[4], y[4], carry0[3], z[4], carry0[4]);
	full_adder FA5 (x[5], y[5], carry0[4], z[5], carry0[5]);
	full_adder FA6 (x[6], y[6], carry0[5], z[6], carry);	
	
endmodule
*/

module seven_bit_adder(pb1, pb2, pb3, pb4, y, z, carry);
	input pb1; input pb2; input pb3; input pb4;
	input [3:0]y;
	output [6:0]z;
	wire [6:0]z;
	output carry;
	wire carry;
	reg [6:0]a;
	reg [6:0]b;
	wire [5:0]carry0;
	
	always @(posedge pb1) begin
		a[3:0] <= y;
	end
	
	always @(posedge pb2) begin
		a[6:4] <= y[2:0];
	end
	
	always @(posedge pb3) begin
		b[3:0] <= y;
	end
	
	always @(posedge pb4) begin
		b[6:4] <= y;
	end
	
	full_adder FA0 (a[0], b[0], 1'b0, z[0], carry0[0]);
	full_adder FA1 (a[1], b[1], carry0[0], z[1], carry0[1]);
	full_adder FA2 (a[2], b[2], carry0[1], z[2], carry0[2]);
	full_adder FA3 (a[3], b[3], carry0[2], z[3], carry0[3]);
	full_adder FA4 (a[4], b[4], carry0[3], z[4], carry0[4]);
	full_adder FA5 (a[5], b[5], carry0[4], z[5], carry0[5]);
	full_adder FA6 (a[6], b[6], carry0[5], z[6], carry);
	
endmodule