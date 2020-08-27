module lcd_top(line1, line2, clk, rs, w, e, db);
input clk;
input [127:0]line1;
input [127:0]line2;

output rs, w, e;
wire rs, w, e;
output [3:0] db;
wire [3:0] db;

lcd_interface uut(line1, line2, clk, rs, w, e, db);

endmodule