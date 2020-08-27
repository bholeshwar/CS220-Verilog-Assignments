`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:52 02/25/2019 
// Design Name: 
// Module Name:    rot_detect 
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
module one_bit_add_sub(a, b, cin, op, sum, cout);
    input a;
    input b;
    input cin;
	input op;
	wire temp;
    output sum;
    output cout;
    wire sum;
    wire cout;
	 
    assign temp = b^op;
    assign sum = a^temp^cin;
    assign cout =  (a & temp) | (temp & cin) | (cin & a);
endmodule
 