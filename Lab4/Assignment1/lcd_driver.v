`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:03:26 02/04/2019 
// Design Name: 
// Module Name:    LCD_driver 
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
module LCD_driver(l1, l2, clk, lcd_rs, lcd_w, lcd_e, db);
	input clk;
	input [127:0]l1;
	input [127:0]l2;
	output lcd_rs;
	output lcd_w;
	output lcd_e;
	output [3:0]db;
	reg lcd_rs; reg lcd_w; reg lcd_e = 1'b0; 
	reg [3:0]db;
	reg [31:0]counter = 32'd0;
	reg [15:0]state_init = 16'd0;
	
	always @(posedge clk) begin
		
		counter <= counter + 1;
		if(counter == 1000000) begin
	
	// This is LCD initialise
			if(state_init == 1) begin
				lcd_e = 1'b0;
				
			end
			else if(state_init == 2) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h3;
			end
			else if(state_init == 3) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 4) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 5) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h3;
			end
			else if(state_init == 6) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 7) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 8) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h3;
			end
			else if(state_init == 9) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 10) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 11) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h2;
			end
			else if(state_init == 12) begin
				lcd_e = 1'b1;
			end
			
			//Configuring Function Set Command
			else if(state_init == 13) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 14) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h2;
			end
			else if(state_init == 15) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 16) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 17) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h8;
			end
			else if(state_init == 18) begin
				lcd_e = 1'b1;
			end
			
			//Configuring Entry Mode Set
			else if(state_init == 19) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 20) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h0;
			end
			else if(state_init == 21) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 22) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 23) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h6;
			end
			else if(state_init == 24) begin
				lcd_e = 1'b1;
			end
			
			//Configuring Display On/Off
			else if(state_init == 25) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 26) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h0;
			end
			else if(state_init == 27) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 28) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 29) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'hC;
			end
			else if(state_init == 30) begin
				lcd_e = 1'b1;
			end
			
			//Configuring Clear Display
			else if(state_init == 31) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 32) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h0;
			end
			else if(state_init == 33) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 34) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 35) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h1;
			end
			else if(state_init == 36) begin
				lcd_e = 1'b1;
			end
			
			//Setting DD RAM address to 0x00
			else if(state_init == 37) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 38) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h8;
			end
			else if(state_init == 39) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 40) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 41) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h0;
			end
			else if(state_init == 42) begin
				lcd_e = 1'b1;
			end
			
			//Reading first line
			
			//Reading first character
			else if(state_init == 43) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 44) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[127:124];
			end
			else if(state_init == 45) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 46) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 47) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[123:120];
			end
			else if(state_init == 48) begin
				lcd_e = 1'b1;
			end
			
			//Reading second character
			else if(state_init == 49) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 50) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[119:116];
			end
			else if(state_init == 51) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 52) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 53) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[115:112];
			end
			else if(state_init == 54) begin
				lcd_e = 1'b1;
			end
			
			//Reading third character
			else if(state_init == 55) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 56) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[111:108];
			end
			else if(state_init == 57) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 58) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 59) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[107:104];
			end
			else if(state_init == 60) begin
				lcd_e = 1'b1;
			end
			
			//Reading fourth character
			else if(state_init == 61) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 62) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[103:100];
			end
			else if(state_init == 63) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 64) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 65) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[99:96];
			end
			else if(state_init == 66) begin
				lcd_e = 1'b1;
			end
			
			//Reading fifth character
			else if(state_init == 67) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 68) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[95:92];
			end
			else if(state_init == 69) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 70) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 71) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[91:88];
			end
			else if(state_init == 72) begin
				lcd_e = 1'b1;
			end
			
			//Reading sixth character
			else if(state_init == 73) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 74) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[87:84];
			end
			else if(state_init == 75) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 76) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 77) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[83:80];
			end
			else if(state_init == 78) begin
				lcd_e = 1'b1;
			end
			
			//Reading seventh character
			else if(state_init == 79) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 80) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[79:76];
			end
			else if(state_init == 81) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 82) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 83) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[75:72];
			end
			else if(state_init == 84) begin
				lcd_e = 1'b1;
			end
			
			//Reading eighth character
			else if(state_init == 85) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 86) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[71:68];
			end
			else if(state_init == 87) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 88) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 89) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[67:64];
			end
			else if(state_init == 90) begin
				lcd_e = 1'b1;
			end
			
			//Reading ninth character
			else if(state_init == 91) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 92) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[63:60];
			end
			else if(state_init == 93) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 94) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 95) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[59:56];
			end
			else if(state_init == 96) begin
				lcd_e = 1'b1;
			end
			
			//Reading tenth character
			else if(state_init == 97) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 98) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[55:52];
			end
			else if(state_init == 99) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 100) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 101) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[51:48];
			end
			else if(state_init == 102) begin
				lcd_e = 1'b1;
			end
			
			//Reading eleventh character
			else if(state_init == 103) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 104) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[47:44];
			end
			else if(state_init == 105) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 106) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 107) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[43:40];
			end
			else if(state_init == 108) begin
				lcd_e = 1'b1;
			end
			
			//Reading twelfth character
			else if(state_init == 109) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 110) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[39:36];
			end
			else if(state_init == 111) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 112) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 113) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[35:32];
			end
			else if(state_init == 114) begin
				lcd_e = 1'b1;
			end
			
			//Reading thirteenth character
			else if(state_init == 115) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 116) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[31:28];
			end
			else if(state_init == 117) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 118) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 119) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[27:24];
			end
			else if(state_init == 120) begin
				lcd_e = 1'b1;
			end
			
			//Reading fourteenth character
			else if(state_init == 121) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 122) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[23:20];
			end
			else if(state_init == 123) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 124) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 125) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[19:16];
			end
			else if(state_init == 126) begin
				lcd_e = 1'b1;
			end
			
			//Reading fifteenth character
			else if(state_init == 127) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 128) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[15:12];
			end
			else if(state_init == 129) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 130) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 131) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[11:8];
			end
			else if(state_init == 132) begin
				lcd_e = 1'b1;
			end
			
			//Reading sixteenth character
			else if(state_init == 133) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 134) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[7:4];
			end
			else if(state_init == 135) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 136) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 137) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l1[3:0];
			end
			else if(state_init == 138) begin
				lcd_e = 1'b1;
			end
			
			//Line break
			else if(state_init == 139) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 140) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'hC;
			end
			else if(state_init == 141) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 142) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 143) begin
				lcd_rs = 1'b0;
				lcd_w = 1'b0;
				db[3:0] <= 4'h0;
			end
			else if(state_init == 144) begin
				lcd_e = 1'b1;
			end
			
			//Reading second line
			
			//Reading first character
			else if(state_init == 145) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 146) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[127:124];
			end
			else if(state_init == 147) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 148) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 149) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[123:120];
			end
			else if(state_init == 150) begin
				lcd_e = 1'b1;
			end
			
			//Reading second character
			else if(state_init == 151) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 152) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[119:116];
			end
			else if(state_init == 153) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 154) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 155) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[115:112];
			end
			else if(state_init == 156) begin
				lcd_e = 1'b1;
			end
			
			//Reading third character
			else if(state_init == 157) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 158) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[111:108];
			end
			else if(state_init == 159) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 160) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 161) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[107:104];
			end
			else if(state_init == 162) begin
				lcd_e = 1'b1;
			end
			
			//Reading fourth character
			else if(state_init == 163) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 164) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[103:100];
			end
			else if(state_init == 165) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 166) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 167) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[99:96];
			end
			else if(state_init == 168) begin
				lcd_e = 1'b1;
			end
			
			//Reading fifth character
			else if(state_init == 169) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 170) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[95:92];
			end
			else if(state_init == 171) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 172) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 173) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[91:88];
			end
			else if(state_init == 174) begin
				lcd_e = 1'b1;
			end
			
			//Reading sixth character
			else if(state_init == 175) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 176) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[87:84];
			end
			else if(state_init == 177) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 178) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 179) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[83:80];
			end
			else if(state_init == 180) begin
				lcd_e = 1'b1;
			end
			
			//Reading seventh character
			else if(state_init == 181) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 182) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[79:76];
			end
			else if(state_init == 183) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 184) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 185) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[75:72];
			end
			else if(state_init == 186) begin
				lcd_e = 1'b1;
			end
			
			//Reading eighth character
			else if(state_init == 187) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 188) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[71:68];
			end
			else if(state_init == 189) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 190) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 191) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[67:64];
			end
			else if(state_init == 192) begin
				lcd_e = 1'b1;
			end
			
			//Reading ninth character
			else if(state_init == 193) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 194) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[63:60];
			end
			else if(state_init == 195) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 196) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 197) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[59:56];
			end
			else if(state_init == 198) begin
				lcd_e = 1'b1;
			end
			
			//Reading tenth character
			else if(state_init == 199) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 200) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[55:52];
			end
			else if(state_init == 201) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 202) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 203) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[51:48];
			end
			else if(state_init == 204) begin
				lcd_e = 1'b1;
			end
			
			//Reading eleventh character
			else if(state_init == 205) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 206) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[47:44];
			end
			else if(state_init == 207) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 208) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 209) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[43:40];
			end
			else if(state_init == 210) begin
				lcd_e = 1'b1;
			end
			
			//Reading twelfth character
			else if(state_init == 211) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 212) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[39:36];
			end
			else if(state_init == 213) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 214) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 215) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[35:32];
			end
			else if(state_init == 216) begin
				lcd_e = 1'b1;
			end
			
			//Reading thirteenth character
			else if(state_init == 217) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 218) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[31:28];
			end
			else if(state_init == 219) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 220) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 221) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[27:24];
			end
			else if(state_init == 222) begin
				lcd_e = 1'b1;
			end
			
			//Reading fourteenth character
			else if(state_init == 223) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 224) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[23:20];
			end
			else if(state_init == 225) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 226) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 227) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[19:16];
			end
			else if(state_init == 228) begin
				lcd_e = 1'b1;
			end
			
			//Reading fifteenth character
			else if(state_init == 229) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 230) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[15:12];
			end
			else if(state_init == 231) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 232) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 233) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[11:8];
			end
			else if(state_init == 234) begin
				lcd_e = 1'b1;
			end
			
			//Reading sixteenth character
			else if(state_init == 235) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 236) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[7:4];
			end
			else if(state_init == 237) begin
				lcd_e = 1'b1;
			end
			else if(state_init == 238) begin
				lcd_e = 1'b0;
			end
			else if(state_init == 239) begin
				lcd_rs = 1'b1;
				lcd_w = 1'b0;
				db[3:0] <= l2[3:0];
			end
			else if(state_init == 240) begin
				lcd_e = 1'b1;
			end
			
			else if(state_init == 241) begin
				lcd_e = 1'b0;
			end
			state_init <= state_init +1;
			counter <= 0;
		end
	end
	


endmodule