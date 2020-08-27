`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:15:27 01/27/2019
// Design Name:   eight_bit_comparator
// Module Name:   /users/btech/bholeshwar/Lab2_3/eight_bit_comparator/eight_bit_comparator_top.v
// Project Name:  eight_bit_comparator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eight_bit_comparator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eight_bit_comparator_top;

	// Inputs
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;
	reg [3:0] y;

	// Outputs
	wire gt;
	wire lt;
	wire eq;

	// Instantiate the Unit Under Test (UUT)
	eight_bit_comparator uut (
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4), 
		.y(y), 
		.gt(gt), 
		.lt(lt), 
		.eq(eq)
	);

	initial begin
		pb1=1; pb2=0; pb3=0; pb4=0; y=4'b1110;
		#5
		pb1=0; pb2=1; pb3=0; pb4=0; y=4'b1111;
		#5
		pb1=0; pb2=0; pb3=1; pb4=0; y=4'b1110;
		#5
		pb1=0; pb2=0; pb3=0; pb4=1; y=4'b1111;
		#5
		$finish;
	end
      
endmodule

