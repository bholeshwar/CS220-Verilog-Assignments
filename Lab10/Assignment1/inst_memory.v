`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:01 04/01/2019 
// Design Name: 
// Module Name:    inst_memory 
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
`define MAX_PC 8'd13
`define OUTPUT_REG 8'd2

module inst_memory(clk, led);

input clk;

output [7:0]led;
reg [7:0]led;

reg [31:0]inst_memory [0:13];
reg [7:0]data_memory [0:10];
reg [3:0]state = 4'b0;
reg [7:0]regfile [0:31];
reg [5:0]opcode;
reg [5:0]func;
reg [4:0]sr;
reg [4:0]st;
reg [4:0]sd;
reg [7:0]sr_val;
reg [7:0]st_val;
reg [7:0]sd_val;
reg [15:0]immediate;
reg [25:0]jump_val;
reg [31:0]curr_inst;
reg [7:0]PC = 8'd12;


initial begin
	// Sum
	inst_memory[0] = {6'h9, 5'h0, 5'h2, 16'h0};
	inst_memory[1] = {6'h9, 5'h0, 5'h3, 16'h0};
	inst_memory[2] = {6'h0, 5'h3, 5'h1, 5'h4, 5'h0, 6'h2a};
	inst_memory[3] = {6'h4, 5'h0, 5'h4, 16'h8};
	inst_memory[4] = {6'h9, 5'h0, 5'h5, 16'ha};
	// Loop
	inst_memory[5] = {6'h4, 5'h5, 5'h3, 5'h3, 16'h6};
	inst_memory[6] = {6'h23, 5'h3, 5'h6, 16'h0};
	inst_memory[7] = {6'h0, 5'h2, 5'h6, 5'h2, 5'h0, 6'h21};
	inst_memory[8] = {6'h9, 5'h3, 5'h3, 16'h1};
	inst_memory[9] = {6'h0, 5'h3, 5'h1, 5'h4, 5'h0, 6'h2a};
	inst_memory[10] = {6'h5, 5'h0, 5'h4, 16'hfffb};
	// Exit
	inst_memory[11]= {6'h0, 5'h1f, 5'h0, 5'h0, 5'h0, 6'h8};
	inst_memory[12]= {6'h23, 5'h0, 5'h1, 16'ha};
	inst_memory[13]= {6'h3, 26'h0};   
	
end

// Initialise array[10] and n
initial begin
	data_memory[0] = 8'h1;
	data_memory[1] = 8'h1;
	data_memory[2] = 8'h1;
	data_memory[3] = 8'h1;
	data_memory[4] = 8'h1;
	data_memory[5] = 8'h1;
	data_memory[6] = 8'h1;
	data_memory[7] = 8'h1;
	data_memory[8] = 8'h1;
	data_memory[9] = 8'h1;
	data_memory[10] = 8'ha; //n
	
end

initial begin
	regfile[0] = 0;
	regfile[1] = 0;
	regfile[2] = 0;
	regfile[3] = 0;
	regfile[4] = 0;
	regfile[5] = 0;
	regfile[6] = 0;
	regfile[7] = 0;
	regfile[8] = 0;
	regfile[9] = 0;
	regfile[10] = 0;
	regfile[11] = 0;
	regfile[12] = 0;
	regfile[13] = 0;
	regfile[14] = 0;
	regfile[15] = 0;
	regfile[16] = 0;
	regfile[17] = 0;
	regfile[18] = 0;
	regfile[19] = 0;
	regfile[20] = 0;
	regfile[21] = 0;
	regfile[22] = 0;
	regfile[23] = 0;
	regfile[24] = 0;
	regfile[25] = 0;
	regfile[26] = 0;
	regfile[27] = 0;
	regfile[28] = 0;
	regfile[29] = 0;
	regfile[30] = 0;
	regfile[31] = 0;
end
	


always @(posedge clk) begin
	if(state == 0) begin
		curr_inst <= inst_memory[PC];
		state <= 1;
	end
	
	else if(state == 1) begin
		opcode <= curr_inst[31:26];
		if(opcode == 0) begin
			sr <= curr_inst[25:21];
			st <= curr_inst[20:16];
			sd <= curr_inst[15:11];
			func <= curr_inst[5:0];
		end
		else if (opcode == 2 || opcode == 3) begin
			jump_val <= curr_inst[25:0];
		end
		else begin
			sr <= curr_inst[25:21];
			sd <= curr_inst[20:16];
			immediate <= curr_inst[15:0];
		end
		state <= 2;
	end
	
	// Reads the source registers
	else if(state == 2) begin
		if(opcode == 0) begin
			sr_val <= regfile[sr];
			st_val <= regfile[st];
		end
		else if (opcode == 2 || opcode == 3) begin
		end
		else begin
			sr_val <= regfile[sr];
			sd_val <= regfile[sd];
		end
		state <= 3;
	end
	
	else if(state == 3) begin
		if(opcode == 0) begin
			
			if(func == 6'h21) begin // addu inst
				sd_val <= $unsigned(sr_val) + $unsigned(st_val);
			end

			else if(func == 6'h2a) begin // slt inst
				if($signed(sr_val) < $signed(st_val)) sd_val <= 1;
				else sd_val <= 0;
			end

			else if(func == 6'h8) begin // jr inst
				PC <= sr_val;
			end

		end

		else if (opcode == 2 || opcode == 3) begin
		// jal inst
			regfile[31] <= PC+1;
			PC <= jump_val[7:0];
		end

		else begin
			if(opcode == 6'h9) begin //addiu inst
				sd_val <= $unsigned(sr_val) + immediate[7:0];
			end

			else if(opcode == 6'h4) begin // beq inst
				if(sr_val == sd_val) begin
					PC <= PC + immediate[7:0] - 1;
				end
			end

			else if(opcode == 6'h5) begin // bne inst
				if(sr_val != sd_val) begin
					PC <= PC + immediate[7:0] - 1;
				end
			end

			else if(opcode == 6'h23) begin // lw inst
				sd_val <= sr_val + immediate[7:0];
			end
		end
		state <= 4;
	end
	
	else if(state == 4) begin
		if(opcode == 6'h23) begin // lw inst
			sd_val <= data_memory[sd_val];
		end
		state <= 5;
	end
	
	else if(state == 5) begin
		if(sd != 0) begin
			regfile[sd] <= sd_val;
		end
		
		PC <= PC + 1;
		if(PC < `MAX_PC) begin
			state <= 0;
		end
		
		else state <= 6;
	end

	else if(state == 6) begin
		led <= regfile[`OUTPUT_REG];
	end
end

endmodule
