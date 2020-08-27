`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:07 02/11/2019 
// Design Name: 
// Module Name:    rotary_shaft_top 
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
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:29 02/11/2019 
// Design Name: 
// Module Name:    rotary_top 
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
module rotary_shaft_top(clk, rot_a, rot_b, led0, led1, led2, led3, led4, led5, led6, led7);
	input clk;
	input rot_a;
	input rot_b;
	output led0;
	output led1;
	output led2;
	output led3;
	output led4;
	output led5;
	output led6;
	output led7;
	wire led7;
	wire led6;
	wire led5;
	wire led4;
	wire led3;
	wire led2;
	wire led1;
	wire led0;
	wire rotation_event;
	wire rotation_direction;
	
	rotation_detect rot(clk, rot_a, rot_b, rotation_event, rotation_direction);
	rotary_shaft_encoder enc(clk, rotation_event, rotation_direction, led0, led1, led2, led3, led4, led5, led6, led7);
	

endmodule

