`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:08 01/28/2019 
// Design Name: 
// Module Name:    adding_five_four_bits 
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
module adding_five_four_bits(pb1, pb2, pb3, pb4, rc, in, sum, carry);
	input pb1; input pb2; input pb3; input pb4; input rc;
	input [3:0]in;
	output [5:0]sum;
	wire [5:0]sum;
	output carry;
	wire carry;
	reg [3:0]a; reg [3:0]b; reg [3:0]c; reg [3:0]d; reg [5:0]e;
	wire [4:0]x; wire [4:0]y;
	wire [5:0]z;
	
	always @(posedge pb1) begin
		a[3:0] <= in;
	end
	
	always @(posedge pb2) begin
		b[3:0] <= in;
	end
	
	always @(posedge pb3) begin
		c[3:0] <= in;
	end
	
	always @(posedge pb4) begin
		d[3:0] <= in;
	end
	
	always @(posedge rc) begin
		e[3:0] <= in;
		e[5:4] <= 2'b00;
	end

	four_bit_adder FoA1 (a, b, x[3:0], x[4]);
	four_bit_adder FoA2 (c, d, y[3:0], y[4]);
	
	five_bit_adder FiA1 (x, y, z[4:0], z[5]);
	
	six_bit_adder SA1 (z, e, sum, carry);
endmodule
