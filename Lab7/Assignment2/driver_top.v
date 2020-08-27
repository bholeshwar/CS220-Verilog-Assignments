`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:41 03/11/2019 
// Design Name: 
// Module Name:    driver_top 
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
module driver_top(line1, line2, clk, rs, w, e, db);
input clk;
input [127:0]line1;
input [127:0]line2;

output rs, w, e;
wire rs, w, e;
output [3:0] db;
wire [3:0] db;

LCD_driver uut(line1, line2, clk, rs, w, e, db);

endmodule