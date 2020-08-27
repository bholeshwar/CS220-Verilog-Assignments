`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:14 03/25/2019 
// Design Name: 
// Module Name:    interface 
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
module interface(read_add1, read_add2, write_add, write_data, read_add1_ok, read_add2_ok, write_add_ok, read_out1, read_out2);

    input [4:0]read_add1;
    input [4:0]read_add2;
    input [4:0]write_add;
    input [15:0]write_data;
    input read_add1_ok, read_add2_ok, write_add_ok;
    
    output [15:0]read_out1;
    output [15:0]read_out2;
    reg [15:0]read_out1;
    reg [15:0]read_out2;
    
    reg [15:0]reg_file [0:31];
    
    initial begin
        reg_file[0] <= 0;
		  reg_file[1] <= 0;
		  reg_file[2] <= 0;
		  reg_file[3] <= 0;
		  reg_file[4] <= 0;
		  reg_file[5] <= 0;
		  reg_file[6] <= 0;
		  reg_file[7] <= 0;
		  reg_file[8] <= 0;
		  reg_file[9] <= 0;
		  reg_file[10] <= 0;
		  reg_file[11] <= 0;
		  reg_file[12] <= 0;
		  reg_file[13] <= 0;
		  reg_file[14] <= 0;
		  reg_file[15] <= 0;
		  reg_file[16] <= 0;
		  reg_file[17] <= 0;
		  reg_file[18] <= 0;
		  reg_file[19] <= 0;
		  reg_file[20] <= 0;
		  reg_file[21] <= 0;
		  reg_file[22] <= 0;
		  reg_file[23] <= 0;
		  reg_file[24] <= 0;
		  reg_file[25] <= 0;
		  reg_file[26] <= 0;
		  reg_file[27] <= 0;
		  reg_file[28] <= 0;
		  reg_file[29] <= 0;
		  reg_file[30] <= 0;
		  reg_file[31] <= 0;
    end
    
    always @ (read_add1 or read_add2 or write_add or write_data or read_add1_ok or read_add2_ok or write_add_ok) begin
        if(read_add1_ok == 1) read_out1 <= reg_file[read_add1];
        // else read_out1 <= 0;
        
        if(read_add2_ok == 1) read_out2 <= reg_file[read_add2];
        // else read_out2 <= 0;
        
        if(write_add_ok == 1) begin
            reg_file[write_add] <= write_data;
        end
    end
    
endmodule
