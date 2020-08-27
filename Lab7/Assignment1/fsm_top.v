`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:09 03/11/2019 
// Design Name: 
// Module Name:    fsm_top 
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
module fsm_top(clk, rot_a, rot_b, in, curr_state);
	input clk, rot_a, rot_b;
	input [1:0]in;
	
	output [3:0]curr_state;
	wire [3:0]curr_state;
	
	detect_event DE(clk, rot_a, rot_b, rotation_event);
	fsm f1(clk, rotation_event, in, curr_state);


endmodule
