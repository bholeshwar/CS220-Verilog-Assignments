`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:25:12 01/21/2019
// Design Name:   seven_bit_adder
// Module Name:   /media/sayak/UUI/CS220 Labs/Lab2_2/seven_bit_adder/seven_bit_adder_top.v
// Project Name:  seven_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_bit_adder_top;

	// Inputs
	reg pb1;
	reg pb2;
	reg pb3;
	reg pb4;
	reg [3:0] y;

	// Outputs
	wire [6:0] z;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	seven_bit_adder uut (
		.pb1(pb1), 
		.pb2(pb2), 
		.pb3(pb3), 
		.pb4(pb4), 
		.y(y), 
		.z(z), 
		.carry(carry)
	);

	initial begin
		pb1=1; pb2=0; pb3=0; pb4=0; y=4'b1111;
		#5
		pb1=0; pb2=1; pb3=0; pb4=0; y=4'b1111;
		#5
		pb1=0; pb2=0; pb3=1; pb4=0; y=4'b1111;
		#5
		pb1=0; pb2=0; pb3=0; pb4=1; y=4'b1111;
		#5
		$finish;		
	end
      
endmodule

