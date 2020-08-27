`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:56 04/15/2019 
// Design Name: 
// Module Name:    decoder 
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
module decoder(inpt, d);
	input [2:0] inpt;
	
	output [7:0] d;
	reg [7:0]d;
	always @(inpt) begin
	 d[7] <= (inpt[2] && inpt[1] && inpt[0]);
	 d[6] <= (inpt[2] && inpt[1] && (~inpt[0]));
	 d[5] <= (inpt[2] && (~inpt[1]) && inpt[0]);
	 d[4] <= (inpt[2] && (~inpt[1]) && (~inpt[0]));
	 d[3] <= ((~inpt[2]) && inpt[1] && inpt[0]);
	 d[2] <= ((~inpt[2]) && inpt[1] && (~inpt[0]));
	 d[1] <= ((~inpt[2]) && (~inpt[1]) && inpt[0]);
	 d[0] <= ((~inpt[2]) && (~inpt[1]) && (~inpt[0]));
	end


endmodule
