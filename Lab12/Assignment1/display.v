`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:19:14 04/15/2019
// Design Name:   decoder
// Module Name:   /users/btech/sayak/Desktop/Lab11/top.v
// Project Name:  Lab11
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top(clk, pb, led0, led1, led2, led3, led4, led5, led6, led7);
	input clk;
	input pb;
	
	output led0;
	output led1;
	output led2;
	output led3;
	output led4;
	output led5;
	output led6;
	output led7;
	
	reg led0, led1, led2, led3, led4, led5, led6, led7;
	reg [3:0]RC = 0;
	reg [7:0]memory [0:7];
	reg parity;
	reg [7:0]xorval = 0;
	reg display = 0;
	reg [7:0]temp;
	reg [2:0]val;
	wire [7:0]final;
	initial begin
		memory[0] <= 8'd3;
		memory[1] <= 8'd4;
		memory[2] <= 8'd7;
		memory[3] <= 8'd2;
		memory[4] <= 8'd3;
		memory[5] <= 8'd5;
		memory[6] <= 8'd0;
		memory[7] <= 8'd2;
	end
   decoder DC(val, final);
	
	always @(posedge clk) begin
		if (RC < 8) begin
			temp = memory[RC];
			val = temp[2:0];
			xorval = xorval^final;
			RC = RC+1;
		end
		else if (RC== 8) begin
			parity = (xorval[7] ^ xorval[6] ^ xorval[5] ^ xorval[4] ^ xorval[3] ^ xorval[2] ^ xorval[1] ^ xorval[0]);
		end

	end

	always @(posedge pb) begin
		if (display == 0) begin
		
			led7 <= xorval[7];
			led6 <= xorval[6];
			led5 <= xorval[5];
			led4 <= xorval[4];
			led3 <= xorval[3];
			led2 <= xorval[2];
			led1 <= xorval[1];
			led0 <= xorval[0];
			display <= 1;
		
		end
		
		else if (display == 1) begin
			led7 <= 0;
			led6 <= 0;
			led5 <= 0;
			led4 <= 0;
			led3 <= 0;
			led2 <= 0;
			led1 <= 0;
			led0 <= parity;
			display <= 0;
		end
	end
endmodule

