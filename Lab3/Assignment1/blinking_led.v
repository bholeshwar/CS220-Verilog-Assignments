`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:43 01/28/2019 
// Design Name: 
// Module Name:    blinking_led 
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
`define OFF_TIME 25000000
`define ON_TIME (`OFF_TIME*2)

module blinking_led(clk, led0);
	input clk;
	output led0;
	reg led0 = 1'b1;
	reg [32:0]counter = 32'b0;
	
	always @(posedge clk) begin
		counter <= counter + 1;
		if(counter == `OFF_TIME) begin
			led0 <= 1'b0;
		end
		if(counter == `ON_TIME) begin
			led0 <= 1'b1;
			counter <= 32'b0;
		end
	end
endmodule
