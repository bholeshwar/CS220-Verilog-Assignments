`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:16:29 03/25/2019 
// Design Name: 
// Module Name:    top 
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
module top(clk, rot_a, rot_b, sw, lcd_rs, lcd_w, lcd_e, lcd_db);
	input clk, rot_a, rot_b;
	input [3:0]sw;
	
	output lcd_rs, lcd_w, lcd_e;
	wire lcd_rs, lcd_w, lcd_e;
	output [3:0] lcd_db;
	wire [3:0] lcd_db;

	reg [127:0]line1;
	reg [127:0]line2;
	reg [3:0]cnt = 0;
	reg [4:0]read_add1;
	reg [4:0]read_add2;
	reg [4:0]write_add;
	reg [15:0]write_data;
	reg read_add1_ok, read_add2_ok, write_add_ok;
	reg [2:0]command;
	wire [15:0]read_out1;
	wire [15:0]read_out2;
	wire rotation_event;
	reg prev_rotation_event = 1;
	reg [48:0]temporary;
	
	//Inputting Command
	always @(posedge clk) begin
		if ((prev_rotation_event == 0) && (rotation_event == 1)) begin
			if (cnt == 0) begin
				command <= sw[2:0];
				cnt <= 1;
			end
			
			if (command == 3'b000) begin
				if (cnt == 1) begin
					write_add[3:0] <= sw;
					cnt <= 2;
				end
				else if (cnt == 2) begin
					write_add[4] <= sw[0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					write_data[15:12] <= sw;
					cnt <= 4;
				end
				else if (cnt == 4) begin
					write_data[11:8] <= sw;
					cnt <= 5;
				end
				else if (cnt == 5) begin
					write_data[7:4] <= sw;
					cnt <= 6;
				end
				else if (cnt == 6) begin
					write_data[3:0] <= sw;
					cnt <= 0;
				end
				
			end
			
			if (command == 3'b001) begin
				if (cnt == 1) begin
					read_add1[3:0] <= sw;
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_add1[4] <= sw[0];
					cnt <= 0;
				end
				
			end
				
			if (command == 3'b010) begin
				if (cnt == 1) begin
					read_add1[3:0] <= sw;
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_add1[4] <= sw[0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					read_add2[3:0] <= sw;
					cnt <= 4;
				end
				else if (cnt == 4) begin
					read_add2[4] <= sw[0];
					cnt <= 0;
				end
				
			end
			
			if (command == 3'b011) begin
				if (cnt == 1) begin
					read_add1[3:0] <= sw;
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_add1[4] <= sw[0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					write_add[3:0] <= sw;
					cnt <= 4;
				end
				else if (cnt == 4) begin
					write_add[4] <= sw[0];
					cnt <= 5;
				end
				else if (cnt == 5) begin
					write_data[15:12] <= sw;
					cnt <= 6;
				end
				else if (cnt == 6) begin
					write_data[11:8] <= sw;
					cnt <= 7;
				end
				else if (cnt == 7) begin
					write_data[7:4] <= sw;
					cnt <= 8;
				end
				else if (cnt == 8) begin
					write_data[3:0] <= sw;
					cnt <= 0;
				end
				
			end
			
			if (command == 3'b100) begin
				if (cnt == 1) begin
					read_add1[3:0] <= sw;
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_add1[4] <= sw[0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					read_add2[3:0] <= sw;
					cnt <= 4;
				end
				else if (cnt == 4) begin
					read_add2[4] <= sw[0];
					cnt <= 5;
				end
				else if (cnt == 5) begin
					write_add[3:0] <= sw;
					cnt <= 6;
				end
				else if (cnt == 6) begin
					write_add[4] <= sw[0];
					cnt <= 7;
				end
				else if (cnt == 7) begin
					write_data[15:12] <= sw;
					cnt <= 8;
				end
				else if (cnt == 8) begin
					write_data[11:8] <= sw;
					cnt <= 9;
				end
				else if (cnt == 9) begin
					write_data[7:4] <= sw;
					cnt <= 10;
				end
				else if (cnt == 10) begin
					write_data[3:0] <= sw;
					cnt <= 0;
				end
				
			end
			
			if (command == 3'b101) begin
				if (cnt == 1) begin
					read_add1[3:0] <= sw;
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_add1[4] <= sw[0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					read_add2[3:0] <= sw;
					cnt <= 4;
				end
				else if (cnt == 4) begin
					read_add2[4] <= sw[0];
					cnt <= 5;
				end
				else if (cnt == 5) begin
					write_add[3:0] <= sw;
					cnt <= 6;
				end
				else if (cnt == 6) begin
					write_add[4] <= sw[0];
					cnt <= 7;
				end
				else if (cnt == 7) begin
					write_data <= read_out1 + read_out2;
					cnt <= 0;
				end
				
			end
			
			if (command == 3'b110) begin
				if (cnt == 1) begin
					read_add1[3:0] <= sw;
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_add1[4] <= sw[0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					read_add2[3:0] <= sw;
					cnt <= 4;
				end
				else if (cnt == 4) begin
					read_add2[4] <= sw[0];
					cnt <= 5;
				end
				else if (cnt == 5) begin
					write_add[3:0] <= sw;
					cnt <= 6;
				end
				else if (cnt == 6) begin
					write_add[4] <= sw[0];
					cnt <= 7;
				end
				else if (cnt == 7) begin
					write_data <= read_out1 - read_out2;
					cnt <= 0;
				end
				
			end
			
			if (command == 3'b111) begin
				if (cnt == 1) begin
					read_add1[3:0] <= sw;
					cnt <= 2;
				end
				else if (cnt == 2) begin
					read_add1[4] <= sw[0];
					cnt <= 3;
				end
				else if (cnt == 3) begin
					read_add2[3:0] <= sw;
					cnt <= 4;
				end
				else if (cnt == 4) begin
					read_add2[4] <= sw[0];
					cnt <= 5;
				end
				else if (cnt == 5) begin
					write_add[3:0] <= sw;
					cnt <= 6;
				end
				else if (cnt == 6) begin
					write_add[4] <= sw[0];
					cnt <= 7;
				end
				else if (cnt == 7) begin
					temporary[31:0] <= read_out1[15:0] << read_out2;
					cnt <= 8;
				end
				
				
				
			end
			
		end
		
		prev_rotation_event <= rotation_event;
	end
	
	always @(posedge clk) begin
		
		// No read, one write
		if (command == 3'b000) begin
			read_add1_ok <= 0;
			read_add2_ok <= 0;
			write_add_ok <= 1;
			line1 <= {write_add[4] + 8'h30, write_add[3] + 8'h30, write_add[2] + 8'h30, write_add[1] + 8'h30, write_add[0] + 8'h30, "           "};
			line2 <= {write_data[15]+8'h30, write_data[14]+8'h30, write_data[13]+8'h30, write_data[12]+8'h30, write_data[11]+8'h30, write_data[10]+8'h30, write_data[9]+8'h30, write_data[8]+8'h30, write_data[7]+8'h30, write_data[6]+8'h30, write_data[5]+8'h30, write_data[4]+8'h30, write_data[3]+8'h30, write_data[2]+8'h30, write_data[1]+8'h30, write_data[0]+8'h30};
		end
		
		// One read, no write
		else if (command == 3'b001) begin
			read_add1_ok <= 1;
			read_add2_ok <= 0;
			write_add_ok <= 0;
			line1 <= {read_add1[4] + 8'h30, read_add1[3] + 8'h30, read_add1[2] + 8'h30, read_add1[1] + 8'h30, read_add1[0] + 8'h30, "           "};
			line2 <= {read_out1[15]+8'h30, read_out1[14]+8'h30, read_out1[13]+8'h30, read_out1[12]+8'h30, read_out1[11]+8'h30, read_out1[10]+8'h30, read_out1[9]+8'h30, read_out1[8]+8'h30, read_out1[7]+8'h30, read_out1[6]+8'h30, read_out1[5]+8'h30, read_out1[4]+8'h30, read_out1[3]+8'h30, read_out1[2]+8'h30, read_out1[1]+8'h30, read_out1[0]+8'h30};
		end
		
		// Two reads, no write
		else if (command == 3'b010) begin
			read_add1_ok <= 1;
			read_add2_ok <= 1;
			write_add_ok <= 0;
			line1 <= {read_out1[15]+8'h30, read_out1[14]+8'h30, read_out1[13]+8'h30, read_out1[12]+8'h30, read_out1[11]+8'h30, read_out1[10]+8'h30, read_out1[9]+8'h30, read_out1[8]+8'h30, read_out1[7]+8'h30, read_out1[6]+8'h30, read_out1[5]+8'h30, read_out1[4]+8'h30, read_out1[3]+8'h30, read_out1[2]+8'h30, read_out1[1]+8'h30, read_out1[0]+8'h30};
			line2 <= {read_out2[15]+8'h30, read_out2[14]+8'h30, read_out2[13]+8'h30, read_out2[12]+8'h30, read_out2[11]+8'h30, read_out2[10]+8'h30, read_out2[9]+8'h30, read_out2[8]+8'h30, read_out2[7]+8'h30, read_out2[6]+8'h30, read_out2[5]+8'h30, read_out2[4]+8'h30, read_out2[3]+8'h30, read_out2[2]+8'h30, read_out2[1]+8'h30, read_out2[0]+8'h30};
		end
		
		// One read, one write
		else if (command == 3'b011) begin
			read_add1_ok <= 1;
			read_add2_ok <= 0;
			write_add_ok <= 1;
			line1 <= {read_add1[4] + 8'h30, read_add1[3] + 8'h30, read_add1[2] + 8'h30, read_add1[1] + 8'h30, read_add1[0] + 8'h30, "           "};
			line2 <= {read_out1[15]+8'h30, read_out1[14]+8'h30, read_out1[13]+8'h30, read_out1[12]+8'h30, read_out1[11]+8'h30, read_out1[10]+8'h30, read_out1[9]+8'h30, read_out1[8]+8'h30, read_out1[7]+8'h30, read_out1[6]+8'h30, read_out1[5]+8'h30, read_out1[4]+8'h30, read_out1[3]+8'h30, read_out1[2]+8'h30, read_out1[1]+8'h30, read_out1[0]+8'h30}; 
		end
		
		// Two reads, one write
		else if (command == 3'b100) begin
			read_add1_ok <= 1;
			read_add2_ok <= 1;
			write_add_ok <= 1;
			line1 <= {read_out1[15]+8'h30, read_out1[14]+8'h30, read_out1[13]+8'h30, read_out1[12]+8'h30, read_out1[11]+8'h30, read_out1[10]+8'h30, read_out1[9]+8'h30, read_out1[8]+8'h30, read_out1[7]+8'h30, read_out1[6]+8'h30, read_out1[5]+8'h30, read_out1[4]+8'h30, read_out1[3]+8'h30, read_out1[2]+8'h30, read_out1[1]+8'h30, read_out1[0]+8'h30};
			line2 <= {read_out2[15]+8'h30, read_out2[14]+8'h30, read_out2[13]+8'h30, read_out2[12]+8'h30, read_out2[11]+8'h30, read_out2[10]+8'h30, read_out2[9]+8'h30, read_out2[8]+8'h30, read_out2[7]+8'h30, read_out2[6]+8'h30, read_out2[5]+8'h30, read_out2[4]+8'h30, read_out2[3]+8'h30, read_out2[2]+8'h30, read_out2[1]+8'h30, read_out2[0]+8'h30};
		end
		
		
		// Two reads, add two read values, write the result, ignore overflow
		else if (command == 3'b101) begin
			read_add1_ok <= 1;
			read_add2_ok <= 1;
			write_add_ok <= 1;
			line1 <= {write_add[4] + 8'h30, write_add[3] + 8'h30, write_add[2] + 8'h30, write_add[1] + 8'h30, write_add[0] + 8'h30, "           "};
			line2 <= {write_data[15]+8'h30, write_data[14]+8'h30, write_data[13]+8'h30, write_data[12]+8'h30, write_data[11]+8'h30, write_data[10]+8'h30, write_data[9]+8'h30, write_data[8]+8'h30, write_data[7]+8'h30, write_data[6]+8'h30, write_data[5]+8'h30, write_data[4]+8'h30, write_data[3]+8'h30, write_data[2]+8'h30, write_data[1]+8'h30, write_data[0]+8'h30};
		end
		
		// Two reads, subtract second read value from the first value, write the result, ignore overflow
		else if (command == 3'b110) begin
			read_add1_ok <= 1;
			read_add2_ok <= 1;
			write_add_ok <= 1;
			line1 <= {write_add[4] + 8'h30, write_add[3] + 8'h30, write_add[2] + 8'h30, write_add[1] + 8'h30, write_add[0] + 8'h30, "           "};
			line2 <= {write_data[15]+8'h30, write_data[14]+8'h30, write_data[13]+8'h30, write_data[12]+8'h30, write_data[11]+8'h30, write_data[10]+8'h30, write_data[9]+8'h30, write_data[8]+8'h30, write_data[7]+8'h30, write_data[6]+8'h30, write_data[5]+8'h30, write_data[4]+8'h30, write_data[3]+8'h30, write_data[2]+8'h30, write_data[1]+8'h30, write_data[0]+8'h30};
		end
		
		// One read, shift the read value left, write the result
		else if (command == 3'b111) begin
			read_add1_ok <= 1;
			read_add2_ok <= 1;
			write_add_ok <= 0;
			line1 <= {write_add[4] + 8'h30, write_add[3] + 8'h30, write_add[2] + 8'h30, write_add[1] + 8'h30, write_add[0] + 8'h30, "           "};
			line2 <= {temporary[15]+8'h30, temporary[14]+8'h30, temporary[13]+8'h30, temporary[12]+8'h30, temporary[11]+8'h30, temporary[10]+8'h30, temporary[9]+8'h30, temporary[8]+8'h30, temporary[7]+8'h30, temporary[6]+8'h30, temporary[5]+8'h30, temporary[4]+8'h30, temporary[3]+8'h30, temporary[2]+8'h30, temporary[1]+8'h30, temporary[0]+8'h30};
		end
	
end

interface II(read_add1, read_add2, write_add, write_data, read_add1_ok, read_add2_ok, write_add_ok, read_out1, read_out2);
detect_event DE(clk, rot_a, rot_b, rotation_event);
lcd_top LT(line1, line2, clk, lcd_rs, lcd_w, lcd_e, lcd_db);
endmodule
