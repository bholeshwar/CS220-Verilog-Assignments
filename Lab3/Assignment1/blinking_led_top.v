`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:01:33 01/28/2019
// Design Name:   blinking_led
// Module Name:   /media/bholeshwar/UUI/CS220 Labs/Lab3_1/blinking_led/blinking_led_top.v
// Project Name:  blinking_led
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: blinking_led
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module blinking_led_top;

	// Inputs
	reg clk;

	// Outputs
	wire led0;

	// Instantiate the Unit Under Test (UUT)
	blinking_led uut (
		.clk(clk), 
		.led0(led0)
	);

	initial begin
		clk = 0;
		forever begin
			#0.001 clk = 1;
			#0.001 clk = 0;
		end
	end
      
endmodule

