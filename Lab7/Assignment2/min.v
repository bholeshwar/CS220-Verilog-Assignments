`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:10 03/11/2019 
// Design Name: 
// Module Name:    min 
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
module min(x, y, z, w, minm);
    input [2:0]x;
    input [2:0]y;
    input [2:0]z;
    input [2:0]w;
    
    output [2:0]minm;
    reg [2:0]minm;
    
	 reg [2:0]min1;
	 reg [2:0]min2;
    
    always @(x or y or z or w) begin
        if (x < y && z < w) begin
            if (x > z) begin
                minm <= 2;
            end
            else begin
                minm <= 0;
            end
        end
        else if (x > y && z < w) begin
            if (y > z) begin
                minm <= 2;
            end
            else begin
                minm <= 1;
            end
        end
        else if (x < y && z > w) begin
            if (x>w) begin
                minm <= 3;
            end
            else begin
                minm <= 0;
            end
        end
        else if (x > y && z > w) begin
            if (y>w) begin
                minm <= 3;
            end
            else begin
                minm <= 1;
            end
        end
    end
endmodule
