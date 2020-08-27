`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:48 02/11/2019 
// Design Name: 
// Module Name:    rotary_shaft_encoder 
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
module rotary_shaft_encoder(clk, rotation_event, rotation_direction, led0, led1, led2, led3, led4, led5, led6, led7);
	input clk;
	input rotation_event;
	input rotation_direction;
	output led0;
	output led1;
	output led2;
	output led3;
	output led4;
	output led5;
	output led6;
	output led7;
	reg led7=1'b0;
	reg led6=1'b0;
	reg led5=1'b0;
	reg led4=1'b0;
	reg led3=1'b0;
	reg led2=1'b0;
	reg led1=1'b0;
	reg led0=1'b1;
	reg prev_rotation_event=1'b1;
	
	always @(posedge clk) begin
		if(prev_rotation_event == 1'b0 && rotation_event == 1'b1) begin
			if (rotation_direction == 1'b0) begin
				led0 <= led1;
				led1 <= led2;
				led2 <= led3;
				led3 <= led4;
				led4 <= led5;
				led5 <= led6;
				led6 <= led7;
				led7 <= led0;
			end
			if (rotation_direction == 1'b1) begin
				led1 <= led0;
				led2 <= led1;
				led3 <= led2;
				led4 <= led3;
				led5 <= led4;
				led6 <= led5;
				led7 <= led6;
				led0 <= led7;
			end
		end
		prev_rotation_event = rotation_event;
	
	end
	


endmodule
