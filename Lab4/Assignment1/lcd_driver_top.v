`timescale 1ns / 1ps

module driver_top(clk, rs, w, e, db);
input clk;

output rs, w, e;
wire rs, w, e;
output [3:0] db;
wire [3:0] db;

LCD_driver uut("WELCOME TO CSE, ", "IIT KANPUR      ", clk, rs, w, e, db);

endmodule