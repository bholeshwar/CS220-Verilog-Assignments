`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:06:41 01/28/2019
// Design Name:   rippling_led
// Module Name:   /media/bholeshwar/UUI/CS220 Labs/Lab3_2/rippling_led/rippling_led_top.v
// Project Name:  rippling_led
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rippling_led
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rippling_led_top;

	// Inputs
	reg clk;

	// Outputs
	wire [7:0] led;

	// Instantiate the Unit Under Test (UUT)
	rippling_led uut (
		.clk(clk), 
		.led(led)
	);

	initial begin
		clk = 0;
		forever begin
			#0.001 clk = 1;
			#0.001 clk = 0;
		end
	end
      
endmodule

