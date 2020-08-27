`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:44:41 03/04/2019 
// Design Name: 
// Module Name:    fsm 
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
module fsm(clk, rotation_event, in, curr_state);
	//input pb;
	input [1:0]in;
	input clk;
	input rotation_event;
	
	output [3:0]curr_state;
	reg [3:0]curr_state = 4'b0000;
	
	wire [1:0]x;
	reg [3:0]DROM1 [0:3];
	reg [3:0]DROM2 [0:3];
	reg prev_rotation_event = 1;
	reg [31:0]cnt = 0;
	reg flag = 0;
	
	assign x = in;

	initial begin
		//Dispatch ROM for S3
		DROM1[0] = 4'b0100;
		DROM1[1] = 4'b0101;
		DROM1[2] = 4'b0110;
		DROM1[3] = 4'b0110;
		
		//Dispatch ROM for S10
		DROM2[0] = 4'b1011;
		DROM2[1] = 4'b1100;
		DROM2[2] = 4'b1100;
		DROM2[3] = 4'b1100;
	end

	/*always @(posedge clk) begin
		cnt <= cnt + 1;
		
		if(cnt == 100000000) begin
			cnt <= 0;
			flag <= 1;
		end
	end*/			

	always @(posedge clk) begin
		
		cnt <= cnt + 1;
		
		if(cnt == 100000000) begin
			cnt <= 0;
			flag <= 1;
		end
		
		if (((prev_rotation_event == 0) && (rotation_event == 1)) || flag == 1) begin
			if(curr_state==3) begin
				curr_state <= DROM1[x];
			end
			else if(curr_state==10) begin
				curr_state <= DROM2[x];
			end
			else if(curr_state==4 || curr_state==5) begin
				curr_state <= 4'b0111;
			end
			else if(curr_state==11 || curr_state==12) begin
				curr_state <= 4'b0000;
			end
			else begin
				curr_state <= curr_state + 1;
			end
			
			flag <= 0;
		end
		prev_rotation_event <= rotation_event;
 	end

endmodule
