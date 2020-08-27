`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:30:33 01/27/2019 
// Design Name: 
// Module Name:    eight_bit_comparator 
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
module eight_bit_comparator(pb1, pb2, pb3, pb4, y, gt, lt, eq);
  input pb1; input pb2; input pb3; input pb4;
  input [3:0]y;
  output gt; output lt; output eq;
  wire gt; wire lt; wire eq;
  wire [6:0]gtin;
  wire [6:0]ltin;
  wire [6:0]eqin;
  reg [7:0]a;
  reg [7:0]b;
  
  always @(posedge pb1)
    begin
      a[3:0] <= y;
    end
  always @(posedge pb2)
    begin
      a[7:4] <= y;
    end
  always @(posedge pb3)
    begin 
      b[3:0] <= y;
    end
  always @(posedge pb4)
    begin
      b[7:4] <= y;
    end
 
	one_bit_comparator O1(a[7], b[7], 1'b0, 1'b0, 1'b1, gtin[0], ltin[0], eqin[0]);
	one_bit_comparator O2(a[6], b[6], gtin[0], ltin[0], eqin[0], gtin[1], ltin[1], eqin[1]);
	one_bit_comparator O3(a[5], b[5], gtin[1], ltin[1], eqin[1], gtin[2], ltin[2], eqin[2]);
	one_bit_comparator O4(a[4], b[4], gtin[2], ltin[2], eqin[2], gtin[3], ltin[3], eqin[3]);
	one_bit_comparator O5(a[3], b[3], gtin[3], ltin[3], eqin[3], gtin[4], ltin[4], eqin[4]);
	one_bit_comparator O6(a[2], b[2], gtin[4], ltin[4], eqin[4], gtin[5], ltin[5], eqin[5]);
	one_bit_comparator O7(a[1], b[1], gtin[5], ltin[5], eqin[5], gtin[6], ltin[6], eqin[6]);
	one_bit_comparator O8(a[0], b[0], gtin[6], ltin[6], eqin[6], gt, lt, eq);

endmodule