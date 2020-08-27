`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:04:34 01/28/2019
// Design Name:   adding_five_four_bits
// Module Name:   /media/bholeshwar/UUI/CS220 Labs/Lab3_3/adding_five_four_bits/adding_five_four_bits_top.v
// Project Name:  adding_five_four_bits
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adding_five_four_bits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adding_five_four_bits_top;

	// Inputs
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;
	reg rc;
	reg [3:0] in;

	// Outputs
	wire [5:0] sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	adding_five_four_bits uut (
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4), 
		.rc(rc), 
		.in(in), 
		.sum(sum), 
		.carry(carry)
	);

	initial begin
		pb1=1; pb2=0; pb3=0; pb4=0; rc=0; in=4'b1011;
		#5
		pb1=0; pb2=1; pb3=0; pb4=0; rc=0; in=4'b1100;
		#5
		pb1=0; pb2=0; pb3=1; pb4=0; rc=0; in=4'b1101;
		#5
		pb1=0; pb2=0; pb3=0; pb4=1; rc=0; in=4'b1110;
		#5
		pb1=0; pb2=0; pb3=0; pb4=0; rc=1; in=4'b1111;
		#5
		$finish;		
	end
      
endmodule

