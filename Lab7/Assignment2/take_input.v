`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:55 03/11/2019 
// Design Name: 
// Module Name:    take_input 
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
module take_input(pb1, pb2, pb3, pb4, a, clk, rs, w1, e, db);
    input pb1;
    input pb2;
    input pb3;
    input pb4;
    input [2:0]a;
	 input clk;
	 
	 output rs, w1, e;
	 wire rs, w1, e;
	 output [3:0] db;
	 wire [3:0] db;
    
    reg [2:0]x;
    reg [2:0]y;
    reg [2:0]z;
    reg [2:0]w;
	 wire [2:0]minm;
	 reg [127:0]line1;
	 reg [127:0]line2;
    
    always @(posedge pb1) begin
        x <= a;
    end
	 
    always @(posedge pb2) begin
        y <= a;
    end
    
    always @(posedge pb3) begin
        z <= a;
    end
    
    always @(posedge pb4) begin
        w <= a;
    end
	 
    min MIN(x, y, z, w, minm);
	 
	 always @(x or y or z or w or minm) begin
		line1 <= {x+8'd48, {8'd44, {8'd32, {y + 8'd48, {8'd44, {8'd32, {z + 8'd48, {8'd44, {8'd32, {w + 8'd48, {8'd32, {8'd32, {8'd32, {8'd32, {8'd32, 8'd32}}}}}}}}}}}}}}};
		line2 <= {minm+8'd48, {8'd32, {8'd32, {8'd32, {8'd32, {8'd32, {8'd32, {8'd32, {8'd32, {8'd32, {8'd32, {8'd32, {8'd32, {8'd32, {8'd32, 8'd32}}}}}}}}}}}}}}};
	 end
	 
	 driver_top DT(line1, line2, clk, rs, w1, e, db);
	 
endmodule
