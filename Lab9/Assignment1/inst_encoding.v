`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:10:32 04/01/2019 
// Design Name: 
// Module Name:    inst_encoding 
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
module inst_encoding(clk, sw, led);
  input clk, sw;
  
  output [7:0]led;
  reg [7:0]led;
  
  reg [3:0]PC = 0;
  reg [2:0]r = 0;
  reg [2:0]i = 0;
  reg [1:0]j = 0;
  reg [1:0]counter_3 = 0;
  reg [1:0]counter_4 = 0;
  reg [1:0]counter_5 = 0;
  reg [1:0]counter_6 = 0;
  reg [31:0]inst_memory [0:7];
  
  initial begin
    inst_memory[0] = {6'h8, 5'h0, 5'h4, 16'h3456};
    inst_memory[1] = {6'h8, 5'h0, 5'h5, 16'hffff};
    inst_memory[2] = {6'h0, 5'h5, 5'h4, 5'h6, 5'h0, 6'h20};
    inst_memory[3] = {6'h8, 5'h0, 5'h3, 16'h7};
    inst_memory[4] = {6'h0, 5'h6, 5'h3, 5'h6, 5'h0, 6'h4};
    inst_memory[5] = {6'h0, 5'h3, 5'h0, 5'h3, 5'h1, 6'h2};
    inst_memory[6] = {6'h23, 5'h4, 5'h5, 16'h9abc};
    inst_memory[7] = {6'h2, 26'h123456};
  end

  always @(posedge clk) begin
    
    if(PC <= 7) begin
      // R format
      if(inst_memory[PC][31:26] == 0) begin
        r <= r+1;
        if(inst_memory[PC][15:11] == 3) counter_3 <= counter_3 + 1;
        else if(inst_memory[PC][15:11] == 4) counter_4 <= counter_4 + 1;
        else if(inst_memory[PC][15:11] == 5) counter_5 <= counter_5 + 1;
        else if(inst_memory[PC][15:11] == 6) counter_6 <= counter_6 + 1;
      end

      // J format
      else if(inst_memory[PC][31:26] == 2 || inst_memory[PC][31:26] == 3) begin
        j <= j+1;
      end

      // I format
      else begin
        i <= i+1;
        if(inst_memory[PC][20:16] == 3) counter_3 <= counter_3 + 1;
        else if(inst_memory[PC][20:16] == 4) counter_4 <= counter_4 + 1;
        else if(inst_memory[PC][20:16] == 5) counter_5 <= counter_5 + 1;
        else if(inst_memory[PC][20:16] == 6) counter_6 <= counter_6 + 1;
      end

      PC <= PC+1;
    end
  end

  always @(sw) begin
    if(PC == 8) begin
      if(sw == 0) begin
        led[2:0] <= r;
        led[5:3] <= i;
        led[7:6] <= j;
      end

      else if(sw == 1) begin
        led[1:0] <= counter_3;
        led[3:2] <= counter_4;
        led[5:4] <= counter_5;
        led[7:6] <= counter_6;
      end
    end
  end

endmodule