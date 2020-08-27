`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:29 02/25/2019 
// Design Name: 
// Module Name:    seven_bit_add_sub 
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
module seven_bit_add_sub(clk, rot_a, rot_b, y, sum, overflow);
	input clk;
	input rot_a;
	input rot_b;
	input [3:0]y;
	
	output [6:0]sum;
	output overflow;
	wire [6:0]sum;
	wire overflow;
	
	reg [6:0]a;
	reg [6:0]b;
	reg op;
	reg [2:0]cnt = 3'b0;
	wire [6:0]carry0;
	wire rotation_event;
	reg prev_rotation_event=1'b1;
	
	rot_detect RD(clk, rot_a, rot_b, rotation_event);
	assign overflow = carry0[5]^carry0[6];
	
	always @(posedge clk) begin 
			
		if(prev_rotation_event == 1'b0 && rotation_event == 1'b1) begin
			
			if(cnt==3'b001) begin
				a[3:0] <= y;
			end
			else if(cnt==3'b010) begin
				a[6:4] <= y;
			end
			else if(cnt==3'b011) begin
				b[3:0] <= y;
			end
			else if(cnt==3'b100) begin
				b[6:4] <= y;
			end
			else if(cnt==3'b101) begin
				op <= y[0];
			end
			
			cnt <= cnt + 1;

			if(cnt==3'b110) begin
				cnt <= 0;
			end
			
		end

		prev_rotation_event = rotation_event;
		
	end
	
	one_bit_add_sub OB0 (a[0], b[0], op, op, sum[0], carry0[0]);
	one_bit_add_sub OB1 (a[1], b[1], carry0[0], op, sum[1], carry0[1]);
	one_bit_add_sub OB2 (a[2], b[2], carry0[1], op, sum[2], carry0[2]);
	one_bit_add_sub OB3 (a[3], b[3], carry0[2], op, sum[3], carry0[3]);
	one_bit_add_sub OB4 (a[4], b[4], carry0[3], op, sum[4], carry0[4]);
	one_bit_add_sub OB5 (a[5], b[5], carry0[4], op, sum[5], carry0[5]);
	one_bit_add_sub OB6 (a[6], b[6], carry0[5], op, sum[6], carry0[6]);

endmodule
