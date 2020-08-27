`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:41:39 02/11/2019 
// Design Name: 
// Module Name:    rotation_detect 
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
module rotation_detect(clk, rot_a, rot_b, rotation_event, rotation_direction);
	input clk;
	input rot_a;
	input rot_b;
	output rotation_event;
	output rotation_direction;
	reg rotation_event;
	reg rotation_direction;
	
	always @(posedge clk) begin
		if (rot_a == 1 && rot_b == 1) begin
			rotation_event <= 1;
		end
		if (rot_a == 0 && rot_b == 0) begin
			rotation_event <= 0;
		end
		if (rot_a == 0 && rot_b == 1) begin
			rotation_direction <= 1;
		end
		if (rot_a == 1 && rot_b == 0) begin
			rotation_direction <= 0;
		end
	
	end


endmodule