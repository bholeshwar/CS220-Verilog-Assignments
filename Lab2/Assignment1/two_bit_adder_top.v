`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:26:00 01/21/2019
// Design Name:   two_bit_adder
// Module Name:   /media/sayak/UUI/CS220 Labs/Lab2_1/two_bit_adder/two_bit_adder_top.v
// Project Name:  two_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module two_bit_adder_top;

	// Inputs
	reg [1:0] x;
	reg [1:0] y;

	// Outputs
	wire [1:0] sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	two_bit_adder uut (
		.x(x), 
		.y(y), 
		.sum(sum), 
		.carry(carry)
	);

	always @(sum or carry) begin
		#5
		$display("time=%d: %b%b + %b%b = %b%b, carry = %b\n", $time, x[1], x[0], y[1], y[0], sum[1], sum[0], carry);
	end
	initial begin
		#10
		x = 2'b00; y = 2'b01;
		#10
		x = 2'b00; y = 2'b00;
		#10
		x = 2'b00; y = 2'b11;
		#10
		x = 2'b00; y = 2'b10;
		#10
		x = 2'b01; y = 2'b01;
		#10
		x = 2'b01; y = 2'b00;
		#10
		x = 2'b01; y = 2'b11;
		#10
		x = 2'b01; y = 2'b10;
		#10
		x = 2'b10; y = 2'b01;
		#10
		x = 2'b10; y = 2'b00;
		#10
		x = 2'b10; y = 2'b11;
		#10
		x = 2'b10; y = 2'b10;
		#10
		x = 2'b11; y = 2'b01;
		#10
		x = 2'b11; y = 2'b00;
		#10
		x = 2'b11; y = 2'b11;
		#10
		x = 2'b11; y = 2'b10;
		#10
      $finish;
	end
endmodule

